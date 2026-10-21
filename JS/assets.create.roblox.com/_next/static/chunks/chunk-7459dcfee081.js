;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "726ae6cc-0111-51db-dc35-b669be9420b9")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 533968, e => {
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
        r = e.i(37819),
        n = e.i(602635),
        i = e.i(692734),
        s = e.i(79187),
        l = e.i(844333),
        o = e.i(665869),
        c = e.i(729904),
        d = e.i(507742),
        u = e.i(260241),
        m = e.i(298964),
        p = e.i(623983),
        y = e.i(345886),
        b = e.i(581577),
        g = e.i(894854),
        h = e.i(881670),
        f = e.i(174528),
        v = e.i(537068),
        k = e.i(589624),
        T = e.i(194250),
        N = e.i(863605),
        x = e.i(154502),
        I = e.i(945146),
        C = e.i(690569);
    e.i(535072);
    var P = e.i(251635),
        A = e.i(634034),
        w = e.i(690768),
        S = e.i(787802),
        H = e.i(396249),
        E = e.i(121880),
        M = e.i(15686);
    e.i(39651);
    var L = (0, A.c)((0, a.jsx)("path", {
        d: "M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"
    }), "MoreHoriz");
    let R = ["slots", "slotProps"],
        j = (0, P.s)(w.B, {
            name: "MuiBreadcrumbCollapsed"
        })(e => {
            let {
                theme: a
            } = e;
            return (0, I._)({
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
                "&:hover, &:focus": (0, I._)({}, "light" === a.palette.mode ? {
                    backgroundColor: a.palette.grey[200]
                } : {
                    backgroundColor: a.palette.grey[600]
                }),
                "&:active": (0, I._)({
                    boxShadow: a.shadows[0]
                }, "light" === a.palette.mode ? {
                    backgroundColor: (0, C.n)(a.palette.grey[200], .12)
                } : {
                    backgroundColor: (0, C.n)(a.palette.grey[600], .12)
                })
            })
        }),
        D = (0, P.s)(L)({
            width: 24,
            height: 16
        });

    function G(e) {
        let {
            slots: t = {},
            slotProps: r = {}
        } = e, n = (0, C._)(e, R);
        return (0, a.jsx)("li", {
            children: (0, a.jsx)(j, (0, I._)({
                focusRipple: !0
            }, n, {
                ownerState: e,
                children: (0, a.jsx)(D, (0, I._)({
                    as: t.CollapsedIcon,
                    ownerState: e
                }, r.collapsedIcon))
            }))
        })
    }

    function U(e) {
        return (0, C.g)("MuiBreadcrumbs", e)
    }
    var B = (0, S.g)("MuiBreadcrumbs", ["root", "ol", "li", "separator"]);
    let F = ["children", "className", "component", "slots", "slotProps", "expandText", "itemsAfterCollapse", "itemsBeforeCollapse", "maxItems", "separator"],
        O = (0, P.s)(H.T, {
            name: "MuiBreadcrumbs",
            slot: "Root",
            overridesResolver: (e, a) => [{
                ["& .".concat(B.li)]: a.li
            }, a.root]
        })({}),
        z = (0, P.s)("ol", {
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
        _ = (0, P.s)("li", {
            name: "MuiBreadcrumbs",
            slot: "Separator",
            overridesResolver: (e, a) => a.separator
        })({
            display: "flex",
            userSelect: "none",
            marginLeft: 8,
            marginRight: 8
        }),
        q = t.forwardRef(function(e, r) {
            var n, i;
            let s = (0, E.u)({
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
                    maxItems: b = 8,
                    separator: g = "/"
                } = s,
                h = (0, C._)(s, F),
                [f, v] = t.useState(!1),
                k = (0, I._)({}, s, {
                    component: c,
                    expanded: f,
                    expandText: m,
                    itemsAfterCollapse: p,
                    itemsBeforeCollapse: y,
                    maxItems: b,
                    separator: g
                }),
                T = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, P.a)({
                        root: ["root"],
                        li: ["li"],
                        ol: ["ol"],
                        separator: ["separator"]
                    }, U, a)
                })(k),
                N = (0, M.u)({
                    elementType: d.CollapsedIcon,
                    externalSlotProps: u.collapsedIcon,
                    ownerState: k
                }),
                x = t.useRef(null),
                A = t.Children.toArray(l).filter(e => t.isValidElement(e)).map((e, t) => (0, a.jsx)("li", {
                    className: T.li,
                    children: e
                }, "child-".concat(t)));
            return (0, a.jsx)(O, (0, I._)({
                ref: r,
                component: c,
                color: "text.secondary",
                className: (0, P.c)(T.root, o),
                ownerState: k
            }, h, {
                children: (0, a.jsx)(z, {
                    className: T.ol,
                    ref: x,
                    ownerState: k,
                    children: (n = f || b && A.length <= b || y + p >= A.length ? A : [...A.slice(0, y), (0, a.jsx)(G, {
                        "aria-label": m,
                        slots: {
                            CollapsedIcon: d.CollapsedIcon
                        },
                        slotProps: {
                            collapsedIcon: N
                        },
                        onClick: () => {
                            v(!0);
                            let e = x.current.querySelector("a[href],button,[tabindex]");
                            e && e.focus()
                        }
                    }, "ellipsis"), ...A.slice(A.length - p, A.length)], i = T.separator, n.reduce((e, t, r) => (r < n.length - 1 ? e = e.concat(t, (0, a.jsx)(_, {
                        "aria-hidden": !0,
                        className: i,
                        ownerState: k,
                        children: g
                    }, "separator-".concat(r))) : e.push(t), e), []))
                })
            }))
        });
    var V = (0, N.default)({
            name: "Breadcrumbs"
        })(function(e) {
            return {
                root: (0, T._)((0, T._)({}, e.typography.body1), {
                    color: e.palette.content.muted
                })
            }
        }),
        W = (0, t.forwardRef)(function(e, a) {
            var r = e.classes,
                n = e.className,
                i = (0, T.a)(e, ["classes", "className"]),
                s = V(void 0, {
                    props: {
                        classes: (0, x.default)(r, n)
                    }
                });
            return t.default.createElement(q, (0, T._)({
                classes: s.classes
            }, i, {
                ref: a
            }))
        });
    e.s(["Breadcrumbs", 0, W], 556499);
    var K = e.i(686762),
        Q = e.i(83265),
        J = e.i(114209),
        X = e.i(97782),
        Y = e.i(475360),
        Z = e.i(759283),
        $ = e.i(829425),
        ee = e.i(726474),
        ea = e.i(86027),
        et = e.i(128106);
    let er = (e, a) => e.args && e.args.value ? a(e.key, {
            [e.args.param]: a(e.args.value)
        }) : a(e.key),
        en = e => {
            var a;
            let t = parseInt(null != (a = e.developerItemId) ? a : "", 10);
            return Number.isNaN(t) ? ee.dashboard.configureCreatorStoreItemBasePath : ee.dashboard.getConfigureCreatorStoreItemUrl(t)
        },
        ei = {
            analytics: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return t ? er({
                        key: Z.itemFullNameKeys[t]
                    }, a) : er({
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
                    return er({
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
                    return er({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: et.default.CreatorStore,
                getLinkPath: en,
                withId: !0
            },
            "version-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.VersionHistory"
                    }, a)
                },
                breadcrumbType: et.default.CreatorStore,
                getLinkPath: en,
                withId: !1
            },
            dependencies: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.Dependencies"
                    }, a)
                },
                breadcrumbType: et.default.CreatorStore,
                getLinkPath: en,
                withId: !1
            },
            localization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
                        key: "Heading.AvatarCreationTokens"
                    }, a)
                },
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationAvatarCreationTokensUrl(Number(e.baseId)),
                breadcrumbType: et.default.AnalyticsMonetization
            },
            subscriptions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
                        key: "Heading.Commerce"
                    }, a)
                },
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationCommerceUrl(Number(e.baseId)),
                breadcrumbType: et.default.Commerce
            },
            "create-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.CreateProduct"
                    }, a)
                },
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationCommerceCreateProductUrl(Number(e.baseId)),
                breadcrumbType: et.default.CreateProducts
            },
            eligibility: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
                        key: "Heading.Monetization"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMonetization,
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationOverviewUrl(Number(e.baseId))
            },
            performance: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
                        key: "Heading.Ads"
                    }, a)
                },
                breadcrumbType: et.default.ImmersiveAds,
                getLinkPath: e => $.creatorHub.dashboard.getMonetizationImmersiveAdsUrl(Number(e.baseId))
            },
            "create-placement": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                    return er({
                        key: "Heading.RobloxPlusDeveloperProgram"
                    }, a)
                },
                breadcrumbType: et.default.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/roblox-plus")
            },
            "experience-questionnaire": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.ContentRating"
                    }, a)
                },
                breadcrumbType: et.default.Questionnaire
            },
            guidelines: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return t === Y.Item.CatalogAsset || t === Y.Item.LibraryAsset || t === Y.Item.Bundle || t === Y.Item.Event || t === Y.Item.AvatarCreationToken || t === Y.Item.Environment || t === Y.Item.Look ? er({
                        key: "Heading.Configure"
                    }, a) : t === Y.Item.Game ? er({
                        key: "Heading.ContentSettings"
                    }, a) : t === Y.Item.ExperienceSubscription ? er({
                        key: "Heading.UpdateSubscription"
                    }, a) : t === Y.Item.Alert ? er({
                        key: "Heading.ConfigureAlert"
                    }, a) : er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return t ? er({
                        key: "Heading.Create",
                        args: {
                            param: "itemType",
                            value: Z.itemTypeToSingularNameKeys[t]
                        }
                    }, a) : er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
                        key: "Heading.Moderation"
                    }, a)
                },
                breadcrumbType: et.default.Bans,
                getLinkPath: e => $.creatorHub.dashboard.getUserBansUrl(Number(e.baseId))
            },
            "anti-cheat": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.AntiCheat"
                    }, a)
                },
                breadcrumbType: et.default.AntiCheat,
                getLinkPath: e => $.creatorHub.dashboard.getAntiCheatUrl(Number(e.baseId))
            },
            "issues-and-appeals": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.IssuesAndAppeals"
                    }, a)
                },
                breadcrumbType: et.default.IssuesAndAppeals,
                getLinkPath: e => $.creatorHub.dashboard.getIssuesAndAppealsUrl(Number(e.baseId))
            },
            "[violationId]": {
                displayName: () => "",
                breadcrumbType: et.default.GameViolation,
                withId: !0
            },
            add: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
                        key: "Heading.Configs"
                    }, a)
                },
                breadcrumbType: et.default.Configs,
                getLinkPath: e => $.creatorHub.dashboard.getAnalyticsConfigsUrl(Number(e.baseId))
            },
            experiments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.Experiments"
                    }, a)
                },
                breadcrumbType: et.default.Experiments,
                getLinkPath: e => $.creatorHub.dashboard.getExperimentsUrl(Number(e.baseId))
            },
            "experiment-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
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
                    return er({
                        key: "Heading.GameDetails"
                    }, a)
                },
                breadcrumbType: et.default.GameDetails
            },
            "content-rating": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.ContentRating"
                    }, a)
                },
                breadcrumbType: et.default.ContentRating
            },
            "advanced-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.AdvancedSettings"
                    }, a)
                },
                breadcrumbType: et.default.AdvancedSettings
            },
            "game-join": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.AdvancedSettings"
                    }, a)
                },
                breadcrumbType: et.default.GameJoin
            },
            "manage-audience": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
                        key: "Heading.ManageAudience"
                    }, a)
                },
                breadcrumbType: et.default.Publishing
            },
            "player-support": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return er({
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
                    return er({
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
                inLayoutHeader: i = !1
            } = e, {
                pathname: s,
                query: l
            } = (0, k.useRouter)(), {
                classes: {
                    linkStyle: o,
                    compactBreadCrumbLinkStyle: c,
                    breadcrumb: d,
                    breadcrumbBottomSpace: u,
                    compactBreadCrumb: m
                }
            } = ec(), {
                insideTopNavigationDrawer: b
            } = eo(), g = (0, Q.useMediaQuery)(e => e.breakpoints.down("Medium")), {
                gameDetails: h
            } = (0, J.useCurrentGame)(), f = (0, t.useMemo)(() => {
                let e = s.includes("/analytics/dashboards/");
                return s.split("/").filter(e => !!e).filter(a => "analytics" !== a || !e)
            }, [s]), {
                itemNameMapping: T,
                pathLinkParams: N,
                displayNameParam: x
            } = (0, es.default)(), I = "string" == typeof l.dashboardId ? l.dashboardId : void 0, C = "string" == typeof l.id ? l.id : void 0, P = s.endsWith("/analytics/dashboards/[dashboardId]/edit") && C && I ? "/dashboard/creations/experiences/".concat(C, "/analytics/dashboards/").concat(I) : void 0, A = (0, t.useCallback)((e, t) => b ? t ? (0, a.jsx)(v.default, {
                href: t,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(K.Link, {
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
                children: (0, a.jsx)(K.Link, {
                    classes: {
                        root: o
                    },
                    children: e
                })
            }, e) : (0, a.jsx)(p.Typography, {
                color: "secondary",
                children: e
            }, e), [b, o]), w = (0, t.useCallback)(e => {
                var a, t;
                let r = e.parentItemTypeName ? ei[e.parentItemTypeName] : null,
                    n = T[e.breadcrumbType],
                    i = e.breadcrumbType === et.default.AnalyticsCustomDashboards && P ? P : void 0,
                    l = null != i ? i : null == (a = e.getLinkPath) ? void 0 : a.call(e, N),
                    o = void 0 !== i || null === r || e.breadcrumbType !== r.breadcrumbType;
                return [r ? A(r.displayName(x), ed(s, null == (t = r.getLinkPath) ? void 0 : t.call(r, N))) : null, n ? A(n, o ? ed(s, l) : void 0) : null]
            }, [T, N, A, x, s, P]), S = (0, t.useMemo)(() => {
                let e;
                return e = [], f.filter(e => ei[e]).forEach(a => {
                    let t = ei[a],
                        r = t.displayName(x);
                    if (r && e.push(r), t.withId) {
                        let a = T[t.breadcrumbType];
                        a && e.push(a)
                    }
                }), e
            }, [f, x, T]), H = (0, t.useMemo)(() => (function(e) {
                if (e.length < 2) return;
                let a = e[e.length - 1],
                    t = e[e.length - 2];
                if (a && t) return "".concat(t, " / ").concat(a)
            })(S), [S]), E = (0, t.useMemo)(() => {
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
                breadcrumbNames: L
            } = (0, t.useMemo)(() => {
                let e = e => {
                        if (e.withId) {
                            var a;
                            return null != (a = T[e.breadcrumbType]) ? a : e.displayName(x)
                        }
                        return e.displayName(x)
                    },
                    t = f.map(e => ({
                        key: e,
                        breadcrumbDetails: ei[e]
                    })).filter(e => e.breadcrumbDetails);
                if (i && g) {
                    var r;
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
                    }), o = null == (r = s.getLinkPath) ? void 0 : r.call(s, N), d = (0, a.jsx)(p.Typography, {
                        color: "primary",
                        "aria-current": "page",
                        variant: g && i ? "h3" : void 0,
                        children: e(s)
                    }, n);
                    return o ? {
                        breadcrumbsContents: [(0, a.jsx)(v.default, {
                            href: o,
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
                    var o, c;
                    let {
                        key: d,
                        breadcrumbDetails: u
                    } = n;
                    if (!u) return r;
                    if (l === t.length - 1) {
                        let t = e(u);
                        if (!t) return r;
                        let n = u.parentItemTypeName ? ei[u.parentItemTypeName] : null,
                            l = T[u.breadcrumbType];
                        if (u.withId && u.breadcrumbType === et.default.AnalyticsCustomDashboards && null !== n && void 0 !== l) {
                            let e = n.displayName(x);
                            return {
                                contents: [...r.contents, A(e, ed(s, null == (c = n.getLinkPath) ? void 0 : c.call(n, N))), A(l, P)],
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
                        let e = u.parentItemTypeName ? ei[u.parentItemTypeName] : null,
                            a = T[u.breadcrumbType];
                        return {
                            contents: r.contents.concat(w(u)),
                            names: [...r.names, ...e ? [e.displayName(x)] : [], ...a ? [a] : []]
                        }
                    }
                    let m = u.displayName(x);
                    return m ? {
                        contents: [...r.contents, A(m, null == (o = u.getLinkPath) ? void 0 : o.call(u, N))],
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
            }, [f, i, g, x, T, N, c, A, P, w, s]), R = (0, t.useMemo)(() => L[L.length - 1], [L]), j = (0, t.useMemo)(() => (0, r.buildBreadcrumb)(...L), [L]), D = H && (0, a.jsx)(r.HubMeta, {
                title: R,
                breadcrumb: j,
                seoTitle: H,
                ...E
            });
            return g ? (0, a.jsxs)(y.Grid, {
                className: i ? void 0 : m,
                children: [D, (0, a.jsx)(W, {
                    id: "navigation-breadcrumbs",
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: (i || M.length > 1) && M
                })]
            }) : b ? (0, a.jsxs)(y.Grid, {
                children: [D, (0, a.jsxs)(W, {
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: [(0, a.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: (0, a.jsx)(n.CurrentProductName, {})
                    }, "product-name"), M.slice(0, -1)]
                })]
            }) : (0, a.jsxs)(y.Grid, {
                className: "".concat(d, " ").concat(M.length > 1 && !i ? u : ""),
                children: [D, (0, a.jsx)(W, {
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
                currentItemGroupId: r
            } = (0, es.default)(), {
                isLoading: i,
                setWorkspaceByGroupId: s
            } = (0, n.useWorkspaces)();
            return (0, t.useEffect)(() => {
                !e || a || i || s(null != r ? r : null)
            }, [r, e, a, i, s]), null
        },
        ep = "applayout-scroll-container",
        ey = (0, d.default)(() => Promise.resolve(f.default), {
            ssr: !1
        }),
        eb = (0, s.withTranslation)(e => {
            var r;
            let {
                title: i,
                beta: l = !1,
                secondaryRail: o,
                pageBanner: c,
                useBreadcrumbs: d = !1,
                secondarySize: h = "small",
                omitPageTitle: f = !1,
                children: v
            } = e, {
                open: k,
                dialog: T
            } = (0, g.useStudio)(), {
                translate: N
            } = (0, s.useTranslation)(), x = (0, t.useCallback)(() => {
                k({
                    task: b.EStudioTaskType.Default
                })
            }, [k]), I = t.default.isValidElement(i) && i.type === s.Translate, C = "string" == typeof i ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: N(i)
            }) : I ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: i
            }) : null != i ? i : null;
            return (0, a.jsxs)(n.CreatorHubLayout, {
                children: [(0, a.jsx)(em, {}), T, (0, a.jsx)(n.CreatorHubLayout.Rail, {
                    openStudio: x,
                    secondarySize: h,
                    children: o
                }), (0, a.jsx)(n.CreatorHubLayout.Header, {
                    children: d ? (0, a.jsx)(eu, {
                        inLayoutHeader: !0
                    }) : (0, a.jsxs)(y.Grid, {
                        container: !0,
                        alignItems: "center",
                        gap: "8px",
                        children: [C, l && (0, a.jsx)(p.Typography, {
                            children: (0, a.jsx)(m.Label, {
                                labelText: N("Label.Beta")
                            })
                        })]
                    })
                }), (0, a.jsx)(n.CreatorHubLayout.PageContent, {
                    id: ep,
                    banner: c,
                    additionalLinks: (0, a.jsx)(ey, {
                        inline: !0
                    }),
                    children: (0, a.jsxs)("div", {
                        className: "width-full height-full",
                        children: [d && (null != (r = !f && C) ? r : l) && (0, a.jsxs)("div", {
                            className: "flex items-center gap-small padding-bottom-large",
                            children: [!f && C, l && (0, a.jsx)(p.Typography, {
                                children: (0, a.jsx)(m.Label, {
                                    labelText: N("Label.Beta")
                                })
                            })]
                        }), v, (0, a.jsx)(u.CookieConsentBanner, {})]
                    })
                })]
            })
        }, [...n.REQUIRED_TRANSLATION_NAMESPACES, h.TranslationNamespace.RightsPortal, h.TranslationNamespace.DeveloperProducts, h.TranslationNamespace.Passes, h.TranslationNamespace.Creations, h.TranslationNamespace.PageTitles, h.TranslationNamespace.Features, h.TranslationNamespace.Privacy, h.TranslationNamespace.Error, h.TranslationNamespace.Analytics, h.TranslationNamespace.TalentHubV2, h.TranslationNamespace.Licenses, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.RevenueShareAgreements, h.TranslationNamespace.TaxDocumentation]);
    e.s(["SCROLL_CONTAINER_ID", 0, ep, "default", 0, eb], 966501);
    let eg = {
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
            secondaryRail: b,
            pageBanner: g,
            omitPageTitle: h,
            analyticsAssistantChatHref: f,
            analyticsAssistantChatUniverseId: v,
            ...k
        } = e, {
            noBreadCrumbs: T,
            leftNavigationContents: N
        } = k, {
            value: x
        } = (0, i.useFlag)(o.enableGroupModerationPage), {
            translate: I
        } = (0, s.useTranslation)(), C = "string" == typeof p ? I(p) : t.default.isValidElement(p) && p.type === s.Translate ? I(p.props.translationKey, p.props.args) : void 0;
        return (0, a.jsxs)(l.NoSSR, {
            children: [T && C && (0, a.jsx)(r.HubMeta, {
                title: C
            }), (0, a.jsx)(n.NavigationConfigsProvider, {
                currentProduct: null != d ? d : "CreatorDashboard",
                environment: (0, c.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: eg,
                enableGroupModeration: null != x && x,
                analyticsAssistantChatHref: f,
                analyticsAssistantChatUniverseId: v,
                children: (0, a.jsx)(eb, {
                    beta: m,
                    title: p,
                    secondaryRail: null != b ? b : N,
                    pageBanner: g,
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
        r = e.i(79187),
        n = e.i(751846),
        i = e.i(808377),
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
            returnPolicy: b = n.ReturnPolicy.AutoGenerated,
            isStatusTextShown: g = !1,
            alt: h,
            fontColor: f = "light",
            bottomRightAdornment: v
        } = e, {
            classes: {
                imageStatusContainer: k,
                statusTextContainer: T,
                imageWrapper: N,
                imageContainer: x,
                image: I,
                bottomRightAdornmentContainer: C,
                skeleton: P
            }
        } = p("light" !== f)(), {
            translate: A
        } = (0, r.useTranslation)(), [w, S] = (0, t.useState)(!1), [H, E] = (0, t.useState)(), M = (0, t.useCallback)(async function(e, a, t) {
            let r = arguments.length > 3 && void 0 !== arguments[3] && arguments[3];
            if (a && e) {
                S(!0);
                try {
                    let i = r ? n.ThumbnailClient.reloadThumbnailImage : n.ThumbnailClient.getThumbnailImage,
                        s = await i(e, a, t);
                    E(s)
                } catch (e) {
                    E({
                        state: i.ThumbnailResponseState.TemporarilyUnavailable
                    })
                } finally {
                    S(!1)
                }
            }
        }, []), L = (0, t.useMemo)(() => {
            if (w) return (0, a.jsx)(d.Skeleton, {
                classes: {
                    root: P
                },
                variant: "rectangular",
                animate: !0
            });
            let e = "",
                t = null;
            switch (null == H ? void 0 : H.state) {
                case i.ThumbnailResponseState.InReview:
                    e = A("Label.InReview"), t = (0, a.jsx)(o.HourglassEmptyIcon, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Blocked:
                    e = A("Label.Moderated"), t = (0, a.jsx)(c.NotInterested, {
                        fontSize: "large",
                        color: "dark" === f ? void 0 : "secondary"
                    });
                    break;
                case i.ThumbnailResponseState.Error:
                case i.ThumbnailResponseState.TemporarilyUnavailable:
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
                    root: k
                },
                justifyContent: "center",
                alignItems: "center",
                children: g ? (0, a.jsxs)("div", {
                    children: [t, (0, a.jsx)(u.Typography, {
                        variant: "smallLabel1",
                        classes: {
                            root: T
                        },
                        children: e
                    })]
                }) : t
            })
        }, [w, null == H ? void 0 : H.state, k, g, T, P, A, f]);
        return (0, t.useEffect)(() => {
            M(y, m, b)
        }, [m, y, b, M]), {
            thumbnailImage: (0, a.jsx)(l.Grid, {
                item: !0,
                container: !0,
                XSmall: 12,
                justifyContent: "center",
                alignItems: "center",
                children: (0, a.jsxs)("div", {
                    className: x,
                    children: [(null == H ? void 0 : H.state) === i.ThumbnailResponseState.Completed ? (0, a.jsx)("img", {
                        className: I,
                        src: null == H ? void 0 : H.imageUrl,
                        alt: h
                    }) : (0, a.jsx)("div", {
                        className: N,
                        children: L
                    }), v ? (0, a.jsx)("div", {
                        className: C,
                        children: v
                    }) : null]
                })
            }),
            thumbnailData: H,
            refreshThumbnail: (0, t.useCallback)(async () => M(y, m, b, !0), [M, y, m, b])
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
            let [t, r] = a;
            return Array.isArray(r) ? e[t] = r.at(0) : e[t] = r, e
        }, {})
    }, "readQueryValue", 0, function(e) {
        if (null != e) return Array.isArray(e) ? e.at(0) : e
    }])
}, 174528, 87159, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        r = e.i(260241),
        n = e.i(721281),
        i = e.i(643992),
        s = e.i(278862),
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

    function d(e, a, t, r) {
        return new(t || (t = Promise))(function(n, i) {
            function s(e) {
                try {
                    o(r.next(e))
                } catch (e) {
                    i(e)
                }
            }

            function l(e) {
                try {
                    o(r.throw(e))
                } catch (e) {
                    i(e)
                }
            }

            function o(e) {
                var a;
                e.done ? n(e.value) : ((a = e.value) instanceof t ? a : new t(function(e) {
                    e(a)
                })).then(s, l)
            }
            o((r = r.apply(e, a || [])).next())
        })
    }

    function u(e, a) {
        var t, r, n, i = {
                label: 0,
                sent: function() {
                    if (1 & n[0]) throw n[1];
                    return n[1]
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
                for (; s && (s = 0, c[0] && (i = 0)), i;) try {
                    if (t = 1, r && (n = 2 & c[0] ? r.return : c[0] ? r.throw || ((n = r.return) && n.call(r), 0) : r.next) && !(n = n.call(r, c[1])).done) return n;
                    switch (r = 0, n && (c = [2 & c[0], n.value]), c[0]) {
                        case 0:
                        case 1:
                            n = c;
                            break;
                        case 4:
                            return i.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            i.label++, r = c[1], c = [0];
                            continue;
                        case 7:
                            c = i.ops.pop(), i.trys.pop();
                            continue;
                        default:
                            if (!(n = (n = i.trys).length > 0 && n[n.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                i = 0;
                                continue
                            }
                            if (3 === c[0] && (!n || c[1] > n[0] && c[1] < n[3])) {
                                i.label = c[1];
                                break
                            }
                            if (6 === c[0] && i.label < n[1]) {
                                i.label = n[1], n = c;
                                break
                            }
                            if (n && i.label < n[2]) {
                                i.label = n[2], i.ops.push(c);
                                break
                            }
                            n[2] && i.ops.pop(), i.trys.pop();
                            continue
                    }
                    c = a.call(e, i)
                } catch (e) {
                    c = [6, e], r = 0
                } finally {
                    t = n = 0
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
                var t, r, n;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, void 0 !== e.featureNames && (t.featureNames = e.featureNames), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), r = {}, [4, this.request({
                                path: "/v1/feature-access",
                                schemaPath: "/v1/feature-access",
                                method: "GET",
                                headers: r,
                                query: t
                            }, a)];
                        case 1:
                            return n = i.sent(), [2, new o.VoidApiResponse(n)]
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
                var t, r, n;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, void 0 !== e.featureName && (t.featureName = e.featureName), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.targetUserId && (t.targetUserId = e.targetUserId), e.otherUserIds && (t.otherUserIds = e.otherUserIds), r = {}, [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "GET",
                                headers: r,
                                query: t
                            }, a)];
                        case 1:
                            return n = i.sent(), [2, new o.VoidApiResponse(n)]
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
                var t, r, n;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, void 0 !== e.featureNames && (t.featureNames = e.featureNames), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), [4, this.request({
                                path: "/v1/rcc-owner-feature-access",
                                schemaPath: "/v1/rcc-owner-feature-access",
                                method: "GET",
                                headers: r,
                                query: t
                            }, a)];
                        case 1:
                            return n = i.sent(), [2, new o.VoidApiResponse(n)]
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
                var t, r, n;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, void 0 !== e.featureNames && (t.featureNames = e.featureNames), void 0 !== e.userId && (t.userId = e.userId), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), r = {}, void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (r["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-access",
                                schemaPath: "/v1/rcc-user-feature-access",
                                method: "GET",
                                headers: r,
                                query: t
                            }, a)];
                        case 1:
                            return n = i.sent(), [2, new o.VoidApiResponse(n)]
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
                var t, r, n;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, (r = {})["Content-Type"] = "application/json", void 0 !== e.robloxPlaceId && null !== e.robloxPlaceId && (r["Roblox-Place-Id"] = String(e.robloxPlaceId)), void 0 !== e.robloxGameId && null !== e.robloxGameId && (r["Roblox-Game-Id"] = String(e.robloxGameId)), [4, this.request({
                                path: "/v1/rcc-user-feature-evaluation",
                                schemaPath: "/v1/rcc-user-feature-evaluation",
                                method: "POST",
                                headers: r,
                                query: t,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        requests: void 0 === e.requests ? void 0 : null === e.requests ? null : e.requests.map(m)
                                    }
                                }(e.accessManagementAPIGetRCCUserFeatureEvaluationRequest)
                            }, a)];
                        case 1:
                            return n = i.sent(), [2, new o.VoidApiResponse(n)]
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
                var t, r, n;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, void 0 !== e.featureName && (t.featureName = e.featureName), void 0 !== e.namespace && (t.namespace = e.namespace), void 0 !== e.extraParameters && (t.extraParameters = e.extraParameters), void 0 !== e.successfulActions && (t.successfulActions = e.successfulActions), r = {}, [4, this.request({
                                path: "/v1/upsell-feature-access",
                                schemaPath: "/v1/upsell-feature-access",
                                method: "GET",
                                headers: r,
                                query: t
                            }, a)];
                        case 1:
                            return n = i.sent(), [2, new o.VoidApiResponse(n)]
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
                var t, r, n;
                return u(this, function(i) {
                    switch (i.label) {
                        case 0:
                            return t = {}, (r = {})["Content-Type"] = "application/json", [4, this.request({
                                path: "/v1/pairwise-feature-access",
                                schemaPath: "/v1/pairwise-feature-access",
                                method: "POST",
                                headers: r,
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
                            return n = i.sent(), [2, new o.VoidApiResponse(n)]
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
    }(o.BaseAPI);
    e.s(["AccessManagementAPIApi", 0, p], 87159);
    var y = e.i(897547);
    let b = new Map,
        g = async (e, a, t) => {
            let r, n, i = (r = "".concat(e, "/access-management"), (n = b.get(r)) || (n = new p(new o.Configuration({
                basePath: r,
                credentials: "include",
                enableMrRouter: !0
            })), b.set(r, n)), n);
            try {
                let e = await i.accessManagementAPIGetUpsellFeatureAccessRaw({
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
        }, k = async e => {
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
        }, T = () => !("u" < typeof navigator) && !!navigator.globalPrivacyControl, N = async e => {
            var a, t;
            if (e && (null == (t = window.evidon) || null == (a = t.notice) ? void 0 : a.showOptions)) try {
                window.evidon.notice.showOptions()
            } catch (e) {
                console.error("Failed to call Evidon API:", e)
            }
        };
    class x {
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
            e && (N(e).catch(e => {
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
            (0, n._)(this, "initialGpcState", void 0), (0, n._)(this, "evidonCleanup", null), (0, n._)(this, "initialCookiePreferences", void 0), (0, n._)(this, "currentCookiePreferences", void 0), this.initialGpcState = T(), this.initialCookiePreferences = {
                ...e
            }, this.currentCookiePreferences = {
                ...e
            }
        }
    }
    var I = e.i(79187),
        C = e.i(686762),
        P = e.i(623983),
        A = e.i(345886),
        w = e.i(697973),
        S = e.i(814975);
    let H = (0, w.makeStyles)()(() => ({
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
        E = "Title.GpcDetected",
        M = "Body.GpcDetectedSettingDisabledIneligible",
        L = "Body.GpcDetectedSettingDisabledEligible",
        R = "Body.GpcDetectedSettingEnabledIneligible",
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
            var r, n;
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
            } = (0, S.useAuthentication)(), b = !!y, g = null != (r = null == o ? void 0 : o.isAdsSellShareDataEnabled) && r, h = null != (n = null == o ? void 0 : o.canUserManageAdsSettings) && n, f = (0, t.useCallback)(e => {
                window.location.pathname.includes("/my/account") && (e.preventDefault(), window.location.href = m)
            }, [m]), v = (0, t.useCallback)(e => (0, a.jsx)(C.Link, {
                href: "https://en.help.roblox.com/hc/articles/28943243301780",
                target: "_blank",
                rel: "noreferrer",
                className: p,
                children: e
            }), [p]), k = (0, t.useCallback)(e => (0, a.jsx)(C.Link, {
                href: m,
                className: p,
                onClick: f,
                children: e
            }), [m, p, f]), T = (0, t.useMemo)(() => (0, a.jsx)("br", {}), []), N = (0, t.useCallback)((e, r) => {
                let n = (c(e, {
                        link: "",
                        hrefEnd: ""
                    }) || "").replaceAll(/{link}/g, "").replaceAll(/{hrefEnd}/g, ""),
                    i = n.split(/{aTagWithHref}|{aTagEnd}/),
                    s = e => {
                        let r = e.split(/{lineBreak}/);
                        return 1 === r.length ? e : (0, a.jsx)(a.Fragment, {
                            children: r.map((e, n) => {
                                let i = "linebreak-".concat(n, "-").concat(e.substring(0, 10));
                                return (0, a.jsxs)(t.Fragment, {
                                    children: [e, n < r.length - 1 && T]
                                }, i)
                            })
                        })
                    };
                return 3 === i.length ? (0, a.jsxs)(a.Fragment, {
                    children: [s(i[0]), r(i[1]), s(i[2])]
                }) : s(n)
            }, [c, T]);
            return (0, a.jsxs)(a.Fragment, {
                children: [(0, a.jsxs)(i.DialogBody, {
                    children: [(0, a.jsx)(i.DialogTitle, {
                        className: "text-heading-small",
                        children: l.isGpcDetected ? c(E) || "" : c("Title.NoGpcDetected") || ""
                    }), (0, a.jsx)("div", {
                        className: "text-body-medium",
                        children: (() => {
                            if (!b) {
                                let e = [{
                                        opening: "aTagStart",
                                        closing: "aTagEnd",
                                        content: v
                                    }],
                                    a = {
                                        lineBreak: T
                                    };
                                return l.isGpcDetected ? g ? d(R, e, a) : d(M, e, a) : d(j, e, a)
                            }
                            if (!l.isGpcDetected) return h ? N("Body.GpcMissingSettingEligible", k) : d(j, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: T
                            });
                            if (g) return h ? N("Body.GpcDetectedSettingEnabledEligible", k) : d(R, [{
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
                                    content: k
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
                            if ("signal-with-changes" === l.scenario) return h ? N(L, k) : d(M, e.tags, e.args);
                            let a = h ? L : M;
                            return h ? N(a, k) : d(a, e.tags, e.args)
                        })()
                    })]
                }), (0, a.jsx)(i.DialogFooter, {
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
        U = e => {
            let {
                inline: n = !1
            } = e, {
                translate: s,
                translateHTML: o
            } = (0, I.useTranslation)(), c = (0, I.useLocalization)(), d = (0, r.useCookieConsentContext)().preferences, u = (0, t.useRef)(null), m = (0, t.useRef)(!1), [p, y] = (0, t.useState)(!1), {
                classes: {
                    container: b
                }
            } = H(), {
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
                let r = {};
                return t.split("&").forEach(e => {
                    let [a, t] = e.split("=");
                    a && (r[a] = "true" === t)
                }), r
            }, []), [T, N] = (0, t.useState)({
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
                    u.current = new x(Object.keys(e).length > 0 ? e : d), m.current = !0, N(u.current.getGpcState())
                }
            }, [p, d, f]), (0, t.useEffect)(() => {
                if (u.current) {
                    let e = f(),
                        a = Object.keys(e).length > 0 ? e : d;
                    u.current.updateCookiePreferences(a);
                    let t = u.current.getGpcState();
                    N(e => e.scenario !== t.scenario || e.isGpcDetected !== t.isGpcDetected || e.hasUserMadeCookieChanges !== t.hasUserMadeCookieChanges ? t : e)
                }
            }, [d, f]), (0, t.useEffect)(() => {
                if (!u.current) return;
                let e = setInterval(() => {
                    if (u.current) {
                        let e = f(),
                            a = Object.keys(e).length > 0 ? e : d;
                        u.current.updateCookiePreferences(a);
                        let t = u.current.getGpcState();
                        N(e => e.scenario !== t.scenario || e.isGpcDetected !== t.isGpcDetected || e.hasUserMadeCookieChanges !== t.hasUserMadeCookieChanges ? t : e)
                    }
                }, 2e3);
                return () => clearInterval(e)
            }, [d, f]);
            let {
                user: C
            } = (0, S.useAuthentication)(), w = !!C, {
                data: M,
                isLoading: L
            } = (e => {
                let {
                    showModal: a,
                    gpcTrackerRef: t,
                    userSettingsApiBaseUrl: r,
                    apiGatewayBaseUrl: n,
                    isAuthenticated: i
                } = e;
                return (0, l.useQuery)({
                    queryKey: ["yourPrivacyChoicesModal", a],
                    queryFn: async () => {
                        var e, a, s;
                        let l = null != (e = null == i ? void 0 : i()) && e,
                            o = null != (a = null == (s = t.current) ? void 0 : s.getGpcState()) ? a : {
                                isGpcDetected: !1,
                                scenario: "no-signal"
                            },
                            {
                                isGpcDetected: c
                            } = o;
                        l && c && await v(r);
                        let d = !1;
                        if (l) try {
                            let {
                                access: e
                            } = await g(n, "ShouldShowAdsSettings", "account_management/UserSettingsPolicy");
                            d = "Granted" === e
                        } catch (e) {
                            console.error("Failed to check feature access:", e)
                        }
                        let u = !1;
                        if (l) try {
                            let e = await k(r);
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
                                let r = t.split("&"),
                                    n = r.some(e => {
                                        let [a, t] = e.split("=");
                                        return "GoogleAnalytics" === a && "true" === t
                                    }),
                                    i = r.some(e => {
                                        let [a, t] = e.split("=");
                                        return "RBXSource" === a && "true" === t
                                    });
                                (n || i) && (u = !0)
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
            }), R = (0, t.useMemo)(() => c.locale ? (0, I.toRobloxLocale)(c.locale) : "en_us", [c.locale]), j = (0, t.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(R);
                return "https://www.roblox.com".concat(e)
            }, [R]), U = (0, t.useCallback)(e => {
                e.preventDefault(), y(!0)
            }, []), B = (0, t.useCallback)(() => {
                y(!1)
            }, []), F = s("Label.YourPrivacyChoices") || "", O = (0, a.jsx)("button", {
                type: "button",
                onClick: U,
                style: {
                    display: "inline-flex",
                    alignItems: "center",
                    background: "none",
                    border: "none",
                    padding: 0,
                    cursor: "pointer",
                    color: "inherit"
                },
                children: (0, a.jsxs)(P.Typography, {
                    variant: "footer",
                    color: "secondary",
                    component: "span",
                    children: [F, (0, a.jsx)("img", {
                        src: "".concat("https://assets.create.roblox.com/137a87797dbf24bd81a3bd67f14a0b39383ae48d/assets", "/navigation/privacy_icon.png"),
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
                children: [n ? O : (0, a.jsx)(A.Grid, {
                    classes: {
                        root: b
                    },
                    container: !0,
                    justifyContent: "center",
                    item: !0,
                    children: O
                }), (0, a.jsx)(i.Dialog, {
                    open: p,
                    onOpenChange: B,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: s("Action.Close"),
                    children: (0, a.jsx)(i.DialogContent, {
                        children: L ? (0, a.jsxs)(i.DialogBody, {
                            children: [(0, a.jsx)(i.DialogTitle, {
                                className: "text-heading-small",
                                children: s(E) || ""
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
            return (0, a.jsx)(U, {
                inline: t
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 86027, e => {
    "use strict";
    var a = e.i(118413),
        t = e.i(726474);
    let r = async e => t.dashboard.getServerManagementUrl(e, await (0, a.isClientSessionsEnabled)({
        universeId: e
    }));
    e.s(["isObservabilityServerManagementPath", 0, e => e.includes("/observability/server-management"), "resolveServerManagementUrl", 0, r])
}, 808377, e => {
    "use strict";
    var a = e.i(620140);
    e.s(["ThumbnailResponseState", () => a.RobloxWebResponsesThumbnailsThumbnailResponseStateEnum])
}, 643992, e => {
    "use strict";
    var a = e.i(805476),
        t = e.i(197649),
        r = e.i(416340),
        n = e.i(425353),
        i = e.i(199512);
    let s = (0, r.createContext)({
            size: "Medium",
            isModal: !0,
            hasCloseAffordance: !1,
            hasMarginTop: !0,
            hasMarginBottom: !0,
            hasDescription: !1,
            type: "Default"
        }),
        l = () => {
            let e = (0, r.useContext)(s);
            if (!e) throw Error("Dialog components must be used within a Dialog");
            return e
        },
        o = {
            Small: "padding-x-large",
            Medium: "padding-x-xlarge",
            Large: "padding-x-xlarge"
        },
        c = {
            Small: "padding-top-large",
            Medium: "padding-top-xlarge",
            Large: "padding-top-xlarge"
        },
        d = {
            Small: "padding-bottom-large",
            Medium: "padding-bottom-xlarge",
            Large: "padding-bottom-xlarge"
        },
        u = e => {
            let {
                open: a,
                onOpenChange: t,
                children: i,
                size: l,
                type: o = "Default",
                isModal: c,
                hasCloseAffordance: d,
                closeLabel: u,
                hasMarginTop: m = !0,
                hasMarginBottom: p = !0,
                hasDescription: y = !1,
                experimentalDisablePointerEventsStylingOnBody: b = !1
            } = e, g = (0, r.useMemo)(() => ({
                size: l,
                isModal: c,
                type: o,
                hasCloseAffordance: d,
                closeLabel: u,
                hasMarginTop: m,
                hasMarginBottom: p,
                hasDescription: y
            }), [l, c, o, d, u, m, p, y]);
            return (0, r.useEffect)(() => {
                b && setTimeout(() => {
                    Object.assign(document.body.style, {
                        pointerEvents: "unset"
                    })
                }, 0)
            }, [b, a]), r.default.createElement(s.Provider, {
                value: g
            }, r.default.createElement(n.Root, {
                open: a,
                onOpenChange: t
            }, i))
        };
    u.displayName = "Dialog";
    let m = e => {
        let {
            children: i,
            className: s,
            style: o,
            overlayClassName: c,
            overlayStyle: d,
            onOpenAutoFocus: u,
            ...m
        } = e, {
            size: p,
            isModal: y,
            hasCloseAffordance: b,
            closeLabel: g,
            hasDescription: h
        } = l(), f = (0, t.default)("foundation-web-dialog-overlay padding-medium foundation-web-portal-zindex", y && "bg-common-backdrop", c), v = (0, t.default)("relative radius-large bg-surface-100 stroke-muted stroke-standard foundation-web-dialog-content shadow-transient-high", s);
        return r.default.createElement(n.Portal, null, r.default.createElement(n.Overlay, {
            className: f,
            style: d
        }, r.default.createElement(n.Content, {
            className: v,
            "data-size": p,
            style: o,
            onOpenAutoFocus: u,
            ...!h && {
                "aria-describedby": void 0
            },
            ...m
        }, b && r.default.createElement("div", {
            className: "absolute foundation-web-dialog-close-container"
        }, r.default.createElement(n.Close, {
            asChild: !0
        }, r.default.createElement(a.CloseAffordance, {
            variant: "OverMedia",
            size: p,
            isCircular: !0,
            "aria-label": g
        }))), i)))
    };
    m.displayName = "DialogContent";
    let p = e => {
        let {
            children: a,
            className: n,
            ...i
        } = e;
        return r.default.createElement("div", {
            className: (0, t.default)("foundation-web-dialog-hero-media", n),
            ...i
        }, a)
    };
    p.displayName = "DialogHeroMedia";
    let y = e => {
        let {
            children: a,
            className: n,
            ...i
        } = e, {
            size: s,
            hasMarginTop: u,
            hasMarginBottom: m
        } = l(), p = (0, t.default)(o[s], u && c[s], m && d[s], n);
        return r.default.createElement("div", {
            className: p,
            ...i
        }, a)
    };
    y.displayName = "DialogBody";
    let b = e => {
        let {
            children: a,
            className: t,
            hidden: s,
            ...l
        } = e, o = r.default.createElement(n.Title, {
            className: t,
            ...l
        }, a);
        return s ? r.default.createElement(i.VisuallyHidden, null, o) : o
    };
    b.displayName = "DialogTitle";
    let g = e => {
        let {
            children: a,
            className: n,
            ...i
        } = e, {
            size: s
        } = l(), c = (0, t.default)(o[s], d[s], n);
        return r.default.createElement("div", {
            className: c,
            ...i
        }, a)
    };
    g.displayName = "DialogFooter", e.s(["Dialog", 0, u, "DialogBody", 0, y, "DialogContent", 0, m, "DialogFooter", 0, g, "DialogHeroMedia", 0, p, "DialogTitle", 0, b])
}, 805476, e => {
    "use strict";
    var a = e.i(999210),
        t = e.i(562991),
        r = e.i(197649),
        n = e.i(416340);
    let i = {
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
            isCircular: c,
            className: d,
            ...u
        } = e;
        return n.default.createElement("button", {
            type: "button",
            className: (0, r.default)("foundation-web-close-affordance flex stroke-none bg-none cursor-pointer", a.interactable, s[l], i[o], c && "radius-circle", d),
            ...u
        }, n.default.createElement(a.StateLayer, null), n.default.createElement(t.Icon, {
            name: "icon-regular-x",
            size: o
        }))
    }])
}, 940042, e => {
    "use strict";
    var a = e.i(29013);
    e.s(["BrokenImageOutlinedIcon", () => a.BrokenImageOutlined])
}, 381221, e => {
    "use strict";
    var a = e.i(29013);
    e.s(["HourglassEmptyIcon", () => a.HourglassEmpty])
}]);

//# debugId=726ae6cc-0111-51db-dc35-b669be9420b9
//# sourceMappingURL=19_-x2osg3atm.js.map