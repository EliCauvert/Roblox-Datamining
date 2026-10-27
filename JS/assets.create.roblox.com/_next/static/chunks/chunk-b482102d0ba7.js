;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "837e1732-8565-e202-9e51-283fb6b1ef8b")
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
}, 177608, 966501, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        r = e.i(37819),
        n = e.i(602635),
        i = e.i(629450),
        s = e.i(79187),
        l = e.i(137467),
        o = e.i(665869),
        c = e.i(729904),
        d = e.i(507742),
        u = e.i(260241),
        m = e.i(84755),
        p = e.i(611043),
        y = e.i(537683),
        b = e.i(581577),
        g = e.i(894854),
        h = e.i(881670),
        f = e.i(174528),
        v = e.i(537068),
        k = e.i(589624),
        T = e.i(774756),
        N = e.i(253738),
        I = e.i(87034),
        x = e.i(114209),
        C = e.i(434925),
        P = e.i(128106),
        A = e.i(509049),
        w = e.i(634877);
    let S = (0, e.i(695763).makeStyles)()(e => ({
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
        H = (e, a) => a && e.replaceAll(/\[[^\]]*?\]/g, "") === (null == a ? void 0 : a.replaceAll(/\d+/g, "")) ? void 0 : a,
        E = (0, s.withTranslation)(e => {
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
            } = S(), {
                insideTopNavigationDrawer: b
            } = (0, w.default)(), g = (0, I.useMediaQuery)(e => e.breakpoints.down("Medium")), {
                gameDetails: h
            } = (0, x.useCurrentGame)(), f = (0, t.useMemo)(() => {
                let e = s.includes("/analytics/dashboards/");
                return s.split("/").filter(e => !!e).filter(a => "analytics" !== a || !e)
            }, [s]), {
                itemNameMapping: E,
                pathLinkParams: M,
                displayNameParam: R
            } = (0, A.default)(), L = "string" == typeof l.dashboardId ? l.dashboardId : void 0, D = "string" == typeof l.id ? l.id : void 0, j = s.endsWith("/analytics/dashboards/[dashboardId]/edit") && D && L ? "/dashboard/creations/experiences/".concat(D, "/analytics/dashboards/").concat(L) : void 0, G = (0, t.useCallback)((e, t) => b ? t ? (0, a.jsx)(v.default, {
                href: t,
                passHref: !0,
                legacyBehavior: !0,
                children: (0, a.jsx)(N.Link, {
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
                children: (0, a.jsx)(N.Link, {
                    classes: {
                        root: o
                    },
                    children: e
                })
            }, e) : (0, a.jsx)(p.Typography, {
                color: "secondary",
                children: e
            }, e), [b, o]), B = (0, t.useCallback)(e => {
                var a, t;
                let r = e.parentItemTypeName ? C.RouterParseItemToBreadcrumbItemDetails[e.parentItemTypeName] : null,
                    n = E[e.breadcrumbType],
                    i = e.breadcrumbType === P.default.AnalyticsCustomDashboards && j ? j : void 0,
                    l = null != i ? i : null == (a = e.getLinkPath) ? void 0 : a.call(e, M),
                    o = void 0 !== i || null === r || e.breadcrumbType !== r.breadcrumbType;
                return [r ? G(r.displayName(R), H(s, null == (t = r.getLinkPath) ? void 0 : t.call(r, M))) : null, n ? G(n, o ? H(s, l) : void 0) : null]
            }, [E, M, G, R, s, j]), U = (0, t.useMemo)(() => {
                var e;
                let a;
                return e = C.RouterParseItemToBreadcrumbItemDetails, a = [], f.filter(a => e[a]).forEach(t => {
                    let r = e[t],
                        n = r.displayName(R);
                    if (n && a.push(n), r.withId) {
                        let e = E[r.breadcrumbType];
                        e && a.push(e)
                    }
                }), a
            }, [f, R, E]), F = (0, t.useMemo)(() => (function(e) {
                if (e.length < 2) return;
                let a = e[e.length - 1],
                    t = e[e.length - 2];
                if (a && t) return "".concat(t, " / ").concat(a)
            })(U), [U]), O = (0, t.useMemo)(() => {
                var e, a;
                return s.includes("/experiences/") ? {
                    description: null == h ? void 0 : h.name,
                    author: null == h || null == (e = h.creator) ? void 0 : e.name,
                    entityName: null == h ? void 0 : h.name,
                    entityId: null == h || null == (a = h.id) ? void 0 : a.toString(),
                    type: "experience"
                } : {}
            }, [s, h]), {
                breadcrumbsContents: z,
                breadcrumbNames: _
            } = (0, t.useMemo)(() => {
                let e = e => {
                        if (e.withId) {
                            var a;
                            return null != (a = E[e.breadcrumbType]) ? a : e.displayName(R)
                        }
                        return e.displayName(R)
                    },
                    t = f.map(e => ({
                        key: e,
                        breadcrumbDetails: C.RouterParseItemToBreadcrumbItemDetails[e]
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
                    }), o = null == (r = s.getLinkPath) ? void 0 : r.call(s, M), d = (0, a.jsx)(p.Typography, {
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
                        let n = u.parentItemTypeName ? C.RouterParseItemToBreadcrumbItemDetails[u.parentItemTypeName] : null,
                            l = E[u.breadcrumbType];
                        if (u.withId && u.breadcrumbType === P.default.AnalyticsCustomDashboards && null !== n && void 0 !== l) {
                            let e = n.displayName(R);
                            return {
                                contents: [...r.contents, G(e, H(s, null == (c = n.getLinkPath) ? void 0 : c.call(n, M))), G(l, j)],
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
                        let e = u.parentItemTypeName ? C.RouterParseItemToBreadcrumbItemDetails[u.parentItemTypeName] : null,
                            a = E[u.breadcrumbType];
                        return {
                            contents: r.contents.concat(B(u)),
                            names: [...r.names, ...e ? [e.displayName(R)] : [], ...a ? [a] : []]
                        }
                    }
                    let m = u.displayName(R);
                    return m ? {
                        contents: [...r.contents, G(m, null == (o = u.getLinkPath) ? void 0 : o.call(u, M))],
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
            }, [f, i, g, R, E, M, c, G, j, B, s]), q = (0, t.useMemo)(() => _[_.length - 1], [_]), V = (0, t.useMemo)(() => (0, r.buildBreadcrumb)(..._), [_]), W = F && (0, a.jsx)(r.HubMeta, {
                title: q,
                breadcrumb: V,
                seoTitle: F,
                ...O
            });
            return g ? (0, a.jsxs)(y.Grid, {
                className: i ? void 0 : m,
                children: [W, (0, a.jsx)(T.Breadcrumbs, {
                    id: "navigation-breadcrumbs",
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: (i || z.length > 1) && z
                })]
            }) : b ? (0, a.jsxs)(y.Grid, {
                children: [W, (0, a.jsxs)(T.Breadcrumbs, {
                    maxItems: 3,
                    "aria-label": "breadcrumb",
                    children: [(0, a.jsx)(p.Typography, {
                        color: "primary",
                        variant: "largeLabel1",
                        children: (0, a.jsx)(n.CurrentProductName, {})
                    }, "product-name"), z.slice(0, -1)]
                })]
            }) : (0, a.jsxs)(y.Grid, {
                className: "".concat(d, " ").concat(z.length > 1 && !i ? u : ""),
                children: [W, (0, a.jsx)(T.Breadcrumbs, {
                    id: "navigation-breadcrumbs",
                    maxItems: 8,
                    "aria-label": "breadcrumb",
                    children: z.length > 1 && z
                }), " "]
            })
        }, [h.TranslationNamespace.Creations, h.TranslationNamespace.AudienceReach, h.TranslationNamespace.Features, h.TranslationNamespace.AssetTypes, h.TranslationNamespace.SendrNotificationPreferences, h.TranslationNamespace.Advanced, h.TranslationNamespace.OpenCloud, h.TranslationNamespace.Error, h.TranslationNamespace.DataCollectionSettings, h.TranslationNamespace.UnifiedNavigation, h.TranslationNamespace.Payouts, h.TranslationNamespace.Matchmaking, h.TranslationNamespace.Environments, h.TranslationNamespace.Navigation, h.TranslationNamespace.MarketplaceOnboarding, h.TranslationNamespace.PublicPublish, h.TranslationNamespace.ExperienceAlerts, h.TranslationNamespace.PlayerFeedback, h.TranslationNamespace.DevEx, h.TranslationNamespace.Publishing]),
        M = () => {
            let {
                currentItemType: e,
                isCurrentItemLoading: a,
                currentItemGroupId: r,
                hasCurrentItemLoadError: i
            } = (0, A.default)(), {
                isLoading: s,
                setWorkspaceByGroupId: l
            } = (0, n.useWorkspaces)();
            return (0, t.useEffect)(() => {
                !e || a || i || s || l(null != r ? r : null)
            }, [r, e, i, a, s, l]), null
        },
        R = "applayout-scroll-container",
        L = (0, d.default)(() => Promise.resolve(f.default), {
            ssr: !1
        }),
        D = (0, s.withTranslation)(e => {
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
            } = (0, s.useTranslation)(), I = (0, t.useCallback)(() => {
                k({
                    task: b.EStudioTaskType.Default
                })
            }, [k]), x = t.default.isValidElement(i) && i.type === s.Translate, C = "string" == typeof i ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: N(i)
            }) : x ? (0, a.jsx)("h1", {
                className: "text-heading-large margin-none",
                children: i
            }) : null != i ? i : null;
            return (0, a.jsxs)(n.CreatorHubLayout, {
                children: [(0, a.jsx)(M, {}), T, (0, a.jsx)(n.CreatorHubLayout.Rail, {
                    openStudio: I,
                    secondarySize: h,
                    children: o
                }), (0, a.jsx)(n.CreatorHubLayout.Header, {
                    children: d ? (0, a.jsx)(E, {
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
                    id: R,
                    banner: c,
                    additionalLinks: (0, a.jsx)(L, {
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
    e.s(["SCROLL_CONTAINER_ID", 0, R, "default", 0, D], 966501);
    let j = {
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
            value: I
        } = (0, i.useFlag)(o.enableGroupModerationPage), {
            translate: x
        } = (0, s.useTranslation)(), C = "string" == typeof p ? x(p) : t.default.isValidElement(p) && p.type === s.Translate ? x(p.props.translationKey, p.props.args) : void 0;
        return (0, a.jsxs)(l.NoSSR, {
            children: [T && C && (0, a.jsx)(r.HubMeta, {
                title: C
            }), (0, a.jsx)(n.NavigationConfigsProvider, {
                currentProduct: null != d ? d : "CreatorDashboard",
                environment: (0, c.default)(),
                robloxEnvironment: "production",
                target: "global",
                drawerVariant: "belowAppBar",
                signalRCrossTab: j,
                enableGroupModeration: null != I && I,
                analyticsAssistantChatHref: f,
                analyticsAssistantChatUniverseId: v,
                children: (0, a.jsx)(D, {
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
}, 450639, 51620, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        r = e.i(79187),
        n = e.i(958885),
        i = e.i(808377),
        s = e.i(401602),
        l = e.i(537683),
        o = e.i(761563),
        c = e.i(484613);
    e.s(["NotInterestedIcon", () => c.NotInterested], 51620);
    var c = c,
        d = e.i(338078),
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
                imageContainer: I,
                image: x,
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
        }, []), R = (0, t.useMemo)(() => {
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
                    className: I,
                    children: [(null == H ? void 0 : H.state) === i.ThumbnailResponseState.Completed ? (0, a.jsx)("img", {
                        className: x,
                        src: null == H ? void 0 : H.imageUrl,
                        alt: h
                    }) : (0, a.jsx)("div", {
                        className: N,
                        children: R
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
    var x = e.i(79187),
        C = e.i(253738),
        P = e.i(611043),
        A = e.i(537683),
        w = e.i(695763),
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
        R = "Body.GpcDetectedSettingDisabledEligible",
        L = "Body.GpcDetectedSettingEnabledIneligible",
        D = "Body.GpcMissingSettingIneligible",
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
                                return l.isGpcDetected ? g ? d(L, e, a) : d(M, e, a) : d(D, e, a)
                            }
                            if (!l.isGpcDetected) return h ? N("Body.GpcMissingSettingEligible", k) : d(D, [{
                                opening: "aTagStart",
                                closing: "aTagEnd",
                                content: v
                            }], {
                                lineBreak: T
                            });
                            if (g) return h ? N("Body.GpcDetectedSettingEnabledEligible", k) : d(L, [{
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
                            if ("signal-with-changes" === l.scenario) return h ? N(R, k) : d(M, e.tags, e.args);
                            let a = h ? R : M;
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
        B = e => {
            let {
                inline: n = !1
            } = e, {
                translate: s,
                translateHTML: o
            } = (0, x.useTranslation)(), c = (0, x.useLocalization)(), d = (0, r.useCookieConsentContext)().preferences, u = (0, t.useRef)(null), m = (0, t.useRef)(!1), [p, y] = (0, t.useState)(!1), {
                classes: {
                    container: b
                }
            } = H(), {
                classes: h
            } = j(), f = (0, t.useCallback)(() => {
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
                    u.current = new I(Object.keys(e).length > 0 ? e : d), m.current = !0, N(u.current.getGpcState())
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
                isLoading: R
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
            }), L = (0, t.useMemo)(() => c.locale ? (0, x.toRobloxLocale)(c.locale) : "en_us", [c.locale]), D = (0, t.useMemo)(() => {
                let e = "/my/account#!/privacy/AdPreferences?locale=".concat(L);
                return "https://www.roblox.com".concat(e)
            }, [L]), B = (0, t.useCallback)(e => {
                e.preventDefault(), y(!0)
            }, []), U = (0, t.useCallback)(() => {
                y(!1)
            }, []), F = s("Label.YourPrivacyChoices") || "", O = (0, a.jsx)("button", {
                type: "button",
                onClick: B,
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
                        src: "".concat("https://assets.create.roblox.com/4c911cd452dcbbc3cd49c7458128a242d2a87e28/assets", "/navigation/privacy_icon.png"),
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
                    onOpenChange: U,
                    size: "Small",
                    isModal: !0,
                    hasCloseAffordance: !0,
                    closeLabel: s("Action.Close"),
                    children: (0, a.jsx)(i.DialogContent, {
                        children: R ? (0, a.jsxs)(i.DialogBody, {
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
                            handleClose: U,
                            privacyPreferencesUrl: D,
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
            return (0, a.jsx)(B, {
                inline: t
            })
        } catch (e) {
            return console.error("Error rendering PrivacyChoicesFooterLink:", e), null
        }
    }], 174528)
}, 634877, e => {
    "use strict";
    var a = e.i(416340);
    let t = (0, a.createContext)({
        insideTopNavigationDrawer: !1
    });
    t.displayName = "TopNavigationSidebarDrawerContext", e.s(["default", 0, function() {
        return (0, a.useContext)(t)
    }], 634877)
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
}, 774756, 434925, e => {
    "use strict";
    var a = e.i(30941),
        t = e.i(416340),
        r = e.i(936993),
        n = e.i(129210),
        i = e.i(477763),
        s = e.i(169336);
    e.i(210246);
    var l = e.i(226319),
        o = e.i(588393),
        c = e.i(221628),
        d = e.i(759599),
        u = e.i(928277),
        m = e.i(636042),
        p = e.i(442632),
        y = e.i(747310);
    e.i(797018);
    var b = (0, o.c)((0, c.jsx)("path", {
        d: "M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"
    }), "MoreHoriz");
    let g = ["slots", "slotProps"],
        h = (0, l.s)(d.B, {
            name: "MuiBreadcrumbCollapsed"
        })(e => {
            let {
                theme: a
            } = e;
            return (0, i._)({
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
                "&:hover, &:focus": (0, i._)({}, "light" === a.palette.mode ? {
                    backgroundColor: a.palette.grey[200]
                } : {
                    backgroundColor: a.palette.grey[600]
                }),
                "&:active": (0, i._)({
                    boxShadow: a.shadows[0]
                }, "light" === a.palette.mode ? {
                    backgroundColor: (0, s.n)(a.palette.grey[200], .12)
                } : {
                    backgroundColor: (0, s.n)(a.palette.grey[600], .12)
                })
            })
        }),
        f = (0, l.s)(b)({
            width: 24,
            height: 16
        });

    function v(e) {
        let {
            slots: a = {},
            slotProps: t = {}
        } = e, r = (0, s._)(e, g);
        return (0, c.jsx)("li", {
            children: (0, c.jsx)(h, (0, i._)({
                focusRipple: !0
            }, r, {
                ownerState: e,
                children: (0, c.jsx)(f, (0, i._)({
                    as: a.CollapsedIcon,
                    ownerState: e
                }, t.collapsedIcon))
            }))
        })
    }

    function k(e) {
        return (0, s.g)("MuiBreadcrumbs", e)
    }
    var T = (0, u.g)("MuiBreadcrumbs", ["root", "ol", "li", "separator"]);
    let N = ["children", "className", "component", "slots", "slotProps", "expandText", "itemsAfterCollapse", "itemsBeforeCollapse", "maxItems", "separator"],
        I = (0, l.s)(m.T, {
            name: "MuiBreadcrumbs",
            slot: "Root",
            overridesResolver: (e, a) => [{
                ["& .".concat(T.li)]: a.li
            }, a.root]
        })({}),
        x = (0, l.s)("ol", {
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
        C = (0, l.s)("li", {
            name: "MuiBreadcrumbs",
            slot: "Separator",
            overridesResolver: (e, a) => a.separator
        })({
            display: "flex",
            userSelect: "none",
            marginLeft: 8,
            marginRight: 8
        }),
        P = t.forwardRef(function(e, a) {
            var r, n;
            let o = (0, p.u)({
                    props: e,
                    name: "MuiBreadcrumbs"
                }),
                {
                    children: d,
                    className: u,
                    component: m = "nav",
                    slots: b = {},
                    slotProps: g = {},
                    expandText: h = "Show path",
                    itemsAfterCollapse: f = 1,
                    itemsBeforeCollapse: T = 1,
                    maxItems: P = 8,
                    separator: A = "/"
                } = o,
                w = (0, s._)(o, N),
                [S, H] = t.useState(!1),
                E = (0, i._)({}, o, {
                    component: m,
                    expanded: S,
                    expandText: h,
                    itemsAfterCollapse: f,
                    itemsBeforeCollapse: T,
                    maxItems: P,
                    separator: A
                }),
                M = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, l.a)({
                        root: ["root"],
                        li: ["li"],
                        ol: ["ol"],
                        separator: ["separator"]
                    }, k, a)
                })(E),
                R = (0, y.u)({
                    elementType: b.CollapsedIcon,
                    externalSlotProps: g.collapsedIcon,
                    ownerState: E
                }),
                L = t.useRef(null),
                D = t.Children.toArray(d).filter(e => t.isValidElement(e)).map((e, a) => (0, c.jsx)("li", {
                    className: M.li,
                    children: e
                }, "child-".concat(a)));
            return (0, c.jsx)(I, (0, i._)({
                ref: a,
                component: m,
                color: "text.secondary",
                className: (0, l.c)(M.root, u),
                ownerState: E
            }, w, {
                children: (0, c.jsx)(x, {
                    className: M.ol,
                    ref: L,
                    ownerState: E,
                    children: (r = S || P && D.length <= P || T + f >= D.length ? D : [...D.slice(0, T), (0, c.jsx)(v, {
                        "aria-label": h,
                        slots: {
                            CollapsedIcon: b.CollapsedIcon
                        },
                        slotProps: {
                            collapsedIcon: R
                        },
                        onClick: () => {
                            H(!0);
                            let e = L.current.querySelector("a[href],button,[tabindex]");
                            e && e.focus()
                        }
                    }, "ellipsis"), ...D.slice(D.length - f, D.length)], n = M.separator, r.reduce((e, a, t) => (t < r.length - 1 ? e = e.concat(a, (0, c.jsx)(C, {
                        "aria-hidden": !0,
                        className: n,
                        ownerState: E,
                        children: A
                    }, "separator-".concat(t))) : e.push(a), e), []))
                })
            }))
        });
    var A = (0, r.default)({
            name: "Breadcrumbs"
        })(function(e) {
            return {
                root: (0, a._)((0, a._)({}, e.typography.body1), {
                    color: e.palette.content.muted
                })
            }
        }),
        w = (0, t.forwardRef)(function(e, r) {
            var i = e.classes,
                s = e.className,
                l = (0, a.a)(e, ["classes", "className"]),
                o = A(void 0, {
                    props: {
                        classes: (0, n.default)(i, s)
                    }
                });
            return t.default.createElement(P, (0, a._)({
                classes: o.classes
            }, l, {
                ref: r
            }))
        });
    e.s(["Breadcrumbs", 0, w], 774756);
    var S = e.i(97782),
        H = e.i(475360),
        E = e.i(759283),
        M = e.i(829425),
        R = e.i(726474),
        L = e.i(86027),
        D = e.i(128106);
    let j = (e, a) => e.args && e.args.value ? a(e.key, {
            [e.args.param]: a(e.args.value)
        }) : a(e.key),
        G = e => {
            var a;
            let t = parseInt(null != (a = e.developerItemId) ? a : "", 10);
            return Number.isNaN(t) ? R.dashboard.configureCreatorStoreItemBasePath : R.dashboard.getConfigureCreatorStoreItemUrl(t)
        },
        B = {
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
                        key: E.itemFullNameKeys[t]
                    }, a) : j({
                        key: "Heading.AssociatedItems"
                    }, a)
                },
                breadcrumbType: D.default.AssociatedItems,
                getLinkPath: e => (null == e ? void 0 : e.associatedItemType) === H.Item.DeveloperProduct ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/developer-products") : (null == e ? void 0 : e.associatedItemType) === H.Item.ExperienceSubscription ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/subscriptions") : (null == e ? void 0 : e.associatedItemType) === H.Item.GamePass ? "/dashboard/creations/experiences/".concat(e.baseId, "/monetization/passes") : (null == e ? void 0 : e.associatedItemType) ? "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items?activeTab=").concat(e.associatedItemType) : "/dashboard/creations/experiences/".concat(e.baseId, "/associated-items")
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
                getLinkPath: G,
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
                getLinkPath: G,
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
                getLinkPath: G,
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
                getLinkPath: e => M.creatorHub.dashboard.getMonetizationAvatarCreationTokensUrl(Number(e.baseId)),
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
                getLinkPath: e => M.creatorHub.dashboard.getMonetizationCommerceUrl(Number(e.baseId)),
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
                getLinkPath: e => M.creatorHub.dashboard.getMonetizationCommerceCreateProductUrl(Number(e.baseId)),
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
                getLinkPath: e => M.creatorHub.dashboard.getMonetizationOverviewUrl(Number(e.baseId))
            },
            performance: {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: S.analyticsPerformanceNavigationItem.title.key
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
                        key: S.analyticsCrashesNavigationItem.title.key
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
                        key: S.analyticsAudienceNavigationItem.title.key
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
                        key: S.analyticsRecommendedEventsEconomyNavigationItem.title.key
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
                        key: S.analyticsRecommendedEventsFunnelsNavigationItem.title.key
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
                        key: S.analyticsRecommendedEventsJourneyNavigationItem.title.key
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
                        key: S.analyticsErrorReportNavigationItem.title.key
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
                        key: S.analyticsMemoryStoresNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.AnalyticsMemoryStores
            },
            "data-stores": {
                displayName: e => {
                    let {
                        translate: a
                    } = e;
                    return j({
                        key: S.analyticsDataStoresNavigationItem.title.key
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
                        key: S.analyticsHttpServiceNavigationItem.title.key
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
                        key: S.analyticsMessagingServiceNavigationItem.title.key
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
                        key: S.analyticsSpeechToTextNavigationItem.title.key
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
                        key: S.analyticsTextToSpeechNavigationItem.title.key
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
                        key: S.analyticsVideoServiceNavigationItem.title.key
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
                        key: S.analyticsGenerativeAINavigationItem.title.key
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
                        key: S.analyticsCustomEventsNavigationItem.title.key
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
                        key: S.analyticsExploreNavigationItem.title.key
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
                        key: S.analyticsCustomDashboardsManageNavigationItem.title.key
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
                getLinkPath: e => M.creatorHub.dashboard.getMonetizationImmersiveAdsUrl(Number(e.baseId))
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
                    return t === H.Item.CatalogAsset || t === H.Item.LibraryAsset || t === H.Item.Bundle || t === H.Item.Event || t === H.Item.AvatarCreationToken || t === H.Item.Environment || t === H.Item.Look ? j({
                        key: "Heading.Configure"
                    }, a) : t === H.Item.Game ? j({
                        key: "Heading.ContentSettings"
                    }, a) : t === H.Item.ExperienceSubscription ? j({
                        key: "Heading.UpdateSubscription"
                    }, a) : t === H.Item.Alert ? j({
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
                            value: E.itemTypeToSingularNameKeys[t]
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
                getLinkPath: e => M.creatorHub.dashboard.getUserBansUrl(Number(e.baseId))
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
                getLinkPath: e => M.creatorHub.dashboard.getAntiCheatUrl(Number(e.baseId))
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
                getLinkPath: e => M.creatorHub.dashboard.getIssuesAndAppealsUrl(Number(e.baseId))
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
                getLinkPath: e => M.creatorHub.dashboard.getAnalyticsConfigsUrl(Number(e.baseId))
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
                getLinkPath: e => M.creatorHub.dashboard.getExperimentsUrl(Number(e.baseId))
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
                        key: S.analyticsRecommendationServiceNavigationItem.title.key
                    }, a)
                },
                breadcrumbType: D.default.RecommendationService
            }
        };
    e.s(["RouterParseItemToBreadcrumbItemDetails", 0, B], 434925)
}, 401602, e => {
    "use strict";
    var a = e.i(484613);
    e.s(["BrokenImageOutlinedIcon", () => a.BrokenImageOutlined])
}, 761563, e => {
    "use strict";
    var a = e.i(484613);
    e.s(["HourglassEmptyIcon", () => a.HourglassEmpty])
}]);

//# debugId=837e1732-8565-e202-9e51-283fb6b1ef8b
//# sourceMappingURL=09sr-yw9c8o2g.js.map