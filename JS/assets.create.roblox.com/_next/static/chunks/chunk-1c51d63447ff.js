;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "d78ed437-bc3b-d02f-5a6b-02fb21b666bd")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 97782, e => {
    "use strict";
    var t = e.i(730530),
        a = e.i(881670);
    let n = {
            path: "/monetization/overview",
            pathPattern: /\/monetization\/overview/,
            title: (0, t.translationKey)("Heading.Monetization", a.TranslationNamespace.Analytics)
        },
        r = {
            path: "/dashboard/analytics",
            pathPattern: /\/dashboard\/analytics/,
            title: (0, t.translationKey)("Heading.Analytics", a.TranslationNamespace.Navigation)
        },
        i = {
            path: "/experiments",
            pathPattern: /\/experiments(?!\/)/,
            title: (0, t.translationKey)("Heading.Experiments", a.TranslationNamespace.Navigation)
        },
        o = {
            path: "/monetization/developer-products",
            pathPattern: /\/monetization\/developer-products/,
            title: (0, t.translationKey)("Label.DeveloperProducts", a.TranslationNamespace.Navigation),
            group: n
        },
        s = {
            path: "/monetization/passes",
            pathPattern: /\/monetization\/passes/,
            title: (0, t.translationKey)("Label.GamePasses", a.TranslationNamespace.Navigation),
            group: n
        },
        l = {
            path: "/monetization/avatar-items",
            pathPattern: /\/monetization\/avatar-items/,
            title: (0, t.translationKey)("Label.ThirdPartyAvatarItemCommissions", a.TranslationNamespace.Navigation),
            group: n
        },
        c = {
            path: "/creations/catalog",
            pathPattern: /\/creations\/catalog/,
            title: (0, t.translationKey)("Heading.ItemAnalytics", a.TranslationNamespace.Analytics)
        },
        d = {
            path: "/monetization/immersive-ads",
            pathPattern: /\/monetization\/immersive-ads/,
            title: (0, t.translationKey)("Heading.Ads", a.TranslationNamespace.Navigation),
            group: n
        },
        u = {
            path: "/monetization/subscriptions",
            pathPattern: /\/monetization\/subscriptions/,
            title: (0, t.translationKey)("Heading.Subscriptions", a.TranslationNamespace.Navigation),
            group: n
        },
        p = {
            path: "/analytics/memory-stores",
            pathPattern: /\/analytics\/memory-stores/,
            title: (0, t.translationKey)("Heading.MemoryStores", a.TranslationNamespace.Navigation)
        },
        m = {
            path: "/analytics/data-stores",
            pathPattern: /\/analytics\/data-stores/,
            title: (0, t.translationKey)("Heading.DataStores", a.TranslationNamespace.Navigation)
        },
        y = {
            path: "/analytics/http-service",
            pathPattern: /\/analytics\/http-service/,
            title: (0, t.translationKey)("Heading.HttpService", a.TranslationNamespace.Navigation)
        },
        g = {
            path: "/analytics/messaging-service",
            pathPattern: /\/analytics\/messaging-service/,
            title: (0, t.translationKey)("Heading.MessagingService", a.TranslationNamespace.Navigation)
        },
        h = {
            path: "/analytics/speech-to-text",
            pathPattern: /\/analytics\/speech-to-text/,
            title: (0, t.translationKey)("Heading.SpeechToText", a.TranslationNamespace.Navigation)
        },
        b = {
            path: "/analytics/text-to-speech",
            pathPattern: /\/analytics\/text-to-speech/,
            title: (0, t.translationKey)("Heading.TextToSpeech", a.TranslationNamespace.Navigation)
        },
        f = {
            path: "/analytics/video-service",
            pathPattern: /\/analytics\/video-service/,
            title: (0, t.translationKey)("Heading.VideoService", a.TranslationNamespace.Navigation)
        },
        v = {
            path: "/monetization/creator-rewards",
            pathPattern: /\/monetization\/creator-rewards/,
            title: (0, t.translationKey)("Heading.CreatorRewards", a.TranslationNamespace.Navigation),
            group: n
        },
        k = {
            path: "/monetization/roblox-plus",
            pathPattern: /\/monetization\/roblox-plus/,
            title: (0, t.translationKey)("Heading.RobloxPlusDeveloperProgram", a.TranslationNamespace.Navigation),
            group: n
        },
        N = {
            path: "/analytics/performance",
            pathPattern: /\/analytics\/performance/,
            title: (0, t.translationKey)("Heading.Performance", a.TranslationNamespace.Navigation)
        },
        C = {
            path: "/analytics/crashes",
            pathPattern: /\/analytics\/crashes/,
            title: (0, t.translationKey)("Heading.Crashes", a.TranslationNamespace.Analytics)
        },
        T = {
            path: "/analytics/errors",
            pathPattern: /\/analytics\/errors/,
            title: (0, t.translationKey)("Heading.ErrorReport", a.TranslationNamespace.Navigation)
        },
        I = {
            path: "/analytics/audience",
            pathPattern: /\/analytics\/audience/,
            title: (0, t.translationKey)("Heading.Demographics", a.TranslationNamespace.Navigation)
        },
        P = {
            path: "/analytics/economy",
            pathPattern: /\/analytics\/economy/,
            title: (0, t.translationKey)("Heading.Economy", a.TranslationNamespace.Navigation)
        },
        x = {
            path: "/analytics/funnels",
            pathPattern: /\/analytics\/funnels/,
            title: (0, t.translationKey)("Heading.Funnels", a.TranslationNamespace.Navigation)
        },
        A = {
            path: "/analytics/explore",
            pathPattern: /\/analytics\/explore/,
            title: (0, t.translationKey)("Heading.Explore", a.TranslationNamespace.Navigation)
        },
        w = {
            path: "/analytics/dashboards",
            pathPattern: /\/analytics\/dashboards/,
            title: (0, t.translationKey)("Heading.CustomDashboards", a.TranslationNamespace.Navigation)
        },
        S = {
            path: "/analytics/retention",
            pathPattern: /\/analytics\/retention/,
            title: (0, t.translationKey)("Heading.Retention", a.TranslationNamespace.Navigation)
        },
        E = {
            path: "/analytics/engagement",
            pathPattern: /\/analytics\/engagement/,
            title: (0, t.translationKey)("Heading.Engagement", a.TranslationNamespace.Navigation)
        },
        H = {
            path: "/analytics/acquisition",
            pathPattern: /\/analytics\/acquisition/,
            title: (0, t.translationKey)("Heading.Acquisition", a.TranslationNamespace.Navigation),
            group: r
        },
        R = {
            path: "/analytics/acquisition?tab=homeRecommendations",
            pathPattern: /\/analytics\/acquisition\?tab=homeRecommendations/,
            title: (0, t.translationKey)("Heading.Acquisition", a.TranslationNamespace.Navigation),
            group: r
        },
        D = {
            path: "/analytics/custom",
            pathPattern: /\/analytics\/custom/,
            title: (0, t.translationKey)("Heading.CustomEvents", a.TranslationNamespace.Navigation)
        },
        M = {
            path: "/analytics/journeys",
            pathPattern: /\/analytics\/journeys/,
            title: (0, t.translationKey)("Heading.Journeys", a.TranslationNamespace.Navigation)
        },
        L = {
            path: "/analytics/journeys/create",
            pathPattern: /\/analytics\/journeys\/create/,
            title: (0, t.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        j = {
            path: "/analytics/journeys/edit",
            pathPattern: /\/analytics\/journeys\/edit/,
            title: (0, t.translationKey)("Heading.JourneyEventsConfigCreate", a.TranslationNamespace.Navigation)
        },
        B = {
            path: "/analytics/journeys/view",
            pathPattern: /\/analytics\/journeys\/view/,
            title: (0, t.translationKey)("Heading.Journeys", a.TranslationNamespace.Navigation)
        },
        G = {
            path: "/feedback",
            pathPattern: /\/feedback/,
            title: (0, t.translationKey)("Heading.Feedback", a.TranslationNamespace.PlayerFeedback)
        },
        _ = {
            path: "/configs/history",
            pathPattern: /\/configs\/history/,
            title: (0, t.translationKey)("Heading.ConfigsHistory", a.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, t.translationKey)("Heading.ConfigHistory", a.TranslationNamespace.Navigation)
        },
        z = {
            path: "/configs",
            pathPattern: /\/configs(?!\/)/,
            title: (0, t.translationKey)("Heading.Configs", a.TranslationNamespace.Navigation)
        },
        U = {
            path: "/configs/config-create",
            pathPattern: /\/configs\/config-create/,
            title: (0, t.translationKey)("Heading.ConfigCreate", a.TranslationNamespace.Navigation)
        },
        O = {
            path: "/alerts",
            pathPattern: /\/alerts(?!\/)/,
            title: (0, t.translationKey)("Heading.Alerts", a.TranslationNamespace.Navigation)
        },
        F = {
            path: "/alerts/create",
            pathPattern: /\/alerts\/create/,
            title: (0, t.translationKey)("Heading.CreateAlert", a.TranslationNamespace.ExperienceAlerts)
        },
        K = {
            path: "/alerts",
            pathPattern: /\/alerts\/\d+\/configure$/,
            title: (0, t.translationKey)("Heading.ConfigureAlert", a.TranslationNamespace.Navigation)
        },
        q = {
            path: "/matchmaking",
            pathPattern: /\/matchmaking/,
            title: (0, t.translationKey)("Heading.CustomMatchmaking", a.TranslationNamespace.Matchmaking)
        },
        V = {
            path: "/monetization/commerce",
            pathPattern: /\/monetization\/commerce/,
            title: (0, t.translationKey)("Heading.Commerce", a.TranslationNamespace.Navigation),
            group: n
        },
        X = {
            path: "/analytics/assistant",
            pathPattern: /\/analytics\/assistant/,
            title: (0, t.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        W = {
            path: "/analytics/agent",
            pathPattern: /\/analytics\/agent/,
            title: (0, t.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        J = {
            path: "/analytics/ai-chat",
            pathPattern: /\/analytics\/ai-chat/,
            title: (0, t.translationKey)("Heading.Assistant", a.TranslationNamespace.Analytics)
        },
        Q = {
            path: "/experiments/experiment-create",
            pathPattern: /\/experiments\/experiment-create/,
            title: (0, t.translationKey)("Heading.ExperimentsCreate", a.TranslationNamespace.Navigation),
            titleOverrideForIAM2: (0, t.translationKeyWithoutNamespace)("Heading.Experimentation"),
            group: i
        },
        Y = {
            path: "/recommendation-service",
            pathPattern: /\/recommendation-service/,
            title: (0, t.translationKey)("Heading.RecommendationService", a.TranslationNamespace.Navigation)
        },
        $ = {
            path: "/safety/overview",
            pathPattern: /\/safety\/overview/,
            title: (0, t.translationKey)("Heading.SafetyOverview", a.TranslationNamespace.Analytics),
            titleOverrideForIAM2: (0, t.translationKey)("Heading.Safety", a.TranslationNamespace.Navigation)
        },
        Z = {
            path: "/overview",
            pathPattern: /\/overview(?![/\w])/,
            title: (0, t.translationKey)("Heading.Overview", a.TranslationNamespace.Navigation)
        },
        ee = {
            path: "/thumbnails",
            pathPattern: /\/places\/\d+\/thumbnails$/,
            title: (0, t.translationKey)("Heading.Thumbnails", a.TranslationNamespace.Navigation)
        },
        et = {
            path: "/notifications",
            pathPattern: /\/notifications/,
            title: (0, t.translationKey)("Heading.Notifications", a.TranslationNamespace.Navigation)
        },
        ea = {
            path: "/experience-subscriptions",
            pathPattern: /\/experience-subscriptions/,
            title: (0, t.translationKey)("Heading.Subscriptions", a.TranslationNamespace.Navigation),
            group: n
        },
        en = {
            path: "/analytics/generative-ai",
            pathPattern: /\/analytics\/generative-ai/,
            title: (0, t.translationKey)("Heading.GenerativeAI", a.TranslationNamespace.Navigation)
        },
        er = {
            path: "/monetization/avatar-creation-tokens",
            pathPattern: /\/monetization\/avatar-creation-tokens/,
            title: (0, t.translationKey)("Heading.AvatarCreationTokens", a.TranslationNamespace.AvatarAnalytics),
            titleOverrideForIAM2: (0, t.translationKey)("Heading.AvatarCreationTokens", a.TranslationNamespace.Navigation),
            group: n
        },
        ei = [R, H, E, S, n, o, s, l, c, d, u, p, m, y, g, h, b, f, en, v, k, N, C, T, I, P, x, M, L, j, B, A, w, D, X, W, J, G, _, z, U, q, V, $, Z, r, i, Q, Y, ee, et, ea, F, K, O, er];
    e.s(["analyticsAgentNavigationItem", 0, W, "analyticsAiChatNavigationItem", 0, J, "analyticsAlertConfifurationNavigationItem", 0, K, "analyticsAlertCreationNavigationItem", 0, F, "analyticsAlertsNavigationItem", 0, O, "analyticsAnalyticsHomeNavigationItem", 0, r, "analyticsAssistantNavigationItem", 0, X, "analyticsAudienceNavigationItem", 0, I, "analyticsAvatarCreationTokensNavigationItem", 0, er, "analyticsBountyPayoutsNavigationItem", 0, k, "analyticsCommerceNavigationItem", 0, V, "analyticsConfigsHistoryNavigationItem", 0, _, "analyticsConfigsNavigationItem", 0, z, "analyticsCrashesNavigationItem", 0, C, "analyticsCreationOverviewNavigationItem", 0, Z, "analyticsCustomDashboardsManageNavigationItem", 0, w, "analyticsCustomEventsNavigationItem", 0, D, "analyticsDataStoresNavigationItem", 0, m, "analyticsEngagementNavigationItem", 0, E, "analyticsErrorReportNavigationItem", 0, T, "analyticsExperienceCreatorRewardsNavigationItem", 0, v, "analyticsExperienceSubscriptionsNavigationItem", 0, ea, "analyticsExperimentsCreateNavigationItem", 0, Q, "analyticsExperimentsNavigationItem", 0, i, "analyticsExploreNavigationItem", 0, A, "analyticsFeedbackNavigationItem", 0, G, "analyticsGenerativeAINavigationItem", 0, en, "analyticsHttpServiceNavigationItem", 0, y, "analyticsImmersiveAdsNavigationItem", 0, d, "analyticsItemMonetizationAvatarItemsNavigationItem", 0, l, "analyticsItemMonetizationDeveloperProductsNavigationItem", 0, o, "analyticsItemMonetizationPassesNavigationItem", 0, s, "analyticsMatchmakingNavigationItem", 0, q, "analyticsMemoryStoresNavigationItem", 0, p, "analyticsMessagingServiceNavigationItem", 0, g, "analyticsMonetizationNavigationItem", 0, n, "analyticsNotificationsNavigationItem", 0, et, "analyticsPerformanceNavigationItem", 0, N, "analyticsRecommendationServiceNavigationItem", 0, Y, "analyticsRecommendedEventsEconomyNavigationItem", 0, P, "analyticsRecommendedEventsFunnelsNavigationItem", 0, x, "analyticsRecommendedEventsJourneyCreateNavigationItem", 0, L, "analyticsRecommendedEventsJourneyEditNavigationItem", 0, j, "analyticsRecommendedEventsJourneyNavigationItem", 0, M, "analyticsRecommendedEventsJourneyViewNavigationItem", 0, B, "analyticsRetentionNavigationItem", 0, S, "analyticsSafetyNavigationItem", 0, $, "analyticsSpeechToTextNavigationItem", 0, h, "analyticsSubscriptionsNavigationItem", 0, u, "analyticsTextToSpeechNavigationItem", 0, b, "analyticsUserAcquisitionNavigationItem", 0, H, "analyticsUserAcquisitionRFYNavigationItem", 0, R, "analyticsVideoServiceNavigationItem", 0, f, "getAnalyticsNavigationItemFromPath", 0, function(e) {
        return ei.find(t => t.pathPattern.test(e))
    }])
}, 533968, e => {
    "use strict";
    var t = e.i(185915);
    e.s(["getResponseFromError", () => t.default])
}, 105098, 995721, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isLoadingLook: !1,
        refreshLookDetails: () => {
            throw Error("function is not implemented")
        },
        lookSalesData: void 0,
        lookDetail: void 0
    });
    a.displayName = "LookDetails", e.s(["default", 0, a], 995721), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 105098)
}, 177608, 556499, 634877, 966501, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(37819),
        r = e.i(602635),
        i = e.i(79187),
        o = e.i(844333),
        s = e.i(729904),
        l = e.i(486736),
        c = e.i(507742),
        d = e.i(260241),
        u = e.i(298964),
        p = e.i(623983),
        m = e.i(345886),
        y = e.i(581577),
        g = e.i(894854),
        h = e.i(881670),
        b = e.i(174528),
        f = e.i(537068),
        v = e.i(589624),
        k = e.i(194250),
        N = e.i(863605),
        C = e.i(154502),
        T = e.i(945146),
        I = e.i(690569);
    e.i(535072);
    var P = e.i(251635),
        x = e.i(634034),
        A = e.i(690768),
        w = e.i(787802),
        S = e.i(396249),
        E = e.i(121880),
        H = e.i(15686);
    e.i(39651);
    var R = (0, x.c)((0, t.jsx)("path", {
        d: "M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"
    }), "MoreHoriz");
    let D = ["slots", "slotProps"],
        M = (0, P.s)(A.B, {
            name: "MuiBreadcrumbCollapsed"
        })(e => {
            let {
                theme: t
            } = e;
            return (0, T._)({
                display: "flex",
                marginLeft: "calc(".concat(t.spacing(1), " * 0.5)"),
                marginRight: "calc(".concat(t.spacing(1), " * 0.5)")
            }, "light" === t.palette.mode ? {
                backgroundColor: t.palette.grey[100],
                color: t.palette.grey[700]
            } : {
                backgroundColor: t.palette.grey[700],
                color: t.palette.grey[100]
            }, {
                borderRadius: 2,
                "&:hover, &:focus": (0, T._)({}, "light" === t.palette.mode ? {
                    backgroundColor: t.palette.grey[200]
                } : {
                    backgroundColor: t.palette.grey[600]
                }),
                "&:active": (0, T._)({
                    boxShadow: t.shadows[0]
                }, "light" === t.palette.mode ? {
                    backgroundColor: (0, I.n)(t.palette.grey[200], .12)
                } : {
                    backgroundColor: (0, I.n)(t.palette.grey[600], .12)
                })
            })
        }),
        L = (0, P.s)(R)({
            width: 24,
            height: 16
        });

    function j(e) {
        let {
            slots: a = {},
            slotProps: n = {}
        } = e, r = (0, I._)(e, D);
        return (0, t.jsx)("li", {
            children: (0, t.jsx)(M, (0, T._)({
                focusRipple: !0
            }, r, {
                ownerState: e,
                children: (0, t.jsx)(L, (0, T._)({
                    as: a.CollapsedIcon,
                    ownerState: e
                }, n.collapsedIcon))
            }))
        })
    }

    function B(e) {
        return (0, I.g)("MuiBreadcrumbs", e)
    }
    var G = (0, w.g)("MuiBreadcrumbs", ["root", "ol", "li", "separator"]);
    let _ = ["children", "className", "component", "slots", "slotProps", "expandText", "itemsAfterCollapse", "itemsBeforeCollapse", "maxItems", "separator"],
        z = (0, P.s)(S.T, {
            name: "MuiBreadcrumbs",
            slot: "Root",
            overridesResolver: (e, t) => [{
                ["& .".concat(G.li)]: t.li
            }, t.root]
        })({}),
        U = (0, P.s)("ol", {
            name: "MuiBreadcrumbs",
            slot: "Ol",
            overridesResolver: (e, t) => t.ol
        })({
            display: "flex",
            flexWrap: "wrap",
            alignItems: "center",
            padding: 0,
            margin: 0,
            listStyle: "none"
        }),
        O = (0, P.s)("li", {
            name: "MuiBreadcrumbs",
            slot: "Separator",
            overridesResolver: (e, t) => t.separator
        })({
            display: "flex",
            userSelect: "none",
            marginLeft: 8,
            marginRight: 8
        }),
        F = a.forwardRef(function(e, n) {
            var r, i;
            let o = (0, E.u)({
                    props: e,
                    name: "MuiBreadcrumbs"
                }),
                {
                    children: s,
                    className: l,
                    component: c = "nav",
                    slots: d = {},
                    slotProps: u = {},
                    expandText: p = "Show path",
                    itemsAfterCollapse: m = 1,
                    itemsBeforeCollapse: y = 1,
                    maxItems: g = 8,
                    separator: h = "/"
                } = o,
                b = (0, I._)(o, _),
                [f, v] = a.useState(!1),
                k = (0, T._)({}, o, {
                    component: c,
                    expanded: f,
                    expandText: p,
                    itemsAfterCollapse: m,
                    itemsBeforeCollapse: y,
                    maxItems: g,
                    separator: h
                }),
                N = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, P.a)({
                        root: ["root"],
                        li: ["li"],
                        ol: ["ol"],
                        separator: ["separator"]
                    }, B, t)
                })(k),
                C = (0, H.u)({
                    elementType: d.CollapsedIcon,
                    externalSlotProps: u.collapsedIcon,
                    ownerState: k
                }),
                x = a.useRef(null),
                A = a.Children.toArray(s).filter(e => a.isValidElement(e)).map((e, a) => (0, t.jsx)("li", {
                    className: N.li,
                    children: e
                }, "child-".concat(a)));
            return (0, t.jsx)(z, (0, T._)({
                ref: n,
                component: c,
                color: "text.secondary",
                className: (0, P.c)(N.root, l),
                ownerState: k
            }, b, {
                children: (0, t.jsx)(U, {
                    className: N.ol,
                    ref: x,
                    ownerState: k,
                    children: (r = f || g && A.length <= g || y + m >= A.length ? A : [...A.slice(0, y), (0, t.jsx)(j, {
                        "aria-label": p,
                        slots: {
                            CollapsedIcon: d.CollapsedIcon
                        },
                        slotProps: {
                            collapsedIcon: C
                        },
                        onClick: () => {
                            v(!0);
                            let e = x.current.querySelector("a[href],button,[tabindex]");
                            e && e.focus()
                        }
                    }, "ellipsis"), ...A.slice(A.length - m, A.length)], i = N.separator, r.reduce((e, a, n) => (n < r.length - 1 ? e = e.concat(a, (0, t.jsx)(O, {
                        "aria-hidden": !0,
                        className: i,
                        ownerState: k,
                        children: h
                    }, "separator-".concat(n))) : e.push(a), e), []))
                })
            }))
        });
    var K = (0, N.default)({
            name: "Breadcrumbs"
        })(function(e) {
            return {
                root: (0, k._)((0, k._)({}, e.typography.body1), {
                    color: e.palette.content.muted
                })
            }
        }),
        q = (0, a.forwardRef)(function(e, t) {
            var n = e.classes,
                r = e.className,
                i = (0, k.a)(e, ["classes", "className"]),
                o = K(void 0, {
                    props: {
                        classes: (0, C.default)(n, r)
                    }
                });
            return a.default.createElement(F, (0, k._)({
                classes: o.classes
            }, i, {
                ref: t
            }))
        });
    e.s(["Breadcrumbs", 0, q], 556499);
    var V = e.i(686762),
        X = e.i(83265),
        W = e.i(114209),
        J = e.i(97782),
        Q = e.i(475360),
        Y = e.i(759283),
        $ = e.i(829425),
        Z = e.i(726474),
        ee = e.i(128106);
    let et = (e, t) => e.args && e.args.value ? t(e.key, {
            [e.args.param]: t(e.args.value)
        }) : t(e.key),
        ea = e => {
            var t;
            let a = parseInt(null != (t = e.developerItemId) ? t : "", 10);
            return Number.isNaN(a) ? Z.dashboard.configureCreatorStoreItemBasePath : Z.dashboard.getConfigureCreatorStoreItemUrl(a)
        },
        en = {
            analytics: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Analytics"
                    }, t)
                },
                breadcrumbType: ee.default.Catalog
            },
            observability: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Observability"
                    }, t) || "Observability"
                },
                breadcrumbType: ee.default.Observability
            },
            creations: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Creations"
                    }, t)
                },
                breadcrumbType: ee.default.Creations,
                getLinkPath: e => (null == e ? void 0 : e.groupId) ? "/dashboard/creations?groupId=".concat(null == e ? void 0 : e.groupId) : "/dashboard/creations"
            },
            experiences: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Games"
                    }, t)
                },
                breadcrumbType: ee.default.Games,
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/overview")
            },
            collaborators: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Tab.Collaborators"
                    }, t)
                },
                breadcrumbType: ee.default.Collaborators,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/collaborators")
            },
            badges: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Badges"
                    }, t)
                },
                breadcrumbType: ee.default.Badge,
                parentItemTypeName: "associated-items",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/badges/").concat(e.badgeId, "/overview")
            },
            "referral-reward-details": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ReferralRewards"
                    }, t)
                },
                breadcrumbType: ee.default.ReferralRewards,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/referral-reward-details"),
                parentItemTypeName: "referral-reward-details",
                withId: !0
            },
            bundle: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Creations"
                    }, t)
                },
                breadcrumbType: ee.default.Bundle,
                getLinkPath: e => "/dashboard/creations/bundle/".concat(e.bundleId, "/configure"),
                withId: !0
            },
            "experience-subscriptions": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Subscriptions"
                    }, t)
                },
                breadcrumbType: ee.default.ExperienceSubscription,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "associated-items": {
                displayName: e => {
                    let {
                        translate: t,
                        itemType: a
                    } = e;
                    return a ? et({
                        key: Y.itemFullNameKeys[a]
                    }, t) : et({
                        key: "Heading.AssociatedItems"
                    }, t)
                },
                breadcrumbType: ee.default.AssociatedItems,
                getLinkPath: e => (null == e ? void 0 : e.associatedItemType) === Q.Item.DeveloperProduct ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/developer-products") : (null == e ? void 0 : e.associatedItemType) === Q.Item.ExperienceSubscription ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/subscriptions") : (null == e ? void 0 : e.associatedItemType) === Q.Item.GamePass ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/passes") : (null == e ? void 0 : e.associatedItemType) ? "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items?activeTab=").concat(e.associatedItemType) : "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            catalog: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Creations"
                    }, t)
                },
                breadcrumbType: ee.default.Catalog,
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/configure"),
                withId: !0
            },
            store: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Creations"
                    }, t)
                },
                breadcrumbType: ee.default.CreatorStore,
                getLinkPath: ea,
                withId: !0
            },
            "version-history": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.VersionHistory"
                    }, t)
                },
                breadcrumbType: ee.default.CreatorStore,
                getLinkPath: ea,
                withId: !1
            },
            dependencies: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Dependencies"
                    }, t)
                },
                breadcrumbType: ee.default.CreatorStore,
                getLinkPath: ea,
                withId: !1
            },
            localization: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Localization"
                    }, t)
                },
                breadcrumbType: ee.default.Localization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/localization")
            },
            "activity-history": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ActivityFeed"
                    }, t)
                },
                breadcrumbType: ee.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            activityFeed: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ActivityFeed"
                    }, t)
                },
                breadcrumbType: ee.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            notifications: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Notifications"
                    }, t)
                },
                breadcrumbType: ee.default.Notifications,
                getLinkPath: e => e.baseId ? "/dashboard/creations/experiences/".concat(e.baseId, "/notifications") : "/settings/notifications"
            },
            update: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Notifications.UpdateContent"
                    }, t)
                },
                breadcrumbType: ee.default.Notifications
            },
            "social-links": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.SocialLinks"
                    }, t)
                },
                breadcrumbType: ee.default.SocialLinks,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/social-links")
            },
            updates: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Updates"
                    }, t)
                },
                breadcrumbType: ee.default.Updates,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/updates")
            },
            translation: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Translation"
                    }, t)
                },
                breadcrumbType: ee.default.Translation,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            overview: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Overview"
                    }, t)
                },
                breadcrumbType: ee.default.Overview
            },
            passes: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.GamePass"
                    }, t)
                },
                breadcrumbType: ee.default.GamePass,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "developer-products": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.DeveloperProduct"
                    }, t)
                },
                breadcrumbType: ee.default.DeveloperProduct,
                withId: !0,
                parentItemTypeName: "associated-items"
            },
            "external-purchase-settings": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ExternalPurchaseSettings"
                    }, t)
                },
                breadcrumbType: ee.default.ExternalPurchaseSettings
            },
            "avatar-items": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Label.ThirdPartyAvatarItemCommissions"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsMonetization
            },
            "avatar-creation-tokens": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.AvatarCreationTokens"
                    }, t)
                },
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationAvatarCreationTokensUrl(Number(e.baseId)),
                breadcrumbType: ee.default.AnalyticsMonetization
            },
            subscriptions: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Label.Subscriptions"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsMonetization
            },
            commerce: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Commerce"
                    }, t)
                },
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationCommerceUrl(Number(e.baseId)),
                breadcrumbType: ee.default.Commerce
            },
            "create-products": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.CreateProduct"
                    }, t)
                },
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationCommerceCreateProductUrl(Number(e.baseId)),
                breadcrumbType: ee.default.CreateProducts
            },
            eligibility: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Eligibility"
                    }, t)
                },
                getLinkPath: () => "/settings/eligibility",
                breadcrumbType: ee.default.Eligibility
            },
            "priced-assets": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PricedAssets"
                    }, t)
                },
                breadcrumbType: ee.default.PricedAssets
            },
            "audio-distribution": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.AudioDistribution"
                    }, t)
                },
                breadcrumbType: ee.default.AudioDistribution
            },
            "paid-access": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PaidAccess"
                    }, t)
                },
                breadcrumbType: ee.default.PaidAccess
            },
            "extended-services": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ExtendedServices"
                    }, t)
                },
                breadcrumbType: ee.default.ExtendedServices
            },
            "public-publish": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PublicPublish"
                    }, t)
                },
                breadcrumbType: ee.default.PublicPublish
            },
            "publishing-permissions": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PublishingPermissions"
                    }, t)
                },
                breadcrumbType: ee.default.PublishingPermissions
            },
            "us-o18-devex-rate": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.DevExO18UsSettingsNav"
                    }, t)
                },
                breadcrumbType: ee.default.UsO18DevexRate
            },
            "contribution-report": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ContributionReports"
                    }, t)
                },
                breadcrumbType: ee.default.ContributionReport
            },
            acquisition: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Acquisition"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsAcquisition
            },
            engagement: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Engagement"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsEngagement
            },
            retention: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Retention"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsRetention
            },
            monetization: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Monetization"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsMonetization,
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationOverviewUrl(Number(e.baseId))
            },
            performance: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsPerformanceNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsPerformance
            },
            crashes: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsCrashesNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsCrashes
            },
            audience: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsAudienceNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsAudience
            },
            economy: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsRecommendedEventsEconomyNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsEconomy
            },
            funnels: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsRecommendedEventsFunnelsNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsFunnels
            },
            journeys: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsRecommendedEventsJourneyNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsJourneys,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/journeys")
            },
            view: {
                displayName: () => "",
                withId: !0,
                breadcrumbType: ee.default.AnalyticsJourneyDetail
            },
            edit: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Action.Edit"
                    }, t)
                },
                breadcrumbType: ee.default.Create
            },
            preview: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Action.CustomDashboards.Preview"
                    }, t)
                },
                breadcrumbType: ee.default.Create
            },
            errors: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsErrorReportNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsErrorReport
            },
            "memory-stores": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsMemoryStoresNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsMemoryStores
            },
            "data-stores": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsDataStoresNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsDataStores
            },
            leaderboard: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Leaderboard"
                    }, t)
                },
                breadcrumbType: ee.default.Leaderboard
            },
            "http-service": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsHttpServiceNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsHttpServicce
            },
            "messaging-service": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsMessagingServiceNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsMessagingService
            },
            "speech-to-text": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsSpeechToTextNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsSpeechToText
            },
            "text-to-speech": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsTextToSpeechNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsTextToSpeech
            },
            "video-service": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsVideoServiceNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsVideoService
            },
            "generative-ai": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsGenerativeAINavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsGenerativeAI
            },
            custom: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsCustomEventsNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticCustomEvents
            },
            explore: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsExploreNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsExploreMode
            },
            dashboards: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsCustomDashboardsManageNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsCustomDashboards,
                parentItemTypeName: "dashboards",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/dashboards")
            },
            "managed-pricing": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ManagedPricing"
                    }, t)
                },
                breadcrumbType: ee.default.ManagedPricing,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/managed-pricing")
            },
            shop: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PersonalizedShop"
                    }, t)
                },
                breadcrumbType: ee.default.PersonalizedShop,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/shop")
            },
            "developer-product-purchases-blocked": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.DeveloperProductPurchasesBlocked"
                    }, t)
                },
                breadcrumbType: ee.default.DeveloperProductPurchasesBlocked,
                getLinkPath: e => Z.dashboard.getDeveloperProductPurchasesBlockedUrl(Number(e.baseId))
            },
            "hard-coded-prices": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.HardCodedPrices"
                    }, t)
                },
                breadcrumbType: ee.default.HardCodedPrices,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/hard-coded-prices")
            },
            "price-optimization": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PriceOptimization"
                    }, t)
                },
                breadcrumbType: ee.default.PriceOptimization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/price-optimization")
            },
            "price-check": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.DynamicPriceCheck"
                    }, t)
                },
                breadcrumbType: ee.default.PriceCheck
            },
            "immersive-ads": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Ads"
                    }, t)
                },
                breadcrumbType: ee.default.ImmersiveAds,
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationImmersiveAdsUrl(Number(e.baseId))
            },
            "create-placement": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.AdsCreatePlacement"
                    }, t)
                },
                breadcrumbType: ee.default.ImmersiveAdsCreatePlacement
            },
            "creator-rewards": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.CreatorRewards"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/creator-rewards")
            },
            "roblox-plus": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.RobloxPlusDeveloperProgram"
                    }, t)
                },
                breadcrumbType: ee.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/roblox-plus")
            },
            "experience-questionnaire": {
                displayName: e => {
                    let {
                        translate: t,
                        enableQuestionnaireV2: a,
                        isUpdatedPublishingFlowEnabled: n,
                        isUpdatedSettingsNavigationEnabled: r
                    } = e, i = "Heading.ExperienceQuestionnaire";
                    return (a || n || r) && (i = "Heading.ContentRatings"), et({
                        key: i
                    }, t)
                },
                breadcrumbType: ee.default.Questionnaire
            },
            guidelines: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Guidelines"
                    }, t)
                },
                breadcrumbType: ee.default.Questionnaire
            },
            configure: {
                displayName: e => {
                    let {
                        translate: t,
                        itemType: a
                    } = e;
                    return a === Q.Item.CatalogAsset || a === Q.Item.LibraryAsset || a === Q.Item.Bundle || a === Q.Item.Event || a === Q.Item.AvatarCreationToken || a === Q.Item.Environment || a === Q.Item.Look ? et({
                        key: "Heading.Configure"
                    }, t) : a === Q.Item.Game ? et({
                        key: "Heading.ContentSettings"
                    }, t) : a === Q.Item.ExperienceSubscription ? et({
                        key: "Heading.UpdateSubscription"
                    }, t) : a === Q.Item.Alert ? et({
                        key: "Heading.ConfigureAlert"
                    }, t) : et({
                        key: "Heading.BasicSettings"
                    }, t)
                },
                breadcrumbType: ee.default.Configure
            },
            "communication-settings": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.CommunicationSettings"
                    }, t)
                },
                breadcrumbType: ee.default.CommunicationSettings,
                getLinkPath: e => "/creations/experiences/".concat(e.baseId, "/communication-settings")
            },
            sales: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Sales"
                    }, t)
                },
                breadcrumbType: ee.default.Sales
            },
            promotions: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Promotions"
                    }, t)
                },
                breadcrumbType: ee.default.Promotions
            },
            create: {
                displayName: e => {
                    let {
                        translate: t,
                        itemType: a
                    } = e;
                    return a ? et({
                        key: "Heading.Create",
                        args: {
                            param: "itemType",
                            value: Y.itemTypeToSingularNameKeys[a]
                        }
                    }, t) : et({
                        key: "Heading.Create"
                    }, t)
                },
                breadcrumbType: ee.default.Create
            },
            places: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Places"
                    }, t)
                },
                breadcrumbType: ee.default.Places,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/places"),
                parentItemTypeName: "places",
                withId: !0
            },
            environments: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Environments"
                    }, t)
                },
                breadcrumbType: ee.default.Environments,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/environments"),
                parentItemTypeName: "environments",
                withId: !0
            },
            new_environment: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Action.CreateEnvironment"
                    }, t)
                },
                breadcrumbType: ee.default.Environments,
                parentItemTypeName: "environments"
            },
            manage: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Manage"
                    }, t)
                },
                breadcrumbType: ee.default.Manage
            },
            icon: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Icon"
                    }, t)
                },
                breadcrumbType: ee.default.Icon
            },
            events: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Events"
                    }, t)
                },
                breadcrumbType: ee.default.Event,
                withId: !0,
                parentItemTypeName: "events",
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/events")
            },
            "select-eligibility": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Title.SelectEligibility"
                    }, t)
                },
                breadcrumbType: ee.default.SelectEligibility
            },
            thumbnails: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PlaceThumbnails"
                    }, t)
                },
                breadcrumbType: ee.default.Thumbnails
            },
            videos: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PlaceVideos"
                    }, t)
                },
                breadcrumbType: ee.default.Videos
            },
            access: {
                displayName: e => {
                    var t;
                    let {
                        translate: a,
                        isUpdatedSettingsNavigationEnabled: n,
                        pathname: r
                    } = e, i = null != (t = null == r ? void 0 : r.split("/").includes("places")) && t;
                    return et({
                        key: n && !i ? "Heading.GameAccess" : "Heading.AccessSettings"
                    }, a)
                },
                breadcrumbType: ee.default.Access
            },
            secrets: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Secrets"
                    }, t)
                },
                breadcrumbType: ee.default.Secrets
            },
            matchmaking: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.CustomMatchmaking"
                    }, t)
                },
                breadcrumbType: ee.default.CustomMatchmaking,
                getLinkPath: e => Z.dashboard.getCustomMatchmakingDashboardUrl(Number(e.baseId))
            },
            "server-management": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ServerManagement"
                    }, t)
                },
                breadcrumbType: ee.default.ServerManagement,
                getLinkPath: e => Z.dashboard.getServerManagementUrl(Number(e.baseId))
            },
            "client-sessions": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ClientSessions"
                    }, t)
                },
                breadcrumbType: ee.default.ClientSessions,
                getLinkPath: e => Z.dashboard.getClientSessionsUrl(Number(e.baseId))
            },
            "[sessionId]": {
                displayName: () => "",
                breadcrumbType: ee.default.ClientSession,
                withId: !0
            },
            "create-configuration": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.CreateConfiguration"
                    }, t)
                },
                breadcrumbType: ee.default.CreateMatchmakingConfiguration
            },
            "edit-configuration": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.EditConfiguration"
                    }, t)
                },
                breadcrumbType: ee.default.EditMatchmakingConfiguration
            },
            "create-attribute": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.CreateAttribute"
                    }, t)
                },
                breadcrumbType: ee.default.CreateMatchmakingAttribute,
                getLinkPath: e => Z.dashboard.getCustomMatchmakingAttributeCreationUrl(Number(e.baseId))
            },
            "edit-player-attribute": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.EditPlayerAttribute"
                    }, t)
                },
                breadcrumbType: ee.default.EditMatchmakingPlayerAttribute
            },
            "edit-server-attribute": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.EditServerAttribute"
                    }, t)
                },
                breadcrumbType: ee.default.EditMatchmakingServerAttribute
            },
            settings: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Settings"
                    }, t)
                },
                breadcrumbType: ee.default.Settings
            },
            permissions: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Permissions"
                    }, t)
                },
                breadcrumbType: ee.default.Permissions
            },
            webhooks: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Webhooks"
                    }, t)
                },
                breadcrumbType: ee.default.Webhooks
            },
            "data-collection": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.DataSharing"
                    }, t)
                },
                breadcrumbType: ee.default.DataSharing
            },
            "[notificationCategory]": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Notifications"
                    }, t)
                },
                withId: !0,
                breadcrumbType: ee.default.Category
            },
            preferences: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Preferences"
                    }, t)
                },
                breadcrumbType: ee.default.Preferences
            },
            advanced: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Header.Title"
                    }, t)
                },
                breadcrumbType: ee.default.Advanced
            },
            bans: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Moderation"
                    }, t)
                },
                breadcrumbType: ee.default.Bans,
                getLinkPath: e => $.creatorHub.dashboard.getUserBansUrl(Number(e.baseId))
            },
            "anti-cheat": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Moderation"
                    }, t)
                },
                breadcrumbType: ee.default.AntiCheat,
                getLinkPath: e => $.creatorHub.dashboard.getAntiCheatUrl(Number(e.baseId))
            },
            add: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.AddUsersToBan"
                    }, t)
                },
                breadcrumbType: ee.default.Add
            },
            reorder: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Reorder"
                    }, t)
                },
                breadcrumbType: ee.default.Reorder
            },
            feedback: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Feedback"
                    }, t)
                },
                breadcrumbType: ee.default.Feedback
            },
            "api-settings": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.APISettings"
                    }, t)
                },
                breadcrumbType: ee.default.ApiSettings
            },
            configs: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Configs"
                    }, t)
                },
                breadcrumbType: ee.default.Configs,
                getLinkPath: e => $.creatorHub.dashboard.getAnalyticsConfigsUrl(Number(e.baseId))
            },
            experiments: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Experiments"
                    }, t)
                },
                breadcrumbType: ee.default.Experiments,
                getLinkPath: e => $.creatorHub.dashboard.getExperimentsUrl(Number(e.baseId))
            },
            "experiment-create": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ExperimentCreate"
                    }, t)
                },
                breadcrumbType: ee.default.ExperimentCreate
            },
            "experiment-details": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ExperimentDetails"
                    }, t)
                },
                breadcrumbType: ee.default.ExperimentDetails,
                withId: !0
            },
            alerts: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Alerts"
                    }, t)
                },
                breadcrumbType: ee.default.Alerts,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/alerts"),
                parentItemTypeName: "alerts",
                withId: !0
            },
            history: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ConfigsHistory"
                    }, t)
                },
                breadcrumbType: ee.default.ConfigsHistory
            },
            "config-create": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ConfigCreate"
                    }, t)
                },
                breadcrumbType: ee.default.ConfigCreate
            },
            variants: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Variants"
                    }, t)
                },
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/variants"),
                breadcrumbType: ee.default.Catalog
            },
            look: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Creations"
                    }, t)
                },
                breadcrumbType: ee.default.Look,
                getLinkPath: e => "/dashboard/creations/look/".concat(e.lookId, "/configure"),
                withId: !0
            },
            "audience-reach": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.AudienceReach"
                    }, t)
                },
                breadcrumbType: ee.default.AudienceReach,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/audience-reach")
            },
            "game-details": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.GameDetails"
                    }, t)
                },
                breadcrumbType: ee.default.GameDetails
            },
            "content-rating": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.ContentRatings"
                    }, t)
                },
                breadcrumbType: ee.default.ContentRating
            },
            "game-join": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.GameAccess"
                    }, t)
                },
                breadcrumbType: ee.default.GameJoin
            },
            publishing: {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.Publishing"
                    }, t)
                },
                breadcrumbType: ee.default.Publishing
            },
            "player-support": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: "Heading.PlayerSupport"
                    }, t)
                },
                breadcrumbType: ee.default.PlayerSupport,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/player-support")
            },
            "[ticketId]": {
                displayName: () => "",
                breadcrumbType: ee.default.PlayerSupportTicket
            },
            "recommendation-service": {
                displayName: e => {
                    let {
                        translate: t
                    } = e;
                    return et({
                        key: J.analyticsRecommendationServiceNavigationItem.title.key
                    }, t)
                },
                breadcrumbType: ee.default.RecommendationService
            }
        };
    var er = e.i(509049);
    let ei = (0, a.createContext)({
        insideTopNavigationDrawer: !1
    });

    function eo() {
        return (0, a.useContext)(ei)
    }
    ei.displayName = "TopNavigationSidebarDrawerContext", e.s(["default", 0, eo], 634877);
    let es = (0, e.i(697973).makeStyles)()(e => ({
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
        el = (e, t) => t && e.replaceAll(/\[[^\]]*?\]/g, "") === (null == t ? void 0 : t.replaceAll(/\d+/g, "")) ? void 0 : t,
        ec = (0, i.withTranslation)(e => {
            let {
                inLayoutHeader: i = !1
            } = e, {
                pathname: o,
                query: s
            } = (0, v.useRouter)(), {
                classes: {
                    linkStyle: l,
                    compactBreadCrumbLinkStyle: c,
                    breadcrumb: d,
                    breadcrumbBottomSpace: u,
                    compactBreadCrumb: y
                }
            } = es(), {
                insideTopNavigationDrawer: g
            } = eo(), h = (0, X.useMediaQuery)(e => e.breakpoints.down("Medium")), {
                gameDetails: b
            } = (0, W.useCurrentGame)(), k = (0, a.useMemo)(() => {
                let e = o.includes("/analytics/dashboards/");
                return o.split("/").filter(e => !!e).filter(t => "analytics" !== t || !e)
            }, [o]), {
                itemNameMapping: N,
                pathLinkParams: C,
                displayNameParam: T
            } = (0, er.default)(), I = "string" == typeof s.dashboardId ? s.dashboardId : void 0, P = "string" == typeof s.id ? s.id : void 0, x = o.endsWith("/analytics/dashboards/[dashboardId]/edit") && P && I ? "/dashboard/creations/experiences/".concat(P, "/analytics/dashboards/").concat(I) : void 0, A = (0, a.useCallback)((e, a) => g ? a ? (0, t.jsx)(f.default, {
                href: a,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, t.jsx)(V.Link, {
                    underline: "always",
                    color: "inherit",
                    children: (0, t.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: e
                    })
                })
            }, e) : (0, t.jsx)(p.Typography, {
                color: "primary",
                variant: "largeLabel1",
                children: e
            }, e) : a ? (0, t.jsx)(f.default, {
                href: a,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, t.jsx)(V.Link, {
                    classes: {
                        root: l
                    },
                    children: e
                })
            }, e) : (0, t.jsx)(p.Typography, {
                color: "secondary",
                children: e
            }, e), [g, l]), w = (0, a.useCallback)(e => {
                var t, a;
                let n = e.parentItemTypeName ? en[e.parentItemTypeName] : null,
                    r = N[e.breadcrumbType],
                    i = e.breadcrumbType === ee.default.AnalyticsCustomDashboards && x ? x : void 0,
                    s = null != i ? i : null == (t = e.getLinkPath) ? void 0 : t.call(e, C),
                    l = void 0 !== i || null === n || e.breadcrumbType !== n.breadcrumbType;
                return [n ? A(n.displayName(T), el(o, null == (a = n.getLinkPath) ? void 0 : a.call(n, C))) : null, r ? A(r, l ? el(o, s) : void 0) : null]
            }, [N, C, A, T, o, x]), S = (0, a.useMemo)(() => {
                let e;
                return e = [], k.filter(e => en[e]).forEach(t => {
                    let a = en[t],
                        n = a.displayName(T);
                    if (n && e.push(n), a.withId) {
                        let t = N[a.breadcrumbType];
                        t && e.push(t)
                    }
                }), e
            }, [k, T, N]), E = (0, a.useMemo)(() => (function(e) {
                if (e.length < 2) return;
                let t = e[e.length - 1],
                    a = e[e.length - 2];
                if (t && a) return "".concat(a, " / ").concat(t)
            })(S), [S]), H = (0, a.useMemo)(() => {
                var e, t;
                return o.includes("/experiences/") ? {
                    description: null == b ? void 0 : b.name,
                    author: null == b || null == (e = b.creator) ? void 0 : e.name,
                    entityName: null == b ? void 0 : b.name,
                    entityId: null == b || null == (t = b.id) ? void 0 : t.toString(),
                    type: "experience"
                } : {}
            }, [o, b]), {
                breadcrumbsContents: R,
                breadcrumbNames: D
            } = (0, a.useMemo)(() => {
                let e = e => {
                        if (e.withId) {
                            var t;
                            return null != (t = N[e.breadcrumbType]) ? t : e.displayName(T)
                        }
                        return e.displayName(T)
                    },
                    a = k.map(e => ({
                        key: e,
                        breadcrumbDetails: en[e]
                    })).filter(e => e.breadcrumbDetails);
                if (i && h) {
                    var n;
                    if (0 === a.length) return {
                        breadcrumbsContents: [],
                        breadcrumbNames: []
                    };
                    let {
                        key: r,
                        breadcrumbDetails: o
                    } = a[0], s = a.map(t => {
                        let {
                            breadcrumbDetails: a
                        } = t;
                        return e(a)
                    }), l = null == (n = o.getLinkPath) ? void 0 : n.call(o, C), d = (0, t.jsx)(p.Typography, {
                        color: "primary",
                        "aria-current": "page",
                        variant: h && i ? "h3" : void 0,
                        children: e(o)
                    }, r);
                    return l ? {
                        breadcrumbsContents: [(0, t.jsx)(f.default, {
                            href: l,
                            className: c,
                            children: d
                        }, r)],
                        breadcrumbNames: s
                    } : {
                        breadcrumbsContents: [d],
                        breadcrumbNames: s
                    }
                }
                let {
                    contents: r,
                    names: s
                } = a.reduce((n, r, s) => {
                    var l, c;
                    let {
                        key: d,
                        breadcrumbDetails: u
                    } = r;
                    if (!u) return n;
                    if (s === a.length - 1) {
                        let a = e(u);
                        if (!a) return n;
                        let r = u.parentItemTypeName ? en[u.parentItemTypeName] : null,
                            s = N[u.breadcrumbType];
                        if (u.withId && u.breadcrumbType === ee.default.AnalyticsCustomDashboards && null !== r && void 0 !== s) {
                            let e = r.displayName(T);
                            return {
                                contents: [...n.contents, A(e, el(o, null == (c = r.getLinkPath) ? void 0 : c.call(r, C))), A(s, x)],
                                names: [...n.names, e, s]
                            }
                        }
                        return {
                            contents: [...n.contents, (0, t.jsx)(p.Typography, {
                                color: "primary",
                                "aria-current": "page",
                                variant: h && i ? "h3" : void 0,
                                children: a
                            }, d)],
                            names: [...n.names, a]
                        }
                    }
                    if (u.withId) {
                        let e = u.parentItemTypeName ? en[u.parentItemTypeName] : null,
                            t = N[u.breadcrumbType];
                        return {
                            contents: n.contents.concat(w(u)),
                            names: [...n.names, ...e ? [e.displayName(T)] : [], ...t ? [t] : []]
                        }
                    }
                    let m = u.displayName(T);
                    return m ? {
                        contents: [...n.contents, A(m, null == (l = u.getLinkPath) ? void 0 : l.call(u, C))],
                        names: [...n.names, m]
                    } : n
                }, {
                    contents: [],
                    names: []
                });
                return {
                    breadcrumbsContents: r,
                    breadcrumbNames: s
                }
            }, [k, i, h, T, N, C, c, A, x, w, o]), M = (0, a.useMemo)(() => D[D.length - 1], [D]), L = (0, a.useMemo)(() => (0, n.buildBreadcrumb)(...D), [D]), j = E && (0, t.jsx)(n.HubMeta, {
                title: M,
                breadcrumb: L,
                seoTitle: E,
                ...H
            });
            return h ? (0, t.jsxs)(m.Grid, {
                className: i ? void 0 : y,
                children: [j, (0, t.jsx)(q, {
                    id: "navigation-breadcrumbs",
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: (i || R.length > 1) && R
                })]
            }) : g ? (0, t.jsxs)(m.Grid, {
                children: [j, (0, t.jsxs)(q, {
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: [(0, t.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: (0, t.jsx)(r.CurrentProductName, {})
                    }, "product-name"), R.slice(0, -1)]
                })]
            }) : (0, t.jsxs)(m.Grid, {
                className: "".concat(d, " ").concat(R.length > 1 && !i ? u : ""),
                children: [j, (0, t.jsx)(q, {
                    id: "navigation-breadcrumbs",
                    maxItems: 8,
                    "aria-label": "breadcrumb",
                    children: R.length > 1 && R
                }), " "]
            })
        }, [h.TranslationNamespace.Creations, h.TranslationNamespace.Features, h.TranslationNamespace.AssetTypes, h.TranslationNamespace.SendrNotificationPreferences, h.TranslationNamespace.Advanced, h.TranslationNamespace.OpenCloud, h.TranslationNamespace.Error, h.TranslationNamespace.DataCollectionSettings, h.TranslationNamespace.UnifiedNavigation, h.TranslationNamespace.Payouts, h.TranslationNamespace.Matchmaking, h.TranslationNamespace.Environments, h.TranslationNamespace.Navigation, h.TranslationNamespace.MarketplaceOnboarding, h.TranslationNamespace.PublicPublish, h.TranslationNamespace.ExperienceAlerts, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.DevEx, h.TranslationNamespace.Publishing]),
        ed = () => {
            let {
                currentItemType: e,
                isCurrentItemLoading: t,
                currentItemGroupId: n
            } = (0, er.default)(), {
                isLoading: i,
                setWorkspaceByGroupId: o
            } = (0, r.useWorkspaces)();
            return (0, a.useEffect)(() => {
                !e || t || i || o(null != n ? n : null)
            }, [n, e, t, i, o]), null
        },
        eu = "applayout-scroll-container",
        ep = (0, c.default)(() => Promise.resolve(b.default), {
            ssr: !1
        }),
        em = (0, i.withTranslation)(e => {
            var n;
            let {
                title: o,
                beta: s = !1,
                secondaryRail: l,
                pageBanner: c,
                useBreadcrumbs: h = !1,
                secondarySize: b = "small",
                omitPageTitle: f = !1,
                children: v
            } = e, {
                open: k,
                dialog: N
            } = (0, g.useStudio)(), {
                translate: C
            } = (0, i.useTranslation)(), T = (0, a.useCallback)(() => {
                k({
                    task: y.EStudioTaskType.Default
                })
            }, [k]), I = a.default.isValidElement(o) && o.type === i.Translate, P = "string" == typeof o ? (0, t.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: C(o)
            }) : I ? (0, t.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: o
            }) : null != o ? o : null;
            return (0, t.jsxs)(r.CreatorHubLayout, {
                children: [(0, t.jsx)(ed, {}), N, (0, t.jsx)(r.CreatorHubLayout.Rail, {
                    openStudio: T,
                    secondarySize: b,
                    children: l
                }), (0, t.jsx)(r.CreatorHubLayout.Header, {
                    children: h ? (0, t.jsx)(ec, {
                        inLayoutHeader: !0
                    }) : (0, t.jsxs)(m.Grid, {
                        container: !0,
                        alignItems: "center",
                        gap: "8px",
                        children: [P, s && (0, t.jsx)(p.Typography, {
                            children: (0, t.jsx)(u.Label, {
                                labelText: C("Label.Beta")
                            })
                        })]
                    })
                }), (0, t.jsx)(r.CreatorHubLayout.PageContent, {
                    id: eu,
                    banner: c,
                    additionalLinks: (0, t.jsx)(ep, {
                        inline: !0
                    }),
                    children: (0, t.jsxs)("div", {
                        className: "width-full height-full",
                        children: [h && (null != (n = !f && P) ? n : s) && (0, t.jsxs)("div", {
                            className: "flex items-center gap-small padding-bottom-large",
                            children: [!f && P, s && (0, t.jsx)(p.Typography, {
                                children: (0, t.jsx)(u.Label, {
                                    labelText: C("Label.Beta")
                                })
                            })]
                        }), v, (0, t.jsx)(d.CookieConsentBanner, {})]
                    })
                })]
            })
        }, [...r.REQUIRED_TRANSLATION_NAMESPACES, h.TranslationNamespace.RightsPortal, h.TranslationNamespace.DeveloperProducts, h.TranslationNamespace.Passes, h.TranslationNamespace.Creations, h.TranslationNamespace.PageTitles, h.TranslationNamespace.Features, h.TranslationNamespace.Privacy, h.TranslationNamespace.Error, h.TranslationNamespace.Analytics, h.TranslationNamespace.TalentHubV2, h.TranslationNamespace.Licenses, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.RevenueShareAgreements, h.TranslationNamespace.TaxDocumentation]);
    e.s(["SCROLL_CONTAINER_ID", 0, eu, "default", 0, em], 966501);
    let ey = {
        enabled: !0,
        isFetched: !0
    };
    e.s(["default", 0, e => {
        let {
            product: c,
            children: d,
            beta: u,
            title: p,
            secondarySize: m = "large",
            secondaryRail: y,
            pageBanner: g,
            omitPageTitle: h,
            analyticsAssistantChatHref: b,
            analyticsAssistantChatUniverseId: f,
            ...v
        } = e, {
            noBreadCrumbs: k,
            leftNavigationContents: N
        } = v, {
            settings: C
        } = (0, l.useSettings)(), {
            translate: T
        } = (0, i.useTranslation)(), I = "string" == typeof p ? T(p) : a.default.isValidElement(p) && p.type === i.Translate ? T(p.props.translationKey, p.props.args) : void 0;
        return (0, t.jsxs)(o.NoSSR, {
            children: [k && I && (0, t.jsx)(n.HubMeta, {
                title: I
            }), (0, t.jsx)(r.NavigationConfigsProvider, {
                currentProduct: null != c ? c : "CreatorDashboard",
                environment: (0, s.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: ey,
                enableGroupModeration: C.enableGroupModerationPage,
                analyticsAssistantChatHref: b,
                analyticsAssistantChatUniverseId: f,
                children: (0, t.jsx)(em, {
                    beta: u,
                    title: p,
                    secondaryRail: null != y ? y : N,
                    pageBanner: g,
                    useBreadcrumbs: !k,
                    secondarySize: m,
                    omitPageTitle: h,
                    children: d
                })
            })]
        })
    }], 177608)
}, 17829, e => {
    "use strict";
    var t, a = ((t = a || {}).User = "User", t.Group = "Group", t);
    e.s(["default", 0, a])
}, 627636, e => {
    "use strict";
    var t = e.i(17829);
    e.s(["CreatorType", () => t.default])
}, 450639, 626448, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(79187),
        r = e.i(751846),
        i = e.i(808377),
        o = e.i(940042),
        s = e.i(345886),
        l = e.i(381221),
        c = e.i(29013);
    e.s(["NotInterestedIcon", () => c.NotInterested], 626448);
    var c = c,
        d = e.i(589418),
        u = e.i(623983),
        p = e.i(697973);
    let m = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] && arguments[0];
        return (0, p.makeStyles)()(t => ({
            imageStatusContainer: {
                backgroundColor: e ? t.palette.surface.outline : t.palette.components.input.filled.enableFill,
                color: e ? t.palette.content.inverse : t.palette.content.muted,
                width: "100%",
                height: "100%"
            },
            statusTextContainer: {
                display: "block",
                textAlign: "center",
                whiteSpace: "nowrap",
                color: e ? t.palette.content.inverse : t.palette.content.muted
            },
            imageContainer: {
                width: "100%",
                height: 0,
                paddingTop: "100%",
                position: "relative",
                borderRadius: e ? 4 : 8,
                overflow: "hidden",
                backgroundColor: t.palette.components.input.filled.enableFill
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
                background: t.palette.surface[200],
                display: "flex"
            },
            skeleton: {
                height: "100%"
            }
        }))
    };
    e.s(["default", 0, e => {
        let {
            targetId: p,
            targetType: y,
            returnPolicy: g = r.ReturnPolicy.AutoGenerated,
            isStatusTextShown: h = !1,
            alt: b,
            fontColor: f = "light",
            bottomRightAdornment: v
        } = e, {
            classes: {
                imageStatusContainer: k,
                statusTextContainer: N,
                imageWrapper: C,
                imageContainer: T,
                image: I,
                bottomRightAdornmentContainer: P,
                skeleton: x
            }
        } = m("light" !== f)(), {
            translate: A
        } = (0, n.useTranslation)(), [w, S] = (0, a.useState)(!1), [E, H] = (0, a.useState)(), R = (0, a.useCallback)(async function(e, t, a) {
            let n = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (t && e) {
                S(!0);
                try {
                    let i = n ? r.ThumbnailClient.reloadThumbnailImage : r.ThumbnailClient.getThumbnailImage,
                        o = await i(e, t, a);
                    H(o)
                } catch (e) {
                    H({
                        state: i.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    S(!1)
                }
            }
        }, []), D = (0, a.useMemo)(() => {
            if (w) return (0, t.jsx)(d.Skeleton, {
                classes: {
                    root: x
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                a = null;
            switch (null == E ? void 0 : E.state) {
                case i.ThumbnailResponseState.InReview:
                    e = A("Label.InReview"), a = (0, t.jsx)(l.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Blocked:
                    e = A("Label.Moderated"), a = (0, t.jsx)(c.NotInterested, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Error:
                case i.ThumbnailResponseState.TemporarilyUnavailable:
                    e = A("Label.Unavailable"), a = (0, t.jsx)(o.BrokenImageOutlinedIcon, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                default:
                    return null
            }
            return (0, t.jsx)(s.Grid, {
                container: !0,
                classes: {
                    root: k
                },
                justifyContent: "center",
                alignItems: "center",
                children: h ? (0, t.jsxs)("div", {
                    children: [a, (0, t.jsx)(u.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: N
                        },
                        children: e
                    })]
                }) : a
            })
        }, [w, null == E ? void 0 : E.state, k, h, N, x, A, f]);
        return (0, a.useEffect)(() => {
            R(y, p, g)
        }, [p, y, g, R]), {
            thumbnailImage: (0, t.jsx)(s.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, t.jsxs)("div", {
                    className: T,
                    children: [(null == E ? void 0 : E.state) === i.ThumbnailResponseState.Completed ? (0, t.jsx)("img", {
                        className: I,
                        src: null == E ? void 0 : E.imageUrl,
                        alt: b
                    }) : (0, t.jsx)("div", {
                        className: C,
                        children: D
                    }), v ? (0, t.jsx)("div", {
                        className: P,
                        children: v
                    }) : null]
                })
            }),
            thumbnailData: E,
            refreshThumbnail: (0, a.useCallback)(async () => R(y, p, g, !0), [R, y, p, g])
        }
    }], 450639)
}, 894854, e => {
    "use strict";
    var t = e.i(893949);
    e.s(["useStudio", () => t.default])
}, 692587, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        return Object.entries(e).reduce((e, t) => {
            let [a, n] = t;
            return Array.isArray(n) ? e[a] = n.at(0) : e[a] = n, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 174528, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(260241),
        r = e.i(721281),
        i = e.i(984656),
        o = e.i(41466),
        s = e.i(157310),
        l = e.i(677753),
        c = function(e, t) {
            return (c = Object.setPrototypeOf || ({
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
                    l(n.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                var t;
                e.done ? r(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((n = n.apply(e, t || [])).next())
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
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var c = [s, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (i = 0)), i;) try {
                    if (a = 1, n && (r = 2 & c[0] ? n.return : c[0] ? n.throw || ((r = n.return) && r.call(n), 0) : n.next) && !(r = r.call(n, c[1])).done) return r;
                    switch (n = 0, r && (c = [2 & c[0], r.value]), c[0]) {
                        case 0:
                        case 1:
                            r = c;
                            break;
                        case 4:
                            return i.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            i.label++, n = c[1], c = [0];
                            continue;
                        case 7:
                            c = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(r = (r = i.trys).length > 0 && r[r.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === c[0] && (!r || c[1] > r[0] && c[1] < r[3])) {
                                i.label = c[1];
                                break
                            }
                            if (6 === c[0] && i.label < r[1]) {
                                i.label = r[1], r = c;
                                break
                            }
                            if (r && i.label < r[2]) {
                                i.label = r[2], i.ops.push(c);
                                break
                            }
                            r[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    c = t.call(e, i)
                } catch (e) {
                    c = [6, e], n = 0
                } finally {
                    a = r = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
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
    var m = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function a() {
                    this.constructor = e
                }
                c(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
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
                                return r = i.sent(), [2, new l.VoidApiResponse(r)]
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
                                return r = i.sent(), [2, new l.VoidApiResponse(r)]
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
                                return r = i.sent(), [2, new l.VoidApiResponse(r)]
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
                                return r = i.sent(), [2, new l.VoidApiResponse(r)]
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
                                return r = i.sent(), [2, new l.VoidApiResponse(r)]
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
                                return r = i.sent(), [2, new l.VoidApiResponse(r)]
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
                                return r = i.sent(), [2, new l.VoidApiResponse(r)]
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
        }(l.BaseAPI),
        y = e.i(897547);
    new m(new l.Configuration({
        robloxSiteDomain: "roblox.com",
        basePath: "".concat("https://apis.roblox.com", "/access-management"),
        credentials: "include",
        enableMrRouter: !0
    }));
    let g = new Map,
        h = async (e, t, a) => {
            let n, r, i = (n = "".concat(e, "/access-management"), (r = g.get(n)) || (r = new m(new l.Configuration({
                basePath: n,
                credentials: "include",
                enableMrRouter: !0
            })), g.set(n, r)), r);
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
        }, b = new Map, f = e => {
            let t = b.get(e);
            return t || (t = new y.UserSettingsApiApi(new l.Configuration({
                basePath: e,
                credentials: "include",
                enableMrRouter: !0
            })), b.set(e, t)), t
        }, v = async e => {
            let t = f(e);
            try {
                await t.userSettingsApiSetGlobalPrivacyControl()
            } catch (t) {
                let e = t instanceof Error ? t.message : "Unknown error";
                throw Error("Failed to set Global Privacy Control: ".concat(e), {
                    cause: t
                })
            }
        }, k = async e => {
            let t = f(e);
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
        }, N = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, C = async e => {
            var t, a;
            if (e && (null == (a = window.evidon) || null == (t = a.notice) ? void 0 : t.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class T {
        updateCookiePreferences(e) {
            this.currentCookiePreferences = {
                ...e
            }
        }
        hasCookiePreferencesChanged() {
            return Array.from(new Set([...Object.keys(this.currentCookiePreferences), ...Object.keys(this.initialCookiePreferences)])).some(e => this.currentCookiePreferences[e] !== this.initialCookiePreferences[e])
        }
        getGpcState() {
            let e = N(),
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
            e && (C(e).catch(e => {
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
            (0, r._)(this, "initialGpcState", void 0), (0, r._)(this, "evidonCleanup", null), (0, r._)(this, "initialCookiePreferences", void 0), (0, r._)(this, "currentCookiePreferences", void 0), this.initialGpcState = N(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var I = e.i(79187),
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
        R = "Body.GpcDetectedSettingDisabledIneligible",
        D = "Body.GpcDetectedSettingDisabledEligible",
        M = "Body.GpcDetectedSettingEnabledIneligible",
        L = "Body.GpcMissingSettingIneligible",
        j = (0, w.makeStyles)()(() => ({
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
        B = e => {
            var n, r;
            let {
                gpcState: s,
                modalData: l,
                translate: c,
                translateHTML: d,
                handleClose: u,
                privacyPreferencesUrl: p,
                modalLinkClass: m
            } = e, {
                user: y
            } = (0, S.useAuthentication)(), g = !!y, h = null != (n = null == l ? void 0 : l.isAdsSellShareDataEnabled) && n, b = null != (r = null == l ? void 0 : l.canUserManageAdsSettings) && r, f = (0, a.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = p)
            }, [p]), v = (0, a.useCallback)(e => (0, t.jsx)(P.Link, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: m,
                children: e
            }), [m]), k = (0, a.useCallback)(e => (0, t.jsx)(P.Link, {
                href: p,
                className: m,
                onClick: f,
                children: e
            }), [p, m, f]), N = (0, a.useMemo)(() => (0, t.jsx)("br", {}), []), C = (0, a.useCallback)((e, n) => {
                let r = (c(e, {
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
                                    children: [e, r < n.length - 1 && N]
                                }, i)
                            })
                        })
                    };
                return 3 === i.length ? (0, t.jsxs)(t.Fragment, {
                    children: [o(i[0]), n(i[1]), o(i[2])]
                }) : o(r)
            }, [c, N]);
            return (0, t.jsxs)(t.Fragment, {
                children: [(0, t.jsxs)(i.DialogBody, {
                    children: [(0, t.jsx)(i.DialogTitle, {
                        className: "text-heading-small",
                        children: s.isGpcDetected ? c(H) || "" : c("Title.NoGpcDetected") || ""
                    }), (0, t.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!g) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: v
                                    }],
                                    t = {
                                        lineBreak: N
                                    };
                                return s.isGpcDetected ? h ? d(M, e, t) : d(R, e, t) : d(L, e, t)
                            }
                            if (!s.isGpcDetected) return b ? C("Body.GpcMissingSettingEligible", k) : d(L, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: N
                            });
                            if (h) return b ? C("Body.GpcDetectedSettingEnabledEligible", k) : d(M, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: N
                            });
                            let e = b ? {
                                tags: [{
                                    opening: "aTagWithHref",
                                    closing: "aTagEnd",
                                    content: k
                                }],
                                args: {
                                    lineBreak: N
                                }
                            } : {
                                tags: [{
                                    opening: "aTagStart",
                                    closing: "aTagEnd",
                                    content: v
                                }],
                                args: {
                                    lineBreak: N
                                }
                            };
                            if ("signal-with-changes" === s.scenario) return b ? C(D, k) : d(R, e.tags, e.args);
                            let t = b ? D : R;
                            return b ? C(t, k) : d(t, e.tags, e.args)
                        })()
                    })]
                }), (0, t.jsx)(i.DialogFooter, {
                    className: "width-full",
                    children: (0, t.jsx)(o.Button, {
                        className: "width-full",
                        size: "Large",
                        variant: "Emphasis",
                        onClick: u,
                        children: c("Action.Ok") || ""
                    })
                })]
            })
        },
        G = e => {
            let {
                inline: r = !1
            } = e, {
                translate: o,
                translateHTML: l
            } = (0, I.useTranslation)(), c = (0, I.useLocalization)(), d = (0, n.useCookieConsentContext)().preferences, u = (0, a.useRef)(null), p = (0, a.useRef)(!1), [m, y] = (0, a.useState)(!1), {
                classes: {
                    container: g
                }
            } = E(), {
                classes: b
            } = j(), f = (0, a.useCallback)(() => {
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
            }, []), [N, C] = (0, a.useState)({
                isGpcDetected: !1,
                initialGpcState: !1,
                hasUserMadeCookieChanges: !1,
                scenario: "no-signal"
            });
            (0, a.useEffect)(() => () => {
                u.current && u.current.cleanup()
            }, []), (0, a.useEffect)(() => {
                if (m && !p.current) {
                    let e = f();
                    u.current = new T(Object.keys(e).length > 0 ? e : d), p.current = !0, C(u.current.getGpcState())
                }
            }, [m, d, f]), (0, a.useEffect)(() => {
                if (u.current) {
                    let e = f(),
                        t = Object.keys(e).length > 0 ? e : d;
                    u.current.updateCookiePreferences(t);
                    let a = u.current.getGpcState();
                    C(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                }
            }, [d, f]), (0, a.useEffect)(() => {
                if (!u.current) return;
                let e = setInterval(() => {
                    if (u.current) {
                        let e = f(),
                            t = Object.keys(e).length > 0 ? e : d;
                        u.current.updateCookiePreferences(t);
                        let a = u.current.getGpcState();
                        C(e => e.scenario !== a.scenario || e.isGpcDetected !== a.isGpcDetected || e.hasUserMadeCookieChanges !== a.hasUserMadeCookieChanges ? a : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [d, f]);
            let {
                user: P
            } = (0, S.useAuthentication)(), w = !!P, {
                data: R,
                isLoading: D
            } = (e => {
                let {
                    showModal: t,
                    gpcTrackerRef: a,
                    userSettingsApiBaseUrl: n,
                    apiGatewayBaseUrl: r,
                    isAuthenticated: i
                } = e;
                return (0, s.useQuery)({
                    queryKey: ["yourPrivacyChoicesModal", t],
                    queryFn: async () => {
                        var e, t, o;
                        let s = null != (e = null == i ? void 0 : i()) && e,
                            l = null != (t = null == (o = a.current) ? void 0 : o.getGpcState()) ? t : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: c
                            } = l;
                        s && c && await v(n);
                        let d = !1;
                        if (s) try {
                            let {
                                access: e
                            } = await h(r, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            d = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let u = !1;
                        if (s) try {
                            let e = await k(n);
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
                            isGpcDetected: c,
                            canUserManageAdsSettings: d,
                            isAdsSellShareDataEnabled: u,
                            scenario: l.scenario
                        }
                    },
                    enabled: t,
                    gcTime: 0
                })
            })({
                showModal: m,
                gpcTrackerRef: u,
                userSettingsApiBaseUrl: (0, a.useMemo)(() => "".concat("https://apis.roblox.com", "/user-settings-api"), []),
                apiGatewayBaseUrl: (0, a.useMemo)(() => "https://apis.roblox.com", []),
                isAuthenticated: () => w
            }), M = (0, a.useMemo)(() => c.locale ? (0, I.toRobloxLocale)(c.locale) : "en_us", [c.locale]), L = (0, a.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(M);
                return "https://www.roblox.com".concat(e)
            }, [M]), G = (0, a.useCallback)(e => {
                e.preventDefault(), y(!0)
            }, []), _ = (0, a.useCallback)(() => {
                y(!1)
            }, []), z = o("Label.YourPrivacyChoices") || "", U = (0, t.jsx)("button", {
                type: "button",
                onClick: G,
                style: {
                    display: "inline-flex",
                    alignItems: "center",
                    background: "none",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    color: "inherit"
                },
                children: (0, t.jsxs)(x.Typography, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [z, (0, t.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/eab36317100ca0af3d9d5d820b06e410bcfe345e/assets", "/navigation/privacy_icon.png"),
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
                children: [r ? U : (0, t.jsx)(A.Grid, {
                    classes: {
                        root: g
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: U
                }), (0, t.jsx)(i.Dialog, {
                    open: m,
                    onOpenChange: _,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: o("Action.Close"),
                    children: (0, t.jsx)(i.DialogContent, {
                        children: D ? (0, t.jsxs)(i.DialogBody, {
                            children: [(0, t.jsx)(i.DialogTitle, {
                                className: "text-heading-small",
                                children: o(H) || ""
                            }), (0, t.jsx)("div", {
                                className: "text-body-medium",
                                children: o("Description.Loading") || ""
                            })]
                        }) : (0, t.jsx)(B, {
                            gpcState: N,
                            modalData: R,
                            translate: o,
                            translateHTML: l,
                            handleClose: _,
                            privacyPreferencesUrl: L,
                            modalLinkClass: b.modalLink
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
            return (0, t.jsx)(G, {
                inline: a
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 729904, e => {
    "use strict";
    e.s(["default", 0, function() {
        return "production"
    }])
}, 114209, 559227, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(589624),
        r = e.i(773057),
        i = e.i(392782);
    let o = (0, a.createContext)({
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
        l = e.i(252842),
        c = e.i(533968);
    let d = new class {
        async getGameDetail(e, t) {
            var a, n, r;
            if (!t && this.gameDetailsMap.has(e)) return null != (a = this.gameDetailsMap.get(e)) ? a : null;
            try {
                let t = null != (n = null == (r = (await this.gamesClient.getDetails([e])).data) ? void 0 : r[0]) ? n : null;
                return t && this.gameDetailsMap.set(e, t), t
            } catch (a) {
                let t = (0, c.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === l.StatusCodes.BAD_REQUEST) return null;
                throw console.log("Could not fetch game details for universeId ".concat(e)), a
            }
        }
        async getConfiguration(e, t) {
            if (!t && this.gameConfigurationMap.has(e)) {
                var a;
                return null != (a = this.gameConfigurationMap.get(e)) ? a : null
            }
            try {
                return await this.developClient.getUniverseConfiguration(e), this.gameConfigurationMap.set(e, !0), !0
            } catch (a) {
                let t = (0, c.getResponseFromError)(a);
                if ((null == t ? void 0 : t.status) === l.StatusCodes.FORBIDDEN) return this.gameConfigurationMap.set(e, !1), !1;
                return console.warn("Could not fetch game details for universeId ".concat(e)), null
            }
        }
        constructor(e, t) {
            (0, s._)(this, "gamesClient", void 0), (0, s._)(this, "developClient", void 0), (0, s._)(this, "gameDetailsMap", void 0), (0, s._)(this, "gameConfigurationMap", void 0), this.gamesClient = e, this.developClient = t, this.gameDetailsMap = new Map, this.gameConfigurationMap = new Map
        }
    }(i.default, r.default);
    e.s(["default", 0, e => {
        let {
            requestedGameId: r,
            children: i
        } = e, s = (0, n.useRouter)(), [l, c] = (0, a.useState)(!0), [u, p] = (0, a.useState)(null), [m, y] = (0, a.useState)(null), [g, h] = (0, a.useState)(!1), b = (0, a.useRef)(0), f = (0, a.useCallback)(async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] && arguments[1],
                a = b.current += 1,
                n = d.getConfiguration(e),
                r = d.getGameDetail(e, t),
                [i, o] = await Promise.allSettled([n, r]);
            a === b.current && ("fulfilled" === i.status ? p(i.value) : p(null), "fulfilled" === o.status ? (h(!1), y(o.value)) : ("rejected" === o.status ? h(!0) : h(!1), y(null)), c(!1))
        }, []), v = (0, a.useMemo)(() => {
            let {
                id: e
            } = s.query;
            return r || ("string" == typeof e ? parseInt(e, 10) : void 0)
        }, [r, s.query]), k = (0, a.useCallback)(() => v ? f(v, !0) : Promise.reject(Error("Cannot refresh game details without a game ID")), [v, f]);
        (0, a.useEffect)(() => {
            try {
                if (void 0 !== v && !Number.isNaN(v) && v > 0) return void f(v);
                b.current += 1, p(null), y(null), h(!1), c(!1)
            } catch (e) {
                console.warn("Could not fetch game details for universeId ".concat(v))
            }
        }, [v, f]);
        let N = (0, a.useMemo)(() => ({
            isLoadingGame: l,
            canConfigure: u,
            gameDetails: m,
            isErrorLoadingGame: g,
            refreshGameDetails: k
        }), [l, u, m, g, k]);
        return (0, t.jsx)(o.Provider, {
            value: N,
            children: i
        })
    }, "useCurrentGame", 0, function() {
        let e = (0, a.useContext)(o);
        if (null === e) throw Error("useCurrentGame must be used within a GameProvider");
        return e
    }], 114209)
}, 808377, e => {
    "use strict";
    var t = e.i(620140);
    e.s(["ThumbnailResponseState", () => t.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 387660, e => {
    "use strict";
    var t = e.i(275666);
    e.s(["accordionSummaryClasses", () => t.a])
}, 49152, e => {
    "use strict";
    var t = e.i(299656);
    e.s(["buttonClasses", () => t.b])
}, 546995, e => {
    "use strict";
    var t = e.i(416340);
    e.i(690569);
    var a = e.i(221628),
        n = e.i(230505);
    e.i(734994), e.s(["N", 0, function(e) {
        let {
            children: r,
            defer: i = !1,
            fallback: o = null
        } = e, [s, l] = t.useState(!1);
        return (0, n.u)(() => {
            i || l(!0)
        }, [i]), t.useEffect(() => {
            i && l(!0)
        }, [i]), (0, a.jsx)(t.Fragment, {
            children: s ? r : o
        })
    }])
}, 844333, e => {
    "use strict";
    var t = e.i(546995);
    e.s(["NoSSR", () => t.N])
}, 610873, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340);

    function n(e) {
        return "small" === e ? 16 : 20
    }

    function r(e) {
        return "small" === e ? 18 : 24
    }
    var i = e.i(863605),
        o = e.i(154502),
        s = e.i(787802),
        l = e.i(690569),
        c = e.i(817717),
        d = e.i(945146),
        u = e.i(251635),
        p = e.i(51928),
        m = e.i(221628),
        y = e.i(121880);

    function g(e) {
        return (0, l.g)("MuiSwitch", e)
    }
    e.i(465957);
    var h = (0, s.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let b = ["className", "color", "edge", "size", "sx"],
        f = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.edge && t["edge".concat((0, l.a)(a.edge))], t["size".concat((0, l.a)(a.size))]]
            }
        })({
            display: "inline-flex",
            width: 58,
            height: 38,
            overflow: "hidden",
            padding: 12,
            boxSizing: "border-box",
            position: "relative",
            flexShrink: 0,
            zIndex: 0,
            verticalAlign: "middle",
            "@media print": {
                colorAdjust: "exact"
            },
            variants: [{
                props: {
                    edge: "start"
                },
                style: {
                    marginLeft: -8
                }
            }, {
                props: {
                    edge: "end"
                },
                style: {
                    marginRight: -8
                }
            }, {
                props: {
                    size: "small"
                },
                style: {
                    width: 40,
                    height: 24,
                    padding: 7,
                    ["& .".concat(h.thumb)]: {
                        width: 16,
                        height: 16
                    },
                    ["& .".concat(h.switchBase)]: {
                        padding: 4,
                        ["&.".concat(h.checked)]: {
                            transform: "translateX(16px)"
                        }
                    }
                }
            }]
        }),
        v = (0, u.s)(p.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.switchBase, {
                    ["& .".concat(h.input)]: t.input
                }, "default" !== a.color && t["color".concat((0, l.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t
            } = e;
            return {
                position: "absolute",
                top: 0,
                left: 0,
                zIndex: 1,
                color: t.vars ? t.vars.palette.Switch.defaultColor : "".concat("light" === t.palette.mode ? t.palette.common.white : t.palette.grey[300]),
                transition: t.transitions.create(["left", "transform"], {
                    duration: t.transitions.duration.shortest
                }),
                ["&.".concat(h.checked)]: {
                    transform: "translateX(20px)"
                },
                ["&.".concat(h.disabled)]: {
                    color: t.vars ? t.vars.palette.Switch.defaultDisabledColor : "".concat("light" === t.palette.mode ? t.palette.grey[100] : t.palette.grey[600])
                },
                ["&.".concat(h.checked, " + .").concat(h.track)]: {
                    opacity: .5
                },
                ["&.".concat(h.disabled, " + .").concat(h.track)]: {
                    opacity: t.vars ? t.vars.opacity.switchTrackDisabled : "" + ("light" === t.palette.mode ? .12 : .2)
                },
                ["& .".concat(h.input)]: {
                    left: "-100%",
                    width: "300%"
                }
            }
        }, e => {
            let {
                theme: t
            } = e;
            return {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette.action.activeChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, l.b)(t.palette.action.active, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                variants: [...Object.entries(t.palette).filter(e => {
                    let [, t] = e;
                    return t.main && t.light
                }).map(e => {
                    let [a] = e;
                    return {
                        props: {
                            color: a
                        },
                        style: {
                            ["&.".concat(h.checked)]: {
                                color: (t.vars || t).palette[a].main,
                                "&:hover": {
                                    backgroundColor: t.vars ? "rgba(".concat(t.vars.palette[a].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, l.b)(t.palette[a].main, t.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(h.disabled)]: {
                                    color: t.vars ? t.vars.palette.Switch["".concat(a, "DisabledColor")] : "".concat("light" === t.palette.mode ? (0, l.l)(t.palette[a].main, .62) : (0, l.j)(t.palette[a].main, .55))
                                }
                            },
                            ["&.".concat(h.checked, " + .").concat(h.track)]: {
                                backgroundColor: (t.vars || t).palette[a].main
                            }
                        }
                    }
                })]
            }
        }),
        k = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Track",
            overridesResolver: (e, t) => t.track
        })(e => {
            let {
                theme: t
            } = e;
            return {
                height: "100%",
                width: "100%",
                borderRadius: 7,
                zIndex: -1,
                transition: t.transitions.create(["opacity", "background-color"], {
                    duration: t.transitions.duration.shortest
                }),
                backgroundColor: t.vars ? t.vars.palette.common.onBackground : "".concat("light" === t.palette.mode ? t.palette.common.black : t.palette.common.white),
                opacity: t.vars ? t.vars.opacity.switchTrack : "" + ("light" === t.palette.mode ? .38 : .3)
            }
        }),
        N = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Thumb",
            overridesResolver: (e, t) => t.thumb
        })(e => {
            let {
                theme: t
            } = e;
            return {
                boxShadow: (t.vars || t).shadows[1],
                backgroundColor: "currentColor",
                width: 20,
                height: 20,
                borderRadius: "50%"
            }
        }),
        C = a.forwardRef(function(e, t) {
            let a = (0, y.u)({
                    props: e,
                    name: "MuiSwitch"
                }),
                {
                    className: n,
                    color: r = "primary",
                    edge: i = !1,
                    size: o = "medium",
                    sx: s
                } = a,
                c = (0, l._)(a, b),
                p = (0, d._)({}, a, {
                    color: r,
                    edge: i,
                    size: o
                }),
                h = (e => {
                    let {
                        classes: t,
                        edge: a,
                        size: n,
                        color: r,
                        checked: i,
                        disabled: o
                    } = e, s = {
                        root: ["root", a && "edge".concat((0, l.a)(a)), "size".concat((0, l.a)(n))],
                        switchBase: ["switchBase", "color".concat((0, l.a)(r)), i && "checked", o && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, c = (0, u.a)(s, g, t);
                    return (0, d._)({}, t, c)
                })(p),
                C = (0, m.jsx)(N, {
                    className: h.thumb,
                    ownerState: p
                });
            return (0, m.jsxs)(f, {
                className: (0, u.c)(h.root, n),
                sx: s,
                ownerState: p,
                children: [(0, m.jsx)(v, (0, d._)({
                    type: "checkbox",
                    icon: C,
                    checkedIcon: C,
                    ref: t,
                    ownerState: p
                }, c, {
                    classes: (0, d._)({}, h, {
                        root: h.switchBase
                    })
                })), (0, m.jsx)(k, {
                    className: h.track,
                    ownerState: p
                })]
            })
        });
    var T = (0, i.default)({
            name: "Switch"
        })(function(e, t, a) {
            var i, o, s, l, d = t.size;
            return {
                root: ((i = {})["&:has(> .".concat(h.colorPrimary, ".").concat(h.disabled, ".").concat(h.checked, ")")] = {
                    opacity: .5
                }, i["&:has(> .".concat(h.colorSecondary, ".").concat(h.disabled, ")")] = {
                    opacity: .5
                }, i),
                switchBase: ((o = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(h.checked, " + .").concat(h.track, ".").concat(a.track)] = {
                    opacity: .38
                }, o["&.".concat(h.disabled, " + .").concat(h.track, ".").concat(a.track)] = {
                    opacity: .38
                }, o),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: n(d),
                    height: n(d),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (n(d) - r(d)) / 2,
                    left: (n(d) - r(d)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((s = {})["& .".concat(h.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, s["& .".concat(h.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, s["&.".concat(h.checked, " .").concat(h.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, s["&.".concat(h.checked, " .").concat(h.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, s["&.".concat(h.checked, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, s["&.".concat(h.disabled, " .").concat(h.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, s["&.".concat(h.disabled, " .").concat(h.track)] = {
                    background: e.palette.components.switch.slideFill
                }, s["&.".concat(h.disabled, ".").concat(h.checked, " .").concat(h.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, s["&.".concat(h.disabled, ".").concat(h.checked, " .").concat(h.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, s["&.".concat(h.disabled, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, s),
                colorSecondary: ((l = {})["& .".concat(h.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, l["& .".concat(h.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, l)
            }
        }),
        I = (0, a.forwardRef)(function(e, i) {
            var s, l = e.classes,
                d = e.color,
                u = e.loading,
                p = e.size,
                m = e.checkedIcon,
                y = e.icon,
                g = e["aria-label"],
                b = e.inputProps,
                f = e.className,
                v = (0, t.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                k = T((0, t._)((0, t._)({}, v), {
                    loading: u,
                    size: p,
                    checkedIcon: m,
                    icon: y,
                    "aria-label": g
                }), {
                    props: {
                        classes: (0, o.default)(l, f)
                    }
                }).classes,
                N = k.thumb,
                I = k.progress,
                P = (0, t.a)(k, ["thumb", "progress"]),
                x = a.default.createElement("div", {
                    className: "".concat(h.thumb, " ").concat(N)
                }, u && a.default.createElement(c.C, {
                    thickness: ((s = r(p)) - n(p)) * 44 / (2 * s),
                    size: r(p),
                    classes: {
                        root: I
                    }
                }));
            return a.default.createElement(C, (0, t._)({}, v, {
                checkedIcon: null != m ? m : x,
                classes: P,
                color: void 0 === d ? "primary" : d,
                icon: null != y ? y : x,
                ref: i,
                size: p,
                inputProps: (0, t._)((0, t._)({}, b), {
                    "aria-label": g
                })
            }))
        });
    e.s(["Switch", 0, I], 610873)
}, 940042, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["BrokenImageOutlinedIcon", () => t.BrokenImageOutlined])
}, 381221, e => {
    "use strict";
    var t = e.i(29013);
    e.s(["HourglassEmptyIcon", () => t.HourglassEmpty])
}, 87660, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return n
        }
    });
    let n = e.r(2879)._(e.r(416340)).default.createContext(null)
}, 777553, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    }), Object.defineProperty(a, "default", {
        enumerable: !0,
        get: function() {
            return p
        }
    });
    let n = e.r(2879)._(e.r(416340)),
        r = e.r(87660),
        i = [],
        o = [],
        s = !1;

    function l(e) {
        let t = e(),
            a = {
                loading: !0,
                loaded: null,
                error: null
            };
        return a.promise = t.then(e => (a.loading = !1, a.loaded = e, e)).catch(e => {
            throw a.loading = !1, a.error = e, e
        }), a
    }
    class c {
        promise() {
            return this._res.promise
        }
        retry() {
            this._clearTimeouts(), this._res = this._loadFn(this._opts.loader), this._state = {
                pastDelay: !1,
                timedOut: !1
            };
            let {
                _res: e,
                _opts: t
            } = this;
            e.loading && ("number" == typeof t.delay && (0 === t.delay ? this._state.pastDelay = !0 : this._delay = setTimeout(() => {
                this._update({
                    pastDelay: !0
                })
            }, t.delay)), "number" == typeof t.timeout && (this._timeout = setTimeout(() => {
                this._update({
                    timedOut: !0
                })
            }, t.timeout))), this._res.promise.then(() => {
                this._update({}), this._clearTimeouts()
            }).catch(e => {
                this._update({}), this._clearTimeouts()
            }), this._update({})
        }
        _update(e) {
            this._state = {
                ...this._state,
                error: this._res.error,
                loaded: this._res.loaded,
                loading: this._res.loading,
                ...e
            }, this._callbacks.forEach(e => e())
        }
        _clearTimeouts() {
            clearTimeout(this._delay), clearTimeout(this._timeout)
        }
        getCurrentValue() {
            return this._state
        }
        subscribe(e) {
            return this._callbacks.add(e), () => {
                this._callbacks.delete(e)
            }
        }
        constructor(e, t) {
            this._loadFn = e, this._opts = t, this._callbacks = new Set, this._delay = null, this._timeout = null, this.retry()
        }
    }

    function d(t) {
        return function(t, a) {
            let l = Object.assign({
                    loader: null,
                    loading: null,
                    delay: 200,
                    timeout: null,
                    webpack: null,
                    modules: null
                }, a),
                d = null;

            function u() {
                if (!d) {
                    let e = new c(t, l);
                    d = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return d.promise()
            }
            if ("u" < typeof window && i.push(u), !s && "u" > typeof window) {
                let t = l.webpack && "function" == typeof e.t.resolveWeak ? l.webpack() : l.modules;
                t && o.push(e => {
                    for (let a of t)
                        if (e.includes(a)) return u()
                })
            }

            function p(e, t) {
                let a;
                u(), (a = n.default.useContext(r.LoadableContext)) && Array.isArray(l.modules) && l.modules.forEach(e => {
                    a(e)
                });
                let i = n.default.useSyncExternalStore(d.subscribe, d.getCurrentValue, d.getCurrentValue);
                return n.default.useImperativeHandle(t, () => ({
                    retry: d.retry
                }), []), n.default.useMemo(() => {
                    var t;
                    return i.loading || i.error ? n.default.createElement(l.loading, {
                        isLoading: i.loading,
                        pastDelay: i.pastDelay,
                        timedOut: i.timedOut,
                        error: i.error,
                        retry: d.retry
                    }) : i.loaded ? n.default.createElement((t = i.loaded) && t.default ? t.default : t, e) : null
                }, [e, i])
            }
            return p.preload = () => u(), p.displayName = "LoadableComponent", n.default.forwardRef(p)
        }(l, t)
    }

    function u(e, t) {
        let a = [];
        for (; e.length;) {
            let n = e.pop();
            a.push(n(t))
        }
        return Promise.all(a).then(() => {
            if (e.length) return u(e, t)
        })
    }
    d.preloadAll = () => new Promise((e, t) => {
        u(i).then(e, t)
    }), d.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(t => {
            let a = () => (s = !0, t());
            u(o, e).then(a, a)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = d.preloadReady);
    let p = d
}, 201897, (e, t, a) => {
    "use strict";
    Object.defineProperty(a, "__esModule", {
        value: !0
    });
    var n = {
        default: function() {
            return u
        },
        noSSR: function() {
            return d
        }
    };
    for (var r in n) Object.defineProperty(a, r, {
        enumerable: !0,
        get: n[r]
    });
    let i = e.r(2879),
        o = e.r(221628);
    e.r(416340);
    let s = i._(e.r(777553)),
        l = "u" < typeof window;

    function c(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function d(e, t) {
        if (delete t.webpack, delete t.modules, !l) return e(t);
        let a = t.loading;
        return () => (0, o.jsx)(a, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function u(e, t) {
        let a = s.default,
            n = {
                loading: e => {
                    let {
                        error: t,
                        isLoading: a,
                        pastDelay: n
                    } = e;
                    return null
                }
            };
        e instanceof Promise ? n.loader = () => e : "function" == typeof e ? n.loader = e : "object" == typeof e && (n = {
            ...n,
            ...e
        });
        let r = (n = {
            ...n,
            ...t
        }).loader;
        return (n.loadableGenerated && (n = {
            ...n,
            ...n.loadableGenerated
        }, delete n.loadableGenerated), "boolean" != typeof n.ssr || n.ssr) ? a({
            ...n,
            loader: () => null != r ? r().then(c) : Promise.resolve(c(() => null))
        }) : (delete n.webpack, delete n.modules, d(a, n))
    }("function" == typeof a.default || "object" == typeof a.default && null !== a.default) && void 0 === a.default.__esModule && (Object.defineProperty(a.default, "__esModule", {
        value: !0
    }), Object.assign(a.default, a), t.exports = a.default)
}, 507742, (e, t, a) => {
    t.exports = e.r(201897)
}, 260241, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(416340),
        n = e.i(697973),
        r = e.i(532045),
        i = e.i(83265),
        o = e.i(686762),
        s = e.i(16397),
        l = e.i(345886),
        c = e.i(623983),
        d = e.i(748893),
        u = e.i(387660),
        p = e.i(145842),
        m = e.i(943402),
        y = e.i(40262),
        g = e.i(49152),
        h = e.i(11473),
        b = e.i(610873),
        f = e.i(378645),
        f = f,
        v = e.i(226519),
        k = e.i(102725),
        N = e.i(668539),
        C = e.i(976457),
        T = e.i(252842);
    let I = "https://www.roblox.com/info/privacy",
        P = "{privacyPolicyLink}",
        x = "{googleAnalyticsLink}",
        A = [{
            label: "Label.DataCollected",
            content: "Description.DataCollected"
        }, {
            label: "Label.DataSharing",
            content: "Description.DataSharing"
        }, {
            label: "Label.DataRetention",
            content: "Description.DataRetention"
        }, {
            label: "Label.DataUse",
            content: "Description.DataUse"
        }, {
            label: "Label.DataStorage",
            content: "Description.Undisclosed"
        }];
    var w, S, E = ((w = E || {}).BannerTitle = "Heading.CookieBanner", w.CookieBannerContent = "Description.CookieBannerContent", w.CookieBannerButton = "Action.CookieBanner", w.PrivacyPolicy = "Description.PrivacyPolicy", w.ConsentToolModalTitle = "Heading.CookieSettings", w.SaveBtn = "Action.SavePreferences", w.CancelBtn = "Action.Cancel", w.InfoCollectionHeader = "Heading.InformationCollection", w.InfoCollectionContent = "Description.InformationCollection", w.InfoCollectionHeader2 = "Heading.InformationCollection2", w.InfoCollectionContent2 = "Description.InformationCollection2", w.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", w.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", w.RBXViralAcquisition = "RBXViralAcquisition", w.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", w.RBXSource = "RBXSource", w.RBXSourceDescription = "Description.RBXSource", w.GoogleAnalytics = "Heading.GoogleAnalytics", w.OwnedBy = "Label.OwnedBy", w.GoogleInc = "Google Inc.", w.Website = "Label.Website", w.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", w.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", w.CompanyCollectionHeader = "Heading.CompanyCollection", w.DataCollected = "Label.DataCollected", w.DataCollectedContent = "Description.DataCollected", w.DataSharing = "Label.DataSharing", w.DataSharingContent = "Description.DataSharing", w.DataRetention = "Label.DataRetention", w.DataRetentionContent = "Description.DataRetention", w.DataUse = "Label.DataUse", w.DataUseContent = "Description.DataUse", w.DataStorage = "Label.DataStorage", w.DataStorageContent = "Description.Undisclosed", w.RequestData = "Action.RequestData", w.SetCookieOptions = "Action.SetCookieOptions", w.DeclineAll = "Action.DeclineAll", w.AcceptAll = "Action.AcceptAll", w.EssentialCookie = "Heading.EssentialCookies", w.AnalyticsCookie = "Heading.AnalyticsCookies", w.GAReadMore = "Description.GAReadMore", w.GAReadMoreUrl = "{googleAnalyticsLink}", w);
    let H = (0, n.makeStyles)()(e => ({
            root: {
                padding: 24,
                maxWidth: 1250,
                margin: "0 auto"
            },
            content: {
                marginBottom: 16
            },
            actions: {
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    alignItems: "flex-start"
                }
            },
            buttons: {
                display: "flex",
                gap: 12,
                [e.breakpoints.down("Medium")]: {
                    flexDirection: "column",
                    width: "100%"
                }
            },
            backdrop: {
                backgroundColor: "transparent"
            }
        })),
        R = e => {
            let {
                onAcceptAll: n,
                onDeclineAll: u,
                onLearnMore: p,
                isOpen: m
            } = e, {
                translate: y
            } = (0, t.useTranslation)(), {
                classes: g
            } = H(), h = (0, i.useMediaQuery)((0, r.useTheme)().breakpoints.down("Medium")), b = (0, a.useMemo)(() => a.default.createElement(o.Link, {
                href: I,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, y(E.PrivacyPolicy)), [y]), f = (0, a.useMemo)(() => {
                let e = y(E.CookieBannerContent);
                if (!e.includes(P)) return e;
                let t = e.split(P);
                return a.default.createElement(a.default.Fragment, null, t[0], b, t[1] || "")
            }, [y, b]);
            return a.default.createElement(s.Drawer, {
                open: m,
                onClose: u,
                anchor: "bottom",
                variant: "temporary",
                ModalProps: {
                    BackdropProps: {
                        classes: {
                            root: g.backdrop
                        }
                    }
                }
            }, a.default.createElement(l.Grid, {
                className: g.root
            }, a.default.createElement(l.Grid, {
                className: g.content
            }, a.default.createElement(c.Typography, {
                variant: "body2"
            }, f)), a.default.createElement(l.Grid, {
                className: g.actions
            }, a.default.createElement(d.Button, {
                variant: "text",
                onClick: p,
                color: "secondary"
            }, y(E.SetCookieOptions)), a.default.createElement(l.Grid, {
                className: g.buttons
            }, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: u,
                fullWidth: h
            }, y(E.DeclineAll)), a.default.createElement(d.Button, {
                color: "secondary",
                variant: "contained",
                onClick: n,
                fullWidth: h
            }, y(E.AcceptAll))))))
        },
        D = "RBXcb",
        M = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        L = (0, a.createContext)(null),
        j = () => {
            let e = (0, a.useContext)(L);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        B = e => {
            let t, a = Object.entries(e).map(e => {
                let [t, a] = e;
                return "".concat(t, "=").concat(a)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [t, a] = e;
                a || (0, T.deleteCookie)(t)
            });
            let n = new Date;
            n.setDate(n.getDate() + 180), document.cookie = "".concat(D, "=").concat(a, "; expires=").concat(n.toUTCString(), "; path=/; domain=").concat((t = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(t.slice(1).join(".")))
        },
        G = e => {
            let {
                cookieName: t,
                description: n
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "codeDense"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, n))
        },
        _ = (0, n.makeStyles)()(() => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            }
        })),
        z = () => {
            var e;
            let {
                translate: n
            } = (0, t.useTranslation)(), {
                cookiePolicy: r
            } = j(), {
                classes: i
            } = _();
            return r && (null == (e = r.EssentialCookieList) ? void 0 : e.length) ? a.default.createElement(p.Accordion, {
                className: i.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: i.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, n(E.EssentialCookie))), a.default.createElement(y.AccordionDetails, null, r.EssentialCookieList.map(e => a.default.createElement(G, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: n(e.description)
            })))) : null
        };
    var U = ((S = {}).RBXViralAcquisition = "RBXViralAcquisition", S.RBXSource = "RBXSource", S.GoogleAnalytics = "GoogleAnalytics", S);
    let O = e => {
            let {
                title: t,
                content: n,
                secondary: r = !1
            } = e;
            return a.default.createElement("div", null, a.default.createElement(c.Typography, {
                variant: "body2",
                color: r ? "secondary" : "primary"
            }, t), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, n))
        },
        F = () => {
            let {
                translate: e
            } = (0, t.useTranslation)(), n = e(E.GAReadMore);
            if (!n.includes(x)) return a.default.createElement(a.default.Fragment, null, n);
            let [r, i] = n.split(x);
            return a.default.createElement(c.Typography, {
                variant: "body2"
            }, r, a.default.createElement(o.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(E.GoogleAnalytics)), i)
        },
        K = (0, n.makeStyles)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(g.buttonClasses.root)]: {
                    backgroundColor: "transparent",
                    "&:hover": {
                        backgroundColor: "transparent"
                    },
                    "&:focus": {
                        backgroundColor: "transparent"
                    },
                    "&:active": {
                        backgroundColor: "transparent"
                    }
                }
            }
        })),
        q = e => {
            let {
                href: t,
                text: n
            } = e, {
                classes: r
            } = K();
            return a.default.createElement("div", null, a.default.createElement(d.Button, {
                className: r.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: t,
                rel: "noreferrer",
                endIcon: a.default.createElement(h.OpenInNewIcon, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, n))
        },
        V = e => {
            let {
                isAnalyticsCookieAccepted: n,
                setIsAnalyticsCookieAccepted: r
            } = e, {
                classes: i
            } = _(), {
                translate: o
            } = (0, t.useTranslation)();
            return a.default.createElement(p.Accordion, {
                className: i.accordion
            }, a.default.createElement(m.AccordionSummary, {
                className: i.accordionSummary
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, o(E.AnalyticsCookie)), a.default.createElement(b.Switch, {
                checked: n,
                onChange: (e, t) => {
                    r(t)
                },
                "aria-label": o(E.AnalyticsCookie),
                size: "small"
            })), a.default.createElement(y.AccordionDetails, null, a.default.createElement(G, {
                key: U.RBXViralAcquisition,
                cookieName: U.RBXViralAcquisition,
                description: o(E.RBXViralAcquisitionDescription)
            }), a.default.createElement(G, {
                key: U.RBXSource,
                cookieName: U.RBXSource,
                description: o(E.RBXSourceDescription)
            }), a.default.createElement(q, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: o(E.GoogleAnalytics)
            }), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0
            }, o(E.OwnedBy), " ", "Google Inc."), a.default.createElement(O, {
                title: o(E.GoogleAnalyticsPurposeHeader),
                content: o(E.GoogleAnalyticsPurposeDescription)
            }), a.default.createElement(c.Typography, {
                variant: "body2"
            }, o(E.CompanyCollectionHeader)), A.map(e => a.default.createElement(O, {
                key: e.label,
                title: o(e.label),
                content: o(e.content),
                secondary: !0
            })), a.default.createElement(F, null)))
        },
        X = (0, n.makeStyles)()(e => ({
            accordionSummary: {
                display: "flex",
                alignItems: "center",
                gap: "12px",
                ["& .".concat(u.accordionSummaryClasses.content)]: {
                    margin: 0,
                    "&.Mui-expanded": {
                        margin: 0
                    }
                },
                "&.Mui-expanded": {
                    minHeight: "48px"
                }
            },
            accordion: {
                "&::before": {
                    height: 0
                },
                "&.Mui-expanded": {
                    margin: 0
                }
            },
            paragraph: {
                marginBottom: "12px"
            },
            dialogContent: {
                ["&.".concat(f.d.root)]: {
                    paddingTop: "12px"
                },
                scrollbarColor: "grey transparent",
                scrollbarWidth: "thin",
                "&::-webkit-scrollbar": {
                    width: 6
                },
                "&::-webkit-scrollbar-thumb": {
                    background: "grey",
                    borderRadius: "10rem"
                },
                "&::-webkit-scrollbar-track": {
                    background: "transparent"
                }
            },
            accordionSection: {
                marginTop: "12px"
            },
            accordionContainer: {
                border: "1px solid ".concat(e.palette.components.divider),
                "&:first-of-type": {
                    borderTopLeftRadius: "12px",
                    borderTopRightRadius: "12px"
                },
                "&:last-of-type": {
                    borderTop: "none",
                    borderBottomLeftRadius: "12px",
                    borderBottomRightRadius: "12px"
                },
                "&:first-of-type:last-of-type": {
                    borderTop: "1px solid ".concat(e.palette.components.divider)
                }
            }
        })),
        W = e => {
            var n;
            let {
                open: r,
                onClose: i,
                onSave: o,
                isAnalyticsCookieAccepted: s,
                setIsAnalyticsCookieAccepted: l
            } = e, {
                translate: u
            } = (0, t.useTranslation)(), {
                classes: p
            } = X(), {
                cookiePolicy: m
            } = j();
            return m ? a.default.createElement(v.Dialog, {
                open: r,
                onClose: i
            }, a.default.createElement(k.DialogTitle, null, u(E.ConsentToolModalTitle)), a.default.createElement(N.DialogContent, {
                className: p.dialogContent
            }, a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(E.InfoCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(E.InfoCollectionContent)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(E.InfoCollectionHeader2)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(E.InfoCollectionContent2)), a.default.createElement(c.Typography, {
                variant: "h6"
            }, u(E.InfoPartnerCollectionHeader)), a.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(E.InfoPartnerCollectionContent)), a.default.createElement(q, {
                href: "https://www.roblox.com/support",
                text: u(E.RequestData)
            }), a.default.createElement(q, {
                href: I,
                text: u(E.PrivacyPolicy)
            }), a.default.createElement("div", {
                className: p.accordionSection
            }, (null == (n = m.EssentialCookieList) ? void 0 : n.length) > 0 && a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(z, null)), a.default.createElement("div", {
                className: p.accordionContainer
            }, a.default.createElement(V, {
                isAnalyticsCookieAccepted: s,
                setIsAnalyticsCookieAccepted: l
            })))), a.default.createElement(C.DialogActions, null, a.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: i
            }, u(E.CancelBtn)), a.default.createElement(d.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: o
            }, u(E.SaveBtn)))) : null
        },
        J = e => {
            let {
                isOpen: t,
                onClose: n,
                onSave: r
            } = e, {
                cookiePolicy: i,
                acceptAll: o,
                declineAll: s,
                hasAcceptedAnalyticsCookie: l
            } = j(), [c, d] = (0, a.useState)(l), u = (0, a.useCallback)(() => {
                c ? o() : s(), r()
            }, [o, s, c, r]);
            return i ? a.default.createElement(W, {
                open: t,
                onClose: n,
                isAnalyticsCookieAccepted: c,
                setIsAnalyticsCookieAccepted: d,
                onSave: u
            }) : null
        },
        Q = (0, t.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: t,
                shouldShowBanner: n
            } = j(), [r, i] = (0, a.useState)(!1), [o, s] = (0, a.useState)(!1);
            (0, a.useEffect)(() => {
                n && s(!0)
            }, [n]);
            let l = (0, a.useCallback)(() => {
                    e(), s(!1)
                }, [e]),
                c = (0, a.useCallback)(() => {
                    t(), s(!1)
                }, [t]),
                d = (0, a.useCallback)(() => {
                    i(!0), s(!1)
                }, []),
                u = (0, a.useCallback)(() => {
                    i(!1), s(!0)
                }, []),
                p = (0, a.useCallback)(() => {
                    i(!1), s(!1)
                }, []);
            return a.default.createElement(a.default.Fragment, null, a.default.createElement(R, {
                isOpen: o,
                onAcceptAll: l,
                onDeclineAll: c,
                onLearnMore: d
            }), a.default.createElement(J, {
                isOpen: r,
                onClose: u,
                onSave: p
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["CookieConsentBanner", 0, Q, "CookieConsentProvider", 0, e => {
        let {
            children: t,
            robloxSiteDomain: n,
            initialCookiePolicy: r,
            initialPreferences: i,
            forceShowBanner: o = !1
        } = e, [s, l] = (0, a.useState)(r || null), [c, d] = (0, a.useState)(i || (() => {
            if ("u" < typeof document) return M;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(D, "=")));
            return e ? e.substring(D.length + 1).split("&").reduce((e, t) => {
                let [a, n] = t.split("=");
                return e[a] = "true" === n, e
            }, {}) : M
        })()), [u, p] = (0, a.useState)(!r), [m, y] = (0, a.useState)(null), g = (0, a.useMemo)(() => !!o || !!(null == s ? void 0 : s.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(D, "=")))), [null == s ? void 0 : s.ShouldDisplayCookieBannerV3, o]);
        (0, a.useEffect)(() => {
            r || (async () => {
                try {
                    var e, t, a;
                    let r = await fetch("https://apis.".concat(n, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!r.ok) throw Error("Failed to fetch cookie policy");
                    let i = await r.json();
                    l({
                        ShouldDisplayCookieBannerV3: null != (e = i.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (t = i.NonEssentialCookieList) ? t : [],
                        EssentialCookieList: null != (a = i.EssentialCookieList) ? a : []
                    }), p(!1)
                } catch (e) {
                    y(e instanceof Error ? e : Error("Unknown error")), p(!1)
                }
            })()
        }, [n, r]);
        let h = (0, a.useCallback)((e, t) => {
                d(a => {
                    let n = {
                        ...a,
                        [e]: t
                    };
                    return B(n), n
                })
            }, []),
            b = (0, a.useCallback)(() => {
                if (!s) return;
                let e = s.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !0
                }), M);
                B(e), d(e)
            }, [s]),
            f = (0, a.useCallback)(() => {
                if (!s) return;
                let e = s.NonEssentialCookieList.reduce((e, t) => ({
                    ...e,
                    [t]: !1
                }), M);
                B(e), d(e)
            }, [s]),
            v = (0, a.useMemo)(() => Object.values(c).some(e => !0 === e), [c]),
            k = (0, a.useMemo)(() => ({
                cookiePolicy: s,
                preferences: c,
                updatePreference: h,
                acceptAll: b,
                declineAll: f,
                isLoading: u,
                error: m,
                hasAcceptedAnalyticsCookie: v,
                shouldShowBanner: g
            }), [s, c, u, m, b, f, h, v, g]);
        return a.default.createElement(L.Provider, {
            value: k
        }, t)
    }, "useCookieConsentContext", 0, j], 260241)
}]);

//# debugId=d78ed437-bc3b-d02f-5a6b-02fb21b666bd
//# sourceMappingURL=1df-js5algjxq.js.map