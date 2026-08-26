;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1ce863b7-749e-2439-0779-2ec78167c078")
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
        f = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, n.translationKey)("Heading.Subscriptions", a.TranslationNamespace.Navigation),
            group: i
        },
        p = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, n.translationKey)("Heading.MemoryStores", a.TranslationNamespace.Navigation)
        },
        m = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, n.translationKey)("Heading.DataStores", a.TranslationNamespace.Navigation)
        },
        g = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, n.translationKey)("Heading.HttpService", a.TranslationNamespace.Navigation)
        },
        v = {
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
        b = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, n.translationKey)("Heading.VideoService", a.TranslationNamespace.Navigation)
        },
        N = {
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
        C = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, n.translationKey)("Heading.Performance", a.TranslationNamespace.Navigation)
        },
        w = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, n.translationKey)("Heading.Crashes", a.TranslationNamespace.Analytics)
        },
        x = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, n.translationKey)("Heading.ErrorReport", a.TranslationNamespace.Navigation)
        },
        P = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, n.translationKey)("Heading.Demographics", a.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, n.translationKey)("Heading.Economy", a.TranslationNamespace.Navigation)
        },
        R = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, n.translationKey)("Heading.Funnels", a.TranslationNamespace.Navigation)
        },
        T = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, n.translationKey)("Heading.Explore", a.TranslationNamespace.Navigation)
        },
        I = {
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
        k = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, n.translationKey)("Heading.Acquisition", a.TranslationNamespace.Navigation),
            group: r
        },
        H = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, n.translationKey)("Heading.CustomEvents", a.TranslationNamespace.Navigation)
        },
        L = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, n.translationKey)("Heading.Journeys", a.TranslationNamespace.Navigation)
        },
        j = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, n.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        K = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, n.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        O = {
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
        z = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, n.translationKey)("Heading.Configs", a.TranslationNamespace.Navigation)
        },
        W = {
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
        U = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, n.translationKey)("Heading.ConfigureAlert", a.TranslationNamespace.Navigation)
        },
        G = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, n.translationKey)("Heading.CustomMatchmaking", a.TranslationNamespace.Matchmaking)
        },
        q = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, n.translationKey)("Heading.Commerce", a.TranslationNamespace.Navigation),
            group: i
        },
        X = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, n.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        Z = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, n.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        J = {
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
        eo = [k, M, D, A, i, l, s, c, u, d, f, p, m, g, v, y, h, b, ei, N, E, C, w, x, P, S, R, L, j, K, O, T, I, H, X, Z, J, F, _, z, W, G, q, Q, ee, r, o, Y, $, et, en, ea, V, U, B, er];
    t.s(["analyticsAgentNavigationItem", 0, Z, "analyticsAiChatNavigationItem", 0, J, "analyticsAlertConfifurationNavigationItem", 0, U, "analyticsAlertCreationNavigationItem", 0, V, "analyticsAlertsNavigationItem", 0, B, "analyticsAnalyticsHomeNavigationItem", 0, r, "analyticsAssistantNavigationItem", 0, X, "analyticsAudienceNavigationItem", 0, P, "analyticsAvatarCreationTokensNavigationItem", 0, er, "analyticsBountyPayoutsNavigationItem", 0, E, "analyticsCommerceNavigationItem", 0, q, "analyticsConfigsHistoryNavigationItem", 0, _, "analyticsConfigsNavigationItem", 0, z, "analyticsCrashesNavigationItem", 0, w, "analyticsCreationOverviewNavigationItem", 0, ee, "analyticsCustomDashboardsManageNavigationItem", 0, I, "analyticsCustomEventsNavigationItem", 0, H, "analyticsDataStoresNavigationItem", 0, m, "analyticsEngagementNavigationItem", 0, D, "analyticsErrorReportNavigationItem", 0, x, "analyticsExperienceCreatorRewardsNavigationItem", 0, N, "analyticsExperienceSubscriptionsNavigationItem", 0, ea, "analyticsExperimentsCreateNavigationItem", 0, Y, "analyticsExperimentsNavigationItem", 0, o, "analyticsExploreNavigationItem", 0, T, "analyticsFeedbackNavigationItem", 0, F, "analyticsGenerativeAINavigationItem", 0, ei, "analyticsHttpServiceNavigationItem", 0, g, "analyticsImmersiveAdsNavigationItem", 0, d, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, c, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, l, "analyticsItemMonetizationPassesNavigationItem", 0, s, "analyticsMatchmakingNavigationItem", 0, G, "analyticsMemoryStoresNavigationItem", 0, p, "analyticsMessagingServiceNavigationItem", 0, v, "analyticsMonetizationNavigationItem", 0, i, "analyticsNotificationsNavigationItem", 0, en, "analyticsPerformanceNavigationItem", 0, C, "analyticsRecommendationServiceNavigationItem", 0, $, "analyticsRecommendedEventsEconomyNavigationItem", 0, S, "analyticsRecommendedEventsFunnelsNavigationItem", 0, R, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, j, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, K, "analyticsRecommendedEventsJourneyNavigationItem", 0, L, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, O, "analyticsRetentionNavigationItem", 0, A, "analyticsSafetyNavigationItem", 0, Q, "analyticsSpeechToTextNavigationItem", 0, y, "analyticsSubscriptionsNavigationItem", 0, f, "analyticsTextToSpeechNavigationItem", 0, h, "analyticsUserAcquisitionNavigationItem", 0, M, "analyticsVideoServiceNavigationItem", 0, b, "getAnalyticsNavigationItemFromPath", 0, function(t) {
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
        } = t, s = (0, i.useRouter)(), [c, u] = (0, a.useState)(!0), [f, p] = (0, a.useState)(null), [m, g] = (0, a.useState)(null), [v, y] = (0, a.useState)(!1), h = (0, a.useRef)(0), b = (0, a.useCallback)(async function(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = h.current += 1,
                i = d.getConfiguration(t),
                r = d.getGameDetail(t, n),
                [o, l] = await Promise.allSettled([i, r]);
            a === h.current && ("fulfilled" === o.status ? p(o.value) : p(null), "fulfilled" === l.status ? (y(!1), g(l.value)) : ("rejected" === l.status ? y(!0) : y(!1), g(null)), u(!1))
        }, []), N = (0, a.useMemo)(() => {
            let {
                id: t
            } = s.query;
            return r || ("string" == typeof t ? parseInt(t, 10) : void 0)
        }, [r, s.query]), E = (0, a.useCallback)(() => N ? b(N, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [N, b]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== N && !Number.isNaN(N) && N > 0) return void b(N);
                h.current += 1, p(null), g(null), y(!1), u(!1)
            } catch (t) {
                console.warn("Could not fetch game details for universeId ".concat(N))
            }
        }, [N, b]);
        let C = (0, a.useMemo)(() => ({
            isLoadingGame: c,
            canConfigure: f,
            gameDetails: m,
            isErrorLoadingGame: v,
            refreshGameDetails: E
        }), [c, f, m, v, E]);
        return (0, n.jsx)(l.Provider, {
            value: C,
            children: o
        })
    }, "useCurrentGame", 0, function() {
        let t = (0, a.useContext)(l);
        if (null === t) throw Error("useCurrentGame must be used within a GameProvider");
        return t
    }], 114209)
}, 23342, 78892, t => {
    "use strict";
    var n = t.i(416340);

    function a(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function i() {
        for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
        return t => {
            let i = !1,
                r = n.map(n => {
                    let r = a(n, t);
                    return i || "function" != typeof r || (i = !0), r
                });
            if (i) return () => {
                for (let t = 0; t < r.length; t++) {
                    let i = r[t];
                    "function" == typeof i ? i() : a(n[t], null)
                }
            }
        }
    }
    t.s(["composeRefs", 0, i, "useComposedRefs", 0, function() {
        for (var t = arguments.length, a = Array(t), r = 0; r < t; r++) a[r] = arguments[r];
        return n.useCallback(i(...a), a)
    }], 78892);
    var r = t.i(221628),
        o = Symbol.for("react.lazy"),
        l = n[" use ".trim().toString()];

    function s(t) {
        var n;
        return null != t && "object" == typeof t && "$$typeof" in t && t.$$typeof === o && "_payload" in t && "object" == typeof(n = t._payload) && null !== n && "then" in n
    }

    function c(t) {
        var a;
        let o, c = (a = t, (o = n.forwardRef((t, a) => {
                let {
                    children: r,
                    ...o
                } = t;
                if (s(r) && "function" == typeof l && (r = l(r._payload)), n.isValidElement(r)) {
                    var c, u, d;
                    let t, l, s = (l = (t = null == (u = Object.getOwnPropertyDescriptor((c = r).props, "ref")) ? void 0 : u.get) && "isReactWarning" in t && t.isReactWarning) ? c.ref : (l = (t = null == (d = Object.getOwnPropertyDescriptor(c, "ref")) ? void 0 : d.get) && "isReactWarning" in t && t.isReactWarning) ? c.props.ref : c.props.ref || c.ref,
                        f = function(t, n) {
                            let a = {
                                ...n
                            };
                            for (let i in n) {
                                let r = t[i],
                                    o = n[i];
                                /^on[A-Z]/.test(i) ? r && o ? a[i] = function() {
                                    for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
                                    let i = o(...n);
                                    return r(...n), i
                                } : r && (a[i] = r) : "style" === i ? a[i] = {
                                    ...r,
                                    ...o
                                } : "className" === i && (a[i] = [r, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...a
                            }
                        }(o, r.props);
                    return r.type !== n.Fragment && (f.ref = a ? i(a, s) : s), n.cloneElement(r, f)
                }
                return n.Children.count(r) > 1 ? n.Children.only(null) : null
            })).displayName = "".concat(a, ".SlotClone"), o),
            u = n.forwardRef((t, a) => {
                let {
                    children: i,
                    ...o
                } = t;
                s(i) && "function" == typeof l && (i = l(i._payload));
                let u = n.Children.toArray(i),
                    d = u.find(f);
                if (d) {
                    let t = d.props.children,
                        i = u.map(a => a !== d ? a : n.Children.count(t) > 1 ? n.Children.only(null) : n.isValidElement(t) ? t.props.children : null);
                    return (0, r.jsx)(c, {
                        ...o,
                        ref: a,
                        children: n.isValidElement(t) ? n.cloneElement(t, void 0, i) : null
                    })
                }
                return (0, r.jsx)(c, {
                    ...o,
                    ref: a,
                    children: i
                })
            });
        return u.displayName = "".concat(t, ".Slot"), u
    }
    var u = c("Slot"),
        d = Symbol("radix.slottable");

    function f(t) {
        return n.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === d
    }
    t.s(["Slot", 0, u, "createSlot", 0, c], 23342)
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

    function f(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === d
    }
    var p = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
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
                } = t, l = a.Children.toArray(i), c = l.find(f);
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
            p = a.forwardRef((t, a) => {
                let {
                    asChild: i,
                    ...o
                } = t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, r.jsx)(i ? d : n, {
                    ...o,
                    ref: a
                })
            });
        return p.displayName = "Primitive.".concat(n), {
            ...t,
            [n]: p
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
    var g, v, y = "dismissableLayer.update",
        h = a.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        b = a.forwardRef((t, n) => {
            var i, o;
            let {
                disableOutsidePointerEvents: s = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: f,
                onInteractOutside: g,
                onDismiss: b,
                ...C
            } = t, w = a.useContext(h), [x, P] = a.useState(null), S = null != (i = null == x ? void 0 : x.ownerDocument) ? i : null == (o = globalThis) ? void 0 : o.document, [, R] = a.useState({}), T = u(n, t => P(t)), I = Array.from(w.layers), [A] = [...w.layersWithOutsidePointerEventsDisabled].slice(-1), D = I.indexOf(A), M = x ? I.indexOf(x) : -1, k = w.layersWithOutsidePointerEventsDisabled.size > 0, H = M >= D, L = function(t) {
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
                    a = [...w.branches].some(t => t.contains(n));
                H && !a && (null == d || d(t), null == g || g(t), t.defaultPrevented || null == b || b())
            }, S), j = function(t) {
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
                [...w.branches].some(t => t.contains(n)) || (null == f || f(t), null == g || g(t), t.defaultPrevented || null == b || b())
            }, S);
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
                M === w.layers.size - 1 && (null == c || c(t), !t.defaultPrevented && b && (t.preventDefault(), b()))
            }, S), a.useEffect(() => {
                if (x) return s && (0 === w.layersWithOutsidePointerEventsDisabled.size && (v = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), w.layersWithOutsidePointerEventsDisabled.add(x)), w.layers.add(x), N(), () => {
                    s && 1 === w.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = v)
                }
            }, [x, S, s, w]), a.useEffect(() => () => {
                x && (w.layers.delete(x), w.layersWithOutsidePointerEventsDisabled.delete(x), N())
            }, [x, w]), a.useEffect(() => {
                let t = () => R({});
                return document.addEventListener(y, t), () => document.removeEventListener(y, t)
            }, []), (0, r.jsx)(p.div, {
                ...C,
                ref: T,
                style: {
                    pointerEvents: k ? H ? "auto" : "none" : void 0,
                    ...t.style
                },
                onFocusCapture: l(t.onFocusCapture, j.onFocusCapture),
                onBlurCapture: l(t.onBlurCapture, j.onBlurCapture),
                onPointerDownCapture: l(t.onPointerDownCapture, L.onPointerDownCapture)
            })
        });

    function N() {
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
    b.displayName = "DismissableLayer", a.forwardRef((t, n) => {
        let i = a.useContext(h),
            o = a.useRef(null),
            l = u(n, o);
        return a.useEffect(() => {
            let t = o.current;
            if (t) return i.branches.add(t), () => {
                i.branches.delete(t)
            }
        }, [i.branches]), (0, r.jsx)(p.div, {
            ...t,
            ref: l
        })
    }).displayName = "DismissableLayerBranch";
    var C = 0;

    function w() {
        let t = document.createElement("span");
        return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
    }

    function x(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function P() {
        for (var t = arguments.length, n = Array(t), a = 0; a < t; a++) n[a] = arguments[a];
        return t => {
            let a = !1,
                i = n.map(n => {
                    let i = x(n, t);
                    return a || "function" != typeof i || (a = !0), i
                });
            if (a) return () => {
                for (let t = 0; t < i.length; t++) {
                    let a = i[t];
                    "function" == typeof a ? a() : x(n[t], null)
                }
            }
        }
    }
    var S = Symbol("radix.slottable");

    function R(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === S
    }
    var T = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
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
                    return i.type !== a.Fragment && (c.ref = n ? P(n, s) : s), a.cloneElement(i, c)
                }
                return a.Children.count(i) > 1 ? a.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), s = l, (c = a.forwardRef((t, n) => {
                let {
                    children: i,
                    ...o
                } = t, l = a.Children.toArray(i), c = l.find(R);
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

    function I(t) {
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
        k = a.forwardRef((t, n) => {
            let {
                loop: i = !1,
                trapped: o = !1,
                onMountAutoFocus: l,
                onUnmountAutoFocus: s,
                ...c
            } = t, [u, d] = a.useState(null), f = I(l), p = I(s), m = a.useRef(null), g = function() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return a.useCallback(P(...n), n)
            }(n, t => d(t)), v = a.useRef({
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
                            if (v.paused || !u) return;
                            let n = t.target;
                            u.contains(n) ? m.current = n : j(m.current, {
                                select: !0
                            })
                        },
                        n = function(t) {
                            if (v.paused || !u) return;
                            let n = t.relatedTarget;
                            null !== n && (u.contains(n) || j(m.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                    let a = new MutationObserver(function(t) {
                        if (document.activeElement === document.body)
                            for (let n of t) n.removedNodes.length > 0 && j(u)
                    });
                    return u && a.observe(u, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", t), document.removeEventListener("focusout", n), a.disconnect()
                    }
                }
            }, [o, u, v.paused]), a.useEffect(() => {
                if (u) {
                    K.add(v);
                    let t = document.activeElement;
                    if (!u.contains(t)) {
                        let n = new CustomEvent(A, M);
                        u.addEventListener(A, f), u.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                            let {
                                select: n = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, a = document.activeElement;
                            for (let i of t)
                                if (j(i, {
                                        select: n
                                    }), document.activeElement !== a) return
                        }(H(u).filter(t => "A" !== t.tagName), {
                            select: !0
                        }), document.activeElement === t && j(u))
                    }
                    return () => {
                        u.removeEventListener(A, f), setTimeout(() => {
                            let n = new CustomEvent(D, M);
                            u.addEventListener(D, p), u.dispatchEvent(n), n.defaultPrevented || j(null != t ? t : document.body, {
                                select: !0
                            }), u.removeEventListener(D, p), K.remove(v)
                        }, 0)
                    }
                }
            }, [u, f, p, v]);
            let y = a.useCallback(t => {
                if (!i && !o || v.paused) return;
                let n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                    a = document.activeElement;
                if (n && a) {
                    let n, r = t.currentTarget,
                        [o, l] = [L(n = H(r), r), L(n.reverse(), r)];
                    o && l ? t.shiftKey || a !== l ? t.shiftKey && a === o && (t.preventDefault(), i && j(l, {
                        select: !0
                    })) : (t.preventDefault(), i && j(o, {
                        select: !0
                    })) : a === r && t.preventDefault()
                }
            }, [i, o, v.paused]);
            return (0, r.jsx)(T.div, {
                tabIndex: -1,
                ...c,
                ref: g,
                onKeyDown: y
            })
        });

    function H(t) {
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

    function L(t, n) {
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

    function j(t) {
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
    k.displayName = "FocusScope";
    var K = (n = [], {
        add(t) {
            let a = n[0];
            t !== a && (null == a || a.pause()), (n = O(n, t)).unshift(t)
        },
        remove(t) {
            var a;
            null == (a = (n = O(n, t))[0]) || a.resume()
        }
    });

    function O(t, n) {
        let a = [...t],
            i = a.indexOf(n);
        return -1 !== i && a.splice(i, 1), a
    }

    function F(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }
    var _ = Symbol("radix.slottable");

    function z(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === _
    }
    var W = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
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
                    } = t, l = a.Children.toArray(i), c = l.find(z);
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
        B = (null == (g = globalThis) ? void 0 : g.document) ? a.useLayoutEffect : () => {},
        V = a.forwardRef((t, n) => {
            var o, l;
            let {
                container: s,
                ...c
            } = t, [u, d] = a.useState(!1);
            B(() => d(!0), []);
            let f = s || u && (null == (l = globalThis) || null == (o = l.document) ? void 0 : o.body);
            return f ? i.default.createPortal((0, r.jsx)(W.div, {
                ...c,
                ref: n
            }), f) : null
        });
    V.displayName = "Portal";
    var U = new WeakMap,
        G = new WeakMap,
        q = {},
        X = 0,
        Z = function(t) {
            return t && (t.host || Z(t.parentNode))
        },
        J = function(t, n, a, i) {
            var r = (Array.isArray(t) ? t : [t]).map(function(t) {
                if (n.contains(t)) return t;
                var a = Z(t);
                return a && n.contains(a) ? a : (console.error("aria-hidden", t, "in not contained inside", n, ". Doing nothing"), null)
            }).filter(function(t) {
                return !!t
            });
            q[a] || (q[a] = new WeakMap);
            var o = q[a],
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
                            c = (U.get(t) || 0) + 1,
                            u = (o.get(t) || 0) + 1;
                        U.set(t, c), o.set(t, u), l.push(t), 1 === c && r && G.set(t, !0), 1 === u && t.setAttribute(a, "true"), r || t.setAttribute(i, "true")
                    } catch (n) {
                        console.error("aria-hidden: cannot operate on ", t, n)
                    }
                })
            };
            return d(n), s.clear(), X++,
                function() {
                    l.forEach(function(t) {
                        var n = U.get(t) - 1,
                            r = o.get(t) - 1;
                        U.set(t, n), o.set(t, r), n || (G.has(t) || t.removeAttribute(i), G.delete(t)), r || t.removeAttribute(a)
                    }), --X || (U = new WeakMap, U = new WeakMap, G = new WeakMap, q = {})
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
    var ea = (void 0 === eb && (eb = {}), (void 0 === eN && (eN = function(t) {
            return t
        }), eE = [], eC = !1, ew = {
            read: function() {
                if (eC) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return eE.length ? eE[eE.length - 1] : null
            },
            useMedium: function(t) {
                var n = eN(t, eC);
                return eE.push(n),
                    function() {
                        eE = eE.filter(function(t) {
                            return t !== n
                        })
                    }
            },
            assignSyncMedium: function(t) {
                for (eC = !0; eE.length;) {
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
                eC = !0;
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
        }, eb), ew),
        ei = function() {},
        er = a.forwardRef(function(t, n) {
            var i, r, l, s, c = a.useRef(null),
                u = a.useState({
                    onScrollCapture: ei,
                    onWheelCapture: ei,
                    onTouchMoveCapture: ei
                }),
                d = u[0],
                f = u[1],
                p = t.forwardProps,
                m = t.children,
                g = t.className,
                v = t.removeScrollBar,
                y = t.enabled,
                h = t.shards,
                b = t.sideCar,
                N = t.noIsolation,
                E = t.inert,
                C = t.allowPinchZoom,
                w = t.as,
                x = t.gapMode,
                P = (0, o._)(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                S = (i = [c, n], r = function(t) {
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
                R = (0, o.a)((0, o.a)({}, P), d);
            return a.createElement(a.Fragment, null, y && a.createElement(b, {
                sideCar: ea,
                removeScrollBar: v,
                shards: h,
                noIsolation: N,
                inert: E,
                setCallbacks: f,
                allowPinchZoom: !!C,
                lockRef: c,
                gapMode: x
            }), p ? a.cloneElement(a.Children.only(m), (0, o.a)((0, o.a)({}, R), {
                ref: S
            })) : a.createElement(void 0 === w ? "div" : w, (0, o.a)({}, R, {
                className: g,
                ref: S
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
        ef = es(),
        ep = "data-scroll-locked",
        em = function(t, n, a, i) {
            var r = t.left,
                o = t.top,
                l = t.right,
                s = t.gap;
            return void 0 === a && (a = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(i, ";\n   padding-right: ").concat(s, "px ").concat(i, ";\n  }\n  body[").concat(ep, "] {\n    overflow: hidden ").concat(i, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(i, ";"), "margin" === a && "\n    padding-left: ".concat(r, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(s, "px ").concat(i, ";\n    "), "padding" === a && "padding-right: ".concat(s, "px ").concat(i, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(Y, " {\n    right: ").concat(s, "px ").concat(i, ";\n  }\n  \n  .").concat($, " {\n    margin-right: ").concat(s, "px ").concat(i, ";\n  }\n  \n  .").concat(Y, " .").concat(Y, " {\n    right: 0 ").concat(i, ";\n  }\n  \n  .").concat($, " .").concat($, " {\n    margin-right: 0 ").concat(i, ";\n  }\n  \n  body[").concat(ep, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(s, "px;\n  }\n")
        },
        eg = function() {
            var t = parseInt(document.body.getAttribute(ep) || "0", 10);
            return isFinite(t) ? t : 0
        },
        ev = function(t) {
            var n = t.noRelative,
                i = t.noImportant,
                r = t.gapMode,
                o = void 0 === r ? "margin" : r;
            a.useEffect(function() {
                return document.body.setAttribute(ep, (eg() + 1).toString()),
                    function() {
                        var t = eg() - 1;
                        t <= 0 ? document.body.removeAttribute(ep) : document.body.setAttribute(ep, t.toString())
                    }
            }, []);
            var l = a.useMemo(function() {
                return ed(o)
            }, [o]);
            return a.createElement(ef, {
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
    var eb, eN, eE, eC, ew, ex, eP = !!ey && {
            passive: !1
        },
        eS = function(t, n) {
            if (!(t instanceof Element)) return !1;
            var a = window.getComputedStyle(t);
            return "hidden" !== a[n] && (a.overflowY !== a.overflowX || "TEXTAREA" === t.tagName || "visible" !== a[n])
        },
        eR = function(t, n) {
            var a = n.ownerDocument,
                i = n;
            do {
                if ("u" > typeof ShadowRoot && i instanceof ShadowRoot && (i = i.host), eT(t, i)) {
                    var r = eI(t, i);
                    if (r[1] > r[2]) return !0
                }
                i = i.parentNode
            } while (i && i !== a.body) return !1
        },
        eT = function(t, n) {
            return "v" === t ? eS(n, "overflowY") : eS(n, "overflowX")
        },
        eI = function(t, n) {
            return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
        },
        eA = function(t, n, a, i, r) {
            var o, l = (o = window.getComputedStyle(n).direction, "h" === t && "rtl" === o ? -1 : 1),
                s = l * i,
                c = a.target,
                u = n.contains(c),
                d = !1,
                f = s > 0,
                p = 0,
                m = 0;
            do {
                var g = eI(t, c),
                    v = g[0],
                    y = g[1] - g[2] - l * v;
                (v || y) && eT(t, c) && (p += y, m += v), c = c instanceof ShadowRoot ? c.host : c.parentNode
            } while (!u && c !== document.body || u && (n.contains(c) || n === c)) return (f && (r && 1 > Math.abs(p) || !r && s > p) || !f && (r && 1 > Math.abs(m) || !r && -s > m)) && (d = !0), d
        },
        eD = function(t) {
            return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
        },
        eM = function(t) {
            return [t.deltaX, t.deltaY]
        },
        ek = function(t) {
            return t && "current" in t ? t.current : t
        },
        eH = 0,
        eL = [],
        ej = (ex = function(t) {
            var n = a.useRef([]),
                i = a.useRef([0, 0]),
                r = a.useRef(),
                l = a.useState(eH++)[0],
                s = a.useState(es)[0],
                c = a.useRef(t);
            a.useEffect(function() {
                c.current = t
            }, [t]), a.useEffect(function() {
                if (t.inert) {
                    document.body.classList.add("block-interactivity-".concat(l));
                    var n = (0, o.b)([t.lockRef.current], (t.shards || []).map(ek), !0).filter(Boolean);
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
                        f = Math.abs(s) > Math.abs(u) ? "h" : "v";
                    if ("touches" in t && "h" === f && "range" === d.type) return !1;
                    var p = eR(f, d);
                    if (!p) return !0;
                    if (p ? a = f : (a = "v" === f ? "h" : "v", p = eR(f, d)), !p) return !1;
                    if (!r.current && "changedTouches" in t && (s || u) && (r.current = a), !a) return !0;
                    var m = r.current || a;
                    return eA(m, n, t, "h" === m ? s : u, !0)
                }, []),
                d = a.useCallback(function(t) {
                    if (eL.length && eL[eL.length - 1] === s) {
                        var a = "deltaY" in t ? eM(t) : eD(t),
                            i = n.current.filter(function(n) {
                                var i;
                                return n.name === t.type && (n.target === t.target || t.target === n.shadowParent) && (i = n.delta, i[0] === a[0] && i[1] === a[1])
                            })[0];
                        if (i && i.should) t.cancelable && t.preventDefault();
                        else if (!i) {
                            var r = (c.current.shards || []).map(ek).filter(Boolean).filter(function(n) {
                                return n.contains(t.target)
                            });
                            (r.length > 0 ? u(t, r[0]) : !c.current.noIsolation) && t.cancelable && t.preventDefault()
                        }
                    }
                }, []),
                f = a.useCallback(function(t, a, i, r) {
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
                p = a.useCallback(function(t) {
                    i.current = eD(t), r.current = void 0
                }, []),
                m = a.useCallback(function(n) {
                    f(n.type, eM(n), n.target, u(n, t.lockRef.current))
                }, []),
                g = a.useCallback(function(n) {
                    f(n.type, eD(n), n.target, u(n, t.lockRef.current))
                }, []);
            a.useEffect(function() {
                return eL.push(s), t.setCallbacks({
                        onScrollCapture: m,
                        onWheelCapture: m,
                        onTouchMoveCapture: g
                    }), document.addEventListener("wheel", d, eP), document.addEventListener("touchmove", d, eP), document.addEventListener("touchstart", p, eP),
                    function() {
                        eL = eL.filter(function(t) {
                            return t !== s
                        }), document.removeEventListener("wheel", d, eP), document.removeEventListener("touchmove", d, eP), document.removeEventListener("touchstart", p, eP)
                    }
            }, []);
            var v = t.removeScrollBar,
                y = t.inert;
            return a.createElement(a.Fragment, null, y ? a.createElement(s, {
                styles: "\n  .block-interactivity-".concat(l, " {pointer-events: none;}\n  .allow-interactivity-").concat(l, " {pointer-events: all;}\n")
            }) : null, v ? a.createElement(ev, {
                gapMode: t.gapMode
            }) : null)
        }, ea.useMedium(ex), en),
        eK = a.forwardRef(function(t, n) {
            return a.createElement(er, (0, o.a)({}, t, {
                ref: n,
                sideCar: ej
            }))
        });
    eK.classNames = er.classNames, t.s(["D", 0, b, "F", 0, k, "P", 0, V, "R", 0, eK, "h", 0, function(t, n, a) {
        void 0 === a && (a = "data-aria-hidden");
        var i = Array.from(Array.isArray(t) ? t : [t]),
            r = n || ("u" < typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
        return r ? (i.push.apply(i, Array.from(r.querySelectorAll("[aria-live]"))), J(i, r, a, "aria-hidden")) : function() {
            return null
        }
    }, "u", 0, function() {
        a.useEffect(() => {
            var t, n;
            let a = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", null != (t = a[0]) ? t : w()), document.body.insertAdjacentElement("beforeend", null != (n = a[1]) ? n : w()), C++, () => {
                1 === C && document.querySelectorAll("[data-radix-focus-guard]").forEach(t => t.remove()), C--
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
            className: f
        } = t, p = (0, n._)(t, ["variant", "size", "isCircular", "className"]);
        return i.default.createElement("button", Object.assign({
            type: "button",
            className: (0, a.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", o.interactable, s[c], l[u], d && "radius-circle", f)
        }, p), i.default.createElement(o.StateLayer, null), i.default.createElement(r.Icon, {
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
}, 608972, t => {
    "use strict";
    var n = t.i(253923),
        a = t.i(106077),
        i = t.i(409653),
        r = t.i(605836),
        o = t.i(197649),
        l = t.i(416340),
        s = t.i(23342);
    let c = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        u = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        d = {
            Emphasis: ["bg-action-emphasis", "content-action-emphasis"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-soft-emphasis", "content-action-soft-emphasis"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-alert", "content-action-alert"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        f = {
            Emphasis: ["bg-action-standard", "content-action-standard"],
            Standard: ["bg-action-standard", "content-action-standard"],
            SoftEmphasis: ["bg-action-standard", "content-action-standard"],
            Utility: ["bg-action-subtle", "content-action-standard"],
            Link: ["bg-action-link", "content-system-emphasis"],
            Alert: ["bg-action-standard", "content-action-standard"],
            ActionUtility: ["bg-action-subtle", "content-action-standard"]
        },
        p = (0, l.forwardRef)((t, p) => {
            let {
                children: m,
                className: g,
                style: v,
                isDisabled: y = !1,
                isLoading: h = !1,
                icon: b,
                size: N = "Large",
                variant: E = "Emphasis",
                asChild: C,
                ...w
            } = t, x = (0, o.default)("foundation-web-button", y ? a.disabledOpacity : [n.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", u[N], y ? f[E] : d[E], g), P = {
                textDecoration: "none",
                ...v
            }, S = t => l.default.createElement(l.default.Fragment, null, l.default.createElement(n.StateLayer, null), h && l.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute flex"
            }, l.default.createElement(i.LoadingSpinner, {
                width: c[N],
                height: c[N]
            })), l.default.createElement("span", {
                className: (0, o.default)("flex items-center min-width-0", "Large" === N || "Medium" === N ? "gap-small" : "gap-xsmall", h && "invisible")
            }, b && l.default.createElement(r.Icon, {
                name: b,
                size: N
            }), l.default.createElement("span", {
                className: "padding-y-xsmall text-truncate-end text-no-wrap"
            }, t)));
            if (C) {
                let {
                    as: t,
                    ...n
                } = w, a = l.default.Children.only(m);
                return l.default.createElement(s.Slot, {
                    ref: p,
                    ...n,
                    className: x,
                    style: P,
                    "aria-disabled": y || void 0
                }, l.default.cloneElement(a, {}, S(a.props.children)))
            }
            if ("a" === w.as) {
                let {
                    as: t,
                    href: n,
                    ...a
                } = w;
                return l.default.createElement("a", {
                    ref: p,
                    ...a,
                    "aria-disabled": y,
                    href: y ? void 0 : n,
                    className: x,
                    style: P
                }, S(m))
            }
            let {
                as: R,
                ...T
            } = w;
            return l.default.createElement("button", {
                ref: p,
                type: "button",
                ...T,
                disabled: y,
                className: x,
                style: P
            }, S(m))
        });
    t.s(["Button", 0, p])
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
        f = t => {
            let {
                open: n,
                onOpenChange: a,
                children: o,
                size: s,
                type: c = "Default",
                isModal: u,
                hasCloseAffordance: d,
                closeLabel: f,
                hasMarginTop: p = !0,
                hasMarginBottom: m = !0,
                hasDescription: g = !1,
                experimentalDisablePointerEventsStylingOnBody: v = !1
            } = t, y = (0, i.useMemo)(() => ({
                size: s,
                isModal: u,
                type: c,
                hasCloseAffordance: d,
                closeLabel: f,
                hasMarginTop: p,
                hasMarginBottom: m,
                hasDescription: g
            }), [s, u, c, d, f, p, m, g]);
            return (0, i.useEffect)(() => {
                v && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [v, n]), i.default.createElement(l.Provider, {
                value: y
            }, i.default.createElement(r.Root, {
                open: n,
                onOpenChange: a
            }, o))
        };
    f.displayName = "Dialog";
    let p = t => {
        let {
            children: o,
            className: l,
            style: c,
            overlayClassName: u,
            overlayStyle: d,
            onOpenAutoFocus: f,
            ...p
        } = t, {
            size: m,
            isModal: g,
            hasCloseAffordance: v,
            closeLabel: y,
            hasDescription: h
        } = s(), b = (0, a.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", g && "bg-common-backdrop", u), N = (0, a.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", l);
        return i.default.createElement(r.Portal, null, i.default.createElement(r.Overlay, {
            className: b,
            style: d
        }, i.default.createElement(r.Content, {
            className: N,
            "data-size": m,
            style: c,
            onOpenAutoFocus: f,
            ...!h && {
                "aria-describedby": void 0
            },
            ...p
        }, v && i.default.createElement("div", {
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
    p.displayName = "DialogContent";
    let m = t => {
        let {
            children: n,
            className: r,
            ...o
        } = t, {
            size: l,
            hasMarginTop: f,
            hasMarginBottom: p
        } = s(), m = (0, a.default)(c[l], f && u[l], p && d[l], r);
        return i.default.createElement("div", {
            className: m,
            ...o
        }, n)
    };
    m.displayName = "DialogBody";
    let g = t => {
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
    g.displayName = "DialogTitle";
    let v = t => {
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
    v.displayName = "DialogFooter", t.s(["Dialog", 0, f, "DialogBody", 0, m, "DialogContent", 0, p, "DialogFooter", 0, v, "DialogTitle", 0, g])
}, 605836, t => {
    "use strict";
    var n = t.i(197649),
        a = t.i(416340);
    let i = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        r = a.default.forwardRef((t, r) => {
            let {
                name: o,
                size: l = "Medium",
                className: s,
                children: c,
                ...u
            } = t;
            return a.default.createElement("span", {
                ref: r,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, n.default)("grow-0 shrink-0 basis-auto icon", o, i[l], s),
                ...u
            })
        });
    r.displayName = "Icon", t.s(["Icon", 0, r])
}, 356407, 425353, 199512, t => {
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
            ...f
        } = t;
        return r.default.createElement("button", {
            type: "button",
            className: (0, i.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", n.interactable, l[s], o[c], u && "radius-circle", d),
            ...f
        }, r.default.createElement(n.StateLayer, null), r.default.createElement(a.Icon, {
            name: "icon-regular-x",
            size: c
        }))
    }], 356407);
    var s = t.i(19655),
        c = t.i(78892),
        u = t.i(608652),
        d = t.i(40266),
        f = t.i(428156),
        p = t.i(598943),
        m = t.i(44265),
        g = t.i(763960),
        v = t.i(226972),
        y = t.i(594278),
        h = t.i(793808),
        b = t.i(813593),
        N = t.i(3300),
        E = t.i(699704),
        C = t.i(221628),
        w = "Dialog",
        [x, P] = (0, u.createContextScope)(w),
        [S, R] = x(w),
        T = t => {
            let {
                __scopeDialog: n,
                children: a,
                open: i,
                defaultOpen: o,
                onOpenChange: l,
                modal: s = !0
            } = t, c = r.useRef(null), u = r.useRef(null), [p = !1, m] = (0, f.useControllableState)({
                prop: i,
                defaultProp: o,
                onChange: l
            });
            return (0, C.jsx)(S, {
                scope: n,
                triggerRef: c,
                contentRef: u,
                contentId: (0, d.useId)(),
                titleId: (0, d.useId)(),
                descriptionId: (0, d.useId)(),
                open: p,
                onOpenChange: m,
                onOpenToggle: r.useCallback(() => m(t => !t), [m]),
                modal: s,
                children: a
            })
        };
    T.displayName = w;
    var I = "DialogTrigger",
        A = r.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = R(I, a), o = (0, c.useComposedRefs)(n, r.triggerRef);
            return (0, C.jsx)(y.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": r.open,
                "aria-controls": r.contentId,
                "data-state": J(r.open),
                ...i,
                ref: o,
                onClick: (0, s.composeEventHandlers)(t.onClick, r.onOpenToggle)
            })
        });
    A.displayName = I;
    var D = "DialogPortal",
        [M, k] = x(D, {
            forceMount: void 0
        }),
        H = t => {
            let {
                __scopeDialog: n,
                forceMount: a,
                children: i,
                container: o
            } = t, l = R(D, n);
            return (0, C.jsx)(M, {
                scope: n,
                forceMount: a,
                children: r.Children.map(i, t => (0, C.jsx)(v.Presence, {
                    present: a || l.open,
                    children: (0, C.jsx)(g.Portal, {
                        asChild: !0,
                        container: o,
                        children: t
                    })
                }))
            })
        };
    H.displayName = D;
    var L = "DialogOverlay",
        j = r.forwardRef((t, n) => {
            let a = k(L, t.__scopeDialog),
                {
                    forceMount: i = a.forceMount,
                    ...r
                } = t,
                o = R(L, t.__scopeDialog);
            return o.modal ? (0, C.jsx)(v.Presence, {
                present: i || o.open,
                children: (0, C.jsx)(O, {
                    ...r,
                    ref: n
                })
            }) : null
        });
    j.displayName = L;
    var K = (0, E.createSlot)("DialogOverlay.RemoveScroll"),
        O = r.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = R(L, a);
            return (0, C.jsx)(b.RemoveScroll, {
                as: K,
                allowPinchZoom: !0,
                shards: [r.contentRef],
                children: (0, C.jsx)(y.Primitive.div, {
                    "data-state": J(r.open),
                    ...i,
                    ref: n,
                    style: {
                        pointerEvents: "auto",
                        ...i.style
                    }
                })
            })
        }),
        F = "DialogContent",
        _ = r.forwardRef((t, n) => {
            let a = k(F, t.__scopeDialog),
                {
                    forceMount: i = a.forceMount,
                    ...r
                } = t,
                o = R(F, t.__scopeDialog);
            return (0, C.jsx)(v.Presence, {
                present: i || o.open,
                children: o.modal ? (0, C.jsx)(z, {
                    ...r,
                    ref: n
                }) : (0, C.jsx)(W, {
                    ...r,
                    ref: n
                })
            })
        });
    _.displayName = F;
    var z = r.forwardRef((t, n) => {
            let a = R(F, t.__scopeDialog),
                i = r.useRef(null),
                o = (0, c.useComposedRefs)(n, a.contentRef, i);
            return r.useEffect(() => {
                let t = i.current;
                if (t) return (0, N.hideOthers)(t)
            }, []), (0, C.jsx)(B, {
                ...t,
                ref: o,
                trapFocus: a.open,
                disableOutsidePointerEvents: !0,
                onCloseAutoFocus: (0, s.composeEventHandlers)(t.onCloseAutoFocus, t => {
                    var n;
                    t.preventDefault(), null == (n = a.triggerRef.current) || n.focus()
                }),
                onPointerDownOutside: (0, s.composeEventHandlers)(t.onPointerDownOutside, t => {
                    let n = t.detail.originalEvent,
                        a = 0 === n.button && !0 === n.ctrlKey;
                    (2 === n.button || a) && t.preventDefault()
                }),
                onFocusOutside: (0, s.composeEventHandlers)(t.onFocusOutside, t => t.preventDefault())
            })
        }),
        W = r.forwardRef((t, n) => {
            let a = R(F, t.__scopeDialog),
                i = r.useRef(!1),
                o = r.useRef(!1);
            return (0, C.jsx)(B, {
                ...t,
                ref: n,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: n => {
                    var r, l;
                    null == (r = t.onCloseAutoFocus) || r.call(t, n), n.defaultPrevented || (i.current || null == (l = a.triggerRef.current) || l.focus(), n.preventDefault()), i.current = !1, o.current = !1
                },
                onInteractOutside: n => {
                    var r, l;
                    null == (r = t.onInteractOutside) || r.call(t, n), n.defaultPrevented || (i.current = !0, "pointerdown" === n.detail.originalEvent.type && (o.current = !0));
                    let s = n.target;
                    (null == (l = a.triggerRef.current) ? void 0 : l.contains(s)) && n.preventDefault(), "focusin" === n.detail.originalEvent.type && o.current && n.preventDefault()
                }
            })
        }),
        B = r.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                trapFocus: i,
                onOpenAutoFocus: o,
                onCloseAutoFocus: l,
                ...s
            } = t, u = R(F, a), d = r.useRef(null), f = (0, c.useComposedRefs)(n, d);
            return (0, h.useFocusGuards)(), (0, C.jsxs)(C.Fragment, {
                children: [(0, C.jsx)(m.FocusScope, {
                    asChild: !0,
                    loop: !0,
                    trapped: i,
                    onMountAutoFocus: o,
                    onUnmountAutoFocus: l,
                    children: (0, C.jsx)(p.DismissableLayer, {
                        role: "dialog",
                        id: u.contentId,
                        "aria-describedby": u.descriptionId,
                        "aria-labelledby": u.titleId,
                        "data-state": J(u.open),
                        ...s,
                        ref: f,
                        onDismiss: () => u.onOpenChange(!1)
                    })
                }), (0, C.jsxs)(C.Fragment, {
                    children: [(0, C.jsx)(ee, {
                        titleId: u.titleId
                    }), (0, C.jsx)(et, {
                        contentRef: d,
                        descriptionId: u.descriptionId
                    })]
                })]
            })
        }),
        V = "DialogTitle",
        U = r.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = R(V, a);
            return (0, C.jsx)(y.Primitive.h2, {
                id: r.titleId,
                ...i,
                ref: n
            })
        });
    U.displayName = V;
    var G = "DialogDescription",
        q = r.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = R(G, a);
            return (0, C.jsx)(y.Primitive.p, {
                id: r.descriptionId,
                ...i,
                ref: n
            })
        });
    q.displayName = G;
    var X = "DialogClose",
        Z = r.forwardRef((t, n) => {
            let {
                __scopeDialog: a,
                ...i
            } = t, r = R(X, a);
            return (0, C.jsx)(y.Primitive.button, {
                type: "button",
                ...i,
                ref: n,
                onClick: (0, s.composeEventHandlers)(t.onClick, () => r.onOpenChange(!1))
            })
        });

    function J(t) {
        return t ? "open" : "closed"
    }
    Z.displayName = X;
    var Y = "DialogTitleWarning",
        [$, Q] = (0, u.createContext)(Y, {
            contentName: F,
            titleName: V,
            docsSlug: "dialog"
        }),
        ee = t => {
            let {
                titleId: n
            } = t, a = Q(Y), i = "`".concat(a.contentName, "` requires a `").concat(a.titleName, "` for the component to be accessible for screen reader users.\n\nIf you want to hide the `").concat(a.titleName, "`, you can wrap it with our VisuallyHidden component.\n\nFor more information, see https://radix-ui.com/primitives/docs/components/").concat(a.docsSlug);
            return r.useEffect(() => {
                n && (document.getElementById(n) || console.error(i))
            }, [i, n]), null
        },
        et = t => {
            let {
                contentRef: n,
                descriptionId: a
            } = t, i = Q("DialogDescriptionWarning"), o = "Warning: Missing `Description` or `aria-describedby={undefined}` for {".concat(i.contentName, "}.");
            return r.useEffect(() => {
                var t;
                let i = null == (t = n.current) ? void 0 : t.getAttribute("aria-describedby");
                a && i && (document.getElementById(a) || console.warn(o))
            }, [o, n, a]), null
        };
    t.s(["Close", 0, Z, "Content", 0, _, "Description", 0, q, "Overlay", 0, j, "Portal", 0, H, "Root", 0, T, "Title", 0, U, "Trigger", 0, A], 425353), t.i(149285);
    var en = t.i(23342),
        ea = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "select", "span", "svg", "ul"].reduce((t, n) => {
            let a = (0, en.createSlot)("Primitive.".concat(n)),
                i = r.forwardRef((t, i) => {
                    let {
                        asChild: r,
                        ...o
                    } = t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, C.jsx)(r ? a : n, {
                        ...o,
                        ref: i
                    })
                });
            return i.displayName = "Primitive.".concat(n), {
                ...t,
                [n]: i
            }
        }, {}),
        ei = Object.freeze({
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
        er = r.forwardRef((t, n) => (0, C.jsx)(ea.span, {
            ...t,
            ref: n,
            style: {
                ...ei,
                ...t.style
            }
        }));
    er.displayName = "VisuallyHidden", t.s(["VisuallyHidden", 0, er], 199512)
}, 409653, t => {
    "use strict";
    var n = t.i(416340);
    t.s(["LoadingSpinner", 0, t => {
        let {
            width: a,
            height: i
        } = t;
        return n.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: a,
            height: i,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, n.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    }])
}, 253923, t => {
    "use strict";
    var n = t.i(197649),
        a = t.i(416340);
    t.s(["StateLayer", 0, t => {
        let {
            className: i
        } = t;
        return a.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, n.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", i)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 106077, t => {
    "use strict";
    t.s(["disabledOpacity", 0, "opacity-[0.5]"])
}, 620068, 221180, t => {
    "use strict";
    var n = t.i(371927);
    t.i(416340);
    var a = n.u;
    t.s(["default", 0, a], 221180), t.s(["useMediaQuery", 0, a], 620068)
}, 197649, t => {
    "use strict";

    function n() {
        for (var t, n, a = 0, i = "", r = arguments.length; a < r; a++)(t = arguments[a]) && (n = function t(n) {
            var a, i, r = "";
            if ("string" == typeof n || "number" == typeof n) r += n;
            else if ("object" == typeof n)
                if (Array.isArray(n)) {
                    var o = n.length;
                    for (a = 0; a < o; a++) n[a] && (i = t(n[a])) && (r && (r += " "), r += i)
                } else
                    for (i in n) n[i] && (r && (r += " "), r += i);
            return r
        }(t)) && (i && (i += " "), i += n);
        return i
    }
    t.s(["clsx", 0, n, "default", 0, n])
}]);

//# debugId=1ce863b7-749e-2439-0779-2ec78167c078
//# sourceMappingURL=1a4b-g4pegjet.js.map