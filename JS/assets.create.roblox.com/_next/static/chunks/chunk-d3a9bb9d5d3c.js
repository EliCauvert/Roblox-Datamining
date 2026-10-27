;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "86e9a557-2f02-a411-2891-17133b069c26")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 220311, e => {
    "use strict";
    var a, r = ((a = r || {}).Home = "CreatorDashboard.Home", a.RoadMap = "CreatorDashboard.RoadMap", a.Features = "CreatorDashboard.Features", a.Landing = "CreatorDashboard.Landing", a.Navigation = "CreatorDashboard.Navigation", a.Metadata = "CreatorDashboard.Metadata", a.LogIn = "CreatorDashboard.LogIn", a.SignUp = "CreatorDashboard.SignUp", a.DevEx = "CreatorDashboard.DevEx", a.Wallet = "CreatorDashboard.Wallet", a.TaxDocumentation = "CreatorDashboard.TaxDocumentation", a.Controls = "CreatorDashboard.Controls", a.Error = "CreatorDashboard.Error", a.Creations = "CreatorDashboard.Creations", a.AgreementsManager = "CreatorDashboard.AgreementsManager", a.AssetTypes = "CreatorDashboard.AssetTypes", a.DevStatsGame = "CreatorDashboard.DevStatsGame", a.DevStatsExport = "CreatorDashboard.DevStatsExport", a.DevStatsPremium = "CreatorDashboard.EngagementPayout", a.DeveloperQuestionnaire = "CreatorDashboard.DeveloperQuestionnaire", a.Analytics = "CreatorDashboard.Analytics", a.AudienceReach = "CreatorDashboard.AudienceReach", a.ExperienceDetails = "Feature.ExperienceDetails", a.ExperienceAlerts = "CreatorDashboard.ExperienceAlerts", a.ImmersiveAdsAnalytics = "CreatorDashboard.ImmersiveAdsAnalytics", a.Insights = "CreatorDashboard.Insights", a.AvatarAnalytics = "CreatorDashboard.AvatarAnalytics", a.StoreAnalytics = "CreatorDashboard.StoreAnalytics", a.ShareLinkAnalytics = "CreatorDashboard.ShareLinkAnalytics", a.ComputeTelemetry = "CreatorDashboard.ComputeTelemetry", a.GameLocalization = "CreatorDashboard.GameLocalization", a.GameLocalizationLanguages = "CreatorDashboard.GameLocalizationLanguages", a.GameLocalizationReports = "CreatorDashboard.GameLocalizationReports", a.GameLocalizationSettings = "CreatorDashboard.GameLocalizationSettings", a.GameLocalizationTranslators = "CreatorDashboard.GameLocalizationTranslators", a.GameLocalizationTableManagement = "CreatorDashboard.GameLocalizationTableManagement", a.GameTranslation = "CreatorDashboard.GameTranslation", a.GameInfoTranslation = "CreatorDashboard.GameInfoTranslation", a.GameStringTranslation = "CreatorDashboard.GameStringTranslation", a.GameImageTranslation = "CreatorDashboard.GameImageTranslation", a.GameProductTranslation = "CreatorDashboard.GameProductTranslation", a.ConfigureItem = "CreatorDashboard.ConfigureItem", a.OpenCloud = "CreatorDashboard.OpenCloud", a.OAuth = "CreatorDashboard.OAuth", a.ScopeSystem = "CreatorDashboard.ScopeSystem", a.AgreementsUpdate = "CreatorDashboard.AgreementsUpdate", a.AssetAnalytics = "CreatorDashboard.AssetAnalytics", a.UniverseConfigAndExperimentation = "CreatorDashboard.UniverseConfigAndExperimentation", a.Table = "CreatorDashboard.Table", a.TranslatorPortal = "CreatorDashboard.TranslatorPortal", a.Badges = "CreatorDashboard.Badges", a.DeveloperProducts = "CreatorDashboard.DeveloperProducts", a.SocialLinks = "CreatorDashboard.SocialLinks", a.Updates = "CreatorDashboard.Updates", a.Places = "CreatorDashboard.Places", a.PlaceThumbnails = "CreatorDashboard.PlaceThumbnails", a.GenreType = "CreatorDashboard.GenreType", a.AssetUpload = "CreatorDashboard.AssetUpload", a.AssetPermissions = "CreatorDashboard.AssetPermissions", a.Access = "CreatorDashboard.Access", a.Secrets = "CreatorDashboard.Secrets", a.PlaceAccess = "CreatorDashboard.PlaceAccess", a.Passes = "CreatorDashboard.Passes", a.ActivityFeed = "CreatorDashboard.ActivityFeed", a.VersionHistory = "CreatorDashboard.VersionHistory", a.Notifications = "CreatorDashboard.Notifications", a.DeveloperItem = "CreatorDashboard.DeveloperItem", a.Settings = "CreatorDashboard.Settings", a.SendrNotificationPreferences = "Notifications.Preferences", a.CloudServices = "CreatorDashboard.CloudServices", a.Community = "CreatorDashboard.Community", a.Preferences = "CreatorDashboard.Preferences", a.ExperienceSubscriptions = "CreatorDashboard.DeveloperSubscriptions", a.Commerce = "CreatorDashboard.Commerce", a.CreatorAccount = "CreatorDashboard.CreatorAccount", a.Advanced = "CreatorDashboard.Advanced", a.RightsPortal = "CreatorDashboard.RightsPortal", a.Transactions = "CreatorDashboard.Transactions", a.DataCollection = "CreatorDashboard.DataCollection", a.DataCollectionSettings = "CreatorDashboard.DataCollectionSettings", a.DataCollectionTerms = "CreatorDashboard.DataCollectionTerms", a.MarketplaceOnboarding = "CreatorDashboard.MarketplaceOnboarding", a.Organization = "CreatorDashboard.Organization", a.CommunicationSettings = "CreatorDashboard.CommunicationSettings", a.UnifiedNavigation = "CreatorDocumentation.Navigation", a.DeveloperLanding = "CreatorDashboard.DeveloperLanding", a.Payouts = "CreatorDashboard.Payouts", a.RevenueShareAgreements = "CreatorDashboard.RevenueShareAgreements", a.DataSharingSettingsV2 = "CreatorDashboard.DataSharingSettingsV2", a.PriceOptimization = "CreatorDashboard.PriceOptimization", a.SafetyControls = "CreatorDashboard.SafetyControls", a.AntiCheat = "CreatorDashboard.AntiCheat", a.ShareLinksManagement = "CreatorDashboard.ShareLinksManagament", a.ShareLinkPromo = "CreatorDashboard.ShareLinkPromo", a.FiatPaidAccess = "CreatorDashboard.FiatPaidAccess", a.PublicPublish = "CreatorDashboard.PublicReach", a.Genres = "Experience.Genre", a.OwnershipTransfer = "CreatorDashboard.OwnershipTransfer", a.DocsAssistant = "Feature.QNAB", a.AssetPrivacy = "CreatorDashboard.AssetPrivacy", a.AffiliateProgram = "CreatorDashboard.AffiliateProgram", a.PlayerFeedback = "CreatorDashboard.PlayerFeedback", a.RegionalPricing = "CreatorDashboard.RegionalPricing", a.AnalyticsAssistant = "CreatorDashboard.AnalyticsAssistant", a.Matchmaking = "CreatorDashboard.CustomMatchmaking", a.Licenses = "CreatorDashboard.Licenses", a.Permissions = "CreatorDashboard.Permissions", a.ReferralRewards = "CreatorDashboard.ReferralRewards", a.DynamicPriceCheck = "CreatorDashboard.DynamicPriceCheck", a.NotApproved = "Feature.NotApproved", a.Moderation = "Feature.Moderation", a.AppealsPortal = "Feature.AppealsPortal", a.DashboardModeration = "CreatorDashboard.Moderation", a.Environments = "CreatorDashboard.Environments", a.PageTitles = "CreatorDashboard.PageTitles", a.CreatorRewards = "CreatorDashboard.CreatorRewards", a.CreatorRewardsLanding = "CreatorDashboard.CreatorRewardsLanding", a.ExperienceReleases = "CreatorDashboard.ExperienceReleases", a.Variants = "CreatorDashboard.Variants", a.ServerManagement = "CreatorDashboard.ServerManagement", a.Safety = "CreatorDashboard.Safety", a.CommonUIControls = "CommonUI.Controls", a.CommonUIMessages = "CommonUI.Messages", a.Taxonomy = "CreatorDashboard.Taxonomy", a.RecommendationService = "CreatorDashboard.RecommendationService", a.DataStoresManager = "CreatorDashboard.DataStoresManager", a.AccessPolicy = "CreatorDashboard.AccessPolicy", a.Groups = "Feature.Groups", a.GroupManagement = "Feature.GroupManagement", a.Privacy = "Feature.Privacy", a.ManagedPricing = "CreatorDashboard.ManagedPricing", a.HardCodedPrices = "CreatorDashboard.HardCodedPrices", a.SocialLinksAgeVerificationUpsell = "Feature.SocialLinks", a.PurchaseError = "IAPExperience.PurchaseError", a.TalentHubV2 = "CreatorDashboard.TalentHubV2", a.Leaderboards = "CreatorDashboard.Leaderboards", a.PersonalizedShop = "CreatorDashboard.PersonalizedShop", a.PresetChat = "CreatorDashboard.PresetChat", a.Publishing = "CreatorDashboard.Publishing", a.ItemModel = "Feature.ItemModel", a.ProductTrials = "CreatorDashboard.ProductTrials", a);
    e.s(["default", 0, r])
}, 881670, e => {
    "use strict";
    var a = e.i(220311);
    e.s(["TranslationNamespace", () => a.default])
}, 269714, e => {
    "use strict";
    var a = e.i(30941),
        r = e.i(416340),
        t = e.i(936993),
        o = e.i(129210),
        n = e.i(477763),
        i = e.i(169336),
        s = e.i(226319),
        l = e.i(928277),
        c = e.i(221628),
        d = e.i(487047),
        u = e.i(442632);

    function p(e) {
        return (0, i.g)("MuiCard", e)
    }
    e.i(802400), (0, l.g)("MuiCard", ["root"]);
    let h = ["className", "raised"],
        m = (0, s.s)(d.M, {
            name: "MuiCard",
            slot: "Root",
            overridesResolver: (e, a) => a.root
        })(() => ({
            overflow: "hidden"
        })),
        g = r.forwardRef(function(e, a) {
            let r = (0, u.u)({
                    props: e,
                    name: "MuiCard"
                }),
                {
                    className: t,
                    raised: o = !1
                } = r,
                l = (0, i._)(r, h),
                d = (0, n._)({}, r, {
                    raised: o
                }),
                g = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, s.a)({
                        root: ["root"]
                    }, p, a)
                })(d);
            return (0, c.jsx)(m, (0, n._)({
                className: (0, s.c)(g.root, t),
                elevation: o ? 8 : void 0,
                ref: a,
                ownerState: d
            }, l))
        });
    var b = (0, t.default)({
            name: "Card"
        })(function(e, r) {
            var t = r.variant;
            return {
                root: (0, a._)({
                    boxShadow: "none",
                    overflow: "hidden",
                    WebkitMaskImage: "-webkit-radial-gradient(white, black)",
                    backgroundColor: "outlined" === t ? "transparent" : e.palette.surface[200],
                    position: "relative"
                }, e.border.radius.large)
            }
        }),
        v = (0, r.forwardRef)(function(e, t) {
            var n = e.children,
                i = e.classes,
                s = e.variant,
                l = e.className,
                c = (0, a.a)(e, ["children", "classes", "variant", "className"]),
                d = b((0, a._)((0, a._)({}, c), {
                    variant: s
                }), {
                    props: {
                        classes: (0, o.default)(i, l)
                    }
                });
            return r.default.createElement(g, (0, a._)({}, c, {
                variant: "outlined" === s ? "outlined" : "elevation",
                classes: d.classes,
                ref: t
            }), n)
        });
    e.s(["C", 0, v])
}, 509797, e => {
    "use strict";
    var a = e.i(269714);
    e.s(["Card", () => a.C])
}, 102391, e => {
    "use strict";
    var a = e.i(802662);
    e.s(["CircularProgress", () => a.C])
}, 762400, e => {
    "use strict";
    let a = e.i(416340).createContext({});
    e.s(["D", 0, a])
}, 492495, e => {
    "use strict";
    var a = e.i(477763);
    e.i(416340), e.i(169336);
    var r = e.i(708139),
        t = e.i(221628),
        o = e.i(355780),
        n = e.i(250225);

    function i(e) {
        let a = (0, o.a)(e);
        return e !== a && a.styles ? (a.styles.match(/^@layer\s+[^{]*$/) || (a.styles = "@layer global{".concat(a.styles, "}")), a) : e
    }

    function s(e) {
        let {
            styles: a,
            themeId: r,
            defaultTheme: s = {}
        } = e, l = (0, n.u)(s), c = r && l[r] || l, d = "function" == typeof a ? a(c) : a;
        return c.modularCssLayers && (d = Array.isArray(d) ? d.map(e => i("function" == typeof e ? e(c) : e)) : i(d)), (0, t.jsx)(o.G, {
            styles: d
        })
    }
    e.s(["G", 0, function(e) {
        return (0, t.jsx)(s, (0, a._)({}, e, {
            defaultTheme: r.d,
            themeId: r.T
        }))
    }, "a", 0, s])
}, 425935, e => {
    "use strict";
    var a = e.i(169336),
        r = e.i(477763),
        t = e.i(416340),
        o = e.i(226319),
        n = e.i(929709),
        i = e.i(928277),
        s = e.i(221628),
        l = e.i(759599),
        c = e.i(506391);

    function d(e) {
        return (0, a.g)("PrivateSwitchBase", e)
    }
    e.i(333032), (0, i.g)("PrivateSwitchBase", ["root", "checked", "disabled", "input", "edgeStart", "edgeEnd"]);
    let u = ["autoFocus", "checked", "checkedIcon", "className", "defaultChecked", "disabled", "disableFocusRipple", "edge", "icon", "id", "inputProps", "inputRef", "name", "onBlur", "onChange", "onFocus", "readOnly", "required", "tabIndex", "type", "value"],
        p = (0, o.s)(l.B, {
            name: "MuiSwitchBase"
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, r._)({
                padding: 9,
                borderRadius: "50%"
            }, "start" === a.edge && {
                marginLeft: "small" === a.size ? -3 : -12
            }, "end" === a.edge && {
                marginRight: "small" === a.size ? -3 : -12
            })
        }),
        h = (0, o.s)("input", {
            name: "MuiSwitchBase",
            shouldForwardProp: o.r
        })({
            cursor: "inherit",
            position: "absolute",
            opacity: 0,
            width: "100%",
            height: "100%",
            top: 0,
            left: 0,
            margin: 0,
            padding: 0,
            zIndex: 1
        }),
        m = t.forwardRef(function(e, t) {
            let {
                autoFocus: i,
                checked: l,
                checkedIcon: m,
                className: g,
                defaultChecked: b,
                disabled: v,
                disableFocusRipple: f = !1,
                edge: y = !1,
                icon: C,
                id: D,
                inputProps: S,
                inputRef: x,
                name: P,
                onBlur: w,
                onChange: k,
                onFocus: M,
                readOnly: A,
                required: T = !1,
                tabIndex: R,
                type: L,
                value: W
            } = e, E = (0, a._)(e, u), [_, I] = (0, c.u)({
                controlled: l,
                default: !!b,
                name: "SwitchBase",
                state: "checked"
            }), B = (0, n.u)(), F = v;
            B && void 0 === F && (F = B.disabled);
            let N = "checkbox" === L || "radio" === L,
                z = (0, r._)({}, e, {
                    checked: _,
                    disabled: F,
                    disableFocusRipple: f,
                    edge: y
                }),
                O = (e => {
                    let {
                        classes: r,
                        checked: t,
                        disabled: n,
                        edge: i
                    } = e, s = {
                        root: ["root", t && "checked", n && "disabled", i && "edge".concat((0, a.a)(i))],
                        input: ["input"]
                    };
                    return (0, o.a)(s, d, r)
                })(z);
            return (0, s.jsxs)(p, (0, r._)({
                component: "span",
                className: (0, o.c)(O.root, g),
                centerRipple: !0,
                focusRipple: !f,
                disabled: F,
                tabIndex: null,
                role: void 0,
                onFocus: e => {
                    M && M(e), B && B.onFocus && B.onFocus(e)
                },
                onBlur: e => {
                    w && w(e), B && B.onBlur && B.onBlur(e)
                },
                ownerState: z,
                ref: t
            }, E, {
                children: [(0, s.jsx)(h, (0, r._)({
                    autoFocus: i,
                    checked: l,
                    defaultChecked: b,
                    className: O.input,
                    disabled: F,
                    id: N ? D : void 0,
                    name: P,
                    onChange: e => {
                        if (e.nativeEvent.defaultPrevented) return;
                        let a = e.target.checked;
                        I(a), k && k(e, a)
                    },
                    readOnly: A,
                    ref: x,
                    required: T,
                    ownerState: z,
                    tabIndex: R,
                    type: L
                }, "checkbox" === L && void 0 === W ? {} : {
                    value: W
                }, S)), _ ? m : C]
            }))
        });
    e.s(["S", 0, m])
}, 636042, e => {
    "use strict";
    var a = e.i(169336),
        r = e.i(477763),
        t = e.i(416340),
        o = e.i(226319),
        n = e.i(928277),
        i = e.i(221628),
        s = e.i(442632);

    function l(e) {
        return (0, a.g)("MuiTypography", e)
    }
    var c = (0, n.g)("MuiTypography", ["root", "h1", "h2", "h3", "h4", "h5", "h6", "subtitle1", "subtitle2", "body1", "body2", "inherit", "button", "caption", "overline", "alignLeft", "alignRight", "alignCenter", "alignJustify", "noWrap", "gutterBottom", "paragraph"]);
    let d = ["align", "className", "component", "gutterBottom", "noWrap", "paragraph", "variant", "variantMapping"],
        u = (0, o.s)("span", {
            name: "MuiTypography",
            slot: "Root",
            overridesResolver: (e, r) => {
                let {
                    ownerState: t
                } = e;
                return [r.root, t.variant && r[t.variant], "inherit" !== t.align && r["align".concat((0, a.a)(t.align))], t.noWrap && r.noWrap, t.gutterBottom && r.gutterBottom, t.paragraph && r.paragraph]
            }
        })(e => {
            let {
                theme: a,
                ownerState: t
            } = e;
            return (0, r._)({
                margin: 0
            }, "inherit" === t.variant && {
                font: "inherit"
            }, "inherit" !== t.variant && a.typography[t.variant], "inherit" !== t.align && {
                textAlign: t.align
            }, t.noWrap && {
                overflow: "hidden",
                textOverflow: "ellipsis",
                whiteSpace: "nowrap"
            }, t.gutterBottom && {
                marginBottom: "0.35em"
            }, t.paragraph && {
                marginBottom: 16
            })
        }),
        p = {
            h1: "h1",
            h2: "h2",
            h3: "h3",
            h4: "h4",
            h5: "h5",
            h6: "h6",
            subtitle1: "h6",
            subtitle2: "h6",
            body1: "p",
            body2: "p",
            inherit: "p"
        },
        h = {
            primary: "primary.main",
            textPrimary: "text.primary",
            secondary: "secondary.main",
            textSecondary: "text.secondary",
            error: "error.main"
        },
        m = t.forwardRef(function(e, t) {
            let n, c = (0, s.u)({
                    props: e,
                    name: "MuiTypography"
                }),
                m = h[n = c.color] || n,
                g = (0, o.e)((0, r._)({}, c, {
                    color: m
                })),
                {
                    align: b = "inherit",
                    className: v,
                    component: f,
                    gutterBottom: y = !1,
                    noWrap: C = !1,
                    paragraph: D = !1,
                    variant: S = "body1",
                    variantMapping: x = p
                } = g,
                P = (0, a._)(g, d),
                w = (0, r._)({}, g, {
                    align: b,
                    color: m,
                    className: v,
                    component: f,
                    gutterBottom: y,
                    noWrap: C,
                    paragraph: D,
                    variant: S,
                    variantMapping: x
                }),
                k = f || (D ? "p" : x[S] || p[S]) || "span",
                M = (e => {
                    let {
                        align: r,
                        gutterBottom: t,
                        noWrap: n,
                        paragraph: i,
                        variant: s,
                        classes: c
                    } = e, d = {
                        root: ["root", s, "inherit" !== e.align && "align".concat((0, a.a)(r)), t && "gutterBottom", n && "noWrap", i && "paragraph"]
                    };
                    return (0, o.a)(d, l, c)
                })(w);
            return (0, i.jsx)(u, (0, r._)({
                as: k,
                ref: t,
                ownerState: w,
                className: (0, o.c)(M.root, v)
            }, P))
        });
    e.s(["T", 0, m, "t", 0, c])
}, 170135, 287558, e => {
    "use strict";
    var a = e.i(928277),
        r = e.i(169336);

    function t(e) {
        return (0, r.g)("MuiCheckbox", e)
    }
    var o = (0, a.g)("MuiCheckbox", ["root", "checked", "disabled", "indeterminate", "colorPrimary", "colorSecondary", "sizeSmall", "sizeMedium"]);
    e.s(["c", 0, o, "g", 0, t], 170135);
    var n = e.i(477763),
        i = e.i(416340),
        s = e.i(226319),
        l = e.i(425935),
        c = e.i(588393),
        d = e.i(221628),
        u = e.i(442632);
    e.i(333032);
    var p = (0, c.c)((0, d.jsx)("path", {
            d: "M19 5v14H5V5h14m0-2H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"
        }), "CheckBoxOutlineBlank"),
        h = (0, c.c)((0, d.jsx)("path", {
            d: "M19 3H5c-1.11 0-2 .9-2 2v14c0 1.1.89 2 2 2h14c1.11 0 2-.9 2-2V5c0-1.1-.89-2-2-2zm-9 14l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"
        }), "CheckBox"),
        m = (0, c.c)((0, d.jsx)("path", {
            d: "M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-2 10H7v-2h10v2z"
        }), "IndeterminateCheckBox");
    let g = ["checkedIcon", "color", "icon", "indeterminate", "indeterminateIcon", "inputProps", "size", "className"],
        b = (0, s.s)(l.S, {
            shouldForwardProp: e => (0, s.r)(e) || "classes" === e,
            name: "MuiCheckbox",
            slot: "Root",
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.root, t.indeterminate && a.indeterminate, a["size".concat((0, r.a)(t.size))], "default" !== t.color && a["color".concat((0, r.a)(t.color))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: t
            } = e;
            return (0, n._)({
                color: (a.vars || a).palette.text.secondary
            }, !t.disableRipple && {
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat("default" === t.color ? a.vars.palette.action.activeChannel : a.vars.palette[t.color].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, r.b)("default" === t.color ? a.palette.action.active : a.palette[t.color].main, a.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== t.color && {
                ["&.".concat(o.checked, ", &.").concat(o.indeterminate)]: {
                    color: (a.vars || a).palette[t.color].main
                },
                ["&.".concat(o.disabled)]: {
                    color: (a.vars || a).palette.action.disabled
                }
            })
        }),
        v = (0, d.jsx)(h, {}),
        f = (0, d.jsx)(p, {}),
        y = (0, d.jsx)(m, {}),
        C = i.forwardRef(function(e, a) {
            var o, l;
            let c = (0, u.u)({
                    props: e,
                    name: "MuiCheckbox"
                }),
                {
                    checkedIcon: p = v,
                    color: h = "primary",
                    icon: m = f,
                    indeterminate: C = !1,
                    indeterminateIcon: D = y,
                    inputProps: S,
                    size: x = "medium",
                    className: P
                } = c,
                w = (0, r._)(c, g),
                k = C ? D : m,
                M = C ? D : p,
                A = (0, n._)({}, c, {
                    color: h,
                    indeterminate: C,
                    size: x
                }),
                T = (e => {
                    let {
                        classes: a,
                        indeterminate: o,
                        color: i,
                        size: l
                    } = e, c = {
                        root: ["root", o && "indeterminate", "color".concat((0, r.a)(i)), "size".concat((0, r.a)(l))]
                    }, d = (0, s.a)(c, t, a);
                    return (0, n._)({}, a, d)
                })(A);
            return (0, d.jsx)(b, (0, n._)({
                type: "checkbox",
                inputProps: (0, n._)({
                    "data-indeterminate": C
                }, S),
                icon: i.cloneElement(k, {
                    fontSize: null != (o = k.props.fontSize) ? o : x
                }),
                checkedIcon: i.cloneElement(M, {
                    fontSize: null != (l = M.props.fontSize) ? l : x
                }),
                ownerState: A,
                ref: a,
                className: (0, s.c)(T.root, P)
            }, w, {
                classes: T
            }))
        });
    e.s(["M", 0, C], 287558)
}, 28604, e => {
    "use strict";
    var a = e.i(169336),
        r = (0, e.i(802400).c)(a.p.elementType, function(e, a, r, t, o) {
            let n, i = e[a];
            return null == i || "u" < typeof window ? null : ("function" != typeof i || function(e) {
                let {
                    prototype: a = {}
                } = e;
                return !!a.isReactComponent
            }(i) || (n = "Did you accidentally provide a plain function component instead?"), void 0 !== n ? Error("Invalid ".concat(t, " `").concat(o || a, "` supplied to `").concat(r, "`. Expected an element type that can hold a ref. ").concat(n, " For more information see https://mui.com/r/caveat-with-refs-guide")) : null)
        });
    e.s(["e", 0, r])
}, 41392, e => {
    "use strict";
    e.i(477763), e.s(["e", 0, function(e) {
        return e
    }])
}, 669925, 119507, e => {
    "use strict";
    var a = e.i(30941),
        r = e.i(416340),
        t = e.i(936993),
        o = e.i(129210),
        n = e.i(169336),
        i = e.i(477763),
        s = e.i(226319),
        l = e.i(928277),
        c = e.i(762400),
        d = e.i(745984),
        u = e.i(221628),
        p = e.i(691679),
        h = e.i(429677),
        m = e.i(487047),
        g = e.i(442632),
        b = e.i(127633),
        v = e.i(688850);

    function f(e) {
        return (0, n.g)("MuiDialog", e)
    }
    var y = (0, l.g)("MuiDialog", ["root", "scrollPaper", "scrollBody", "container", "paper", "paperScrollPaper", "paperScrollBody", "paperWidthFalse", "paperWidthXs", "paperWidthSm", "paperWidthMd", "paperWidthLg", "paperWidthXl", "paperFullWidth", "paperFullScreen"]);
    let C = ["aria-describedby", "aria-labelledby", "BackdropComponent", "BackdropProps", "children", "className", "disableEscapeKeyDown", "fullScreen", "fullWidth", "maxWidth", "onBackdropClick", "onClick", "onClose", "open", "PaperComponent", "PaperProps", "scroll", "TransitionComponent", "transitionDuration", "TransitionProps"],
        D = (0, s.s)(p.M, {
            name: "MuiDialog",
            slot: "Backdrop",
            overrides: (e, a) => a.backdrop
        })({
            zIndex: -1
        }),
        S = (0, s.s)(h.M, {
            name: "MuiDialog",
            slot: "Root",
            overridesResolver: (e, a) => a.root
        })({
            "@media print": {
                position: "absolute !important"
            }
        }),
        x = (0, s.s)("div", {
            name: "MuiDialog",
            slot: "Container",
            overridesResolver: (e, a) => {
                let {
                    ownerState: r
                } = e;
                return [a.container, a["scroll".concat((0, n.a)(r.scroll))]]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, i._)({
                height: "100%",
                "@media print": {
                    height: "auto"
                },
                outline: 0
            }, "paper" === a.scroll && {
                display: "flex",
                justifyContent: "center",
                alignItems: "center"
            }, "body" === a.scroll && {
                overflowY: "auto",
                overflowX: "hidden",
                textAlign: "center",
                "&::after": {
                    content: '""',
                    display: "inline-block",
                    verticalAlign: "middle",
                    height: "100%",
                    width: "0"
                }
            })
        }),
        P = (0, s.s)(m.M, {
            name: "MuiDialog",
            slot: "Paper",
            overridesResolver: (e, a) => {
                let {
                    ownerState: r
                } = e;
                return [a.paper, a["scrollPaper".concat((0, n.a)(r.scroll))], a["paperWidth".concat((0, n.a)(String(r.maxWidth)))], r.fullWidth && a.paperFullWidth, r.fullScreen && a.paperFullScreen]
            }
        })(e => {
            let {
                theme: a,
                ownerState: r
            } = e;
            return (0, i._)({
                margin: 32,
                position: "relative",
                overflowY: "auto",
                "@media print": {
                    overflowY: "visible",
                    boxShadow: "none"
                }
            }, "paper" === r.scroll && {
                display: "flex",
                flexDirection: "column",
                maxHeight: "calc(100% - 64px)"
            }, "body" === r.scroll && {
                display: "inline-block",
                verticalAlign: "middle",
                textAlign: "left"
            }, !r.maxWidth && {
                maxWidth: "calc(100% - 64px)"
            }, "xs" === r.maxWidth && {
                maxWidth: "px" === a.breakpoints.unit ? Math.max(a.breakpoints.values.xs, 444) : "max(".concat(a.breakpoints.values.xs).concat(a.breakpoints.unit, ", 444px)"),
                ["&.".concat(y.paperScrollBody)]: {
                    [a.breakpoints.down(Math.max(a.breakpoints.values.xs, 444) + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, r.maxWidth && "xs" !== r.maxWidth && {
                maxWidth: "".concat(a.breakpoints.values[r.maxWidth]).concat(a.breakpoints.unit),
                ["&.".concat(y.paperScrollBody)]: {
                    [a.breakpoints.down(a.breakpoints.values[r.maxWidth] + 64)]: {
                        maxWidth: "calc(100% - 64px)"
                    }
                }
            }, r.fullWidth && {
                width: "calc(100% - 64px)"
            }, r.fullScreen && {
                margin: 0,
                width: "100%",
                maxWidth: "100%",
                height: "100%",
                maxHeight: "none",
                borderRadius: 0,
                ["&.".concat(y.paperScrollBody)]: {
                    margin: 0,
                    maxWidth: "100%"
                }
            })
        }),
        w = r.forwardRef(function(e, a) {
            let t = (0, g.u)({
                    props: e,
                    name: "MuiDialog"
                }),
                o = (0, d.u)(),
                l = {
                    enter: o.transitions.duration.enteringScreen,
                    exit: o.transitions.duration.leavingScreen
                },
                {
                    "aria-describedby": p,
                    "aria-labelledby": h,
                    BackdropComponent: y,
                    BackdropProps: w,
                    children: k,
                    className: M,
                    disableEscapeKeyDown: A = !1,
                    fullScreen: T = !1,
                    fullWidth: R = !1,
                    maxWidth: L = "sm",
                    onBackdropClick: W,
                    onClick: E,
                    onClose: _,
                    open: I,
                    PaperComponent: B = m.M,
                    PaperProps: F = {},
                    scroll: N = "paper",
                    TransitionComponent: z = v.F,
                    transitionDuration: O = l,
                    TransitionProps: G
                } = t,
                U = (0, n._)(t, C),
                j = (0, i._)({}, t, {
                    disableEscapeKeyDown: A,
                    fullScreen: T,
                    fullWidth: R,
                    maxWidth: L,
                    scroll: N
                }),
                H = (e => {
                    let {
                        classes: a,
                        scroll: r,
                        maxWidth: t,
                        fullWidth: o,
                        fullScreen: i
                    } = e, l = {
                        root: ["root"],
                        container: ["container", "scroll".concat((0, n.a)(r))],
                        paper: ["paper", "paperScroll".concat((0, n.a)(r)), "paperWidth".concat((0, n.a)(String(t))), o && "paperFullWidth", i && "paperFullScreen"]
                    };
                    return (0, s.a)(l, f, a)
                })(j),
                V = r.useRef(),
                K = (0, b.u)(h),
                X = r.useMemo(() => ({
                    titleId: K
                }), [K]);
            return (0, u.jsx)(S, (0, i._)({
                className: (0, s.c)(H.root, M),
                closeAfterTransition: !0,
                components: {
                    Backdrop: D
                },
                componentsProps: {
                    backdrop: (0, i._)({
                        transitionDuration: O,
                        as: y
                    }, w)
                },
                disableEscapeKeyDown: A,
                onClose: _,
                open: I,
                ref: a,
                onClick: e => {
                    E && E(e), V.current && (V.current = null, W && W(e), _ && _(e, "backdropClick"))
                },
                ownerState: j
            }, U, {
                children: (0, u.jsx)(z, (0, i._)({
                    appear: !0,
                    in: I,
                    timeout: O,
                    role: "presentation"
                }, G, {
                    children: (0, u.jsx)(x, {
                        className: (0, s.c)(H.container),
                        onMouseDown: e => {
                            V.current = e.target === e.currentTarget
                        },
                        ownerState: j,
                        children: (0, u.jsx)(P, (0, i._)({
                            as: B,
                            elevation: 24,
                            role: "dialog",
                            "aria-describedby": p,
                            "aria-labelledby": K
                        }, F, {
                            className: (0, s.c)(H.paper, F.className),
                            ownerState: j,
                            children: (0, u.jsx)(c.D.Provider, {
                                value: X,
                                children: k
                            })
                        }))
                    })
                }))
            }))
        });
    e.s(["M", 0, w, "d", 0, y], 119507), e.i(149285);
    var k = (0, t.default)({
            name: "Dialog"
        })(function(e) {
            return {
                paper: (0, a._)({
                    boxShadow: e.elevation.overlay,
                    backgroundColor: e.palette.surface[300]
                }, e.border.radius.large),
                xsmallBreakpointWidthOverride: {}
            }
        }),
        M = (0, r.forwardRef)(function(e, t) {
            var n = e.classes,
                i = e.children;
            e.fullScreen;
            var s = e.className,
                l = e.maxWidth,
                c = (0, a.a)(e, ["classes", "children", "fullScreen", "className", "maxWidth"]),
                d = k(void 0, {
                    props: {
                        classes: (0, o.default)(n, s)
                    }
                });
            return r.default.createElement(w, (0, a._)({}, c, {
                fullScreen: !1,
                classes: d.classes,
                maxWidth: "XSmall" === l ? "Small" : l,
                ref: t
            }), i)
        });
    e.s(["default", 0, M], 669925)
}, 547710, e => {
    "use strict";
    var a = e.i(669925);
    e.s(["Dialog", () => a.default])
}, 319266, 277322, 793439, 856082, e => {
    "use strict";
    var a = e.i(30941),
        r = e.i(416340),
        t = e.i(936993),
        o = e.i(129210),
        n = e.i(169336),
        i = e.i(477763),
        s = e.i(226319),
        l = e.i(928277),
        c = (0, l.g)("MuiDialogTitle", ["root"]);
    e.s(["d", 0, c, "g", 0, function(e) {
        return (0, n.g)("MuiDialogTitle", e)
    }], 277322);
    var d = e.i(221628),
        u = e.i(442632);

    function p(e) {
        return (0, n.g)("MuiDialogContent", e)
    }
    var h = (0, l.g)("MuiDialogContent", ["root", "dividers"]);
    let m = ["className", "dividers"],
        g = (0, s.s)("div", {
            name: "MuiDialogContent",
            slot: "Root",
            overridesResolver: (e, a) => {
                let {
                    ownerState: r
                } = e;
                return [a.root, r.dividers && a.dividers]
            }
        })(e => {
            let {
                theme: a,
                ownerState: r
            } = e;
            return (0, i._)({
                flex: "1 1 auto",
                WebkitOverflowScrolling: "touch",
                overflowY: "auto",
                padding: "20px 24px"
            }, r.dividers ? {
                padding: "16px 24px",
                borderTop: "1px solid ".concat((a.vars || a).palette.divider),
                borderBottom: "1px solid ".concat((a.vars || a).palette.divider)
            } : {
                [".".concat(c.root, " + &")]: {
                    paddingTop: 0
                }
            })
        }),
        b = r.forwardRef(function(e, a) {
            let r = (0, u.u)({
                    props: e,
                    name: "MuiDialogContent"
                }),
                {
                    className: t,
                    dividers: o = !1
                } = r,
                l = (0, n._)(r, m),
                c = (0, i._)({}, r, {
                    dividers: o
                }),
                h = (e => {
                    let {
                        classes: a,
                        dividers: r
                    } = e;
                    return (0, s.a)({
                        root: ["root", r && "dividers"]
                    }, p, a)
                })(c);
            return (0, d.jsx)(g, (0, i._)({
                className: (0, s.c)(h.root, t),
                ownerState: c,
                ref: a
            }, l))
        });
    e.s(["D", 0, b, "d", 0, h], 793439);
    var v = (0, t.default)({
            name: "DialogContent"
        })({
            root: {
                paddingLeft: 20,
                paddingRight: 20,
                paddingBottom: 12
            },
            dividers: {
                margin: "0 24px",
                padding: "16px 0"
            }
        }),
        f = (0, r.forwardRef)(function(e, t) {
            var n = e.classes,
                i = e.children,
                s = e.className,
                l = (0, a.a)(e, ["classes", "children", "className"]),
                c = v(void 0, {
                    props: {
                        classes: (0, o.default)(n, s)
                    }
                });
            return r.default.createElement(b, (0, a._)({}, l, {
                classes: c.classes,
                ref: t
            }), i)
        });
    e.s(["default", 0, f], 856082), e.s(["DialogContent", 0, f], 319266)
}, 416408, e => {
    "use strict";
    e.s(["f", 0, function(e) {
        let {
            props: a,
            states: r,
            muiFormControl: t
        } = e;
        return r.reduce((e, r) => (e[r] = a[r], t && void 0 === a[r] && (e[r] = t[r]), e), {})
    }])
}, 91375, e => {
    "use strict";
    var a = e.i(477763),
        r = e.i(169336),
        t = e.i(416340),
        o = e.i(221628);
    let n = ["value"],
        i = t.createContext();
    e.s(["R", 0, function(e) {
        let {
            value: t
        } = e, s = (0, r._)(e, n);
        return (0, o.jsx)(i.Provider, (0, a._)({
            value: null == t || t
        }, s))
    }, "u", 0, () => {
        let e = t.useContext(i);
        return null != e && e
    }])
}, 319114, e => {
    "use strict";
    var a = e.i(928277),
        r = e.i(169336),
        t = (0, a.g)("MuiMenuItem", ["root", "focusVisible", "dense", "disabled", "divider", "gutters", "selected"]);
    e.s(["g", 0, function(e) {
        return (0, r.g)("MuiMenuItem", e)
    }, "m", 0, t])
}, 311591, e => {
    "use strict";
    var a = e.i(928277),
        r = e.i(169336),
        t = (0, a.g)("MuiPaper", ["root", "rounded", "outlined", "elevation", "elevation0", "elevation1", "elevation2", "elevation3", "elevation4", "elevation5", "elevation6", "elevation7", "elevation8", "elevation9", "elevation10", "elevation11", "elevation12", "elevation13", "elevation14", "elevation15", "elevation16", "elevation17", "elevation18", "elevation19", "elevation20", "elevation21", "elevation22", "elevation23", "elevation24"]);
    e.s(["g", 0, function(e) {
        return (0, r.g)("MuiPaper", e)
    }, "p", 0, t])
}, 611043, 900926, e => {
    "use strict";
    var a = e.i(30941),
        r = e.i(416340),
        t = e.i(892173),
        o = e.i(936993),
        n = e.i(129210),
        i = e.i(636042);
    e.i(221628);
    var s = (0, o.default)({
            name: "Typography"
        })(function(e) {
            return {
                root: {
                    textDecoration: "none",
                    fontStyle: "normal"
                },
                h1: e.typography.h1,
                h2: e.typography.h2,
                h3: e.typography.h3,
                h4: e.typography.h4,
                h5: e.typography.h5,
                h6: e.typography.h6,
                subtitle1: e.typography.subtitle1,
                subtitle2: e.typography.subtitle2,
                body1: e.typography.body1,
                body2: e.typography.body2,
                caption: e.typography.caption,
                captionHeader: e.typography.captionHeader,
                captionBody: e.typography.captionBody,
                captionSmall: e.typography.captionSmall,
                button: e.typography.button,
                overline: e.typography.overline,
                footer: e.typography.footer,
                code: e.typography.code,
                codeDense: e.typography.codeDense,
                chip: e.typography.chip,
                largeLabel1: e.typography.largeLabel1,
                largeLabel2: e.typography.largeLabel2,
                legalDisclaimer: e.typography.legalDisclaimer,
                smallLabel1: e.typography.smallLabel1,
                smallLabel2: e.typography.smallLabel2,
                buttonLarge: e.typography.buttonLarge,
                buttonMedium: e.typography.buttonMedium,
                buttonSmall: e.typography.buttonSmall,
                tooltip: e.typography.tooltip,
                alertTitle: e.typography.alertTitle,
                tableHead: e.typography.tableHead,
                avatarLetter: e.typography.avatarLetter,
                hero: e.typography.hero,
                italics: {
                    fontStyle: "italic"
                },
                underline: {
                    textDecoration: "underline"
                },
                colorPrimary: {
                    color: e.palette.content.standard
                },
                colorSecondary: {
                    color: e.palette.content.muted
                },
                colorDisabled: {
                    color: e.palette.content.disabled
                },
                colorError: {
                    color: e.palette.components.typography.errorContent
                },
                colorInfo: {
                    color: e.palette.components.typography.infoContent
                },
                colorWarning: {
                    color: e.palette.components.typography.warningContent
                },
                colorSuccess: {
                    color: e.palette.components.typography.successContent
                }
            }
        }),
        l = (0, r.forwardRef)(function(e, o) {
            var l, c = e.classes,
                d = e.children,
                u = e.paragraph,
                p = void 0 !== u && u,
                h = e.component,
                m = e.color,
                g = e.variant,
                b = e.italics,
                v = e.underline,
                f = e.className,
                y = (0, a.a)(e, ["classes", "children", "paragraph", "component", "color", "variant", "italics", "underline", "className"]),
                C = s(void 0, {
                    props: {
                        classes: (0, n.default)(c, f)
                    }
                }),
                D = C.classes,
                S = C.cx;
            return r.default.createElement(i.T, (0, a._)({}, y, {
                classes: (0, a._)((0, a._)({}, D), {
                    root: S(D[void 0 === g ? "body1" : g], D["color".concat((0, t.capitalize)(void 0 === m ? "inherit" : m))], ((l = {})[D.italics] = void 0 !== b && b, l[D.underline] = void 0 !== v && v, l), D.root)
                }),
                ref: o,
                paragraph: p,
                component: void 0 === h ? p ? "p" : "span" : h,
                color: "inherit",
                variant: "inherit"
            }), d)
        });
    e.s(["default", 0, l], 900926), e.s(["Typography", 0, l], 611043)
}, 506391, e => {
    "use strict";
    var a = e.i(416340);
    e.s(["u", 0, function(e) {
        let {
            controlled: r,
            default: t,
            name: o,
            state: n = "value"
        } = e, {
            current: i
        } = a.useRef(void 0 !== r), [s, l] = a.useState(t);
        return [i ? r : s, a.useCallback(e => {
            i || l(e)
        }, [])]
    }])
}, 756684, e => {
    "use strict";
    var a = e.i(416340),
        r = "u" > typeof window ? a.useLayoutEffect : a.useEffect;
    e.s(["u", 0, r])
}, 823079, e => {
    "use strict";
    var a = e.i(416340);

    function r(e, a) {
        "function" == typeof e ? e(a) : e && (e.current = a)
    }
    e.s(["s", 0, r, "u", 0, function() {
        for (var e = arguments.length, t = Array(e), o = 0; o < e; o++) t[o] = arguments[o];
        return a.useMemo(() => t.every(e => null == e) ? null : e => {
            t.forEach(a => {
                r(a, e)
            })
        }, t)
    }])
}, 929709, e => {
    "use strict";
    var a = e.i(416340);
    let r = a.createContext(void 0);
    e.s(["F", 0, r, "u", 0, function() {
        return a.useContext(r)
    }])
}, 127633, e => {
    "use strict";
    var a = e.i(416340);
    let r = 0,
        t = a["useId".toString()];
    e.s(["u", 0, function(e) {
        if (void 0 !== t) {
            let a = t();
            return null != e ? e : a
        }
        return function(e) {
            let [t, o] = a.useState(e), n = e || t;
            return a.useEffect(() => {
                null == t && (r += 1, o("mui-".concat(r)))
            }, [t]), n
        }(e)
    }])
}, 576070, 249707, e => {
    "use strict";
    var a = e.i(416340);
    let r = {},
        t = [];
    class o {
        static create() {
            return new o
        }
        start(e, a) {
            this.clear(), this.currentId = setTimeout(() => {
                this.currentId = null, a()
            }, e)
        }
        constructor() {
            this.currentId = null, this.clear = () => {
                null !== this.currentId && (clearTimeout(this.currentId), this.currentId = null)
            }, this.disposeEffect = () => this.clear
        }
    }
    e.s(["T", 0, o, "u", 0, function() {
        var e, n;
        let i, s = (n = o.create, (i = a.useRef(r)).current === r && (i.current = n(void 0)), i).current;
        return e = s.disposeEffect, a.useEffect(e, t), s
    }], 249707);
    let n = !0,
        i = !1,
        s = new o,
        l = {
            text: !0,
            search: !0,
            url: !0,
            tel: !0,
            email: !0,
            password: !0,
            number: !0,
            date: !0,
            month: !0,
            week: !0,
            time: !0,
            datetime: !0,
            "datetime-local": !0
        };

    function c(e) {
        e.metaKey || e.altKey || e.ctrlKey || (n = !0)
    }

    function d() {
        n = !1
    }

    function u() {
        "hidden" === this.visibilityState && i && (n = !0)
    }
    e.s(["u", 0, function() {
        let e = a.useCallback(e => {
                var a;
                null != e && ((a = e.ownerDocument).addEventListener("keydown", c, !0), a.addEventListener("mousedown", d, !0), a.addEventListener("pointerdown", d, !0), a.addEventListener("touchstart", d, !0), a.addEventListener("visibilitychange", u, !0))
            }, []),
            r = a.useRef(!1);
        return {
            isFocusVisibleRef: r,
            onFocus: function(e) {
                return !! function(e) {
                    let {
                        target: a
                    } = e;
                    try {
                        return a.matches(":focus-visible")
                    } catch (e) {}
                    return n || function(e) {
                        let {
                            type: a,
                            tagName: r
                        } = e;
                        return !("INPUT" !== r || !l[a] || e.readOnly) || "TEXTAREA" === r && !e.readOnly || !!e.isContentEditable
                    }(a)
                }(e) && (r.current = !0, !0)
            },
            onBlur: function() {
                return !!r.current && (i = !0, s.start(100, () => {
                    i = !1
                }), r.current = !1, !0)
            },
            ref: e
        }
    }], 576070)
}, 416334, e => {
    "use strict";
    var a = e.i(477763),
        r = e.i(169336),
        t = e.i(548601),
        o = e.i(823079);
    let n = ["className", "elementType", "ownerState", "externalForwardedProps", "getSlotOwnerState", "internalForwardedProps"],
        i = ["component", "slots", "slotProps"],
        s = ["component"];
    e.s(["u", 0, function(e, l) {
        let {
            className: c,
            elementType: d,
            ownerState: u,
            externalForwardedProps: p,
            getSlotOwnerState: h,
            internalForwardedProps: m
        } = l, g = (0, r._)(l, n), {
            component: b,
            slots: v = {
                [e]: void 0
            },
            slotProps: f = {
                [e]: void 0
            }
        } = p, y = (0, r._)(p, i), C = v[e] || d, D = (0, t.r)(f[e], u), S = (0, t.m)((0, a._)({
            className: c
        }, g, {
            externalForwardedProps: "root" === e ? y : void 0,
            externalSlotProps: D
        })), {
            props: {
                component: x
            },
            internalRef: P
        } = S, w = (0, r._)(S.props, s), k = (0, o.u)(P, null == D ? void 0 : D.ref, l.ref), M = h ? h(w) : {}, A = (0, a._)({}, u, M), T = "root" === e ? x || b : x, R = (0, t.a)(C, (0, a._)({}, "root" === e && !b && !v[e] && m, "root" !== e && !v[e] && m, w, T && {
            as: T
        }, {
            ref: k
        }), A);
        return Object.keys(M).forEach(e => {
            delete R[e]
        }), [C, R]
    }])
}, 577677, e => {
    "use strict";
    var a = e.i(932741),
        r = e.i(250225);
    e.s(["u", 0, function(e) {
        let {
            props: t,
            name: o,
            defaultTheme: n,
            themeId: i
        } = e, s = (0, r.u)(n);
        return i && (s = s[i] || s), (0, a.g)({
            theme: s,
            name: o,
            props: t
        })
    }])
}, 87034, 900706, e => {
    "use strict";
    var a = e.i(154897);
    e.i(416340);
    var r = a.u;
    e.s(["default", 0, r], 900706), e.s(["useMediaQuery", 0, r], 87034)
}, 892173, 932741, 154897, e => {
    "use strict";
    var a = e.i(745984),
        r = e.i(477763),
        t = e.i(169336),
        o = e.i(416340),
        n = e.i(221628),
        i = e.i(226319),
        s = e.i(59545);

    function l(e) {
        let {
            theme: a,
            name: r,
            props: t
        } = e;
        return a && a.components && a.components[r] && a.components[r].defaultProps ? (0, s.r)(a.components[r].defaultProps, t) : t
    }
    e.s(["g", 0, l], 932741);
    var c = e.i(756684),
        d = e.i(704316);
    let u = o.useSyncExternalStore;

    function p(e) {
        let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
            r = (0, d.u)(),
            t = "u" > typeof window && void 0 !== window.matchMedia,
            {
                defaultMatches: n = !1,
                matchMedia: i = t ? window.matchMedia : null,
                ssrMatchMedia: s = null,
                noSsr: p = !1
            } = l({
                name: "MuiUseMediaQuery",
                props: a,
                theme: r
            }),
            h = "function" == typeof e ? e(r) : e;
        return (void 0 !== u ? function(e, a, r, t, n) {
            let i = o.useCallback(() => a, [a]),
                s = o.useMemo(() => {
                    if (n && r) return () => r(e).matches;
                    if (null !== t) {
                        let {
                            matches: a
                        } = t(e);
                        return () => a
                    }
                    return i
                }, [i, e, t, n, r]),
                [l, c] = o.useMemo(() => {
                    if (null === r) return [i, () => () => {}];
                    let a = r(e);
                    return [() => a.matches, e => (a.addListener(e), () => {
                        a.removeListener(e)
                    })]
                }, [i, r, e]);
            return u(c, l, s)
        } : function(e, a, r, t, n) {
            let [i, s] = o.useState(() => n && r ? r(e).matches : t ? t(e).matches : a);
            return (0, c.u)(() => {
                let a = !0;
                if (!r) return;
                let t = r(e),
                    o = () => {
                        a && s(t.matches)
                    };
                return o(), t.addListener(o), () => {
                    a = !1, t.removeListener(o)
                }
            }, [e, r]), i
        })(h = h.replace(/^@media( ?)/m, ""), n, i, s, p)
    }
    e.s(["u", 0, p], 154897), e.i(41392);
    var h = e.i(928277);
    let m = ["initialWidth", "width"],
        g = ["xs", "sm", "md", "lg", "xl"],
        b = function(e, a) {
            let r = !(arguments.length > 2) || void 0 === arguments[2] || arguments[2];
            return r ? g.indexOf(e) <= g.indexOf(a) : g.indexOf(e) < g.indexOf(a)
        },
        v = function(e, a) {
            let r = arguments.length > 2 && void 0 !== arguments[2] && arguments[2];
            return r ? g.indexOf(a) <= g.indexOf(e) : g.indexOf(a) < g.indexOf(e)
        };
    (function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
        return i => {
            let {
                withTheme: s = !1,
                noSSR: d = !1,
                initialWidth: u
            } = e;
            return function(e) {
                let h = (0, a.u)(),
                    g = e.theme || h,
                    b = l({
                        theme: g,
                        name: "MuiWithWidth",
                        props: e
                    }),
                    {
                        initialWidth: v,
                        width: f
                    } = b,
                    y = (0, t._)(b, m),
                    [C, D] = o.useState(!1);
                (0, c.u)(() => {
                    D(!0)
                }, []);
                let S = g.breakpoints.keys.slice().reverse().reduce((e, a) => {
                        let r = p(g.breakpoints.up(a));
                        return !e && r ? a : e
                    }, null),
                    x = (0, r._)({
                        width: f || (C || d ? S : void 0) || v || u
                    }, s ? {
                        theme: g
                    } : {}, y);
                return void 0 === x.width ? null : (0, n.jsx)(i, (0, r._)({}, x))
            }
        }
    })()(function(e) {
        let {
            children: r,
            only: t,
            width: i
        } = e, s = (0, a.u)(), l = !0;
        if (t)
            if (Array.isArray(t)) {
                for (let e = 0; e < t.length; e += 1)
                    if (i === t[e]) {
                        l = !1;
                        break
                    }
            } else t && i === t && (l = !1);
        if (l)
            for (let a = 0; a < s.breakpoints.keys.length; a += 1) {
                let r = s.breakpoints.keys[a],
                    t = e["".concat(r, "Up")],
                    o = e["".concat(r, "Down")];
                if (t && b(r, i) || o && v(r, i)) {
                    l = !1;
                    break
                }
            }
        return l ? (0, n.jsx)(o.Fragment, {
            children: r
        }) : null
    }), (0, h.g)("PrivateHiddenCss", ["root", "xlDown", "xlUp", "onlyXl", "lgDown", "lgUp", "onlyLg", "mdDown", "mdUp", "onlyMd", "smDown", "smUp", "onlySm", "xsDown", "xsUp", "onlyXs"]);
    (0, i.s)("div", {
        name: "PrivateHiddenCss",
        slot: "Root"
    })(e => {
        let {
            theme: a,
            ownerState: t
        } = e, o = {
            display: "none"
        };
        return (0, r._)({}, t.breakpoints.map(e => {
            let {
                breakpoint: r,
                dir: t
            } = e;
            return "only" === t ? {
                [a.breakpoints.only(r)]: o
            } : "up" === t ? {
                [a.breakpoints.up(r)]: o
            } : {
                [a.breakpoints.down(r)]: o
            }
        }).reduce((e, a) => (Object.keys(a).forEach(r => {
            e[r] = a[r]
        }), e), {}))
    });
    var f = a.u;
    e.s(["alpha", 0, function(e, a) {
        return a < 16 ? "".concat(e, "0").concat(a.toString(16)) : "".concat(e).concat(a.toString(16))
    }, "capitalize", 0, function(e) {
        return e.charAt(0).toUpperCase() + e.slice(1)
    }, "useTheme", 0, f], 892173)
}]);

//# debugId=86e9a557-2f02-a411-2891-17133b069c26
//# sourceMappingURL=14kvygaodg0j-.js.map