;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e9b37d14-e2b1-9e4e-80a1-03b509b0117c")
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
        i = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isLimitedAnalyticsAdminMonitoringNavigationEnabled",
            defaultValue: !1
        }),
        n = (0, a.defineFlag)({
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
            name: "isCustomMetricMdeEnabled",
            defaultValue: !1
        }),
        o = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0
        }),
        d = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0
        }),
        c = (0, a.defineFlag)({
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
            name: "isAnalyticsAssistantChatHistoryEnabled",
            defaultValue: !1
        }),
        b = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantChatEnabled",
            defaultValue: !1
        }),
        h = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantStreamSilenceRecoveryEnabled",
            defaultValue: !1
        }),
        v = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsAssistantIssueBannerEnabled",
            defaultValue: !1
        }),
        f = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1
        }),
        N = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1
        }),
        T = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1
        }),
        k = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1
        }),
        I = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1
        }),
        C = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1
        }),
        P = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1
        }),
        x = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1
        }),
        E = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1
        }),
        H = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1
        }),
        A = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1
        }),
        S = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1
        }),
        M = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1
        }),
        w = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1
        }),
        R = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1
        }),
        L = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentMetricsV2Enabled",
            defaultValue: !1
        }),
        D = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1
        }),
        j = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isObservabilityDataCapturesEnabled",
            defaultValue: !1
        }),
        B = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isRaqiv2RequestQueryEnabled",
            defaultValue: !1
        });
    e.s(["analyticsChartLoadEventstreamEnabled", 0, t, "isAnalyticsAssistantChatEnabled", 0, b, "isAnalyticsAssistantChatHistoryEnabled", 0, g, "isAnalyticsAssistantIssueBannerEnabled", 0, v, "isAnalyticsAssistantStreamSilenceRecoveryEnabled", 0, h, "isAnalyticsMetricAwareYAxisFormatterEnabled", 0, P, "isAssistantChartOverflowMenuEnabled", 0, C, "isClientSessionDetailsV2Enabled", 0, D, "isClientSessionsEnabled", 0, H, "isCustomDashboardsLocalStorageEnabled", 0, x, "isCustomMetricMdeEnabled", 0, l, "isCustomMetricsBackendEnabled", 0, s, "isEhdResultsAlwaysFetched", 0, S, "isEhdResultsEnabled", 0, A, "isExperimentMetricsV2Enabled", 0, L, "isExperimentNullControlValueEnabled", 0, c, "isExperimentRolloutEnabled", 0, u, "isExperimentSegmentationEnabled", 0, R, "isExperimentTargetingEnabled", 0, o, "isExperimentationTemplatesEnabled", 0, r, "isGeneralBreakGlassBannerEnabled", 0, m, "isJourneyEventsEnabled", 0, E, "isLimitedAnalyticsAdminMonitoringNavigationEnabled", 0, i, "isMetricVariantChartStateEnabled", 0, M, "isMonetizationBreakGlassBannerEnabled", 0, p, "isObservabilityDataCapturesEnabled", 0, j, "isPeriodSummaryBridgeEnabled", 0, w, "isPlayerFeedbackExampleCommentsEnabled", 0, y, "isRaqiv2RequestQueryEnabled", 0, B, "isRotraceMetricEnabled", 0, N, "isTargetingConfigsEnabled", 0, d, "isTelemetryMigrationEnabled", 0, T, "isTreemapColorBySiblingProportionEnabled", 0, I, "showCreatorRewardsReportingDisclaimer", 0, f, "showVideoServiceDashboard", 0, k, "visibleAssetIdInPersonalizationEnabled", 0, n])
}, 97782, e => {
    "use strict";
    var a = e.i(730530),
        t = e.i(881670);
    let i = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, a.translationKey)("Heading.Monetization", t.TranslationNamespace.Analytics)
        },
        n = {
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
            group: i
        },
        l = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, a.translationKey)("Label.GamePasses", t.TranslationNamespace.Navigation),
            group: i
        },
        o = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, a.translationKey)("Label.ThirdPartyAvatarItemCommissions", t.TranslationNamespace.Navigation),
            group: i
        },
        d = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, a.translationKey)("Heading.ItemAnalytics", t.TranslationNamespace.Analytics)
        },
        c = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, a.translationKey)("Heading.Ads", t.TranslationNamespace.Navigation),
            group: i
        },
        u = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, a.translationKey)("Heading.Subscriptions", t.TranslationNamespace.Navigation),
            group: i
        },
        m = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, a.translationKey)("Heading.MemoryStores", t.TranslationNamespace.Navigation)
        },
        p = {
            path: "/analytics/queue-service",
            pathPattern: /\/analytics\/queue-service/,
            title: (0, a.translationKey)("Heading.QueueService", t.TranslationNamespace.Navigation)
        },
        y = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, a.translationKey)("Heading.DataStores", t.TranslationNamespace.Navigation)
        },
        g = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, a.translationKey)("Heading.HttpService", t.TranslationNamespace.Navigation)
        },
        b = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, a.translationKey)("Heading.MessagingService", t.TranslationNamespace.Navigation)
        },
        h = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, a.translationKey)("Heading.SpeechToText", t.TranslationNamespace.Navigation)
        },
        v = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, a.translationKey)("Heading.TextToSpeech", t.TranslationNamespace.Navigation)
        },
        f = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, a.translationKey)("Heading.VideoService", t.TranslationNamespace.Navigation)
        },
        N = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, a.translationKey)("Heading.CreatorRewards", t.TranslationNamespace.Navigation),
            group: i
        },
        T = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, a.translationKey)("Heading.RobloxPlusDeveloperProgram", t.TranslationNamespace.Navigation),
            group: i
        },
        k = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, a.translationKey)("Heading.Performance", t.TranslationNamespace.Navigation)
        },
        I = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, a.translationKey)("Heading.Crashes", t.TranslationNamespace.Analytics)
        },
        C = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, a.translationKey)("Heading.ErrorReport", t.TranslationNamespace.Navigation)
        },
        P = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, a.translationKey)("Heading.Demographics", t.TranslationNamespace.Navigation)
        },
        x = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, a.translationKey)("Heading.Economy", t.TranslationNamespace.Navigation)
        },
        E = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, a.translationKey)("Heading.Funnels", t.TranslationNamespace.Navigation)
        },
        H = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, a.translationKey)("Heading.Explore", t.TranslationNamespace.Navigation)
        },
        A = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, a.translationKey)("Heading.CustomDashboards", t.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, a.translationKey)("Heading.Retention", t.TranslationNamespace.Navigation)
        },
        M = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, a.translationKey)("Heading.Engagement", t.TranslationNamespace.Navigation)
        },
        w = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, a.translationKey)("Heading.Acquisition", t.TranslationNamespace.Navigation),
            group: n
        },
        R = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, a.translationKey)("Heading.Acquisition", t.TranslationNamespace.Navigation),
            group: n
        },
        L = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, a.translationKey)("Heading.CustomEvents", t.TranslationNamespace.Navigation)
        },
        D = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, a.translationKey)("Heading.Journeys", t.TranslationNamespace.Navigation)
        },
        j = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", t.TranslationNamespace.Navigation)
        },
        B = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", t.TranslationNamespace.Navigation)
        },
        F = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, a.translationKey)("Heading.Journeys", t.TranslationNamespace.Navigation)
        },
        z = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, a.translationKey)("Heading.Feedback", t.TranslationNamespace.PlayerFeedback)
        },
        K = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, a.translationKey)("Heading.ConfigsHistory", t.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.ConfigHistory", t.TranslationNamespace.Navigation)
        },
        V = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, a.translationKey)("Heading.Configs", t.TranslationNamespace.Navigation)
        },
        G = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, a.translationKey)("Heading.ConfigCreate", t.TranslationNamespace.Navigation)
        },
        U = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, a.translationKey)("Heading.Alerts", t.TranslationNamespace.Navigation)
        },
        O = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, a.translationKey)("Heading.CreateAlert", t.TranslationNamespace.ExperienceAlerts)
        },
        q = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, a.translationKey)("Heading.ConfigureAlert", t.TranslationNamespace.Navigation)
        },
        _ = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, a.translationKey)("Heading.CustomMatchmaking", t.TranslationNamespace.Matchmaking)
        },
        J = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, a.translationKey)("Heading.Commerce", t.TranslationNamespace.Navigation),
            group: i
        },
        Q = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, a.translationKey)("Heading.Assistant", t.TranslationNamespace.Analytics)
        },
        W = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, a.translationKey)("Heading.Assistant", t.TranslationNamespace.Analytics)
        },
        Y = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, a.translationKey)("Heading.Assistant", t.TranslationNamespace.Analytics)
        },
        $ = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, a.translationKey)("Heading.ExperimentsCreate", t.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, a.translationKeyWithoutNamespace)("Heading.Experimentation"),
            group: r
        },
        X = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, a.translationKey)("Heading.RecommendationService", t.TranslationNamespace.Navigation)
        },
        Z = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, a.translationKey)("Heading.SafetyOverview", t.TranslationNamespace.Analytics),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.Safety", t.TranslationNamespace.Navigation)
        },
        ee = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, a.translationKey)("Heading.Overview", t.TranslationNamespace.Navigation)
        },
        ea = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, a.translationKey)("Heading.Thumbnails", t.TranslationNamespace.Navigation)
        },
        et = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, a.translationKey)("Heading.Notifications", t.TranslationNamespace.Navigation)
        },
        ei = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, a.translationKey)("Heading.Subscriptions", t.TranslationNamespace.Navigation),
            group: i
        },
        en = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, a.translationKey)("Heading.GenerativeAI", t.TranslationNamespace.Navigation)
        },
        er = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, a.translationKey)("Heading.AvatarCreationTokens", t.TranslationNamespace.AvatarAnalytics),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.AvatarCreationTokens", t.TranslationNamespace.Navigation),
            group: i
        },
        es = [R, w, M, S, i, s, l, o, d, c, u, m, p, y, g, b, h, v, f, en, N, T, k, I, C, P, x, E, D, j, B, F, H, A, L, Q, W, Y, z, K, V, G, _, J, Z, ee, n, r, $, X, ea, et, ei, O, q, U, er];
    e.s(["analyticsAgentNavigationItem", 0, W, "analyticsAiChatNavigationItem", 0, Y, "analyticsAlertConfifurationNavigationItem", 0, q, "analyticsAlertCreationNavigationItem", 0, O, "analyticsAlertsNavigationItem", 0, U, "analyticsAnalyticsHomeNavigationItem", 0, n, "analyticsAssistantNavigationItem", 0, Q, "analyticsAudienceNavigationItem", 0, P, "analyticsAvatarCreationTokensNavigationItem", 0, er, "analyticsBountyPayoutsNavigationItem", 0, T, "analyticsCommerceNavigationItem", 0, J, "analyticsConfigsHistoryNavigationItem", 0, K, "analyticsConfigsNavigationItem", 0, V, "analyticsCrashesNavigationItem", 0, I, "analyticsCreationOverviewNavigationItem", 0, ee, "analyticsCustomDashboardsManageNavigationItem", 0, A, "analyticsCustomEventsNavigationItem", 0, L, "analyticsDataStoresNavigationItem", 0, y, "analyticsEngagementNavigationItem", 0, M, "analyticsErrorReportNavigationItem", 0, C, "analyticsExperienceCreatorRewardsNavigationItem", 0, N, "analyticsExperienceSubscriptionsNavigationItem", 0, ei, "analyticsExperimentsCreateNavigationItem", 0, $, "analyticsExperimentsNavigationItem", 0, r, "analyticsExploreNavigationItem", 0, H, "analyticsFeedbackNavigationItem", 0, z, "analyticsGenerativeAINavigationItem", 0, en, "analyticsHttpServiceNavigationItem", 0, g, "analyticsImmersiveAdsNavigationItem", 0, c, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, o, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, s, "analyticsItemMonetizationPassesNavigationItem", 0, l, "analyticsMatchmakingNavigationItem", 0, _, "analyticsMemoryStoresNavigationItem", 0, m, "analyticsMessagingServiceNavigationItem", 0, b, "analyticsMonetizationNavigationItem", 0, i, "analyticsNotificationsNavigationItem", 0, et, "analyticsPerformanceNavigationItem", 0, k, "analyticsQueueServiceNavigationItem", 0, p, "analyticsRecommendationServiceNavigationItem", 0, X, "analyticsRecommendedEventsEconomyNavigationItem", 0, x, "analyticsRecommendedEventsFunnelsNavigationItem", 0, E, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, j, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, B, "analyticsRecommendedEventsJourneyNavigationItem", 0, D, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, F, "analyticsRetentionNavigationItem", 0, S, "analyticsSafetyNavigationItem", 0, Z, "analyticsSpeechToTextNavigationItem", 0, h, "analyticsSubscriptionsNavigationItem", 0, u, "analyticsTextToSpeechNavigationItem", 0, v, "analyticsUserAcquisitionNavigationItem", 0, w, "analyticsUserAcquisitionRFYNavigationItem", 0, R, "analyticsVideoServiceNavigationItem", 0, f, "getAnalyticsNavigationItemFromPath", 0, function(e) {
        return es.find(a => a.pathPattern.test(e))
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
}, 177608, 966501, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        i = e.i(37819),
        n = e.i(602635),
        r = e.i(944672),
        s = e.i(79187),
        l = e.i(137467),
        o = e.i(665869),
        d = e.i(729904),
        c = e.i(507742),
        u = e.i(260241),
        m = e.i(84755),
        p = e.i(611043),
        y = e.i(537683),
        g = e.i(581577),
        b = e.i(894854),
        h = e.i(881670),
        v = e.i(174528),
        f = e.i(537068),
        N = e.i(589624),
        T = e.i(774756),
        k = e.i(253738),
        I = e.i(87034),
        C = e.i(114209),
        P = e.i(434925),
        x = e.i(128106),
        E = e.i(509049),
        H = e.i(634877);
    let A = (0, e.i(695763).makeStyles)()(e => ({
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
        S = (e, a) => a && e.replaceAll(/\[[^\]]*?\]/g, "") === (null == a ? void 0 : a.replaceAll(/\d+/g, "")) ? void 0 : a,
        M = (0, s.withTranslation)(e => {
            let {
                inLayoutHeader: r = !1
            } = e, {
                pathname: s,
                query: l
            } = (0, N.useRouter)(), {
                classes: {
                    linkStyle: o,
                    compactBreadCrumbLinkStyle: d,
                    breadcrumb: c,
                    breadcrumbBottomSpace: u,
                    compactBreadCrumb: m
                }
            } = A(), {
                insideTopNavigationDrawer: g
            } = (0, H.default)(), b = (0, I.useMediaQuery)(e => e.breakpoints.down("Medium")), {
                gameDetails: h
            } = (0, C.useCurrentGame)(), v = (0, t.useMemo)(() => {
                let e = s.includes("/analytics/dashboards/");
                return s.split("/").filter(e => !!e).filter(a => "analytics" !== a || !e)
            }, [s]), {
                itemNameMapping: M,
                pathLinkParams: w,
                displayNameParam: R
            } = (0, E.default)(), L = "string" == typeof l.dashboardId ? l.dashboardId : void 0, D = "string" == typeof l.id ? l.id : void 0, j = s.endsWith("/analytics/dashboards/[dashboardId]/edit") && D && L ? "/dashboard/creations/experiences/".concat(D, "/analytics/dashboards/").concat(L) : void 0, B = (0, t.useCallback)((e, t) => g ? t ? (0, a.jsx)(f.default, {
                href: t,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(k.Link, {
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
            }, e) : t ? (0, a.jsx)(f.default, {
                href: t,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(k.Link, {
                    classes: {
                        root: o
                    },
                    children: e
                })
            }, e) : (0, a.jsx)(p.Typography, {
                color: "secondary",
                children: e
            }, e), [g, o]), F = (0, t.useCallback)(e => {
                var a, t;
                let i = e.parentItemTypeName ? P.RouterParseItemToBreadcrumbItemDetails[e.parentItemTypeName] : null,
                    n = M[e.breadcrumbType],
                    r = e.breadcrumbType === x.default.AnalyticsCustomDashboards && j ? j : void 0,
                    l = null != r ? r : null == (a = e.getLinkPath) ? void 0 : a.call(e, w),
                    o = void 0 !== r || null === i || e.breadcrumbType !== i.breadcrumbType;
                return [i ? B(i.displayName(R), S(s, null == (t = i.getLinkPath) ? void 0 : t.call(i, w))) : null, n ? B(n, o ? S(s, l) : void 0) : null]
            }, [M, w, B, R, s, j]), z = (0, t.useMemo)(() => {
                var e;
                let a;
                return e = P.RouterParseItemToBreadcrumbItemDetails, a = [], v.filter(a => e[a]).forEach(t => {
                    let i = e[t],
                        n = i.displayName(R);
                    if (n && a.push(n), i.withId) {
                        let e = M[i.breadcrumbType];
                        e && a.push(e)
                    }
                }), a
            }, [v, R, M]), K = (0, t.useMemo)(() => (function(e) {
                if (e.length < 2) return;
                let a = e[e.length - 1],
                    t = e[e.length - 2];
                if (a && t) return "".concat(t, " / ").concat(a)
            })(z), [z]), V = (0, t.useMemo)(() => {
                var e, a;
                return s.includes("/experiences/") ? {
                    description: null == h ? void 0 : h.name,
                    author: null == h || null == (e = h.creator) ? void 0 : e.name,
                    entityName: null == h ? void 0 : h.name,
                    entityId: null == h || null == (a = h.id) ? void 0 : a.toString(),
                    type: "experience"
                } : {}
            }, [s, h]), {
                breadcrumbsContents: G,
                breadcrumbNames: U
            } = (0, t.useMemo)(() => {
                let e = e => {
                        if (e.withId) {
                            var a;
                            return null != (a = M[e.breadcrumbType]) ? a : e.displayName(R)
                        }
                        return e.displayName(R)
                    },
                    t = v.map(e => ({
                        key: e,
                        breadcrumbDetails: P.RouterParseItemToBreadcrumbItemDetails[e]
                    })).filter(e => e.breadcrumbDetails);
                if (r && b) {
                    var i;
                    if (0 === t.length) return {
                        breadcrumbsContents: [],
                        breadcrumbNames: []
                    };
                    let {
                        key: n,
                        breadcrumbDetails: s
                    } = t[0], l = t.map(a => {
                        let {
                            breadcrumbDetails: t
                        } = a;
                        return e(t)
                    }), o = null == (i = s.getLinkPath) ? void 0 : i.call(s, w), c = (0, a.jsx)(p.Typography, {
                        color: "primary",
                        "aria-current": "page",
                        variant: b && r ? "h3" : void 0,
                        children: e(s)
                    }, n);
                    return o ? {
                        breadcrumbsContents: [(0, a.jsx)(f.default, {
                            href: o,
                            className: d,
                            children: c
                        }, n)],
                        breadcrumbNames: l
                    } : {
                        breadcrumbsContents: [c],
                        breadcrumbNames: l
                    }
                }
                let {
                    contents: n,
                    names: l
                } = t.reduce((i, n, l) => {
                    var o, d;
                    let {
                        key: c,
                        breadcrumbDetails: u
                    } = n;
                    if (!u) return i;
                    if (l === t.length - 1) {
                        let t = e(u);
                        if (!t) return i;
                        let n = u.parentItemTypeName ? P.RouterParseItemToBreadcrumbItemDetails[u.parentItemTypeName] : null,
                            l = M[u.breadcrumbType];
                        if (u.withId && u.breadcrumbType === x.default.AnalyticsCustomDashboards && null !== n && void 0 !== l) {
                            let e = n.displayName(R);
                            return {
                                contents: [...i.contents, B(e, S(s, null == (d = n.getLinkPath) ? void 0 : d.call(n, w))), B(l, j)],
                                names: [...i.names, e, l]
                            }
                        }
                        return {
                            contents: [...i.contents, (0, a.jsx)(p.Typography, {
                                color: "primary",
                                "aria-current": "page",
                                variant: b && r ? "h3" : void 0,
                                children: t
                            }, c)],
                            names: [...i.names, t]
                        }
                    }
                    if (u.withId) {
                        let e = u.parentItemTypeName ? P.RouterParseItemToBreadcrumbItemDetails[u.parentItemTypeName] : null,
                            a = M[u.breadcrumbType];
                        return {
                            contents: i.contents.concat(F(u)),
                            names: [...i.names, ...e ? [e.displayName(R)] : [], ...a ? [a] : []]
                        }
                    }
                    let m = u.displayName(R);
                    return m ? {
                        contents: [...i.contents, B(m, null == (o = u.getLinkPath) ? void 0 : o.call(u, w))],
                        names: [...i.names, m]
                    } : i
                }, {
                    contents: [],
                    names: []
                });
                return {
                    breadcrumbsContents: n,
                    breadcrumbNames: l
                }
            }, [v, r, b, R, M, w, d, B, j, F, s]), O = (0, t.useMemo)(() => U[U.length - 1], [U]), q = (0, t.useMemo)(() => (0, i.buildBreadcrumb)(...U), [U]), _ = K && (0, a.jsx)(i.HubMeta, {
                title: O,
                breadcrumb: q,
                seoTitle: K,
                ...V
            });
            return b ? (0, a.jsxs)(y.Grid, {
                className: r ? void 0 : m,
                children: [_, (0, a.jsx)(T.Breadcrumbs, {
                    id: "navigation-breadcrumbs",
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: (r || G.length > 1) && G
                })]
            }) : g ? (0, a.jsxs)(y.Grid, {
                children: [_, (0, a.jsxs)(T.Breadcrumbs, {
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: [(0, a.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: (0, a.jsx)(n.CurrentProductName, {})
                    }, "product-name"), G.slice(0, -1)]
                })]
            }) : (0, a.jsxs)(y.Grid, {
                className: "".concat(c, " ").concat(G.length > 1 && !r ? u : ""),
                children: [_, (0, a.jsx)(T.Breadcrumbs, {
                    id: "navigation-breadcrumbs",
                    maxItems: 8,
                    "aria-label": "breadcrumb",
                    children: G.length > 1 && G
                }), " "]
            })
        }, [h.TranslationNamespace.Creations, h.TranslationNamespace.AudienceReach, h.TranslationNamespace.Features, h.TranslationNamespace.AssetTypes, h.TranslationNamespace.SendrNotificationPreferences, h.TranslationNamespace.Advanced, h.TranslationNamespace.OpenCloud, h.TranslationNamespace.Error, h.TranslationNamespace.DataCollectionSettings, h.TranslationNamespace.UnifiedNavigation, h.TranslationNamespace.Payouts, h.TranslationNamespace.Matchmaking, h.TranslationNamespace.Environments, h.TranslationNamespace.Navigation, h.TranslationNamespace.MarketplaceOnboarding, h.TranslationNamespace.PublicPublish, h.TranslationNamespace.ExperienceAlerts, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.DevEx, h.TranslationNamespace.Publishing]),
        w = () => {
            let {
                currentItemType: e,
                isCurrentItemLoading: a,
                currentItemGroupId: i,
                hasCurrentItemLoadError: r
            } = (0, E.default)(), {
                isLoading: s,
                setWorkspaceByGroupId: l
            } = (0, n.useWorkspaces)();
            return (0, t.useEffect)(() => {
                !e || a || r || s || l(null != i ? i : null)
            }, [i, e, r, a, s, l]), null
        },
        R = "applayout-scroll-container",
        L = (0, c.default)(() => Promise.resolve(v.default), {
            ssr: !1
        }),
        D = (0, s.withTranslation)(e => {
            var i;
            let {
                title: r,
                beta: l = !1,
                secondaryRail: o,
                pageBanner: d,
                useBreadcrumbs: c = !1,
                secondarySize: h = "small",
                omitPageTitle: v = !1,
                children: f
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
            return (0, a.jsxs)(n.CreatorHubLayout, {
                children: [(0, a.jsx)(w, {}), T, (0, a.jsx)(n.CreatorHubLayout.Rail, {
                    openStudio: I,
                    secondarySize: h,
                    children: o
                }), (0, a.jsx)(n.CreatorHubLayout.Header, {
                    children: c ? (0, a.jsx)(M, {
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
                }), (0, a.jsx)(n.CreatorHubLayout.PageContent, {
                    id: R,
                    banner: d,
                    additionalLinks: (0, a.jsx)(L, {
                        inline: !0
                    }),
                    children: (0, a.jsxs)("div", {
                        className: "width-full height-full",
                        children: [c && (null != (i = !v && P) ? i : l) && (0, a.jsxs)("div", {
                            className: "flex items-center gap-small padding-bottom-large",
                            children: [!v && P, l && (0, a.jsx)(p.Typography, {
                                children: (0, a.jsx)(m.Label, {
                                    labelText: k("Label.Beta")
                                })
                            })]
                        }), f, (0, a.jsx)(u.CookieConsentBanner, {})]
                    })
                })]
            })
        }, [...n.REQUIRED_TRANSLATION_NAMESPACES, h.TranslationNamespace.RightsPortal, h.TranslationNamespace.DeveloperProducts, h.TranslationNamespace.Passes, h.TranslationNamespace.Creations, h.TranslationNamespace.PageTitles, h.TranslationNamespace.Features, h.TranslationNamespace.Privacy, h.TranslationNamespace.Error, h.TranslationNamespace.Analytics, h.TranslationNamespace.TalentHubV2, h.TranslationNamespace.Licenses, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.RevenueShareAgreements, h.TranslationNamespace.TaxDocumentation]);
    e.s(["SCROLL_CONTAINER_ID", 0, R, "default", 0, D], 966501);
    let j = {
        enabled: !0,
        isFetched: !0
    };
    e.s(["default", 0, e => {
        let {
            product: c,
            children: u,
            beta: m,
            title: p,
            secondarySize: y = "large",
            secondaryRail: g,
            pageBanner: b,
            omitPageTitle: h,
            analyticsAssistantChatHref: v,
            analyticsAssistantChatUniverseId: f,
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
            children: [T && P && (0, a.jsx)(i.HubMeta, {
                title: P
            }), (0, a.jsx)(n.NavigationConfigsProvider, {
                currentProduct: null != c ? c : "CreatorDashboard",
                environment: (0, d.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: j,
                enableGroupModeration: null != I && I,
                analyticsAssistantChatHref: v,
                analyticsAssistantChatUniverseId: f,
                children: (0, a.jsx)(D, {
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
}, 450639, 51620, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        i = e.i(79187),
        n = e.i(958885),
        r = e.i(808377),
        s = e.i(401602),
        l = e.i(537683),
        o = e.i(761563),
        d = e.i(484613);
    e.s(["NotInterestedIcon", () => d.NotInterested], 51620);
    var d = d,
        c = e.i(338078),
        u = e.i(611043),
        m = e.i(695763);
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
            returnPolicy: g = n.ReturnPolicy.AutoGenerated,
            isStatusTextShown: b = !1,
            alt: h,
            fontColor: v = "light",
            bottomRightAdornment: f
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
        } = p("light" !== v)(), {
            translate: E
        } = (0, i.useTranslation)(), [H, A] = (0, t.useState)(!1), [S, M] = (0, t.useState)(), w = (0, t.useCallback)(async function(e, a, t) {
            let i = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (a && e) {
                A(!0);
                try {
                    let r = i ? n.ThumbnailClient.reloadThumbnailImage : n.ThumbnailClient.getThumbnailImage,
                        s = await r(e, a, t);
                    M(s)
                } catch (e) {
                    M({
                        state: r.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    A(!1)
                }
            }
        }, []), R = (0, t.useMemo)(() => {
            if (H) return (0, a.jsx)(c.Skeleton, {
                classes: {
                    root: x
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                t = null;
            switch (null == S ? void 0 : S.state) {
                case r.ThumbnailResponseState.InReview:
                    e = E("Label.InReview"), t = (0, a.jsx)(o.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === v ? void 0 : "secondary"
                    });
                    break;
                case r.ThumbnailResponseState.Blocked:
                    e = E("Label.Moderated"), t = (0, a.jsx)(d.NotInterested, {
                        fontSize: "large",
                        color: "dark" === v ? void 0 : "secondary"
                    });
                    break;
                case r.ThumbnailResponseState.Error:
                case r.ThumbnailResponseState.TemporarilyUnavailable:
                    e = E("Label.Unavailable"), t = (0, a.jsx)(s.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === v ? void 0 : "secondary"
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
        }, [H, null == S ? void 0 : S.state, N, b, T, x, E, v]);
        return (0, t.useEffect)(() => {
            w(y, m, g)
        }, [m, y, g, w]), {
            thumbnailImage: (0, a.jsx)(l.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, a.jsxs)("div", {
                    className: I,
                    children: [(null == S ? void 0 : S.state) === r.ThumbnailResponseState.Completed ? (0, a.jsx)("img", {
                        className: C,
                        src: null == S ? void 0 : S.imageUrl,
                        alt: h
                    }) : (0, a.jsx)("div", {
                        className: k,
                        children: R
                    }), f ? (0, a.jsx)("div", {
                        className: P,
                        children: f
                    }) : null]
                })
            }),
            thumbnailData: S,
            refreshThumbnail: (0, t.useCallback)(async () => w(y, m, g, !0), [w, y, m, g])
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
            let [t, i] = a;
            return Array.isArray(i) ? e[t] = i.at(0) : e[t] = i, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 634877, e => {
    "use strict";
    var a = e.i(416340);
    let t = (0, a.createContext)({
        insideTopNavigationDrawer: !1
    });
    t.displayName = "TopNavigationSidebarDrawerContext", e.s(["default", 0, function() {
        return (0, a.useContext)(t)
    }], 634877)
}, 114209, 559227, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        i = e.i(589624),
        n = e.i(773057),
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
        d = e.i(533968);
    let c = new class {
        async getGameDetail(e, a) {
            var t, i, n;
            if (!a && this.gameDetailsMap.has(e)) return null != (t = this.gameDetailsMap.get(e)) ? t : null;
            try {
                let a = null != (i = null == (n = (await this.gamesClient.getDetails([e])).data) ? void 0 : n[0]) ? i : null;
                return a && this.gameDetailsMap.set(e, a), a
            } catch (t) {
                let a = (0, d.getResponseFromError)(t);
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
                let a = (0, d.getResponseFromError)(t);
                if ((null == a ? void 0 : a.status) === o.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, a) {
            (0, l._)(this, "gamesClient", void 0), (0, l._)(this, "developClient", void 0), (0, l._)(this, "gameDetailsMap", void 0), (0, l._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = a, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(r.default, n.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: n,
            children: r
        } = e, l = (0, i.useRouter)(), [o, d] = (0, t.useState)(!0), [u, m] = (0, t.useState)(null), [p, y] = (0, t.useState)(null), [g, b] = (0, t.useState)(!1), [h, v] = (0, t.useState)(), f = (0, t.useRef)(0), N = (0, t.useCallback)(async function(e) {
            let a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                t = f.current += 1,
                i = c.getConfiguration(e),
                n = c.getGameDetail(e, a),
                [r, s] = await Promise.allSettled([i, n]);
            t === f.current && ("fulfilled" === r.status ? m(r.value) : m(null), "fulfilled" === s.status ? (b(!1), y(s.value)) : ("rejected" === s.status ? b(!0) : b(!1), y(null)), v(e), d(!1))
        }, []), T = (0, t.useMemo)(() => {
            let {
                id: e
            } = l.query;
            return n || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [n, l.query]), k = (0, t.useCallback)(() => T ? N(T, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [T, N]);
        (0, t.useEffect)(() => {
            try {
                if (void 0 !== T && !Number.isNaN(T) && T > 0) return void N(T);
                f.current += 1, v(void 0), m(null), y(null), b(!1), d(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(T))
            }
        }, [T, N]);
        let I = o || void 0 !== T && !Number.isNaN(T) && T > 0 && h !== T,
            C = (0, t.useMemo)(() => ({
                isLoadingGame: I,
                canConfigure: u,
                gameDetails: p,
                isErrorLoadingGame: g,
                refreshGameDetails: k
            }), [I, u, p, g, k]);
        return (0, a.jsx)(s.Provider, {
            value: C,
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
    let i = async e => t.dashboard.getServerManagementUrl(e, await (0, a.isClientSessionsEnabled)({
        universeId: e
    }));
    e.s(["isObservabilityServerManagementPath", 0, e => e.includes("/observability/server-management"), "resolveServerManagementUrl", 0, i])
}, 808377, e => {
    "use strict";
    var a = e.i(620140);
    e.s(["ThumbnailResponseState", () => a.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 805476, e => {
    "use strict";
    var a = e.i(999210),
        t = e.i(562991),
        i = e.i(197649),
        n = e.i(416340);
    let r = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        s = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["CloseAffordance", 0, e => {
        let {
            variant: l,
            size: o,
            isCircular: d,
            className: c,
            ...u
        } = e;
        return n.default.createElement("button", {
            type: "button",
            className: (0, i.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", a.interactable, s[l], r[o], d && "radius-circle", c),
            ...u
        }, n.default.createElement(a.StateLayer, null), n.default.createElement(t.Icon, {
            name: "icon-regular-x",
            size: o
        }))
    }])
}, 973047, e => {
    "use strict";
    var a = e.i(247268),
        t = e.i(197649),
        i = e.i(416340),
        n = e.i(425353),
        r = e.i(199512);
    let s = (0, i.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        l = () => {
            let e = (0, i.useContext)(s);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        o = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        d = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        c = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        u = e => {
            let {
                open: a,
                onOpenChange: t,
                children: r,
                size: l,
                type: o = "Default",
                isModal: d,
                hasCloseAffordance: c,
                closeLabel: u,
                hasMarginTop: m = !0,
                hasMarginBottom: p = !0,
                hasDescription: y = !1,
                experimentalDisablePointerEventsStylingOnBody: g = !1
            } = e, b = (0, i.useMemo)(() => ({
                size: l,
                isModal: d,
                type: o,
                hasCloseAffordance: c,
                closeLabel: u,
                hasMarginTop: m,
                hasMarginBottom: p,
                hasDescription: y
            }), [l, d, o, c, u, m, p, y]);
            return (0, i.useEffect)(() => {
                g && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [g, a]), i.default.createElement(s.Provider, {
                value: b
            }, i.default.createElement(n.Root, {
                open: a,
                onOpenChange: t
            }, r))
        };
    u.displayName = "Dialog";
    let m = e => {
        let {
            children: r,
            className: s,
            style: o,
            overlayClassName: d,
            overlayStyle: c,
            onOpenAutoFocus: u,
            ...m
        } = e, {
            size: p,
            isModal: y,
            hasCloseAffordance: g,
            closeLabel: b,
            hasDescription: h
        } = l(), v = (0, t.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", y && "bg-common-backdrop", d), f = (0, t.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", s);
        return i.default.createElement(n.Portal, null, i.default.createElement(n.Overlay, {
            className: v,
            style: c
        }, i.default.createElement(n.Content, {
            className: f,
            "data-size": p,
            style: o,
            onOpenAutoFocus: u,
            ...!h && {
                "aria-describedby": void 0
            },
            ...m
        }, g && i.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, i.default.createElement(n.Close, {
            asChild: !0
        }, i.default.createElement(a.CloseAffordance, {
            variant: "OverMedia",
            size: p,
            isCircular: !0,
            "aria-label": b
        }))), r)))
    };
    m.displayName = "DialogContent";
    let p = e => {
        let {
            children: a,
            className: n,
            ...r
        } = e;
        return i.default.createElement("div", {
            className: (0, t.default)("foundation-web-dialog-hero-media", n),
            ...r
        }, a)
    };
    p.displayName = "DialogHeroMedia";
    let y = e => {
        let {
            children: a,
            className: n,
            ...r
        } = e, {
            size: s,
            hasMarginTop: u,
            hasMarginBottom: m
        } = l(), p = (0, t.default)(o[s], u && d[s], m && c[s], n);
        return i.default.createElement("div", {
            className: p,
            ...r
        }, a)
    };
    y.displayName = "DialogBody";
    let g = e => {
        let {
            children: a,
            className: t,
            hidden: s,
            ...l
        } = e, o = i.default.createElement(n.Title, {
            className: t,
            ...l
        }, a);
        return s ? i.default.createElement(r.VisuallyHidden, null, o) : o
    };
    g.displayName = "DialogTitle";
    let b = e => {
        let {
            children: a,
            className: n,
            ...r
        } = e, {
            size: s
        } = l(), d = (0, t.default)(o[s], c[s], n);
        return i.default.createElement("div", {
            className: d,
            ...r
        }, a)
    };
    b.displayName = "DialogFooter", e.s(["Dialog", 0, u, "DialogBody", 0, y, "DialogContent", 0, m, "DialogFooter", 0, b, "DialogHeroMedia", 0, p, "DialogTitle", 0, g])
}, 247268, e => {
    "use strict";
    var a = e.i(737586),
        t = e.i(880343),
        i = e.i(197649),
        n = e.i(416340);
    let r = {
            Small: "padding-xsmall",
            Medium: "padding-small",
            Large: "padding-small"
        },
        s = {
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-100"
        };
    e.s(["CloseAffordance", 0, e => {
        let {
            variant: l,
            size: o,
            isCircular: d,
            className: c,
            ...u
        } = e;
        return n.default.createElement("button", {
            type: "button",
            className: (0, i.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", a.interactable, s[l], r[o], d && "radius-circle", c),
            ...u
        }, n.default.createElement(a.StateLayer, null), n.default.createElement(t.Icon, {
            name: "icon-regular-x",
            size: o
        }))
    }])
}, 774756, 434925, e => {
    "use strict";
    var a = e.i(30941),
        t = e.i(416340),
        i = e.i(936993),
        n = e.i(129210),
        r = e.i(477763),
        s = e.i(169336);
    e.i(210246);
    var l = e.i(226319),
        o = e.i(588393),
        d = e.i(221628),
        c = e.i(759599),
        u = e.i(928277),
        m = e.i(636042),
        p = e.i(442632),
        y = e.i(747310);
    e.i(797018);
    var g = (0, o.c)((0, d.jsx)("path", {
        d: "M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"
    }), "MoreHoriz");
    let b = ["slots", "slotProps"],
        h = (0, l.s)(c.B, {
            name: "MuiBreadcrumbCollapsed"
        })(e => {
            let {
                theme: a
            } = e;
            return (0, r._)({
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
                "&:hover, &:focus": (0, r._)({}, "light" === a.palette.mode ? {
                    backgroundColor: a.palette.grey[200]
                } : {
                    backgroundColor: a.palette.grey[600]
                }),
                "&:active": (0, r._)({
                    boxShadow: a.shadows[0]
                }, "light" === a.palette.mode ? {
                    backgroundColor: (0, s.n)(a.palette.grey[200], .12)
                } : {
                    backgroundColor: (0, s.n)(a.palette.grey[600], .12)
                })
            })
        }),
        v = (0, l.s)(g)({
            width: 24,
            height: 16
        });

    function f(e) {
        let {
            slots: a = {},
            slotProps: t = {}
        } = e, i = (0, s._)(e, b);
        return (0, d.jsx)("li", {
            children: (0, d.jsx)(h, (0, r._)({
                focusRipple: !0
            }, i, {
                ownerState: e,
                children: (0, d.jsx)(v, (0, r._)({
                    as: a.CollapsedIcon,
                    ownerState: e
                }, t.collapsedIcon))
            }))
        })
    }

    function N(e) {
        return (0, s.g)("MuiBreadcrumbs", e)
    }
    var T = (0, u.g)("MuiBreadcrumbs", ["root", "ol", "li", "separator"]);
    let k = ["children", "className", "component", "slots", "slotProps", "expandText", "itemsAfterCollapse", "itemsBeforeCollapse", "maxItems", "separator"],
        I = (0, l.s)(m.T, {
            name: "MuiBreadcrumbs",
            slot: "Root",
            overridesResolver: (e, a) => [{
                ["& .".concat(T.li)]: a.li
            }, a.root]
        })({}),
        C = (0, l.s)("ol", {
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
        P = (0, l.s)("li", {
            name: "MuiBreadcrumbs",
            slot: "Separator",
            overridesResolver: (e, a) => a.separator
        })({
            display: "flex",
            userSelect: "none",
            marginLeft: 8,
            marginRight: 8
        }),
        x = t.forwardRef(function(e, a) {
            var i, n;
            let o = (0, p.u)({
                    props: e,
                    name: "MuiBreadcrumbs"
                }),
                {
                    children: c,
                    className: u,
                    component: m = "nav",
                    slots: g = {},
                    slotProps: b = {},
                    expandText: h = "Show path",
                    itemsAfterCollapse: v = 1,
                    itemsBeforeCollapse: T = 1,
                    maxItems: x = 8,
                    separator: E = "/"
                } = o,
                H = (0, s._)(o, k),
                [A, S] = t.useState(!1),
                M = (0, r._)({}, o, {
                    component: m,
                    expanded: A,
                    expandText: h,
                    itemsAfterCollapse: v,
                    itemsBeforeCollapse: T,
                    maxItems: x,
                    separator: E
                }),
                w = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, l.a)({
                        root: ["root"],
                        li: ["li"],
                        ol: ["ol"],
                        separator: ["separator"]
                    }, N, a)
                })(M),
                R = (0, y.u)({
                    elementType: g.CollapsedIcon,
                    externalSlotProps: b.collapsedIcon,
                    ownerState: M
                }),
                L = t.useRef(null),
                D = t.Children.toArray(c).filter(e => t.isValidElement(e)).map((e, a) => (0, d.jsx)("li", {
                    className: w.li,
                    children: e
                }, "child-".concat(a)));
            return (0, d.jsx)(I, (0, r._)({
                ref: a,
                component: m,
                color: "text.secondary",
                className: (0, l.c)(w.root, u),
                ownerState: M
            }, H, {
                children: (0, d.jsx)(C, {
                    className: w.ol,
                    ref: L,
                    ownerState: M,
                    children: (i = A || x && D.length <= x || T + v >= D.length ? D : [...D.slice(0, T), (0, d.jsx)(f, {
                        "aria-label": h,
                        slots: {
                            CollapsedIcon: g.CollapsedIcon
                        },
                        slotProps: {
                            collapsedIcon: R
                        },
                        onClick: () => {
                            S(!0);
                            let e = L.current.querySelector("a[href],button,[tabindex]");
                            e && e.focus()
                        }
                    }, "ellipsis"), ...D.slice(D.length - v, D.length)], n = w.separator, i.reduce((e, a, t) => (t < i.length - 1 ? e = e.concat(a, (0, d.jsx)(P, {
                        "aria-hidden": !0,
                        className: n,
                        ownerState: M,
                        children: E
                    }, "separator-".concat(t))) : e.push(a), e), []))
                })
            }))
        });
    var E = (0, i.default)({
            name: "Breadcrumbs"
        })(function(e) {
            return {
                root: (0, a._)((0, a._)({}, e.typography.body1), {
                    color: e.palette.content.muted
                })
            }
        }),
        H = (0, t.forwardRef)(function(e, i) {
            var r = e.classes,
                s = e.className,
                l = (0, a.a)(e, ["classes", "className"]),
                o = E(void 0, {
                    props: {
                        classes: (0, n.default)(r, s)
                    }
                });
            return t.default.createElement(x, (0, a._)({
                classes: o.classes
            }, l, {
                ref: i
            }))
        });
    e.s(["Breadcrumbs", 0, H], 774756);
    var A = e.i(97782),
        S = e.i(475360),
        M = e.i(759283),
        w = e.i(829425),
        R = e.i(726474),
        L = e.i(86027),
        D = e.i(128106);
    let j = (e, a) => e.args && e.args.value ? a(e.key, {
            [e.args.param]: a(e.args.value)
        }) : a(e.key),
        B = e => {
            var a;
            let t = parseInt(null != (a = e.developerItemId) ? a : "", 10);
            return Number.isNaN(t) ? R.dashboard.configureCreatorStoreItemBasePath : R.dashboard.getConfigureCreatorStoreItemUrl(t)
        },
        F = {
            analytics: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Analytics"
                    }, a)
                },
                breadcrumbType: D.default.Catalog
            },
            observability: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Observability"
                    }, a) || "Observability"
                },
                breadcrumbType: D.default.Observability
            },
            creations: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.default.Creations,
                getLinkPath: e => (null == e ? void 0 : e.groupId) ? "/dashboard/creations?groupId=".concat(null == e ? void 0 : e.groupId) : "/dashboard/creations"
            },
            experiences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Games"
                    }, a)
                },
                breadcrumbType: D.default.Games,
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/overview")
            },
            collaborators: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Tab.Collaborators"
                    }, a)
                },
                breadcrumbType: D.default.Collaborators,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/collaborators")
            },
            badges: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Badges"
                    }, a)
                },
                breadcrumbType: D.default.Badge,
                parentItemTypeName: "associated-items",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/badges/").concat(e.badgeId, "/overview")
            },
            "referral-reward-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ReferralRewards"
                    }, a)
                },
                breadcrumbType: D.default.ReferralRewards,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/referral-reward-details"),
                parentItemTypeName: "referral-reward-details",
                withId: !0
            },
            bundle: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.default.Bundle,
                getLinkPath: e => "/dashboard/creations/bundle/".concat(e.bundleId, "/configure"),
                withId: !0
            },
            "experience-subscriptions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Subscriptions"
                    }, a)
                },
                breadcrumbType: D.default.ExperienceSubscription,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "associated-items": {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t ? j({
                        key: M.itemFullNameKeys[t]
                    }, a) : j({
                        key: "Heading.AssociatedItems"
                    }, a)
                },
                breadcrumbType: D.default.AssociatedItems,
                getLinkPath: e => (null == e ? void 0 : e.associatedItemType) === S.Item.DeveloperProduct ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/developer-products") : (null == e ? void 0 : e.associatedItemType) === S.Item.ExperienceSubscription ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/subscriptions") : (null == e ? void 0 : e.associatedItemType) === S.Item.GamePass ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/passes") : (null == e ? void 0 : e.associatedItemType) ? "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items?activeTab=").concat(e.associatedItemType) : "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            catalog: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.default.Catalog,
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/configure"),
                withId: !0
            },
            store: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.default.CreatorStore,
                getLinkPath: B,
                withId: !0
            },
            "version-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.VersionHistory"
                    }, a)
                },
                breadcrumbType: D.default.CreatorStore,
                getLinkPath: B,
                withId: !1
            },
            dependencies: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Dependencies"
                    }, a)
                },
                breadcrumbType: D.default.CreatorStore,
                getLinkPath: B,
                withId: !1
            },
            localization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Localization"
                    }, a)
                },
                breadcrumbType: D.default.Localization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/localization")
            },
            "activity-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: D.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            activityFeed: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: D.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            notifications: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Notifications"
                    }, a)
                },
                breadcrumbType: D.default.Notifications,
                getLinkPath: e => e.baseId ? "/dashboard/creations/experiences/".concat(e.baseId, "/notifications") : "/settings/notifications"
            },
            update: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Notifications.UpdateContent"
                    }, a)
                },
                breadcrumbType: D.default.Notifications
            },
            "social-links": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.SocialLinks"
                    }, a)
                },
                breadcrumbType: D.default.SocialLinks,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/social-links")
            },
            updates: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Updates"
                    }, a)
                },
                breadcrumbType: D.default.Updates,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/updates")
            },
            translation: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Translation"
                    }, a)
                },
                breadcrumbType: D.default.Translation,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            overview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Overview"
                    }, a)
                },
                breadcrumbType: D.default.Overview
            },
            passes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.GamePass"
                    }, a)
                },
                breadcrumbType: D.default.GamePass,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "developer-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.DeveloperProduct"
                    }, a)
                },
                breadcrumbType: D.default.DeveloperProduct,
                withId: !0,
                parentItemTypeName: "associated-items"
            },
            "external-purchase-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ExternalPurchaseSettings"
                    }, a)
                },
                breadcrumbType: D.default.ExternalPurchaseSettings
            },
            "avatar-items": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Label.ThirdPartyAvatarItemCommissions"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMonetization
            },
            "avatar-creation-tokens": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AvatarCreationTokens"
                    }, a)
                },
                getLinkPath: e => w.creatorHub.dashboard.getMonetizationAvatarCreationTokensUrl(Number(e.baseId)),
                breadcrumbType: D.default.AnalyticsMonetization
            },
            subscriptions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Label.Subscriptions"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMonetization
            },
            commerce: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Commerce"
                    }, a)
                },
                getLinkPath: e => w.creatorHub.dashboard.getMonetizationCommerceUrl(Number(e.baseId)),
                breadcrumbType: D.default.Commerce
            },
            "create-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.CreateProduct"
                    }, a)
                },
                getLinkPath: e => w.creatorHub.dashboard.getMonetizationCommerceCreateProductUrl(Number(e.baseId)),
                breadcrumbType: D.default.CreateProducts
            },
            eligibility: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Eligibility"
                    }, a)
                },
                getLinkPath: () => "/settings/eligibility",
                breadcrumbType: D.default.Eligibility
            },
            "priced-assets": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PricedAssets"
                    }, a)
                },
                breadcrumbType: D.default.PricedAssets
            },
            "audio-distribution": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AudioDistribution"
                    }, a)
                },
                breadcrumbType: D.default.AudioDistribution
            },
            "paid-access": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PaidAccess"
                    }, a)
                },
                breadcrumbType: D.default.PaidAccess
            },
            "extended-services": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ExtendedServices"
                    }, a)
                },
                breadcrumbType: D.default.ExtendedServices
            },
            "public-publish": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PublicPublish"
                    }, a)
                },
                breadcrumbType: D.default.PublicPublish
            },
            "publishing-permissions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PublishingPermissions"
                    }, a)
                },
                breadcrumbType: D.default.PublishingPermissions
            },
            "us-o18-devex-rate": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.DevExO18UsSettingsNav"
                    }, a)
                },
                breadcrumbType: D.default.UsO18DevexRate
            },
            "contribution-report": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ContributionReports"
                    }, a)
                },
                breadcrumbType: D.default.ContributionReport
            },
            acquisition: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Acquisition"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsAcquisition
            },
            engagement: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Engagement"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsEngagement
            },
            retention: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Retention"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsRetention
            },
            monetization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Monetization"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMonetization,
                getLinkPath: e => w.creatorHub.dashboard.getMonetizationOverviewUrl(Number(e.baseId))
            },
            performance: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsPerformanceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsPerformance
            },
            crashes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsCrashesNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsCrashes
            },
            audience: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsAudienceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsAudience
            },
            economy: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsRecommendedEventsEconomyNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsEconomy
            },
            funnels: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsRecommendedEventsFunnelsNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsFunnels
            },
            journeys: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsRecommendedEventsJourneyNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsJourneys,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/journeys")
            },
            view: {
                displayName: () => "",
                withId: !0,
                breadcrumbType: D.default.AnalyticsJourneyDetail
            },
            edit: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Action.Edit"
                    }, a)
                },
                breadcrumbType: D.default.Create
            },
            preview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Action.CustomDashboards.Preview"
                    }, a)
                },
                breadcrumbType: D.default.Create
            },
            errors: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsErrorReportNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsErrorReport
            },
            "memory-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsMemoryStoresNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMemoryStores
            },
            "queue-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsQueueServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsQueueService
            },
            "data-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsDataStoresNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsDataStores
            },
            leaderboard: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Leaderboard"
                    }, a)
                },
                breadcrumbType: D.default.Leaderboard
            },
            "http-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsHttpServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsHttpServicce
            },
            "messaging-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsMessagingServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMessagingService
            },
            "speech-to-text": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsSpeechToTextNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsSpeechToText
            },
            "text-to-speech": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsTextToSpeechNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsTextToSpeech
            },
            "video-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsVideoServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsVideoService
            },
            "generative-ai": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsGenerativeAINavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsGenerativeAI
            },
            custom: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsCustomEventsNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticCustomEvents
            },
            explore: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsExploreNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsExploreMode
            },
            dashboards: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsCustomDashboardsManageNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsCustomDashboards,
                parentItemTypeName: "dashboards",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/dashboards")
            },
            "managed-pricing": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ManagedPricing"
                    }, a)
                },
                breadcrumbType: D.default.ManagedPricing,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/managed-pricing")
            },
            shop: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PersonalizedShop"
                    }, a)
                },
                breadcrumbType: D.default.PersonalizedShop,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/shop")
            },
            "developer-product-purchases-blocked": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.DeveloperProductPurchasesBlocked"
                    }, a)
                },
                breadcrumbType: D.default.DeveloperProductPurchasesBlocked,
                getLinkPath: e => R.dashboard.getDeveloperProductPurchasesBlockedUrl(Number(e.baseId))
            },
            "hard-coded-prices": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.HardCodedPrices"
                    }, a)
                },
                breadcrumbType: D.default.HardCodedPrices,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/hard-coded-prices")
            },
            "price-optimization": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PriceOptimization"
                    }, a)
                },
                breadcrumbType: D.default.PriceOptimization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/price-optimization")
            },
            "price-check": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.DynamicPriceCheck"
                    }, a)
                },
                breadcrumbType: D.default.PriceCheck
            },
            "immersive-ads": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Ads"
                    }, a)
                },
                breadcrumbType: D.default.ImmersiveAds,
                getLinkPath: e => w.creatorHub.dashboard.getMonetizationImmersiveAdsUrl(Number(e.baseId))
            },
            "create-placement": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AdsCreatePlacement"
                    }, a)
                },
                breadcrumbType: D.default.ImmersiveAdsCreatePlacement
            },
            "creator-rewards": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.CreatorRewards"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/creator-rewards")
            },
            "roblox-plus": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.RobloxPlusDeveloperProgram"
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/roblox-plus")
            },
            "experience-questionnaire": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ContentRating"
                    }, a)
                },
                breadcrumbType: D.default.Questionnaire
            },
            guidelines: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Guidelines"
                    }, a)
                },
                breadcrumbType: D.default.Questionnaire
            },
            configure: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t === S.Item.CatalogAsset || t === S.Item.LibraryAsset || t === S.Item.Bundle || t === S.Item.Event || t === S.Item.AvatarCreationToken || t === S.Item.Environment || t === S.Item.Look ? j({
                        key: "Heading.Configure"
                    }, a) : t === S.Item.Game ? j({
                        key: "Heading.ContentSettings"
                    }, a) : t === S.Item.ExperienceSubscription ? j({
                        key: "Heading.UpdateSubscription"
                    }, a) : t === S.Item.Alert ? j({
                        key: "Heading.ConfigureAlert"
                    }, a) : j({
                        key: "Heading.BasicSettings"
                    }, a)
                },
                breadcrumbType: D.default.Configure
            },
            "communication-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.CommunicationSettings"
                    }, a)
                },
                breadcrumbType: D.default.CommunicationSettings,
                getLinkPath: e => "/creations/experiences/".concat(e.baseId, "/communication-settings")
            },
            sales: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Sales"
                    }, a)
                },
                breadcrumbType: D.default.Sales
            },
            promotions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Promotions"
                    }, a)
                },
                breadcrumbType: D.default.Promotions
            },
            create: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t ? j({
                        key: "Heading.Create",
                        args: {
                            param: "itemType",
                            value: M.itemTypeToSingularNameKeys[t]
                        }
                    }, a) : j({
                        key: "Heading.Create"
                    }, a)
                },
                breadcrumbType: D.default.Create
            },
            places: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Places"
                    }, a)
                },
                breadcrumbType: D.default.Places,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/places"),
                parentItemTypeName: "places",
                withId: !0
            },
            environments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Environments"
                    }, a)
                },
                breadcrumbType: D.default.Environments,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/environments"),
                parentItemTypeName: "environments",
                withId: !0
            },
            new_environment: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Action.CreateEnvironment"
                    }, a)
                },
                breadcrumbType: D.default.Environments,
                parentItemTypeName: "environments"
            },
            manage: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Manage"
                    }, a)
                },
                breadcrumbType: D.default.Manage
            },
            icon: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Icon"
                    }, a)
                },
                breadcrumbType: D.default.Icon
            },
            events: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Events"
                    }, a)
                },
                breadcrumbType: D.default.Event,
                withId: !0,
                parentItemTypeName: "events",
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/events")
            },
            "select-eligibility": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Title.SelectEligibility"
                    }, a)
                },
                breadcrumbType: D.default.SelectEligibility
            },
            thumbnails: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PlaceThumbnails"
                    }, a)
                },
                breadcrumbType: D.default.Thumbnails
            },
            videos: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PlaceVideos"
                    }, a)
                },
                breadcrumbType: D.default.Videos
            },
            access: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AccessSettings"
                    }, a)
                },
                breadcrumbType: D.default.Access
            },
            secrets: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Secrets"
                    }, a)
                },
                breadcrumbType: D.default.Secrets
            },
            matchmaking: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.CustomMatchmaking"
                    }, a)
                },
                breadcrumbType: D.default.CustomMatchmaking,
                getLinkPath: e => R.dashboard.getCustomMatchmakingDashboardUrl(Number(e.baseId))
            },
            "server-management": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ServerManagement"
                    }, a)
                },
                breadcrumbType: D.default.ServerManagement,
                getLinkPath: e => {
                    var a;
                    return R.dashboard.getServerManagementUrl(Number(e.baseId), (0, L.isObservabilityServerManagementPath)(null != (a = e.pathname) ? a : ""))
                }
            },
            "client-sessions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ClientSessions"
                    }, a)
                },
                breadcrumbType: D.default.ClientSessions,
                getLinkPath: e => R.dashboard.getClientSessionsUrl(Number(e.baseId))
            },
            "[sessionId]": {
                displayName: () => "",
                breadcrumbType: D.default.ClientSession,
                withId: !0
            },
            "data-captures": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.DataCaptures"
                    }, a)
                },
                breadcrumbType: D.default.DataCaptures,
                getLinkPath: e => R.dashboard.getObservabilityDataCapturesUrl(Number(e.baseId)),
                parentItemTypeName: "data-captures",
                withId: !0
            },
            "create-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.CreateConfiguration"
                    }, a)
                },
                breadcrumbType: D.default.CreateMatchmakingConfiguration
            },
            "edit-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.EditConfiguration"
                    }, a)
                },
                breadcrumbType: D.default.EditMatchmakingConfiguration
            },
            "create-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.CreateAttribute"
                    }, a)
                },
                breadcrumbType: D.default.CreateMatchmakingAttribute,
                getLinkPath: e => R.dashboard.getCustomMatchmakingAttributeCreationUrl(Number(e.baseId))
            },
            "edit-player-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.EditPlayerAttribute"
                    }, a)
                },
                breadcrumbType: D.default.EditMatchmakingPlayerAttribute
            },
            "edit-server-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.EditServerAttribute"
                    }, a)
                },
                breadcrumbType: D.default.EditMatchmakingServerAttribute
            },
            settings: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Settings"
                    }, a)
                },
                breadcrumbType: D.default.Settings
            },
            permissions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Permissions"
                    }, a)
                },
                breadcrumbType: D.default.Permissions
            },
            webhooks: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Webhooks"
                    }, a)
                },
                breadcrumbType: D.default.Webhooks
            },
            "data-collection": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.DataSharing"
                    }, a)
                },
                breadcrumbType: D.default.DataSharing
            },
            "[notificationCategory]": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Notifications"
                    }, a)
                },
                withId: !0,
                breadcrumbType: D.default.Category
            },
            preferences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Preferences"
                    }, a)
                },
                breadcrumbType: D.default.Preferences
            },
            advanced: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Header.Title"
                    }, a)
                },
                breadcrumbType: D.default.Advanced
            },
            bans: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Moderation"
                    }, a)
                },
                breadcrumbType: D.default.Bans,
                getLinkPath: e => w.creatorHub.dashboard.getUserBansUrl(Number(e.baseId))
            },
            "anti-cheat": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AntiCheat"
                    }, a)
                },
                breadcrumbType: D.default.AntiCheat,
                getLinkPath: e => w.creatorHub.dashboard.getAntiCheatUrl(Number(e.baseId))
            },
            "issues-and-appeals": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.IssuesAndAppeals"
                    }, a)
                },
                breadcrumbType: D.default.IssuesAndAppeals,
                getLinkPath: e => w.creatorHub.dashboard.getIssuesAndAppealsUrl(Number(e.baseId))
            },
            "[violationId]": {
                displayName: () => "",
                breadcrumbType: D.default.GameViolation,
                withId: !0
            },
            add: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AddUsersToBan"
                    }, a)
                },
                breadcrumbType: D.default.Add
            },
            reorder: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Reorder"
                    }, a)
                },
                breadcrumbType: D.default.Reorder
            },
            feedback: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Feedback"
                    }, a)
                },
                breadcrumbType: D.default.Feedback
            },
            "api-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.APISettings"
                    }, a)
                },
                breadcrumbType: D.default.ApiSettings
            },
            configs: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Configs"
                    }, a)
                },
                breadcrumbType: D.default.Configs,
                getLinkPath: e => w.creatorHub.dashboard.getAnalyticsConfigsUrl(Number(e.baseId))
            },
            experiments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Experiments"
                    }, a)
                },
                breadcrumbType: D.default.Experiments,
                getLinkPath: e => w.creatorHub.dashboard.getExperimentsUrl(Number(e.baseId))
            },
            "experiment-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ExperimentCreate"
                    }, a)
                },
                breadcrumbType: D.default.ExperimentCreate
            },
            "experiment-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ExperimentDetails"
                    }, a)
                },
                breadcrumbType: D.default.ExperimentDetails,
                withId: !0
            },
            alerts: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Alerts"
                    }, a)
                },
                breadcrumbType: D.default.Alerts,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/alerts"),
                parentItemTypeName: "alerts",
                withId: !0
            },
            history: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ConfigsHistory"
                    }, a)
                },
                breadcrumbType: D.default.ConfigsHistory
            },
            "config-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ConfigCreate"
                    }, a)
                },
                breadcrumbType: D.default.ConfigCreate
            },
            variants: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Variants"
                    }, a)
                },
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/variants"),
                breadcrumbType: D.default.Catalog
            },
            look: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.default.Look,
                getLinkPath: e => "/dashboard/creations/look/".concat(e.lookId, "/configure"),
                withId: !0
            },
            "audience-reach": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AudienceReach"
                    }, a)
                },
                breadcrumbType: D.default.AudienceReach,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/audience-reach")
            },
            "game-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.GameDetails"
                    }, a)
                },
                breadcrumbType: D.default.GameDetails
            },
            "content-rating": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ContentRating"
                    }, a)
                },
                breadcrumbType: D.default.ContentRating
            },
            "advanced-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AdvancedSettings"
                    }, a)
                },
                breadcrumbType: D.default.AdvancedSettings
            },
            "game-join": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.AdvancedSettings"
                    }, a)
                },
                breadcrumbType: D.default.GameJoin
            },
            "manage-audience": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.ManageAudience"
                    }, a)
                },
                breadcrumbType: D.default.Publishing
            },
            "player-support": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: "Heading.PlayerSupport"
                    }, a)
                },
                breadcrumbType: D.default.PlayerSupport,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/player-support")
            },
            "[ticketId]": {
                displayName: () => "",
                breadcrumbType: D.default.PlayerSupportTicket
            },
            "recommendation-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: A.analyticsRecommendationServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.RecommendationService
            }
        };
    e.s(["RouterParseItemToBreadcrumbItemDetails", 0, F], 434925)
}, 401602, e => {
    "use strict";
    var a = e.i(484613);
    e.s(["BrokenImageOutlinedIcon", () => a.BrokenImageOutlined])
}, 761563, e => {
    "use strict";
    var a = e.i(484613);
    e.s(["HourglassEmptyIcon", () => a.HourglassEmpty])
}]);

//# debugId=e9b37d14-e2b1-9e4e-80a1-03b509b0117c
//# sourceMappingURL=3h93j84u-dvur.js.map