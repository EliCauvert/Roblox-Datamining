;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "31bceadf-0f27-5495-c82c-d47f014590b4")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 649499, e => {
    "use strict";
    var t = e.i(277199);
    e.s(["f", () => t.N])
}, 887545, e => {
    "use strict";
    var t = e.i(225226),
        a = e.i(643766),
        n = e.i(231543),
        r = e.i(130933),
        i = (0, n.f)({
            name: "Label"
        })(function(e, a) {
            var n = {
                    alignItems: "center",
                    backgroundColor: e.palette.states.selected,
                    borderRadius: 4,
                    color: e.palette.content.standard,
                    display: "inline-flex",
                    lineHeight: "20px",
                    paddingLeft: a.hasIcon ? 4 : 6,
                    paddingRight: 6,
                    textTransform: "none"
                },
                r = function(e) {
                    var t = e.severity,
                        a = e.theme;
                    if ("text" === e.variant) {
                        var n = {
                            backgroundColor: "transparent"
                        };
                        return "default" === t && (n.color = a.palette.content.muted), "success" === t && (n.color = a.palette.content.alert.active), "info" === t && (n.color = a.palette.content.alert.inform), "warning" === t && (n.color = a.palette.components.label.warningText), "error" === t && (n.color = a.palette.content.alert.important), n
                    }
                    return "success" === t ? {
                        background: a.palette.components.label.activeFill,
                        color: a.palette.components.label.activeContent
                    } : "info" === t ? {
                        background: a.palette.components.label.informFill,
                        color: a.palette.components.label.informContent
                    } : "warning" === t ? {
                        background: a.palette.components.label.noticeFill,
                        color: a.palette.components.label.noticeContent
                    } : "error" === t ? {
                        background: a.palette.components.label.importantFill,
                        color: a.palette.components.label.importantContent
                    } : {}
                }({
                    theme: e,
                    severity: a.severity,
                    variant: a.variant
                });
            return {
                iconSize: {
                    boxSizing: "content-box",
                    height: 12,
                    marginRight: 4,
                    width: 12
                },
                root: (0, t._)((0, t._)({}, n), r)
            }
        }),
        o = (0, a.forwardRef)(function(e, t) {
            var n = e.icon,
                o = e.severity,
                c = e.variant,
                s = e.labelText,
                l = e.classes,
                d = e.className,
                u = a.default.isValidElement(n),
                p = i({
                    hasIcon: u,
                    severity: void 0 === o ? "default" : o,
                    variant: void 0 === c ? "contained" : c
                }, {
                    props: {
                        classes: (0, r.f)(l, d)
                    }
                }),
                g = p.classes,
                h = g.root,
                m = g.iconSize,
                f = p.cx,
                v = u ? a.default.cloneElement(n, {
                    className: f(n.props.className, m)
                }) : null;
            return a.default.createElement("div", {
                className: h,
                ref: t
            }, v, s)
        });
    e.s(["f", 0, o], 887545)
}, 97782, e => {
    "use strict";
    var t = e.i(730530),
        a = e.i(881670);
    let n = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, t.Q)("Heading.Monetization", a.f.Analytics)
        },
        r = {
            path: "/dashboard/analytics",
            pathPattern: /\/dashboard\/analytics/,
            title: (0, t.Q)("Heading.Analytics", a.f.Navigation)
        },
        i = {
            path: "/experiments",
            pathPattern: /\/experiments(?!\/)/,
            title: (0, t.Q)("Heading.Experiments", a.f.Navigation)
        },
        o = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, t.Q)("Label.DeveloperProducts", a.f.Navigation),
            group: n
        },
        c = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, t.Q)("Label.GamePasses", a.f.Navigation),
            group: n
        },
        s = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, t.Q)("Label.ThirdPartyAvatarItemCommissions", a.f.Navigation),
            group: n
        },
        l = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, t.Q)("Heading.ItemAnalytics", a.f.Analytics)
        },
        d = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, t.Q)("Heading.Ads", a.f.Navigation),
            group: n
        },
        u = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, t.Q)("Heading.Subscriptions", a.f.Navigation),
            group: n
        },
        p = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, t.Q)("Heading.MemoryStores", a.f.Navigation)
        },
        g = {
            path: "/analytics/queue-service",
            pathPattern: /\/analytics\/queue-service/,
            title: (0, t.Q)("Heading.QueueService", a.f.Navigation)
        },
        h = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, t.Q)("Heading.DataStores", a.f.Navigation)
        },
        m = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, t.Q)("Heading.HttpService", a.f.Navigation)
        },
        f = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, t.Q)("Heading.MessagingService", a.f.Navigation)
        },
        v = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, t.Q)("Heading.SpeechToText", a.f.Navigation)
        },
        b = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, t.Q)("Heading.TextToSpeech", a.f.Navigation)
        },
        y = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, t.Q)("Heading.VideoService", a.f.Navigation)
        },
        U = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, t.Q)("Heading.CreatorRewards", a.f.Navigation),
            group: n
        },
        x = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, t.Q)("Heading.RobloxPlusDeveloperProgram", a.f.Navigation),
            group: n
        },
        P = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, t.Q)("Heading.Performance", a.f.Navigation)
        },
        C = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, t.Q)("Heading.Crashes", a.f.Analytics)
        },
        A = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, t.Q)("Heading.ErrorReport", a.f.Navigation)
        },
        w = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, t.Q)("Heading.Demographics", a.f.Navigation)
        },
        S = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, t.Q)("Heading.Economy", a.f.Navigation)
        },
        k = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, t.Q)("Heading.Funnels", a.f.Navigation)
        },
        M = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, t.Q)("Heading.Explore", a.f.Navigation)
        },
        z = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, t.Q)("Heading.CustomDashboards", a.f.Navigation)
        },
        E = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, t.Q)("Heading.Retention", a.f.Navigation)
        },
        I = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, t.Q)("Heading.Engagement", a.f.Navigation)
        },
        G = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, t.Q)("Heading.Acquisition", a.f.Navigation),
            group: r
        },
        R = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, t.Q)("Heading.Acquisition", a.f.Navigation),
            group: r
        },
        N = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, t.Q)("Heading.CustomEvents", a.f.Navigation)
        },
        D = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, t.Q)("Heading.Journeys", a.f.Navigation)
        },
        H = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, t.Q)("Heading.JourneyEventsConfigCreate", a.f.Navigation)
        },
        T = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, t.Q)("Heading.JourneyEventsConfigCreate", a.f.Navigation)
        },
        F = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, t.Q)("Heading.Journeys", a.f.Navigation)
        },
        Q = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, t.Q)("Heading.Feedback", a.f.PlayerFeedback)
        },
        j = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, t.Q)("Heading.ConfigsHistory", a.f.Navigation),
            titleOverrideForIAM2: (0, t.Q)("Heading.ConfigHistory", a.f.Navigation)
        },
        O = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, t.Q)("Heading.Configs", a.f.Navigation)
        },
        q = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, t.Q)("Heading.ConfigCreate", a.f.Navigation)
        },
        B = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, t.Q)("Heading.Alerts", a.f.Navigation)
        },
        L = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, t.Q)("Heading.CreateAlert", a.f.ExperienceAlerts)
        },
        _ = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, t.Q)("Heading.ConfigureAlert", a.f.Navigation)
        },
        V = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, t.Q)("Heading.CustomMatchmaking", a.f.Matchmaking)
        },
        J = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, t.Q)("Heading.Commerce", a.f.Navigation),
            group: n
        },
        K = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        X = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        W = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, t.Q)("Heading.Assistant", a.f.Analytics)
        },
        Y = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, t.Q)("Heading.ExperimentsCreate", a.f.Navigation),
            titleOverrideForIAM2: (0, t.o)("Heading.Experimentation"),
            group: i
        },
        $ = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, t.Q)("Heading.RecommendationService", a.f.Navigation)
        },
        Z = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, t.Q)("Heading.SafetyOverview", a.f.Analytics),
            titleOverrideForIAM2: (0, t.Q)("Heading.Safety", a.f.Navigation)
        },
        ee = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, t.Q)("Heading.Overview", a.f.Navigation)
        },
        et = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, t.Q)("Heading.Thumbnails", a.f.Navigation)
        },
        ea = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, t.Q)("Heading.Notifications", a.f.Navigation)
        },
        en = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, t.Q)("Heading.Subscriptions", a.f.Navigation),
            group: n
        },
        er = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, t.Q)("Heading.GenerativeAI", a.f.Navigation)
        },
        ei = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, t.Q)("Heading.AvatarCreationTokens", a.f.AvatarAnalytics),
            titleOverrideForIAM2: (0, t.Q)("Heading.AvatarCreationTokens", a.f.Navigation),
            group: n
        },
        eo = [R, G, I, E, n, o, c, s, l, d, u, p, g, h, m, f, v, b, y, er, U, x, P, C, A, w, S, k, D, H, T, F, M, z, N, K, X, W, Q, j, O, q, V, J, Z, ee, r, i, Y, $, et, ea, en, L, _, B, ei];
    e.s(["Q3", 0, X, "l9", 0, W, "g1", 0, _, "PS", 0, L, "rf", 0, B, "ib", 0, r, "xG", 0, K, "gX", 0, w, "kg", 0, ei, "is", 0, x, "DH", 0, J, "nu", 0, j, "m2", 0, O, "aQ", 0, C, "c3", 0, ee, "dX", 0, z, "Np", 0, N, "jc", 0, h, "P_", 0, I, "Pu", 0, A, "th", 0, U, "pr", 0, en, "bw", 0, Y, "Ap", 0, i, "Iv", 0, M, "Iw", 0, Q, "p_", 0, er, "jY", 0, m, "Kh", 0, d, "j$", 0, s, "uv", 0, o, "fX", 0, c, "Em", 0, V, "Bt", 0, p, "Vs", 0, f, "du", 0, n, "rJ", 0, ea, "Xe", 0, P, "IQ", 0, g, "pj", 0, $, "vH", 0, S, "Ya", 0, k, "kL", 0, H, "e_", 0, T, "rS", 0, D, "ko", 0, F, "bm", 0, E, "jd", 0, Z, "k7", 0, v, "t", 0, u, "Cu", 0, b, "FO", 0, G, "N$", 0, R, "D2", 0, y, "xL", 0, function(e) {
        return eo.find(t => t.pathPattern.test(e))
    }])
}, 894854, e => {
    "use strict";
    var t = e.i(893949);
    e.s(["f", () => t.U])
}, 726474, e => {
    "use strict";
    var t = e.i(894432),
        a = e.i(307529),
        n = e.i(251622);
    let r = "".concat("https://create.roblox.com", "/store"),
        i = "".concat("https://create.roblox.com", "/docs"),
        o = {
            [t.C.Model]: "models",
            [t.C.Plugin]: "plugins",
            [t.C.Audio]: "audio",
            [t.C.FontFamily]: "fonts",
            [t.C.Decal]: "decals",
            [t.C.MeshPart]: "meshParts",
            [t.C.Video]: "videos",
            [t.C.Animation]: "",
            [t.C.Music]: "",
            [t.C.SoundEffect]: "",
            [t.C.UnknownAudio]: "",
            [t.C.Package]: "",
            [t.C.SharedPackage]: ""
        },
        c = (e, t) => "/dashboard/creations/experiences/".concat(e).concat(t ? "/observability" : "", "/server-management"),
        s = {
            getUrl: (e, t, a) => {
                let n = new URLSearchParams({
                    ...e ? {
                        groupId: e
                    } : {},
                    ...t ? {
                        assetType: t
                    } : {},
                    ...a ? {
                        activeTab: a
                    } : {}
                }).toString();
                return "/dashboard/creations".concat(n.length > 0 ? "?" : "").concat(n)
            },
            getConfigureItemUrl: (e, t) => {
                switch (t) {
                    case n.U.Game:
                        return s.getConfigureExperienceUrl(e);
                    case n.U.Bundle:
                        return s.getConfigureBundlePath(e);
                    case n.U.CatalogAsset:
                        return s.getConfigureAvatarItemsUrl(e);
                    default:
                        throw Error("Unsupported item type ".concat(String(t)))
                }
            },
            getExperienceOverviewUrl: e => "/dashboard/creations/experiences/".concat(e, "/overview"),
            getConfigureBundlePath: e => "/dashboard/creations/bundle/".concat(e, "/configure"),
            getConfigureExperienceUrl: e => "/dashboard/creations/experiences/".concat(e, "/configure"),
            configureCreatorStoreItemBasePath: "/dashboard/creations/store/",
            getConfigureCreatorStoreItemUrl: e => "".concat(s.configureCreatorStoreItemBasePath).concat(e, "/configure"),
            getConfigureAvatarItemsUrl: e => "/dashboard/creations/catalog/".concat(e, "/configure"),
            getConfigureDeveloperProductUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/developer-products/").concat(t, "/configure"),
            getCreateDeveloperProductUrl: e => "/dashboard/creations/experiences/".concat(e, "/developer-products/create"),
            getConfigurePassUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(t, "/configure"),
            getConfigurePassSalesUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/passes/").concat(t, "/sales"),
            getCreatePassUrl: e => "/dashboard/creations/experiences/".concat(e, "/passes/create"),
            getConfigureExperienceSubscriptionUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/").concat(t, "/configure"),
            getCreateExperienceSubscriptionUrl: e => "/dashboard/creations/experiences/".concat(e, "/experience-subscriptions/create"),
            getUserBansUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans"),
            getAddUsersToBanUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/bans/add"),
            getAntiCheatUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/anti-cheat"),
            getIssuesAndAppealsUrl: e => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals"),
            getGameViolationUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/safety/issues-and-appeals/").concat(encodeURIComponent(t)),
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
            getAnalyticsJourneysEditUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/edit?journeyName=").concat(encodeURIComponent(t)),
            getAnalyticsJourneysViewUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/analytics/journeys/view?filter_JourneyName=").concat(encodeURIComponent(t)),
            getBundleAnalyticsUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/bundle/".concat(e, "/analytics?rangeType=").concat(t)
            },
            getCatalogAnalyticsUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "Last7Days";
                return "/dashboard/creations/catalog/".concat(e, "/analytics?rangeType=").concat(t)
            },
            getPlaceThumbnailsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(t, "/thumbnails"),
            getPlaceVideosUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(t, "/videos"),
            getPlaceIconUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/places/").concat(t, "/icon"),
            getExperienceAlertCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts/create"),
            getExperienceAlertConfigureUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/alerts/").concat(t, "/configure"),
            getExperienceAlertsUrl: e => "/dashboard/creations/experiences/".concat(e, "/alerts"),
            getExperienceWebhooksUrl: e => "/dashboard/creations/experiences/".concat(e, "/webhooks"),
            getExperimentsUrl: e => "/dashboard/creations/experiences/".concat(e, "/experiments"),
            getUploadUrl: function() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : a.f.TShirt;
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
            getConfigureAvatarCreationTokenUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/avatar-creation-tokens/").concat(t, "/configure"),
            getMonetizationPriceOptimizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/price-optimization"),
            getMonetizationDynamicPriceCheckUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = new URLSearchParams(t).toString();
                return "/dashboard/creations/experiences/".concat(e, "/monetization/price-check").concat(a.length > 0 ? "?".concat(a) : "")
            },
            getManagedPricingUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing").concat(t ? "?tab=".concat(t) : ""),
            getManagedPricingEventDetailsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/monetization/managed-pricing/events/").concat(t, "/details"),
            getMonetizationHardCodedPricesUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/hard-coded-prices"),
            getPersonalizedShopsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/monetization/shop").concat(t ? "?tab=".concat(t) : ""),
            getDeveloperProductPurchasesBlockedUrl: e => "/dashboard/creations/experiences/".concat(e, "/monetization/shop/developer-product-purchases-blocked"),
            getSellerOnboardingUrl: () => "/settings/eligibility/priced-assets",
            getTranslatorPortalUrl: () => "/dashboard/translator-portal",
            getAudioDistributionOnboardingUrl: () => "/settings/eligibility/audio-distribution",
            getCreateGroupUrl: () => "/dashboard/group/create",
            getGroupProfileUrl: e => {
                let t = new URLSearchParams({
                    groupId: e
                }).toString();
                return "/dashboard/group/profile".concat(t.length > 0 ? "?" : "").concat(t)
            },
            getRightsManagerAssetUrl: e => "/dashboard/rights-manager/accounts/contents/asset/".concat(e),
            getCustomMatchmakingDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking"),
            getCustomMatchmakingConfigurationDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Configuration"),
            getCustomMatchmakingAttributesDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Attributes"),
            getCustomMatchmakingAnalyticsDashboardUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking?activeTab=Analytics"),
            getCustomMatchmakingConfigurationCreationUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-configuration/").concat(t),
            getCustomMatchmakingEditConfigurationUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-configuration/").concat(t),
            getCustomMatchmakingAttributeCreationUrl: e => "/dashboard/creations/experiences/".concat(e, "/matchmaking/create-attribute"),
            getCustomMatchmakingEditServerAttributeUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-server-attribute/").concat(t),
            getCustomMatchmakingEditPlayerAttributeUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/matchmaking/edit-player-attribute/").concat(t),
            getLocalizationUrl: e => "/dashboard/creations/experiences/".concat(e, "/localization"),
            getDataStoresManagerUrl: e => "/dashboard/creations/experiences/".concat(e, "/analytics/data-stores"),
            getExtendedServicesUnlock: e => "/dashboard/creations/experiences/".concat(e, "/extended-services"),
            getPaymentsUrl: () => "/dashboard/payments",
            getServerManagementUrl: function(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1];
                return c(e, t)
            },
            getServerManagementServersUrl: function(e, t) {
                let a = arguments.length > 2 && void 0 !== arguments[2] && arguments[2],
                    n = arguments.length > 3 ? arguments[3] : void 0,
                    r = "".concat(c(e, a), "/").concat(t, "/servers");
                if (!n || 0 === n.length) return r;
                let i = new URLSearchParams;
                return i.set("serverStatus", n.join(",")), "".concat(r, "?").concat(i.toString())
            },
            getServerManagementDetailsUrl: function(e, t, a) {
                let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3],
                    r = arguments.length > 4 ? arguments[4] : void 0,
                    i = arguments.length > 5 ? arguments[5] : void 0,
                    o = new URLSearchParams;
                (null != r || null != i) && o.set("logRange", "custom"), null != r && o.set("logStart", String(r)), null != i && o.set("logEnd", String(i));
                let s = o.toString();
                return "".concat(c(e, n), "/").concat(t, "/servers/").concat(a, "/details").concat(s ? "?".concat(s) : "")
            },
            getClientSessionsUrl: (e, t) => {
                let a = "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions");
                return void 0 === t ? a : "".concat(a, "?filter_ExitReason=").concat(encodeURIComponent(t))
            },
            getClientSessionDetailsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/observability/client-sessions/").concat(t),
            getObservabilityDataCapturesUrl: e => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures"),
            getObservabilityDataCaptureCreateUrl: e => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures/create"),
            getObservabilityDataCaptureEditUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/observability/data-captures/").concat(encodeURIComponent(t), "/edit"),
            getPlayerSupportUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/player-support").concat(t ? "/".concat(t) : ""),
            getComputeFunctionsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/compute-functions").concat(null != t ? "?assetId=".concat(t) : ""),
            getCreateComputeFunctionUrl: e => "/dashboard/creations/experiences/".concat(e, "/compute-functions/create-compute-function"),
            getComputeFunctionInvocationsUrl: (e, t) => "/dashboard/creations/experiences/".concat(e, "/compute-functions/").concat(t, "/invocations"),
            getComputeFunctionInvocationLogsUrl: (e, t, a) => "/dashboard/creations/experiences/".concat(e, "/compute-functions/").concat(t, "/invocations/").concat(encodeURIComponent(a))
        };
    e.s(["creatorStore", 0, {
        getUrl: () => r,
        getAssetUrl: e => "".concat(r, "/asset/").concat(e),
        getSearchUrl: (e, t) => {
            if ("" !== o[e]) return "".concat(r, "/").concat(o[e], "?keyword=").concat(encodeURIComponent(t));
            throw Error("Unsupported search asset type ".concat(e))
        }
    }, "dashboard", 0, s, "developerForum", 0, {
        getBaseUrl: () => "https://devforum.roblox.com",
        getPublicSfxAnnouncementPath: () => "/t/public-sound-effects-upload-are-now-available-for-creators/2980704"
    }, "docs", 0, {
        getUrl: () => i,
        getAiDataSharingUrl: () => "".concat(i, "/ai-data-sharing"),
        getBadgesPublishingUrl: () => "".concat(i, "/production/publishing/badges"),
        getExperiencesPublishingUrl: () => "".concat(i, "/production/publishing/publishing-experiences-and-places"),
        getCrossServerChatUrl: () => "".concat(i, "/chat/cross-server-chat"),
        getStrongLanguageUrl: () => "".concat(i, "/projects/configure-games#allow-strong-language"),
        getSellingOnCreatorStoreUrl: () => "".concat(i, "/production/creator-store#distribute-and-sell-assets"),
        getPassesMonetizationUrl: () => "".concat(i, "/production/monetization/game-passes"),
        getDeveloperProductsMonetizationUrl: () => "".concat(i, "/production/monetization/developer-products"),
        getDeveloperProductsExternalPurchaseSettingsMonetizationUrl: () => "".concat(i, "/production/monetization/developer-products#outside-your-experience"),
        getExternalEligibilityReferenceUrl: () => "".concat(i, "/reference/engine/classes/MarketplaceService#ProcessReceipt"),
        getSubscriptionsMonetizationUrl: () => "".concat(i, "/production/monetization/subscriptions"),
        getSubscriptionsMonetizationAnalyticsUrl: () => "".concat(i, "/production/monetization/subscriptions#subscription-analytics"),
        getPriceOptimizationMonetizationUrl: () => "".concat(i, "/production/monetization/price-optimization"),
        getDynamicPriceCheckMonetizationUrl: () => "".concat(i, "/production/monetization/price-optimization#using-the-dynamic-price-check-tool"),
        getRegionalPricingMonetizationUrl: () => "".concat(i, "/production/monetization/regional-pricing"),
        getPriceLevelsApiMonetizationUrl: () => "".concat(i, "/production/monetization/regional-pricing#protect-your-trades-and-gifts"),
        getManagedPricingMonetizationUrl: () => "".concat(i, "/production/monetization/managed-pricing"),
        getPersonalizedShopsMonetizationUrl: () => "".concat(i, "/production/monetization/shop"),
        getImmersiveAdsMonetizationUrl: () => "".concat(i, "/production/monetization/immersive-ads"),
        getRewardedVideoUrl: () => "".concat(i, "/production/promotion/rewarded-video-ads"),
        getKidsAndSelectPublishingUrl: () => "".concat(i, "/production/publishing/kids-and-select"),
        getExperienceDetailsPageRewardedAdsUrl: () => "".concat(i, "/production/monetization/immersive-ads"),
        getCreatorStorePublishingUrl: () => "".concat(i, "/production/creator-store#distribute-and-sell-assets"),
        getDecalReferenceUrl: () => "".concat(i, "/reference/engine/classes/Decal"),
        getIntegrityServiceReferenceUrl: () => "".concat(i, "/reference/engine/classes/IntegrityService"),
        getOpenCloudReferenceUrl: () => "".concat(i, "/reference/cloud"),
        getAudioAssetsUrl: () => "".concat(i, "/building-and-visuals/audio/audio-assets"),
        getAssetsUrl: () => "".concat(i, "/projects/assets"),
        getClassicClothingUrl: () => "".concat(i, "/avatar/accessories/classic-clothing"),
        getEarningOnRobloxUrl: () => "".concat(i, "/production/earning-on-roblox"),
        getSettingUpStudioUrl: () => "".concat(i, "/studio/setup"),
        getStudioUrl: () => "".concat(i, "/studio"),
        getPlatformUrl: () => "".concat(i, "/platform"),
        getAnalyticsUrl: () => "".concat(i, "/production/analytics"),
        getAnalyticsErrorReportUrl: () => "".concat(i, "/production/analytics/error-report"),
        getAnalyticsJourneyEventsUrl: () => "".concat(i, "/production/analytics/journey-events"),
        getUnityGuideUrl: () => "".concat(i, "/unity"),
        getUnrealGuideUrl: () => "".concat(i, "/unreal"),
        getEventsPlatformUrl: () => "".concat(i, "/production/promotion/events-platform"),
        getAvatarItemsUrl: () => "".concat(i, "/avatar"),
        getClassicAccessoriesUrl: () => "".concat(i, "/art/accessories/classic-clothing"),
        getModelsUrl: () => "".concat(i, "/parts/models"),
        getMakeupLooksUrl: () => "".concat(i, "/avatar/makeup-looks"),
        getPluginsReferenceUrl: () => "".concat(i, "/reference/engine/classes/Plugin"),
        getVideoFrameReferenceUrl: () => "".concat(i, "/reference/engine/classes/VideoFrame#Video"),
        getMeshPartReferenceUrl: () => "".concat(i, "/reference/engine/classes/MeshPart"),
        getAnimationReferenceUrl: () => "".concat(i, "/reference/engine/classes/Animation"),
        getLocalizationGuideUrl: () => "".concat(i, "/production/localization"),
        getAssistantUrl: () => "".concat(i, "/assistant"),
        getAnalyticsRetentionGuideUrl: () => "".concat(i, "/production/analytics/retention#improve-day-1-retention"),
        getMonetizationNewUserExperienceGuideUrl: () => "".concat(i, "/production/monetization/improve-new-user-experience"),
        getAnalyticsEngagementGuideUrl: () => "".concat(i, "/production/analytics/engagement#improving-average-session-time"),
        getAnalyticsRetentionD7GuideUrl: () => "".concat(i, "/production/analytics/retention#improve-day-7-retention"),
        getAnalyticsRetentionD30GuideUrl: () => "".concat(i, "/production/analytics/retention#improve-day-30-retention"),
        getAnalyticsMonetizationPayerConversionRateGuideUrl: () => "".concat(i, "/production/analytics/monetization#improving-payer-conversion-rate"),
        getAnalyticsMonetizationARPPUGuideUrl: () => "".concat(i, "/production/analytics/monetization#improving-average-revenue-per-paying-user-arppu"),
        getAnalyticsFilterByMetricsGuideUrl: () => "".concat(i, "/production/analytics/analytics-dashboard#filter-by-metrics"),
        getAnalyticsEventTypesUrl: () => "".concat(i, "/production/analytics/event-types"),
        getDiscoveryUrl: () => "".concat(i, "/discovery"),
        getDiscoveryBestPracticesUrl: () => "".concat(i, "/discovery#best-practices-for-discovery"),
        getDiscoveryRecommendationUrl: () => "".concat(i, "/discovery#how-recommendation-works"),
        getDiscoveryKeySignalsUrl: () => "".concat(i, "/discovery#key-signals"),
        getDiscoveryGetDiscoveredUrl: () => "".concat(i, "/discovery#how-you-can-get-discovered-via-recommendations"),
        getCreatorStoreAssetModerationUrl: () => "".concat(i, "/production/creator-store#asset-requirements"),
        getCreatorStoreAccountRequirementsUrl: () => "".concat(i, "/production/creator-store#account-requirements"),
        getPerformanceOptimizationUrl: () => "".concat(i, "/performance-optimization"),
        getPromotionalThumbnailsUrl: () => "".concat(i, "/production/promotion/promotional-thumbnails"),
        getExperienceGenresUrl: () => "".concat(i, "/production/publishing/experience-genres"),
        getGenreDefinitionsUrl: () => "".concat(i, "/production/publishing/experience-genres#genre-and-subgenre-descriptions"),
        getExperienceGenresAppealUrl: () => "".concat(i, "/production/publishing/experience-genres#genre-accuracy"),
        getMakeExperiencePublicUrl: () => "".concat(i, "/production/publishing/publish-experiences-and-places#make-experience-public"),
        getPublishGamesUrl: () => "".concat(i, "/production/publishing/publish-games-and-places#publish-games"),
        getOwnershipTransferUrl: () => "".concat(i, "/projects/experience-ownership-transfer"),
        getStreamingUrl: () => "".concat(i, "/workspace/streaming"),
        getAnimationTransferUrl: () => "".concat(i, "/projects/transferring-animations"),
        getGameDesignMissionsUrl: () => "".concat(i, "/production/game-design/introduction-to-quest-design"),
        getGameDesignStarterPackUrl: () => "".concat(i, "/production/game-design/starter-pack-design"),
        getGameDesignBundlesUrl: () => "".concat(i, "/production/game-design/monetization-foundations#bundles"),
        getGameDesignSeasonPassUrl: () => "".concat(i, "/production/game-design/season-pass-design"),
        getGameDesignEngagementRewardsUrl: () => "".concat(i, "/production/game-design/analytics-essentials#engagement-metrics\n"),
        getCloudServicesMemoryStoresAPIRequestsUrl: () => "".concat(i, "/cloud-services/memory-stores/observability#api-request-alerts"),
        getCloudServicesMemoryStoresMemoryUsageUrl: () => "".concat(i, "/cloud-services/memory-stores/observability#memory-usage-alerts"),
        getExperimentationUrl: () => "".concat(i, "/production/experiments"),
        getExperimentationBestPracticesUrl: () => "".concat(i, "/production/experiments#best-practices-for-experiments"),
        getExperimentationDailyResultsUrl: () => "".concat(i, "/production/experiments#daily-results"),
        getExperimentationEarlyHarmMetricsUrl: () => "".concat(i, "/production/experiments#early-harm-metrics"),
        getExperimentationEarlyHarmThresholdsUrl: () => "".concat(i, "/production/experiments#early-harm-thresholds"),
        getExperimentationSrmUrl: () => "".concat(i, "/production/experiments#sample-ratio-mismatch"),
        getReleaseNotesUrl: e => "".concat(i, "/release-notes/release-notes-").concat(e),
        getProductIntelligenceApisUrl: () => "".concat(i, "/production/monetization/developer-products#personalize-your-in-experience-store")
    }, "getDataCollectionSettingsUrl", 0, function(e, t) {
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "",
            n = new URLSearchParams({
                ...e ? {
                    roblox: "true"
                } : {},
                ...t ? {
                    public: "true"
                } : {},
                ...a ? {
                    tab: a
                } : {}
            }).toString();
        return "/settings/data-collection".concat(n.length > 0 ? "?" : "").concat(n)
    }, "getGroupRoleUrl", 0, e => "/dashboard/group/roles/".concat(e), "getRoadmapUrl", 0, () => "/roadmap", "getUrl", 0, () => "/"])
}, 767112, e => {
    "use strict";
    var t = e.i(726474);
    e.s(["f", 0, t])
}, 174528, 271773, e => {
    "use strict";
    var t = e.i(785517),
        a = e.i(643766),
        n = e.i(260241),
        r = e.i(805290),
        i = e.i(471518),
        o = e.i(606092),
        c = e.i(910272),
        s = e.i(415858),
        l = function(e, t) {
            return (l = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function d(e, t, a, n) {
        return new(a || (a = Promise))(function(r, i) {
            function o(e) {
                try {
                    s(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function c(e) {
                try {
                    s(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(o, c)
            }
            s((n = n.apply(e, t || [])).next())
        })
    }

    function u(e, t) {
        var a, n, r, i = {
                label: 0,
                sent: function() {
                    if (1 & r[0]) throw r[1];
                    return r[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = c(0), o.throw = c(1), o.return = c(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function c(c) {
            return function(s) {
                var l = [c, s];
                if (a) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, l[0] && (i = 0)), i;) try {
                    if (a = 1, n && (r = 2 & l[0] ? n.return : l[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, l[1])).done) return r;
                    switch (n = 0, r && (l = [2 & l[0], r.value]), l[0]) {
                        case 0:
                        case 1:
                            r = l;
                            break;
                        case 4:
                            return i.label++, {
                                value: l[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = l[1], l = [0];
                            continue;
                        case 7:
                            l = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === l[0] || 2 === l[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === l[0] && (!r || l[1] > r[0] && l[1] < r[3])) {
                                i.label = l[1];
                                break
                            }
                            if (6 === l[0] && i.label < r[1]) {
                                i.label = r[1], r = l;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(l);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    l = t.call(e, i)
                } catch (e) {
                    l = [6, e], n = 0
                } finally {
                    a = r = 0
                }
                if (5 & l[0]) throw l[1];
                return {
                    value: l[0] ? l[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function p(e) {
        if (void 0 !== e) return null === e ? null : {
            userId: e.userId,
            featureName: e.featureName,
            namespace: e.namespace
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var g = function(e) {
        function t() {
            return null !== e && e.apply(this, arguments) || this
        }
        return function(e, t) {
            if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

            function a() {
                this.constructor = e
            }
            l(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
        }(t, e), t.prototype.accessManagementAPIGetFeatureAccessRaw = function(e, t) {
            return d(this, void 0, void 0, function() {
                var a, n, r;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureNames && (a.featureNames = e.featureNames), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), n = {}, [4, this.request({
                                path: "/v1/feature-access",
                                schemaPath: "/v1/feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new s.V(r)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetFeatureAccess = function() {
            return d(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), u(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetPairwiseFeatureAccessRaw = function(e, t) {
            return d(this, void 0, void 0, function() {
                var a, n, r;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureName && (a.featureName = e.featureName), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.targetUserId && (a.targetUserId = e.targetUserId), e.otherUserIds && (a.otherUserIds = e.otherUserIds), n = {}, [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new s.V(r)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetPairwiseFeatureAccess = function() {
            return d(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), u(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCOwnerFeatureAccessRaw = function(e, t) {
            return d(this, void 0, void 0, function() {
                var a, n, r;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureNames && (a.featureNames = e.featureNames), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v1/rcc-owner-feature-access",
                                schemaPath: "/v1/rcc-owner-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new s.V(r)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCOwnerFeatureAccess = function() {
            return d(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), u(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCOwnerFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureAccessRaw = function(e, t) {
            return d(this, void 0, void 0, function() {
                var a, n, r;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureNames && (a.featureNames = e.featureNames), void 0 !== e.userId && (a.userId = e.userId), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), n = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (n["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-access",
                                schemaPath: "/v1/rcc-user-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new s.V(r)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureAccess = function() {
            return d(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), u(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureEvaluationRaw = function(e, t) {
            return d(this, void 0, void 0, function() {
                var a, n, r;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return a = {}, (n = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (n["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (n["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-evaluation",
                                schemaPath: "/v1/rcc-user-feature-evaluation",
                                method: "POST",
                                headers: n,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(p)
                                    }
                                }(e.accessManagementAPIGetRCCUserFeatureEvaluationRequest)
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new s.V(r)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetRCCUserFeatureEvaluation = function() {
            return d(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), u(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetRCCUserFeatureEvaluationRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetUpsellFeatureAccessRaw = function(e, t) {
            return d(this, void 0, void 0, function() {
                var a, n, r;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return a = {}, void 0 !== e.featureName && (a.featureName = e.featureName), void 0 !== e.namespace && (a.namespace = e.namespace), void 0 !== e.extraParameters && (a.extraParameters = e.extraParameters), void 0 !== e.successfulActions && (a.successfulActions = e.successfulActions), n = {}, [4, this.request({
                                path: "/v1/upsell-feature-access",
                                schemaPath: "/v1/upsell-feature-access",
                                method: "GET",
                                headers: n,
                                query: a
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new s.V(r)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIGetUpsellFeatureAccess = function() {
            return d(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), u(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIGetUpsellFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t.prototype.accessManagementAPIPostPairwiseFeatureAccessRaw = function(e, t) {
            return d(this, void 0, void 0, function() {
                var a, n, r;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return a = {}, (n = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "POST",
                                headers: n,
                                query: a,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        featureName: e.featureName,
                                        namespace: e.namespace,
                                        targetUserId: e.targetUserId,
                                        otherUserIds: e.otherUserIds
                                    }
                                }(e.accessManagementAPIPostPairwiseFeatureAccessRequest)
                            }, t)];
                        case 1:
                            return r = i.sent(), [2, new s.V(r)]
                    }
                })
            })
        }, t.prototype.accessManagementAPIPostPairwiseFeatureAccess = function() {
            return d(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), u(this, function(a) {
                    switch (a.label) {
                        case 0:
                            return [4, this.accessManagementAPIPostPairwiseFeatureAccessRaw(e, t)];
                        case 1:
                            return a.sent(), [2]
                    }
                })
            })
        }, t
    }(s._);
    e.s(["f", 0, g], 271773);
    var h = e.i(884399);
    let m = new Map,
        f = async (e, t, a) => {
            let n, r, i = (n = "".concat(e, "/access-management"), (r = m.get(n)) || (r = new g(new s.x({
                basePath: n,
                credentials: "include",
                enableMrRouter: !0
            })), m.set(n, r)), r);
            try {
                let e = await i.accessManagementAPIGetUpsellFeatureAccessRaw({
                    featureName: t,
                    namespace: a
                });
                return await e.raw.json()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to check feature access: ".concat(e), {
                    cause: t
                })
            }
        }, v = new Map, b = e => {
            let t = v.get(e);
            return t || (t = new h.f(new s.x({
                basePath: e,
                credentials: "include",
                enableMrRouter: !0
            })), v.set(e, t)), t
        }, y = async e => {
            let t = b(e);
            try {
                await t.userSettingsApiSetGlobalPrivacyControl()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to set Global Privacy Control: ".concat(e), {
                    cause: t
                })
            }
        }, U = async e => {
            let t = b(e);
            try {
                return await t.userSettingsApiGet({
                    requestedUserSettings: "allowSellShareData"
                })
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to get user settings: ".concat(e), {
                    cause: t
                })
            }
        }, x = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, P = async e => {
            var t, a;
            if (e && (null == (a = window.evidon) || null == (t = a.notice) ? void 0 : t.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class C {
        updateCookiePreferences(e) {
            this.currentCookiePreferences = {
                ...e
            }
        }
        hasCookiePreferencesChanged() {
            return Array.from(new Set([...Object.keys(this.currentCookiePreferences), ...Object.keys(this.initialCookiePreferences)])).some(e => this.currentCookiePreferences[e] !== this.initialCookiePreferences[e])
        }
        getGpcState() {
            let e = x(),
                t = this.hasCookiePreferencesChanged();
            return {
                isGpcDetected: e,
                initialGpcState: this.initialGpcState,
                hasUserMadeCookieChanges: t,
                scenario: e ? t ? "signal-with-changes" : "signal-honored" : "no-signal"
            }
        }
        initializeEvidon(e) {
            var t;
            let a;
            e && (P(e).catch(e => {
                console.error("Failed to call Evidon API:", e)
            }), this.evidonCleanup = (t = () => {}, a = () => {
                try {
                    var e, a;
                    (null == (a = window.evidon) || null == (e = a.notice) ? void 0 : e.userGpcEnabled) !== void 0 && t(window.evidon.notice.userGpcEnabled)
                } catch (e) {
                    console.error("Failed to extract GPC signal from Evidon event:", e)
                }
            }, window.addEventListener("evidon-consent-change", a), () => {
                window.removeEventListener("evidon-consent-change", a)
            }))
        }
        cleanup() {
            this.evidonCleanup && (this.evidonCleanup(), this.evidonCleanup = null)
        }
        constructor(e = {}) {
            (0, r._)(this, "initialGpcState", void 0), (0, r._)(this, "evidonCleanup", null), (0, r._)(this, "initialCookiePreferences", void 0), (0, r._)(this, "currentCookiePreferences", void 0), this.initialGpcState = x(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var A = e.i(79187),
        w = e.i(446475),
        S = e.i(47277),
        k = e.i(870999),
        M = e.i(67243),
        z = e.i(814975);
    let E = (0, M.f)()(() => ({
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
        I = "Title.GpcDetected",
        G = "Body.GpcDetectedSettingDisabledIneligible",
        R = "Body.GpcDetectedSettingDisabledEligible",
        N = "Body.GpcDetectedSettingEnabledIneligible",
        D = "Body.GpcMissingSettingIneligible",
        H = (0, M.f)()(() => ({
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
        T = e => {
            var n, r;
            let {
                gpcState: c,
                modalData: s,
                translate: l,
                translateHTML: d,
                handleClose: u,
                privacyPreferencesUrl: p,
                modalLinkClass: g
            } = e, {
                user: h
            } = (0, z.f)(), m = !!h, f = null != (n = null == s ? void 0 : s.isAdsSellShareDataEnabled) && n, v = null != (r = null == s ? void 0 : s.canUserManageAdsSettings) && r, b = (0, a.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = p)
            }, [p]), y = (0, a.useCallback)(e => (0, t.jsx)(w.f, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: g,
                children: e
            }), [g]), U = (0, a.useCallback)(e => (0, t.jsx)(w.f, {
                href: p,
                className: g,
                onClick: b,
                children: e
            }), [p, g, b]), x = (0, a.useMemo)(() => (0, t.jsx)("br", {}), []), P = (0, a.useCallback)((e, n) => {
                let r = (l(e, {
                        link: "",
                        hrefEnd: ""
                    }) || "").replaceAll(/{link}/g, "").replaceAll(/{hrefEnd}/g, ""),
                    i = r.split(/{aTagWithHref}|{aTagEnd}/),
                    o = e => {
                        let n = e.split(/{lineBreak}/);
                        return 1 === n.length ? e : (0, t.jsx)(t.Fragment, {
                            children: n.map((e, r) => {
                                let i = "linebreak-".concat(r, "-").concat(e.substring(0, 10));
                                return (0, t.jsxs)(a.Fragment, {
                                    children: [e, r < n.length - 1 && x]
                                }, i)
                            })
                        })
                    };
                return 3 === i.length ? (0, t.jsxs)(t.Fragment, {
                    children: [o(i[0]), n(i[1]), o(i[2])]
                }) : o(r)
            }, [l, x]);
            return (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.K, {
                    children: [(0, t.jsx)(i.F, {
                        className: "text-heading-small",
                        children: c.isGpcDetected ? l(I) || "" : l("Title.NoGpcDetected") || ""
                    }), (0, t.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!m) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: y
                                    }],
                                    t = {
                                        lineBreak: x
                                    };
                                return c.isGpcDetected ? f ? d(N, e, t) : d(G, e, t) : d(D, e, t)
                            }
                            if (!c.isGpcDetected) return v ? P("Body.GpcMissingSettingEligible", U) : d(D, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: y
                            }], {
                                lineBreak: x
                            });
                            if (f) return v ? P("Body.GpcDetectedSettingEnabledEligible", U) : d(N, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: y
                            }], {
                                lineBreak: x
                            });
                            let e = v ? {
                                tags: [{
                                    opening: "aTagWithHref",
                                    closing: "aTagEnd",
                                    content: U
                                }],
                                args: {
                                    lineBreak: x
                                }
                            } : {
                                tags: [{
                                    opening: "aTagStart",
                                    closing: "aTagEnd",
                                    content: y
                                }],
                                args: {
                                    lineBreak: x
                                }
                            };
                            if ("signal-with-changes" === c.scenario) return v ? P(R, U) : d(G, e.tags, e.args);
                            let t = v ? R : G;
                            return v ? P(t, U) : d(t, e.tags, e.args)
                        })()
                    })]
                }), (0, t.jsx)(i.c, {
                    className: "width-full",
                    children: (0, t.jsx)(o.f, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: u,
                        children: l("Action.Ok") || ""
                    })
                })]
            })
        },
        F = e => {
            let {
                inline: r = !1
            } = e, {
                translate: o,
                translateHTML: s
            } = (0, A.A)(), l = (0, A.z)(), d = (0, n.a)().preferences, u = (0, a.useRef)(null), p = (0, a.useRef)(!1), [g, h] = (0, a.useState)(!1), {
                classes: {
                    container: m
                }
            } = E(), {
                classes: v
            } = H(), b = (0, a.useCallback)(() => {
                if ("u" < typeof document) return {};
                let e = document.cookie.split("; ").find(e => e.startsWith("RBXcb="));
                if (!e) return {};
                let t = e.substring(6),
                    a = t;
                try {
                    a = decodeURIComponent(t)
                } catch (e) {}
                let n = {};
                return a.split("&").forEach(e => {
                    let [t, a] = e.split("=");
                    t && (n[t] = "true" === a)
                }), n
            }, []), [x, P] = (0, a.useState)({
                isGpcDetected: !1,
                initialGpcState: !1,
                hasUserMadeCookieChanges: !1,
                scenario: "no-signal"
            });
            (0, a.useEffect)(() => () => {
                u.current && u.current.cleanup()
            }, []), (0, a.useEffect)(() => {
                if (g && !p.current) {
                    let e = b();
                    u.current = new C(Object.keys(e).length > 0 ? e : d), p.current = !0, P(u.current.getGpcState())
                }
            }, [g, d, b]), (0, a.useEffect)(() => {
                if (u.current) {
                    let e = b(),
                        t = Object.keys(e).length > 0 ? e : d;
                    u.current.updateCookiePreferences(t);
                    let a = u.current.getGpcState();
                    P(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                }
            }, [d, b]), (0, a.useEffect)(() => {
                if (!u.current) return;
                let e = setInterval(() => {
                    if (u.current) {
                        let e = b(),
                            t = Object.keys(e).length > 0 ? e : d;
                        u.current.updateCookiePreferences(t);
                        let a = u.current.getGpcState();
                        P(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [d, b]);
            let {
                user: w
            } = (0, z.f)(), M = !!w, {
                data: G,
                isLoading: R
            } = (e => {
                let {
                    showModal: t,
                    gpcTrackerRef: a,
                    userSettingsApiBaseUrl: n,
                    apiGatewayBaseUrl: r,
                    isAuthenticated: i
                } = e;
                return (0, c.f)({
                    queryKey: ["yourPrivacyChoicesModal", t],
                    queryFn: async () => {
                        var e, t, o;
                        let c = null != (e = null == i ? void 0 : i()) && e,
                            s = null != (t = null == (o = a.current) ? void 0 : o.getGpcState()) ? t : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: l
                            } = s;
                        c && l && await y(n);
                        let d = !1;
                        if (c) try {
                            let {
                                access: e
                            } = await f(r, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            d = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let u = !1;
                        if (c) try {
                            let e = await U(n);
                            u = "Enabled" === e.allowSellShareData
                        } catch (e) {
                            console.error("Failed to get user settings:", e)
                        } else if ("u" > typeof document) {
                            let e = document.cookie.split("; ").find(e => e.trim().startsWith("RBXcb="));
                            if (e) {
                                let t = e.substring(6),
                                    a = t;
                                try {
                                    a = decodeURIComponent(t)
                                } catch (e) {}
                                let n = a.split("&"),
                                    r = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "GoogleAnalytics" === t && "true" === a
                                    }),
                                    i = n.some(e => {
                                        let [t, a] = e.split("=");
                                        return "RBXSource" === t && "true" === a
                                    });
                                (r || i) && (u = !0)
                            }
                        } return {
                            isGpcDetected: l,
                            canUserManageAdsSettings: d,
                            isAdsSellShareDataEnabled: u,
                            scenario: s.scenario
                        }
                    },
                    enabled: t,
                    gcTime: 0
                })
            })({
                showModal: g,
                gpcTrackerRef: u,
                userSettingsApiBaseUrl: (0, a.useMemo)(() => "".concat("https://apis.roblox.com", "/user-settings-api"), []),
                apiGatewayBaseUrl: (0, a.useMemo)(() => "https://apis.roblox.com", []),
                isAuthenticated: () => M
            }), N = (0, a.useMemo)(() => l.locale ? (0, A.f)(l.locale) : "en_us", [l.locale]), D = (0, a.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(N);
                return "https://www.roblox.com".concat(e)
            }, [N]), F = (0, a.useCallback)(e => {
                e.preventDefault(), h(!0)
            }, []), Q = (0, a.useCallback)(() => {
                h(!1)
            }, []), j = o("Label.YourPrivacyChoices") || "", O = (0, t.jsx)("button", {
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
                children: (0, t.jsxs)(S.f, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [j, (0, t.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/ace27a0d313c4715310d5cc96f50b62b1e8ada81/assets", "/navigation/privacy_icon.png"),
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
            return (0, t.jsxs)(t.Fragment, {
                children: [r ? O : (0, t.jsx)(k.f, {
                    classes: {
                        root: m
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: O
                }), (0, t.jsx)(i.N, {
                    open: g,
                    onOpenChange: Q,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: o("Action.Close"),
                    children: (0, t.jsx)(i.d, {
                        children: R ? (0, t.jsxs)(i.K, {
                            children: [(0, t.jsx)(i.F, {
                                className: "text-heading-small",
                                children: o(I) || ""
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium",
                                children: o("Description.Loading") || ""
                            })]
                        }) : (0, t.jsx)(T, {
                            gpcState: x,
                            modalData: G,
                            translate: o,
                            translateHTML: s,
                            handleClose: Q,
                            privacyPreferencesUrl: D,
                            modalLinkClass: v.modalLink
                        })
                    })
                })]
            })
        };
    e.s(["default", 0, e => {
        let {
            inline: a = !1
        } = e;
        try {
            return (0, t.jsx)(F, {
                inline: a
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 86027, e => {
    "use strict";
    var t = e.i(118413),
        a = e.i(726474);
    let n = async e => a.dashboard.getServerManagementUrl(e, await (0, t.r)({
        universeId: e
    }));
    e.s(["Y", 0, e => e.includes("/observability/server-management"), "E", 0, n])
}]);

//# debugId=31bceadf-0f27-5495-c82c-d47f014590b4
//# sourceMappingURL=3wotl-dsq1wi8.js.map