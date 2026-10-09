;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "9b007ba8-cc13-e362-550e-505b3c04a202")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 220311, e => {
    "use strict";
    var t, o = ((t = o || {}).Home = "CreatorDashboard.Home", t.RoadMap = "CreatorDashboard.RoadMap", t.Features = "CreatorDashboard.Features", t.Landing = "CreatorDashboard.Landing", t.Navigation = "CreatorDashboard.Navigation", t.Metadata = "CreatorDashboard.Metadata", t.LogIn = "CreatorDashboard.LogIn", t.SignUp = "CreatorDashboard.SignUp", t.DevEx = "CreatorDashboard.DevEx", t.Wallet = "CreatorDashboard.Wallet", t.TaxDocumentation = "CreatorDashboard.TaxDocumentation", t.Controls = "CreatorDashboard.Controls", t.Error = "CreatorDashboard.Error", t.Creations = "CreatorDashboard.Creations", t.AgreementsManager = "CreatorDashboard.AgreementsManager", t.AssetTypes = "CreatorDashboard.AssetTypes", t.DevStatsGame = "CreatorDashboard.DevStatsGame", t.DevStatsExport = "CreatorDashboard.DevStatsExport", t.DevStatsPremium = "CreatorDashboard.EngagementPayout", t.DeveloperQuestionnaire = "CreatorDashboard.DeveloperQuestionnaire", t.Analytics = "CreatorDashboard.Analytics", t.AudienceReach = "CreatorDashboard.AudienceReach", t.ExperienceAlerts = "CreatorDashboard.ExperienceAlerts", t.ImmersiveAdsAnalytics = "CreatorDashboard.ImmersiveAdsAnalytics", t.Insights = "CreatorDashboard.Insights", t.AvatarAnalytics = "CreatorDashboard.AvatarAnalytics", t.StoreAnalytics = "CreatorDashboard.StoreAnalytics", t.ShareLinkAnalytics = "CreatorDashboard.ShareLinkAnalytics", t.ComputeTelemetry = "CreatorDashboard.ComputeTelemetry", t.GameLocalization = "CreatorDashboard.GameLocalization", t.GameLocalizationLanguages = "CreatorDashboard.GameLocalizationLanguages", t.GameLocalizationReports = "CreatorDashboard.GameLocalizationReports", t.GameLocalizationSettings = "CreatorDashboard.GameLocalizationSettings", t.GameLocalizationTranslators = "CreatorDashboard.GameLocalizationTranslators", t.GameLocalizationTableManagement = "CreatorDashboard.GameLocalizationTableManagement", t.GameTranslation = "CreatorDashboard.GameTranslation", t.GameInfoTranslation = "CreatorDashboard.GameInfoTranslation", t.GameStringTranslation = "CreatorDashboard.GameStringTranslation", t.GameImageTranslation = "CreatorDashboard.GameImageTranslation", t.GameProductTranslation = "CreatorDashboard.GameProductTranslation", t.ConfigureItem = "CreatorDashboard.ConfigureItem", t.OpenCloud = "CreatorDashboard.OpenCloud", t.OAuth = "CreatorDashboard.OAuth", t.ScopeSystem = "CreatorDashboard.ScopeSystem", t.AgreementsUpdate = "CreatorDashboard.AgreementsUpdate", t.AssetAnalytics = "CreatorDashboard.AssetAnalytics", t.UniverseConfigAndExperimentation = "CreatorDashboard.UniverseConfigAndExperimentation", t.Table = "CreatorDashboard.Table", t.TranslatorPortal = "CreatorDashboard.TranslatorPortal", t.Badges = "CreatorDashboard.Badges", t.DeveloperProducts = "CreatorDashboard.DeveloperProducts", t.SocialLinks = "CreatorDashboard.SocialLinks", t.Updates = "CreatorDashboard.Updates", t.Places = "CreatorDashboard.Places", t.PlaceThumbnails = "CreatorDashboard.PlaceThumbnails", t.GenreType = "CreatorDashboard.GenreType", t.AssetUpload = "CreatorDashboard.AssetUpload", t.AssetPermissions = "CreatorDashboard.AssetPermissions", t.Access = "CreatorDashboard.Access", t.Secrets = "CreatorDashboard.Secrets", t.PlaceAccess = "CreatorDashboard.PlaceAccess", t.Passes = "CreatorDashboard.Passes", t.ActivityFeed = "CreatorDashboard.ActivityFeed", t.VersionHistory = "CreatorDashboard.VersionHistory", t.Notifications = "CreatorDashboard.Notifications", t.DeveloperItem = "CreatorDashboard.DeveloperItem", t.Settings = "CreatorDashboard.Settings", t.SendrNotificationPreferences = "Notifications.Preferences", t.CloudServices = "CreatorDashboard.CloudServices", t.Community = "CreatorDashboard.Community", t.Preferences = "CreatorDashboard.Preferences", t.ExperienceSubscriptions = "CreatorDashboard.DeveloperSubscriptions", t.Commerce = "CreatorDashboard.Commerce", t.CreatorAccount = "CreatorDashboard.CreatorAccount", t.Advanced = "CreatorDashboard.Advanced", t.RightsPortal = "CreatorDashboard.RightsPortal", t.Transactions = "CreatorDashboard.Transactions", t.DataCollection = "CreatorDashboard.DataCollection", t.DataCollectionSettings = "CreatorDashboard.DataCollectionSettings", t.DataCollectionTerms = "CreatorDashboard.DataCollectionTerms", t.MarketplaceOnboarding = "CreatorDashboard.MarketplaceOnboarding", t.Organization = "CreatorDashboard.Organization", t.CommunicationSettings = "CreatorDashboard.CommunicationSettings", t.UnifiedNavigation = "CreatorDocumentation.Navigation", t.DeveloperLanding = "CreatorDashboard.DeveloperLanding", t.Payouts = "CreatorDashboard.Payouts", t.RevenueShareAgreements = "CreatorDashboard.RevenueShareAgreements", t.DataSharingSettingsV2 = "CreatorDashboard.DataSharingSettingsV2", t.PriceOptimization = "CreatorDashboard.PriceOptimization", t.SafetyControls = "CreatorDashboard.SafetyControls", t.AntiCheat = "CreatorDashboard.AntiCheat", t.ShareLinksManagement = "CreatorDashboard.ShareLinksManagament", t.ShareLinkPromo = "CreatorDashboard.ShareLinkPromo", t.FiatPaidAccess = "CreatorDashboard.FiatPaidAccess", t.PublicPublish = "CreatorDashboard.PublicReach", t.Genres = "Experience.Genre", t.OwnershipTransfer = "CreatorDashboard.OwnershipTransfer", t.DocsAssistant = "Feature.QNAB", t.AssetPrivacy = "CreatorDashboard.AssetPrivacy", t.AffiliateProgram = "CreatorDashboard.AffiliateProgram", t.PlayerFeedback = "CreatorDashboard.PlayerFeedback", t.RegionalPricing = "CreatorDashboard.RegionalPricing", t.AnalyticsAssistant = "CreatorDashboard.AnalyticsAssistant", t.Matchmaking = "CreatorDashboard.CustomMatchmaking", t.Licenses = "CreatorDashboard.Licenses", t.Permissions = "CreatorDashboard.Permissions", t.ReferralRewards = "CreatorDashboard.ReferralRewards", t.DynamicPriceCheck = "CreatorDashboard.DynamicPriceCheck", t.NotApproved = "Feature.NotApproved", t.Moderation = "Feature.Moderation", t.AppealsPortal = "Feature.AppealsPortal", t.DashboardModeration = "CreatorDashboard.Moderation", t.Environments = "CreatorDashboard.Environments", t.PageTitles = "CreatorDashboard.PageTitles", t.CreatorRewards = "CreatorDashboard.CreatorRewards", t.CreatorRewardsLanding = "CreatorDashboard.CreatorRewardsLanding", t.ExperienceReleases = "CreatorDashboard.ExperienceReleases", t.Variants = "CreatorDashboard.Variants", t.ServerManagement = "CreatorDashboard.ServerManagement", t.Safety = "CreatorDashboard.Safety", t.CommonUIControls = "CommonUI.Controls", t.CommonUIMessages = "CommonUI.Messages", t.Taxonomy = "CreatorDashboard.Taxonomy", t.RecommendationService = "CreatorDashboard.RecommendationService", t.DataStoresManager = "CreatorDashboard.DataStoresManager", t.AccessPolicy = "CreatorDashboard.AccessPolicy", t.Groups = "Feature.Groups", t.GroupManagement = "Feature.GroupManagement", t.Privacy = "Feature.Privacy", t.ManagedPricing = "CreatorDashboard.ManagedPricing", t.HardCodedPrices = "CreatorDashboard.HardCodedPrices", t.SocialLinksAgeVerificationUpsell = "Feature.SocialLinks", t.PurchaseError = "IAPExperience.PurchaseError", t.TalentHubV2 = "CreatorDashboard.TalentHubV2", t.Leaderboards = "CreatorDashboard.Leaderboards", t.PersonalizedShop = "CreatorDashboard.PersonalizedShop", t.PresetChat = "CreatorDashboard.PresetChat", t.Publishing = "CreatorDashboard.Publishing", t.ItemModel = "Feature.ItemModel", t);
    e.s(["default", 0, o])
}, 881670, e => {
    "use strict";
    var t = e.i(220311);
    e.s(["TranslationNamespace", () => t.default])
}, 576592, e => {
    "use strict";
    var t = e.i(690569),
        o = e.i(945146),
        r = e.i(416340),
        s = e.i(251635),
        i = e.i(787802),
        a = e.i(221628),
        n = e.i(690768),
        l = e.i(121880);

    function c(e) {
        return (0, t.g)("MuiIconButton", e)
    }
    e.i(407110);
    var d = (0, i.g)("MuiIconButton", ["root", "disabled", "colorInherit", "colorPrimary", "colorSecondary", "colorError", "colorInfo", "colorSuccess", "colorWarning", "edgeStart", "edgeEnd", "sizeSmall", "sizeMedium", "sizeLarge"]);
    let p = ["edge", "children", "className", "color", "disabled", "disableFocusRipple", "size"],
        h = (0, s.s)(n.B, {
            name: "MuiIconButton",
            slot: "Root",
            overridesResolver: (e, o) => {
                let {
                    ownerState: r
                } = e;
                return [o.root, "default" !== r.color && o["color".concat((0, t.a)(r.color))], r.edge && o["edge".concat((0, t.a)(r.edge))], o["size".concat((0, t.a)(r.size))]]
            }
        })(e => {
            let {
                theme: r,
                ownerState: s
            } = e;
            return (0, o._)({
                textAlign: "center",
                flex: "0 0 auto",
                fontSize: r.typography.pxToRem(24),
                padding: 8,
                borderRadius: "50%",
                overflow: "visible",
                color: (r.vars || r).palette.action.active,
                transition: r.transitions.create("background-color", {
                    duration: r.transitions.duration.shortest
                })
            }, !s.disableRipple && {
                "&:hover": {
                    backgroundColor: r.vars ? "rgba(".concat(r.vars.palette.action.activeChannel, " / ").concat(r.vars.palette.action.hoverOpacity, ")") : (0, t.b)(r.palette.action.active, r.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "start" === s.edge && {
                marginLeft: "small" === s.size ? -3 : -12
            }, "end" === s.edge && {
                marginRight: "small" === s.size ? -3 : -12
            })
        }, e => {
            var r;
            let {
                theme: s,
                ownerState: i
            } = e, a = null == (r = (s.vars || s).palette) ? void 0 : r[i.color];
            return (0, o._)({}, "inherit" === i.color && {
                color: "inherit"
            }, "inherit" !== i.color && "default" !== i.color && (0, o._)({
                color: null == a ? void 0 : a.main
            }, !i.disableRipple && {
                "&:hover": (0, o._)({}, a && {
                    backgroundColor: s.vars ? "rgba(".concat(a.mainChannel, " / ").concat(s.vars.palette.action.hoverOpacity, ")") : (0, t.b)(a.main, s.palette.action.hoverOpacity)
                }, {
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                })
            }), "small" === i.size && {
                padding: 5,
                fontSize: s.typography.pxToRem(18)
            }, "large" === i.size && {
                padding: 12,
                fontSize: s.typography.pxToRem(28)
            }, {
                ["&.".concat(d.disabled)]: {
                    backgroundColor: "transparent",
                    color: (s.vars || s).palette.action.disabled
                }
            })
        }),
        u = r.forwardRef(function(e, r) {
            let i = (0, l.u)({
                    props: e,
                    name: "MuiIconButton"
                }),
                {
                    edge: n = !1,
                    children: d,
                    className: u,
                    color: m = "default",
                    disabled: b = !1,
                    disableFocusRipple: g = !1,
                    size: v = "medium"
                } = i,
                f = (0, t._)(i, p),
                x = (0, o._)({}, i, {
                    edge: n,
                    color: m,
                    disabled: b,
                    disableFocusRipple: g,
                    size: v
                }),
                C = (e => {
                    let {
                        classes: o,
                        disabled: r,
                        color: i,
                        edge: a,
                        size: n
                    } = e, l = {
                        root: ["root", r && "disabled", "default" !== i && "color".concat((0, t.a)(i)), a && "edge".concat((0, t.a)(a)), "size".concat((0, t.a)(n))]
                    };
                    return (0, s.a)(l, c, o)
                })(x);
            return (0, a.jsx)(h, (0, o._)({
                className: (0, s.c)(C.root, u),
                centerRipple: !0,
                focusRipple: !g,
                disabled: b,
                ref: r
            }, f, {
                ownerState: x,
                children: d
            }))
        });
    e.s(["I", 0, u, "i", 0, d])
}, 863762, e => {
    "use strict";
    var t = e.i(194250),
        o = e.i(416340),
        r = e.i(863605),
        s = e.i(690569),
        i = e.i(945146),
        a = e.i(353512),
        n = e.i(950711),
        l = e.i(81962),
        c = e.i(787802),
        d = e.i(221628),
        p = e.i(251635),
        h = e.i(121880),
        u = e.i(342607),
        m = e.i(15686),
        b = e.i(710302),
        g = e.i(782353),
        v = e.i(441872);
    e.i(304064), e.i(734994);
    var f = e.i(770593),
        x = e.i(577474);

    function C(e) {
        return e.substring(2).toLowerCase()
    }

    function y(e) {
        let {
            children: t,
            disableReactTree: r = !1,
            mouseEvent: s = "onClick",
            onClickAway: i,
            touchEvent: a = "onTouchEnd"
        } = e, l = o.useRef(!1), c = o.useRef(null), p = o.useRef(!1), h = o.useRef(!1);
        o.useEffect(() => (setTimeout(() => {
            p.current = !0
        }, 0), () => {
            p.current = !1
        }), []);
        let u = (0, b.u)((0, g.g)(t), c),
            m = (0, n.u)(e => {
                let t = h.current;
                h.current = !1;
                let o = (0, v.o)(c.current);
                if (!(!p.current || !c.current || "clientX" in e && (o.documentElement.clientWidth < e.clientX || o.documentElement.clientHeight < e.clientY))) {
                    if (l.current) return void(l.current = !1);
                    (e.composedPath ? e.composedPath().indexOf(c.current) > -1 : !o.documentElement.contains(e.target) || c.current.contains(e.target)) || !r && t || i(e)
                }
            }),
            f = e => o => {
                h.current = !0;
                let r = t.props[e];
                r && r(o)
            },
            x = {
                ref: u
            };
        return !1 !== a && (x[a] = f(a)), o.useEffect(() => {
            if (!1 !== a) {
                let e = C(a),
                    t = (0, v.o)(c.current),
                    o = () => {
                        l.current = !0
                    };
                return t.addEventListener(e, m), t.addEventListener("touchmove", o), () => {
                    t.removeEventListener(e, m), t.removeEventListener("touchmove", o)
                }
            }
        }, [m, a]), !1 !== s && (x[s] = f(s)), o.useEffect(() => {
            if (!1 !== s) {
                let e = C(s),
                    t = (0, v.o)(c.current);
                return t.addEventListener(e, m), () => {
                    t.removeEventListener(e, m)
                }
            }
        }, [m, s]), (0, d.jsx)(o.Fragment, {
            children: o.cloneElement(t, x)
        })
    }

    function D(e) {
        return (0, s.g)("MuiSnackbarContent", e)
    }(0, c.g)("MuiSnackbarContent", ["root", "message", "action"]);
    let w = ["action", "className", "message", "role"],
        S = (0, p.s)(f.M, {
            name: "MuiSnackbarContent",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e, o = "light" === t.palette.mode ? .8 : .98, r = (0, s.n)(t.palette.background.default, o);
            return (0, i._)({}, t.typography.body2, {
                color: t.vars ? t.vars.palette.SnackbarContent.color : t.palette.getContrastText(r),
                backgroundColor: t.vars ? t.vars.palette.SnackbarContent.bg : r,
                display: "flex",
                alignItems: "center",
                flexWrap: "wrap",
                padding: "6px 16px",
                borderRadius: (t.vars || t).shape.borderRadius,
                flexGrow: 1,
                [t.breakpoints.up("sm")]: {
                    flexGrow: "initial",
                    minWidth: 288
                }
            })
        }),
        P = (0, p.s)("div", {
            name: "MuiSnackbarContent",
            slot: "Message",
            overridesResolver: (e, t) => t.message
        })({
            padding: "8px 0"
        }),
        A = (0, p.s)("div", {
            name: "MuiSnackbarContent",
            slot: "Action",
            overridesResolver: (e, t) => t.action
        })({
            display: "flex",
            alignItems: "center",
            marginLeft: "auto",
            paddingLeft: 16,
            marginRight: -8
        }),
        T = o.forwardRef(function(e, t) {
            let o = (0, h.u)({
                    props: e,
                    name: "MuiSnackbarContent"
                }),
                {
                    action: r,
                    className: a,
                    message: n,
                    role: l = "alert"
                } = o,
                c = (0, s._)(o, w),
                u = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, p.a)({
                        root: ["root"],
                        action: ["action"],
                        message: ["message"]
                    }, D, t)
                })(o);
            return (0, d.jsxs)(S, (0, i._)({
                role: l,
                square: !0,
                elevation: 6,
                className: (0, p.c)(u.root, a),
                ownerState: o,
                ref: t
            }, c, {
                children: [(0, d.jsx)(P, {
                    className: u.message,
                    ownerState: o,
                    children: n
                }), r ? (0, d.jsx)(A, {
                    className: u.action,
                    ownerState: o,
                    children: r
                }) : null]
            }))
        });

    function R(e) {
        return (0, s.g)("MuiSnackbar", e)
    }(0, c.g)("MuiSnackbar", ["root", "anchorOriginTopCenter", "anchorOriginBottomCenter", "anchorOriginTopRight", "anchorOriginBottomRight", "anchorOriginTopLeft", "anchorOriginBottomLeft"]);
    let E = ["onEnter", "onExited"],
        U = ["action", "anchorOrigin", "autoHideDuration", "children", "className", "ClickAwayListenerProps", "ContentProps", "disableWindowBlurListener", "message", "onBlur", "onClose", "onFocus", "onMouseEnter", "onMouseLeave", "open", "resumeHideDuration", "TransitionComponent", "transitionDuration", "TransitionProps"],
        L = (0, p.s)("div", {
            name: "MuiSnackbar",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: o
                } = e;
                return [t.root, t["anchorOrigin".concat((0, s.a)(o.anchorOrigin.vertical)).concat((0, s.a)(o.anchorOrigin.horizontal))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: o
            } = e;
            return (0, i._)({
                zIndex: (t.vars || t).zIndex.snackbar,
                position: "fixed",
                display: "flex",
                left: 8,
                right: 8,
                justifyContent: "center",
                alignItems: "center"
            }, "top" === o.anchorOrigin.vertical ? {
                top: 8
            } : {
                bottom: 8
            }, "left" === o.anchorOrigin.horizontal && {
                justifyContent: "flex-start"
            }, "right" === o.anchorOrigin.horizontal && {
                justifyContent: "flex-end"
            }, {
                [t.breakpoints.up("sm")]: (0, i._)({}, "top" === o.anchorOrigin.vertical ? {
                    top: 24
                } : {
                    bottom: 24
                }, "center" === o.anchorOrigin.horizontal && {
                    left: "50%",
                    right: "auto",
                    transform: "translateX(-50%)"
                }, "left" === o.anchorOrigin.horizontal && {
                    left: 24,
                    right: "auto"
                }, "right" === o.anchorOrigin.horizontal && {
                    right: 24,
                    left: "auto"
                })
            })
        }),
        O = o.forwardRef(function(e, t) {
            let r = (0, h.u)({
                    props: e,
                    name: "MuiSnackbar"
                }),
                c = (0, u.u)(),
                b = {
                    enter: c.transitions.duration.enteringScreen,
                    exit: c.transitions.duration.leavingScreen
                },
                {
                    action: g,
                    anchorOrigin: {
                        vertical: v,
                        horizontal: f
                    } = {
                        vertical: "bottom",
                        horizontal: "left"
                    },
                    autoHideDuration: C = null,
                    children: D,
                    className: w,
                    ClickAwayListenerProps: S,
                    ContentProps: P,
                    disableWindowBlurListener: A = !1,
                    message: O,
                    open: _,
                    TransitionComponent: I = x.G,
                    transitionDuration: M = b,
                    TransitionProps: {
                        onEnter: k,
                        onExited: z
                    } = {}
                } = r,
                G = (0, s._)(r.TransitionProps, E),
                N = (0, s._)(r, U),
                F = (0, i._)({}, r, {
                    anchorOrigin: {
                        vertical: v,
                        horizontal: f
                    },
                    autoHideDuration: C,
                    disableWindowBlurListener: A,
                    TransitionComponent: I,
                    transitionDuration: M
                }),
                B = (e => {
                    let {
                        classes: t,
                        anchorOrigin: o
                    } = e, r = {
                        root: ["root", "anchorOrigin".concat((0, s.a)(o.vertical)).concat((0, s.a)(o.horizontal))]
                    };
                    return (0, p.a)(r, R, t)
                })(F),
                {
                    getRootProps: H,
                    onClickAway: V
                } = function() {
                    let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                        {
                            autoHideDuration: t = null,
                            disableWindowBlurListener: r = !1,
                            onClose: s,
                            open: c,
                            resumeHideDuration: d
                        } = e,
                        p = (0, a.u)();
                    o.useEffect(() => {
                        if (c) return document.addEventListener("keydown", e), () => {
                            document.removeEventListener("keydown", e)
                        };

                        function e(e) {
                            e.defaultPrevented || "Escape" !== e.key && "Esc" !== e.key || null == s || s(e, "escapeKeyDown")
                        }
                    }, [c, s]);
                    let h = (0, n.u)((e, t) => {
                            null == s || s(e, t)
                        }),
                        u = (0, n.u)(e => {
                            s && null != e && p.start(e, () => {
                                h(null, "timeout")
                            })
                        });
                    o.useEffect(() => (c && u(t), p.clear), [c, t, u, p]);
                    let m = p.clear,
                        b = o.useCallback(() => {
                            null != t && u(null != d ? d : .5 * t)
                        }, [t, d, u]);
                    return o.useEffect(() => {
                        if (!r && c) return window.addEventListener("focus", b), window.addEventListener("blur", m), () => {
                            window.removeEventListener("focus", b), window.removeEventListener("blur", m)
                        }
                    }, [r, c, b, m]), {
                        getRootProps: function() {
                            let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                                o = (0, i._)({}, (0, l.e)(e), (0, l.e)(t));
                            return (0, i._)({
                                role: "presentation"
                            }, t, o, {
                                onBlur: e => {
                                    let t = o.onBlur;
                                    null == t || t(e), b()
                                },
                                onFocus: e => {
                                    let t = o.onFocus;
                                    null == t || t(e), m()
                                },
                                onMouseEnter: e => {
                                    let t = o.onMouseEnter;
                                    null == t || t(e), m()
                                },
                                onMouseLeave: e => {
                                    let t = o.onMouseLeave;
                                    null == t || t(e), b()
                                }
                            })
                        },
                        onClickAway: e => {
                            null == s || s(e, "clickaway")
                        }
                    }
                }((0, i._)({}, F)),
                [j, W] = o.useState(!0),
                K = (0, m.u)({
                    elementType: L,
                    getSlotProps: H,
                    externalForwardedProps: N,
                    ownerState: F,
                    additionalProps: {
                        ref: t
                    },
                    className: [B.root, w]
                });
            return !_ && j ? null : (0, d.jsx)(y, (0, i._)({
                onClickAway: V
            }, S, {
                children: (0, d.jsx)(L, (0, i._)({}, K, {
                    children: (0, d.jsx)(I, (0, i._)({
                        appear: !0,
                        in: _,
                        timeout: M,
                        direction: "top" === v ? "down" : "up",
                        onEnter: (e, t) => {
                            W(!1), k && k(e, t)
                        },
                        onExited: e => {
                            W(!0), z && z(e)
                        }
                    }, G, {
                        children: D || (0, d.jsx)(T, (0, i._)({
                            message: O,
                            action: g
                        }, P))
                    }))
                }))
            }))
        });
    var _ = (0, r.default)({
            name: "Snackbar"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({
                    boxShadow: e.elevation.overlay
                }, e.border.radius.medium), {
                    backgroundColor: e.palette.background.snackbar,
                    color: e.palette.content.standard
                })
            }
        }),
        I = (0, o.forwardRef)(function(e, r) {
            var s = e.ContentProps,
                i = e.autoHide,
                a = e.anchorOrigin,
                n = e.className,
                l = e.classes,
                c = (0, t.a)(e, ["ContentProps", "autoHide", "anchorOrigin", "className", "classes"]),
                d = _(void 0, {
                    props: {
                        classes: null == s ? void 0 : s.classes
                    }
                });
            return o.default.createElement(O, (0, t._)({}, c, {
                classes: (0, t._)((0, t._)({}, l), {
                    root: d.cx(null == l ? void 0 : l.root, n)
                }),
                ref: r,
                anchorOrigin: (0, t._)({
                    vertical: "bottom",
                    horizontal: "left"
                }, a),
                autoHideDuration: void 0 !== i && i ? 4e3 : null,
                ContentProps: {
                    classes: d.classes
                }
            }))
        });
    e.s(["S", 0, I])
}, 260782, 507558, e => {
    "use strict";
    var t = e.i(194250),
        o = e.i(416340),
        r = e.i(863605),
        s = e.i(154502),
        i = e.i(690569),
        a = e.i(945146),
        n = e.i(251635),
        l = e.i(588763),
        c = e.i(221628),
        d = e.i(121880);
    let p = ["absolute", "children", "className", "component", "flexItem", "light", "orientation", "role", "textAlign", "variant"],
        h = (0, n.s)("div", {
            name: "MuiDivider",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: o
                } = e;
                return [t.root, o.absolute && t.absolute, t[o.variant], o.light && t.light, "vertical" === o.orientation && t.vertical, o.flexItem && t.flexItem, o.children && t.withChildren, o.children && "vertical" === o.orientation && t.withChildrenVertical, "right" === o.textAlign && "vertical" !== o.orientation && t.textAlignRight, "left" === o.textAlign && "vertical" !== o.orientation && t.textAlignLeft]
            }
        })(e => {
            let {
                theme: t,
                ownerState: o
            } = e;
            return (0, a._)({
                margin: 0,
                flexShrink: 0,
                borderWidth: 0,
                borderStyle: "solid",
                borderColor: (t.vars || t).palette.divider,
                borderBottomWidth: "thin"
            }, o.absolute && {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%"
            }, o.light && {
                borderColor: t.vars ? "rgba(".concat(t.vars.palette.dividerChannel, " / 0.08)") : (0, i.b)(t.palette.divider, .08)
            }, "inset" === o.variant && {
                marginLeft: 72
            }, "middle" === o.variant && "horizontal" === o.orientation && {
                marginLeft: t.spacing(2),
                marginRight: t.spacing(2)
            }, "middle" === o.variant && "vertical" === o.orientation && {
                marginTop: t.spacing(1),
                marginBottom: t.spacing(1)
            }, "vertical" === o.orientation && {
                height: "100%",
                borderBottomWidth: 0,
                borderRightWidth: "thin"
            }, o.flexItem && {
                alignSelf: "stretch",
                height: "auto"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return (0, a._)({}, t.children && {
                display: "flex",
                whiteSpace: "nowrap",
                textAlign: "center",
                border: 0,
                borderTopStyle: "solid",
                borderLeftStyle: "solid",
                "&::before, &::after": {
                    content: '""',
                    alignSelf: "center"
                }
            })
        }, e => {
            let {
                theme: t,
                ownerState: o
            } = e;
            return (0, a._)({}, o.children && "vertical" !== o.orientation && {
                "&::before, &::after": {
                    width: "100%",
                    borderTop: "thin solid ".concat((t.vars || t).palette.divider),
                    borderTopStyle: "inherit"
                }
            })
        }, e => {
            let {
                theme: t,
                ownerState: o
            } = e;
            return (0, a._)({}, o.children && "vertical" === o.orientation && {
                flexDirection: "column",
                "&::before, &::after": {
                    height: "100%",
                    borderLeft: "thin solid ".concat((t.vars || t).palette.divider),
                    borderLeftStyle: "inherit"
                }
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return (0, a._)({}, "right" === t.textAlign && "vertical" !== t.orientation && {
                "&::before": {
                    width: "90%"
                },
                "&::after": {
                    width: "10%"
                }
            }, "left" === t.textAlign && "vertical" !== t.orientation && {
                "&::before": {
                    width: "10%"
                },
                "&::after": {
                    width: "90%"
                }
            })
        }),
        u = (0, n.s)("span", {
            name: "MuiDivider",
            slot: "Wrapper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: o
                } = e;
                return [t.wrapper, "vertical" === o.orientation && t.wrapperVertical]
            }
        })(e => {
            let {
                theme: t,
                ownerState: o
            } = e;
            return (0, a._)({
                display: "inline-block",
                paddingLeft: "calc(".concat(t.spacing(1), " * 1.2)"),
                paddingRight: "calc(".concat(t.spacing(1), " * 1.2)")
            }, "vertical" === o.orientation && {
                paddingTop: "calc(".concat(t.spacing(1), " * 1.2)"),
                paddingBottom: "calc(".concat(t.spacing(1), " * 1.2)")
            })
        }),
        m = o.forwardRef(function(e, t) {
            let o = (0, d.u)({
                    props: e,
                    name: "MuiDivider"
                }),
                {
                    absolute: r = !1,
                    children: s,
                    className: m,
                    component: b = s ? "div" : "hr",
                    flexItem: g = !1,
                    light: v = !1,
                    orientation: f = "horizontal",
                    role: x = "hr" !== b ? "separator" : void 0,
                    textAlign: C = "center",
                    variant: y = "fullWidth"
                } = o,
                D = (0, i._)(o, p),
                w = (0, a._)({}, o, {
                    absolute: r,
                    component: b,
                    flexItem: g,
                    light: v,
                    orientation: f,
                    role: x,
                    textAlign: C,
                    variant: y
                }),
                S = (e => {
                    let {
                        absolute: t,
                        children: o,
                        classes: r,
                        flexItem: s,
                        light: i,
                        orientation: a,
                        textAlign: c,
                        variant: d
                    } = e;
                    return (0, n.a)({
                        root: ["root", t && "absolute", d, i && "light", "vertical" === a && "vertical", s && "flexItem", o && "withChildren", o && "vertical" === a && "withChildrenVertical", "right" === c && "vertical" !== a && "textAlignRight", "left" === c && "vertical" !== a && "textAlignLeft"],
                        wrapper: ["wrapper", "vertical" === a && "wrapperVertical"]
                    }, l.g, r)
                })(w);
            return (0, c.jsx)(h, (0, a._)({
                as: b,
                className: (0, n.c)(S.root, m),
                role: x,
                ref: t,
                ownerState: w
            }, D, {
                children: s ? (0, c.jsx)(u, {
                    className: S.wrapper,
                    ownerState: w,
                    children: s
                }) : null
            }))
        });
    m.muiSkipListHighlight = !0, e.s(["D", 0, m], 507558);
    var b = (0, r.default)({
            name: "Divider"
        })(function(e, t) {
            return {
                root: {
                    borderBottomWidth: "small" === t.size ? .5 : 1
                }
            }
        }),
        g = (0, o.forwardRef)(function(e, r) {
            var i = e.classes,
                a = e.size,
                n = e.className,
                l = (0, t.a)(e, ["classes", "size", "className"]),
                c = b({
                    size: void 0 === a ? "medium" : a
                }, {
                    props: {
                        classes: (0, s.default)(i, n)
                    }
                });
            return o.default.createElement(m, (0, t._)({}, l, {
                classes: c.classes,
                ref: r
            }))
        });
    e.s(["Divider", 0, g], 260782)
}, 588763, e => {
    "use strict";
    var t = e.i(787802),
        o = e.i(690569),
        r = (0, t.g)("MuiDivider", ["root", "absolute", "fullWidth", "inset", "middle", "flexItem", "light", "vertical", "withChildren", "withChildrenVertical", "textAlignRight", "textAlignLeft", "wrapper", "wrapperVertical"]);
    e.s(["d", 0, r, "g", 0, function(e) {
        return (0, o.g)("MuiDivider", e)
    }])
}, 678604, (e, t, o) => {
    "use strict";
    var r = e.r(416340);

    function s(e) {
        var t = "https://react.dev/errors/" + e;
        if (1 < arguments.length) {
            t += "?args[]=" + encodeURIComponent(arguments[1]);
            for (var o = 2; o < arguments.length; o++) t += "&args[]=" + encodeURIComponent(arguments[o])
        }
        return "Minified React error #" + e + "; visit " + t + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings."
    }

    function i() {}
    var a = {
            d: {
                f: i,
                r: function() {
                    throw Error(s(522))
                },
                D: i,
                C: i,
                L: i,
                m: i,
                X: i,
                S: i,
                M: i
            },
            p: 0,
            findDOMNode: null
        },
        n = Symbol.for("react.portal"),
        l = r.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE;

    function c(e, t) {
        return "font" === e ? "" : "string" == typeof t ? "use-credentials" === t ? t : "" : void 0
    }
    o.__DOM_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE = a, o.createPortal = function(e, t) {
        var o = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : null;
        if (!t || 1 !== t.nodeType && 9 !== t.nodeType && 11 !== t.nodeType) throw Error(s(299));
        return function(e, t, o) {
            var r = 3 < arguments.length && void 0 !== arguments[3] ? arguments[3] : null;
            return {
                $$typeof: n,
                key: null == r ? null : "" + r,
                children: e,
                containerInfo: t,
                implementation: o
            }
        }(e, t, null, o)
    }, o.flushSync = function(e) {
        var t = l.T,
            o = a.p;
        try {
            if (l.T = null, a.p = 2, e) return e()
        } finally {
            l.T = t, a.p = o, a.d.f()
        }
    }, o.preconnect = function(e, t) {
        "string" == typeof e && (t = t ? "string" == typeof(t = t.crossOrigin) ? "use-credentials" === t ? t : "" : void 0 : null, a.d.C(e, t))
    }, o.prefetchDNS = function(e) {
        "string" == typeof e && a.d.D(e)
    }, o.preinit = function(e, t) {
        if ("string" == typeof e && t && "string" == typeof t.as) {
            var o = t.as,
                r = c(o, t.crossOrigin),
                s = "string" == typeof t.integrity ? t.integrity : void 0,
                i = "string" == typeof t.fetchPriority ? t.fetchPriority : void 0;
            "style" === o ? a.d.S(e, "string" == typeof t.precedence ? t.precedence : void 0, {
                crossOrigin: r,
                integrity: s,
                fetchPriority: i
            }) : "script" === o && a.d.X(e, {
                crossOrigin: r,
                integrity: s,
                fetchPriority: i,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0
            })
        }
    }, o.preinitModule = function(e, t) {
        if ("string" == typeof e)
            if ("object" == typeof t && null !== t) {
                if (null == t.as || "script" === t.as) {
                    var o = c(t.as, t.crossOrigin);
                    a.d.M(e, {
                        crossOrigin: o,
                        integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                        nonce: "string" == typeof t.nonce ? t.nonce : void 0
                    })
                }
            } else null == t && a.d.M(e)
    }, o.preload = function(e, t) {
        if ("string" == typeof e && "object" == typeof t && null !== t && "string" == typeof t.as) {
            var o = t.as,
                r = c(o, t.crossOrigin);
            a.d.L(e, o, {
                crossOrigin: r,
                integrity: "string" == typeof t.integrity ? t.integrity : void 0,
                nonce: "string" == typeof t.nonce ? t.nonce : void 0,
                type: "string" == typeof t.type ? t.type : void 0,
                fetchPriority: "string" == typeof t.fetchPriority ? t.fetchPriority : void 0,
                referrerPolicy: "string" == typeof t.referrerPolicy ? t.referrerPolicy : void 0,
                imageSrcSet: "string" == typeof t.imageSrcSet ? t.imageSrcSet : void 0,
                imageSizes: "string" == typeof t.imageSizes ? t.imageSizes : void 0,
                media: "string" == typeof t.media ? t.media : void 0
            })
        }
    }, o.preloadModule = function(e, t) {
        if ("string" == typeof e)
            if (t) {
                var o = c(t.as, t.crossOrigin);
                a.d.m(e, {
                    as: "string" == typeof t.as && "script" !== t.as ? t.as : void 0,
                    crossOrigin: o,
                    integrity: "string" == typeof t.integrity ? t.integrity : void 0
                })
            } else a.d.m(e)
    }, o.requestFormReset = function(e) {
        a.d.r(e)
    }, o.unstable_batchedUpdates = function(e, t) {
        return e(t)
    }, o.useFormState = function(e, t, o) {
        return l.H.useFormState(e, t, o)
    }, o.useFormStatus = function() {
        return l.H.useHostTransitionStatus()
    }, o.version = "19.2.6"
}, 149285, (e, t, o) => {
    "use strict";
    ! function e() {
        if ("u" > typeof __REACT_DEVTOOLS_GLOBAL_HOOK__ && "function" == typeof __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE) try {
            __REACT_DEVTOOLS_GLOBAL_HOOK__.checkDCE(e)
        } catch (e) {
            console.error(e)
        }
    }(), t.exports = e.r(678604)
}, 260022, e => {
    "use strict";
    let t = {
        accountSessionProtectionHelpArticle: {
            global: {
                development: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest3: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest2: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                sitetest1: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection",
                production: "https://help.roblox.com/hc/articles/18765146769812-Account-Session-Protection"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aiBasedToolsSupplementalTermsAndDisclaimer: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer",
                production: "https://en.help.roblox.com/hc/en-us/articles/20121392440212-AI-Based-Tools-Supplemental-Terms-and-Disclaimer"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorsRestrictionsOnUse: {
            global: {
                development: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest3: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest2: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                sitetest1: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use",
                production: "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        agreementsManagerUrl: {
            global: {
                development: "https://content-licensing-public-test.simulpong.com",
                sitetest3: "https://content-licensing-public-test.simulpong.com",
                sitetest2: "https://content-licensing-public-test.simulpong.com",
                sitetest1: "https://content-licensing-public-test.simulpong.com",
                production: "https://agreements-manageraws.rbxcdn.com"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devForumWAYWOCInspirationUrl: {
            global: {
                development: "http://devforum.roblox.com/waywoc",
                sitetest3: "http://devforum.roblox.com/waywoc",
                sitetest2: "http://devforum.roblox.com/waywoc",
                sitetest1: "http://devforum.roblox.com/waywoc",
                production: "http://devforum.roblox.com/waywoc"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        shopifyMerchantUrl: {
            global: {
                development: "https://apps.shopify.com/roblox",
                sitetest3: "https://apps.shopify.com/roblox",
                sitetest2: "https://apps.shopify.com/roblox",
                sitetest1: "https://apps.shopify.com/roblox",
                production: "https://apps.shopify.com/roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        copyrightFairUseUrl: {
            global: {
                development: "https://copyright.gov/fair-use/",
                sitetest3: "https://copyright.gov/fair-use/",
                sitetest2: "https://copyright.gov/fair-use/",
                sitetest1: "https://copyright.gov/fair-use/",
                production: "https://copyright.gov/fair-use/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        aboutUsUrl: {
            global: {
                development: "https://www.roblox.com/info/about-us",
                sitetest3: "https://www.roblox.com/info/about-us",
                sitetest2: "https://www.roblox.com/info/about-us",
                sitetest1: "https://www.roblox.com/info/about-us",
                production: "https://www.roblox.com/info/about-us"
            },
            luobu: {
                development: "https://corp.roblox.cn/",
                sitetest3: "https://corp.roblox.cn/",
                sitetest2: "https://corp.roblox.cn/",
                sitetest1: "https://corp.roblox.cn/",
                production: "https://corp.roblox.cn/"
            }
        },
        joinUsUrl: {
            global: {
                development: "https://www.roblox.com/info/jobs",
                sitetest3: "https://www.roblox.com/info/jobs",
                sitetest2: "https://www.roblox.com/info/jobs",
                sitetest1: "https://www.roblox.com/info/jobs",
                production: "https://www.roblox.com/info/jobs"
            },
            luobu: {
                development: "https://corp.roblox.cn/career/",
                sitetest3: "https://corp.roblox.cn/career/",
                sitetest2: "https://corp.roblox.cn/career/",
                sitetest1: "https://corp.roblox.cn/career/",
                production: "https://corp.roblox.cn/career/"
            }
        },
        termsOfServiceUrl: {
            global: {
                development: "https://www.roblox.com/info/terms",
                sitetest3: "https://www.roblox.com/info/terms",
                sitetest2: "https://www.roblox.com/info/terms",
                sitetest1: "https://www.roblox.com/info/terms",
                production: "https://www.roblox.com/info/terms"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-terms.html",
                sitetest3: "https://robloxdev.cn/dev-terms.html",
                sitetest2: "https://robloxdev.cn/dev-terms.html",
                sitetest1: "https://robloxdev.cn/dev-terms.html",
                production: "https://robloxdev.cn/dev-terms.html"
            }
        },
        privacyPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/privacy",
                sitetest3: "https://www.roblox.com/info/privacy",
                sitetest2: "https://www.roblox.com/info/privacy",
                sitetest1: "https://www.roblox.com/info/privacy",
                production: "https://www.roblox.com/info/privacy"
            },
            luobu: {
                development: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest3: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest2: "https://robloxdev.cn/dev-privacy-policy.html",
                sitetest1: "https://robloxdev.cn/dev-privacy-policy.html",
                production: "https://robloxdev.cn/dev-privacy-policy.html"
            }
        },
        accessibilityPolicyUrl: {
            global: {
                development: "https://www.roblox.com/info/accessibility",
                sitetest3: "https://www.roblox.com/info/accessibility",
                sitetest2: "https://www.roblox.com/info/accessibility",
                sitetest1: "https://www.roblox.com/info/accessibility",
                production: "https://www.roblox.com/info/accessibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        devexPolicyUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest3: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest2: "https://robloxdev.cn/dev-ex-policy.html",
                sitetest1: "https://robloxdev.cn/dev-ex-policy.html",
                production: "https://robloxdev.cn/dev-ex-policy.html"
            }
        },
        robloxCubeAnnouncementUrl: {
            global: {
                development: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest3: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest2: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                sitetest1: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube",
                production: "https://corp.roblox.com/newsroom/2025/03/introducing-roblox-cube"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleBadgesSpecialGameAwardsUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest3: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest2: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                sitetest1: "https://developer.roblox.com/articles/Badges-Special-Game-Awards",
                production: "https://developer.roblox.com/articles/Badges-Special-Game-Awards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleProductsInGamePurchasesUrl: {
            global: {
                development: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest3: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest2: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                sitetest1: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases",
                production: "https://developer.roblox.com/articles/Developer-Products-In-Game-Purchases"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleRedirectCreatePlaceAsyncUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest3: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest2: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                sitetest1: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync",
                production: "https://developer.roblox.com/en-us/api-reference/function/AssetService/CreatePlaceAsync"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleCreateVipServerUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest3: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest2: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                sitetest1: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox",
                production: "https://developer.roblox.com/en-us/articles/Creating-a-VIP-Server-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerArticleGamesAndPlacesUrl: {
            global: {
                development: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest3: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest2: "https://developer.roblox.com/en-us/articles/games-and-places",
                sitetest1: "https://developer.roblox.com/en-us/articles/games-and-places",
                production: "https://developer.roblox.com/en-us/articles/games-and-places"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        ugcSubscriptionTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest3: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest2: "https://en.help.roblox.com/hc/articles/19694609252884/",
                sitetest1: "https://en.help.roblox.com/hc/articles/19694609252884/",
                production: "https://en.help.roblox.com/hc/articles/19694609252884/"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorStoreTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest3: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest2: "https://en.help.roblox.com/hc/articles/21308223046932",
                sitetest1: "https://en.help.roblox.com/hc/articles/21308223046932",
                production: "https://en.help.roblox.com/hc/articles/21308223046932"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        accountVerificationUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/production/publishing/account-verification#verify-through-government-id",
                production: "https://create.roblox.com/docs/en-us/production/publishing/account-verification#verify-through-government-id"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioUploadLicenseAgreementUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest3: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest2: "https://en.help.roblox.com/hc/articles/23359485439124",
                sitetest1: "https://en.help.roblox.com/hc/articles/23359485439124",
                production: "https://en.help.roblox.com/hc/articles/23359485439124"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        audioThumbnailModerationUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox",
                production: "https://en.help.roblox.com/hc/en-us/articles/21416271342868-Content-Moderation-on-Roblox"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        extendedServicesTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest3: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest2: "https://en.help.roblox.com/hc/articles/37967848292500",
                sitetest1: "https://en.help.roblox.com/hc/articles/37967848292500",
                production: "https://en.help.roblox.com/hc/articles/37967848292500"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use",
                production: "https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        advertisingStandardsUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards",
                production: "https://en.help.roblox.com/hc/en-us/articles/13722260778260-Advertising-Standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyTermsOfUseUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/15887203369620",
                production: "https://en.help.roblox.com/hc/en-us/articles/15887203369620"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        dataCollectionOptInUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/18922542221076",
                production: "https://en.help.roblox.com/hc/en-us/articles/18922542221076"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        robloxCommunityStandardsUrl: {
            global: {
                development: "https://about.roblox.com/community-standards",
                sitetest3: "https://about.roblox.com/community-standards",
                sitetest2: "https://about.roblox.com/community-standards",
                sitetest1: "https://about.roblox.com/community-standards",
                production: "https://about.roblox.com/community-standards"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorThirdPartyPolicyUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37924211313044",
                production: "https://en.help.roblox.com/hc/en-us/articles/37924211313044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        creatorAnalyticsTermsOfUseUrl: {
            global: {
                development: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest3: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest2: "https://help.roblox.com/hc/articles/10949046065044",
                sitetest1: "https://help.roblox.com/hc/articles/10949046065044",
                production: "https://help.roblox.com/hc/articles/10949046065044"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        friendRewardsTermsOfUseUrl: {
            global: {
                development: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest3: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest2: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                sitetest1: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'",
                production: "'https://help.roblox.com/hc/articles/35146071523604-In-Experience-Friend-Rewards-Program-Terms'"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        developerExchangeHelpAndInformationPageUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page",
                production: "https://en.help.roblox.com/hc/en-us/articles/13061189551124-Developer-Exchange-Help-and-Information-Page"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        trustedConnectionsLearnMoreUrl: {
            global: {
                development: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest3: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest2: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                sitetest1: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters",
                production: "https://en.help.roblox.com/hc/en-us/articles/37725513985812-Unlocking-Trusted-Connections-Expressive-Chat-Features-Party-Voice-chat-without-filters"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        templateUrl: {
            global: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        gameDetailsPageDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        },
        songEligibilityDocsUrl: {
            global: {
                development: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest3: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest2: "https://create.sitetest3.robloxlabs.com/docs/en-us/audio/assets#visibility",
                sitetest1: "https://create.sitetest1.robloxlabs.com/docs/en-us/audio/assets#visibility",
                production: "https://create.roblox.com/docs/audio/assets#visibility"
            },
            luobu: {
                development: "",
                sitetest3: "",
                sitetest2: "",
                sitetest1: "",
                production: ""
            }
        }
    };
    e.s(["getProductionCreatorHubUrl", 0, e => "luobu" === e ? "https://create.roblox.cn" : "https://create.roblox.com", "resolveUrl", 0, (e, o, r) => {
        var s, i;
        return (null == (i = t[e]) || null == (s = i[r]) ? void 0 : s[o]) || (console.warn("No URL found for ".concat(e, " in environment ").concat(o, " and target ").concat(r)), "")
    }])
}]);

//# debugId=9b007ba8-cc13-e362-550e-505b3c04a202
//# sourceMappingURL=0_1pb23renn2x.js.map