;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "46c16e97-4f2a-f14d-695a-7834530c52f7")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 118413, e => {
    "use strict";
    var a = e.i(157700);
    let t = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "analyticsChartLoadEventstreamEnabled",
            defaultValue: !1
        }),
        n = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1
        }),
        i = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "visibleAssetIdInPersonalizationEnabled",
            defaultValue: !1
        }),
        r = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentationTemplatesEnabled",
            defaultValue: !1
        }),
        s = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomMetricsBackendEnabled",
            defaultValue: !1
        }),
        l = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0
        }),
        o = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1
        }),
        c = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0
        }),
        d = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0
        }),
        u = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0
        }),
        m = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        p = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        y = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1
        }),
        g = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1
        }),
        b = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantStreamSilenceRecoveryEnabled",
            defaultValue: !1
        }),
        h = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1
        }),
        f = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1
        }),
        v = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1
        }),
        N = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1
        }),
        T = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1
        }),
        k = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1
        }),
        I = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1
        }),
        C = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1
        }),
        P = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1
        }),
        x = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1
        }),
        A = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1
        }),
        w = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1
        }),
        S = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1
        }),
        E = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1
        }),
        H = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1
        }),
        M = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1
        }),
        R = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1
        });
    e.s(["acquisitionMigrationMetricsEnabled", 0, o, "analyticsChartLoadEventstreamEnabled", 0, t, "isAnalyticsAssistantChatEnabled", 0, g, "isAnalyticsAssistantIssueBannerEnabled", 0, h, "isAnalyticsAssistantStreamSilenceRecoveryEnabled", 0, b, "isAnalyticsMetricAwareYAxisFormatterEnabled", 0, C, "isAssistantChartOverflowMenuEnabled", 0, I, "isClientSessionDetailsV2Enabled", 0, R, "isClientSessionsEnabled", 0, A, "isCustomDashboardsLocalStorageEnabled", 0, P, "isCustomMetricsBackendEnabled", 0, s, "isEhdResultsAlwaysFetched", 0, S, "isEhdResultsEnabled", 0, w, "isExperimentNullControlValueEnabled", 0, d, "isExperimentRolloutEnabled", 0, u, "isExperimentSegmentationEnabled", 0, M, "isExperimentTargetingEnabled", 0, l, "isExperimentationTemplatesEnabled", 0, r, "isGeneralBreakGlassBannerEnabled", 0, m, "isJourneyEventsEnabled", 0, x, "isLimitedAnalyticsAdminMonitoringNavigationEnabled", 0, n, "isMetricVariantChartStateEnabled", 0, E, "isMonetizationBreakGlassBannerEnabled", 0, p, "isPeriodSummaryBridgeEnabled", 0, H, "isPlayerFeedbackExampleCommentsEnabled", 0, y, "isRotraceMetricEnabled", 0, v, "isTargetingConfigsEnabled", 0, c, "isTelemetryMigrationEnabled", 0, N, "isTreemapColorBySiblingProportionEnabled", 0, k, "showCreatorRewardsReportingDisclaimer", 0, f, "showVideoServiceDashboard", 0, T, "visibleAssetIdInPersonalizationEnabled", 0, i])
}, 97782, e => {
    "use strict";
    var a = e.i(730530),
        t = e.i(881670);
    let n = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, a.translationKey)("Heading.Monetization", t.TranslationNamespace.Analytics)
        },
        i = {
            path: "/dashboard/analytics",
            pathPattern: /\/dashboard\/analytics/,
            title: (0, a.translationKey)("Heading.Analytics", t.TranslationNamespace.Navigation)
        },
        r = {
            path: "/experiments",
            pathPattern: /\/experiments(?!\/)/,
            title: (0, a.translationKey)("Heading.Experiments", t.TranslationNamespace.Navigation)
        },
        s = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, a.translationKey)("Label.DeveloperProducts", t.TranslationNamespace.Navigation),
            group: n
        },
        l = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, a.translationKey)("Label.GamePasses", t.TranslationNamespace.Navigation),
            group: n
        },
        o = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, a.translationKey)("Label.ThirdPartyAvatarItemCommissions", t.TranslationNamespace.Navigation),
            group: n
        },
        c = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, a.translationKey)("Heading.ItemAnalytics", t.TranslationNamespace.Analytics)
        },
        d = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, a.translationKey)("Heading.Ads", t.TranslationNamespace.Navigation),
            group: n
        },
        u = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, a.translationKey)("Heading.Subscriptions", t.TranslationNamespace.Navigation),
            group: n
        },
        m = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, a.translationKey)("Heading.MemoryStores", t.TranslationNamespace.Navigation)
        },
        p = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, a.translationKey)("Heading.DataStores", t.TranslationNamespace.Navigation)
        },
        y = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, a.translationKey)("Heading.HttpService", t.TranslationNamespace.Navigation)
        },
        g = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, a.translationKey)("Heading.MessagingService", t.TranslationNamespace.Navigation)
        },
        b = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, a.translationKey)("Heading.SpeechToText", t.TranslationNamespace.Navigation)
        },
        h = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, a.translationKey)("Heading.TextToSpeech", t.TranslationNamespace.Navigation)
        },
        f = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, a.translationKey)("Heading.VideoService", t.TranslationNamespace.Navigation)
        },
        v = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, a.translationKey)("Heading.CreatorRewards", t.TranslationNamespace.Navigation),
            group: n
        },
        N = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, a.translationKey)("Heading.RobloxPlusDeveloperProgram", t.TranslationNamespace.Navigation),
            group: n
        },
        T = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, a.translationKey)("Heading.Performance", t.TranslationNamespace.Navigation)
        },
        k = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, a.translationKey)("Heading.Crashes", t.TranslationNamespace.Analytics)
        },
        I = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, a.translationKey)("Heading.ErrorReport", t.TranslationNamespace.Navigation)
        },
        C = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, a.translationKey)("Heading.Demographics", t.TranslationNamespace.Navigation)
        },
        P = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, a.translationKey)("Heading.Economy", t.TranslationNamespace.Navigation)
        },
        x = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, a.translationKey)("Heading.Funnels", t.TranslationNamespace.Navigation)
        },
        A = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, a.translationKey)("Heading.Explore", t.TranslationNamespace.Navigation)
        },
        w = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, a.translationKey)("Heading.CustomDashboards", t.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, a.translationKey)("Heading.Retention", t.TranslationNamespace.Navigation)
        },
        E = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, a.translationKey)("Heading.Engagement", t.TranslationNamespace.Navigation)
        },
        H = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, a.translationKey)("Heading.Acquisition", t.TranslationNamespace.Navigation),
            group: i
        },
        M = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, a.translationKey)("Heading.Acquisition", t.TranslationNamespace.Navigation),
            group: i
        },
        R = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, a.translationKey)("Heading.CustomEvents", t.TranslationNamespace.Navigation)
        },
        L = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, a.translationKey)("Heading.Journeys", t.TranslationNamespace.Navigation)
        },
        j = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", t.TranslationNamespace.Navigation)
        },
        D = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", t.TranslationNamespace.Navigation)
        },
        G = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, a.translationKey)("Heading.Journeys", t.TranslationNamespace.Navigation)
        },
        F = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, a.translationKey)("Heading.Feedback", t.TranslationNamespace.PlayerFeedback)
        },
        B = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, a.translationKey)("Heading.ConfigsHistory", t.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.ConfigHistory", t.TranslationNamespace.Navigation)
        },
        U = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, a.translationKey)("Heading.Configs", t.TranslationNamespace.Navigation)
        },
        z = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, a.translationKey)("Heading.ConfigCreate", t.TranslationNamespace.Navigation)
        },
        K = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, a.translationKey)("Heading.Alerts", t.TranslationNamespace.Navigation)
        },
        V = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, a.translationKey)("Heading.CreateAlert", t.TranslationNamespace.ExperienceAlerts)
        },
        O = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, a.translationKey)("Heading.ConfigureAlert", t.TranslationNamespace.Navigation)
        },
        q = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, a.translationKey)("Heading.CustomMatchmaking", t.TranslationNamespace.Matchmaking)
        },
        _ = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, a.translationKey)("Heading.Commerce", t.TranslationNamespace.Navigation),
            group: n
        },
        J = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, a.translationKey)("Heading.Assistant", t.TranslationNamespace.Analytics)
        },
        W = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, a.translationKey)("Heading.Assistant", t.TranslationNamespace.Analytics)
        },
        Q = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, a.translationKey)("Heading.Assistant", t.TranslationNamespace.Analytics)
        },
        X = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, a.translationKey)("Heading.ExperimentsCreate", t.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, a.translationKeyWithoutNamespace)("Heading.Experimentation"),
            group: r
        },
        Y = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, a.translationKey)("Heading.RecommendationService", t.TranslationNamespace.Navigation)
        },
        $ = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, a.translationKey)("Heading.SafetyOverview", t.TranslationNamespace.Analytics),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.Safety", t.TranslationNamespace.Navigation)
        },
        Z = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, a.translationKey)("Heading.Overview", t.TranslationNamespace.Navigation)
        },
        ee = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, a.translationKey)("Heading.Thumbnails", t.TranslationNamespace.Navigation)
        },
        ea = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, a.translationKey)("Heading.Notifications", t.TranslationNamespace.Navigation)
        },
        et = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, a.translationKey)("Heading.Subscriptions", t.TranslationNamespace.Navigation),
            group: n
        },
        en = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, a.translationKey)("Heading.GenerativeAI", t.TranslationNamespace.Navigation)
        },
        ei = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, a.translationKey)("Heading.AvatarCreationTokens", t.TranslationNamespace.AvatarAnalytics),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.AvatarCreationTokens", t.TranslationNamespace.Navigation),
            group: n
        },
        er = [M, H, E, S, n, s, l, o, c, d, u, m, p, y, g, b, h, f, en, v, N, T, k, I, C, P, x, L, j, D, G, A, w, R, J, W, Q, F, B, U, z, q, _, $, Z, i, r, X, Y, ee, ea, et, V, O, K, ei];
    e.s(["analyticsAgentNavigationItem", 0, W, "analyticsAiChatNavigationItem", 0, Q, "analyticsAlertConfifurationNavigationItem", 0, O, "analyticsAlertCreationNavigationItem", 0, V, "analyticsAlertsNavigationItem", 0, K, "analyticsAnalyticsHomeNavigationItem", 0, i, "analyticsAssistantNavigationItem", 0, J, "analyticsAudienceNavigationItem", 0, C, "analyticsAvatarCreationTokensNavigationItem", 0, ei, "analyticsBountyPayoutsNavigationItem", 0, N, "analyticsCommerceNavigationItem", 0, _, "analyticsConfigsHistoryNavigationItem", 0, B, "analyticsConfigsNavigationItem", 0, U, "analyticsCrashesNavigationItem", 0, k, "analyticsCreationOverviewNavigationItem", 0, Z, "analyticsCustomDashboardsManageNavigationItem", 0, w, "analyticsCustomEventsNavigationItem", 0, R, "analyticsDataStoresNavigationItem", 0, p, "analyticsEngagementNavigationItem", 0, E, "analyticsErrorReportNavigationItem", 0, I, "analyticsExperienceCreatorRewardsNavigationItem", 0, v, "analyticsExperienceSubscriptionsNavigationItem", 0, et, "analyticsExperimentsCreateNavigationItem", 0, X, "analyticsExperimentsNavigationItem", 0, r, "analyticsExploreNavigationItem", 0, A, "analyticsFeedbackNavigationItem", 0, F, "analyticsGenerativeAINavigationItem", 0, en, "analyticsHttpServiceNavigationItem", 0, y, "analyticsImmersiveAdsNavigationItem", 0, d, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, o, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, s, "analyticsItemMonetizationPassesNavigationItem", 0, l, "analyticsMatchmakingNavigationItem", 0, q, "analyticsMemoryStoresNavigationItem", 0, m, "analyticsMessagingServiceNavigationItem", 0, g, "analyticsMonetizationNavigationItem", 0, n, "analyticsNotificationsNavigationItem", 0, ea, "analyticsPerformanceNavigationItem", 0, T, "analyticsRecommendationServiceNavigationItem", 0, Y, "analyticsRecommendedEventsEconomyNavigationItem", 0, P, "analyticsRecommendedEventsFunnelsNavigationItem", 0, x, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, j, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, D, "analyticsRecommendedEventsJourneyNavigationItem", 0, L, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, G, "analyticsRetentionNavigationItem", 0, S, "analyticsSafetyNavigationItem", 0, $, "analyticsSpeechToTextNavigationItem", 0, b, "analyticsSubscriptionsNavigationItem", 0, u, "analyticsTextToSpeechNavigationItem", 0, h, "analyticsUserAcquisitionNavigationItem", 0, H, "analyticsUserAcquisitionRFYNavigationItem", 0, M, "analyticsVideoServiceNavigationItem", 0, f, "getAnalyticsNavigationItemFromPath", 0, function(e) {
        return er.find(a => a.pathPattern.test(e))
    }])
}, 533968, e => {
    "use strict";
    var a = e.i(185915);
    e.s(["getResponseFromError", () => a.default])
}, 105098, 995721, e => {
    "use strict";
    var a = e.i(416340);
    let t = (0, a.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    t.displayName = "LookDetails", e.s(["default", 0, t], 995721), e.s(["default", 0, function() {
        return (0, a.useContext)(t)
    }], 105098)
}, 177608, 556499, 634877, 966501, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        n = e.i(37819),
        i = e.i(602635),
        r = e.i(692734),
        s = e.i(79187),
        l = e.i(844333),
        o = e.i(665869),
        c = e.i(729904),
        d = e.i(507742),
        u = e.i(260241),
        m = e.i(298964),
        p = e.i(623983),
        y = e.i(345886),
        g = e.i(581577),
        b = e.i(894854),
        h = e.i(881670),
        f = e.i(174528),
        v = e.i(537068),
        N = e.i(589624),
        T = e.i(194250),
        k = e.i(863605),
        I = e.i(154502),
        C = e.i(945146),
        P = e.i(690569);
    e.i(535072);
    var x = e.i(251635),
        A = e.i(634034),
        w = e.i(690768),
        S = e.i(787802),
        E = e.i(396249),
        H = e.i(121880),
        M = e.i(15686);
    e.i(39651);
    var R = (0, A.c)((0, a.jsx)("path", {
        d: "M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"
    }), "MoreHoriz");
    let L = ["slots", "slotProps"],
        j = (0, x.s)(w.B, {
            name: "MuiBreadcrumbCollapsed"
        })(e => {
            let {
                theme: a
            } = e;
            return (0, C._)({
                display: "flex",
                marginLeft: "calc(".concat(a.spacing(1), " * 0.5)"),
                marginRight: "calc(".concat(a.spacing(1), " * 0.5)")
            }, "light" === a.palette.mode ? {
                backgroundColor: a.palette.grey[100],
                color: a.palette.grey[700]
            } : {
                backgroundColor: a.palette.grey[700],
                color: a.palette.grey[100]
            }, {
                borderRadius: 2,
                "&:hover, &:focus": (0, C._)({}, "light" === a.palette.mode ? {
                    backgroundColor: a.palette.grey[200]
                } : {
                    backgroundColor: a.palette.grey[600]
                }),
                "&:active": (0, C._)({
                    boxShadow: a.shadows[0]
                }, "light" === a.palette.mode ? {
                    backgroundColor: (0, P.n)(a.palette.grey[200], .12)
                } : {
                    backgroundColor: (0, P.n)(a.palette.grey[600], .12)
                })
            })
        }),
        D = (0, x.s)(R)({
            width: 24,
            height: 16
        });

    function G(e) {
        let {
            slots: t = {},
            slotProps: n = {}
        } = e, i = (0, P._)(e, L);
        return (0, a.jsx)("li", {
            children: (0, a.jsx)(j, (0, C._)({
                focusRipple: !0
            }, i, {
                ownerState: e,
                children: (0, a.jsx)(D, (0, C._)({
                    as: t.CollapsedIcon,
                    ownerState: e
                }, n.collapsedIcon))
            }))
        })
    }

    function F(e) {
        return (0, P.g)("MuiBreadcrumbs", e)
    }
    var B = (0, S.g)("MuiBreadcrumbs", ["root", "ol", "li", "separator"]);
    let U = ["children", "className", "component", "slots", "slotProps", "expandText", "itemsAfterCollapse", "itemsBeforeCollapse", "maxItems", "separator"],
        z = (0, x.s)(E.T, {
            name: "MuiBreadcrumbs",
            slot: "Root",
            overridesResolver: (e, a) => [{
                ["& .".concat(B.li)]: a.li
            }, a.root]
        })({}),
        K = (0, x.s)("ol", {
            name: "MuiBreadcrumbs",
            slot: "Ol",
            overridesResolver: (e, a) => a.ol
        })({
            display: "flex",
            flexWrap: "wrap",
            alignItems: "center",
            padding: 0,
            margin: 0,
            listStyle: "none"
        }),
        V = (0, x.s)("li", {
            name: "MuiBreadcrumbs",
            slot: "Separator",
            overridesResolver: (e, a) => a.separator
        })({
            display: "flex",
            userSelect: "none",
            marginLeft: 8,
            marginRight: 8
        }),
        O = t.forwardRef(function(e, n) {
            var i, r;
            let s = (0, H.u)({
                    props: e,
                    name: "MuiBreadcrumbs"
                }),
                {
                    children: l,
                    className: o,
                    component: c = "nav",
                    slots: d = {},
                    slotProps: u = {},
                    expandText: m = "Show path",
                    itemsAfterCollapse: p = 1,
                    itemsBeforeCollapse: y = 1,
                    maxItems: g = 8,
                    separator: b = "/"
                } = s,
                h = (0, P._)(s, U),
                [f, v] = t.useState(!1),
                N = (0, C._)({}, s, {
                    component: c,
                    expanded: f,
                    expandText: m,
                    itemsAfterCollapse: p,
                    itemsBeforeCollapse: y,
                    maxItems: g,
                    separator: b
                }),
                T = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, x.a)({
                        root: ["root"],
                        li: ["li"],
                        ol: ["ol"],
                        separator: ["separator"]
                    }, F, a)
                })(N),
                k = (0, M.u)({
                    elementType: d.CollapsedIcon,
                    externalSlotProps: u.collapsedIcon,
                    ownerState: N
                }),
                I = t.useRef(null),
                A = t.Children.toArray(l).filter(e => t.isValidElement(e)).map((e, t) => (0, a.jsx)("li", {
                    className: T.li,
                    children: e
                }, "child-".concat(t)));
            return (0, a.jsx)(z, (0, C._)({
                ref: n,
                component: c,
                color: "text.secondary",
                className: (0, x.c)(T.root, o),
                ownerState: N
            }, h, {
                children: (0, a.jsx)(K, {
                    className: T.ol,
                    ref: I,
                    ownerState: N,
                    children: (i = f || g && A.length <= g || y + p >= A.length ? A : [...A.slice(0, y), (0, a.jsx)(G, {
                        "aria-label": m,
                        slots: {
                            CollapsedIcon: d.CollapsedIcon
                        },
                        slotProps: {
                            collapsedIcon: k
                        },
                        onClick: () => {
                            v(!0);
                            let e = I.current.querySelector("a[href],button,[tabindex]");
                            e && e.focus()
                        }
                    }, "ellipsis"), ...A.slice(A.length - p, A.length)], r = T.separator, i.reduce((e, t, n) => (n < i.length - 1 ? e = e.concat(t, (0, a.jsx)(V, {
                        "aria-hidden": !0,
                        className: r,
                        ownerState: N,
                        children: b
                    }, "separator-".concat(n))) : e.push(t), e), []))
                })
            }))
        });
    var q = (0, k.default)({
            name: "Breadcrumbs"
        })(function(e) {
            return {
                root: (0, T._)((0, T._)({}, e.typography.body1), {
                    color: e.palette.content.muted
                })
            }
        }),
        _ = (0, t.forwardRef)(function(e, a) {
            var n = e.classes,
                i = e.className,
                r = (0, T.a)(e, ["classes", "className"]),
                s = q(void 0, {
                    props: {
                        classes: (0, I.default)(n, i)
                    }
                });
            return t.default.createElement(O, (0, T._)({
                classes: s.classes
            }, r, {
                ref: a
            }))
        });
    e.s(["Breadcrumbs", 0, _], 556499);
    var J = e.i(686762),
        W = e.i(83265),
        Q = e.i(114209),
        X = e.i(97782),
        Y = e.i(475360),
        $ = e.i(759283),
        Z = e.i(829425),
        ee = e.i(726474),
        ea = e.i(86027),
        et = e.i(128106);
    let en = (e, a) => e.args && e.args.value ? a(e.key, {
            [e.args.param]: a(e.args.value)
        }) : a(e.key),
        ei = e => {
            var a;
            let t = parseInt(null != (a = e.developerItemId) ? a : "", 10);
            return Number.isNaN(t) ? ee.dashboard.configureCreatorStoreItemBasePath : ee.dashboard.getConfigureCreatorStoreItemUrl(t)
        },
        er = {
            analytics: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Analytics"
                    }, a)
                },
                breadcrumbType: et.default.Catalog
            },
            observability: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Observability"
                    }, a) || "Observability"
                },
                breadcrumbType: et.default.Observability
            },
            creations: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: et.default.Creations,
                getLinkPath: e => (null == e ? void 0 : e.groupId) ? "/dashboard/creations?groupId=".concat(null == e ? void 0 : e.groupId) : "/dashboard/creations"
            },
            experiences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Games"
                    }, a)
                },
                breadcrumbType: et.default.Games,
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/overview")
            },
            collaborators: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Tab.Collaborators"
                    }, a)
                },
                breadcrumbType: et.default.Collaborators,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/collaborators")
            },
            badges: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Badges"
                    }, a)
                },
                breadcrumbType: et.default.Badge,
                parentItemTypeName: "associated-items",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/badges/").concat(e.badgeId, "/overview")
            },
            "referral-reward-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ReferralRewards"
                    }, a)
                },
                breadcrumbType: et.default.ReferralRewards,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/referral-reward-details"),
                parentItemTypeName: "referral-reward-details",
                withId: !0
            },
            bundle: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: et.default.Bundle,
                getLinkPath: e => "/dashboard/creations/bundle/".concat(e.bundleId, "/configure"),
                withId: !0
            },
            "experience-subscriptions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Subscriptions"
                    }, a)
                },
                breadcrumbType: et.default.ExperienceSubscription,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "associated-items": {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t ? en({
                        key: $.itemFullNameKeys[t]
                    }, a) : en({
                        key: "Heading.AssociatedItems"
                    }, a)
                },
                breadcrumbType: et.default.AssociatedItems,
                getLinkPath: e => (null == e ? void 0 : e.associatedItemType) === Y.Item.DeveloperProduct ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/developer-products") : (null == e ? void 0 : e.associatedItemType) === Y.Item.ExperienceSubscription ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/subscriptions") : (null == e ? void 0 : e.associatedItemType) === Y.Item.GamePass ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/passes") : (null == e ? void 0 : e.associatedItemType) ? "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items?activeTab=").concat(e.associatedItemType) : "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            catalog: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: et.default.Catalog,
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/configure"),
                withId: !0
            },
            store: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: et.default.CreatorStore,
                getLinkPath: ei,
                withId: !0
            },
            "version-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.VersionHistory"
                    }, a)
                },
                breadcrumbType: et.default.CreatorStore,
                getLinkPath: ei,
                withId: !1
            },
            dependencies: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Dependencies"
                    }, a)
                },
                breadcrumbType: et.default.CreatorStore,
                getLinkPath: ei,
                withId: !1
            },
            localization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Localization"
                    }, a)
                },
                breadcrumbType: et.default.Localization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/localization")
            },
            "activity-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: et.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            activityFeed: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: et.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            notifications: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Notifications"
                    }, a)
                },
                breadcrumbType: et.default.Notifications,
                getLinkPath: e => e.baseId ? "/dashboard/creations/experiences/".concat(e.baseId, "/notifications") : "/settings/notifications"
            },
            update: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Notifications.UpdateContent"
                    }, a)
                },
                breadcrumbType: et.default.Notifications
            },
            "social-links": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.SocialLinks"
                    }, a)
                },
                breadcrumbType: et.default.SocialLinks,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/social-links")
            },
            updates: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Updates"
                    }, a)
                },
                breadcrumbType: et.default.Updates,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/updates")
            },
            translation: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Translation"
                    }, a)
                },
                breadcrumbType: et.default.Translation,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            overview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Overview"
                    }, a)
                },
                breadcrumbType: et.default.Overview
            },
            passes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.GamePass"
                    }, a)
                },
                breadcrumbType: et.default.GamePass,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "developer-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.DeveloperProduct"
                    }, a)
                },
                breadcrumbType: et.default.DeveloperProduct,
                withId: !0,
                parentItemTypeName: "associated-items"
            },
            "external-purchase-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ExternalPurchaseSettings"
                    }, a)
                },
                breadcrumbType: et.default.ExternalPurchaseSettings
            },
            "avatar-items": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Label.ThirdPartyAvatarItemCommissions"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMonetization
            },
            "avatar-creation-tokens": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.AvatarCreationTokens"
                    }, a)
                },
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationAvatarCreationTokensUrl(Number(e.baseId)),
                breadcrumbType: et.default.AnalyticsMonetization
            },
            subscriptions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Label.Subscriptions"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMonetization
            },
            commerce: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Commerce"
                    }, a)
                },
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationCommerceUrl(Number(e.baseId)),
                breadcrumbType: et.default.Commerce
            },
            "create-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.CreateProduct"
                    }, a)
                },
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationCommerceCreateProductUrl(Number(e.baseId)),
                breadcrumbType: et.default.CreateProducts
            },
            eligibility: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Eligibility"
                    }, a)
                },
                getLinkPath: () => "/settings/eligibility",
                breadcrumbType: et.default.Eligibility
            },
            "priced-assets": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PricedAssets"
                    }, a)
                },
                breadcrumbType: et.default.PricedAssets
            },
            "audio-distribution": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.AudioDistribution"
                    }, a)
                },
                breadcrumbType: et.default.AudioDistribution
            },
            "paid-access": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PaidAccess"
                    }, a)
                },
                breadcrumbType: et.default.PaidAccess
            },
            "extended-services": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ExtendedServices"
                    }, a)
                },
                breadcrumbType: et.default.ExtendedServices
            },
            "public-publish": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PublicPublish"
                    }, a)
                },
                breadcrumbType: et.default.PublicPublish
            },
            "publishing-permissions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PublishingPermissions"
                    }, a)
                },
                breadcrumbType: et.default.PublishingPermissions
            },
            "us-o18-devex-rate": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.DevExO18UsSettingsNav"
                    }, a)
                },
                breadcrumbType: et.default.UsO18DevexRate
            },
            "contribution-report": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ContributionReports"
                    }, a)
                },
                breadcrumbType: et.default.ContributionReport
            },
            acquisition: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Acquisition"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsAcquisition
            },
            engagement: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Engagement"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsEngagement
            },
            retention: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Retention"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsRetention
            },
            monetization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Monetization"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMonetization,
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationOverviewUrl(Number(e.baseId))
            },
            performance: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsPerformanceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsPerformance
            },
            crashes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsCrashesNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsCrashes
            },
            audience: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsAudienceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsAudience
            },
            economy: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsRecommendedEventsEconomyNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsEconomy
            },
            funnels: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsRecommendedEventsFunnelsNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsFunnels
            },
            journeys: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsRecommendedEventsJourneyNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsJourneys,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/journeys")
            },
            view: {
                displayName: () => "",
                withId: !0,
                breadcrumbType: et.default.AnalyticsJourneyDetail
            },
            edit: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Action.Edit"
                    }, a)
                },
                breadcrumbType: et.default.Create
            },
            preview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Action.CustomDashboards.Preview"
                    }, a)
                },
                breadcrumbType: et.default.Create
            },
            errors: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsErrorReportNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsErrorReport
            },
            "memory-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsMemoryStoresNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMemoryStores
            },
            "data-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsDataStoresNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsDataStores
            },
            leaderboard: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Leaderboard"
                    }, a)
                },
                breadcrumbType: et.default.Leaderboard
            },
            "http-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsHttpServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsHttpServicce
            },
            "messaging-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsMessagingServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMessagingService
            },
            "speech-to-text": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsSpeechToTextNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsSpeechToText
            },
            "text-to-speech": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsTextToSpeechNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsTextToSpeech
            },
            "video-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsVideoServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsVideoService
            },
            "generative-ai": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsGenerativeAINavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsGenerativeAI
            },
            custom: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsCustomEventsNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticCustomEvents
            },
            explore: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsExploreNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsExploreMode
            },
            dashboards: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsCustomDashboardsManageNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsCustomDashboards,
                parentItemTypeName: "dashboards",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/dashboards")
            },
            "managed-pricing": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ManagedPricing"
                    }, a)
                },
                breadcrumbType: et.default.ManagedPricing,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/managed-pricing")
            },
            shop: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PersonalizedShop"
                    }, a)
                },
                breadcrumbType: et.default.PersonalizedShop,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/shop")
            },
            "developer-product-purchases-blocked": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.DeveloperProductPurchasesBlocked"
                    }, a)
                },
                breadcrumbType: et.default.DeveloperProductPurchasesBlocked,
                getLinkPath: e => ee.dashboard.getDeveloperProductPurchasesBlockedUrl(Number(e.baseId))
            },
            "hard-coded-prices": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.HardCodedPrices"
                    }, a)
                },
                breadcrumbType: et.default.HardCodedPrices,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/hard-coded-prices")
            },
            "price-optimization": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PriceOptimization"
                    }, a)
                },
                breadcrumbType: et.default.PriceOptimization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/price-optimization")
            },
            "price-check": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.DynamicPriceCheck"
                    }, a)
                },
                breadcrumbType: et.default.PriceCheck
            },
            "immersive-ads": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Ads"
                    }, a)
                },
                breadcrumbType: et.default.ImmersiveAds,
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationImmersiveAdsUrl(Number(e.baseId))
            },
            "create-placement": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.AdsCreatePlacement"
                    }, a)
                },
                breadcrumbType: et.default.ImmersiveAdsCreatePlacement
            },
            "creator-rewards": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.CreatorRewards"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/creator-rewards")
            },
            "roblox-plus": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.RobloxPlusDeveloperProgram"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/roblox-plus")
            },
            "experience-questionnaire": {
                displayName: e => {
                    let {
                        translate: a,
                        enableQuestionnaireV2: t,
                        isUpdatedPublishingFlowEnabled: n
                    } = e, i = "Heading.ExperienceQuestionnaire";
                    return n ? i = "Heading.ContentRating" : t && (i = "Heading.ContentRatings"), en({
                        key: i
                    }, a)
                },
                breadcrumbType: et.default.Questionnaire
            },
            guidelines: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Guidelines"
                    }, a)
                },
                breadcrumbType: et.default.Questionnaire
            },
            configure: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t === Y.Item.CatalogAsset || t === Y.Item.LibraryAsset || t === Y.Item.Bundle || t === Y.Item.Event || t === Y.Item.AvatarCreationToken || t === Y.Item.Environment || t === Y.Item.Look ? en({
                        key: "Heading.Configure"
                    }, a) : t === Y.Item.Game ? en({
                        key: "Heading.ContentSettings"
                    }, a) : t === Y.Item.ExperienceSubscription ? en({
                        key: "Heading.UpdateSubscription"
                    }, a) : t === Y.Item.Alert ? en({
                        key: "Heading.ConfigureAlert"
                    }, a) : en({
                        key: "Heading.BasicSettings"
                    }, a)
                },
                breadcrumbType: et.default.Configure
            },
            "communication-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.CommunicationSettings"
                    }, a)
                },
                breadcrumbType: et.default.CommunicationSettings,
                getLinkPath: e => "/creations/experiences/".concat(e.baseId, "/communication-settings")
            },
            sales: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Sales"
                    }, a)
                },
                breadcrumbType: et.default.Sales
            },
            promotions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Promotions"
                    }, a)
                },
                breadcrumbType: et.default.Promotions
            },
            create: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t ? en({
                        key: "Heading.Create",
                        args: {
                            param: "itemType",
                            value: $.itemTypeToSingularNameKeys[t]
                        }
                    }, a) : en({
                        key: "Heading.Create"
                    }, a)
                },
                breadcrumbType: et.default.Create
            },
            places: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Places"
                    }, a)
                },
                breadcrumbType: et.default.Places,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/places"),
                parentItemTypeName: "places",
                withId: !0
            },
            environments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Environments"
                    }, a)
                },
                breadcrumbType: et.default.Environments,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/environments"),
                parentItemTypeName: "environments",
                withId: !0
            },
            new_environment: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Action.CreateEnvironment"
                    }, a)
                },
                breadcrumbType: et.default.Environments,
                parentItemTypeName: "environments"
            },
            manage: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Manage"
                    }, a)
                },
                breadcrumbType: et.default.Manage
            },
            icon: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Icon"
                    }, a)
                },
                breadcrumbType: et.default.Icon
            },
            events: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Events"
                    }, a)
                },
                breadcrumbType: et.default.Event,
                withId: !0,
                parentItemTypeName: "events",
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/events")
            },
            "select-eligibility": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Title.SelectEligibility"
                    }, a)
                },
                breadcrumbType: et.default.SelectEligibility
            },
            thumbnails: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PlaceThumbnails"
                    }, a)
                },
                breadcrumbType: et.default.Thumbnails
            },
            videos: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PlaceVideos"
                    }, a)
                },
                breadcrumbType: et.default.Videos
            },
            access: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.AccessSettings"
                    }, a)
                },
                breadcrumbType: et.default.Access
            },
            secrets: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Secrets"
                    }, a)
                },
                breadcrumbType: et.default.Secrets
            },
            matchmaking: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.CustomMatchmaking"
                    }, a)
                },
                breadcrumbType: et.default.CustomMatchmaking,
                getLinkPath: e => ee.dashboard.getCustomMatchmakingDashboardUrl(Number(e.baseId))
            },
            "server-management": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ServerManagement"
                    }, a)
                },
                breadcrumbType: et.default.ServerManagement,
                getLinkPath: e => {
                    var a;
                    return ee.dashboard.getServerManagementUrl(Number(e.baseId), (0, ea.isObservabilityServerManagementPath)(null != (a = e.pathname) ? a : ""))
                }
            },
            "client-sessions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ClientSessions"
                    }, a)
                },
                breadcrumbType: et.default.ClientSessions,
                getLinkPath: e => ee.dashboard.getClientSessionsUrl(Number(e.baseId))
            },
            "[sessionId]": {
                displayName: () => "",
                breadcrumbType: et.default.ClientSession,
                withId: !0
            },
            "create-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.CreateConfiguration"
                    }, a)
                },
                breadcrumbType: et.default.CreateMatchmakingConfiguration
            },
            "edit-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.EditConfiguration"
                    }, a)
                },
                breadcrumbType: et.default.EditMatchmakingConfiguration
            },
            "create-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.CreateAttribute"
                    }, a)
                },
                breadcrumbType: et.default.CreateMatchmakingAttribute,
                getLinkPath: e => ee.dashboard.getCustomMatchmakingAttributeCreationUrl(Number(e.baseId))
            },
            "edit-player-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.EditPlayerAttribute"
                    }, a)
                },
                breadcrumbType: et.default.EditMatchmakingPlayerAttribute
            },
            "edit-server-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.EditServerAttribute"
                    }, a)
                },
                breadcrumbType: et.default.EditMatchmakingServerAttribute
            },
            settings: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Settings"
                    }, a)
                },
                breadcrumbType: et.default.Settings
            },
            permissions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Permissions"
                    }, a)
                },
                breadcrumbType: et.default.Permissions
            },
            webhooks: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Webhooks"
                    }, a)
                },
                breadcrumbType: et.default.Webhooks
            },
            "data-collection": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.DataSharing"
                    }, a)
                },
                breadcrumbType: et.default.DataSharing
            },
            "[notificationCategory]": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Notifications"
                    }, a)
                },
                withId: !0,
                breadcrumbType: et.default.Category
            },
            preferences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Preferences"
                    }, a)
                },
                breadcrumbType: et.default.Preferences
            },
            advanced: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Header.Title"
                    }, a)
                },
                breadcrumbType: et.default.Advanced
            },
            bans: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Moderation"
                    }, a)
                },
                breadcrumbType: et.default.Bans,
                getLinkPath: e => Z.creatorHub.dashboard.getUserBansUrl(Number(e.baseId))
            },
            "anti-cheat": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Moderation"
                    }, a)
                },
                breadcrumbType: et.default.AntiCheat,
                getLinkPath: e => Z.creatorHub.dashboard.getAntiCheatUrl(Number(e.baseId))
            },
            add: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.AddUsersToBan"
                    }, a)
                },
                breadcrumbType: et.default.Add
            },
            reorder: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Reorder"
                    }, a)
                },
                breadcrumbType: et.default.Reorder
            },
            feedback: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Feedback"
                    }, a)
                },
                breadcrumbType: et.default.Feedback
            },
            "api-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.APISettings"
                    }, a)
                },
                breadcrumbType: et.default.ApiSettings
            },
            configs: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Configs"
                    }, a)
                },
                breadcrumbType: et.default.Configs,
                getLinkPath: e => Z.creatorHub.dashboard.getAnalyticsConfigsUrl(Number(e.baseId))
            },
            experiments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Experiments"
                    }, a)
                },
                breadcrumbType: et.default.Experiments,
                getLinkPath: e => Z.creatorHub.dashboard.getExperimentsUrl(Number(e.baseId))
            },
            "experiment-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ExperimentCreate"
                    }, a)
                },
                breadcrumbType: et.default.ExperimentCreate
            },
            "experiment-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ExperimentDetails"
                    }, a)
                },
                breadcrumbType: et.default.ExperimentDetails,
                withId: !0
            },
            alerts: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Alerts"
                    }, a)
                },
                breadcrumbType: et.default.Alerts,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/alerts"),
                parentItemTypeName: "alerts",
                withId: !0
            },
            history: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ConfigsHistory"
                    }, a)
                },
                breadcrumbType: et.default.ConfigsHistory
            },
            "config-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.ConfigCreate"
                    }, a)
                },
                breadcrumbType: et.default.ConfigCreate
            },
            variants: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Variants"
                    }, a)
                },
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/variants"),
                breadcrumbType: et.default.Catalog
            },
            look: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: et.default.Look,
                getLinkPath: e => "/dashboard/creations/look/".concat(e.lookId, "/configure"),
                withId: !0
            },
            "audience-reach": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.AudienceReach"
                    }, a)
                },
                breadcrumbType: et.default.AudienceReach,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/audience-reach")
            },
            "game-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.GameDetails"
                    }, a)
                },
                breadcrumbType: et.default.GameDetails
            },
            "content-rating": {
                displayName: e => {
                    let {
                        translate: a,
                        enableQuestionnaireV2: t,
                        isUpdatedPublishingFlowEnabled: n
                    } = e, i = "Heading.ExperienceQuestionnaire";
                    return n ? i = "Heading.ContentRating" : t && (i = "Heading.ContentRatings"), en({
                        key: i
                    }, a)
                },
                breadcrumbType: et.default.ContentRating
            },
            "advanced-settings": {
                displayName: e => {
                    let {
                        translate: a,
                        isUpdatedPublishingFlowEnabled: t
                    } = e;
                    return en({
                        key: t ? "Heading.AdvancedSettings" : "Heading.AccessSettings"
                    }, a)
                },
                breadcrumbType: et.default.AdvancedSettings
            },
            "game-join": {
                displayName: e => {
                    let {
                        translate: a,
                        isUpdatedPublishingFlowEnabled: t
                    } = e;
                    return en({
                        key: t ? "Heading.AdvancedSettings" : "Heading.GameAccess"
                    }, a)
                },
                breadcrumbType: et.default.GameJoin
            },
            "manage-audience": {
                displayName: e => {
                    let {
                        translate: a,
                        isUpdatedPublishingFlowEnabled: t
                    } = e;
                    return en({
                        key: t ? "Heading.ManageAudience" : "Heading.Publishing"
                    }, a)
                },
                breadcrumbType: et.default.Publishing
            },
            "player-support": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: "Heading.PlayerSupport"
                    }, a)
                },
                breadcrumbType: et.default.PlayerSupport,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/player-support")
            },
            "[ticketId]": {
                displayName: () => "",
                breadcrumbType: et.default.PlayerSupportTicket
            },
            "recommendation-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return en({
                        key: X.analyticsRecommendationServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: et.default.RecommendationService
            }
        };
    var es = e.i(509049);
    let el = (0, t.createContext)({
        insideTopNavigationDrawer: !1
    });

    function eo() {
        return (0, t.useContext)(el)
    }
    el.displayName = "TopNavigationSidebarDrawerContext", e.s(["default", 0, eo], 634877);
    let ec = (0, e.i(697973).makeStyles)()(e => ({
            linkStyle: {
                fontWeight: e.typography.fontWeightRegular,
                color: e.palette.content.muted
            },
            compactBreadCrumbLinkStyle: {
                textDecoration: "none"
            },
            breadcrumb: {
                [e.breakpoints.down("Medium")]: {
                    display: "none"
                }
            },
            breadcrumbBottomSpace: {
                marginBottom: 48
            },
            compactBreadCrumb: {
                paddingLeft: 12,
                paddingRight: 12,
                paddingBottom: 24,
                paddingTop: 12
            }
        })),
        ed = (e, a) => a && e.replaceAll(/\[[^\]]*?\]/g, "") === (null == a ? void 0 : a.replaceAll(/\d+/g, "")) ? void 0 : a,
        eu = (0, s.withTranslation)(e => {
            let {
                inLayoutHeader: r = !1
            } = e, {
                pathname: s,
                query: l
            } = (0, N.useRouter)(), {
                classes: {
                    linkStyle: o,
                    compactBreadCrumbLinkStyle: c,
                    breadcrumb: d,
                    breadcrumbBottomSpace: u,
                    compactBreadCrumb: m
                }
            } = ec(), {
                insideTopNavigationDrawer: g
            } = eo(), b = (0, W.useMediaQuery)(e => e.breakpoints.down("Medium")), {
                gameDetails: h
            } = (0, Q.useCurrentGame)(), f = (0, t.useMemo)(() => {
                let e = s.includes("/analytics/dashboards/");
                return s.split("/").filter(e => !!e).filter(a => "analytics" !== a || !e)
            }, [s]), {
                itemNameMapping: T,
                pathLinkParams: k,
                displayNameParam: I
            } = (0, es.default)(), C = "string" == typeof l.dashboardId ? l.dashboardId : void 0, P = "string" == typeof l.id ? l.id : void 0, x = s.endsWith("/analytics/dashboards/[dashboardId]/edit") && P && C ? "/dashboard/creations/experiences/".concat(P, "/analytics/dashboards/").concat(C) : void 0, A = (0, t.useCallback)((e, t) => g ? t ? (0, a.jsx)(v.default, {
                href: t,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(J.Link, {
                    underline: "always",
                    color: "inherit",
                    children: (0, a.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: e
                    })
                })
            }, e) : (0, a.jsx)(p.Typography, {
                color: "primary",
                variant: "largeLabel1",
                children: e
            }, e) : t ? (0, a.jsx)(v.default, {
                href: t,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(J.Link, {
                    classes: {
                        root: o
                    },
                    children: e
                })
            }, e) : (0, a.jsx)(p.Typography, {
                color: "secondary",
                children: e
            }, e), [g, o]), w = (0, t.useCallback)(e => {
                var a, t;
                let n = e.parentItemTypeName ? er[e.parentItemTypeName] : null,
                    i = T[e.breadcrumbType],
                    r = e.breadcrumbType === et.default.AnalyticsCustomDashboards && x ? x : void 0,
                    l = null != r ? r : null == (a = e.getLinkPath) ? void 0 : a.call(e, k),
                    o = void 0 !== r || null === n || e.breadcrumbType !== n.breadcrumbType;
                return [n ? A(n.displayName(I), ed(s, null == (t = n.getLinkPath) ? void 0 : t.call(n, k))) : null, i ? A(i, o ? ed(s, l) : void 0) : null]
            }, [T, k, A, I, s, x]), S = (0, t.useMemo)(() => {
                let e;
                return e = [], f.filter(e => er[e]).forEach(a => {
                    let t = er[a],
                        n = t.displayName(I);
                    if (n && e.push(n), t.withId) {
                        let a = T[t.breadcrumbType];
                        a && e.push(a)
                    }
                }), e
            }, [f, I, T]), E = (0, t.useMemo)(() => (function(e) {
                if (e.length < 2) return;
                let a = e[e.length - 1],
                    t = e[e.length - 2];
                if (a && t) return "".concat(t, " / ").concat(a)
            })(S), [S]), H = (0, t.useMemo)(() => {
                var e, a;
                return s.includes("/experiences/") ? {
                    description: null == h ? void 0 : h.name,
                    author: null == h || null == (e = h.creator) ? void 0 : e.name,
                    entityName: null == h ? void 0 : h.name,
                    entityId: null == h || null == (a = h.id) ? void 0 : a.toString(),
                    type: "experience"
                } : {}
            }, [s, h]), {
                breadcrumbsContents: M,
                breadcrumbNames: R
            } = (0, t.useMemo)(() => {
                let e = e => {
                        if (e.withId) {
                            var a;
                            return null != (a = T[e.breadcrumbType]) ? a : e.displayName(I)
                        }
                        return e.displayName(I)
                    },
                    t = f.map(e => ({
                        key: e,
                        breadcrumbDetails: er[e]
                    })).filter(e => e.breadcrumbDetails);
                if (r && b) {
                    var n;
                    if (0 === t.length) return {
                        breadcrumbsContents: [],
                        breadcrumbNames: []
                    };
                    let {
                        key: i,
                        breadcrumbDetails: s
                    } = t[0], l = t.map(a => {
                        let {
                            breadcrumbDetails: t
                        } = a;
                        return e(t)
                    }), o = null == (n = s.getLinkPath) ? void 0 : n.call(s, k), d = (0, a.jsx)(p.Typography, {
                        color: "primary",
                        "aria-current": "page",
                        variant: b && r ? "h3" : void 0,
                        children: e(s)
                    }, i);
                    return o ? {
                        breadcrumbsContents: [(0, a.jsx)(v.default, {
                            href: o,
                            className: c,
                            children: d
                        }, i)],
                        breadcrumbNames: l
                    } : {
                        breadcrumbsContents: [d],
                        breadcrumbNames: l
                    }
                }
                let {
                    contents: i,
                    names: l
                } = t.reduce((n, i, l) => {
                    var o, c;
                    let {
                        key: d,
                        breadcrumbDetails: u
                    } = i;
                    if (!u) return n;
                    if (l === t.length - 1) {
                        let t = e(u);
                        if (!t) return n;
                        let i = u.parentItemTypeName ? er[u.parentItemTypeName] : null,
                            l = T[u.breadcrumbType];
                        if (u.withId && u.breadcrumbType === et.default.AnalyticsCustomDashboards && null !== i && void 0 !== l) {
                            let e = i.displayName(I);
                            return {
                                contents: [...n.contents, A(e, ed(s, null == (c = i.getLinkPath) ? void 0 : c.call(i, k))), A(l, x)],
                                names: [...n.names, e, l]
                            }
                        }
                        return {
                            contents: [...n.contents, (0, a.jsx)(p.Typography, {
                                color: "primary",
                                "aria-current": "page",
                                variant: b && r ? "h3" : void 0,
                                children: t
                            }, d)],
                            names: [...n.names, t]
                        }
                    }
                    if (u.withId) {
                        let e = u.parentItemTypeName ? er[u.parentItemTypeName] : null,
                            a = T[u.breadcrumbType];
                        return {
                            contents: n.contents.concat(w(u)),
                            names: [...n.names, ...e ? [e.displayName(I)] : [], ...a ? [a] : []]
                        }
                    }
                    let m = u.displayName(I);
                    return m ? {
                        contents: [...n.contents, A(m, null == (o = u.getLinkPath) ? void 0 : o.call(u, k))],
                        names: [...n.names, m]
                    } : n
                }, {
                    contents: [],
                    names: []
                });
                return {
                    breadcrumbsContents: i,
                    breadcrumbNames: l
                }
            }, [f, r, b, I, T, k, c, A, x, w, s]), L = (0, t.useMemo)(() => R[R.length - 1], [R]), j = (0, t.useMemo)(() => (0, n.buildBreadcrumb)(...R), [R]), D = E && (0, a.jsx)(n.HubMeta, {
                title: L,
                breadcrumb: j,
                seoTitle: E,
                ...H
            });
            return b ? (0, a.jsxs)(y.Grid, {
                className: r ? void 0 : m,
                children: [D, (0, a.jsx)(_, {
                    id: "navigation-breadcrumbs",
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: (r || M.length > 1) && M
                })]
            }) : g ? (0, a.jsxs)(y.Grid, {
                children: [D, (0, a.jsxs)(_, {
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: [(0, a.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: (0, a.jsx)(i.CurrentProductName, {})
                    }, "product-name"), M.slice(0, -1)]
                })]
            }) : (0, a.jsxs)(y.Grid, {
                className: "".concat(d, " ").concat(M.length > 1 && !r ? u : ""),
                children: [D, (0, a.jsx)(_, {
                    id: "navigation-breadcrumbs",
                    maxItems: 8,
                    "aria-label": "breadcrumb",
                    children: M.length > 1 && M
                }), " "]
            })
        }, [h.TranslationNamespace.Creations, h.TranslationNamespace.AudienceReach, h.TranslationNamespace.Features, h.TranslationNamespace.AssetTypes, h.TranslationNamespace.SendrNotificationPreferences, h.TranslationNamespace.Advanced, h.TranslationNamespace.OpenCloud, h.TranslationNamespace.Error, h.TranslationNamespace.DataCollectionSettings, h.TranslationNamespace.UnifiedNavigation, h.TranslationNamespace.Payouts, h.TranslationNamespace.Matchmaking, h.TranslationNamespace.Environments, h.TranslationNamespace.Navigation, h.TranslationNamespace.MarketplaceOnboarding, h.TranslationNamespace.PublicPublish, h.TranslationNamespace.ExperienceAlerts, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.DevEx, h.TranslationNamespace.Publishing]),
        em = () => {
            let {
                currentItemType: e,
                isCurrentItemLoading: a,
                currentItemGroupId: n
            } = (0, es.default)(), {
                isLoading: r,
                setWorkspaceByGroupId: s
            } = (0, i.useWorkspaces)();
            return (0, t.useEffect)(() => {
                !e || a || r || s(null != n ? n : null)
            }, [n, e, a, r, s]), null
        },
        ep = "applayout-scroll-container",
        ey = (0, d.default)(() => Promise.resolve(f.default), {
            ssr: !1
        }),
        eg = (0, s.withTranslation)(e => {
            var n;
            let {
                title: r,
                beta: l = !1,
                secondaryRail: o,
                pageBanner: c,
                useBreadcrumbs: d = !1,
                secondarySize: h = "small",
                omitPageTitle: f = !1,
                children: v
            } = e, {
                open: N,
                dialog: T
            } = (0, b.useStudio)(), {
                translate: k
            } = (0, s.useTranslation)(), I = (0, t.useCallback)(() => {
                N({
                    task: g.EStudioTaskType.Default
                })
            }, [N]), C = t.default.isValidElement(r) && r.type === s.Translate, P = "string" == typeof r ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: k(r)
            }) : C ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: r
            }) : null != r ? r : null;
            return (0, a.jsxs)(i.CreatorHubLayout, {
                children: [(0, a.jsx)(em, {}), T, (0, a.jsx)(i.CreatorHubLayout.Rail, {
                    openStudio: I,
                    secondarySize: h,
                    children: o
                }), (0, a.jsx)(i.CreatorHubLayout.Header, {
                    children: d ? (0, a.jsx)(eu, {
                        inLayoutHeader: !0
                    }) : (0, a.jsxs)(y.Grid, {
                        container: !0,
                        alignItems: "center",
                        gap: "8px",
                        children: [P, l && (0, a.jsx)(p.Typography, {
                            children: (0, a.jsx)(m.Label, {
                                labelText: k("Label.Beta")
                            })
                        })]
                    })
                }), (0, a.jsx)(i.CreatorHubLayout.PageContent, {
                    id: ep,
                    banner: c,
                    additionalLinks: (0, a.jsx)(ey, {
                        inline: !0
                    }),
                    children: (0, a.jsxs)("div", {
                        className: "width-full height-full",
                        children: [d && (null != (n = !f && P) ? n : l) && (0, a.jsxs)("div", {
                            className: "flex items-center gap-small padding-bottom-large",
                            children: [!f && P, l && (0, a.jsx)(p.Typography, {
                                children: (0, a.jsx)(m.Label, {
                                    labelText: k("Label.Beta")
                                })
                            })]
                        }), v, (0, a.jsx)(u.CookieConsentBanner, {})]
                    })
                })]
            })
        }, [...i.REQUIRED_TRANSLATION_NAMESPACES, h.TranslationNamespace.RightsPortal, h.TranslationNamespace.DeveloperProducts, h.TranslationNamespace.Passes, h.TranslationNamespace.Creations, h.TranslationNamespace.PageTitles, h.TranslationNamespace.Features, h.TranslationNamespace.Privacy, h.TranslationNamespace.Error, h.TranslationNamespace.Analytics, h.TranslationNamespace.TalentHubV2, h.TranslationNamespace.Licenses, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.RevenueShareAgreements, h.TranslationNamespace.TaxDocumentation]);
    e.s(["SCROLL_CONTAINER_ID", 0, ep, "default", 0, eg], 966501);
    let eb = {
        enabled: !0,
        isFetched: !0
    };
    e.s(["default", 0, e => {
        let {
            product: d,
            children: u,
            beta: m,
            title: p,
            secondarySize: y = "large",
            secondaryRail: g,
            pageBanner: b,
            omitPageTitle: h,
            analyticsAssistantChatHref: f,
            analyticsAssistantChatUniverseId: v,
            ...N
        } = e, {
            noBreadCrumbs: T,
            leftNavigationContents: k
        } = N, {
            value: I
        } = (0, r.useFlag)(o.enableGroupModerationPage), {
            translate: C
        } = (0, s.useTranslation)(), P = "string" == typeof p ? C(p) : t.default.isValidElement(p) && p.type === s.Translate ? C(p.props.translationKey, p.props.args) : void 0;
        return (0, a.jsxs)(l.NoSSR, {
            children: [T && P && (0, a.jsx)(n.HubMeta, {
                title: P
            }), (0, a.jsx)(i.NavigationConfigsProvider, {
                currentProduct: null != d ? d : "CreatorDashboard",
                environment: (0, c.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: eb,
                enableGroupModeration: null != I && I,
                analyticsAssistantChatHref: f,
                analyticsAssistantChatUniverseId: v,
                children: (0, a.jsx)(eg, {
                    beta: m,
                    title: p,
                    secondaryRail: null != g ? g : k,
                    pageBanner: b,
                    useBreadcrumbs: !T,
                    secondarySize: y,
                    omitPageTitle: h,
                    children: u
                })
            })]
        })
    }], 177608)
}, 17829, e => {
    "use strict";
    var a, t = ((a = t || {}).User = "User", a.Group = "Group", a);
    e.s(["default", 0, t])
}, 627636, e => {
    "use strict";
    var a = e.i(17829);
    e.s(["CreatorType", () => a.default])
}, 450639, 626448, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        n = e.i(79187),
        i = e.i(751846),
        r = e.i(808377),
        s = e.i(940042),
        l = e.i(345886),
        o = e.i(381221),
        c = e.i(29013);
    e.s(["NotInterestedIcon", () => c.NotInterested], 626448);
    var c = c,
        d = e.i(589418),
        u = e.i(623983),
        m = e.i(697973);
    let p = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, m.makeStyles)()(a => ({
            imageStatusContainer: {
                backgroundColor: e ? a.palette.surface.outline : a.palette.components.input.filled.enableFill,
                color: e ? a.palette.content.inverse : a.palette.content.muted,
                width: "100%",
                height: "100%"
            },
            statusTextContainer: {
                display: "block",
                textAlign: "center",
                whiteSpace: "nowrap",
                color: e ? a.palette.content.inverse : a.palette.content.muted
            },
            imageContainer: {
                width: "100%",
                height: 0,
                paddingTop: "100%",
                position: "relative",
                borderRadius: e ? 4 : 8,
                overflow: "hidden",
                backgroundColor: a.palette.components.input.filled.enableFill
            },
            imageWrapper: {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%",
                height: "100%",
                textAlign: "center"
            },
            image: {
                width: "100%",
                height: "100%",
                position: "absolute",
                left: "0",
                bottom: "0",
                objectFit: "contain"
            },
            bottomRightAdornmentContainer: {
                position: "absolute",
                bottom: 8,
                right: 8,
                padding: 4,
                borderRadius: 4,
                background: a.palette.surface[200],
                display: "flex"
            },
            skeleton: {
                height: "100%"
            }
        }))
    };
    e.s(["default", 0, e => {
        let {
            targetId: m,
            targetType: y,
            returnPolicy: g = i.ReturnPolicy.AutoGenerated,
            isStatusTextShown: b = !1,
            alt: h,
            fontColor: f = "light",
            bottomRightAdornment: v
        } = e, {
            classes: {
                imageStatusContainer: N,
                statusTextContainer: T,
                imageWrapper: k,
                imageContainer: I,
                image: C,
                bottomRightAdornmentContainer: P,
                skeleton: x
            }
        } = p("light" !== f)(), {
            translate: A
        } = (0, n.useTranslation)(), [w, S] = (0, t.useState)(!1), [E, H] = (0, t.useState)(), M = (0, t.useCallback)(async function(e, a, t) {
            let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (a && e) {
                S(!0);
                try {
                    let r = n ? i.ThumbnailClient.reloadThumbnailImage : i.ThumbnailClient.getThumbnailImage,
                        s = await r(e, a, t);
                    H(s)
                } catch (e) {
                    H({
                        state: r.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    S(!1)
                }
            }
        }, []), R = (0, t.useMemo)(() => {
            if (w) return (0, a.jsx)(d.Skeleton, {
                classes: {
                    root: x
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                t = null;
            switch (null == E ? void 0 : E.state) {
                case r.ThumbnailResponseState.InReview:
                    e = A("Label.InReview"), t = (0, a.jsx)(o.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case r.ThumbnailResponseState.Blocked:
                    e = A("Label.Moderated"), t = (0, a.jsx)(c.NotInterested, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case r.ThumbnailResponseState.Error:
                case r.ThumbnailResponseState.TemporarilyUnavailable:
                    e = A("Label.Unavailable"), t = (0, a.jsx)(s.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, a.jsx)(l.Grid, {
                container: !0,
                classes: {
                    root: N
                },
                justifyContent: "center",
                alignItems: "center",
                children: b ? (0, a.jsxs)("div", {
                    children: [t, (0, a.jsx)(u.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: T
                        },
                        children: e
                    })]
                }) : t
            })
        }, [w, null == E ? void 0 : E.state, N, b, T, x, A, f]);
        return (0, t.useEffect)(() => {
            M(y, m, g)
        }, [m, y, g, M]), {
            thumbnailImage: (0, a.jsx)(l.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, a.jsxs)("div", {
                    className: I,
                    children: [(null == E ? void 0 : E.state) === r.ThumbnailResponseState.Completed ? (0, a.jsx)("img", {
                        className: C,
                        src: null == E ? void 0 : E.imageUrl,
                        alt: h
                    }) : (0, a.jsx)("div", {
                        className: k,
                        children: R
                    }), v ? (0, a.jsx)("div", {
                        className: P,
                        children: v
                    }) : null]
                })
            }),
            thumbnailData: E,
            refreshThumbnail: (0, t.useCallback)(async () => M(y, m, g, !0), [M, y, m, g])
        }
    }], 450639)
}, 894854, e => {
    "use strict";
    var a = e.i(893949);
    e.s(["useStudio", () => a.default])
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, a) => {
            let [t, n] = a;
            return Array.isArray(n) ? e[t] = n.at(0) : e[t] = n, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 174528, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        n = e.i(260241),
        i = e.i(721281),
        r = e.i(984656),
        s = e.i(41466),
        l = e.i(157310),
        o = e.i(677753),
        c = function(e, a) {
            return (c = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, a) {
                e.__proto__ = a
            } || function(e, a) {
                for (var t in a) Object.prototype.hasOwnProperty.call(a, t) && (e[t] = a[t])
            })(e, a)
        };

    function d(e, a, t, n) {
        return new(t || (t = Promise))(function(i, r) {
            function s(e) {
                try {
                    o(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                try {
                    o(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
                var a;
                e.done ? i(e.value) : ((a = e.value) instanceof t ? a : new t(function(e) {
                    e(a)
                })).then(s, l)
            }
            o((n = n.apply(e, a || [])).next())
        })
    }

    function u(e, a) {
        var t, n, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = l(0), s.throw = l(1), s.return = l(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function l(l) {
            return function(o) {
                var c = [l, o];
                if (t) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (r = 0)), r;) try {
                    if (t = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < i[1]) {
                                r.label = i[1], i = c;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(c);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = a.call(e, r)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    t = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function m(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            featureName: e.featureName,
            namespace: e.namespace
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var p = function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, a) {
                if ("function" != typeof a && null !== a) throw TypeError("Class extends value " + String(a) + " is not a constructor or null");

                function t() {
                    this.constructor = e
                }
                c(e, a), e.prototype = null === a ? Object.create(a) : (t.prototype = a.prototype, new t)
            }(a, e), a.prototype.accessManagementAPIGetFeatureAccessRaw = function(e, a) {
                return d(this, void 0, void 0, function() {
                    var t, n, i;
                    return u(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, void 0 !== e.featureNames && (t.featureNames = e.featureNames), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), n = {}, [4, this.request({
                                    path: "/v1/feature-access",
                                    schemaPath: "/v1/feature-access",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, a)];
                            case 1:
                                return i = r.sent(), [2, new o.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetFeatureAccess = function() {
                return d(this, arguments, void 0, function(e, a) {
                    return void 0 === e && (e = {}), u(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetFeatureAccessRaw(e, a)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetPairwiseFeatureAccessRaw = function(e, a) {
                return d(this, void 0, void 0, function() {
                    var t, n, i;
                    return u(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, void 0 !== e.featureName && (t.featureName = e.featureName), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.targetUserId && (t.targetUserId = e.targetUserId), e.otherUserIds && (t.otherUserIds = e.otherUserIds), n = {}, [4, this.request({
                                    path: "/v1/pairwise-feature-access",
                                    schemaPath: "/v1/pairwise-feature-access",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, a)];
                            case 1:
                                return i = r.sent(), [2, new o.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetPairwiseFeatureAccess = function() {
                return d(this, arguments, void 0, function(e, a) {
                    return void 0 === e && (e = {}), u(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetPairwiseFeatureAccessRaw(e, a)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetRCCOwnerFeatureAccessRaw = function(e, a) {
                return d(this, void 0, void 0, function() {
                    var t, n, i;
                    return u(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, void 0 !== e.featureNames && (t.featureNames = e.featureNames), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                    path: "/v1/rcc-owner-feature-access",
                                    schemaPath: "/v1/rcc-owner-feature-access",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, a)];
                            case 1:
                                return i = r.sent(), [2, new o.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetRCCOwnerFeatureAccess = function() {
                return d(this, arguments, void 0, function(e, a) {
                    return void 0 === e && (e = {}), u(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetRCCOwnerFeatureAccessRaw(e, a)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetRCCUserFeatureAccessRaw = function(e, a) {
                return d(this, void 0, void 0, function() {
                    var t, n, i;
                    return u(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, void 0 !== e.featureNames && (t.featureNames = e.featureNames), void 0 !== e.userId && (t.userId = e.userId), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (n["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                    path: "/v1/rcc-user-feature-access",
                                    schemaPath: "/v1/rcc-user-feature-access",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, a)];
                            case 1:
                                return i = r.sent(), [2, new o.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetRCCUserFeatureAccess = function() {
                return d(this, arguments, void 0, function(e, a) {
                    return void 0 === e && (e = {}), u(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetRCCUserFeatureAccessRaw(e, a)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetRCCUserFeatureEvaluationRaw = function(e, a) {
                return d(this, void 0, void 0, function() {
                    var t, n, i;
                    return u(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, (n = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (n["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                    path: "/v1/rcc-user-feature-evaluation",
                                    schemaPath: "/v1/rcc-user-feature-evaluation",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(m)
                                        }
                                    }(e.accessManagementAPIGetRCCUserFeatureEvaluationRequest)
                                }, a)];
                            case 1:
                                return i = r.sent(), [2, new o.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetRCCUserFeatureEvaluation = function() {
                return d(this, arguments, void 0, function(e, a) {
                    return void 0 === e && (e = {}), u(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetRCCUserFeatureEvaluationRaw(e, a)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetUpsellFeatureAccessRaw = function(e, a) {
                return d(this, void 0, void 0, function() {
                    var t, n, i;
                    return u(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, void 0 !== e.featureName && (t.featureName = e.featureName), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), void 0 !== e.successfulActions && (t.successfulActions = e.successfulActions), n = {}, [4, this.request({
                                    path: "/v1/upsell-feature-access",
                                    schemaPath: "/v1/upsell-feature-access",
                                    method: "GET",
                                    headers: n,
                                    query: t
                                }, a)];
                            case 1:
                                return i = r.sent(), [2, new o.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIGetUpsellFeatureAccess = function() {
                return d(this, arguments, void 0, function(e, a) {
                    return void 0 === e && (e = {}), u(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.accessManagementAPIGetUpsellFeatureAccessRaw(e, a)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIPostPairwiseFeatureAccessRaw = function(e, a) {
                return d(this, void 0, void 0, function() {
                    var t, n, i;
                    return u(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return t = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                    path: "/v1/pairwise-feature-access",
                                    schemaPath: "/v1/pairwise-feature-access",
                                    method: "POST",
                                    headers: n,
                                    query: t,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            featureName: e.featureName,
                                            namespace: e.namespace,
                                            targetUserId: e.targetUserId,
                                            otherUserIds: e.otherUserIds
                                        }
                                    }(e.accessManagementAPIPostPairwiseFeatureAccessRequest)
                                }, a)];
                            case 1:
                                return i = r.sent(), [2, new o.VoidApiResponse(i)]
                        }
                    })
                })
            }, a.prototype.accessManagementAPIPostPairwiseFeatureAccess = function() {
                return d(this, arguments, void 0, function(e, a) {
                    return void 0 === e && (e = {}), u(this, function(t) {
                        switch (t.label) {
                            case 0:
                                return [4, this.accessManagementAPIPostPairwiseFeatureAccessRaw(e, a)];
                            case 1:
                                return t.sent(), [2]
                        }
                    })
                })
            }, a
        }(o.BaseAPI),
        y = e.i(897547);
    let g = new Map,
        b = async (e, a, t) => {
            let n, i, r = (n = "".concat(e, "/access-management"), (i = g.get(n)) || (i = new p(new o.Configuration({
                basePath: n,
                credentials: "include",
                enableMrRouter: !0
            })), g.set(n, i)), i);
            try {
                let e = await r.accessManagementAPIGetUpsellFeatureAccessRaw({
                    featureName: a,
                    namespace: t
                });
                return await e.raw.json()
            } catch (a) {
                let e = a instanceof Error ? a.message : "Unknown error";
                throw Error("Failed to check feature access: ".concat(e), {
                    cause: a
                })
            }
        }, h = new Map, f = e => {
            let a = h.get(e);
            return a || (a = new y.UserSettingsApiApi(new o.Configuration({
                basePath: e,
                credentials: "include",
                enableMrRouter: !0
            })), h.set(e, a)), a
        }, v = async e => {
            let a = f(e);
            try {
                await a.userSettingsApiSetGlobalPrivacyControl()
            } catch (a) {
                let e = a instanceof Error ? a.message : "Unknown error";
                throw Error("Failed to set Global Privacy Control: ".concat(e), {
                    cause: a
                })
            }
        }, N = async e => {
            let a = f(e);
            try {
                return await a.userSettingsApiGet({
                    requestedUserSettings: "allowSellShareData"
                })
            } catch (a) {
                let e = a instanceof Error ? a.message : "Unknown error";
                throw Error("Failed to get user settings: ".concat(e), {
                    cause: a
                })
            }
        }, T = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, k = async e => {
            var a, t;
            if (e && (null == (t = window.evidon) || null == (a = t.notice) ? void 0 : a.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class I {
        updateCookiePreferences(e) {
            this.currentCookiePreferences = {
                ...e
            }
        }
        hasCookiePreferencesChanged() {
            return Array.from(new Set([...Object.keys(this.currentCookiePreferences), ...Object.keys(this.initialCookiePreferences)])).some(e => this.currentCookiePreferences[e] !== this.initialCookiePreferences[e])
        }
        getGpcState() {
            let e = T(),
                a = this.hasCookiePreferencesChanged();
            return {
                isGpcDetected: e,
                initialGpcState: this.initialGpcState,
                hasUserMadeCookieChanges: a,
                scenario: e ? a ? "signal-with-changes" : "signal-honored" : "no-signal"
            }
        }
        initializeEvidon(e) {
            var a;
            let t;
            e && (k(e).catch(e => {
                console.error("Failed to call Evidon API:", e)
            }), this.evidonCleanup = (a = () => {}, t = () => {
                try {
                    var e, t;
                    (null == (t = window.evidon) || null == (e = t.notice) ? void 0 : e.userGpcEnabled) !== void 0 && a(window.evidon.notice.userGpcEnabled)
                } catch (e) {
                    console.error("Failed to extract GPC signal from Evidon event:", e)
                }
            }, window.addEventListener("evidon-consent-change", t), () => {
                window.removeEventListener("evidon-consent-change", t)
            }))
        }
        cleanup() {
            this.evidonCleanup && (this.evidonCleanup(), this.evidonCleanup = null)
        }
        constructor(e = {}) {
            (0, i._)(this, "initialGpcState", void 0), (0, i._)(this, "evidonCleanup", null), (0, i._)(this, "initialCookiePreferences", void 0), (0, i._)(this, "currentCookiePreferences", void 0), this.initialGpcState = T(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var C = e.i(79187),
        P = e.i(686762),
        x = e.i(623983),
        A = e.i(345886),
        w = e.i(697973),
        S = e.i(814975);
    let E = (0, w.makeStyles)()(() => ({
            container: {
                textAlign: "center",
                paddingTop: "20px",
                paddingBottom: "20px",
                width: "100%",
                marginTop: "0",
                marginBottom: "0"
            },
            link: {
                textDecoration: "none",
                display: "inline-flex",
                alignItems: "center",
                cursor: "pointer",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:visited": {
                    color: "inherit"
                }
            },
            icon: {
                marginLeft: "8px",
                verticalAlign: "middle",
                height: "16px",
                width: "auto"
            }
        })),
        H = "Title.GpcDetected",
        M = "Body.GpcDetectedSettingDisabledIneligible",
        R = "Body.GpcDetectedSettingDisabledEligible",
        L = "Body.GpcDetectedSettingEnabledIneligible",
        j = "Body.GpcMissingSettingIneligible",
        D = (0, w.makeStyles)()(() => ({
            modalLink: {
                color: "inherit",
                textDecoration: "none",
                "&:hover": {
                    textDecoration: "underline"
                },
                "&:focus": {
                    textDecoration: "underline"
                }
            },
            inlineLink: {
                display: "inline-flex",
                alignItems: "center"
            },
            inlineIcon: {
                marginLeft: "8px",
                height: "16px",
                width: "auto",
                verticalAlign: "middle"
            }
        })),
        G = e => {
            var n, i;
            let {
                gpcState: l,
                modalData: o,
                translate: c,
                translateHTML: d,
                handleClose: u,
                privacyPreferencesUrl: m,
                modalLinkClass: p
            } = e, {
                user: y
            } = (0, S.useAuthentication)(), g = !!y, b = null != (n = null == o ? void 0 : o.isAdsSellShareDataEnabled) && n, h = null != (i = null == o ? void 0 : o.canUserManageAdsSettings) && i, f = (0, t.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = m)
            }, [m]), v = (0, t.useCallback)(e => (0, a.jsx)(P.Link, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: p,
                children: e
            }), [p]), N = (0, t.useCallback)(e => (0, a.jsx)(P.Link, {
                href: m,
                className: p,
                onClick: f,
                children: e
            }), [m, p, f]), T = (0, t.useMemo)(() => (0, a.jsx)("br", {}), []), k = (0, t.useCallback)((e, n) => {
                let i = (c(e, {
                        link: "",
                        hrefEnd: ""
                    }) || "").replaceAll(/{link}/g, "").replaceAll(/{hrefEnd}/g, ""),
                    r = i.split(/{aTagWithHref}|{aTagEnd}/),
                    s = e => {
                        let n = e.split(/{lineBreak}/);
                        return 1 === n.length ? e : (0, a.jsx)(a.Fragment, {
                            children: n.map((e, i) => {
                                let r = "linebreak-".concat(i, "-").concat(e.substring(0, 10));
                                return (0, a.jsxs)(t.Fragment, {
                                    children: [e, i < n.length - 1 && T]
                                }, r)
                            })
                        })
                    };
                return 3 === r.length ? (0, a.jsxs)(a.Fragment, {
                    children: [s(r[0]), n(r[1]), s(r[2])]
                }) : s(i)
            }, [c, T]);
            return (0, a.jsxs)(a.Fragment, {
                children: [(0, a.jsxs)(r.DialogBody, {
                    children: [(0, a.jsx)(r.DialogTitle, {
                        className: "text-heading-small",
                        children: l.isGpcDetected ? c(H) || "" : c("Title.NoGpcDetected") || ""
                    }), (0, a.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!g) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: v
                                    }],
                                    a = {
                                        lineBreak: T
                                    };
                                return l.isGpcDetected ? b ? d(L, e, a) : d(M, e, a) : d(j, e, a)
                            }
                            if (!l.isGpcDetected) return h ? k("Body.GpcMissingSettingEligible", N) : d(j, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: T
                            });
                            if (b) return h ? k("Body.GpcDetectedSettingEnabledEligible", N) : d(L, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: T
                            });
                            let e = h ? {
                                tags: [{
                                    opening: "aTagWithHref",
                                    closing: "aTagEnd",
                                    content: N
                                }],
                                args: {
                                    lineBreak: T
                                }
                            } : {
                                tags: [{
                                    opening: "aTagStart",
                                    closing: "aTagEnd",
                                    content: v
                                }],
                                args: {
                                    lineBreak: T
                                }
                            };
                            if ("signal-with-changes" === l.scenario) return h ? k(R, N) : d(M, e.tags, e.args);
                            let a = h ? R : M;
                            return h ? k(a, N) : d(a, e.tags, e.args)
                        })()
                    })]
                }), (0, a.jsx)(r.DialogFooter, {
                    className: "width-full",
                    children: (0, a.jsx)(s.Button, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: u,
                        children: c("Action.Ok") || ""
                    })
                })]
            })
        },
        F = e => {
            let {
                inline: i = !1
            } = e, {
                translate: s,
                translateHTML: o
            } = (0, C.useTranslation)(), c = (0, C.useLocalization)(), d = (0, n.useCookieConsentContext)().preferences, u = (0, t.useRef)(null), m = (0, t.useRef)(!1), [p, y] = (0, t.useState)(!1), {
                classes: {
                    container: g
                }
            } = E(), {
                classes: h
            } = D(), f = (0, t.useCallback)(() => {
                if ("u" < typeof document) return {};
                let e = document.cookie.split("; ").find(e => e.startsWith("RBXcb="));
                if (!e) return {};
                let a = e.substring(6),
                    t = a;
                try {
                    t = decodeURIComponent(a)
                } catch (e) {}
                let n = {};
                return t.split("&").forEach(e => {
                    let [a, t] = e.split("=");
                    a && (n[a] = "true" === t)
                }), n
            }, []), [T, k] = (0, t.useState)({
                isGpcDetected: !1,
                initialGpcState: !1,
                hasUserMadeCookieChanges: !1,
                scenario: "no-signal"
            });
            (0, t.useEffect)(() => () => {
                u.current && u.current.cleanup()
            }, []), (0, t.useEffect)(() => {
                if (p && !m.current) {
                    let e = f();
                    u.current = new I(Object.keys(e).length > 0 ? e : d), m.current = !0, k(u.current.getGpcState())
                }
            }, [p, d, f]), (0, t.useEffect)(() => {
                if (u.current) {
                    let e = f(),
                        a = Object.keys(e).length > 0 ? e : d;
                    u.current.updateCookiePreferences(a);
                    let t = u.current.getGpcState();
                    k(e => e.scenario !== t.scenario || e.isGpcDetected !== t.isGpcDetected || e.hasUserMadeCookieChanges !== t.hasUserMadeCookieChanges ? t : e)
                }
            }, [d, f]), (0, t.useEffect)(() => {
                if (!u.current) return;
                let e = setInterval(() => {
                    if (u.current) {
                        let e = f(),
                            a = Object.keys(e).length > 0 ? e : d;
                        u.current.updateCookiePreferences(a);
                        let t = u.current.getGpcState();
                        k(e => e.scenario !== t.scenario || e.isGpcDetected !== t.isGpcDetected || e.hasUserMadeCookieChanges !== t.hasUserMadeCookieChanges ? t : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [d, f]);
            let {
                user: P
            } = (0, S.useAuthentication)(), w = !!P, {
                data: M,
                isLoading: R
            } = (e => {
                let {
                    showModal: a,
                    gpcTrackerRef: t,
                    userSettingsApiBaseUrl: n,
                    apiGatewayBaseUrl: i,
                    isAuthenticated: r
                } = e;
                return (0, l.useQuery)({
                    queryKey: ["yourPrivacyChoicesModal", a],
                    queryFn: async () => {
                        var e, a, s;
                        let l = null != (e = null == r ? void 0 : r()) && e,
                            o = null != (a = null == (s = t.current) ? void 0 : s.getGpcState()) ? a : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: c
                            } = o;
                        l && c && await v(n);
                        let d = !1;
                        if (l) try {
                            let {
                                access: e
                            } = await b(i, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            d = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let u = !1;
                        if (l) try {
                            let e = await N(n);
                            u = "Enabled" === e.allowSellShareData
                        } catch (e) {
                            console.error("Failed to get user settings:", e)
                        } else if ("u" > typeof document) {
                            let e = document.cookie.split("; ").find(e => e.trim().startsWith("RBXcb="));
                            if (e) {
                                let a = e.substring(6),
                                    t = a;
                                try {
                                    t = decodeURIComponent(a)
                                } catch (e) {}
                                let n = t.split("&"),
                                    i = n.some(e => {
                                        let [a, t] = e.split("=");
                                        return "GoogleAnalytics" === a && "true" === t
                                    }),
                                    r = n.some(e => {
                                        let [a, t] = e.split("=");
                                        return "RBXSource" === a && "true" === t
                                    });
                                (i || r) && (u = !0)
                            }
                        } return {
                            isGpcDetected: c,
                            canUserManageAdsSettings: d,
                            isAdsSellShareDataEnabled: u,
                            scenario: o.scenario
                        }
                    },
                    enabled: a,
                    gcTime: 0
                })
            })({
                showModal: p,
                gpcTrackerRef: u,
                userSettingsApiBaseUrl: (0, t.useMemo)(() => "".concat("https://apis.roblox.com", "/user-settings-api"), []),
                apiGatewayBaseUrl: (0, t.useMemo)(() => "https://apis.roblox.com", []),
                isAuthenticated: () => w
            }), L = (0, t.useMemo)(() => c.locale ? (0, C.toRobloxLocale)(c.locale) : "en_us", [c.locale]), j = (0, t.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(L);
                return "https://www.roblox.com".concat(e)
            }, [L]), F = (0, t.useCallback)(e => {
                e.preventDefault(), y(!0)
            }, []), B = (0, t.useCallback)(() => {
                y(!1)
            }, []), U = s("Label.YourPrivacyChoices") || "", z = (0, a.jsx)("button", {
                type: "button",
                onClick: F,
                style: {
                    display: "inline-flex",
                    alignItems: "center",
                    background: "none",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    color: "inherit"
                },
                children: (0, a.jsxs)(x.Typography, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [U, (0, a.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/b5143cbf7654fcce8ee8e764e247e76cdd9dff12/assets", "/navigation/privacy_icon.png"),
                        alt: "",
                        style: {
                            marginLeft: "8px",
                            height: "16px",
                            width: "auto",
                            verticalAlign: "middle"
                        }
                    })]
                })
            });
            return (0, a.jsxs)(a.Fragment, {
                children: [i ? z : (0, a.jsx)(A.Grid, {
                    classes: {
                        root: g
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: z
                }), (0, a.jsx)(r.Dialog, {
                    open: p,
                    onOpenChange: B,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: s("Action.Close"),
                    children: (0, a.jsx)(r.DialogContent, {
                        children: R ? (0, a.jsxs)(r.DialogBody, {
                            children: [(0, a.jsx)(r.DialogTitle, {
                                className: "text-heading-small",
                                children: s(H) || ""
                            }), (0, a.jsx)("div", {
                                className: "text-body-medium",
                                children: s("Description.Loading") || ""
                            })]
                        }) : (0, a.jsx)(G, {
                            gpcState: T,
                            modalData: M,
                            translate: s,
                            translateHTML: o,
                            handleClose: B,
                            privacyPreferencesUrl: j,
                            modalLinkClass: h.modalLink
                        })
                    })
                })]
            })
        };
    e.s(["default", 0, e => {
        let {
            inline: t = !1
        } = e;
        try {
            return (0, a.jsx)(F, {
                inline: t
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 114209, 559227, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        n = e.i(589624),
        i = e.i(773057),
        r = e.i(392782);
    let s = (0, t.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    s.displayName = "Game", e.s(["default", 0, s], 559227);
    var l = e.i(721281),
        o = e.i(252842),
        c = e.i(533968);
    let d = new class {
        async getGameDetail(e, a) {
            var t, n, i;
            if (!a && this.gameDetailsMap.has(e)) return null != (t = this.gameDetailsMap.get(e)) ? t : null;
            try {
                let a = null != (n = null == (i = (await this.gamesClient.getDetails([e])).data) ? void 0 : i[0]) ? n : null;
                return a && this.gameDetailsMap.set(e, a), a
            } catch (t) {
                let a = (0, c.getResponseFromError)(t);
                if ((null == a ? void 0 : a.status) === o.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(e)), t
            }
        }
        async getConfiguration(e, a) {
            if (!a && this.gameConfigurationMap.has(e)) {
                var t;
                return null != (t = this.gameConfigurationMap.get(e)) ? t : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(e), this.gameConfigurationMap.set(e, !0), !0
            } catch (t) {
                let a = (0, c.getResponseFromError)(t);
                if ((null == a ? void 0 : a.status) === o.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, a) {
            (0, l._)(this, "gamesClient", void 0), (0, l._)(this, "developClient", void 0), (0, l._)(this, "gameDetailsMap", void 0), (0, l._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = a, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(r.default, i.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: i,
            children: r
        } = e, l = (0, n.useRouter)(), [o, c] = (0, t.useState)(!0), [u, m] = (0, t.useState)(null), [p, y] = (0, t.useState)(null), [g, b] = (0, t.useState)(!1), h = (0, t.useRef)(0), f = (0, t.useCallback)(async function(e) {
            let a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                t = h.current += 1,
                n = d.getConfiguration(e),
                i = d.getGameDetail(e, a),
                [r, s] = await Promise.allSettled([n, i]);
            t === h.current && ("fulfilled" === r.status ? m(r.value) : m(null), "fulfilled" === s.status ? (b(!1), y(s.value)) : ("rejected" === s.status ? b(!0) : b(!1), y(null)), c(!1))
        }, []), v = (0, t.useMemo)(() => {
            let {
                id: e
            } = l.query;
            return i || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [i, l.query]), N = (0, t.useCallback)(() => v ? f(v, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [v, f]);
        (0, t.useEffect)(() => {
            try {
                if (void 0 !== v && !Number.isNaN(v) && v > 0) return void f(v);
                h.current += 1, m(null), y(null), b(!1), c(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(v))
            }
        }, [v, f]);
        let T = (0, t.useMemo)(() => ({
            isLoadingGame: o,
            canConfigure: u,
            gameDetails: p,
            isErrorLoadingGame: g,
            refreshGameDetails: N
        }), [o, u, p, g, N]);
        return (0, a.jsx)(s.Provider, {
            value: T,
            children: r
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, t.useContext)(s);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 86027, e => {
    "use strict";
    var a = e.i(118413),
        t = e.i(726474);
    let n = async e => t.dashboard.getServerManagementUrl(e, await (0, a.isClientSessionsEnabled)({
        universeId: e
    }));
    e.s(["isObservabilityServerManagementPath", 0, e => e.includes("/observability/server-management"), "resolveServerManagementUrl", 0, n])
}, 808377, e => {
    "use strict";
    var a = e.i(620140);
    e.s(["ThumbnailResponseState", () => a.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 940042, e => {
    "use strict";
    var a = e.i(29013);
    e.s(["BrokenImageOutlinedIcon", () => a.BrokenImageOutlined])
}, 381221, e => {
    "use strict";
    var a = e.i(29013);
    e.s(["HourglassEmptyIcon", () => a.HourglassEmpty])
}]);

//# debugId=46c16e97-4f2a-f14d-695a-7834530c52f7
//# sourceMappingURL=3zt4z_egpes2y.js.map