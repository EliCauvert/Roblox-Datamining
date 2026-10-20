;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "7ea3f299-b029-fa8e-3e16-170da8dafaa1")
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
        o = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomMetricsBackendEnabled",
            defaultValue: !1
        }),
        s = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentTargetingEnabled",
            defaultValue: !0
        }),
        c = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "acquisitionMigrationMetricsEnabled",
            defaultValue: !1
        }),
        l = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTargetingConfigsEnabled",
            defaultValue: !0
        }),
        d = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentNullControlValueEnabled",
            defaultValue: !0
        }),
        g = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentRolloutEnabled",
            defaultValue: !0
        }),
        p = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "IsGeneralBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        m = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "IsMonetizationBreakGlassBannerEnabled",
            defaultValue: !1
        }),
        u = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isPlayerFeedbackExampleCommentsEnabled",
            defaultValue: !1
        }),
        y = (0, a.defineFlag)({
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
        b = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "showCreatorRewardsReportingDisclaimer",
            defaultValue: !1
        }),
        f = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isRotraceMetricEnabled",
            defaultValue: !1
        }),
        U = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTelemetryMigrationEnabled",
            defaultValue: !1
        }),
        A = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "showVideoServiceDashboard",
            defaultValue: !1
        }),
        x = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isTreemapColorBySiblingProportionEnabled",
            defaultValue: !1
        }),
        E = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAssistantChartOverflowMenuEnabled",
            defaultValue: !1
        }),
        P = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isAnalyticsMetricAwareYAxisFormatterEnabled",
            defaultValue: !1
        }),
        C = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isCustomDashboardsLocalStorageEnabled",
            defaultValue: !1
        }),
        N = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isJourneyEventsEnabled",
            defaultValue: !1
        }),
        S = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionsEnabled",
            defaultValue: !1
        }),
        M = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsEnabled",
            defaultValue: !1
        }),
        T = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isEhdResultsAlwaysFetched",
            defaultValue: !1
        }),
        z = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isMetricVariantChartStateEnabled",
            defaultValue: !1
        }),
        I = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isPeriodSummaryBridgeEnabled",
            defaultValue: !1
        }),
        k = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentSegmentationEnabled",
            defaultValue: !1
        }),
        w = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isExperimentMetricsV2Enabled",
            defaultValue: !1
        }),
        R = (0, a.defineFlag)({
            namespace: "creator-analytics",
            name: "isClientSessionDetailsV2Enabled",
            defaultValue: !1
        });
    e.s(["acquisitionMigrationMetricsEnabled", 0, c, "analyticsChartLoadEventstreamEnabled", 0, t, "isAnalyticsAssistantChatEnabled", 0, y, "isAnalyticsAssistantIssueBannerEnabled", 0, v, "isAnalyticsAssistantStreamSilenceRecoveryEnabled", 0, h, "isAnalyticsMetricAwareYAxisFormatterEnabled", 0, P, "isAssistantChartOverflowMenuEnabled", 0, E, "isClientSessionDetailsV2Enabled", 0, R, "isClientSessionsEnabled", 0, S, "isCustomDashboardsLocalStorageEnabled", 0, C, "isCustomMetricsBackendEnabled", 0, o, "isEhdResultsAlwaysFetched", 0, T, "isEhdResultsEnabled", 0, M, "isExperimentMetricsV2Enabled", 0, w, "isExperimentNullControlValueEnabled", 0, d, "isExperimentRolloutEnabled", 0, g, "isExperimentSegmentationEnabled", 0, k, "isExperimentTargetingEnabled", 0, s, "isExperimentationTemplatesEnabled", 0, r, "isGeneralBreakGlassBannerEnabled", 0, p, "isJourneyEventsEnabled", 0, N, "isLimitedAnalyticsAdminMonitoringNavigationEnabled", 0, n, "isMetricVariantChartStateEnabled", 0, z, "isMonetizationBreakGlassBannerEnabled", 0, m, "isPeriodSummaryBridgeEnabled", 0, I, "isPlayerFeedbackExampleCommentsEnabled", 0, u, "isRotraceMetricEnabled", 0, f, "isTargetingConfigsEnabled", 0, l, "isTelemetryMigrationEnabled", 0, U, "isTreemapColorBySiblingProportionEnabled", 0, x, "showCreatorRewardsReportingDisclaimer", 0, b, "showVideoServiceDashboard", 0, A, "visibleAssetIdInPersonalizationEnabled", 0, i])
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
        o = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, a.translationKey)("Label.DeveloperProducts", t.TranslationNamespace.Navigation),
            group: n
        },
        s = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, a.translationKey)("Label.GamePasses", t.TranslationNamespace.Navigation),
            group: n
        },
        c = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, a.translationKey)("Label.ThirdPartyAvatarItemCommissions", t.TranslationNamespace.Navigation),
            group: n
        },
        l = {
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
        g = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, a.translationKey)("Heading.Subscriptions", t.TranslationNamespace.Navigation),
            group: n
        },
        p = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, a.translationKey)("Heading.MemoryStores", t.TranslationNamespace.Navigation)
        },
        m = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, a.translationKey)("Heading.DataStores", t.TranslationNamespace.Navigation)
        },
        u = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, a.translationKey)("Heading.HttpService", t.TranslationNamespace.Navigation)
        },
        y = {
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
        b = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, a.translationKey)("Heading.VideoService", t.TranslationNamespace.Navigation)
        },
        f = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, a.translationKey)("Heading.CreatorRewards", t.TranslationNamespace.Navigation),
            group: n
        },
        U = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, a.translationKey)("Heading.RobloxPlusDeveloperProgram", t.TranslationNamespace.Navigation),
            group: n
        },
        A = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, a.translationKey)("Heading.Performance", t.TranslationNamespace.Navigation)
        },
        x = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, a.translationKey)("Heading.Crashes", t.TranslationNamespace.Analytics)
        },
        E = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, a.translationKey)("Heading.ErrorReport", t.TranslationNamespace.Navigation)
        },
        P = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, a.translationKey)("Heading.Demographics", t.TranslationNamespace.Navigation)
        },
        C = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, a.translationKey)("Heading.Economy", t.TranslationNamespace.Navigation)
        },
        N = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, a.translationKey)("Heading.Funnels", t.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, a.translationKey)("Heading.Explore", t.TranslationNamespace.Navigation)
        },
        M = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, a.translationKey)("Heading.CustomDashboards", t.TranslationNamespace.Navigation)
        },
        T = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, a.translationKey)("Heading.Retention", t.TranslationNamespace.Navigation)
        },
        z = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, a.translationKey)("Heading.Engagement", t.TranslationNamespace.Navigation)
        },
        I = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, a.translationKey)("Heading.Acquisition", t.TranslationNamespace.Navigation),
            group: i
        },
        k = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, a.translationKey)("Heading.Acquisition", t.TranslationNamespace.Navigation),
            group: i
        },
        w = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, a.translationKey)("Heading.CustomEvents", t.TranslationNamespace.Navigation)
        },
        R = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, a.translationKey)("Heading.Journeys", t.TranslationNamespace.Navigation)
        },
        D = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", t.TranslationNamespace.Navigation)
        },
        H = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, a.translationKey)("Heading.JourneyEventsConfigCreate", t.TranslationNamespace.Navigation)
        },
        F = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, a.translationKey)("Heading.Journeys", t.TranslationNamespace.Navigation)
        },
        K = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, a.translationKey)("Heading.Feedback", t.TranslationNamespace.PlayerFeedback)
        },
        V = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, a.translationKey)("Heading.ConfigsHistory", t.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, a.translationKey)("Heading.ConfigHistory", t.TranslationNamespace.Navigation)
        },
        G = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, a.translationKey)("Heading.Configs", t.TranslationNamespace.Navigation)
        },
        B = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, a.translationKey)("Heading.ConfigCreate", t.TranslationNamespace.Navigation)
        },
        L = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, a.translationKey)("Heading.Alerts", t.TranslationNamespace.Navigation)
        },
        O = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, a.translationKey)("Heading.CreateAlert", t.TranslationNamespace.ExperienceAlerts)
        },
        j = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, a.translationKey)("Heading.ConfigureAlert", t.TranslationNamespace.Navigation)
        },
        q = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, a.translationKey)("Heading.CustomMatchmaking", t.TranslationNamespace.Matchmaking)
        },
        J = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, a.translationKey)("Heading.Commerce", t.TranslationNamespace.Navigation),
            group: n
        },
        _ = {
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
        Q = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, a.translationKey)("Heading.RecommendationService", t.TranslationNamespace.Navigation)
        },
        X = {
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
        er = [k, I, z, T, n, o, s, c, l, d, g, p, m, u, y, h, v, b, en, f, U, A, x, E, P, C, N, R, D, H, F, S, M, w, _, W, Y, K, V, G, B, q, J, X, Z, i, r, $, Q, ee, ea, et, O, j, L, ei];
    e.s(["analyticsAgentNavigationItem", 0, W, "analyticsAiChatNavigationItem", 0, Y, "analyticsAlertConfifurationNavigationItem", 0, j, "analyticsAlertCreationNavigationItem", 0, O, "analyticsAlertsNavigationItem", 0, L, "analyticsAnalyticsHomeNavigationItem", 0, i, "analyticsAssistantNavigationItem", 0, _, "analyticsAudienceNavigationItem", 0, P, "analyticsAvatarCreationTokensNavigationItem", 0, ei, "analyticsBountyPayoutsNavigationItem", 0, U, "analyticsCommerceNavigationItem", 0, J, "analyticsConfigsHistoryNavigationItem", 0, V, "analyticsConfigsNavigationItem", 0, G, "analyticsCrashesNavigationItem", 0, x, "analyticsCreationOverviewNavigationItem", 0, Z, "analyticsCustomDashboardsManageNavigationItem", 0, M, "analyticsCustomEventsNavigationItem", 0, w, "analyticsDataStoresNavigationItem", 0, m, "analyticsEngagementNavigationItem", 0, z, "analyticsErrorReportNavigationItem", 0, E, "analyticsExperienceCreatorRewardsNavigationItem", 0, f, "analyticsExperienceSubscriptionsNavigationItem", 0, et, "analyticsExperimentsCreateNavigationItem", 0, $, "analyticsExperimentsNavigationItem", 0, r, "analyticsExploreNavigationItem", 0, S, "analyticsFeedbackNavigationItem", 0, K, "analyticsGenerativeAINavigationItem", 0, en, "analyticsHttpServiceNavigationItem", 0, u, "analyticsImmersiveAdsNavigationItem", 0, d, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, c, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, o, "analyticsItemMonetizationPassesNavigationItem", 0, s, "analyticsMatchmakingNavigationItem", 0, q, "analyticsMemoryStoresNavigationItem", 0, p, "analyticsMessagingServiceNavigationItem", 0, y, "analyticsMonetizationNavigationItem", 0, n, "analyticsNotificationsNavigationItem", 0, ea, "analyticsPerformanceNavigationItem", 0, A, "analyticsRecommendationServiceNavigationItem", 0, Q, "analyticsRecommendedEventsEconomyNavigationItem", 0, C, "analyticsRecommendedEventsFunnelsNavigationItem", 0, N, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, D, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, H, "analyticsRecommendedEventsJourneyNavigationItem", 0, R, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, F, "analyticsRetentionNavigationItem", 0, T, "analyticsSafetyNavigationItem", 0, X, "analyticsSpeechToTextNavigationItem", 0, h, "analyticsSubscriptionsNavigationItem", 0, g, "analyticsTextToSpeechNavigationItem", 0, v, "analyticsUserAcquisitionNavigationItem", 0, I, "analyticsUserAcquisitionRFYNavigationItem", 0, k, "analyticsVideoServiceNavigationItem", 0, b, "getAnalyticsNavigationItemFromPath", 0, function(e) {
        return er.find(a => a.pathPattern.test(e))
    }])
}, 533968, e => {
    "use strict";
    var a = e.i(185915);
    e.s(["getResponseFromError", () => a.default])
}, 307529, e => {
    "use strict";
    var a, t = ((a = t || {}).Place = "Place", a.MyExperiences = "MyExperiences", a.SharedExperiences = "SharedExperiences", a.TShirt = "TShirt", a.Shirt = "Shirt", a.Pants = "Pants", a.Hat = "Hat", a.HairAccessory = "HairAccessory", a.FaceAccessory = "FaceAccessory", a.NeckAccessory = "NeckAccessory", a.ShoulderAccessory = "ShoulderAccessory", a.FrontAccessory = "FrontAccessory", a.BackAccessory = "BackAccessory", a.WaistAccessory = "WaistAccessory", a.TShirtAccessory = "TShirtAccessory", a.ShirtAccessory = "ShirtAccessory", a.PantsAccessory = "PantsAccessory", a.JacketAccessory = "JacketAccessory", a.SweaterAccessory = "SweaterAccessory", a.ShortsAccessory = "ShortsAccessory", a.DressSkirtAccessory = "DressSkirtAccessory", a.EyebrowAccessory = "EyebrowAccessory", a.EyelashAccessory = "EyelashAccessory", a.FaceMakeup = "FaceMakeup", a.LipMakeup = "LipMakeup", a.EyeMakeup = "EyeMakeup", a.AvatarBackground = "AvatarBackground", a.AvatarLooks = "AvatarLooks", a.Showcase = "Showcase", a.Decal = "Decal", a.Image = "Image", a.Audio = "Audio", a.Model = "Model", a.Mesh = "Mesh", a.MeshPart = "MeshPart", a.Plugin = "Plugin", a.EmoteAnimation = "EmoteAnimation", a.Animation = "Animation", a.Video = "Video", a.TextDocument = "TextDocument", a.Event = "Event", a.UpcomingEvent = "UpcomingEvent", a.DraftEvent = "DraftEvent", a.PastEvent = "PastEvent", a.FontFamily = "FontFamily", a.ShareLink = "ShareLink", a.Moments = "Moments", a.StorePreviewVideo = "StorePreviewVideo", a.GamePreviewVideo = "GamePreviewVideo", a.AllCatalogAsset = "All", a.AssetPermissionRequests = "AssetPermissionRequests", a);
    e.s(["default", 0, t])
}, 17829, e => {
    "use strict";
    var a, t = ((a = t || {}).User = "User", a.Group = "Group", a);
    e.s(["default", 0, t])
}, 251622, e => {
    "use strict";
    var a, t = ((a = t || {}).Game = "Game", a.Bundle = "Bundle", a.CatalogAsset = "CatalogAsset", a.LibraryAsset = "LibraryAsset", a.GamePass = "Pass", a.Badge = "Badge", a.DeveloperProduct = "DeveloperProduct", a.TranslatorGame = "TranslatorGame", a.Places = "Places", a.CreatedPlaces = "CreatedPlaces", a.Event = "Event", a.Notifications = "Notifications", a.ExperienceSubscription = "Subscription", a.Advanced = "Advanced", a.AvatarCreationToken = "AvatarCreationToken", a.ReferralRewards = "ReferralRewards", a.Environment = "Environment", a.Look = "Look", a.Alert = "Alert", a.Journey = "Journey", a);
    let n = Object.values(t);
    e.s(["default", 0, t, "isItem", 0, e => n.includes(e)])
}, 726474, e => {
    "use strict";
    var a = e.i(309999),
        t = e.i(307529),
        n = e.i(251622);
    let i = "".concat("https://create.roblox.com", "/store"),
        r = "".concat("https://create.roblox.com", "/docs"),
        o = {
            [a.CategoryType.Model]: "models",
            [a.CategoryType.Plugin]: "plugins",
            [a.CategoryType.Audio]: "audio",
            [a.CategoryType.FontFamily]: "fonts",
            [a.CategoryType.Decal]: "decals",
            [a.CategoryType.MeshPart]: "meshParts",
            [a.CategoryType.Video]: "videos",
            [a.CategoryType.Animation]: "",
            [a.CategoryType.Music]: "",
            [a.CategoryType.SoundEffect]: "",
            [a.CategoryType.UnknownAudio]: "",
            [a.CategoryType.Package]: "",
            [a.CategoryType.SharedPackage]: ""
        },
        s = (e, a) => "/dashboard/creations/experiences/".concat(e).concat(a ? "/observability" : "", "/server-management"),
        c = {
            getUrl: (e, a, t) => {
                let n = new URLSearchParams({
                    ...e ? {
                        groupId: e
                    } : {},
                    ...a ? {
                        assetType: a
                    } : {},
                    ...t ? {
                        activeTab: t
                    } : {}
                }).toString();
                return "/dashboard/creations".concat(n.length > 0 ? "?" : "").concat(n)
            },
            getConfigureItemUrl: (e, a) => {
                switch (a) {
                    case n.default.Game:
                        return c.getConfigureExperienceUrl(e);
                    case n.default.Bundle:
                        return c.getConfigureBundlePath(e);
                    case n.default.CatalogAsset:
                        return c.getConfigureAvatarItemsUrl(e);
                    default:
                        throw Error("Unsupported item type ".concat(String(a)))
                }
            },
            getExperienceOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/overview"),
            getConfigureBundlePath: e => "/dashboard/creations/bundle/".concat(e, "/configure"),
            getConfigureExperienceUrl: e => "/dashboard/creations/experiences/".concat(e, "/configure"),
            configureCreatorStoreItemBasePath: "/dashboard/creations/store/",
            getConfigureCreatorStoreItemUrl: e => "".concat(c.configureCreatorStoreItemBasePath).concat(e, "/configure"),
            getConfigureAvatarItemsUrl: e => "/dashboard/creations/catalog/".concat(e, "/configure"),
            getConfigureDeveloperProductUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/developer-products/").concat(a, "/configure"),
            getCreateDeveloperProductUrl: e => "/dashboard/creations/experiences/".concat(e, "/developer-products/create"),
            getConfigurePassUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(a, "/configure"),
            getConfigurePassSalesUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(a, "/sales"),
            getCreatePassUrl: e => "/dashboard/creations/experiences/".concat(e, "/passes/create"),
            getConfigureExperienceSubscriptionUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/").concat(a, "/configure"),
            getCreateExperienceSubscriptionUrl: e => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/create"),
            getUserBansUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans"),
            getAddUsersToBanUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans/add"),
            getAntiCheatUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/anti-cheat"),
            getIssuesAndAppealsUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals"),
            getGameViolationUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals/").concat(encodeURIComponent(a)),
            getAnalyticsOverviewUrl: () => "/dashboard/analytics",
            getAnalyticsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics"),
            getAnalyticsPerformanceUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/performance"),
            getAnalyticsPerformanceClientUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/performance?tab=client"),
            getAnalyticsEngagementUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/engagement"),
            getAnalyticsFunnelsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/funnels"),
            getAnalyticsEconomyUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/economy"),
            getAnalyticAcquisitionUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/acquisition"),
            getAnalyticAcquisitionHomeRecommendationsUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/acquisition?tab=homeRecommendations"),
            getAnalyticsConfigsUrl: e => "/dashboard/creations/experiences/".concat(e, "/configs"),
            getAnalyticsConfigsCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/configs/config-create"),
            getAnalyticsErrorsUrls: e => "/dashboard/creations/experiences/".concat(e, "/analytics/errors"),
            getAnalyticsExploreUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/explore"),
            getAnalyticsAgentUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/agent"),
            getAnalyticsJourneysUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys"),
            getAnalyticsJourneysCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/create"),
            getAnalyticsJourneysEditUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/edit?journeyName=").concat(encodeURIComponent(a)),
            getAnalyticsJourneysViewUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/view?filter_JourneyName=").concat(encodeURIComponent(a)),
            getBundleAnalyticsUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/bundle/".concat(e, "/analytics?rangeType=").concat(a)
            },
            getCatalogAnalyticsUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/catalog/".concat(e, "/analytics?rangeType=").concat(a)
            },
            getPlaceThumbnailsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(a, "/thumbnails"),
            getPlaceVideosUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(a, "/videos"),
            getPlaceIconUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(a, "/icon"),
            getExperienceAlertCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts/create"),
            getExperienceAlertConfigureUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/alerts/").concat(a, "/configure"),
            getExperienceAlertsUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts"),
            getExperienceWebhooksUrl: e => "/dashboard/creations/experiences/".concat(e, "/webhooks"),
            getExperimentsUrl: e => "/dashboard/creations/experiences/".concat(e, "/experiments"),
            getUploadUrl: function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : t.default.TShirt;
                return "/dashboard/creations/upload?assetType=".concat(e)
            },
            getDevexUrl: () => "/dashboard/devex",
            getBillingStatementUrl: e => "/dashboard/summary/".concat(e),
            getServiceActivityUrl: () => "/dashboard/billing",
            getMonetizationOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/overview"),
            getMonetizationDeveloperProductsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products"),
            getMonetizationDeveloperProductsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products?tab=Analytics"),
            getMonetizationDeveloperProductsExternalPurchaseSettingsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/developer-products/external-purchase-settings"),
            getMonetizationPassesUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/passes"),
            getMonetizationPassesAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/passes?tab=Analytics"),
            getMonetizationAvatarItemsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-items"),
            getMonetizationAvatarItemsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-items?tab=Analytics"),
            getMonetizationSubscriptionsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions"),
            getMonetizationSubscriptionsAnalyticsTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions?tab=Analytics"),
            getMonetizationSubscriptionsHistoryTabUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/subscriptions?tab=History"),
            getMonetizationCommerceUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/commerce"),
            getMonetizationCommerceCreateProductUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/commerce/create-products"),
            getMonetizationImmersiveAdsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/immersive-ads"),
            getMonetizationImmersiveAdsCreatePlacementUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/immersive-ads/create-placement"),
            getMonetizationCreatorRewardsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/creator-rewards"),
            getMonetizationBountyPayoutsUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/roblox-plus"),
            getMonetizationAvatarCreationTokensUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/avatar-creation-tokens"),
            getConfigureAvatarCreationTokenUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/avatar-creation-tokens/").concat(a, "/configure"),
            getMonetizationPriceOptimizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/price-optimization"),
            getMonetizationDynamicPriceCheckUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    t = new URLSearchParams(a).toString();
                return "/dashboard/creations/experiences/".concat(e, "/monetization/price-check").concat(t.length > 0 ? "?".concat(t) : "")
            },
            getManagedPricingUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing").concat(a ? "?tab=".concat(a) : ""),
            getManagedPricingEventDetailsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing/events/").concat(a, "/details"),
            getMonetizationHardCodedPricesUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/hard-coded-prices"),
            getPersonalizedShopsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/monetization/shop").concat(a ? "?tab=".concat(a) : ""),
            getDeveloperProductPurchasesBlockedUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/shop/developer-product-purchases-blocked"),
            getSellerOnboardingUrl: () => "/settings/eligibility/priced-assets",
            getTranslatorPortalUrl: () => "/dashboard/translator-portal",
            getAudioDistributionOnboardingUrl: () => "/settings/eligibility/audio-distribution",
            getCreateGroupUrl: () => "/dashboard/group/create",
            getGroupProfileUrl: e => {
                let a = new URLSearchParams({
                    groupId: e
                }).toString();
                return "/dashboard/group/profile".concat(a.length > 0 ? "?" : "").concat(a)
            },
            getRightsManagerAssetUrl: e => "/dashboard/rights-manager/accounts/contents/asset/".concat(e),
            getCustomMatchmakingDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking"),
            getCustomMatchmakingConfigurationDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Configuration"),
            getCustomMatchmakingAttributesDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Attributes"),
            getCustomMatchmakingAnalyticsDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Analytics"),
            getCustomMatchmakingConfigurationCreationUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-configuration/").concat(a),
            getCustomMatchmakingEditConfigurationUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-configuration/").concat(a),
            getCustomMatchmakingAttributeCreationUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-attribute"),
            getCustomMatchmakingEditServerAttributeUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-server-attribute/").concat(a),
            getCustomMatchmakingEditPlayerAttributeUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-player-attribute/").concat(a),
            getLocalizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/localization"),
            getDataStoresManagerUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/data-stores"),
            getExtendedServicesUnlock: e => "/dashboard/creations/experiences/".concat(e, "/extended-services"),
            getPaymentsUrl: () => "/dashboard/payments",
            getServerManagementUrl: function(e) {
                let a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return s(e, a)
            },
            getServerManagementServersUrl: function(e, a) {
                let t = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
                return "".concat(s(e, t), "/").concat(a, "/servers")
            },
            getServerManagementDetailsUrl: function(e, a, t) {
                let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    i = arguments.length > 4 ? arguments[4] : void 0,
                    r = arguments.length > 5 ? arguments[5] : void 0,
                    o = new URLSearchParams;
                (null != i || null != r) && o.set("logRange", "custom"), null != i && o.set("logStart", String(i)), null != r && o.set("logEnd", String(r));
                let c = o.toString();
                return "".concat(s(e, n), "/").concat(a, "/servers/").concat(t, "/details").concat(c ? "?".concat(c) : "")
            },
            getClientSessionsUrl: e => "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions"),
            getClientSessionDetailsUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions/").concat(a),
            getPlayerSupportUrl: (e, a) => "/dashboard/creations/experiences/".concat(e, "/player-support").concat(a ? "/".concat(a) : "")
        };
    e.s(["creatorStore", 0, {
        getUrl: () => i,
        getAssetUrl: e => "".concat(i, "/asset/").concat(e),
        getSearchUrl: (e, a) => {
            if ("" !== o[e]) return "".concat(i, "/").concat(o[e], "?keyword=").concat(encodeURIComponent(a));
            throw Error("Unsupported search asset type ".concat(e))
        }
    }, "dashboard", 0, c, "developerForum", 0, {
        getBaseUrl: () => "https://devforum.roblox.com",
        getCdnBaseUrl: () => "https://doy2mn9upadnk.cloudfront.net",
        getMediaCdnBaseUrl: () => "//d3vcfwomg2mj2z.cloudfront.net",
        getAnnouncementsPath: () => "/c/updates/announcements/36",
        getPublicSfxAnnouncementPath: () => "/t/public-sound-effects-upload-are-now-available-for-creators/2980704"
    }, "docs", 0, {
        getUrl: () => r,
        getAiDataSharingUrl: () => "".concat(r, "/ai-data-sharing"),
        getBadgesPublishingUrl: () => "".concat(r, "/production/publishing/badges"),
        getExperiencesPublishingUrl: () => "".concat(r, "/production/publishing/publishing-experiences-and-places"),
        getCrossServerChatUrl: () => "".concat(r, "/chat/cross-server-chat"),
        getStrongLanguageUrl: () => "".concat(r, "/projects/configure-games#allow-strong-language"),
        getSellingOnCreatorStoreUrl: () => "".concat(r, "/production/creator-store#distribute-and-sell-assets"),
        getPassesMonetizationUrl: () => "".concat(r, "/production/monetization/game-passes"),
        getDeveloperProductsMonetizationUrl: () => "".concat(r, "/production/monetization/developer-products"),
        getDeveloperProductsExternalPurchaseSettingsMonetizationUrl: () => "".concat(r, "/production/monetization/developer-products#outside-your-experience"),
        getExternalEligibilityReferenceUrl: () => "".concat(r, "/reference/engine/classes/MarketplaceService#ProcessReceipt"),
        getSubscriptionsMonetizationUrl: () => "".concat(r, "/production/monetization/subscriptions"),
        getSubscriptionsMonetizationAnalyticsUrl: () => "".concat(r, "/production/monetization/subscriptions#subscription-analytics"),
        getPriceOptimizationMonetizationUrl: () => "".concat(r, "/production/monetization/price-optimization"),
        getDynamicPriceCheckMonetizationUrl: () => "".concat(r, "/production/monetization/price-optimization#using-the-dynamic-price-check-tool"),
        getRegionalPricingMonetizationUrl: () => "".concat(r, "/production/monetization/regional-pricing"),
        getPriceLevelsApiMonetizationUrl: () => "".concat(r, "/production/monetization/regional-pricing#protect-your-trades-and-gifts"),
        getManagedPricingMonetizationUrl: () => "".concat(r, "/production/monetization/managed-pricing"),
        getPersonalizedShopsMonetizationUrl: () => "".concat(r, "/production/monetization/shop"),
        getImmersiveAdsMonetizationUrl: () => "".concat(r, "/production/monetization/immersive-ads"),
        getRewardedVideoUrl: () => "".concat(r, "/production/promotion/rewarded-video-ads"),
        getKidsAndSelectPublishingUrl: () => "".concat(r, "/production/publishing/kids-and-select"),
        getExperienceDetailsPageRewardedAdsUrl: () => "".concat(r, "/production/monetization/immersive-ads"),
        getCreatorStorePublishingUrl: () => "".concat(r, "/production/creator-store#distribute-and-sell-assets"),
        getDecalReferenceUrl: () => "".concat(r, "/reference/engine/classes/Decal"),
        getIntegrityServiceReferenceUrl: () => "".concat(r, "/reference/engine/classes/IntegrityService"),
        getOpenCloudReferenceUrl: () => "".concat(r, "/reference/cloud"),
        getAudioAssetsUrl: () => "".concat(r, "/building-and-visuals/audio/audio-assets"),
        getAssetsUrl: () => "".concat(r, "/projects/assets"),
        getClassicClothingUrl: () => "".concat(r, "/avatar/accessories/classic-clothing"),
        getEarningOnRobloxUrl: () => "".concat(r, "/production/earning-on-roblox"),
        getSettingUpStudioUrl: () => "".concat(r, "/studio/setup"),
        getStudioUrl: () => "".concat(r, "/studio"),
        getPlatformUrl: () => "".concat(r, "/platform"),
        getAnalyticsUrl: () => "".concat(r, "/production/analytics"),
        getAnalyticsErrorReportUrl: () => "".concat(r, "/production/analytics/error-report"),
        getAnalyticsJourneyEventsUrl: () => "".concat(r, "/production/analytics/journey-events"),
        getUnityGuideUrl: () => "".concat(r, "/unity"),
        getUnrealGuideUrl: () => "".concat(r, "/unreal"),
        getEventsPlatformUrl: () => "".concat(r, "/production/promotion/events-platform"),
        getAvatarItemsUrl: () => "".concat(r, "/avatar"),
        getClassicAccessoriesUrl: () => "".concat(r, "/art/accessories/classic-clothing"),
        getModelsUrl: () => "".concat(r, "/parts/models"),
        getMakeupLooksUrl: () => "".concat(r, "/avatar/makeup-looks"),
        getPluginsReferenceUrl: () => "".concat(r, "/reference/engine/classes/Plugin"),
        getVideoFrameReferenceUrl: () => "".concat(r, "/reference/engine/classes/VideoFrame#Video"),
        getMeshPartReferenceUrl: () => "".concat(r, "/reference/engine/classes/MeshPart"),
        getAnimationReferenceUrl: () => "".concat(r, "/reference/engine/classes/Animation"),
        getLocalizationGuideUrl: () => "".concat(r, "/production/localization"),
        getAssistantUrl: () => "".concat(r, "/assistant"),
        getAnalyticsRetentionGuideUrl: () => "".concat(r, "/production/analytics/retention#improve-day-1-retention"),
        getMonetizationNewUserExperienceGuideUrl: () => "".concat(r, "/production/monetization/improve-new-user-experience"),
        getAnalyticsEngagementGuideUrl: () => "".concat(r, "/production/analytics/engagement#improving-average-session-time"),
        getAnalyticsRetentionD7GuideUrl: () => "".concat(r, "/production/analytics/retention#improve-day-7-retention"),
        getAnalyticsRetentionD30GuideUrl: () => "".concat(r, "/production/analytics/retention#improve-day-30-retention"),
        getAnalyticsMonetizationPayerConversionRateGuideUrl: () => "".concat(r, "/production/analytics/monetization#improving-payer-conversion-rate"),
        getAnalyticsMonetizationARPPUGuideUrl: () => "".concat(r, "/production/analytics/monetization#improving-average-revenue-per-paying-user-arppu"),
        getAnalyticsFilterByMetricsGuideUrl: () => "".concat(r, "/production/analytics/analytics-dashboard#filter-by-metrics"),
        getAnalyticsEventTypesUrl: () => "".concat(r, "/production/analytics/event-types"),
        getDiscoveryUrl: () => "".concat(r, "/discovery"),
        getDiscoveryBestPracticesUrl: () => "".concat(r, "/discovery#best-practices-for-discovery"),
        getDiscoveryRecommendationUrl: () => "".concat(r, "/discovery#how-recommendation-works"),
        getDiscoveryKeySignalsUrl: () => "".concat(r, "/discovery#key-signals"),
        getDiscoveryGetDiscoveredUrl: () => "".concat(r, "/discovery#how-you-can-get-discovered-via-recommendations"),
        getCreatorStoreAssetModerationUrl: () => "".concat(r, "/production/creator-store#asset-requirements"),
        getCreatorStoreAccountRequirementsUrl: () => "".concat(r, "/production/creator-store#account-requirements"),
        getPerformanceOptimizationUrl: () => "".concat(r, "/performance-optimization"),
        getPromotionalThumbnailsUrl: () => "".concat(r, "/production/promotion/promotional-thumbnails"),
        getExperienceGenresUrl: () => "".concat(r, "/production/publishing/experience-genres"),
        getGenreDefinitionsUrl: () => "".concat(r, "/production/publishing/experience-genres#genre-and-subgenre-descriptions"),
        getExperienceGenresAppealUrl: () => "".concat(r, "/production/publishing/experience-genres#genre-accuracy"),
        getMakeExperiencePublicUrl: () => "".concat(r, "/production/publishing/publish-experiences-and-places#make-experience-public"),
        getOwnershipTransferUrl: () => "".concat(r, "/projects/experience-ownership-transfer"),
        getStreamingUrl: () => "".concat(r, "/workspace/streaming"),
        getAnimationTransferUrl: () => "".concat(r, "/projects/transferring-animations"),
        getGameDesignMissionsUrl: () => "".concat(r, "/production/game-design/introduction-to-quest-design"),
        getGameDesignStarterPackUrl: () => "".concat(r, "/production/game-design/starter-pack-design"),
        getGameDesignBundlesUrl: () => "".concat(r, "/production/game-design/monetization-foundations#bundles"),
        getGameDesignSeasonPassUrl: () => "".concat(r, "/production/game-design/season-pass-design"),
        getGameDesignEngagementRewardsUrl: () => "".concat(r, "/production/game-design/analytics-essentials#engagement-metrics\n"),
        getCloudServicesMemoryStoresAPIRequestsUrl: () => "".concat(r, "/cloud-services/memory-stores/observability#api-request-alerts"),
        getCloudServicesMemoryStoresMemoryUsageUrl: () => "".concat(r, "/cloud-services/memory-stores/observability#memory-usage-alerts"),
        getExperimentationUrl: () => "".concat(r, "/production/experiments"),
        getExperimentationBestPracticesUrl: () => "".concat(r, "/production/experiments#best-practices-for-experiments"),
        getExperimentationDailyResultsUrl: () => "".concat(r, "/production/experiments#daily-results"),
        getExperimentationEarlyHarmMetricsUrl: () => "".concat(r, "/production/experiments#early-harm-metrics"),
        getExperimentationEarlyHarmThresholdsUrl: () => "".concat(r, "/production/experiments#early-harm-thresholds"),
        getExperimentationSrmUrl: () => "".concat(r, "/production/experiments#sample-ratio-mismatch"),
        getReleaseNotesUrl: e => "".concat(r, "/release-notes/release-notes-").concat(e),
        getProductIntelligenceApisUrl: () => "".concat(r, "/production/monetization/developer-products#personalize-your-in-experience-store")
    }, "getDataCollectionSettingsUrl", 0, function(e, a) {
        let t = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
            n = new URLSearchParams({
                ...e ? {
                    roblox: "true"
                } : {},
                ...a ? {
                    public: "true"
                } : {},
                ...t ? {
                    tab: t
                } : {}
            }).toString();
        return "/settings/data-collection".concat(n.length > 0 ? "?" : "").concat(n)
    }, "getGroupRoleUrl", 0, e => "/dashboard/group/roles/".concat(e), "getRoadmapUrl", 0, () => "/roadmap", "getUrl", 0, () => "/"])
}, 829425, e => {
    "use strict";
    var a = e.i(726474);
    e.s(["creatorHub", 0, a])
}, 114209, 559227, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        n = e.i(589624),
        i = e.i(773057),
        r = e.i(392782);
    let o = (0, t.createContext)({
        isLoadingGame: !1,
        isErrorLoadingGame: !1,
        canConfigure: !1,
        gameDetails: null,
        refreshGameDetails: () => {
            throw Error("Not implemented")
        }
    });
    o.displayName = "Game", e.s(["default", 0, o], 559227);
    var s = e.i(721281),
        c = e.i(252842),
        l = e.i(533968);
    let d = new class {
        async getGameDetail(e, a) {
            var t, n, i;
            if (!a && this.gameDetailsMap.has(e)) return null != (t = this.gameDetailsMap.get(e)) ? t : null;
            try {
                let a = null != (n = null == (i = (await this.gamesClient.getDetails([e])).data) ? void 0 : i[0]) ? n : null;
                return a && this.gameDetailsMap.set(e, a), a
            } catch (t) {
                let a = (0, l.getResponseFromError)(t);
                if ((null == a ? void 0 : a.status) === c.StatusCodes.BAD_REQUEST) return null;
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
                let a = (0, l.getResponseFromError)(t);
                if ((null == a ? void 0 : a.status) === c.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, a) {
            (0, s._)(this, "gamesClient", void 0), (0, s._)(this, "developClient", void 0), (0, s._)(this, "gameDetailsMap", void 0), (0, s._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = a, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(r.default, i.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: i,
            children: r
        } = e, s = (0, n.useRouter)(), [c, l] = (0, t.useState)(!0), [g, p] = (0, t.useState)(null), [m, u] = (0, t.useState)(null), [y, h] = (0, t.useState)(!1), [v, b] = (0, t.useState)(), f = (0, t.useRef)(0), U = (0, t.useCallback)(async function(e) {
            let a = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                t = f.current += 1,
                n = d.getConfiguration(e),
                i = d.getGameDetail(e, a),
                [r, o] = await Promise.allSettled([n, i]);
            t === f.current && ("fulfilled" === r.status ? p(r.value) : p(null), "fulfilled" === o.status ? (h(!1), u(o.value)) : ("rejected" === o.status ? h(!0) : h(!1), u(null)), b(e), l(!1))
        }, []), A = (0, t.useMemo)(() => {
            let {
                id: e
            } = s.query;
            return i || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [i, s.query]), x = (0, t.useCallback)(() => A ? U(A, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [A, U]);
        (0, t.useEffect)(() => {
            try {
                if (void 0 !== A && !Number.isNaN(A) && A > 0) return void U(A);
                f.current += 1, b(void 0), p(null), u(null), h(!1), l(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(A))
            }
        }, [A, U]);
        let E = c || void 0 !== A && !Number.isNaN(A) && A > 0 && v !== A,
            P = (0, t.useMemo)(() => ({
                isLoadingGame: E,
                canConfigure: g,
                gameDetails: m,
                isErrorLoadingGame: y,
                refreshGameDetails: x
            }), [E, g, m, y, x]);
        return (0, a.jsx)(o.Provider, {
            value: P,
            children: r
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, t.useContext)(o);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}]);

//# debugId=7ea3f299-b029-fa8e-3e16-170da8dafaa1
//# sourceMappingURL=1xkbccmzvrh74.js.map