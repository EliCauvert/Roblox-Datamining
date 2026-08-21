;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "fb7c0df9-7e51-6d82-d69a-9c2ec7ffa7c4")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 97782, t => {
    "use strict";
    var a = t.i(730530),
        n = t.i(881670);
    let r = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, a.translationKey)("Heading.Monetization", n.TranslationNamespace.Analytics)
        },
        i = {
            path: "/dashboard/analytics",
            pathPattern: /\/dashboard\/analytics/,
            title: (0, a.translationKey)("Heading.Analytics", n.TranslationNamespace.Navigation)
        },
        o = {
            path: "/experiments",
            pathPattern: /\/experiments(?!\/)/,
            title: (0, a.translationKey)("Heading.Experiments", n.TranslationNamespace.Navigation)
        },
        l = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, a.translationKey)("Label.DeveloperProducts", n.TranslationNamespace.Navigation),
            group: r
        },
        s = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, a.translationKey)("Label.GamePasses", n.TranslationNamespace.Navigation),
            group: r
        },
        c = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, a.translationKey)("Label.ThirdPartyAvatarItemCommissions", n.TranslationNamespace.Navigation),
            group: r
        },
        u = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, a.translationKey)("Heading.ItemAnalytics", n.TranslationNamespace.Analytics)
        },
        d = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, a.translationKey)("Heading.Ads", n.TranslationNamespace.Navigation),
            group: r
        },
        p = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, a.translationKey)("Heading.Subscriptions", n.TranslationNamespace.Navigation),
            group: r
        },
        f = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, a.translationKey)("Heading.MemoryStores", n.TranslationNamespace.Navigation)
        },
        m = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, a.translationKey)("Heading.DataStores", n.TranslationNamespace.Navigation)
        },
        h = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, a.translationKey)("Heading.HttpService", n.TranslationNamespace.Navigation)
        },
        v = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, a.translationKey)("Heading.MessagingService", n.TranslationNamespace.Navigation)
        },
        g = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, a.translationKey)("Heading.SpeechToText", n.TranslationNamespace.Navigation)
        },
        y = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, a.translationKey)("Heading.TextToSpeech", n.TranslationNamespace.Navigation)
        },
        b = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, a.translationKey)("Heading.VideoService", n.TranslationNamespace.Navigation)
        },
        N = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, a.translationKey)("Heading.CreatorRewards", n.TranslationNamespace.Navigation),
            group: r
        },
        w = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, a.translationKey)("Heading.RobloxPlusDeveloperProgram", n.TranslationNamespace.Navigation),
            group: r
        },
        E = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, a.translationKey)("Heading.Performance", n.TranslationNamespace.Navigation)
        },
        C = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, a.translationKey)("Heading.Crashes", n.TranslationNamespace.Analytics)
        },
        x = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, a.translationKey)("Heading.ErrorReport", n.TranslationNamespace.Navigation)
        },
        P = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, a.translationKey)("Heading.Demographics", n.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, a.translationKey)("Heading.Economy", n.TranslationNamespace.Navigation)
        },
        T = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, a.translationKey)("Heading.Funnels", n.TranslationNamespace.Navigation)
        },
        A = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, a.translationKey)("Heading.Explore", n.TranslationNamespace.Navigation)
        },
        k = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, a.translationKey)("Heading.CustomDashboards", n.TranslationNamespace.Navigation)
        },
        I = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, a.translationKey)("Heading.Retention", n.TranslationNamespace.Navigation)
        },
        R = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, a.translationKey)("Heading.Engagement", n.TranslationNamespace.Navigation)
        },
        z = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, a.translationKey)("Heading.Acquisition", n.TranslationNamespace.Navigation),
            group: i
        },
        M = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, a.translationKey)("Heading.Acquisition", n.TranslationNamespace.Navigation),
            group: i
        },
        K = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, a.translationKey)("Heading.CustomEvents", n.TranslationNamespace.Navigation)
        },
        L = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, a.translationKey)("Heading.Journeys", n.TranslationNamespace.Navigation)
        },
        O = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", n.TranslationNamespace.Navigation)
        },
        H = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", n.TranslationNamespace.Navigation)
        },
        D = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, a.translationKey)("Heading.Journeys", n.TranslationNamespace.Navigation)
        },
        j = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, a.translationKey)("Heading.Feedback", n.TranslationNamespace.PlayerFeedback)
        },
        _ = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, a.translationKey)("Heading.ConfigsHistory", n.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.ConfigHistory", n.TranslationNamespace.Navigation)
        },
        F = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, a.translationKey)("Heading.Configs", n.TranslationNamespace.Navigation)
        },
        W = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, a.translationKey)("Heading.ConfigCreate", n.TranslationNamespace.Navigation)
        },
        B = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, a.translationKey)("Heading.Alerts", n.TranslationNamespace.Navigation)
        },
        V = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, a.translationKey)("Heading.CreateAlert", n.TranslationNamespace.ExperienceAlerts)
        },
        U = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, a.translationKey)("Heading.ConfigureAlert", n.TranslationNamespace.Navigation)
        },
        G = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, a.translationKey)("Heading.CustomMatchmaking", n.TranslationNamespace.Matchmaking)
        },
        X = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, a.translationKey)("Heading.Commerce", n.TranslationNamespace.Navigation),
            group: r
        },
        q = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, a.translationKey)("Heading.Assistant", n.TranslationNamespace.Analytics)
        },
        Z = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, a.translationKey)("Heading.Assistant", n.TranslationNamespace.Analytics)
        },
        J = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, a.translationKey)("Heading.Assistant", n.TranslationNamespace.Analytics)
        },
        Y = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, a.translationKey)("Heading.ExperimentsCreate", n.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, a.translationKeyWithoutNamespace)("Heading.Experimentation"),
            group: o
        },
        $ = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, a.translationKey)("Heading.RecommendationService", n.TranslationNamespace.Navigation)
        },
        Q = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, a.translationKey)("Heading.SafetyOverview", n.TranslationNamespace.Analytics),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.Safety", n.TranslationNamespace.Navigation)
        },
        ee = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, a.translationKey)("Heading.Overview", n.TranslationNamespace.Navigation)
        },
        et = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, a.translationKey)("Heading.Thumbnails", n.TranslationNamespace.Navigation)
        },
        ea = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, a.translationKey)("Heading.Notifications", n.TranslationNamespace.Navigation)
        },
        en = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, a.translationKey)("Heading.Subscriptions", n.TranslationNamespace.Navigation),
            group: r
        },
        er = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, a.translationKey)("Heading.GenerativeAI", n.TranslationNamespace.Navigation)
        },
        ei = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, a.translationKey)("Heading.AvatarCreationTokens", n.TranslationNamespace.AvatarAnalytics),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.AvatarCreationTokens", n.TranslationNamespace.Navigation),
            group: r
        },
        eo = [M, z, R, I, r, l, s, c, u, d, p, f, m, h, v, g, y, b, er, N, w, E, C, x, P, S, T, L, O, H, D, A, k, K, q, Z, J, j, _, F, W, G, X, Q, ee, i, o, Y, $, et, ea, en, V, U, B, ei];
    t.s(["analyticsAgentNavigationItem", 0, Z, "analyticsAiChatNavigationItem", 0, J, "analyticsAlertConfifurationNavigationItem", 0, U, "analyticsAlertCreationNavigationItem", 0, V, "analyticsAlertsNavigationItem", 0, B, "analyticsAnalyticsHomeNavigationItem", 0, i, "analyticsAssistantNavigationItem", 0, q, "analyticsAudienceNavigationItem", 0, P, "analyticsAvatarCreationTokensNavigationItem", 0, ei, "analyticsBountyPayoutsNavigationItem", 0, w, "analyticsCommerceNavigationItem", 0, X, "analyticsConfigsHistoryNavigationItem", 0, _, "analyticsConfigsNavigationItem", 0, F, "analyticsCrashesNavigationItem", 0, C, "analyticsCreationOverviewNavigationItem", 0, ee, "analyticsCustomDashboardsManageNavigationItem", 0, k, "analyticsCustomEventsNavigationItem", 0, K, "analyticsDataStoresNavigationItem", 0, m, "analyticsEngagementNavigationItem", 0, R, "analyticsErrorReportNavigationItem", 0, x, "analyticsExperienceCreatorRewardsNavigationItem", 0, N, "analyticsExperienceSubscriptionsNavigationItem", 0, en, "analyticsExperimentsCreateNavigationItem", 0, Y, "analyticsExperimentsNavigationItem", 0, o, "analyticsExploreNavigationItem", 0, A, "analyticsFeedbackNavigationItem", 0, j, "analyticsGenerativeAINavigationItem", 0, er, "analyticsHttpServiceNavigationItem", 0, h, "analyticsImmersiveAdsNavigationItem", 0, d, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, c, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, l, "analyticsItemMonetizationPassesNavigationItem", 0, s, "analyticsMatchmakingNavigationItem", 0, G, "analyticsMemoryStoresNavigationItem", 0, f, "analyticsMessagingServiceNavigationItem", 0, v, "analyticsMonetizationNavigationItem", 0, r, "analyticsNotificationsNavigationItem", 0, ea, "analyticsPerformanceNavigationItem", 0, E, "analyticsRecommendationServiceNavigationItem", 0, $, "analyticsRecommendedEventsEconomyNavigationItem", 0, S, "analyticsRecommendedEventsFunnelsNavigationItem", 0, T, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, O, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, H, "analyticsRecommendedEventsJourneyNavigationItem", 0, L, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, D, "analyticsRetentionNavigationItem", 0, I, "analyticsSafetyNavigationItem", 0, Q, "analyticsSpeechToTextNavigationItem", 0, g, "analyticsSubscriptionsNavigationItem", 0, p, "analyticsTextToSpeechNavigationItem", 0, y, "analyticsUserAcquisitionNavigationItem", 0, z, "analyticsVideoServiceNavigationItem", 0, b, "getAnalyticsNavigationItemFromPath", 0, function(t) {
        return eo.find(a => a.pathPattern.test(t))
    }])
}, 533968, t => {
    "use strict";
    var a = t.i(185915);
    t.s(["getResponseFromError", () => a.default])
}, 17829, t => {
    "use strict";
    var a, n = ((a = n || {}).User = "User", a.Group = "Group", a);
    t.s(["default", 0, n])
}, 114209, 559227, t => {
    "use strict";
    var a = t.i(221628),
        n = t.i(416340),
        r = t.i(237401),
        i = t.i(773057),
        o = t.i(392782);
    let l = (0, n.createContext)({
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
        async getGameDetail(t, a) {
            var n, r, i;
            if (!a && this.gameDetailsMap.has(t)) return null != (n = this.gameDetailsMap.get(t)) ? n : null;
            try {
                let a = null != (r = null == (i = (await this.gamesClient.getDetails([t])).data) ? void 0 : i[0]) ? r : null;
                return a && this.gameDetailsMap.set(t, a), a
            } catch (n) {
                let a = (0, u.getResponseFromError)(n);
                if ((null == a ? void 0 : a.status) === c.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(t)), n
            }
        }
        async getConfiguration(t, a) {
            if (!a && this.gameConfigurationMap.has(t)) {
                var n;
                return null != (n = this.gameConfigurationMap.get(t)) ? n : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(t), this.gameConfigurationMap.set(t, !0), !0
            } catch (n) {
                let a = (0, u.getResponseFromError)(n);
                if ((null == a ? void 0 : a.status) === c.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(t, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(t)), null
            }
        }
        constructor(t, a) {
            (0, s._)(this, "gamesClient", void 0), (0, s._)(this, "developClient", void 0), (0, s._)(this, "gameDetailsMap", void 0), (0, s._)(this, "gameConfigurationMap", void 0), this.gamesClient = t, this.developClient = a, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(o.default, i.default);
    t.s(["default", 0, t => {
        let {
            requestedGameId: i,
            children: o
        } = t, s = (0, r.useRouter)(), [c, u] = (0, n.useState)(!0), [p, f] = (0, n.useState)(null), [m, h] = (0, n.useState)(null), [v, g] = (0, n.useState)(!1), y = (0, n.useRef)(0), b = (0, n.useCallback)(async function(t) {
            let a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                n = y.current += 1,
                r = d.getConfiguration(t),
                i = d.getGameDetail(t, a),
                [o, l] = await Promise.allSettled([r, i]);
            n === y.current && ("fulfilled" === o.status ? f(o.value) : f(null), "fulfilled" === l.status ? (g(!1), h(l.value)) : ("rejected" === l.status ? g(!0) : g(!1), h(null)), u(!1))
        }, []), N = (0, n.useMemo)(() => {
            let {
                id: t
            } = s.query;
            return i || ("string" == typeof t ? parseInt(t, 10) : void 0)
        }, [i, s.query]), w = (0, n.useCallback)(() => N ? b(N, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [N, b]);
        (0, n.useEffect)(() => {
            try {
                if (void 0 !== N && !Number.isNaN(N) && N > 0) return void b(N);
                y.current += 1, f(null), h(null), g(!1), u(!1)
            } catch (t) {
                console.warn("Could not fetch game details for universeId ".concat(N))
            }
        }, [N, b]);
        let E = (0, n.useMemo)(() => ({
            isLoadingGame: c,
            canConfigure: p,
            gameDetails: m,
            isErrorLoadingGame: v,
            refreshGameDetails: w
        }), [c, p, m, v, w]);
        return (0, a.jsx)(l.Provider, {
            value: E,
            children: o
        })
    }, "useCurrentGame", 0, function() {
        let t = (0, n.useContext)(l);
        if (null === t) throw Error("useCurrentGame must be used within a GameProvider");
        return t
    }], 114209)
}, 694533, t => {
    "use strict";
    let a;
    var n = t.i(416340),
        r = t.i(149285),
        i = t.i(221628),
        o = t.i(76145);

    function l(t, a) {
        let {
            checkForDefaultPrevented: n = !0
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
        return function(r) {
            if (null == t || t(r), !1 === n || !r.defaultPrevented) return null == a ? void 0 : a(r)
        }
    }

    function s(t, a) {
        if ("function" == typeof t) return t(a);
        null != t && (t.current = a)
    }

    function c() {
        for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
        return t => {
            let n = !1,
                r = a.map(a => {
                    let r = s(a, t);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let t = 0; t < r.length; t++) {
                    let n = r[t];
                    "function" == typeof n ? n() : s(a[t], null)
                }
            }
        }
    }

    function u() {
        for (var t = arguments.length, a = Array(t), r = 0; r < t; r++) a[r] = arguments[r];
        return n.useCallback(c(...a), a)
    }
    var d = Symbol("radix.slottable");

    function p(t) {
        return n.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === d
    }
    var f = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, a) => {
        var r, o;
        let l, s, u, d = (o = r = "Primitive.".concat(a), (l = n.forwardRef((t, a) => {
                let {
                    children: r,
                    ...i
                } = t;
                if (n.isValidElement(r)) {
                    var o, l;
                    let t, s = (t = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in t && t.isReactWarning ? r.ref : (t = null == (l = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                        u = function(t, a) {
                            let n = {
                                ...a
                            };
                            for (let r in a) {
                                let i = t[r],
                                    o = a[r];
                                /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                    for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
                                    o(...a), i(...a)
                                } : i && (n[r] = i) : "style" === r ? n[r] = {
                                    ...i,
                                    ...o
                                } : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...n
                            }
                        }(i, r.props);
                    return r.type !== n.Fragment && (u.ref = a ? c(a, s) : s), n.cloneElement(r, u)
                }
                return n.Children.count(r) > 1 ? n.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), s = l, (u = n.forwardRef((t, a) => {
                let {
                    children: r,
                    ...o
                } = t, l = n.Children.toArray(r), c = l.find(p);
                if (c) {
                    let t = c.props.children,
                        r = l.map(a => a === c ? n.Children.count(t) > 1 ? n.Children.only(null) : n.isValidElement(t) ? t.props.children : null : a);
                    return (0, i.jsx)(s, {
                        ...o,
                        ref: a,
                        children: n.isValidElement(t) ? n.cloneElement(t, void 0, r) : null
                    })
                }
                return (0, i.jsx)(s, {
                    ...o,
                    ref: a,
                    children: r
                })
            })).displayName = "".concat(r, ".Slot"), u),
            f = n.forwardRef((t, n) => {
                let {
                    asChild: r,
                    ...o
                } = t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(r ? d : a, {
                    ...o,
                    ref: n
                })
            });
        return f.displayName = "Primitive.".concat(a), {
            ...t,
            [a]: f
        }
    }, {});

    function m(t) {
        let a = n.useRef(t);
        return n.useEffect(() => {
            a.current = t
        }), n.useMemo(() => function() {
            for (var t, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return null == (t = a.current) ? void 0 : t.call(a, ...r)
        }, [])
    }
    var h, v, g = "dismissableLayer.update",
        y = n.createContext({
            layers: new Set,
            layersWithOutsidePointerEventsDisabled: new Set,
            branches: new Set
        }),
        b = n.forwardRef((t, a) => {
            var r, o;
            let {
                disableOutsidePointerEvents: s = !1,
                onEscapeKeyDown: c,
                onPointerDownOutside: d,
                onFocusOutside: p,
                onInteractOutside: h,
                onDismiss: b,
                ...E
            } = t, C = n.useContext(y), [x, P] = n.useState(null), S = null != (r = null == x ? void 0 : x.ownerDocument) ? r : null == (o = globalThis) ? void 0 : o.document, [, T] = n.useState({}), A = u(a, t => P(t)), k = Array.from(C.layers), [I] = [...C.layersWithOutsidePointerEventsDisabled].slice(-1), R = k.indexOf(I), z = x ? k.indexOf(x) : -1, M = C.layersWithOutsidePointerEventsDisabled.size > 0, K = z >= R, L = function(t) {
                var a;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (a = globalThis) ? void 0 : a.document,
                    i = m(t),
                    o = n.useRef(!1),
                    l = n.useRef(() => {});
                return n.useEffect(() => {
                    let t = t => {
                            if (t.target && !o.current) {
                                let a = function() {
                                        w("dismissableLayer.pointerDownOutside", i, n, {
                                            discrete: !0
                                        })
                                    },
                                    n = {
                                        originalEvent: t
                                    };
                                "touch" === t.pointerType ? (r.removeEventListener("click", l.current), l.current = a, r.addEventListener("click", l.current, {
                                    once: !0
                                })) : a()
                            } else r.removeEventListener("click", l.current);
                            o.current = !1
                        },
                        a = window.setTimeout(() => {
                            r.addEventListener("pointerdown", t)
                        }, 0);
                    return () => {
                        window.clearTimeout(a), r.removeEventListener("pointerdown", t), r.removeEventListener("click", l.current)
                    }
                }, [r, i]), {
                    onPointerDownCapture: () => o.current = !0
                }
            }(t => {
                let a = t.target,
                    n = [...C.branches].some(t => t.contains(a));
                K && !n && (null == d || d(t), null == h || h(t), t.defaultPrevented || null == b || b())
            }, S), O = function(t) {
                var a;
                let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (a = globalThis) ? void 0 : a.document,
                    i = m(t),
                    o = n.useRef(!1);
                return n.useEffect(() => {
                    let t = t => {
                        t.target && !o.current && w("dismissableLayer.focusOutside", i, {
                            originalEvent: t
                        }, {
                            discrete: !1
                        })
                    };
                    return r.addEventListener("focusin", t), () => r.removeEventListener("focusin", t)
                }, [r, i]), {
                    onFocusCapture: () => o.current = !0,
                    onBlurCapture: () => o.current = !1
                }
            }(t => {
                let a = t.target;
                [...C.branches].some(t => t.contains(a)) || (null == p || p(t), null == h || h(t), t.defaultPrevented || null == b || b())
            }, S);
            return function(t) {
                var a;
                let r, i = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : null == (a = globalThis) ? void 0 : a.document,
                    o = (r = n.useRef(t), n.useEffect(() => {
                        r.current = t
                    }), n.useMemo(() => function() {
                        for (var t, a = arguments.length, n = Array(a), i = 0; i < a; i++) n[i] = arguments[i];
                        return null == (t = r.current) ? void 0 : t.call(r, ...n)
                    }, []));
                n.useEffect(() => {
                    let t = t => {
                        "Escape" === t.key && o(t)
                    };
                    return i.addEventListener("keydown", t, {
                        capture: !0
                    }), () => i.removeEventListener("keydown", t, {
                        capture: !0
                    })
                }, [o, i])
            }(t => {
                z === C.layers.size - 1 && (null == c || c(t), !t.defaultPrevented && b && (t.preventDefault(), b()))
            }, S), n.useEffect(() => {
                if (x) return s && (0 === C.layersWithOutsidePointerEventsDisabled.size && (v = S.body.style.pointerEvents, S.body.style.pointerEvents = "none"), C.layersWithOutsidePointerEventsDisabled.add(x)), C.layers.add(x), N(), () => {
                    s && 1 === C.layersWithOutsidePointerEventsDisabled.size && (S.body.style.pointerEvents = v)
                }
            }, [x, S, s, C]), n.useEffect(() => () => {
                x && (C.layers.delete(x), C.layersWithOutsidePointerEventsDisabled.delete(x), N())
            }, [x, C]), n.useEffect(() => {
                let t = () => T({});
                return document.addEventListener(g, t), () => document.removeEventListener(g, t)
            }, []), (0, i.jsx)(f.div, {
                ...E,
                ref: A,
                style: {
                    pointerEvents: M ? K ? "auto" : "none" : void 0,
                    ...t.style
                },
                onFocusCapture: l(t.onFocusCapture, O.onFocusCapture),
                onBlurCapture: l(t.onBlurCapture, O.onBlurCapture),
                onPointerDownCapture: l(t.onPointerDownCapture, L.onPointerDownCapture)
            })
        });

    function N() {
        let t = new CustomEvent(g);
        document.dispatchEvent(t)
    }

    function w(t, a, n, i) {
        let {
            discrete: o
        } = i, l = n.originalEvent.target, s = new CustomEvent(t, {
            bubbles: !1,
            cancelable: !0,
            detail: n
        });
        a && l.addEventListener(t, a, {
            once: !0
        }), o ? l && r.flushSync(() => l.dispatchEvent(s)) : l.dispatchEvent(s)
    }
    b.displayName = "DismissableLayer", n.forwardRef((t, a) => {
        let r = n.useContext(y),
            o = n.useRef(null),
            l = u(a, o);
        return n.useEffect(() => {
            let t = o.current;
            if (t) return r.branches.add(t), () => {
                r.branches.delete(t)
            }
        }, [r.branches]), (0, i.jsx)(f.div, {
            ...t,
            ref: l
        })
    }).displayName = "DismissableLayerBranch";
    var E = 0;

    function C() {
        let t = document.createElement("span");
        return t.setAttribute("data-radix-focus-guard", ""), t.tabIndex = 0, t.style.outline = "none", t.style.opacity = "0", t.style.position = "fixed", t.style.pointerEvents = "none", t
    }

    function x(t, a) {
        if ("function" == typeof t) return t(a);
        null != t && (t.current = a)
    }

    function P() {
        for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
        return t => {
            let n = !1,
                r = a.map(a => {
                    let r = x(a, t);
                    return n || "function" != typeof r || (n = !0), r
                });
            if (n) return () => {
                for (let t = 0; t < r.length; t++) {
                    let n = r[t];
                    "function" == typeof n ? n() : x(a[t], null)
                }
            }
        }
    }
    var S = Symbol("radix.slottable");

    function T(t) {
        return n.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === S
    }
    var A = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, a) => {
        var r, o;
        let l, s, c, u = (o = r = "Primitive.".concat(a), (l = n.forwardRef((t, a) => {
                let {
                    children: r,
                    ...i
                } = t;
                if (n.isValidElement(r)) {
                    var o, l;
                    let t, s = (t = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in t && t.isReactWarning ? r.ref : (t = null == (l = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                        c = function(t, a) {
                            let n = {
                                ...a
                            };
                            for (let r in a) {
                                let i = t[r],
                                    o = a[r];
                                /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                    for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
                                    o(...a), i(...a)
                                } : i && (n[r] = i) : "style" === r ? n[r] = {
                                    ...i,
                                    ...o
                                } : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                            }
                            return {
                                ...t,
                                ...n
                            }
                        }(i, r.props);
                    return r.type !== n.Fragment && (c.ref = a ? P(a, s) : s), n.cloneElement(r, c)
                }
                return n.Children.count(r) > 1 ? n.Children.only(null) : null
            })).displayName = "".concat(o, ".SlotClone"), s = l, (c = n.forwardRef((t, a) => {
                let {
                    children: r,
                    ...o
                } = t, l = n.Children.toArray(r), c = l.find(T);
                if (c) {
                    let t = c.props.children,
                        r = l.map(a => a === c ? n.Children.count(t) > 1 ? n.Children.only(null) : n.isValidElement(t) ? t.props.children : null : a);
                    return (0, i.jsx)(s, {
                        ...o,
                        ref: a,
                        children: n.isValidElement(t) ? n.cloneElement(t, void 0, r) : null
                    })
                }
                return (0, i.jsx)(s, {
                    ...o,
                    ref: a,
                    children: r
                })
            })).displayName = "".concat(r, ".Slot"), c),
            d = n.forwardRef((t, n) => {
                let {
                    asChild: r,
                    ...o
                } = t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(r ? u : a, {
                    ...o,
                    ref: n
                })
            });
        return d.displayName = "Primitive.".concat(a), {
            ...t,
            [a]: d
        }
    }, {});

    function k(t) {
        let a = n.useRef(t);
        return n.useEffect(() => {
            a.current = t
        }), n.useMemo(() => function() {
            for (var t, n = arguments.length, r = Array(n), i = 0; i < n; i++) r[i] = arguments[i];
            return null == (t = a.current) ? void 0 : t.call(a, ...r)
        }, [])
    }
    var I = "focusScope.autoFocusOnMount",
        R = "focusScope.autoFocusOnUnmount",
        z = {
            bubbles: !1,
            cancelable: !0
        },
        M = n.forwardRef((t, a) => {
            let {
                loop: r = !1,
                trapped: o = !1,
                onMountAutoFocus: l,
                onUnmountAutoFocus: s,
                ...c
            } = t, [u, d] = n.useState(null), p = k(l), f = k(s), m = n.useRef(null), h = function() {
                for (var t = arguments.length, a = Array(t), r = 0; r < t; r++) a[r] = arguments[r];
                return n.useCallback(P(...a), a)
            }(a, t => d(t)), v = n.useRef({
                paused: !1,
                pause() {
                    this.paused = !0
                },
                resume() {
                    this.paused = !1
                }
            }).current;
            n.useEffect(() => {
                if (o) {
                    let t = function(t) {
                            if (v.paused || !u) return;
                            let a = t.target;
                            u.contains(a) ? m.current = a : O(m.current, {
                                select: !0
                            })
                        },
                        a = function(t) {
                            if (v.paused || !u) return;
                            let a = t.relatedTarget;
                            null !== a && (u.contains(a) || O(m.current, {
                                select: !0
                            }))
                        };
                    document.addEventListener("focusin", t), document.addEventListener("focusout", a);
                    let n = new MutationObserver(function(t) {
                        if (document.activeElement === document.body)
                            for (let a of t) a.removedNodes.length > 0 && O(u)
                    });
                    return u && n.observe(u, {
                        childList: !0,
                        subtree: !0
                    }), () => {
                        document.removeEventListener("focusin", t), document.removeEventListener("focusout", a), n.disconnect()
                    }
                }
            }, [o, u, v.paused]), n.useEffect(() => {
                if (u) {
                    H.add(v);
                    let t = document.activeElement;
                    if (!u.contains(t)) {
                        let a = new CustomEvent(I, z);
                        u.addEventListener(I, p), u.dispatchEvent(a), a.defaultPrevented || (! function(t) {
                            let {
                                select: a = !1
                            } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {}, n = document.activeElement;
                            for (let r of t)
                                if (O(r, {
                                        select: a
                                    }), document.activeElement !== n) return
                        }(K(u).filter(t => "A" !== t.tagName), {
                            select: !0
                        }), document.activeElement === t && O(u))
                    }
                    return () => {
                        u.removeEventListener(I, p), setTimeout(() => {
                            let a = new CustomEvent(R, z);
                            u.addEventListener(R, f), u.dispatchEvent(a), a.defaultPrevented || O(null != t ? t : document.body, {
                                select: !0
                            }), u.removeEventListener(R, f), H.remove(v)
                        }, 0)
                    }
                }
            }, [u, p, f, v]);
            let g = n.useCallback(t => {
                if (!r && !o || v.paused) return;
                let a = "Tab" === t.key && !t.altKey && !t.ctrlKey && !t.metaKey,
                    n = document.activeElement;
                if (a && n) {
                    let a, i = t.currentTarget,
                        [o, l] = [L(a = K(i), i), L(a.reverse(), i)];
                    o && l ? t.shiftKey || n !== l ? t.shiftKey && n === o && (t.preventDefault(), r && O(l, {
                        select: !0
                    })) : (t.preventDefault(), r && O(o, {
                        select: !0
                    })) : n === i && t.preventDefault()
                }
            }, [r, o, v.paused]);
            return (0, i.jsx)(A.div, {
                tabIndex: -1,
                ...c,
                ref: h,
                onKeyDown: g
            })
        });

    function K(t) {
        let a = [],
            n = document.createTreeWalker(t, NodeFilter.SHOW_ELEMENT, {
                acceptNode: t => {
                    let a = "INPUT" === t.tagName && "hidden" === t.type;
                    return t.disabled || t.hidden || a ? NodeFilter.FILTER_SKIP : t.tabIndex >= 0 ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_SKIP
                }
            });
        for (; n.nextNode();) a.push(n.currentNode);
        return a
    }

    function L(t, a) {
        for (let n of t)
            if (! function(t, a) {
                    let {
                        upTo: n
                    } = a;
                    if ("hidden" === getComputedStyle(t).visibility) return !0;
                    for (; t && (void 0 === n || t !== n);) {
                        if ("none" === getComputedStyle(t).display) return !0;
                        t = t.parentElement
                    }
                    return !1
                }(n, {
                    upTo: a
                })) return n
    }

    function O(t) {
        let {
            select: a = !1
        } = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
        if (t && t.focus) {
            var n;
            let r = document.activeElement;
            t.focus({
                preventScroll: !0
            }), t !== r && (n = t) instanceof HTMLInputElement && "select" in n && a && t.select()
        }
    }
    M.displayName = "FocusScope";
    var H = (a = [], {
        add(t) {
            let n = a[0];
            t !== n && (null == n || n.pause()), (a = D(a, t)).unshift(t)
        },
        remove(t) {
            var n;
            null == (n = (a = D(a, t))[0]) || n.resume()
        }
    });

    function D(t, a) {
        let n = [...t],
            r = n.indexOf(a);
        return -1 !== r && n.splice(r, 1), n
    }

    function j(t, a) {
        if ("function" == typeof t) return t(a);
        null != t && (t.current = a)
    }
    var _ = Symbol("radix.slottable");

    function F(t) {
        return n.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === _
    }
    var W = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((t, a) => {
            var r, o;
            let l, s, c, u = (o = r = "Primitive.".concat(a), (l = n.forwardRef((t, a) => {
                    let {
                        children: r,
                        ...i
                    } = t;
                    if (n.isValidElement(r)) {
                        var o, l;
                        let t, s = (t = null == (o = Object.getOwnPropertyDescriptor(r.props, "ref")) ? void 0 : o.get) && "isReactWarning" in t && t.isReactWarning ? r.ref : (t = null == (l = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : l.get) && "isReactWarning" in t && t.isReactWarning ? r.props.ref : r.props.ref || r.ref,
                            c = function(t, a) {
                                let n = {
                                    ...a
                                };
                                for (let r in a) {
                                    let i = t[r],
                                        o = a[r];
                                    /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                        for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
                                        o(...a), i(...a)
                                    } : i && (n[r] = i) : "style" === r ? n[r] = {
                                        ...i,
                                        ...o
                                    } : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                                }
                                return {
                                    ...t,
                                    ...n
                                }
                            }(i, r.props);
                        return r.type !== n.Fragment && (c.ref = a ? function() {
                            for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
                            return t => {
                                let n = !1,
                                    r = a.map(a => {
                                        let r = j(a, t);
                                        return n || "function" != typeof r || (n = !0), r
                                    });
                                if (n) return () => {
                                    for (let t = 0; t < r.length; t++) {
                                        let n = r[t];
                                        "function" == typeof n ? n() : j(a[t], null)
                                    }
                                }
                            }
                        }(a, s) : s), n.cloneElement(r, c)
                    }
                    return n.Children.count(r) > 1 ? n.Children.only(null) : null
                })).displayName = "".concat(o, ".SlotClone"), s = l, (c = n.forwardRef((t, a) => {
                    let {
                        children: r,
                        ...o
                    } = t, l = n.Children.toArray(r), c = l.find(F);
                    if (c) {
                        let t = c.props.children,
                            r = l.map(a => a === c ? n.Children.count(t) > 1 ? n.Children.only(null) : n.isValidElement(t) ? t.props.children : null : a);
                        return (0, i.jsx)(s, {
                            ...o,
                            ref: a,
                            children: n.isValidElement(t) ? n.cloneElement(t, void 0, r) : null
                        })
                    }
                    return (0, i.jsx)(s, {
                        ...o,
                        ref: a,
                        children: r
                    })
                })).displayName = "".concat(r, ".Slot"), c),
                d = n.forwardRef((t, n) => {
                    let {
                        asChild: r,
                        ...o
                    } = t;
                    return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, i.jsx)(r ? u : a, {
                        ...o,
                        ref: n
                    })
                });
            return d.displayName = "Primitive.".concat(a), {
                ...t,
                [a]: d
            }
        }, {}),
        B = (null == (h = globalThis) ? void 0 : h.document) ? n.useLayoutEffect : () => {},
        V = n.forwardRef((t, a) => {
            var o, l;
            let {
                container: s,
                ...c
            } = t, [u, d] = n.useState(!1);
            B(() => d(!0), []);
            let p = s || u && (null == (l = globalThis) || null == (o = l.document) ? void 0 : o.body);
            return p ? r.default.createPortal((0, i.jsx)(W.div, {
                ...c,
                ref: a
            }), p) : null
        });
    V.displayName = "Portal";
    var U = new WeakMap,
        G = new WeakMap,
        X = {},
        q = 0,
        Z = function(t) {
            return t && (t.host || Z(t.parentNode))
        },
        J = function(t, a, n, r) {
            var i = (Array.isArray(t) ? t : [t]).map(function(t) {
                if (a.contains(t)) return t;
                var n = Z(t);
                return n && a.contains(n) ? n : (console.error("aria-hidden", t, "in not contained inside", a, ". Doing nothing"), null)
            }).filter(function(t) {
                return !!t
            });
            X[n] || (X[n] = new WeakMap);
            var o = X[n],
                l = [],
                s = new Set,
                c = new Set(i),
                u = function(t) {
                    t && !s.has(t) && (s.add(t), u(t.parentNode))
                };
            i.forEach(u);
            var d = function(t) {
                t && !c.has(t) && Array.prototype.forEach.call(t.children, function(t) {
                    if (s.has(t)) d(t);
                    else try {
                        var a = t.getAttribute(r),
                            i = null !== a && "false" !== a,
                            c = (U.get(t) || 0) + 1,
                            u = (o.get(t) || 0) + 1;
                        U.set(t, c), o.set(t, u), l.push(t), 1 === c && i && G.set(t, !0), 1 === u && t.setAttribute(n, "true"), i || t.setAttribute(r, "true")
                    } catch (a) {
                        console.error("aria-hidden: cannot operate on ", t, a)
                    }
                })
            };
            return d(a), s.clear(), q++,
                function() {
                    l.forEach(function(t) {
                        var a = U.get(t) - 1,
                            i = o.get(t) - 1;
                        U.set(t, a), o.set(t, i), a || (G.has(t) || t.removeAttribute(r), G.delete(t)), i || t.removeAttribute(n)
                    }), --q || (U = new WeakMap, U = new WeakMap, G = new WeakMap, X = {})
                }
        },
        Y = "right-scroll-bar-position",
        $ = "width-before-scroll-bar";

    function Q(t, a) {
        return "function" == typeof t ? t(a) : t && (t.current = a), t
    }
    var ee = "u" > typeof window ? n.useLayoutEffect : n.useEffect,
        et = new WeakMap,
        ea = function(t) {
            var a = t.sideCar,
                r = (0, o._)(t, ["sideCar"]);
            if (!a) throw Error("Sidecar: please provide `sideCar` property to import the right car");
            var i = a.read();
            if (!i) throw Error("Sidecar medium not found");
            return n.createElement(i, (0, o.a)({}, r))
        };
    ea.isSideCarExport = !0;
    var en = (void 0 === eb && (eb = {}), (void 0 === eN && (eN = function(t) {
            return t
        }), ew = [], eE = !1, eC = {
            read: function() {
                if (eE) throw Error("Sidecar: could not `read` from an `assigned` medium. `read` could be used only with `useMedium`.");
                return ew.length ? ew[ew.length - 1] : null
            },
            useMedium: function(t) {
                var a = eN(t, eE);
                return ew.push(a),
                    function() {
                        ew = ew.filter(function(t) {
                            return t !== a
                        })
                    }
            },
            assignSyncMedium: function(t) {
                for (eE = !0; ew.length;) {
                    var a = ew;
                    ew = [], a.forEach(t)
                }
                ew = {
                    push: function(a) {
                        return t(a)
                    },
                    filter: function() {
                        return ew
                    }
                }
            },
            assignMedium: function(t) {
                eE = !0;
                var a = [];
                if (ew.length) {
                    var n = ew;
                    ew = [], n.forEach(t), a = ew
                }
                var r = function() {
                        var n = a;
                        a = [], n.forEach(t)
                    },
                    i = function() {
                        return Promise.resolve().then(r)
                    };
                i(), ew = {
                    push: function(t) {
                        a.push(t), i()
                    },
                    filter: function(t) {
                        return a = a.filter(t), ew
                    }
                }
            }
        }).options = (0, o.a)({
            async: !0,
            ssr: !1
        }, eb), eC),
        er = function() {},
        ei = n.forwardRef(function(t, a) {
            var r, i, l, s, c = n.useRef(null),
                u = n.useState({
                    onScrollCapture: er,
                    onWheelCapture: er,
                    onTouchMoveCapture: er
                }),
                d = u[0],
                p = u[1],
                f = t.forwardProps,
                m = t.children,
                h = t.className,
                v = t.removeScrollBar,
                g = t.enabled,
                y = t.shards,
                b = t.sideCar,
                N = t.noIsolation,
                w = t.inert,
                E = t.allowPinchZoom,
                C = t.as,
                x = t.gapMode,
                P = (0, o._)(t, ["forwardProps", "children", "className", "removeScrollBar", "enabled", "shards", "sideCar", "noIsolation", "inert", "allowPinchZoom", "as", "gapMode"]),
                S = (r = [c, a], i = function(t) {
                    return r.forEach(function(a) {
                        return Q(a, t)
                    })
                }, (l = (0, n.useState)(function() {
                    return {
                        value: null,
                        callback: i,
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
                })[0]).callback = i, s = l.facade, ee(function() {
                    var t = et.get(s);
                    if (t) {
                        var a = new Set(t),
                            n = new Set(r),
                            i = s.current;
                        a.forEach(function(t) {
                            n.has(t) || Q(t, null)
                        }), n.forEach(function(t) {
                            a.has(t) || Q(t, i)
                        })
                    }
                    et.set(s, r)
                }, [r]), s),
                T = (0, o.a)((0, o.a)({}, P), d);
            return n.createElement(n.Fragment, null, g && n.createElement(b, {
                sideCar: en,
                removeScrollBar: v,
                shards: y,
                noIsolation: N,
                inert: w,
                setCallbacks: p,
                allowPinchZoom: !!E,
                lockRef: c,
                gapMode: x
            }), f ? n.cloneElement(n.Children.only(m), (0, o.a)((0, o.a)({}, T), {
                ref: S
            })) : n.createElement(void 0 === C ? "div" : C, (0, o.a)({}, T, {
                className: h,
                ref: S
            }), m))
        });
    ei.defaultProps = {
        enabled: !0,
        removeScrollBar: !0,
        inert: !1
    }, ei.classNames = {
        fullWidth: $,
        zeroRight: Y
    };
    var eo = function() {
            if ("u" > typeof __webpack_nonce__) return __webpack_nonce__
        },
        el = function() {
            var t = 0,
                a = null;
            return {
                add: function(n) {
                    var r, i;
                    0 == t && (a = function() {
                        if (!document) return null;
                        var t = document.createElement("style");
                        t.type = "text/css";
                        var a = eo();
                        return a && t.setAttribute("nonce", a), t
                    }()) && ((r = a).styleSheet ? r.styleSheet.cssText = n : r.appendChild(document.createTextNode(n)), i = a, (document.head || document.getElementsByTagName("head")[0]).appendChild(i)), t++
                },
                remove: function() {
                    --t || !a || (a.parentNode && a.parentNode.removeChild(a), a = null)
                }
            }
        },
        es = function() {
            var t, a = (t = el(), function(a, r) {
                n.useEffect(function() {
                    return t.add(a),
                        function() {
                            t.remove()
                        }
                }, [a && r])
            });
            return function(t) {
                return a(t.styles, t.dynamic), null
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
            var a, n, r, i, o, l = (a = t, r = (n = window.getComputedStyle(document.body))["padding" === a ? "paddingLeft" : "marginLeft"], i = n["padding" === a ? "paddingTop" : "marginTop"], o = n["padding" === a ? "paddingRight" : "marginRight"], [eu(r), eu(i), eu(o)]),
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
        em = function(t, a, n, r) {
            var i = t.left,
                o = t.top,
                l = t.right,
                s = t.gap;
            return void 0 === n && (n = "margin"), "\n  .".concat("with-scroll-bars-hidden", " {\n   overflow: hidden ").concat(r, ";\n   padding-right: ").concat(s, "px ").concat(r, ";\n  }\n  body[").concat(ef, "] {\n    overflow: hidden ").concat(r, ";\n    overscroll-behavior: contain;\n    ").concat([a && "position: relative ".concat(r, ";"), "margin" === n && "\n    padding-left: ".concat(i, "px;\n    padding-top: ").concat(o, "px;\n    padding-right: ").concat(l, "px;\n    margin-left:0;\n    margin-top:0;\n    margin-right: ").concat(s, "px ").concat(r, ";\n    "), "padding" === n && "padding-right: ".concat(s, "px ").concat(r, ";")].filter(Boolean).join(""), "\n  }\n  \n  .").concat(Y, " {\n    right: ").concat(s, "px ").concat(r, ";\n  }\n  \n  .").concat($, " {\n    margin-right: ").concat(s, "px ").concat(r, ";\n  }\n  \n  .").concat(Y, " .").concat(Y, " {\n    right: 0 ").concat(r, ";\n  }\n  \n  .").concat($, " .").concat($, " {\n    margin-right: 0 ").concat(r, ";\n  }\n  \n  body[").concat(ef, "] {\n    ").concat("--removed-body-scroll-bar-size", ": ").concat(s, "px;\n  }\n")
        },
        eh = function() {
            var t = parseInt(document.body.getAttribute(ef) || "0", 10);
            return isFinite(t) ? t : 0
        },
        ev = function(t) {
            var a = t.noRelative,
                r = t.noImportant,
                i = t.gapMode,
                o = void 0 === i ? "margin" : i;
            n.useEffect(function() {
                return document.body.setAttribute(ef, (eh() + 1).toString()),
                    function() {
                        var t = eh() - 1;
                        t <= 0 ? document.body.removeAttribute(ef) : document.body.setAttribute(ef, t.toString())
                    }
            }, []);
            var l = n.useMemo(function() {
                return ed(o)
            }, [o]);
            return n.createElement(ep, {
                styles: em(l, !a, o, r ? "" : "!important")
            })
        },
        eg = !1;
    if ("u" > typeof window) try {
        var ey = Object.defineProperty({}, "passive", {
            get: function() {
                return eg = !0, !0
            }
        });
        window.addEventListener("test", ey, ey), window.removeEventListener("test", ey, ey)
    } catch (t) {
        eg = !1
    }
    var eb, eN, ew, eE, eC, ex, eP = !!eg && {
            passive: !1
        },
        eS = function(t, a) {
            if (!(t instanceof Element)) return !1;
            var n = window.getComputedStyle(t);
            return "hidden" !== n[a] && (n.overflowY !== n.overflowX || "TEXTAREA" === t.tagName || "visible" !== n[a])
        },
        eT = function(t, a) {
            var n = a.ownerDocument,
                r = a;
            do {
                if ("u" > typeof ShadowRoot && r instanceof ShadowRoot && (r = r.host), eA(t, r)) {
                    var i = ek(t, r);
                    if (i[1] > i[2]) return !0
                }
                r = r.parentNode
            } while (r && r !== n.body) return !1
        },
        eA = function(t, a) {
            return "v" === t ? eS(a, "overflowY") : eS(a, "overflowX")
        },
        ek = function(t, a) {
            return "v" === t ? [a.scrollTop, a.scrollHeight, a.clientHeight] : [a.scrollLeft, a.scrollWidth, a.clientWidth]
        },
        eI = function(t, a, n, r, i) {
            var o, l = (o = window.getComputedStyle(a).direction, "h" === t && "rtl" === o ? -1 : 1),
                s = l * r,
                c = n.target,
                u = a.contains(c),
                d = !1,
                p = s > 0,
                f = 0,
                m = 0;
            do {
                var h = ek(t, c),
                    v = h[0],
                    g = h[1] - h[2] - l * v;
                (v || g) && eA(t, c) && (f += g, m += v), c = c instanceof ShadowRoot ? c.host : c.parentNode
            } while (!u && c !== document.body || u && (a.contains(c) || a === c)) return (p && (i && 1 > Math.abs(f) || !i && s > f) || !p && (i && 1 > Math.abs(m) || !i && -s > m)) && (d = !0), d
        },
        eR = function(t) {
            return "changedTouches" in t ? [t.changedTouches[0].clientX, t.changedTouches[0].clientY] : [0, 0]
        },
        ez = function(t) {
            return [t.deltaX, t.deltaY]
        },
        eM = function(t) {
            return t && "current" in t ? t.current : t
        },
        eK = 0,
        eL = [],
        eO = (ex = function(t) {
            var a = n.useRef([]),
                r = n.useRef([0, 0]),
                i = n.useRef(),
                l = n.useState(eK++)[0],
                s = n.useState(es)[0],
                c = n.useRef(t);
            n.useEffect(function() {
                c.current = t
            }, [t]), n.useEffect(function() {
                if (t.inert) {
                    document.body.classList.add("block-interactivity-".concat(l));
                    var a = (0, o.b)([t.lockRef.current], (t.shards || []).map(eM), !0).filter(Boolean);
                    return a.forEach(function(t) {
                            return t.classList.add("allow-interactivity-".concat(l))
                        }),
                        function() {
                            document.body.classList.remove("block-interactivity-".concat(l)), a.forEach(function(t) {
                                return t.classList.remove("allow-interactivity-".concat(l))
                            })
                        }
                }
            }, [t.inert, t.lockRef.current, t.shards]);
            var u = n.useCallback(function(t, a) {
                    if ("touches" in t && 2 === t.touches.length || "wheel" === t.type && t.ctrlKey) return !c.current.allowPinchZoom;
                    var n, o = eR(t),
                        l = r.current,
                        s = "deltaX" in t ? t.deltaX : l[0] - o[0],
                        u = "deltaY" in t ? t.deltaY : l[1] - o[1],
                        d = t.target,
                        p = Math.abs(s) > Math.abs(u) ? "h" : "v";
                    if ("touches" in t && "h" === p && "range" === d.type) return !1;
                    var f = eT(p, d);
                    if (!f) return !0;
                    if (f ? n = p : (n = "v" === p ? "h" : "v", f = eT(p, d)), !f) return !1;
                    if (!i.current && "changedTouches" in t && (s || u) && (i.current = n), !n) return !0;
                    var m = i.current || n;
                    return eI(m, a, t, "h" === m ? s : u, !0)
                }, []),
                d = n.useCallback(function(t) {
                    if (eL.length && eL[eL.length - 1] === s) {
                        var n = "deltaY" in t ? ez(t) : eR(t),
                            r = a.current.filter(function(a) {
                                var r;
                                return a.name === t.type && (a.target === t.target || t.target === a.shadowParent) && (r = a.delta, r[0] === n[0] && r[1] === n[1])
                            })[0];
                        if (r && r.should) t.cancelable && t.preventDefault();
                        else if (!r) {
                            var i = (c.current.shards || []).map(eM).filter(Boolean).filter(function(a) {
                                return a.contains(t.target)
                            });
                            (i.length > 0 ? u(t, i[0]) : !c.current.noIsolation) && t.cancelable && t.preventDefault()
                        }
                    }
                }, []),
                p = n.useCallback(function(t, n, r, i) {
                    var o = {
                        name: t,
                        delta: n,
                        target: r,
                        should: i,
                        shadowParent: function(t) {
                            for (var a = null; null !== t;) t instanceof ShadowRoot && (a = t.host, t = t.host), t = t.parentNode;
                            return a
                        }(r)
                    };
                    a.current.push(o), setTimeout(function() {
                        a.current = a.current.filter(function(t) {
                            return t !== o
                        })
                    }, 1)
                }, []),
                f = n.useCallback(function(t) {
                    r.current = eR(t), i.current = void 0
                }, []),
                m = n.useCallback(function(a) {
                    p(a.type, ez(a), a.target, u(a, t.lockRef.current))
                }, []),
                h = n.useCallback(function(a) {
                    p(a.type, eR(a), a.target, u(a, t.lockRef.current))
                }, []);
            n.useEffect(function() {
                return eL.push(s), t.setCallbacks({
                        onScrollCapture: m,
                        onWheelCapture: m,
                        onTouchMoveCapture: h
                    }), document.addEventListener("wheel", d, eP), document.addEventListener("touchmove", d, eP), document.addEventListener("touchstart", f, eP),
                    function() {
                        eL = eL.filter(function(t) {
                            return t !== s
                        }), document.removeEventListener("wheel", d, eP), document.removeEventListener("touchmove", d, eP), document.removeEventListener("touchstart", f, eP)
                    }
            }, []);
            var v = t.removeScrollBar,
                g = t.inert;
            return n.createElement(n.Fragment, null, g ? n.createElement(s, {
                styles: "\n  .block-interactivity-".concat(l, " {pointer-events: none;}\n  .allow-interactivity-").concat(l, " {pointer-events: all;}\n")
            }) : null, v ? n.createElement(ev, {
                gapMode: t.gapMode
            }) : null)
        }, en.useMedium(ex), ea),
        eH = n.forwardRef(function(t, a) {
            return n.createElement(ei, (0, o.a)({}, t, {
                ref: a,
                sideCar: eO
            }))
        });
    eH.classNames = ei.classNames, t.s(["D", 0, b, "F", 0, M, "P", 0, V, "R", 0, eH, "h", 0, function(t, a, n) {
        void 0 === n && (n = "data-aria-hidden");
        var r = Array.from(Array.isArray(t) ? t : [t]),
            i = a || ("u" < typeof document ? null : (Array.isArray(t) ? t[0] : t).ownerDocument.body);
        return i ? (r.push.apply(r, Array.from(i.querySelectorAll("[aria-live]"))), J(r, i, n, "aria-hidden")) : function() {
            return null
        }
    }, "u", 0, function() {
        n.useEffect(() => {
            var t, a;
            let n = document.querySelectorAll("[data-radix-focus-guard]");
            return document.body.insertAdjacentElement("afterbegin", null != (t = n[0]) ? t : C()), document.body.insertAdjacentElement("beforeend", null != (a = n[1]) ? a : C()), E++, () => {
                1 === E && document.querySelectorAll("[data-radix-focus-guard]").forEach(t => t.remove()), E--
            }
        }, [])
    }])
}, 94572, t => {
    "use strict";
    (0, t.i(751818).s)(".bg-common-backdrop{background-color:var(--color-common-backdrop)}.shadow-transient-high{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-400) var(--size-800) -1px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-1200) var(--size-1400) -1.5px var(--alpha-color-shadow-subtle)}.shadow-transient-low{box-shadow:var(--size-0) var(--size-50) var(--size-100) -.5px var(--alpha-color-shadow-subtle),var(--size-0) var(--size-250) var(--size-500) -.75px var(--alpha-color-shadow-subtle)}.foundation-web-portal-zindex{z-index:1050}.fui-future-shadow-affixed-low{box-shadow:0 0 var(--size-100) 0 var(--fui-future-alpha-color-shadow-subtle),0 0 var(--size-500) 0 var(--fui-future-alpha-color-shadow-subtle)}:root{--light-mode-stroke-contrast-alpha:rgba(27,37,75,.5);--dark-mode-stroke-contrast-alpha:rgba(208,217,251,.4);--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-light-mode-shadow-subtle:rgba(0,0,0,.08);--alpha-dark-mode-shadow-subtle:rgba(4,4,8,.25);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){:root{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.light-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}.dark-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}.system-theme{--color-stroke-contrast-alpha:var(--light-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-light-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--light-mode-system-contrast)}@media (prefers-color-scheme:dark){.system-theme{--color-stroke-contrast-alpha:var(--dark-mode-stroke-contrast-alpha);--alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-shadow-subtle:var(--alpha-dark-mode-shadow-subtle);--fui-future-alpha-color-system-progress:var(--dark-mode-system-contrast)}}.stroke-contrast-alpha{border-color:var(--color-stroke-contrast-alpha)}.foundation-web-input.focus-within\\:stroke-system-emphasis:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-emphasis)}.foundation-web-input.focus-within\\:stroke-system-alert:focus-within{box-shadow:inset 0 0 0 1px var(--color-system-alert)}"), t.s([])
}, 634865, 860938, t => {
    "use strict";
    var a = t.i(76145),
        n = t.i(197649),
        r = t.i(416340),
        i = t.i(916785),
        o = t.i(58233),
        l = t.i(78794);
    (0, t.i(751818).s)("@keyframes rotation{0%{transform:rotate(0deg)}to{transform:rotate(359deg)}}.foundation-web-loading-spinner{animation:rotation 1s linear infinite normal}");
    let s = t => {
        let {
            width: a,
            height: n
        } = t;
        return r.default.createElement("svg", {
            className: "foundation-web-loading-spinner",
            width: a,
            height: n,
            viewBox: "0 0 20 20",
            fill: "none",
            xmlns: "http://www.w3.org/2000/svg"
        }, r.default.createElement("path", {
            fillRule: "evenodd",
            clipRule: "evenodd",
            fill: "currentColor",
            d: "M10 2.75C8.56609 2.75 7.16438 3.1752 5.97212 3.97185C4.77986 4.76849 3.85061 5.90078 3.30188 7.22554C2.75314 8.55031 2.60957 10.008 2.88931 11.4144C3.16905 12.8208 3.85955 14.1126 4.87348 15.1265C5.88741 16.1405 7.17924 16.831 8.5856 17.1107C9.99196 17.3904 11.4497 17.2469 12.7745 16.6981C14.0992 16.1494 15.2315 15.2201 16.0282 14.0279C16.8248 12.8356 17.25 11.4339 17.25 10C17.25 9.58579 17.5858 9.25 18 9.25C18.4142 9.25 18.75 9.58579 18.75 10C18.75 11.7306 18.2368 13.4223 17.2754 14.8612C16.3139 16.3002 14.9473 17.4217 13.3485 18.0839C11.7496 18.7462 9.9903 18.9195 8.29296 18.5819C6.59563 18.2443 5.03653 17.4109 3.81282 16.1872C2.58911 14.9635 1.75575 13.4044 1.41813 11.707C1.08051 10.0097 1.25379 8.25037 1.91606 6.65152C2.57832 5.05267 3.69983 3.6861 5.13876 2.72464C6.57769 1.76318 8.26942 1.25 10 1.25C10.4142 1.25 10.75 1.58579 10.75 2C10.75 2.41421 10.4142 2.75 10 2.75Z"
        }))
    };
    t.s(["LoadingSpinner", 0, s], 860938);
    var c = t.i(976289);
    t.i(221628);
    let u = {
            Large: 24,
            Medium: 20,
            Small: 16,
            XSmall: 12
        },
        d = {
            Large: ["radius-medium", "text-label-large", "height-1200", "padding-x-medium"],
            Medium: ["radius-medium", "text-label-medium", "height-1000", "padding-x-medium"],
            Small: ["radius-medium", "text-label-small", "height-800", "padding-x-small"],
            XSmall: ["radius-small", "text-label-small", "height-600", "padding-x-small"]
        },
        p = {
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
        m = (0, r.forwardRef)((t, m) => {
            var {
                children: h,
                className: v,
                style: g,
                isDisabled: y = !1,
                isLoading: b = !1,
                icon: N,
                size: w = "Large",
                variant: E = "Emphasis",
                asChild: C
            } = t, x = (0, a._)(t, ["children", "className", "style", "isDisabled", "isLoading", "icon", "size", "variant", "asChild"]);
            let P = (0, n.default)("foundation-web-button", y ? l.disabledOpacity : [o.interactable, "cursor-pointer"], "relative flex items-center justify-center stroke-none padding-y-none select-none", d[w], y ? f[E] : p[E], v),
                S = Object.assign({
                    textDecoration: "none"
                }, g),
                T = t => r.default.createElement(r.default.Fragment, null, r.default.createElement(o.StateLayer, null), b && r.default.createElement("div", {
                    "aria-hidden": "true",
                    className: "absolute flex"
                }, r.default.createElement(s, {
                    width: u[w],
                    height: u[w]
                })), r.default.createElement("span", {
                    className: (0, n.default)("flex items-center min-width-0", "Large" === w || "Medium" === w ? "gap-small" : "gap-xsmall", b && "invisible")
                }, N && r.default.createElement(c.Icon, {
                    name: N,
                    size: w
                }), r.default.createElement("span", {
                    className: "padding-y-xsmall text-truncate-end text-no-wrap"
                }, t)));
            if (C) {
                let t = (0, a._)(x, ["as"]),
                    n = r.default.Children.only(h);
                return r.default.createElement(i.S, Object.assign({
                    ref: m
                }, t, {
                    className: P,
                    style: S,
                    "aria-disabled": y || void 0
                }), r.default.cloneElement(n, {}, T(n.props.children)))
            }
            if ("a" === x.as) {
                let {
                    as: t,
                    href: n
                } = x, i = (0, a._)(x, ["as", "href"]);
                return r.default.createElement("a", Object.assign({
                    ref: m
                }, i, {
                    "aria-disabled": y,
                    href: y ? void 0 : n,
                    className: P,
                    style: S
                }), T(h))
            }
            let A = (0, a._)(x, ["as"]);
            return r.default.createElement("button", Object.assign({
                ref: m,
                type: "button"
            }, A, {
                disabled: y,
                className: P,
                style: S
            }), T(h))
        });
    t.s(["Button", 0, m], 634865)
}, 976289, t => {
    "use strict";
    var a = t.i(76145),
        n = t.i(197649),
        r = t.i(416340);
    let i = {
            XSmall: "size-[var(--icon-size-xsmall)]",
            Small: "size-[var(--icon-size-small)]",
            Medium: "size-[var(--icon-size-medium)]",
            Large: "size-[var(--icon-size-large)]",
            XLarge: "size-[var(--icon-size-xlarge)]",
            XXLarge: "size-[var(--icon-size-xxlarge)]"
        },
        o = r.default.forwardRef((t, o) => {
            var {
                name: l,
                size: s = "Medium",
                className: c,
                children: u
            } = t, d = (0, a._)(t, ["name", "size", "className", "children"]);
            return r.default.createElement("span", Object.assign({
                ref: o,
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, n.default)("grow-0 shrink-0 basis-auto icon", l, i[s], c)
            }, d))
        });
    o.displayName = "Icon", t.s(["Icon", 0, o])
}, 899659, t => {
    "use strict";
    var a = t.i(76145),
        n = t.i(197649),
        r = t.i(416340),
        i = t.i(976289),
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
            className: p
        } = t, f = (0, a._)(t, ["variant", "size", "isCircular", "className"]);
        return r.default.createElement("button", Object.assign({
            type: "button",
            className: (0, n.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", o.interactable, s[c], l[u], d && "radius-circle", p)
        }, f), r.default.createElement(o.StateLayer, null), r.default.createElement(i.Icon, {
            name: "icon-regular-x",
            size: u
        }))
    }])
}, 58233, t => {
    "use strict";
    var a = t.i(197649),
        n = t.i(416340);
    t.s(["StateLayer", 0, t => {
        let {
            className: r
        } = t;
        return n.default.createElement("div", {
            "aria-hidden": !0,
            "data-testid": "foundation-web-state-layer",
            className: (0, a.default)("absolute inset-[0] transition-colors group-hover/interactable:bg-[var(--color-state-hover)] group-active/interactable:bg-[var(--color-state-press)] group-disabled/interactable:bg-none", r)
        })
    }, "interactable", 0, "relative clip group/interactable focus-visible:outline-focus disabled:outline-none"])
}, 438082, t => {
    "use strict";
    var a, n = t.i(416340),
        r = (null == (a = globalThis) ? void 0 : a.document) ? n.useLayoutEffect : () => {},
        i = n[" useId ".trim().toString()] || (() => {}),
        o = 0;
    t.s(["u", 0, function(t) {
        let [a, l] = n.useState(i());
        return r(() => {
            t || l(t => null != t ? t : String(o++))
        }, [t]), t || (a ? "radix-".concat(a) : "")
    }])
}, 916785, t => {
    "use strict";
    let a, n, r;
    var i = t.i(416340),
        o = t.i(221628);

    function l(t, a) {
        if ("function" == typeof t) return t(a);
        null != t && (t.current = a)
    }
    var s = Symbol.for("react.lazy"),
        c = i[" use ".trim().toString()];

    function u(t) {
        var a;
        return null != t && "object" == typeof t && "$$typeof" in t && t.$$typeof === s && "_payload" in t && "object" == typeof(a = t._payload) && null !== a && "then" in a
    }
    var d = ((r = i.forwardRef((t, a) => {
            let {
                children: n,
                ...r
            } = t;
            if (u(n) && "function" == typeof c && (n = c(n._payload)), i.isValidElement(n)) {
                var o, s, d;
                let t, c = (t = null == (s = Object.getOwnPropertyDescriptor((o = n).props, "ref")) ? void 0 : s.get) && "isReactWarning" in t && t.isReactWarning ? o.ref : (t = null == (d = Object.getOwnPropertyDescriptor(o, "ref")) ? void 0 : d.get) && "isReactWarning" in t && t.isReactWarning ? o.props.ref : o.props.ref || o.ref,
                    u = function(t, a) {
                        let n = {
                            ...a
                        };
                        for (let r in a) {
                            let i = t[r],
                                o = a[r];
                            /^on[A-Z]/.test(r) ? i && o ? n[r] = function() {
                                for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
                                let r = o(...a);
                                return i(...a), r
                            } : i && (n[r] = i) : "style" === r ? n[r] = {
                                ...i,
                                ...o
                            } : "className" === r && (n[r] = [i, o].filter(Boolean).join(" "))
                        }
                        return {
                            ...t,
                            ...n
                        }
                    }(r, n.props);
                return n.type !== i.Fragment && (u.ref = a ? function() {
                    for (var t = arguments.length, a = Array(t), n = 0; n < t; n++) a[n] = arguments[n];
                    return t => {
                        let n = !1,
                            r = a.map(a => {
                                let r = l(a, t);
                                return n || "function" != typeof r || (n = !0), r
                            });
                        if (n) return () => {
                            for (let t = 0; t < r.length; t++) {
                                let n = r[t];
                                "function" == typeof n ? n() : l(a[t], null)
                            }
                        }
                    }
                }(a, c) : c), i.cloneElement(n, u)
            }
            return i.Children.count(n) > 1 ? i.Children.only(null) : null
        })).displayName = "".concat("Slot", ".SlotClone"), a = r, (n = i.forwardRef((t, n) => {
            let {
                children: r,
                ...l
            } = t;
            u(r) && "function" == typeof c && (r = c(r._payload));
            let s = i.Children.toArray(r),
                d = s.find(f);
            if (d) {
                let t = d.props.children,
                    r = s.map(a => a === d ? i.Children.count(t) > 1 ? i.Children.only(null) : i.isValidElement(t) ? t.props.children : null : a);
                return (0, o.jsx)(a, {
                    ...l,
                    ref: n,
                    children: i.isValidElement(t) ? i.cloneElement(t, void 0, r) : null
                })
            }
            return (0, o.jsx)(a, {
                ...l,
                ref: n,
                children: r
            })
        })).displayName = "".concat("Slot", ".Slot"), n),
        p = Symbol("radix.slottable");

    function f(t) {
        return i.isValidElement(t) && "function" == typeof t.type && "__radixId" in t.type && t.type.__radixId === p
    }
    t.s(["S", 0, d])
}, 751818, t => {
    "use strict";
    t.s(["s", 0, function(t, a) {
        void 0 === a && (a = {});
        var n = a.insertAt;
        if (t && "u" > typeof document) {
            var r = document.head || document.getElementsByTagName("head")[0],
                i = document.createElement("style");
            i.type = "text/css", "top" === n && r.firstChild ? r.insertBefore(i, r.firstChild) : r.appendChild(i), i.styleSheet ? i.styleSheet.cssText = t : i.appendChild(document.createTextNode(t))
        }
    }])
}, 76145, t => {
    "use strict";
    var a = function() {
        return (a = Object.assign || function(t) {
            for (var a, n = 1, r = arguments.length; n < r; n++)
                for (var i in a = arguments[n]) Object.prototype.hasOwnProperty.call(a, i) && (t[i] = a[i]);
            return t
        }).apply(this, arguments)
    };
    t.s(["_", 0, function(t, a) {
        var n = {};
        for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && 0 > a.indexOf(r) && (n[r] = t[r]);
        if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
            var i = 0;
            for (r = Object.getOwnPropertySymbols(t); i < r.length; i++) 0 > a.indexOf(r[i]) && Object.prototype.propertyIsEnumerable.call(t, r[i]) && (n[r[i]] = t[r[i]])
        }
        return n
    }, "a", () => a, "b", 0, function(t, a, n) {
        if (n || 2 == arguments.length)
            for (var r, i = 0, o = a.length; i < o; i++) !r && i in a || (r || (r = Array.prototype.slice.call(a, 0, i)), r[i] = a[i]);
        return t.concat(r || Array.prototype.slice.call(a))
    }])
}, 78794, t => {
    "use strict";
    t.s(["disabledOpacity", 0, "opacity-[0.5]"])
}]);

//# debugId=fb7c0df9-7e51-6d82-d69a-9c2ec7ffa7c4
//# sourceMappingURL=1g05jgt8v72cg.js.map