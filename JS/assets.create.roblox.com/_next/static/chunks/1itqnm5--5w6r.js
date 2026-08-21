;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "5104e804-f170-0fa9-f1de-93bbf4d6ac18")
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
        h = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, n.translationKey)("Heading.SpeechToText", a.TranslationNamespace.Navigation)
        },
        y = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, n.translationKey)("Heading.TextToSpeech", a.TranslationNamespace.Navigation)
        },
        N = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, n.translationKey)("Heading.VideoService", a.TranslationNamespace.Navigation)
        },
        E = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, n.translationKey)("Heading.CreatorRewards", a.TranslationNamespace.Navigation),
            group: i
        },
        b = {
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
        T = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, n.translationKey)("Heading.Demographics", a.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, n.translationKey)("Heading.Economy", a.TranslationNamespace.Navigation)
        },
        I = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, n.translationKey)("Heading.Funnels", a.TranslationNamespace.Navigation)
        },
        A = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, n.translationKey)("Heading.Explore", a.TranslationNamespace.Navigation)
        },
        x = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, n.translationKey)("Heading.CustomDashboards", a.TranslationNamespace.Navigation)
        },
        R = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, n.translationKey)("Heading.Retention", a.TranslationNamespace.Navigation)
        },
        K = {
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
        k = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, n.translationKey)("Heading.CustomEvents", a.TranslationNamespace.Navigation)
        },
        D = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, n.translationKey)("Heading.Journeys", a.TranslationNamespace.Navigation)
        },
        L = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, n.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        O = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, n.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        j = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, n.translationKey)("Heading.Journeys", a.TranslationNamespace.Navigation)
        },
        F = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, n.translationKey)("Heading.Feedback", a.TranslationNamespace.PlayerFeedback)
        },
        W = {
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
        _ = {
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
        X = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, n.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        Y = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, n.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        Z = {
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
        eo = [H, M, K, R, i, l, s, c, u, d, f, p, m, v, g, h, y, N, ei, E, b, w, C, P, T, S, I, D, L, O, j, A, x, k, J, X, Y, F, W, z, _, q, U, Q, ee, r, o, Z, $, et, en, ea, V, G, B, er];
    t.s(["analyticsAgentNavigationItem", 0, X, "analyticsAiChatNavigationItem", 0, Y, "analyticsAlertConfifurationNavigationItem", 0, G, "analyticsAlertCreationNavigationItem", 0, V, "analyticsAlertsNavigationItem", 0, B, "analyticsAnalyticsHomeNavigationItem", 0, r, "analyticsAssistantNavigationItem", 0, J, "analyticsAudienceNavigationItem", 0, T, "analyticsAvatarCreationTokensNavigationItem", 0, er, "analyticsBountyPayoutsNavigationItem", 0, b, "analyticsCommerceNavigationItem", 0, U, "analyticsConfigsHistoryNavigationItem", 0, W, "analyticsConfigsNavigationItem", 0, z, "analyticsCrashesNavigationItem", 0, C, "analyticsCreationOverviewNavigationItem", 0, ee, "analyticsCustomDashboardsManageNavigationItem", 0, x, "analyticsCustomEventsNavigationItem", 0, k, "analyticsDataStoresNavigationItem", 0, m, "analyticsEngagementNavigationItem", 0, K, "analyticsErrorReportNavigationItem", 0, P, "analyticsExperienceCreatorRewardsNavigationItem", 0, E, "analyticsExperienceSubscriptionsNavigationItem", 0, ea, "analyticsExperimentsCreateNavigationItem", 0, Z, "analyticsExperimentsNavigationItem", 0, o, "analyticsExploreNavigationItem", 0, A, "analyticsFeedbackNavigationItem", 0, F, "analyticsGenerativeAINavigationItem", 0, ei, "analyticsHttpServiceNavigationItem", 0, v, "analyticsImmersiveAdsNavigationItem", 0, d, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, c, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, l, "analyticsItemMonetizationPassesNavigationItem", 0, s, "analyticsMatchmakingNavigationItem", 0, q, "analyticsMemoryStoresNavigationItem", 0, p, "analyticsMessagingServiceNavigationItem", 0, g, "analyticsMonetizationNavigationItem", 0, i, "analyticsNotificationsNavigationItem", 0, en, "analyticsPerformanceNavigationItem", 0, w, "analyticsRecommendationServiceNavigationItem", 0, $, "analyticsRecommendedEventsEconomyNavigationItem", 0, S, "analyticsRecommendedEventsFunnelsNavigationItem", 0, I, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, L, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, O, "analyticsRecommendedEventsJourneyNavigationItem", 0, D, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, j, "analyticsRetentionNavigationItem", 0, R, "analyticsSafetyNavigationItem", 0, Q, "analyticsSpeechToTextNavigationItem", 0, h, "analyticsSubscriptionsNavigationItem", 0, f, "analyticsTextToSpeechNavigationItem", 0, y, "analyticsUserAcquisitionNavigationItem", 0, M, "analyticsVideoServiceNavigationItem", 0, N, "getAnalyticsNavigationItemFromPath", 0, function(t) {
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
        } = t, s = (0, i.useRouter)(), [c, u] = (0, a.useState)(!0), [f, p] = (0, a.useState)(null), [m, v] = (0, a.useState)(null), [g, h] = (0, a.useState)(!1), y = (0, a.useRef)(0), N = (0, a.useCallback)(async function(t) {
            let n = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = y.current += 1,
                i = d.getConfiguration(t),
                r = d.getGameDetail(t, n),
                [o, l] = await Promise.allSettled([i, r]);
            a === y.current && ("fulfilled" === o.status ? p(o.value) : p(null), "fulfilled" === l.status ? (h(!1), v(l.value)) : ("rejected" === l.status ? h(!0) : h(!1), v(null)), u(!1))
        }, []), E = (0, a.useMemo)(() => {
            let {
                id: t
            } = s.query;
            return r || ("string" == typeof t ? parseInt(t, 10) : void 0)
        }, [r, s.query]), b = (0, a.useCallback)(() => E ? N(E, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [E, N]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== E && !Number.isNaN(E) && E > 0) return void N(E);
                y.current += 1, p(null), v(null), h(!1), u(!1)
            } catch (t) {
                console.warn("Could not fetch game details for universeId ".concat(E))
            }
        }, [E, N]);
        let w = (0, a.useMemo)(() => ({
            isLoadingGame: c,
            canConfigure: f,
            gameDetails: m,
            isErrorLoadingGame: g,
            refreshGameDetails: b
        }), [c, f, m, g, b]);
        return (0, n.jsx)(l.Provider, {
            value: w,
            children: o
        })
    }, "useCurrentGame", 0, function() {
        let t = (0, a.useContext)(l);
        if (null === t) throw Error("useCurrentGame must be used within a GameProvider");
        return t
    }], 114209)
}, 694533, t => {
    "use strict";
    let n;
    var a = t.i(416340),
        i = t.i(149285),
        r = t.i(221628),
        o = t.i(76145);

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
    var v, g, h = "dismissableLayer.update",
        y = a.createContext({
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
                onFocusOutside: f,
                onInteractOutside: v,
                onDismiss: N,
                ...w
            } = t, C = a.useContext(y), [P, T] = a.useState(null), S = null != (i = null == P ? void 0 : P.ownerDocument) ? i : null == (o = globalThis) ? void 0 : o.document, [, I] = a.useState({}), A = u(n, t => T(t)), x = Array.from(C.layers), [R] = [...C.layersWithOutsidePointerEventsDisabled].slice(-1), K = x.indexOf(R), M = P ? x.indexOf(P) : -1, H = C.layersWithOutsidePointerEventsDisabled.size > 0, k = M >= K, D = function(t) {
                var n;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    r = m(t),
                    o = a.useRef(!1),
                    l = a.useRef(() => {});
                return a.useEffect(() => {
                    let t = t => {
                            if (t.target && !o.current) {
                                let n = function() {
                                        b("dismissableLayer.pointerDownOutside", r, a, {
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
                k && !a && (null == d || d(t), null == v || v(t), t.defaultPrevented || null == N || N())
            }, S), L = function(t) {
                var n;
                let i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (n = globalThis) ? void 0 : n.document,
                    r = m(t),
                    o = a.useRef(!1);
                return a.useEffect(() => {
                    let t = t => {
                        t.target && !o.current && b("dismissableLayer.focusOutside", r, {
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
                [...C.branches].some(t => t.contains(n)) || (null == f || f(t), null == v || v(t), t.defaultPrevented || null == N || N())
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
                M === C.layers.size - 1 && (null == c || c(t), !t.defaultPrevented && N && (t.preventDefault(), N()))
            }, S), a.useEffect(() => {
                if (P) return s && (0 === C.layersWithOutsidePointerEventsDisabled.size && (g = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), C.layersWithOutsidePointerEventsDisabled.add(P)), C.layers.add(P), E(), () => {
                    s && 1 === C.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = g)
                }
            }, [P, S, s, C]), a.useEffect(() => () => {
                P && (C.layers.delete(P), C.layersWithOutsidePointerEventsDisabled.delete(P), E())
            }, [P, C]), a.useEffect(() => {
                let t = () => I({});
                return document.addEventListener(h, t), () => document.removeEventListener(h, t)
            }, []), (0, r.jsx)(p.div, {
                ...w,
                ref: A,
                style: {
                    pointerEvents: H ? k ? "auto" : "none" : void 0,
                    ...t.style
                },
                onFocusCapture: l(t.onFocusCapture, L.onFocusCapture),
                onBlurCapture: l(t.onBlurCapture, L.onBlurCapture),
                onPointerDownCapture: l(t.onPointerDownCapture, D.onPointerDownCapture)
            })
        });

    function E() {
        let t = new CustomEvent(h);
        document.dispatchEvent(t)
    }

    function b(t, n, a, r) {
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
        let i = a.useContext(y),
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
    var w = 0;

    function C() {
        let t = document.createElement("span");
        return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
    }

    function P(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }

    function T() {
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
    var S = Symbol("radix.slottable");

    function I(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === S
    }
    var A = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
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
                    return i.type !== a.Fragment && (c.ref = n ? T(n, s) : s), a.cloneElement(i, c)
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

    function x(t) {
        let n = a.useRef(t);
        return a.useEffect(() => {
            n.current = t
        }), a.useMemo(() => function() {
            for (var t, a = arguments.length, i = Array(a), r = 0; r < a; r++) i[r] = arguments[r];
            return null == (t = n.current) ? void 0 : t.call(n, ...i)
        }, [])
    }
    var R = "focusScope.autoFocusOnMount",
        K = "focusScope.autoFocusOnUnmount",
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
            } = t, [u, d] = a.useState(null), f = x(l), p = x(s), m = a.useRef(null), v = function() {
                for (var t = arguments.length, n = Array(t), i = 0; i < t; i++) n[i] = arguments[i];
                return a.useCallback(T(...n), n)
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
                            u.contains(n) ? m.current = n : L(m.current, {
                                select: !0
                            })
                        },
                        n = function(t) {
                            if (g.paused || !u) return;
                            let n = t.relatedTarget;
                            null !== n && (u.contains(n) || L(m.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", t), document.addEventListener("focusout", n);
                    let a = new MutationObserver(function(t) {
                        if (document.activeElement === document.body)
                            for (let n of t) n.removedNodes.length > 0 && L(u)
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
                    O.add(g);
                    let t = document.activeElement;
                    if (!u.contains(t)) {
                        let n = new CustomEvent(R, M);
                        u.addEventListener(R, f), u.dispatchEvent(n), n.defaultPrevented || (! function(t) {
                            let {
                                select: n = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, a = document.activeElement;
                            for (let i of t)
                                if (L(i, {
                                        select: n
                                    }), document.activeElement !== a) return
                        }(k(u).filter(t => "A" !== t.tagName), {
                            select: !0
                        }), document.activeElement === t && L(u))
                    }
                    return () => {
                        u.removeEventListener(R, f), setTimeout(() => {
                            let n = new CustomEvent(K, M);
                            u.addEventListener(K, p), u.dispatchEvent(n), n.defaultPrevented || L(null != t ? t : document.body, {
                                select: !0
                            }), u.removeEventListener(K, p), O.remove(g)
                        }, 0)
                    }
                }
            }, [u, f, p, g]);
            let h = a.useCallback(t => {
                if (!i && !o || g.paused) return;
                let n = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                    a = document.activeElement;
                if (n && a) {
                    let n, r = t.currentTarget,
                        [o, l] = [D(n = k(r), r), D(n.reverse(), r)];
                    o && l ? t.shiftKey || a !== l ? t.shiftKey && a === o && (t.preventDefault(), i && L(l, {
                        select: !0
                    })) : (t.preventDefault(), i && L(o, {
                        select: !0
                    })) : a === r && t.preventDefault()
                }
            }, [i, o, g.paused]);
            return (0, r.jsx)(A.div, {
                tabIndex: -1,
                ...c,
                ref: v,
                onKeyDown: h
            })
        });

    function k(t) {
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

    function D(t, n) {
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

    function L(t) {
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
    var O = (n = [], {
        add(t) {
            let a = n[0];
            t !== a && (null == a || a.pause()), (n = j(n, t)).unshift(t)
        },
        remove(t) {
            var a;
            null == (a = (n = j(n, t))[0]) || a.resume()
        }
    });

    function j(t, n) {
        let a = [...t],
            i = a.indexOf(n);
        return -1 !== i && a.splice(i, 1), a
    }

    function F(t, n) {
        if ("function" == typeof t) return t(n);
        null != t && (t.current = n)
    }
    var W = Symbol("radix.slottable");

    function z(t) {
        return a.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === W
    }
    var _ = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, n) => {
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
        B = (null == (v = globalThis) ? void 0 : v.document) ? a.useLayoutEffect : () => {},
        V = a.forwardRef((t, n) => {
            var o, l;
            let {
                container: s,
                ...c
            } = t, [u, d] = a.useState(!1);
            B(() => d(!0), []);
            let f = s || u && (null == (l = globalThis) || null == (o = l.document) ? void 0 : o.body);
            return f ? i.default.createPortal((0, r.jsx)(_.div, {
                ...c,
                ref: n
            }), f) : null
        });
    V.displayName = "Portal";
    var G = new WeakMap,
        q = new WeakMap,
        U = {},
        J = 0,
        X = function(t) {
            return t && (t.host || X(t.parentNode))
        },
        Y = function(t, n, a, i) {
            var r = (Array.isArray(t) ? t : [t]).map(function(t) {
                if (n.contains(t)) return t;
                var a = X(t);
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
        Z = "right-scroll-bar-position",
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
    var ea = (void 0 === eN && (eN = {}), (void 0 === eE && (eE = function(t) {
            return t
        }), eb = [], ew = !1, eC = {
            read: function() {
                if (ew) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return eb.length ? eb[eb.length - 1] : null
            },
            useMedium: function(t) {
                var n = eE(t, ew);
                return eb.push(n),
                    function() {
                        eb = eb.filter(function(t) {
                            return t !== n
                        })
                    }
            },
            assignSyncMedium: function(t) {
                for (ew = !0; eb.length;) {
                    var n = eb;
                    eb = [], n.forEach(t)
                }
                eb = {
                    push: function(n) {
                        return t(n)
                    },
                    filter: function() {
                        return eb
                    }
                }
            },
            assignMedium: function(t) {
                ew = !0;
                var n = [];
                if (eb.length) {
                    var a = eb;
                    eb = [], a.forEach(t), n = eb
                }
                var i = function() {
                        var a = n;
                        n = [], a.forEach(t)
                    },
                    r = function() {
                        return Promise.resolve().then(i)
                    };
                r(), eb = {
                    push: function(t) {
                        n.push(t), r()
                    },
                    filter: function(t) {
                        return n = n.filter(t), eb
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
                f = u[1],
                p = t.forwardProps,
                m = t.children,
                v = t.className,
                g = t.removeScrollBar,
                h = t.enabled,
                y = t.shards,
                N = t.sideCar,
                E = t.noIsolation,
                b = t.inert,
                w = t.allowPinchZoom,
                C = t.as,
                P = t.gapMode,
                T = (0, o._)(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
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
                I = (0, o.a)((0, o.a)({}, T), d);
            return a.createElement(a.Fragment, null, h && a.createElement(N, {
                sideCar: ea,
                removeScrollBar: g,
                shards: y,
                noIsolation: E,
                inert: b,
                setCallbacks: f,
                allowPinchZoom: !!w,
                lockRef: c,
                gapMode: P
            }), p ? a.cloneElement(a.Children.only(m), (0, o.a)((0, o.a)({}, I), {
                ref: S
            })) : a.createElement(void 0 === C ? "div" : C, (0, o.a)({}, I, {
                className: v,
                ref: S
            }), m))
        });
    er.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, er.classNames = {
        fullWidth: $,
        zeroRight: Z
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
            return void 0 === a && (a = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(i, ";\n   padding-right: ").concat(s, "px ").concat(i, ";\n  }\n  body[").concat(ep, "] {\n    overflow: hidden ").concat(i, ";\n    overscroll-behavior: contain;\n    ").concat([n && "position: relative ".concat(i, ";"), "margin" === a && "\n    padding-left: ".concat(r, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(s, "px ").concat(i, ";\n    "), "padding" === a && "padding-right: ".concat(s, "px ").concat(i, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(Z, " {\n    right: ").concat(s, "px ").concat(i, ";\n  }\n  \n  .").concat($, " {\n    margin-right: ").concat(s, "px ").concat(i, ";\n  }\n  \n  .").concat(Z, " .").concat(Z, " {\n    right: 0 ").concat(i, ";\n  }\n  \n  .").concat($, " .").concat($, " {\n    margin-right: 0 ").concat(i, ";\n  }\n  \n  body[").concat(ep, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(s, "px;\n  }\n")
        },
        ev = function() {
            var t = parseInt(document.body.getAttribute(ep) || "0", 10);
            return isFinite(t) ? t : 0
        },
        eg = function(t) {
            var n = t.noRelative,
                i = t.noImportant,
                r = t.gapMode,
                o = void 0 === r ? "margin" : r;
            a.useEffect(function() {
                return document.body.setAttribute(ep, (ev() + 1).toString()),
                    function() {
                        var t = ev() - 1;
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
        eh = !1;
    if ("u" > typeof window) try {
        var ey = Object.defineProperty({}, "passive", {
            get: function() {
                return eh = !0, !0
            }
        });
        window.addEventListener("test", ey, ey), window.removeEventListener("test", ey, ey)
    } catch (t) {
        eh = !1
    }
    var eN, eE, eb, ew, eC, eP, eT = !!eh && {
            passive: !1
        },
        eS = function(t, n) {
            if (!(t instanceof Element)) return !1;
            var a = window.getComputedStyle(t);
            return "hidden" !== a[n] && (a.overflowY !== a.overflowX || "TEXTAREA" === t.tagName || "visible" !== a[n])
        },
        eI = function(t, n) {
            var a = n.ownerDocument,
                i = n;
            do {
                if ("u" > typeof ShadowRoot && i instanceof ShadowRoot && (i = i.host), eA(t, i)) {
                    var r = ex(t, i);
                    if (r[1] > r[2]) return !0
                }
                i = i.parentNode
            } while (i && i !== a.body) return !1
        },
        eA = function(t, n) {
            return "v" === t ? eS(n, "overflowY") : eS(n, "overflowX")
        },
        ex = function(t, n) {
            return "v" === t ? [n.scrollTop, n.scrollHeight, n.clientHeight] : [n.scrollLeft, n.scrollWidth, n.clientWidth]
        },
        eR = function(t, n, a, i, r) {
            var o, l = (o = window.getComputedStyle(n).direction, "h" === t && "rtl" === o ? -1 : 1),
                s = l * i,
                c = a.target,
                u = n.contains(c),
                d = !1,
                f = s > 0,
                p = 0,
                m = 0;
            do {
                var v = ex(t, c),
                    g = v[0],
                    h = v[1] - v[2] - l * g;
                (g || h) && eA(t, c) && (p += h, m += g), c = c instanceof ShadowRoot ? c.host : c.parentNode
            } while (!u && c !== document.body || u && (n.contains(c) || n === c)) return (f && (r && 1 > Math.abs(p) || !r && s > p) || !f && (r && 1 > Math.abs(m) || !r && -s > m)) && (d = !0), d
        },
        eK = function(t) {
            return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
        },
        eM = function(t) {
            return [t.deltaX, t.deltaY]
        },
        eH = function(t) {
            return t && "current" in t ? t.current : t
        },
        ek = 0,
        eD = [],
        eL = (eP = function(t) {
            var n = a.useRef([]),
                i = a.useRef([0, 0]),
                r = a.useRef(),
                l = a.useState(ek++)[0],
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
                    var a, o = eK(t),
                        l = i.current,
                        s = "deltaX" in t ? t.deltaX : l[0] - o[0],
                        u = "deltaY" in t ? t.deltaY : l[1] - o[1],
                        d = t.target,
                        f = Math.abs(s) > Math.abs(u) ? "h" : "v";
                    if ("touches" in t && "h" === f && "range" === d.type) return !1;
                    var p = eI(f, d);
                    if (!p) return !0;
                    if (p ? a = f : (a = "v" === f ? "h" : "v", p = eI(f, d)), !p) return !1;
                    if (!r.current && "changedTouches" in t && (s || u) && (r.current = a), !a) return !0;
                    var m = r.current || a;
                    return eR(m, n, t, "h" === m ? s : u, !0)
                }, []),
                d = a.useCallback(function(t) {
                    if (eD.length && eD[eD.length - 1] === s) {
                        var a = "deltaY" in t ? eM(t) : eK(t),
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
                    i.current = eK(t), r.current = void 0
                }, []),
                m = a.useCallback(function(n) {
                    f(n.type, eM(n), n.target, u(n, t.lockRef.current))
                }, []),
                v = a.useCallback(function(n) {
                    f(n.type, eK(n), n.target, u(n, t.lockRef.current))
                }, []);
            a.useEffect(function() {
                return eD.push(s), t.setCallbacks({
                        onScrollCapture: m,
                        onWheelCapture: m,
                        onTouchMoveCapture: v
                    }), document.addEventListener("wheel", d, eT), document.addEventListener("touchmove", d, eT), document.addEventListener("touchstart", p, eT),
                    function() {
                        eD = eD.filter(function(t) {
                            return t !== s
                        }), document.removeEventListener("wheel", d, eT), document.removeEventListener("touchmove", d, eT), document.removeEventListener("touchstart", p, eT)
                    }
            }, []);
            var g = t.removeScrollBar,
                h = t.inert;
            return a.createElement(a.Fragment, null, h ? a.createElement(s, {
                styles: "\n  .block-interactivity-".concat(l, " {pointer-events: none;}\n  .allow-interactivity-").concat(l, " {pointer-events: all;}\n")
            }) : null, g ? a.createElement(eg, {
                gapMode: t.gapMode
            }) : null)
        }, ea.useMedium(eP), en),
        eO = a.forwardRef(function(t, n) {
            return a.createElement(er, (0, o.a)({}, t, {
                ref: n,
                sideCar: eL
            }))
        });
    eO.classNames = er.classNames, t.s(["D", 0, N, "F", 0, H, "P", 0, V, "R", 0, eO, "h", 0, function(t, n, a) {
        void 0 === a && (a = "data-aria-hidden");
        var i = Array.from(Array.isArray(t) ? t : [t]),
            r = n || ("u" < typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
        return r ? (i.push.apply(i, Array.from(r.querySelectorAll("[aria-live]"))), Y(i, r, a, "aria-hidden")) : function() {
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
}, 899659, t => {
    "use strict";
    var n = t.i(76145),
        a = t.i(197649),
        i = t.i(416340),
        r = t.i(976289),
        o = t.i(58233);
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
}, 438082, t => {
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
}]);

//# debugId=5104e804-f170-0fa9-f1de-93bbf4d6ac18
//# sourceMappingURL=1o63bjn55-au2.js.map