;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3814ba33-1f2a-65d2-8e0b-44c5a9bd840a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 678863, 434925, e => {
    "use strict";
    var a = e.i(225226),
        r = e.i(643766),
        t = e.i(231543),
        i = e.i(130933),
        n = e.i(179183),
        s = e.i(433659);
    e.i(357159);
    var d = e.i(365434),
        l = e.i(266062),
        o = e.i(785517),
        c = e.i(927828),
        m = e.i(677484),
        u = e.i(422166),
        p = e.i(268953),
        y = e.i(908257);
    e.i(59129);
    var b = (0, l.c)((0, o.jsx)("path", {
        d: "M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"
    }), "MoreHoriz");
    let g = ["slots", "slotProps"],
        f = (0, d.s)(c.B, {
            name: "MuiBreadcrumbCollapsed"
        })(e => {
            let {
                theme: a
            } = e;
            return (0, n._)({
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
                "&:hover, &:focus": (0, n._)({}, "light" === a.palette.mode ? {
                    backgroundColor: a.palette.grey[200]
                } : {
                    backgroundColor: a.palette.grey[600]
                }),
                "&:active": (0, n._)({
                    boxShadow: a.shadows[0]
                }, "light" === a.palette.mode ? {
                    backgroundColor: (0, s.n)(a.palette.grey[200], .12)
                } : {
                    backgroundColor: (0, s.n)(a.palette.grey[600], .12)
                })
            })
        }),
        h = (0, d.s)(b)({
            width: 24,
            height: 16
        });

    function k(e) {
        let {
            slots: a = {},
            slotProps: r = {}
        } = e, t = (0, s._)(e, g);
        return (0, o.jsx)("li", {
            children: (0, o.jsx)(f, (0, n._)({
                focusRipple: !0
            }, t, {
                ownerState: e,
                children: (0, o.jsx)(h, (0, n._)({
                    as: a.CollapsedIcon,
                    ownerState: e
                }, r.collapsedIcon))
            }))
        })
    }

    function N(e) {
        return (0, s.g)("MuiBreadcrumbs", e)
    }
    var T = (0, m.g)("MuiBreadcrumbs", ["root", "ol", "li", "separator"]);
    let v = ["children", "className", "component", "slots", "slotProps", "expandText", "itemsAfterCollapse", "itemsBeforeCollapse", "maxItems", "separator"],
        x = (0, d.s)(u.T, {
            name: "MuiBreadcrumbs",
            slot: "Root",
            overridesResolver: (e, a) => [{
                ["& .".concat(T.li)]: a.li
            }, a.root]
        })({}),
        I = (0, d.s)("ol", {
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
        P = (0, d.s)("li", {
            name: "MuiBreadcrumbs",
            slot: "Separator",
            overridesResolver: (e, a) => a.separator
        })({
            display: "flex",
            userSelect: "none",
            marginLeft: 8,
            marginRight: 8
        }),
        C = r.forwardRef(function(e, a) {
            var t, i;
            let l = (0, p.u)({
                    props: e,
                    name: "MuiBreadcrumbs"
                }),
                {
                    children: c,
                    className: m,
                    component: u = "nav",
                    slots: b = {},
                    slotProps: g = {},
                    expandText: f = "Show path",
                    itemsAfterCollapse: h = 1,
                    itemsBeforeCollapse: T = 1,
                    maxItems: C = 8,
                    separator: H = "/"
                } = l,
                A = (0, s._)(l, v),
                [S, L] = r.useState(!1),
                w = (0, n._)({}, l, {
                    component: u,
                    expanded: S,
                    expandText: f,
                    itemsAfterCollapse: h,
                    itemsBeforeCollapse: T,
                    maxItems: C,
                    separator: H
                }),
                j = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, d.a)({
                        root: ["root"],
                        li: ["li"],
                        ol: ["ol"],
                        separator: ["separator"]
                    }, N, a)
                })(w),
                M = (0, y.u)({
                    elementType: b.CollapsedIcon,
                    externalSlotProps: g.collapsedIcon,
                    ownerState: w
                }),
                E = r.useRef(null),
                D = r.Children.toArray(c).filter(e => r.isValidElement(e)).map((e, a) => (0, o.jsx)("li", {
                    className: j.li,
                    children: e
                }, "child-".concat(a)));
            return (0, o.jsx)(x, (0, n._)({
                ref: a,
                component: u,
                color: "text.secondary",
                className: (0, d.c)(j.root, m),
                ownerState: w
            }, A, {
                children: (0, o.jsx)(I, {
                    className: j.ol,
                    ref: E,
                    ownerState: w,
                    children: (t = S || C && D.length <= C || T + h >= D.length ? D : [...D.slice(0, T), (0, o.jsx)(k, {
                        "aria-label": f,
                        slots: {
                            CollapsedIcon: b.CollapsedIcon
                        },
                        slotProps: {
                            collapsedIcon: M
                        },
                        onClick: () => {
                            L(!0);
                            let e = E.current.querySelector("a[href],button,[tabindex]");
                            e && e.focus()
                        }
                    }, "ellipsis"), ...D.slice(D.length - h, D.length)], i = j.separator, t.reduce((e, a, r) => (r < t.length - 1 ? e = e.concat(a, (0, o.jsx)(P, {
                        "aria-hidden": !0,
                        className: i,
                        ownerState: w,
                        children: H
                    }, "separator-".concat(r))) : e.push(a), e), []))
                })
            }))
        });
    var H = (0, t.f)({
            name: "Breadcrumbs"
        })(function(e) {
            return {
                root: (0, a._)((0, a._)({}, e.typography.body1), {
                    color: e.palette.content.muted
                })
            }
        }),
        A = (0, r.forwardRef)(function(e, t) {
            var n = e.classes,
                s = e.className,
                d = (0, a.a)(e, ["classes", "className"]),
                l = H(void 0, {
                    props: {
                        classes: (0, i.f)(n, s)
                    }
                });
            return r.default.createElement(C, (0, a._)({
                classes: l.classes
            }, d, {
                ref: t
            }))
        });
    e.s(["f", 0, A], 678863);
    var S = e.i(97782),
        L = e.i(475360),
        w = e.i(759283),
        j = e.i(767112),
        M = e.i(726474),
        E = e.i(86027),
        D = e.i(128106);
    let R = (e, a) => e.args && e.args.value ? a(e.key, {
            [e.args.param]: a(e.args.value)
        }) : a(e.key),
        B = e => {
            var a;
            let r = parseInt(null != (a = e.developerItemId) ? a : "", 10);
            return Number.isNaN(r) ? M.dashboard.configureCreatorStoreItemBasePath : M.dashboard.getConfigureCreatorStoreItemUrl(r)
        },
        z = {
            analytics: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Analytics"
                    }, a)
                },
                breadcrumbType: D.f.Catalog
            },
            observability: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Observability"
                    }, a) || "Observability"
                },
                breadcrumbType: D.f.Observability
            },
            creations: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.f.Creations,
                getLinkPath: e => (null == e ? void 0 : e.groupId) ? "/dashboard/creations?groupId=".concat(null == e ? void 0 : e.groupId) : "/dashboard/creations"
            },
            experiences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Games"
                    }, a)
                },
                breadcrumbType: D.f.Games,
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/overview")
            },
            collaborators: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Tab.Collaborators"
                    }, a)
                },
                breadcrumbType: D.f.Collaborators,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/collaborators")
            },
            badges: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Badges"
                    }, a)
                },
                breadcrumbType: D.f.Badge,
                parentItemTypeName: "associated-items",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/badges/").concat(e.badgeId, "/overview")
            },
            "referral-reward-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ReferralRewards"
                    }, a)
                },
                breadcrumbType: D.f.ReferralRewards,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/referral-reward-details"),
                parentItemTypeName: "referral-reward-details",
                withId: !0
            },
            bundle: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.f.Bundle,
                getLinkPath: e => "/dashboard/creations/bundle/".concat(e.bundleId, "/configure"),
                withId: !0
            },
            "experience-subscriptions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Subscriptions"
                    }, a)
                },
                breadcrumbType: D.f.ExperienceSubscription,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "associated-items": {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: r
                    } = e;
                    return r ? R({
                        key: w.w[r]
                    }, a) : R({
                        key: "Heading.AssociatedItems"
                    }, a)
                },
                breadcrumbType: D.f.AssociatedItems,
                getLinkPath: e => (null == e ? void 0 : e.associatedItemType) === L.f.DeveloperProduct ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/developer-products") : (null == e ? void 0 : e.associatedItemType) === L.f.ExperienceSubscription ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/subscriptions") : (null == e ? void 0 : e.associatedItemType) === L.f.GamePass ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/passes") : (null == e ? void 0 : e.associatedItemType) ? "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items?activeTab=").concat(e.associatedItemType) : "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            catalog: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.f.Catalog,
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/configure"),
                withId: !0
            },
            store: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.f.CreatorStore,
                getLinkPath: B,
                withId: !0
            },
            "version-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.VersionHistory"
                    }, a)
                },
                breadcrumbType: D.f.CreatorStore,
                getLinkPath: B,
                withId: !1
            },
            dependencies: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Dependencies"
                    }, a)
                },
                breadcrumbType: D.f.CreatorStore,
                getLinkPath: B,
                withId: !1
            },
            localization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Localization"
                    }, a)
                },
                breadcrumbType: D.f.Localization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/localization")
            },
            "activity-history": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: D.f.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            activityFeed: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ActivityFeed"
                    }, a)
                },
                breadcrumbType: D.f.ActivityHistory,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/activity-history")
            },
            notifications: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Notifications"
                    }, a)
                },
                breadcrumbType: D.f.Notifications,
                getLinkPath: e => e.baseId ? "/dashboard/creations/experiences/".concat(e.baseId, "/notifications") : "/settings/notifications"
            },
            update: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Notifications.UpdateContent"
                    }, a)
                },
                breadcrumbType: D.f.Notifications
            },
            "social-links": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.SocialLinks"
                    }, a)
                },
                breadcrumbType: D.f.SocialLinks,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/social-links")
            },
            updates: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Updates"
                    }, a)
                },
                breadcrumbType: D.f.Updates,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/updates")
            },
            translation: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Translation"
                    }, a)
                },
                breadcrumbType: D.f.Translation,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
            },
            overview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Overview"
                    }, a)
                },
                breadcrumbType: D.f.Overview
            },
            passes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.GamePass"
                    }, a)
                },
                breadcrumbType: D.f.GamePass,
                parentItemTypeName: "associated-items",
                withId: !0
            },
            "developer-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.DeveloperProduct"
                    }, a)
                },
                breadcrumbType: D.f.DeveloperProduct,
                withId: !0,
                parentItemTypeName: "associated-items"
            },
            "external-purchase-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ExternalPurchaseSettings"
                    }, a)
                },
                breadcrumbType: D.f.ExternalPurchaseSettings
            },
            "avatar-items": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Label.ThirdPartyAvatarItemCommissions"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsMonetization
            },
            "avatar-creation-tokens": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AvatarCreationTokens"
                    }, a)
                },
                getLinkPath: e => j.f.dashboard.getMonetizationAvatarCreationTokensUrl(Number(e.baseId)),
                breadcrumbType: D.f.AnalyticsMonetization
            },
            subscriptions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Label.Subscriptions"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsMonetization
            },
            commerce: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Commerce"
                    }, a)
                },
                getLinkPath: e => j.f.dashboard.getMonetizationCommerceUrl(Number(e.baseId)),
                breadcrumbType: D.f.Commerce
            },
            "create-products": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.CreateProduct"
                    }, a)
                },
                getLinkPath: e => j.f.dashboard.getMonetizationCommerceCreateProductUrl(Number(e.baseId)),
                breadcrumbType: D.f.CreateProducts
            },
            eligibility: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Eligibility"
                    }, a)
                },
                getLinkPath: () => "/settings/eligibility",
                breadcrumbType: D.f.Eligibility
            },
            "priced-assets": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PricedAssets"
                    }, a)
                },
                breadcrumbType: D.f.PricedAssets
            },
            "audio-distribution": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AudioDistribution"
                    }, a)
                },
                breadcrumbType: D.f.AudioDistribution
            },
            "paid-access": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PaidAccess"
                    }, a)
                },
                breadcrumbType: D.f.PaidAccess
            },
            "extended-services": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ExtendedServices"
                    }, a)
                },
                breadcrumbType: D.f.ExtendedServices
            },
            "public-publish": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PublicPublish"
                    }, a)
                },
                breadcrumbType: D.f.PublicPublish
            },
            "publishing-permissions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PublishingPermissions"
                    }, a)
                },
                breadcrumbType: D.f.PublishingPermissions
            },
            "us-o18-devex-rate": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.DevExO18UsSettingsNav"
                    }, a)
                },
                breadcrumbType: D.f.UsO18DevexRate
            },
            "contribution-report": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ContributionReports"
                    }, a)
                },
                breadcrumbType: D.f.ContributionReport
            },
            acquisition: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Acquisition"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsAcquisition
            },
            engagement: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Engagement"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsEngagement
            },
            retention: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Retention"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsRetention
            },
            monetization: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Monetization"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsMonetization,
                getLinkPath: e => j.f.dashboard.getMonetizationOverviewUrl(Number(e.baseId))
            },
            performance: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Xe.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsPerformance
            },
            crashes: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.aQ.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsCrashes
            },
            audience: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.gX.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsAudience
            },
            economy: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.vH.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsEconomy
            },
            funnels: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Ya.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsFunnels
            },
            journeys: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.rS.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsJourneys,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/journeys")
            },
            view: {
                displayName: () => "",
                withId: !0,
                breadcrumbType: D.f.AnalyticsJourneyDetail
            },
            edit: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Action.Edit"
                    }, a)
                },
                breadcrumbType: D.f.Create
            },
            preview: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Action.CustomDashboards.Preview"
                    }, a)
                },
                breadcrumbType: D.f.Create
            },
            errors: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Pu.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsErrorReport
            },
            "memory-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Bt.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsMemoryStores
            },
            "queue-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.IQ.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsQueueService
            },
            "data-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.jc.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsDataStores
            },
            leaderboard: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Leaderboard"
                    }, a)
                },
                breadcrumbType: D.f.Leaderboard
            },
            "http-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.jY.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsHttpServicce
            },
            "messaging-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Vs.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsMessagingService
            },
            "speech-to-text": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.k7.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsSpeechToText
            },
            "text-to-speech": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Cu.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsTextToSpeech
            },
            "video-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.D2.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsVideoService
            },
            "generative-ai": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.p_.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsGenerativeAI
            },
            custom: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Np.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticCustomEvents
            },
            explore: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.Iv.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsExploreMode
            },
            dashboards: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.dX.title.key
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsCustomDashboards,
                parentItemTypeName: "dashboards",
                withId: !0,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/analytics/dashboards")
            },
            "managed-pricing": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ManagedPricing"
                    }, a)
                },
                breadcrumbType: D.f.ManagedPricing,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/managed-pricing")
            },
            shop: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PersonalizedShop"
                    }, a)
                },
                breadcrumbType: D.f.PersonalizedShop,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/shop")
            },
            "developer-product-purchases-blocked": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.DeveloperProductPurchasesBlocked"
                    }, a)
                },
                breadcrumbType: D.f.DeveloperProductPurchasesBlocked,
                getLinkPath: e => M.dashboard.getDeveloperProductPurchasesBlockedUrl(Number(e.baseId))
            },
            "hard-coded-prices": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.HardCodedPrices"
                    }, a)
                },
                breadcrumbType: D.f.HardCodedPrices,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/hard-coded-prices")
            },
            "price-optimization": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PriceOptimization"
                    }, a)
                },
                breadcrumbType: D.f.PriceOptimization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/price-optimization")
            },
            "price-check": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.DynamicPriceCheck"
                    }, a)
                },
                breadcrumbType: D.f.PriceCheck
            },
            "immersive-ads": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Ads"
                    }, a)
                },
                breadcrumbType: D.f.ImmersiveAds,
                getLinkPath: e => j.f.dashboard.getMonetizationImmersiveAdsUrl(Number(e.baseId))
            },
            "create-placement": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AdsCreatePlacement"
                    }, a)
                },
                breadcrumbType: D.f.ImmersiveAdsCreatePlacement
            },
            "creator-rewards": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.CreatorRewards"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/creator-rewards")
            },
            "roblox-plus": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.RobloxPlusDeveloperProgram"
                    }, a)
                },
                breadcrumbType: D.f.AnalyticsMonetization,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/roblox-plus")
            },
            "experience-questionnaire": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ContentRating"
                    }, a)
                },
                breadcrumbType: D.f.Questionnaire
            },
            guidelines: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Guidelines"
                    }, a)
                },
                breadcrumbType: D.f.Questionnaire
            },
            configure: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: r
                    } = e;
                    return r === L.f.CatalogAsset || r === L.f.LibraryAsset || r === L.f.Bundle || r === L.f.Event || r === L.f.AvatarCreationToken || r === L.f.Environment || r === L.f.Look ? R({
                        key: "Heading.Configure"
                    }, a) : r === L.f.Game ? R({
                        key: "Heading.ContentSettings"
                    }, a) : r === L.f.ExperienceSubscription ? R({
                        key: "Heading.UpdateSubscription"
                    }, a) : r === L.f.Alert ? R({
                        key: "Heading.ConfigureAlert"
                    }, a) : R({
                        key: "Heading.BasicSettings"
                    }, a)
                },
                breadcrumbType: D.f.Configure
            },
            "communication-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.CommunicationSettings"
                    }, a)
                },
                breadcrumbType: D.f.CommunicationSettings,
                getLinkPath: e => "/creations/experiences/".concat(e.baseId, "/communication-settings")
            },
            sales: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Sales"
                    }, a)
                },
                breadcrumbType: D.f.Sales
            },
            promotions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Promotions"
                    }, a)
                },
                breadcrumbType: D.f.Promotions
            },
            create: {
                displayName: e => {
                    let {
                        translate: a,
                        itemType: r
                    } = e;
                    return r ? R({
                        key: "Heading.Create",
                        args: {
                            param: "itemType",
                            value: w.x[r]
                        }
                    }, a) : R({
                        key: "Heading.Create"
                    }, a)
                },
                breadcrumbType: D.f.Create
            },
            places: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Places"
                    }, a)
                },
                breadcrumbType: D.f.Places,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/places"),
                parentItemTypeName: "places",
                withId: !0
            },
            environments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Environments"
                    }, a)
                },
                breadcrumbType: D.f.Environments,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/environments"),
                parentItemTypeName: "environments",
                withId: !0
            },
            new_environment: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Action.CreateEnvironment"
                    }, a)
                },
                breadcrumbType: D.f.Environments,
                parentItemTypeName: "environments"
            },
            manage: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Manage"
                    }, a)
                },
                breadcrumbType: D.f.Manage
            },
            icon: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Icon"
                    }, a)
                },
                breadcrumbType: D.f.Icon
            },
            events: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Events"
                    }, a)
                },
                breadcrumbType: D.f.Event,
                withId: !0,
                parentItemTypeName: "events",
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/events")
            },
            "select-eligibility": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Title.SelectEligibility"
                    }, a)
                },
                breadcrumbType: D.f.SelectEligibility
            },
            thumbnails: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PlaceThumbnails"
                    }, a)
                },
                breadcrumbType: D.f.Thumbnails
            },
            videos: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PlaceVideos"
                    }, a)
                },
                breadcrumbType: D.f.Videos
            },
            access: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AccessSettings"
                    }, a)
                },
                breadcrumbType: D.f.Access
            },
            secrets: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Secrets"
                    }, a)
                },
                breadcrumbType: D.f.Secrets
            },
            matchmaking: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.CustomMatchmaking"
                    }, a)
                },
                breadcrumbType: D.f.CustomMatchmaking,
                getLinkPath: e => M.dashboard.getCustomMatchmakingDashboardUrl(Number(e.baseId))
            },
            "server-management": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ServerManagement"
                    }, a)
                },
                breadcrumbType: D.f.ServerManagement,
                getLinkPath: e => {
                    var a;
                    return M.dashboard.getServerManagementUrl(Number(e.baseId), (0, E.Y)(null != (a = e.pathname) ? a : ""))
                }
            },
            "client-sessions": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ClientSessions"
                    }, a)
                },
                breadcrumbType: D.f.ClientSessions,
                getLinkPath: e => M.dashboard.getClientSessionsUrl(Number(e.baseId))
            },
            "[sessionId]": {
                displayName: () => "",
                breadcrumbType: D.f.ClientSession,
                withId: !0
            },
            "data-captures": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.DataCaptures"
                    }, a)
                },
                breadcrumbType: D.f.DataCaptures,
                getLinkPath: e => M.dashboard.getObservabilityDataCapturesUrl(Number(e.baseId)),
                parentItemTypeName: "data-captures",
                withId: !0
            },
            "create-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.CreateConfiguration"
                    }, a)
                },
                breadcrumbType: D.f.CreateMatchmakingConfiguration
            },
            "edit-configuration": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.EditConfiguration"
                    }, a)
                },
                breadcrumbType: D.f.EditMatchmakingConfiguration
            },
            "create-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.CreateAttribute"
                    }, a)
                },
                breadcrumbType: D.f.CreateMatchmakingAttribute,
                getLinkPath: e => M.dashboard.getCustomMatchmakingAttributeCreationUrl(Number(e.baseId))
            },
            "edit-player-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.EditPlayerAttribute"
                    }, a)
                },
                breadcrumbType: D.f.EditMatchmakingPlayerAttribute
            },
            "edit-server-attribute": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.EditServerAttribute"
                    }, a)
                },
                breadcrumbType: D.f.EditMatchmakingServerAttribute
            },
            settings: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Settings"
                    }, a)
                },
                breadcrumbType: D.f.Settings
            },
            permissions: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Permissions"
                    }, a)
                },
                breadcrumbType: D.f.Permissions
            },
            webhooks: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Webhooks"
                    }, a)
                },
                breadcrumbType: D.f.Webhooks
            },
            "data-collection": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.DataSharing"
                    }, a)
                },
                breadcrumbType: D.f.DataSharing
            },
            "[notificationCategory]": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Notifications"
                    }, a)
                },
                withId: !0,
                breadcrumbType: D.f.Category
            },
            preferences: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Preferences"
                    }, a)
                },
                breadcrumbType: D.f.Preferences
            },
            advanced: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Header.Title"
                    }, a)
                },
                breadcrumbType: D.f.Advanced
            },
            bans: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Moderation"
                    }, a)
                },
                breadcrumbType: D.f.Bans,
                getLinkPath: e => j.f.dashboard.getUserBansUrl(Number(e.baseId))
            },
            "anti-cheat": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AntiCheat"
                    }, a)
                },
                breadcrumbType: D.f.AntiCheat,
                getLinkPath: e => j.f.dashboard.getAntiCheatUrl(Number(e.baseId))
            },
            "issues-and-appeals": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.IssuesAndAppeals"
                    }, a)
                },
                breadcrumbType: D.f.IssuesAndAppeals,
                getLinkPath: e => j.f.dashboard.getIssuesAndAppealsUrl(Number(e.baseId))
            },
            "[violationId]": {
                displayName: () => "",
                breadcrumbType: D.f.GameViolation,
                withId: !0
            },
            add: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AddUsersToBan"
                    }, a)
                },
                breadcrumbType: D.f.Add
            },
            reorder: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Reorder"
                    }, a)
                },
                breadcrumbType: D.f.Reorder
            },
            feedback: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Feedback"
                    }, a)
                },
                breadcrumbType: D.f.Feedback
            },
            "api-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.APISettings"
                    }, a)
                },
                breadcrumbType: D.f.ApiSettings
            },
            configs: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Configs"
                    }, a)
                },
                breadcrumbType: D.f.Configs,
                getLinkPath: e => j.f.dashboard.getAnalyticsConfigsUrl(Number(e.baseId))
            },
            experiments: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Experiments"
                    }, a)
                },
                breadcrumbType: D.f.Experiments,
                getLinkPath: e => j.f.dashboard.getExperimentsUrl(Number(e.baseId))
            },
            "experiment-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ExperimentCreate"
                    }, a)
                },
                breadcrumbType: D.f.ExperimentCreate
            },
            "experiment-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ExperimentDetails"
                    }, a)
                },
                breadcrumbType: D.f.ExperimentDetails,
                withId: !0
            },
            alerts: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Alerts"
                    }, a)
                },
                breadcrumbType: D.f.Alerts,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/alerts"),
                parentItemTypeName: "alerts",
                withId: !0
            },
            history: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ConfigsHistory"
                    }, a)
                },
                breadcrumbType: D.f.ConfigsHistory
            },
            "config-create": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ConfigCreate"
                    }, a)
                },
                breadcrumbType: D.f.ConfigCreate
            },
            variants: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Variants"
                    }, a)
                },
                getLinkPath: e => "/dashboard/creations/catalog/".concat(e.assetId, "/variants"),
                breadcrumbType: D.f.Catalog
            },
            look: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.Creations"
                    }, a)
                },
                breadcrumbType: D.f.Look,
                getLinkPath: e => "/dashboard/creations/look/".concat(e.lookId, "/configure"),
                withId: !0
            },
            "audience-reach": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AudienceReach"
                    }, a)
                },
                breadcrumbType: D.f.AudienceReach,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/audience-reach")
            },
            "game-details": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.GameDetails"
                    }, a)
                },
                breadcrumbType: D.f.GameDetails
            },
            "content-rating": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ContentRating"
                    }, a)
                },
                breadcrumbType: D.f.ContentRating
            },
            "advanced-settings": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AdvancedSettings"
                    }, a)
                },
                breadcrumbType: D.f.AdvancedSettings
            },
            "game-join": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.AdvancedSettings"
                    }, a)
                },
                breadcrumbType: D.f.GameJoin
            },
            "manage-audience": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.ManageAudience"
                    }, a)
                },
                breadcrumbType: D.f.Publishing
            },
            "player-support": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: "Heading.PlayerSupport"
                    }, a)
                },
                breadcrumbType: D.f.PlayerSupport,
                getLinkPath: e => "/dashboard/creations/experiences/".concat(e.baseId, "/player-support")
            },
            "[ticketId]": {
                displayName: () => "",
                breadcrumbType: D.f.PlayerSupportTicket
            },
            "recommendation-service": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return R({
                        key: S.pj.title.key
                    }, a)
                },
                breadcrumbType: D.f.RecommendationService
            }
        };
    e.s(["f", 0, z], 434925)
}, 177608, 966501, e => {
    "use strict";
    var a = e.i(785517),
        r = e.i(643766),
        t = e.i(37819),
        i = e.i(602635),
        n = e.i(500758),
        s = e.i(79187),
        d = e.i(649499),
        l = e.i(665869),
        o = e.i(729904),
        c = e.i(458263),
        m = e.i(260241),
        u = e.i(887545),
        p = e.i(47277),
        y = e.i(870999),
        b = e.i(581577),
        g = e.i(894854),
        f = e.i(881670),
        h = e.i(174528),
        k = e.i(918720),
        N = e.i(341260),
        T = e.i(678863),
        v = e.i(446475),
        x = e.i(350898),
        I = e.i(114209),
        P = e.i(434925),
        C = e.i(128106),
        H = e.i(509049),
        A = e.i(634877);
    let S = (0, e.i(67243).f)()(e => ({
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
        L = (e, a) => a && e.replaceAll(/\[[^\]]*?\]/g, "") === (null == a ? void 0 : a.replaceAll(/\d+/g, "")) ? void 0 : a,
        w = (0, s.K)(e => {
            let {
                inLayoutHeader: n = !1
            } = e, {
                pathname: s,
                query: d
            } = (0, N.useRouter)(), {
                classes: {
                    linkStyle: l,
                    compactBreadCrumbLinkStyle: o,
                    breadcrumb: c,
                    breadcrumbBottomSpace: m,
                    compactBreadCrumb: u
                }
            } = S(), {
                insideTopNavigationDrawer: b
            } = (0, A.f)(), g = (0, x.f)(e => e.breakpoints.down("Medium")), {
                gameDetails: f
            } = (0, I.i)(), h = (0, r.useMemo)(() => {
                let e = s.includes("/analytics/dashboards/");
                return s.split("/").filter(e => !!e).filter(a => "analytics" !== a || !e)
            }, [s]), {
                itemNameMapping: w,
                pathLinkParams: j,
                displayNameParam: M
            } = (0, H.f)(), E = "string" == typeof d.dashboardId ? d.dashboardId : void 0, D = "string" == typeof d.id ? d.id : void 0, R = s.endsWith("/analytics/dashboards/[dashboardId]/edit") && D && E ? "/dashboard/creations/experiences/".concat(D, "/analytics/dashboards/").concat(E) : void 0, B = (0, r.useCallback)((e, r) => b ? r ? (0, a.jsx)(k.default, {
                href: r,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(v.f, {
                    underline: "always",
                    color: "inherit",
                    children: (0, a.jsx)(p.f, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: e
                    })
                })
            }, e) : (0, a.jsx)(p.f, {
                color: "primary",
                variant: "largeLabel1",
                children: e
            }, e) : r ? (0, a.jsx)(k.default, {
                href: r,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(v.f, {
                    classes: {
                        root: l
                    },
                    children: e
                })
            }, e) : (0, a.jsx)(p.f, {
                color: "secondary",
                children: e
            }, e), [b, l]), z = (0, r.useCallback)(e => {
                var a, r;
                let t = e.parentItemTypeName ? P.f[e.parentItemTypeName] : null,
                    i = w[e.breadcrumbType],
                    n = e.breadcrumbType === C.f.AnalyticsCustomDashboards && R ? R : void 0,
                    d = null != n ? n : null == (a = e.getLinkPath) ? void 0 : a.call(e, j),
                    l = void 0 !== n || null === t || e.breadcrumbType !== t.breadcrumbType;
                return [t ? B(t.displayName(M), L(s, null == (r = t.getLinkPath) ? void 0 : r.call(t, j))) : null, i ? B(i, l ? L(s, d) : void 0) : null]
            }, [w, j, B, M, s, R]), U = (0, r.useMemo)(() => {
                var e;
                let a;
                return e = P.f, a = [], h.filter(a => e[a]).forEach(r => {
                    let t = e[r],
                        i = t.displayName(M);
                    if (i && a.push(i), t.withId) {
                        let e = w[t.breadcrumbType];
                        e && a.push(e)
                    }
                }), a
            }, [h, M, w]), O = (0, r.useMemo)(() => (function(e) {
                if (e.length < 2) return;
                let a = e[e.length - 1],
                    r = e[e.length - 2];
                if (a && r) return "".concat(r, " / ").concat(a)
            })(U), [U]), _ = (0, r.useMemo)(() => {
                var e, a;
                return s.includes("/experiences/") ? {
                    description: null == f ? void 0 : f.name,
                    author: null == f || null == (e = f.creator) ? void 0 : e.name,
                    entityName: null == f ? void 0 : f.name,
                    entityId: null == f || null == (a = f.id) ? void 0 : a.toString(),
                    type: "experience"
                } : {}
            }, [s, f]), {
                breadcrumbsContents: G,
                breadcrumbNames: V
            } = (0, r.useMemo)(() => {
                let e = e => {
                        if (e.withId) {
                            var a;
                            return null != (a = w[e.breadcrumbType]) ? a : e.displayName(M)
                        }
                        return e.displayName(M)
                    },
                    r = h.map(e => ({
                        key: e,
                        breadcrumbDetails: P.f[e]
                    })).filter(e => e.breadcrumbDetails);
                if (n && g) {
                    var t;
                    if (0 === r.length) return {
                        breadcrumbsContents: [],
                        breadcrumbNames: []
                    };
                    let {
                        key: i,
                        breadcrumbDetails: s
                    } = r[0], d = r.map(a => {
                        let {
                            breadcrumbDetails: r
                        } = a;
                        return e(r)
                    }), l = null == (t = s.getLinkPath) ? void 0 : t.call(s, j), c = (0, a.jsx)(p.f, {
                        color: "primary",
                        "aria-current": "page",
                        variant: g && n ? "h3" : void 0,
                        children: e(s)
                    }, i);
                    return l ? {
                        breadcrumbsContents: [(0, a.jsx)(k.default, {
                            href: l,
                            className: o,
                            children: c
                        }, i)],
                        breadcrumbNames: d
                    } : {
                        breadcrumbsContents: [c],
                        breadcrumbNames: d
                    }
                }
                let {
                    contents: i,
                    names: d
                } = r.reduce((t, i, d) => {
                    var l, o;
                    let {
                        key: c,
                        breadcrumbDetails: m
                    } = i;
                    if (!m) return t;
                    if (d === r.length - 1) {
                        let r = e(m);
                        if (!r) return t;
                        let i = m.parentItemTypeName ? P.f[m.parentItemTypeName] : null,
                            d = w[m.breadcrumbType];
                        if (m.withId && m.breadcrumbType === C.f.AnalyticsCustomDashboards && null !== i && void 0 !== d) {
                            let e = i.displayName(M);
                            return {
                                contents: [...t.contents, B(e, L(s, null == (o = i.getLinkPath) ? void 0 : o.call(i, j))), B(d, R)],
                                names: [...t.names, e, d]
                            }
                        }
                        return {
                            contents: [...t.contents, (0, a.jsx)(p.f, {
                                color: "primary",
                                "aria-current": "page",
                                variant: g && n ? "h3" : void 0,
                                children: r
                            }, c)],
                            names: [...t.names, r]
                        }
                    }
                    if (m.withId) {
                        let e = m.parentItemTypeName ? P.f[m.parentItemTypeName] : null,
                            a = w[m.breadcrumbType];
                        return {
                            contents: t.contents.concat(z(m)),
                            names: [...t.names, ...e ? [e.displayName(M)] : [], ...a ? [a] : []]
                        }
                    }
                    let u = m.displayName(M);
                    return u ? {
                        contents: [...t.contents, B(u, null == (l = m.getLinkPath) ? void 0 : l.call(m, j))],
                        names: [...t.names, u]
                    } : t
                }, {
                    contents: [],
                    names: []
                });
                return {
                    breadcrumbsContents: i,
                    breadcrumbNames: d
                }
            }, [h, n, g, M, w, j, o, B, R, z, s]), F = (0, r.useMemo)(() => V[V.length - 1], [V]), q = (0, r.useMemo)(() => (0, t.A)(...V), [V]), W = O && (0, a.jsx)(t.i, {
                title: F,
                breadcrumb: q,
                seoTitle: O,
                ..._
            });
            return g ? (0, a.jsxs)(y.f, {
                className: n ? void 0 : u,
                children: [W, (0, a.jsx)(T.f, {
                    id: "navigation-breadcrumbs",
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: (n || G.length > 1) && G
                })]
            }) : b ? (0, a.jsxs)(y.f, {
                children: [W, (0, a.jsxs)(T.f, {
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: [(0, a.jsx)(p.f, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: (0, a.jsx)(i.$, {})
                    }, "product-name"), G.slice(0, -1)]
                })]
            }) : (0, a.jsxs)(y.f, {
                className: "".concat(c, " ").concat(G.length > 1 && !n ? m : ""),
                children: [W, (0, a.jsx)(T.f, {
                    id: "navigation-breadcrumbs",
                    maxItems: 8,
                    "aria-label": "breadcrumb",
                    children: G.length > 1 && G
                }), " "]
            })
        }, [f.f.Creations, f.f.AudienceReach, f.f.Features, f.f.AssetTypes, f.f.SendrNotificationPreferences, f.f.Advanced, f.f.OpenCloud, f.f.Error, f.f.DataCollectionSettings, f.f.UnifiedNavigation, f.f.Payouts, f.f.Matchmaking, f.f.Environments, f.f.Navigation, f.f.MarketplaceOnboarding, f.f.PublicPublish, f.f.ExperienceAlerts, f.f.PlayerFeedback, f.f.DevEx, f.f.Publishing]),
        j = () => {
            let {
                currentItemType: e,
                isCurrentItemLoading: a,
                currentItemGroupId: t,
                hasCurrentItemLoadError: n
            } = (0, H.f)(), {
                isLoading: s,
                setWorkspaceByGroupId: d
            } = (0, i.y)();
            return (0, r.useEffect)(() => {
                !e || a || n || s || d(null != t ? t : null)
            }, [t, e, n, a, s, d]), null
        },
        M = "applayout-scroll-container",
        E = (0, c.default)(() => Promise.resolve(h.default), {
            ssr: !1
        }),
        D = (0, s.K)(e => {
            var t;
            let {
                title: n,
                beta: d = !1,
                secondaryRail: l,
                pageBanner: o,
                useBreadcrumbs: c = !1,
                secondarySize: f = "small",
                omitPageTitle: h = !1,
                children: k
            } = e, {
                open: N,
                dialog: T
            } = (0, g.f)(), {
                translate: v
            } = (0, s.A)(), x = (0, r.useCallback)(() => {
                N({
                    task: b.e.Default
                })
            }, [N]), I = r.default.isValidElement(n) && n.type === s.c, P = "string" == typeof n ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: v(n)
            }) : I ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: n
            }) : null != n ? n : null;
            return (0, a.jsxs)(i.p, {
                children: [(0, a.jsx)(j, {}), T, (0, a.jsx)(i.p.Rail, {
                    openStudio: x,
                    secondarySize: f,
                    children: l
                }), (0, a.jsx)(i.p.Header, {
                    children: c ? (0, a.jsx)(w, {
                        inLayoutHeader: !0
                    }) : (0, a.jsxs)(y.f, {
                        container: !0,
                        alignItems: "center",
                        gap: "8px",
                        children: [P, d && (0, a.jsx)(p.f, {
                            children: (0, a.jsx)(u.f, {
                                labelText: v("Label.Beta")
                            })
                        })]
                    })
                }), (0, a.jsx)(i.p.PageContent, {
                    id: M,
                    banner: o,
                    additionalLinks: (0, a.jsx)(E, {
                        inline: !0
                    }),
                    children: (0, a.jsxs)("div", {
                        className: "width-full height-full",
                        children: [c && (null != (t = !h && P) ? t : d) && (0, a.jsxs)("div", {
                            className: "flex items-center gap-small padding-bottom-large",
                            children: [!h && P, d && (0, a.jsx)(p.f, {
                                children: (0, a.jsx)(u.f, {
                                    labelText: v("Label.Beta")
                                })
                            })]
                        }), k, (0, a.jsx)(m.n, {})]
                    })
                })]
            })
        }, [...i.d, f.f.RightsPortal, f.f.DeveloperProducts, f.f.Passes, f.f.Creations, f.f.PageTitles, f.f.Features, f.f.Privacy, f.f.Error, f.f.Analytics, f.f.TalentHubV2, f.f.Licenses, f.f.PlayerFeedback, f.f.RevenueShareAgreements, f.f.TaxDocumentation]);
    e.s(["X", 0, M, "U", 0, D], 966501);
    let R = {
        enabled: !0,
        isFetched: !0
    };
    e.s(["f", 0, e => {
        let {
            product: c,
            children: m,
            beta: u,
            title: p,
            secondarySize: y = "large",
            secondaryRail: b,
            pageBanner: g,
            omitPageTitle: f,
            analyticsAssistantChatHref: h,
            analyticsAssistantChatUniverseId: k,
            ...N
        } = e, {
            noBreadCrumbs: T,
            leftNavigationContents: v
        } = N, {
            value: x
        } = (0, n.f)(l.Y), {
            translate: I
        } = (0, s.A)(), P = "string" == typeof p ? I(p) : r.default.isValidElement(p) && p.type === s.c ? I(p.props.translationKey, p.props.args) : void 0;
        return (0, a.jsxs)(d.f, {
            children: [T && P && (0, a.jsx)(t.i, {
                title: P
            }), (0, a.jsx)(i.b, {
                currentProduct: null != c ? c : "CreatorDashboard",
                environment: (0, o.f)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: R,
                enableGroupModeration: null != x && x,
                analyticsAssistantChatHref: h,
                analyticsAssistantChatUniverseId: k,
                children: (0, a.jsx)(D, {
                    beta: u,
                    title: p,
                    secondaryRail: null != b ? b : v,
                    pageBanner: g,
                    useBreadcrumbs: !T,
                    secondarySize: y,
                    omitPageTitle: f,
                    children: m
                })
            })]
        })
    }], 177608)
}, 634877, e => {
    "use strict";
    var a = e.i(643766);
    let r = (0, a.createContext)({
        insideTopNavigationDrawer: !1
    });
    r.displayName = "TopNavigationSidebarDrawerContext", e.s(["f", 0, function() {
        return (0, a.useContext)(r)
    }], 634877)
}]);

//# debugId=3814ba33-1f2a-65d2-8e0b-44c5a9bd840a
//# sourceMappingURL=17vh9wd3gnn-i.js.map