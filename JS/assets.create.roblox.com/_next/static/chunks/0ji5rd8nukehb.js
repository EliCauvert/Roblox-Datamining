;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "87937e3c-c151-9039-75b3-a43548dc7f6f")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 177608, 232474, 634877, 966501, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        r = e.i(37819),
        n = e.i(602635),
        i = e.i(79187),
        o = e.i(634463),
        l = e.i(729904),
        s = e.i(486736),
        c = e.i(109182),
        d = e.i(260241),
        u = e.i(610657),
        p = e.i(199834),
        m = e.i(169722),
        y = e.i(581577),
        b = e.i(894854),
        g = e.i(881670),
        h = e.i(174528),
        f = e.i(780481),
        k = e.i(237401),
        v = e.i(865800),
        C = e.i(614515),
        T = e.i(993807),
        N = e.i(962560),
        x = e.i(273589);
    e.i(84723);
    var I = e.i(42569),
        S = e.i(751498),
        A = e.i(232625),
        P = e.i(696180),
        w = e.i(972455),
        E = e.i(963320),
        H = e.i(715843);
    e.i(26724);
    var D = (0, S.c)((0, a.jsx)("path", {
        d: "M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"
    }), "MoreHoriz");
    let L = ["slots", "slotProps"],
        R = (0, I.s)(A.B, {
            name: "MuiBreadcrumbCollapsed"
        })(e => {
            let {
                theme: a
            } = e;
            return (0, N._)({
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
                "&:hover, &:focus": (0, N._)({}, "light" === a.palette.mode ? {
                    backgroundColor: a.palette.grey[200]
                } : {
                    backgroundColor: a.palette.grey[600]
                }),
                "&:active": (0, N._)({
                    boxShadow: a.shadows[0]
                }, "light" === a.palette.mode ? {
                    backgroundColor: (0, x.n)(a.palette.grey[200], .12)
                } : {
                    backgroundColor: (0, x.n)(a.palette.grey[600], .12)
                })
            })
        }),
        B = (0, I.s)(D)({
            width: 24,
            height: 16
        });

    function M(e) {
        let {
            slots: t = {},
            slotProps: r = {}
        } = e, n = (0, x._)(e, L);
        return (0, a.jsx)("li", {
            children: (0, a.jsx)(R, (0, N._)({
                focusRipple: !0
            }, n, {
                ownerState: e,
                children: (0, a.jsx)(B, (0, N._)({
                    as: t.CollapsedIcon,
                    ownerState: e
                }, r.collapsedIcon))
            }))
        })
    }

    function _(e) {
        return (0, x.g)("MuiBreadcrumbs", e)
    }
    var j = (0, P.g)("MuiBreadcrumbs", ["root", "ol", "li", "separator"]);
    let z = ["children", "className", "component", "slots", "slotProps", "expandText", "itemsAfterCollapse", "itemsBeforeCollapse", "maxItems", "separator"],
        O = (0, I.s)(w.T, {
            name: "MuiBreadcrumbs",
            slot: "Root",
            overridesResolver: (e, a) => [{
                ["& .".concat(j.li)]: a.li
            }, a.root]
        })({}),
        G = (0, I.s)("ol", {
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
        U = (0, I.s)("li", {
            name: "MuiBreadcrumbs",
            slot: "Separator",
            overridesResolver: (e, a) => a.separator
        })({
            display: "flex",
            userSelect: "none",
            marginLeft: 8,
            marginRight: 8
        }),
        V = t.forwardRef(function(e, r) {
            var n, i;
            let o = (0, E.u)({
                    props: e,
                    name: "MuiBreadcrumbs"
                }),
                {
                    children: l,
                    className: s,
                    component: c = "nav",
                    slots: d = {},
                    slotProps: u = {},
                    expandText: p = "Show path",
                    itemsAfterCollapse: m = 1,
                    itemsBeforeCollapse: y = 1,
                    maxItems: b = 8,
                    separator: g = "/"
                } = o,
                h = (0, x._)(o, z),
                [f, k] = t.useState(!1),
                v = (0, N._)({}, o, {
                    component: c,
                    expanded: f,
                    expandText: p,
                    itemsAfterCollapse: m,
                    itemsBeforeCollapse: y,
                    maxItems: b,
                    separator: g
                }),
                C = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, I.a)({
                        root: ["root"],
                        li: ["li"],
                        ol: ["ol"],
                        separator: ["separator"]
                    }, _, a)
                })(v),
                T = (0, H.u)({
                    elementType: d.CollapsedIcon,
                    externalSlotProps: u.collapsedIcon,
                    ownerState: v
                }),
                S = t.useRef(null),
                A = t.Children.toArray(l).filter(e => t.isValidElement(e)).map((e, t) => (0, a.jsx)("li", {
                    className: C.li,
                    children: e
                }, "child-".concat(t)));
            return (0, a.jsx)(O, (0, N._)({
                ref: r,
                component: c,
                color: "text.secondary",
                className: (0, I.c)(C.root, s),
                ownerState: v
            }, h, {
                children: (0, a.jsx)(G, {
                    className: C.ol,
                    ref: S,
                    ownerState: v,
                    children: (n = f || b && A.length <= b || y + m >= A.length ? A : [...A.slice(0, y), (0, a.jsx)(M, {
                        "aria-label": p,
                        slots: {
                            CollapsedIcon: d.CollapsedIcon
                        },
                        slotProps: {
                            collapsedIcon: T
                        },
                        onClick: () => {
                            k(!0);
                            let e = S.current.querySelector("a[href],button,[tabindex]");
                            e && e.focus()
                        }
                    }, "ellipsis"), ...A.slice(A.length - m, A.length)], i = C.separator, n.reduce((e, t, r) => (r < n.length - 1 ? e = e.concat(t, (0, a.jsx)(U, {
                        "aria-hidden": !0,
                        className: i,
                        ownerState: v,
                        children: g
                    }, "separator-".concat(r))) : e.push(t), e), []))
                })
            }))
        });
    var F = (0, C.default)({
            name: "Breadcrumbs"
        })(function(e) {
            return {
                root: (0, v._)((0, v._)({}, e.typography.body1), {
                    color: e.palette.content.muted
                })
            }
        }),
        X = (0, t.forwardRef)(function(e, a) {
            var r = e.classes,
                n = e.className,
                i = (0, v.a)(e, ["classes", "className"]),
                o = F(void 0, {
                    props: {
                        classes: (0, T.default)(r, n)
                    }
                });
            return t.default.createElement(V, (0, v._)({
                classes: o.classes
            }, i, {
                ref: a
            }))
        });
    e.s(["Breadcrumbs", 0, X], 232474);
    var q = e.i(982234),
        W = e.i(620068),
        K = e.i(114209),
        Q = e.i(97782),
        J = e.i(475360),
        Y = e.i(759283),
        Z = e.i(829425),
        $ = e.i(726474),
        ee = e.i(128106);
    let ea = (e, a) => e.args && e.args.value ? a(e.key, {
            [e.args.param]: a(e.args.value)
        }) : a(e.key),
        et = e => {
            var a;
            let t = parseInt(null != (a = e.developerItemId) ? a : "", 10);
            return Number.isNaN(t) ? $.dashboard.configureCreatorStoreItemBasePath : $.dashboard.getConfigureCreatorStoreItemUrl(t)
        },
        er = {
            analytics: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Analytics"
                    }, a)
                },
                breadcrumbType: ee.default.Catalog
            },
            creations: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: ee.default.Creations,
                getLinkPath: e => (null == e ? void 0 : e.groupId) ? "/dashboard/creations?groupId=".concat(null == e ? void 0 : e.groupId) : "/dashboard/creations"
            },
            experiences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Games"
                    }, a)
                },
                breadcrumbType: ee.default.Games,
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/overview")
            },
            collaborators: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Tab.Collaborators"
                    }, a)
                },
                breadcrumbType: ee.default.Collaborators,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/collaborators")
            },
            badges: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Badges"
                    }, a)
                },
                breadcrumbType: ee.default.Badge,
                parentItemTypeName: "associated-items",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/badges/").concat(e.badgeId, "/overview")
            },
            "referral-reward-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ReferralRewards"
                    }, a)
                },
                breadcrumbType: ee.default.ReferralRewards,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/referral-reward-details"),
                parentItemTypeName: "referral-reward-details",
                withId: !0
            },
            bundle: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: ee.default.Bundle,
                getLinkPath: e => "/dashboard/creations/bundle/".concat(e.bundleId, "/configure"),
                withId: !0
            },
            "experience-subscriptions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Subscriptions"
                    }, a)
                },
                breadcrumbType: ee.default.ExperienceSubscription,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "associated-items": {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t ? ea({
                        key: Y.itemFullNameKeys[t]
                    }, a) : ea({
                        key: "Heading.AssociatedItems"
                    }, a)
                },
                breadcrumbType: ee.default.AssociatedItems,
                getLinkPath: e => (null == e ? void 0 : e.associatedItemType) === J.Item.DeveloperProduct ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/developer-products") : (null == e ? void 0 : e.associatedItemType) === J.Item.ExperienceSubscription ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/subscriptions") : (null == e ? void 0 : e.associatedItemType) === J.Item.GamePass ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/passes") : (null == e ? void 0 : e.associatedItemType) ? "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items?activeTab=").concat(e.associatedItemType) : "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            catalog: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: ee.default.Catalog,
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/configure"),
                withId: !0
            },
            store: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: ee.default.CreatorStore,
                getLinkPath: et,
                withId: !0
            },
            "version-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.VersionHistory"
                    }, a)
                },
                breadcrumbType: ee.default.CreatorStore,
                getLinkPath: et,
                withId: !1
            },
            dependencies: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Dependencies"
                    }, a)
                },
                breadcrumbType: ee.default.CreatorStore,
                getLinkPath: et,
                withId: !1
            },
            localization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Localization"
                    }, a)
                },
                breadcrumbType: ee.default.Localization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/localization")
            },
            "activity-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: ee.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            activityFeed: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: ee.default.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            notifications: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Notifications"
                    }, a)
                },
                breadcrumbType: ee.default.Notifications,
                getLinkPath: e => e.baseId ? "/dashboard/creations/experiences/".concat(e.baseId, "/notifications") : "/settings/notifications"
            },
            update: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Notifications.UpdateContent"
                    }, a)
                },
                breadcrumbType: ee.default.Notifications
            },
            "social-links": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.SocialLinks"
                    }, a)
                },
                breadcrumbType: ee.default.SocialLinks,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/social-links")
            },
            updates: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Updates"
                    }, a)
                },
                breadcrumbType: ee.default.Updates,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/updates")
            },
            translation: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Translation"
                    }, a)
                },
                breadcrumbType: ee.default.Translation,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            overview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Overview"
                    }, a)
                },
                breadcrumbType: ee.default.Overview
            },
            passes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.GamePass"
                    }, a)
                },
                breadcrumbType: ee.default.GamePass,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "developer-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.DeveloperProduct"
                    }, a)
                },
                breadcrumbType: ee.default.DeveloperProduct,
                withId: !0,
                parentItemTypeName: "associated-items"
            },
            "external-purchase-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ExternalPurchaseSettings"
                    }, a)
                },
                breadcrumbType: ee.default.ExternalPurchaseSettings
            },
            "avatar-items": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Label.ThirdPartyAvatarItemCommissions"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsMonetization
            },
            "avatar-creation-tokens": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.AvatarCreationTokens"
                    }, a)
                },
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationAvatarCreationTokensUrl(Number(e.baseId)),
                breadcrumbType: ee.default.AnalyticsMonetization
            },
            subscriptions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Label.Subscriptions"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsMonetization
            },
            commerce: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Commerce"
                    }, a)
                },
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationCommerceUrl(Number(e.baseId)),
                breadcrumbType: ee.default.Commerce
            },
            "create-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.CreateProduct"
                    }, a)
                },
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationCommerceCreateProductUrl(Number(e.baseId)),
                breadcrumbType: ee.default.CreateProducts
            },
            eligibility: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Eligibility"
                    }, a)
                },
                getLinkPath: () => "/settings/eligibility",
                breadcrumbType: ee.default.Eligibility
            },
            "priced-assets": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PricedAssets"
                    }, a)
                },
                breadcrumbType: ee.default.PricedAssets
            },
            "audio-distribution": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.AudioDistribution"
                    }, a)
                },
                breadcrumbType: ee.default.AudioDistribution
            },
            "paid-access": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PaidAccess"
                    }, a)
                },
                breadcrumbType: ee.default.PaidAccess
            },
            "extended-services": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ExtendedServices"
                    }, a)
                },
                breadcrumbType: ee.default.ExtendedServices
            },
            "public-publish": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PublicPublish"
                    }, a)
                },
                breadcrumbType: ee.default.PublicPublish
            },
            "publishing-permissions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PublishingPermissions"
                    }, a)
                },
                breadcrumbType: ee.default.PublishingPermissions
            },
            "us-o18-devex-rate": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.DevExO18UsSettingsNav"
                    }, a)
                },
                breadcrumbType: ee.default.UsO18DevexRate
            },
            "contribution-report": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ContributionReports"
                    }, a)
                },
                breadcrumbType: ee.default.ContributionReport
            },
            acquisition: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Acquisition"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsAcquisition
            },
            engagement: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Engagement"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsEngagement
            },
            retention: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Retention"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsRetention
            },
            monetization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Monetization"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsMonetization,
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationOverviewUrl(Number(e.baseId))
            },
            performance: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsPerformanceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsPerformance
            },
            crashes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsCrashesNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsCrashes
            },
            audience: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsAudienceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsAudience
            },
            economy: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsRecommendedEventsEconomyNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsEconomy
            },
            funnels: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsRecommendedEventsFunnelsNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsFunnels
            },
            journeys: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsRecommendedEventsJourneyNavigationItem.title.key
                    }, a)
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
                        translate: a
                    } = e;
                    return ea({
                        key: "Action.Edit"
                    }, a)
                },
                breadcrumbType: ee.default.Create
            },
            preview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Action.CustomDashboards.Preview"
                    }, a)
                },
                breadcrumbType: ee.default.Create
            },
            errors: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsErrorReportNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsErrorReport
            },
            "memory-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsMemoryStoresNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsMemoryStores
            },
            "data-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsDataStoresNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsDataStores
            },
            leaderboard: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Leaderboard"
                    }, a)
                },
                breadcrumbType: ee.default.Leaderboard
            },
            "http-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsHttpServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsHttpServicce
            },
            "messaging-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsMessagingServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsMessagingService
            },
            "speech-to-text": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsSpeechToTextNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsSpeechToText
            },
            "text-to-speech": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsTextToSpeechNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsTextToSpeech
            },
            "video-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsVideoServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsVideoService
            },
            "generative-ai": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsGenerativeAINavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsGenerativeAI
            },
            custom: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsCustomEventsNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticCustomEvents
            },
            explore: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsExploreNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsExploreMode
            },
            dashboards: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsCustomDashboardsManageNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsCustomDashboards,
                parentItemTypeName: "dashboards",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/dashboards")
            },
            "managed-pricing": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ManagedPricing"
                    }, a)
                },
                breadcrumbType: ee.default.ManagedPricing,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/managed-pricing")
            },
            shop: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PersonalizedShop"
                    }, a)
                },
                breadcrumbType: ee.default.PersonalizedShop,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/shop")
            },
            "hard-coded-prices": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.HardCodedPrices"
                    }, a)
                },
                breadcrumbType: ee.default.HardCodedPrices,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/hard-coded-prices")
            },
            "price-optimization": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PriceOptimization"
                    }, a)
                },
                breadcrumbType: ee.default.PriceOptimization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/price-optimization")
            },
            "price-check": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.DynamicPriceCheck"
                    }, a)
                },
                breadcrumbType: ee.default.PriceCheck
            },
            "immersive-ads": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Ads"
                    }, a)
                },
                breadcrumbType: ee.default.ImmersiveAds,
                getLinkPath: e => Z.creatorHub.dashboard.getMonetizationImmersiveAdsUrl(Number(e.baseId))
            },
            "create-placement": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.AdsCreatePlacement"
                    }, a)
                },
                breadcrumbType: ee.default.ImmersiveAdsCreatePlacement
            },
            "creator-rewards": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.CreatorRewards"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/creator-rewards")
            },
            "roblox-plus": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.RobloxPlusDeveloperProgram"
                    }, a)
                },
                breadcrumbType: ee.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/roblox-plus")
            },
            "experience-questionnaire": {
                displayName: e => {
                    let {
                        translate: a,
                        enableQuestionnaireV2: t
                    } = e, r = "Heading.ExperienceQuestionnaire";
                    return t && (r = "Heading.ContentRatings"), ea({
                        key: r
                    }, a)
                },
                breadcrumbType: ee.default.Questionnaire
            },
            guidelines: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Guidelines"
                    }, a)
                },
                breadcrumbType: ee.default.Questionnaire
            },
            configure: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t === J.Item.CatalogAsset || t === J.Item.LibraryAsset || t === J.Item.Bundle || t === J.Item.Event || t === J.Item.AvatarCreationToken || t === J.Item.Environment || t === J.Item.Look ? ea({
                        key: "Heading.Configure"
                    }, a) : t === J.Item.Game ? ea({
                        key: "Heading.ContentSettings"
                    }, a) : t === J.Item.ExperienceSubscription ? ea({
                        key: "Heading.UpdateSubscription"
                    }, a) : t === J.Item.Alert ? ea({
                        key: "Heading.ConfigureAlert"
                    }, a) : ea({
                        key: "Heading.BasicSettings"
                    }, a)
                },
                breadcrumbType: ee.default.Configure
            },
            "communication-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.CommunicationSettings"
                    }, a)
                },
                breadcrumbType: ee.default.CommunicationSettings,
                getLinkPath: e => "/creations/experiences/".concat(e.baseId, "/communication-settings")
            },
            sales: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Sales"
                    }, a)
                },
                breadcrumbType: ee.default.Sales
            },
            promotions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Promotions"
                    }, a)
                },
                breadcrumbType: ee.default.Promotions
            },
            create: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: t
                    } = e;
                    return t ? ea({
                        key: "Heading.Create",
                        args: {
                            param: "itemType",
                            value: Y.itemTypeToSingularNameKeys[t]
                        }
                    }, a) : ea({
                        key: "Heading.Create"
                    }, a)
                },
                breadcrumbType: ee.default.Create
            },
            places: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Places"
                    }, a)
                },
                breadcrumbType: ee.default.Places,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/places"),
                parentItemTypeName: "places",
                withId: !0
            },
            environments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Environments"
                    }, a)
                },
                breadcrumbType: ee.default.Environments,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/environments"),
                parentItemTypeName: "environments",
                withId: !0
            },
            new_environment: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Action.CreateEnvironment"
                    }, a)
                },
                breadcrumbType: ee.default.Environments,
                parentItemTypeName: "environments"
            },
            manage: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Manage"
                    }, a)
                },
                breadcrumbType: ee.default.Manage
            },
            icon: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Icon"
                    }, a)
                },
                breadcrumbType: ee.default.Icon
            },
            events: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Events"
                    }, a)
                },
                breadcrumbType: ee.default.Event,
                withId: !0,
                parentItemTypeName: "events",
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/events")
            },
            "select-eligibility": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Title.SelectEligibility"
                    }, a)
                },
                breadcrumbType: ee.default.SelectEligibility
            },
            thumbnails: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PlaceThumbnails"
                    }, a)
                },
                breadcrumbType: ee.default.Thumbnails
            },
            videos: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PlaceVideos"
                    }, a)
                },
                breadcrumbType: ee.default.Videos
            },
            access: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.AccessSettings"
                    }, a)
                },
                breadcrumbType: ee.default.Access
            },
            secrets: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Secrets"
                    }, a)
                },
                breadcrumbType: ee.default.Secrets
            },
            matchmaking: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.CustomMatchmaking"
                    }, a)
                },
                breadcrumbType: ee.default.CustomMatchmaking,
                getLinkPath: e => $.dashboard.getCustomMatchmakingDashboardUrl(Number(e.baseId))
            },
            "server-management": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ServerManagement"
                    }, a)
                },
                breadcrumbType: ee.default.ServerManagement,
                getLinkPath: e => $.dashboard.getServerManagementUrl(Number(e.baseId))
            },
            "client-sessions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ClientSessions"
                    }, a)
                },
                breadcrumbType: ee.default.ClientSessions,
                getLinkPath: e => $.dashboard.getClientSessionsUrl(Number(e.baseId))
            },
            "[sessionId]": {
                displayName: () => "",
                breadcrumbType: ee.default.ClientSession,
                withId: !0
            },
            "create-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.CreateConfiguration"
                    }, a)
                },
                breadcrumbType: ee.default.CreateMatchmakingConfiguration
            },
            "edit-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.EditConfiguration"
                    }, a)
                },
                breadcrumbType: ee.default.EditMatchmakingConfiguration
            },
            "create-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.CreateAttribute"
                    }, a)
                },
                breadcrumbType: ee.default.CreateMatchmakingAttribute,
                getLinkPath: e => $.dashboard.getCustomMatchmakingAttributeCreationUrl(Number(e.baseId))
            },
            "edit-player-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.EditPlayerAttribute"
                    }, a)
                },
                breadcrumbType: ee.default.EditMatchmakingPlayerAttribute
            },
            "edit-server-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.EditServerAttribute"
                    }, a)
                },
                breadcrumbType: ee.default.EditMatchmakingServerAttribute
            },
            settings: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Settings"
                    }, a)
                },
                breadcrumbType: ee.default.Settings
            },
            permissions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Permissions"
                    }, a)
                },
                breadcrumbType: ee.default.Permissions
            },
            webhooks: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Webhooks"
                    }, a)
                },
                breadcrumbType: ee.default.Webhooks
            },
            "data-collection": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.DataSharing"
                    }, a)
                },
                breadcrumbType: ee.default.DataSharing
            },
            "[notificationCategory]": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Notifications"
                    }, a)
                },
                withId: !0,
                breadcrumbType: ee.default.Category
            },
            preferences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Preferences"
                    }, a)
                },
                breadcrumbType: ee.default.Preferences
            },
            advanced: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Header.Title"
                    }, a)
                },
                breadcrumbType: ee.default.Advanced
            },
            bans: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Bans"
                    }, a)
                },
                breadcrumbType: ee.default.Bans,
                getLinkPath: e => Z.creatorHub.dashboard.getUserBansUrl(Number(e.baseId))
            },
            add: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.AddUsersToBan"
                    }, a)
                },
                breadcrumbType: ee.default.Add
            },
            reorder: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Reorder"
                    }, a)
                },
                breadcrumbType: ee.default.Reorder
            },
            feedback: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Feedback"
                    }, a)
                },
                breadcrumbType: ee.default.Feedback
            },
            "api-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.APISettings"
                    }, a)
                },
                breadcrumbType: ee.default.ApiSettings
            },
            configs: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Configs"
                    }, a)
                },
                breadcrumbType: ee.default.Configs,
                getLinkPath: e => Z.creatorHub.dashboard.getAnalyticsConfigsUrl(Number(e.baseId))
            },
            experiments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Experiments"
                    }, a)
                },
                breadcrumbType: ee.default.Experiments,
                getLinkPath: e => Z.creatorHub.dashboard.getExperimentsUrl(Number(e.baseId))
            },
            "experiment-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ExperimentCreate"
                    }, a)
                },
                breadcrumbType: ee.default.ExperimentCreate
            },
            "experiment-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ExperimentDetails"
                    }, a)
                },
                breadcrumbType: ee.default.ExperimentDetails,
                withId: !0
            },
            alerts: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Alerts"
                    }, a)
                },
                breadcrumbType: ee.default.Alerts,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/alerts"),
                parentItemTypeName: "alerts",
                withId: !0
            },
            history: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ConfigsHistory"
                    }, a)
                },
                breadcrumbType: ee.default.ConfigsHistory
            },
            "config-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.ConfigCreate"
                    }, a)
                },
                breadcrumbType: ee.default.ConfigCreate
            },
            variants: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Variants"
                    }, a)
                },
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/variants"),
                breadcrumbType: ee.default.Catalog
            },
            look: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: ee.default.Look,
                getLinkPath: e => "/dashboard/creations/look/".concat(e.lookId, "/configure"),
                withId: !0
            },
            "audience-reach": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.AudienceReach"
                    }, a)
                },
                breadcrumbType: ee.default.AudienceReach,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/audience-reach")
            },
            "player-support": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return ea({
                        key: "Heading.PlayerSupport"
                    }, a)
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
                        translate: a
                    } = e;
                    return ea({
                        key: Q.analyticsRecommendationServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: ee.default.RecommendationService
            }
        };
    var en = e.i(509049);
    let ei = (0, t.createContext)({
        insideTopNavigationDrawer: !1
    });

    function eo() {
        return (0, t.useContext)(ei)
    }
    ei.displayName = "TopNavigationSidebarDrawerContext", e.s(["default", 0, eo], 634877);
    let el = (0, e.i(706442).makeStyles)()(e => ({
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
        es = (e, a) => a && e.replaceAll(/\[[^\]]*?\]/g, "") === (null == a ? void 0 : a.replaceAll(/\d+/g, "")) ? void 0 : a,
        ec = (0, i.withTranslation)(e => {
            let {
                inLayoutHeader: i = !1
            } = e, {
                pathname: o,
                query: l
            } = (0, k.useRouter)(), {
                classes: {
                    linkStyle: s,
                    compactBreadCrumbLinkStyle: c,
                    breadcrumb: d,
                    breadcrumbBottomSpace: u,
                    compactBreadCrumb: y
                }
            } = el(), {
                insideTopNavigationDrawer: b
            } = eo(), g = (0, W.useMediaQuery)(e => e.breakpoints.down("Medium")), {
                gameDetails: h
            } = (0, K.useCurrentGame)(), v = (0, t.useMemo)(() => {
                let e = o.includes("/analytics/dashboards/");
                return o.split("/").filter(e => !!e).filter(a => "analytics" !== a || !e)
            }, [o]), {
                itemNameMapping: C,
                pathLinkParams: T,
                displayNameParam: N
            } = (0, en.default)(), x = "string" == typeof l.dashboardId ? l.dashboardId : void 0, I = "string" == typeof l.id ? l.id : void 0, S = o.endsWith("/analytics/dashboards/[dashboardId]/edit") && I && x ? "/dashboard/creations/experiences/".concat(I, "/analytics/dashboards/").concat(x) : void 0, A = (0, t.useCallback)((e, t) => b ? t ? (0, a.jsx)(f.default, {
                href: t,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(q.Link, {
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
                children: (0, a.jsx)(q.Link, {
                    classes: {
                        root: s
                    },
                    children: e
                })
            }, e) : (0, a.jsx)(p.Typography, {
                color: "secondary",
                children: e
            }, e), [b, s]), P = (0, t.useCallback)(e => {
                var a, t;
                let r = e.parentItemTypeName ? er[e.parentItemTypeName] : null,
                    n = C[e.breadcrumbType],
                    i = e.breadcrumbType === ee.default.AnalyticsCustomDashboards && S ? S : void 0,
                    l = null != i ? i : null == (a = e.getLinkPath) ? void 0 : a.call(e, T),
                    s = void 0 !== i || null === r || e.breadcrumbType !== r.breadcrumbType;
                return [r ? A(r.displayName(N), es(o, null == (t = r.getLinkPath) ? void 0 : t.call(r, T))) : null, n ? A(n, s ? es(o, l) : void 0) : null]
            }, [C, T, A, N, o, S]), w = (0, t.useMemo)(() => {
                let e;
                return e = [], v.filter(e => er[e]).forEach(a => {
                    let t = er[a],
                        r = t.displayName(N);
                    if (r && e.push(r), t.withId) {
                        let a = C[t.breadcrumbType];
                        a && e.push(a)
                    }
                }), e
            }, [v, N, C]), E = (0, t.useMemo)(() => (function(e) {
                if (e.length < 2) return;
                let a = e[e.length - 1],
                    t = e[e.length - 2];
                if (a && t) return "".concat(t, " / ").concat(a)
            })(w), [w]), H = (0, t.useMemo)(() => {
                var e, a;
                return o.includes("/experiences/") ? {
                    description: null == h ? void 0 : h.name,
                    author: null == h || null == (e = h.creator) ? void 0 : e.name,
                    entityName: null == h ? void 0 : h.name,
                    entityId: null == h || null == (a = h.id) ? void 0 : a.toString(),
                    type: "experience"
                } : {}
            }, [o, h]), {
                breadcrumbsContents: D,
                breadcrumbNames: L
            } = (0, t.useMemo)(() => {
                let e = e => {
                        if (e.withId) {
                            var a;
                            return null != (a = C[e.breadcrumbType]) ? a : e.displayName(N)
                        }
                        return e.displayName(N)
                    },
                    t = v.map(e => ({
                        key: e,
                        breadcrumbDetails: er[e]
                    })).filter(e => e.breadcrumbDetails);
                if (i && g) {
                    var r;
                    if (0 === t.length) return {
                        breadcrumbsContents: [],
                        breadcrumbNames: []
                    };
                    let {
                        key: n,
                        breadcrumbDetails: o
                    } = t[0], l = t.map(a => {
                        let {
                            breadcrumbDetails: t
                        } = a;
                        return e(t)
                    }), s = null == (r = o.getLinkPath) ? void 0 : r.call(o, T), d = (0, a.jsx)(p.Typography, {
                        color: "primary",
                        "aria-current": "page",
                        variant: g && i ? "h3" : void 0,
                        children: e(o)
                    }, n);
                    return s ? {
                        breadcrumbsContents: [(0, a.jsx)(f.default, {
                            href: s,
                            className: c,
                            children: d
                        }, n)],
                        breadcrumbNames: l
                    } : {
                        breadcrumbsContents: [d],
                        breadcrumbNames: l
                    }
                }
                let {
                    contents: n,
                    names: l
                } = t.reduce((r, n, l) => {
                    var s, c;
                    let {
                        key: d,
                        breadcrumbDetails: u
                    } = n;
                    if (!u) return r;
                    if (l === t.length - 1) {
                        let t = e(u);
                        if (!t) return r;
                        let n = u.parentItemTypeName ? er[u.parentItemTypeName] : null,
                            l = C[u.breadcrumbType];
                        if (u.withId && u.breadcrumbType === ee.default.AnalyticsCustomDashboards && null !== n && void 0 !== l) {
                            let e = n.displayName(N);
                            return {
                                contents: [...r.contents, A(e, es(o, null == (c = n.getLinkPath) ? void 0 : c.call(n, T))), A(l, S)],
                                names: [...r.names, e, l]
                            }
                        }
                        return {
                            contents: [...r.contents, (0, a.jsx)(p.Typography, {
                                color: "primary",
                                "aria-current": "page",
                                variant: g && i ? "h3" : void 0,
                                children: t
                            }, d)],
                            names: [...r.names, t]
                        }
                    }
                    if (u.withId) {
                        let e = u.parentItemTypeName ? er[u.parentItemTypeName] : null,
                            a = C[u.breadcrumbType];
                        return {
                            contents: r.contents.concat(P(u)),
                            names: [...r.names, ...e ? [e.displayName(N)] : [], ...a ? [a] : []]
                        }
                    }
                    let m = u.displayName(N);
                    return m ? {
                        contents: [...r.contents, A(m, null == (s = u.getLinkPath) ? void 0 : s.call(u, T))],
                        names: [...r.names, m]
                    } : r
                }, {
                    contents: [],
                    names: []
                });
                return {
                    breadcrumbsContents: n,
                    breadcrumbNames: l
                }
            }, [v, i, g, N, C, T, c, A, S, P, o]), R = (0, t.useMemo)(() => L[L.length - 1], [L]), B = (0, t.useMemo)(() => (0, r.buildBreadcrumb)(...L), [L]), M = E && (0, a.jsx)(r.HubMeta, {
                title: R,
                breadcrumb: B,
                seoTitle: E,
                ...H
            });
            return g ? (0, a.jsxs)(m.Grid, {
                className: i ? void 0 : y,
                children: [M, (0, a.jsx)(X, {
                    id: "navigation-breadcrumbs",
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: (i || D.length > 1) && D
                })]
            }) : b ? (0, a.jsxs)(m.Grid, {
                children: [M, (0, a.jsxs)(X, {
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: [(0, a.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: (0, a.jsx)(n.CurrentProductName, {})
                    }, "product-name"), D.slice(0, -1)]
                })]
            }) : (0, a.jsxs)(m.Grid, {
                className: "".concat(d, " ").concat(D.length > 1 && !i ? u : ""),
                children: [M, (0, a.jsx)(X, {
                    id: "navigation-breadcrumbs",
                    maxItems: 8,
                    "aria-label": "breadcrumb",
                    children: D.length > 1 && D
                }), " "]
            })
        }, [g.TranslationNamespace.Creations, g.TranslationNamespace.Features, g.TranslationNamespace.AssetTypes, g.TranslationNamespace.SendrNotificationPreferences, g.TranslationNamespace.Advanced, g.TranslationNamespace.OpenCloud, g.TranslationNamespace.Error, g.TranslationNamespace.DataCollectionSettings, g.TranslationNamespace.UnifiedNavigation, g.TranslationNamespace.Payouts, g.TranslationNamespace.Matchmaking, g.TranslationNamespace.Environments, g.TranslationNamespace.Navigation, g.TranslationNamespace.MarketplaceOnboarding, g.TranslationNamespace.PublicPublish, g.TranslationNamespace.ExperienceAlerts, g.TranslationNamespace.PlayerFeedback, g.TranslationNamespace.DevEx]),
        ed = () => {
            let {
                currentItemType: e,
                isCurrentItemLoading: a,
                currentItemGroupId: r
            } = (0, en.default)(), {
                isLoading: i,
                setWorkspaceByGroupId: o
            } = (0, n.useWorkspaces)();
            return (0, t.useEffect)(() => {
                !e || a || i || o(null != r ? r : null)
            }, [r, e, a, i, o]), null
        },
        eu = "applayout-scroll-container",
        ep = (0, c.default)(() => Promise.resolve(h.default), {
            ssr: !1
        }),
        em = (0, i.withTranslation)(e => {
            var r;
            let {
                title: o,
                beta: l = !1,
                secondaryRail: c,
                pageBanner: g,
                useBreadcrumbs: h = !1,
                secondarySize: f = "small",
                omitPageTitle: k = !1,
                children: v
            } = e, {
                open: C,
                dialog: T
            } = (0, b.useStudio)(), {
                translate: N
            } = (0, i.useTranslation)(), {
                settings: x
            } = (0, s.useSettings)(), I = (0, t.useCallback)(() => {
                C({
                    task: y.EStudioTaskType.Default
                })
            }, [C]), S = t.default.isValidElement(o) && o.type === i.Translate, A = "string" == typeof o ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: N(o)
            }) : S ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: o
            }) : null != o ? o : null;
            return (0, a.jsxs)(n.CreatorHubLayout, {
                children: [(0, a.jsx)(ed, {}), T, (0, a.jsx)(n.CreatorHubLayout.Rail, {
                    openStudio: I,
                    secondarySize: f,
                    children: c
                }), (0, a.jsx)(n.CreatorHubLayout.Header, {
                    children: h ? (0, a.jsx)(ec, {
                        inLayoutHeader: !0
                    }) : (0, a.jsxs)(m.Grid, {
                        container: !0,
                        alignItems: "center",
                        gap: "8px",
                        children: [A, l && (0, a.jsx)(p.Typography, {
                            children: (0, a.jsx)(u.Label, {
                                labelText: N("Label.Beta")
                            })
                        })]
                    })
                }), (0, a.jsx)(n.CreatorHubLayout.PageContent, {
                    id: eu,
                    banner: g,
                    additionalLinks: x.enableGPCFooter ? (0, a.jsx)(ep, {
                        inline: !0
                    }) : void 0,
                    children: (0, a.jsxs)("div", {
                        className: "width-full height-full",
                        children: [h && (null != (r = !k && A) ? r : l) && (0, a.jsxs)("div", {
                            className: "flex items-center gap-small padding-bottom-large",
                            children: [!k && A, l && (0, a.jsx)(p.Typography, {
                                children: (0, a.jsx)(u.Label, {
                                    labelText: N("Label.Beta")
                                })
                            })]
                        }), v, (0, a.jsx)(d.CookieConsentBanner, {})]
                    })
                })]
            })
        }, [...n.REQUIRED_TRANSLATION_NAMESPACES, g.TranslationNamespace.RightsPortal, g.TranslationNamespace.DeveloperProducts, g.TranslationNamespace.Passes, g.TranslationNamespace.Creations, g.TranslationNamespace.PageTitles, g.TranslationNamespace.Features, g.TranslationNamespace.Privacy, g.TranslationNamespace.Error, g.TranslationNamespace.Analytics, g.TranslationNamespace.TalentHubV2, g.TranslationNamespace.Licenses, g.TranslationNamespace.PlayerFeedback, g.TranslationNamespace.RevenueShareAgreements, g.TranslationNamespace.TaxDocumentation]);
    e.s(["SCROLL_CONTAINER_ID", 0, eu, "default", 0, em], 966501), e.s(["default", 0, e => {
        let {
            product: c,
            children: d,
            beta: u,
            title: p,
            secondarySize: m = "large",
            secondaryRail: y,
            pageBanner: b,
            omitPageTitle: g,
            analyticsAssistantChatHref: h,
            analyticsAssistantChatUniverseId: f,
            ...k
        } = e, {
            noBreadCrumbs: v,
            leftNavigationContents: C
        } = k, {
            settings: T,
            isFetched: N
        } = (0, s.useSettings)(), {
            translate: x
        } = (0, i.useTranslation)(), I = "string" == typeof p ? x(p) : t.default.isValidElement(p) && p.type === i.Translate ? x(p.props.translationKey, p.props.args) : void 0;
        return (0, a.jsxs)(o.NoSSR, {
            children: [v && I && (0, a.jsx)(r.HubMeta, {
                title: I
            }), (0, a.jsx)(n.NavigationConfigsProvider, {
                currentProduct: null != c ? c : "CreatorDashboard",
                environment: (0, l.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: {
                    enabled: T.enableSignalRCrossTab,
                    isFetched: N
                },
                enableGroupModeration: T.enableGroupModerationPage,
                analyticsAssistantChatHref: h,
                analyticsAssistantChatUniverseId: f,
                children: (0, a.jsx)(em, {
                    beta: u,
                    title: p,
                    secondaryRail: null != y ? y : C,
                    pageBanner: b,
                    useBreadcrumbs: !v,
                    secondarySize: m,
                    omitPageTitle: g,
                    children: d
                })
            })]
        })
    }], 177608)
}, 894854, e => {
    "use strict";
    var a = e.i(893949);
    e.s(["useStudio", () => a.default])
}, 729904, e => {
    "use strict";
    e.s(["default", 0, function() {
        return "production"
    }])
}, 627292, e => {
    "use strict";
    var a = e.i(485745);
    e.s(["accordionSummaryClasses", () => a.a])
}, 736186, e => {
    "use strict";
    var a = e.i(516367);
    e.s(["buttonClasses", () => a.b])
}, 438004, e => {
    "use strict";
    var a = e.i(416340);
    e.i(273589);
    var t = e.i(221628),
        r = e.i(969708);
    e.i(309742), e.s(["N", 0, function(e) {
        let {
            children: n,
            defer: i = !1,
            fallback: o = null
        } = e, [l, s] = a.useState(!1);
        return (0, r.u)(() => {
            i || s(!0)
        }, [i]), a.useEffect(() => {
            i && s(!0)
        }, [i]), (0, t.jsx)(a.Fragment, {
            children: l ? n : o
        })
    }])
}, 634463, e => {
    "use strict";
    var a = e.i(438004);
    e.s(["NoSSR", () => a.N])
}, 517379, e => {
    "use strict";
    var a = e.i(865800),
        t = e.i(416340);

    function r(e) {
        return "small" === e ? 16 : 20
    }

    function n(e) {
        return "small" === e ? 18 : 24
    }
    var i = e.i(614515),
        o = e.i(993807),
        l = e.i(696180),
        s = e.i(273589),
        c = e.i(549534),
        d = e.i(962560),
        u = e.i(42569),
        p = e.i(576881),
        m = e.i(221628),
        y = e.i(963320);

    function b(e) {
        return (0, s.g)("MuiSwitch", e)
    }
    e.i(197094);
    var g = (0, l.g)("MuiSwitch", ["root", "edgeStart", "edgeEnd", "switchBase", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium", "checked", "disabled", "input", "thumb", "track"]);
    let h = ["className", "color", "edge", "size", "sx"],
        f = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Root",
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.root, t.edge && a["edge".concat((0, s.a)(t.edge))], a["size".concat((0, s.a)(t.size))]]
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
                    ["& .".concat(g.thumb)]: {
                        width: 16,
                        height: 16
                    },
                    ["& .".concat(g.switchBase)]: {
                        padding: 4,
                        ["&.".concat(g.checked)]: {
                            transform: "translateX(16px)"
                        }
                    }
                }
            }]
        }),
        k = (0, u.s)(p.S, {
            name: "MuiSwitch",
            slot: "SwitchBase",
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.switchBase, {
                    ["& .".concat(g.input)]: a.input
                }, "default" !== t.color && a["color".concat((0, s.a)(t.color))]]
            }
        })(e => {
            let {
                theme: a
            } = e;
            return {
                position: "absolute",
                top: 0,
                left: 0,
                zIndex: 1,
                color: a.vars ? a.vars.palette.Switch.defaultColor : "".concat("light" === a.palette.mode ? a.palette.common.white : a.palette.grey[300]),
                transition: a.transitions.create(["left", "transform"], {
                    duration: a.transitions.duration.shortest
                }),
                ["&.".concat(g.checked)]: {
                    transform: "translateX(20px)"
                },
                ["&.".concat(g.disabled)]: {
                    color: a.vars ? a.vars.palette.Switch.defaultDisabledColor : "".concat("light" === a.palette.mode ? a.palette.grey[100] : a.palette.grey[600])
                },
                ["&.".concat(g.checked, " + .").concat(g.track)]: {
                    opacity: .5
                },
                ["&.".concat(g.disabled, " + .").concat(g.track)]: {
                    opacity: a.vars ? a.vars.opacity.switchTrackDisabled : "" + ("light" === a.palette.mode ? .12 : .2)
                },
                ["& .".concat(g.input)]: {
                    left: "-100%",
                    width: "300%"
                }
            }
        }, e => {
            let {
                theme: a
            } = e;
            return {
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette.action.activeChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, s.b)(a.palette.action.active, a.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                },
                variants: [...Object.entries(a.palette).filter(e => {
                    let [, a] = e;
                    return a.main && a.light
                }).map(e => {
                    let [t] = e;
                    return {
                        props: {
                            color: t
                        },
                        style: {
                            ["&.".concat(g.checked)]: {
                                color: (a.vars || a).palette[t].main,
                                "&:hover": {
                                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette[t].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, s.b)(a.palette[t].main, a.palette.action.hoverOpacity),
                                    "@media (hover: none)": {
                                        backgroundColor: "transparent"
                                    }
                                },
                                ["&.".concat(g.disabled)]: {
                                    color: a.vars ? a.vars.palette.Switch["".concat(t, "DisabledColor")] : "".concat("light" === a.palette.mode ? (0, s.l)(a.palette[t].main, .62) : (0, s.j)(a.palette[t].main, .55))
                                }
                            },
                            ["&.".concat(g.checked, " + .").concat(g.track)]: {
                                backgroundColor: (a.vars || a).palette[t].main
                            }
                        }
                    }
                })]
            }
        }),
        v = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Track",
            overridesResolver: (e, a) => a.track
        })(e => {
            let {
                theme: a
            } = e;
            return {
                height: "100%",
                width: "100%",
                borderRadius: 7,
                zIndex: -1,
                transition: a.transitions.create(["opacity", "background-color"], {
                    duration: a.transitions.duration.shortest
                }),
                backgroundColor: a.vars ? a.vars.palette.common.onBackground : "".concat("light" === a.palette.mode ? a.palette.common.black : a.palette.common.white),
                opacity: a.vars ? a.vars.opacity.switchTrack : "" + ("light" === a.palette.mode ? .38 : .3)
            }
        }),
        C = (0, u.s)("span", {
            name: "MuiSwitch",
            slot: "Thumb",
            overridesResolver: (e, a) => a.thumb
        })(e => {
            let {
                theme: a
            } = e;
            return {
                boxShadow: (a.vars || a).shadows[1],
                backgroundColor: "currentColor",
                width: 20,
                height: 20,
                borderRadius: "50%"
            }
        }),
        T = t.forwardRef(function(e, a) {
            let t = (0, y.u)({
                    props: e,
                    name: "MuiSwitch"
                }),
                {
                    className: r,
                    color: n = "primary",
                    edge: i = !1,
                    size: o = "medium",
                    sx: l
                } = t,
                c = (0, s._)(t, h),
                p = (0, d._)({}, t, {
                    color: n,
                    edge: i,
                    size: o
                }),
                g = (e => {
                    let {
                        classes: a,
                        edge: t,
                        size: r,
                        color: n,
                        checked: i,
                        disabled: o
                    } = e, l = {
                        root: ["root", t && "edge".concat((0, s.a)(t)), "size".concat((0, s.a)(r))],
                        switchBase: ["switchBase", "color".concat((0, s.a)(n)), i && "checked", o && "disabled"],
                        thumb: ["thumb"],
                        track: ["track"],
                        input: ["input"]
                    }, c = (0, u.a)(l, b, a);
                    return (0, d._)({}, a, c)
                })(p),
                T = (0, m.jsx)(C, {
                    className: g.thumb,
                    ownerState: p
                });
            return (0, m.jsxs)(f, {
                className: (0, u.c)(g.root, r),
                sx: l,
                ownerState: p,
                children: [(0, m.jsx)(k, (0, d._)({
                    type: "checkbox",
                    icon: T,
                    checkedIcon: T,
                    ref: a,
                    ownerState: p
                }, c, {
                    classes: (0, d._)({}, g, {
                        root: g.switchBase
                    })
                })), (0, m.jsx)(v, {
                    className: g.track,
                    ownerState: p
                })]
            })
        });
    var N = (0, i.default)({
            name: "Switch"
        })(function(e, a, t) {
            var i, o, l, s, d = a.size;
            return {
                root: ((i = {})["&:has(> .".concat(g.colorPrimary, ".").concat(g.disabled, ".").concat(g.checked, ")")] = {
                    opacity: .5
                }, i["&:has(> .".concat(g.colorSecondary, ".").concat(g.disabled, ")")] = {
                    opacity: .5
                }, i),
                switchBase: ((o = {
                    color: e.palette.actionV2.primary.fill
                })["&.".concat(g.checked, " + .").concat(g.track, ".").concat(t.track)] = {
                    opacity: .38
                }, o["&.".concat(g.disabled, " + .").concat(g.track, ".").concat(t.track)] = {
                    opacity: .38
                }, o),
                thumb: {
                    position: "relative",
                    pointerEvents: "none",
                    width: r(d),
                    height: r(d),
                    borderRadius: "50%",
                    boxShadow: e.elevation.subtle
                },
                track: {
                    opacity: .38
                },
                progress: {
                    color: e.palette.actionV2.primaryBrand.fill,
                    position: "absolute",
                    top: (r(d) - n(d)) / 2,
                    left: (r(d) - n(d)) / 2,
                    zIndex: 1
                },
                colorPrimary: ((l = {})["& .".concat(g.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, l["& .".concat(g.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, l["&.".concat(g.checked, " .").concat(g.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(g.checked, " .").concat(g.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill,
                    opacity: .38
                }, l["&.".concat(g.checked, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primary.fill
                }, l["&.".concat(g.disabled, " .").concat(g.thumb)] = {
                    background: e.palette.components.switch.disabledKnob
                }, l["&.".concat(g.disabled, " .").concat(g.track)] = {
                    background: e.palette.components.switch.slideFill
                }, l["&.".concat(g.disabled, ".").concat(g.checked, " .").concat(g.thumb)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(g.disabled, ".").concat(g.checked, " .").concat(g.track)] = {
                    background: e.palette.actionV2.primaryBrand.fill
                }, l["&.".concat(g.disabled, " .").concat(c.c.root)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, l),
                colorSecondary: ((s = {})["& .".concat(g.thumb)] = {
                    backgroundColor: e.palette.components.switch.knobFill
                }, s["& .".concat(g.track)] = {
                    backgroundColor: e.palette.components.switch.slideFill
                }, s)
            }
        }),
        x = (0, t.forwardRef)(function(e, i) {
            var l, s = e.classes,
                d = e.color,
                u = e.loading,
                p = e.size,
                m = e.checkedIcon,
                y = e.icon,
                b = e["aria-label"],
                h = e.inputProps,
                f = e.className,
                k = (0, a.a)(e, ["classes", "color", "loading", "size", "checkedIcon", "icon", "aria-label", "inputProps", "className"]),
                v = N((0, a._)((0, a._)({}, k), {
                    loading: u,
                    size: p,
                    checkedIcon: m,
                    icon: y,
                    "aria-label": b
                }), {
                    props: {
                        classes: (0, o.default)(s, f)
                    }
                }).classes,
                C = v.thumb,
                x = v.progress,
                I = (0, a.a)(v, ["thumb", "progress"]),
                S = t.default.createElement("div", {
                    className: "".concat(g.thumb, " ").concat(C)
                }, u && t.default.createElement(c.C, {
                    thickness: ((l = n(p)) - r(p)) * 44 / (2 * l),
                    size: n(p),
                    classes: {
                        root: x
                    }
                }));
            return t.default.createElement(T, (0, a._)({}, k, {
                checkedIcon: null != m ? m : S,
                classes: I,
                color: void 0 === d ? "primary" : d,
                icon: null != y ? y : S,
                ref: i,
                size: p,
                inputProps: (0, a._)((0, a._)({}, h), {
                    "aria-label": b
                })
            }))
        });
    e.s(["Switch", 0, x], 517379)
}, 283514, (e, a, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "LoadableContext", {
        enumerable: !0,
        get: function() {
            return r
        }
    });
    let r = e.r(2879)._(e.r(416340)).default.createContext(null)
}, 568710, (e, a, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    }), Object.defineProperty(t, "default", {
        enumerable: !0,
        get: function() {
            return p
        }
    });
    let r = e.r(2879)._(e.r(416340)),
        n = e.r(283514),
        i = [],
        o = [],
        l = !1;

    function s(e) {
        let a = e(),
            t = {
                loading: !0,
                loaded: null,
                error: null
            };
        return t.promise = a.then(e => (t.loading = !1, t.loaded = e, e)).catch(e => {
            throw t.loading = !1, t.error = e, e
        }), t
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
                _opts: a
            } = this;
            e.loading && ("number" == typeof a.delay && (0 === a.delay ? this._state.pastDelay = !0 : this._delay = setTimeout(() => {
                this._update({
                    pastDelay: !0
                })
            }, a.delay)), "number" == typeof a.timeout && (this._timeout = setTimeout(() => {
                this._update({
                    timedOut: !0
                })
            }, a.timeout))), this._res.promise.then(() => {
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
        constructor(e, a) {
            this._loadFn = e, this._opts = a, this._callbacks = new Set, this._delay = null, this._timeout = null, this.retry()
        }
    }

    function d(a) {
        return function(a, t) {
            let s = Object.assign({
                    loader: null,
                    loading: null,
                    delay: 200,
                    timeout: null,
                    webpack: null,
                    modules: null
                }, t),
                d = null;

            function u() {
                if (!d) {
                    let e = new c(a, s);
                    d = {
                        getCurrentValue: e.getCurrentValue.bind(e),
                        subscribe: e.subscribe.bind(e),
                        retry: e.retry.bind(e),
                        promise: e.promise.bind(e)
                    }
                }
                return d.promise()
            }
            if ("u" < typeof window && i.push(u), !l && "u" > typeof window) {
                let a = s.webpack && "function" == typeof e.t.resolveWeak ? s.webpack() : s.modules;
                a && o.push(e => {
                    for (let t of a)
                        if (e.includes(t)) return u()
                })
            }

            function p(e, a) {
                let t;
                u(), (t = r.default.useContext(n.LoadableContext)) && Array.isArray(s.modules) && s.modules.forEach(e => {
                    t(e)
                });
                let i = r.default.useSyncExternalStore(d.subscribe, d.getCurrentValue, d.getCurrentValue);
                return r.default.useImperativeHandle(a, () => ({
                    retry: d.retry
                }), []), r.default.useMemo(() => {
                    var a;
                    return i.loading || i.error ? r.default.createElement(s.loading, {
                        isLoading: i.loading,
                        pastDelay: i.pastDelay,
                        timedOut: i.timedOut,
                        error: i.error,
                        retry: d.retry
                    }) : i.loaded ? r.default.createElement((a = i.loaded) && a.default ? a.default : a, e) : null
                }, [e, i])
            }
            return p.preload = () => u(), p.displayName = "LoadableComponent", r.default.forwardRef(p)
        }(s, a)
    }

    function u(e, a) {
        let t = [];
        for (; e.length;) {
            let r = e.pop();
            t.push(r(a))
        }
        return Promise.all(t).then(() => {
            if (e.length) return u(e, a)
        })
    }
    d.preloadAll = () => new Promise((e, a) => {
        u(i).then(e, a)
    }), d.preloadReady = function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : [];
        return new Promise(a => {
            let t = () => (l = !0, a());
            u(o, e).then(t, t)
        })
    }, "u" > typeof window && (window.__NEXT_PRELOADREADY = d.preloadReady);
    let p = d
}, 810637, (e, a, t) => {
    "use strict";
    Object.defineProperty(t, "__esModule", {
        value: !0
    });
    var r = {
        default: function() {
            return u
        },
        noSSR: function() {
            return d
        }
    };
    for (var n in r) Object.defineProperty(t, n, {
        enumerable: !0,
        get: r[n]
    });
    let i = e.r(2879),
        o = e.r(221628);
    e.r(416340);
    let l = i._(e.r(568710)),
        s = "u" < typeof window;

    function c(e) {
        return {
            default: (null == e ? void 0 : e.default) || e
        }
    }

    function d(e, a) {
        if (delete a.webpack, delete a.modules, !s) return e(a);
        let t = a.loading;
        return () => (0, o.jsx)(t, {
            error: null,
            isLoading: !0,
            pastDelay: !1,
            timedOut: !1
        })
    }

    function u(e, a) {
        let t = l.default,
            r = {
                loading: e => {
                    let {
                        error: a,
                        isLoading: t,
                        pastDelay: r
                    } = e;
                    return null
                }
            };
        e instanceof Promise ? r.loader = () => e : "function" == typeof e ? r.loader = e : "object" == typeof e && (r = {
            ...r,
            ...e
        });
        let n = (r = {
            ...r,
            ...a
        }).loader;
        return (r.loadableGenerated && (r = {
            ...r,
            ...r.loadableGenerated
        }, delete r.loadableGenerated), "boolean" != typeof r.ssr || r.ssr) ? t({
            ...r,
            loader: () => null != n ? n().then(c) : Promise.resolve(c(() => null))
        }) : (delete r.webpack, delete r.modules, d(t, r))
    }("function" == typeof t.default || "object" == typeof t.default && null !== t.default) && void 0 === t.default.__esModule && (Object.defineProperty(t.default, "__esModule", {
        value: !0
    }), Object.assign(t.default, t), a.exports = t.default)
}, 109182, (e, a, t) => {
    a.exports = e.r(810637)
}, 260241, e => {
    "use strict";
    var a = e.i(79187),
        t = e.i(416340),
        r = e.i(706442),
        n = e.i(431346),
        i = e.i(620068),
        o = e.i(982234),
        l = e.i(418400),
        s = e.i(169722),
        c = e.i(199834),
        d = e.i(872204),
        u = e.i(627292),
        p = e.i(734306),
        m = e.i(731693),
        y = e.i(397810),
        b = e.i(736186),
        g = e.i(645909),
        h = e.i(517379),
        f = e.i(12839),
        f = f,
        k = e.i(291037),
        v = e.i(899819),
        C = e.i(777004),
        T = e.i(35298),
        N = e.i(252842);
    let x = "https://www.roblox.com/info/privacy",
        I = "{privacyPolicyLink}",
        S = "{googleAnalyticsLink}",
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
    var P, w, E = ((P = E || {}).BannerTitle = "Heading.CookieBanner", P.CookieBannerContent = "Description.CookieBannerContent", P.CookieBannerButton = "Action.CookieBanner", P.PrivacyPolicy = "Description.PrivacyPolicy", P.ConsentToolModalTitle = "Heading.CookieSettings", P.SaveBtn = "Action.SavePreferences", P.CancelBtn = "Action.Cancel", P.InfoCollectionHeader = "Heading.InformationCollection", P.InfoCollectionContent = "Description.InformationCollection", P.InfoCollectionHeader2 = "Heading.InformationCollection2", P.InfoCollectionContent2 = "Description.InformationCollection2", P.InfoPartnerCollectionHeader = "Heading.InformationPartnerCollection", P.InfoPartnerCollectionContent = "Description.InformationPartnerCollection", P.RBXViralAcquisition = "RBXViralAcquisition", P.RBXViralAcquisitionDescription = "Description.RBXViralAcquisition", P.RBXSource = "RBXSource", P.RBXSourceDescription = "Description.RBXSource", P.GoogleAnalytics = "Heading.GoogleAnalytics", P.OwnedBy = "Label.OwnedBy", P.GoogleInc = "Google Inc.", P.Website = "Label.Website", P.GoogleAnalyticsPurposeHeader = "Heading.GoogleAnalyticsPurpose", P.GoogleAnalyticsPurposeDescription = "Description.GoogleAnalyticsPurpose", P.CompanyCollectionHeader = "Heading.CompanyCollection", P.DataCollected = "Label.DataCollected", P.DataCollectedContent = "Description.DataCollected", P.DataSharing = "Label.DataSharing", P.DataSharingContent = "Description.DataSharing", P.DataRetention = "Label.DataRetention", P.DataRetentionContent = "Description.DataRetention", P.DataUse = "Label.DataUse", P.DataUseContent = "Description.DataUse", P.DataStorage = "Label.DataStorage", P.DataStorageContent = "Description.Undisclosed", P.RequestData = "Action.RequestData", P.SetCookieOptions = "Action.SetCookieOptions", P.DeclineAll = "Action.DeclineAll", P.AcceptAll = "Action.AcceptAll", P.EssentialCookie = "Heading.EssentialCookies", P.AnalyticsCookie = "Heading.AnalyticsCookies", P.GAReadMore = "Description.GAReadMore", P.GAReadMoreUrl = "{googleAnalyticsLink}", P);
    let H = (0, r.makeStyles)()(e => ({
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
        D = e => {
            let {
                onAcceptAll: r,
                onDeclineAll: u,
                onLearnMore: p,
                isOpen: m
            } = e, {
                translate: y
            } = (0, a.useTranslation)(), {
                classes: b
            } = H(), g = (0, i.useMediaQuery)((0, n.useTheme)().breakpoints.down("Medium")), h = (0, t.useMemo)(() => t.default.createElement(o.Link, {
                href: x,
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, y(E.PrivacyPolicy)), [y]), f = (0, t.useMemo)(() => {
                let e = y(E.CookieBannerContent);
                if (!e.includes(I)) return e;
                let a = e.split(I);
                return t.default.createElement(t.default.Fragment, null, a[0], h, a[1] || "")
            }, [y, h]);
            return t.default.createElement(l.Drawer, {
                open: m,
                onClose: u,
                anchor: "bottom",
                variant: "temporary",
                ModalProps: {
                    BackdropProps: {
                        classes: {
                            root: b.backdrop
                        }
                    }
                }
            }, t.default.createElement(s.Grid, {
                className: b.root
            }, t.default.createElement(s.Grid, {
                className: b.content
            }, t.default.createElement(c.Typography, {
                variant: "body2"
            }, f)), t.default.createElement(s.Grid, {
                className: b.actions
            }, t.default.createElement(d.Button, {
                variant: "text",
                onClick: p,
                color: "secondary"
            }, y(E.SetCookieOptions)), t.default.createElement(s.Grid, {
                className: b.buttons
            }, t.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: u,
                fullWidth: g
            }, y(E.DeclineAll)), t.default.createElement(d.Button, {
                color: "secondary",
                variant: "contained",
                onClick: r,
                fullWidth: g
            }, y(E.AcceptAll))))))
        },
        L = "RBXcb",
        R = {
            RBXViralAcquisition: !0,
            RBXSource: !0,
            GoogleAnalytics: !0
        },
        B = (0, t.createContext)(null),
        M = () => {
            let e = (0, t.useContext)(B);
            if (!e) throw Error("useCookieConsentContext must be used within a CookieConsentProvider");
            return e
        },
        _ = e => {
            let a, t = Object.entries(e).map(e => {
                let [a, t] = e;
                return "".concat(a, "=").concat(t)
            }).join("&");
            Object.entries(e).forEach(e => {
                let [a, t] = e;
                t || (0, N.deleteCookie)(a)
            });
            let r = new Date;
            r.setDate(r.getDate() + 180), document.cookie = "".concat(L, "=").concat(t, "; expires=").concat(r.toUTCString(), "; path=/; domain=").concat((a = window.location.hostname.split(".")).length <= 2 ? window.location.hostname : ".".concat(a.slice(1).join(".")))
        },
        j = e => {
            let {
                cookieName: a,
                description: r
            } = e;
            return t.default.createElement("div", null, t.default.createElement(c.Typography, {
                variant: "codeDense"
            }, a), t.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, r))
        },
        z = (0, r.makeStyles)()(() => ({
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
        O = () => {
            var e;
            let {
                translate: r
            } = (0, a.useTranslation)(), {
                cookiePolicy: n
            } = M(), {
                classes: i
            } = z();
            return n && (null == (e = n.EssentialCookieList) ? void 0 : e.length) ? t.default.createElement(p.Accordion, {
                className: i.accordion
            }, t.default.createElement(m.AccordionSummary, {
                className: i.accordionSummary
            }, t.default.createElement(c.Typography, {
                variant: "h6"
            }, r(E.EssentialCookie))), t.default.createElement(y.AccordionDetails, null, n.EssentialCookieList.map(e => t.default.createElement(j, {
                key: e.cookieName,
                cookieName: e.cookieName,
                description: r(e.description)
            })))) : null
        };
    var G = ((w = {}).RBXViralAcquisition = "RBXViralAcquisition", w.RBXSource = "RBXSource", w.GoogleAnalytics = "GoogleAnalytics", w);
    let U = e => {
            let {
                title: a,
                content: r,
                secondary: n = !1
            } = e;
            return t.default.createElement("div", null, t.default.createElement(c.Typography, {
                variant: "body2",
                color: n ? "secondary" : "primary"
            }, a), t.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                color: "secondary"
            }, r))
        },
        V = () => {
            let {
                translate: e
            } = (0, a.useTranslation)(), r = e(E.GAReadMore);
            if (!r.includes(S)) return t.default.createElement(t.default.Fragment, null, r);
            let [n, i] = r.split(S);
            return t.default.createElement(c.Typography, {
                variant: "body2"
            }, n, t.default.createElement(o.Link, {
                href: "https://support.google.com/analytics/answer/11397207",
                target: "_blank",
                underline: "hover",
                color: "inherit"
            }, e(E.GoogleAnalytics)), i)
        },
        F = (0, r.makeStyles)()(() => ({
            button: {
                paddingLeft: 5,
                ["&.".concat(b.buttonClasses.root)]: {
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
        X = e => {
            let {
                href: a,
                text: r
            } = e, {
                classes: n
            } = F();
            return t.default.createElement("div", null, t.default.createElement(d.Button, {
                className: n.button,
                variant: "text",
                component: "a",
                color: "primary",
                href: a,
                rel: "noreferrer",
                endIcon: t.default.createElement(g.OpenInNewIcon, null),
                size: "small",
                target: "_blank",
                disableRipple: !0
            }, r))
        },
        q = e => {
            let {
                isAnalyticsCookieAccepted: r,
                setIsAnalyticsCookieAccepted: n
            } = e, {
                classes: i
            } = z(), {
                translate: o
            } = (0, a.useTranslation)();
            return t.default.createElement(p.Accordion, {
                className: i.accordion
            }, t.default.createElement(m.AccordionSummary, {
                className: i.accordionSummary
            }, t.default.createElement(c.Typography, {
                variant: "h6"
            }, o(E.AnalyticsCookie)), t.default.createElement(h.Switch, {
                checked: r,
                onChange: (e, a) => {
                    n(a)
                },
                "aria-label": o(E.AnalyticsCookie),
                size: "small"
            })), t.default.createElement(y.AccordionDetails, null, t.default.createElement(j, {
                key: G.RBXViralAcquisition,
                cookieName: G.RBXViralAcquisition,
                description: o(E.RBXViralAcquisitionDescription)
            }), t.default.createElement(j, {
                key: G.RBXSource,
                cookieName: G.RBXSource,
                description: o(E.RBXSourceDescription)
            }), t.default.createElement(X, {
                href: "https://marketingplatform.google.com/about/analytics/",
                text: o(E.GoogleAnalytics)
            }), t.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0
            }, o(E.OwnedBy), " ", "Google Inc."), t.default.createElement(U, {
                title: o(E.GoogleAnalyticsPurposeHeader),
                content: o(E.GoogleAnalyticsPurposeDescription)
            }), t.default.createElement(c.Typography, {
                variant: "body2"
            }, o(E.CompanyCollectionHeader)), A.map(e => t.default.createElement(U, {
                key: e.label,
                title: o(e.label),
                content: o(e.content),
                secondary: !0
            })), t.default.createElement(V, null)))
        },
        W = (0, r.makeStyles)()(e => ({
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
        K = e => {
            var r;
            let {
                open: n,
                onClose: i,
                onSave: o,
                isAnalyticsCookieAccepted: l,
                setIsAnalyticsCookieAccepted: s
            } = e, {
                translate: u
            } = (0, a.useTranslation)(), {
                classes: p
            } = W(), {
                cookiePolicy: m
            } = M();
            return m ? t.default.createElement(k.Dialog, {
                open: n,
                onClose: i
            }, t.default.createElement(v.DialogTitle, null, u(E.ConsentToolModalTitle)), t.default.createElement(C.DialogContent, {
                className: p.dialogContent
            }, t.default.createElement(c.Typography, {
                variant: "h6"
            }, u(E.InfoCollectionHeader)), t.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(E.InfoCollectionContent)), t.default.createElement(c.Typography, {
                variant: "h6"
            }, u(E.InfoCollectionHeader2)), t.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(E.InfoCollectionContent2)), t.default.createElement(c.Typography, {
                variant: "h6"
            }, u(E.InfoPartnerCollectionHeader)), t.default.createElement(c.Typography, {
                variant: "body2",
                paragraph: !0,
                className: p.paragraph,
                color: "secondary"
            }, u(E.InfoPartnerCollectionContent)), t.default.createElement(X, {
                href: "https://www.roblox.com/support",
                text: u(E.RequestData)
            }), t.default.createElement(X, {
                href: x,
                text: u(E.PrivacyPolicy)
            }), t.default.createElement("div", {
                className: p.accordionSection
            }, (null == (r = m.EssentialCookieList) ? void 0 : r.length) > 0 && t.default.createElement("div", {
                className: p.accordionContainer
            }, t.default.createElement(O, null)), t.default.createElement("div", {
                className: p.accordionContainer
            }, t.default.createElement(q, {
                isAnalyticsCookieAccepted: l,
                setIsAnalyticsCookieAccepted: s
            })))), t.default.createElement(T.DialogActions, null, t.default.createElement(d.Button, {
                color: "secondary",
                variant: "outlined",
                onClick: i
            }, u(E.CancelBtn)), t.default.createElement(d.Button, {
                color: "primaryBrand",
                variant: "contained",
                onClick: o
            }, u(E.SaveBtn)))) : null
        },
        Q = e => {
            let {
                isOpen: a,
                onClose: r,
                onSave: n
            } = e, {
                cookiePolicy: i,
                acceptAll: o,
                declineAll: l,
                hasAcceptedAnalyticsCookie: s
            } = M(), [c, d] = (0, t.useState)(s), u = (0, t.useCallback)(() => {
                c ? o() : l(), n()
            }, [o, l, c, n]);
            return i ? t.default.createElement(K, {
                open: a,
                onClose: r,
                isAnalyticsCookieAccepted: c,
                setIsAnalyticsCookieAccepted: d,
                onSave: u
            }) : null
        },
        J = (0, a.withTranslation)(() => {
            let {
                acceptAll: e,
                declineAll: a,
                shouldShowBanner: r
            } = M(), [n, i] = (0, t.useState)(!1), [o, l] = (0, t.useState)(!1);
            (0, t.useEffect)(() => {
                r && l(!0)
            }, [r]);
            let s = (0, t.useCallback)(() => {
                    e(), l(!1)
                }, [e]),
                c = (0, t.useCallback)(() => {
                    a(), l(!1)
                }, [a]),
                d = (0, t.useCallback)(() => {
                    i(!0), l(!1)
                }, []),
                u = (0, t.useCallback)(() => {
                    i(!1), l(!0)
                }, []),
                p = (0, t.useCallback)(() => {
                    i(!1), l(!1)
                }, []);
            return t.default.createElement(t.default.Fragment, null, t.default.createElement(D, {
                isOpen: o,
                onAcceptAll: s,
                onDeclineAll: c,
                onLearnMore: d
            }), t.default.createElement(Q, {
                isOpen: n,
                onClose: u,
                onSave: p
            }))
        }, ["Feature.Tracking", "CommonUI.Controls"]);
    e.s(["CookieConsentBanner", 0, J, "CookieConsentProvider", 0, e => {
        let {
            children: a,
            robloxSiteDomain: r,
            initialCookiePolicy: n,
            initialPreferences: i,
            forceShowBanner: o = !1
        } = e, [l, s] = (0, t.useState)(n || null), [c, d] = (0, t.useState)(i || (() => {
            if ("u" < typeof document) return R;
            let e = document.cookie.split("; ").find(e => e.startsWith("".concat(L, "=")));
            return e ? e.substring(L.length + 1).split("&").reduce((e, a) => {
                let [t, r] = a.split("=");
                return e[t] = "true" === r, e
            }, {}) : R
        })()), [u, p] = (0, t.useState)(!n), [m, y] = (0, t.useState)(null), b = (0, t.useMemo)(() => !!o || !!(null == l ? void 0 : l.ShouldDisplayCookieBannerV3) && !(!("u" < typeof document) && document.cookie.split("; ").some(e => e.startsWith("".concat(L, "=")))), [null == l ? void 0 : l.ShouldDisplayCookieBannerV3, o]);
        (0, t.useEffect)(() => {
            n || (async () => {
                try {
                    var e, a, t;
                    let n = await fetch("https://apis.".concat(r, "/guac-v2/v1/bundles/cookie-policy"));
                    if (!n.ok) throw Error("Failed to fetch cookie policy");
                    let i = await n.json();
                    s({
                        ShouldDisplayCookieBannerV3: null != (e = i.ShouldDisplayCookieBannerV3) && e,
                        NonEssentialCookieList: null != (a = i.NonEssentialCookieList) ? a : [],
                        EssentialCookieList: null != (t = i.EssentialCookieList) ? t : []
                    }), p(!1)
                } catch (e) {
                    y(e instanceof Error ? e : Error("Unknown error")), p(!1)
                }
            })()
        }, [r, n]);
        let g = (0, t.useCallback)((e, a) => {
                d(t => {
                    let r = {
                        ...t,
                        [e]: a
                    };
                    return _(r), r
                })
            }, []),
            h = (0, t.useCallback)(() => {
                if (!l) return;
                let e = l.NonEssentialCookieList.reduce((e, a) => ({
                    ...e,
                    [a]: !0
                }), R);
                _(e), d(e)
            }, [l]),
            f = (0, t.useCallback)(() => {
                if (!l) return;
                let e = l.NonEssentialCookieList.reduce((e, a) => ({
                    ...e,
                    [a]: !1
                }), R);
                _(e), d(e)
            }, [l]),
            k = (0, t.useMemo)(() => Object.values(c).some(e => !0 === e), [c]),
            v = (0, t.useMemo)(() => ({
                cookiePolicy: l,
                preferences: c,
                updatePreference: g,
                acceptAll: h,
                declineAll: f,
                isLoading: u,
                error: m,
                hasAcceptedAnalyticsCookie: k,
                shouldShowBanner: b
            }), [l, c, u, m, h, f, g, k, b]);
        return t.default.createElement(B.Provider, {
            value: v
        }, a)
    }, "useCookieConsentContext", 0, M], 260241)
}]);

//# debugId=87937e3c-c151-9039-75b3-a43548dc7f6f
//# sourceMappingURL=3a4tbreo3i8u_.js.map