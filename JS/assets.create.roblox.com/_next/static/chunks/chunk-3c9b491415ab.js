;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "8866930c-df20-0a5b-3e1a-cd242e7615cc")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 220311, t => {
    "use strict";
    var r, a = ((r = a || {}).Home = "CreatorDashboard.Home", r.RoadMap = "CreatorDashboard.RoadMap", r.Features = "CreatorDashboard.Features", r.Landing = "CreatorDashboard.Landing", r.Navigation = "CreatorDashboard.Navigation", r.Metadata = "CreatorDashboard.Metadata", r.LogIn = "CreatorDashboard.LogIn", r.SignUp = "CreatorDashboard.SignUp", r.DevEx = "CreatorDashboard.DevEx", r.TaxDocumentation = "CreatorDashboard.TaxDocumentation", r.Controls = "CreatorDashboard.Controls", r.Error = "CreatorDashboard.Error", r.Creations = "CreatorDashboard.Creations", r.AgreementsManager = "CreatorDashboard.AgreementsManager", r.AssetTypes = "CreatorDashboard.AssetTypes", r.DevStatsGame = "CreatorDashboard.DevStatsGame", r.DevStatsExport = "CreatorDashboard.DevStatsExport", r.DevStatsPremium = "CreatorDashboard.EngagementPayout", r.DeveloperQuestionnaire = "CreatorDashboard.DeveloperQuestionnaire", r.Analytics = "CreatorDashboard.Analytics", r.AudienceReach = "CreatorDashboard.AudienceReach", r.ExperienceAlerts = "CreatorDashboard.ExperienceAlerts", r.ImmersiveAdsAnalytics = "CreatorDashboard.ImmersiveAdsAnalytics", r.Insights = "CreatorDashboard.Insights", r.AvatarAnalytics = "CreatorDashboard.AvatarAnalytics", r.StoreAnalytics = "CreatorDashboard.StoreAnalytics", r.ShareLinkAnalytics = "CreatorDashboard.ShareLinkAnalytics", r.ComputeTelemetry = "CreatorDashboard.ComputeTelemetry", r.GameLocalization = "CreatorDashboard.GameLocalization", r.GameLocalizationLanguages = "CreatorDashboard.GameLocalizationLanguages", r.GameLocalizationReports = "CreatorDashboard.GameLocalizationReports", r.GameLocalizationSettings = "CreatorDashboard.GameLocalizationSettings", r.GameLocalizationTranslators = "CreatorDashboard.GameLocalizationTranslators", r.GameLocalizationTableManagement = "CreatorDashboard.GameLocalizationTableManagement", r.GameTranslation = "CreatorDashboard.GameTranslation", r.GameInfoTranslation = "CreatorDashboard.GameInfoTranslation", r.GameStringTranslation = "CreatorDashboard.GameStringTranslation", r.GameImageTranslation = "CreatorDashboard.GameImageTranslation", r.GameProductTranslation = "CreatorDashboard.GameProductTranslation", r.ConfigureItem = "CreatorDashboard.ConfigureItem", r.OpenCloud = "CreatorDashboard.OpenCloud", r.OAuth = "CreatorDashboard.OAuth", r.ScopeSystem = "CreatorDashboard.ScopeSystem", r.AgreementsUpdate = "CreatorDashboard.AgreementsUpdate", r.AssetAnalytics = "CreatorDashboard.AssetAnalytics", r.UniverseConfigAndExperimentation = "CreatorDashboard.UniverseConfigAndExperimentation", r.Table = "CreatorDashboard.Table", r.TranslatorPortal = "CreatorDashboard.TranslatorPortal", r.Badges = "CreatorDashboard.Badges", r.DeveloperProducts = "CreatorDashboard.DeveloperProducts", r.SocialLinks = "CreatorDashboard.SocialLinks", r.Updates = "CreatorDashboard.Updates", r.Places = "CreatorDashboard.Places", r.PlaceThumbnails = "CreatorDashboard.PlaceThumbnails", r.GenreType = "CreatorDashboard.GenreType", r.AssetUpload = "CreatorDashboard.AssetUpload", r.AssetPermissions = "CreatorDashboard.AssetPermissions", r.Access = "CreatorDashboard.Access", r.Secrets = "CreatorDashboard.Secrets", r.PlaceAccess = "CreatorDashboard.PlaceAccess", r.Passes = "CreatorDashboard.Passes", r.ActivityFeed = "CreatorDashboard.ActivityFeed", r.VersionHistory = "CreatorDashboard.VersionHistory", r.Notifications = "CreatorDashboard.Notifications", r.DeveloperItem = "CreatorDashboard.DeveloperItem", r.Settings = "CreatorDashboard.Settings", r.SendrNotificationPreferences = "Notifications.Preferences", r.CloudServices = "CreatorDashboard.CloudServices", r.Community = "CreatorDashboard.Community", r.Preferences = "CreatorDashboard.Preferences", r.ExperienceSubscriptions = "CreatorDashboard.DeveloperSubscriptions", r.Commerce = "CreatorDashboard.Commerce", r.CreatorAccount = "CreatorDashboard.CreatorAccount", r.Advanced = "CreatorDashboard.Advanced", r.RightsPortal = "CreatorDashboard.RightsPortal", r.Transactions = "CreatorDashboard.Transactions", r.DataCollection = "CreatorDashboard.DataCollection", r.DataCollectionSettings = "CreatorDashboard.DataCollectionSettings", r.DataCollectionTerms = "CreatorDashboard.DataCollectionTerms", r.MarketplaceOnboarding = "CreatorDashboard.MarketplaceOnboarding", r.Organization = "CreatorDashboard.Organization", r.CommunicationSettings = "CreatorDashboard.CommunicationSettings", r.UnifiedNavigation = "CreatorDocumentation.Navigation", r.DeveloperLanding = "CreatorDashboard.DeveloperLanding", r.Payouts = "CreatorDashboard.Payouts", r.RevenueShareAgreements = "CreatorDashboard.RevenueShareAgreements", r.DataSharingSettingsV2 = "CreatorDashboard.DataSharingSettingsV2", r.PriceOptimization = "CreatorDashboard.PriceOptimization", r.SafetyControls = "CreatorDashboard.SafetyControls", r.AntiCheat = "CreatorDashboard.AntiCheat", r.ShareLinksManagement = "CreatorDashboard.ShareLinksManagament", r.ShareLinkPromo = "CreatorDashboard.ShareLinkPromo", r.FiatPaidAccess = "CreatorDashboard.FiatPaidAccess", r.PublicPublish = "CreatorDashboard.PublicReach", r.Genres = "Experience.Genre", r.OwnershipTransfer = "CreatorDashboard.OwnershipTransfer", r.DocsAssistant = "Feature.QNAB", r.AssetPrivacy = "CreatorDashboard.AssetPrivacy", r.AffiliateProgram = "CreatorDashboard.AffiliateProgram", r.PlayerFeedback = "CreatorDashboard.PlayerFeedback", r.RegionalPricing = "CreatorDashboard.RegionalPricing", r.AnalyticsAssistant = "CreatorDashboard.AnalyticsAssistant", r.Matchmaking = "CreatorDashboard.CustomMatchmaking", r.Licenses = "CreatorDashboard.Licenses", r.Permissions = "CreatorDashboard.Permissions", r.ReferralRewards = "CreatorDashboard.ReferralRewards", r.DynamicPriceCheck = "CreatorDashboard.DynamicPriceCheck", r.NotApproved = "Feature.NotApproved", r.Moderation = "Feature.Moderation", r.AppealsPortal = "Feature.AppealsPortal", r.DashboardModeration = "CreatorDashboard.Moderation", r.Environments = "CreatorDashboard.Environments", r.PageTitles = "CreatorDashboard.PageTitles", r.CreatorRewards = "CreatorDashboard.CreatorRewards", r.CreatorRewardsLanding = "CreatorDashboard.CreatorRewardsLanding", r.ExperienceReleases = "CreatorDashboard.ExperienceReleases", r.Variants = "CreatorDashboard.Variants", r.ServerManagement = "CreatorDashboard.ServerManagement", r.Safety = "CreatorDashboard.Safety", r.CommonUIControls = "CommonUI.Controls", r.CommonUIMessages = "CommonUI.Messages", r.Taxonomy = "CreatorDashboard.Taxonomy", r.RecommendationService = "CreatorDashboard.RecommendationService", r.DataStoresManager = "CreatorDashboard.DataStoresManager", r.AccessPolicy = "CreatorDashboard.AccessPolicy", r.Groups = "Feature.Groups", r.GroupManagement = "Feature.GroupManagement", r.Privacy = "Feature.Privacy", r.ManagedPricing = "CreatorDashboard.ManagedPricing", r.HardCodedPrices = "CreatorDashboard.HardCodedPrices", r.SocialLinksAgeVerificationUpsell = "Feature.SocialLinks", r.PurchaseError = "IAPExperience.PurchaseError", r.TalentHubV2 = "CreatorDashboard.TalentHubV2", r.Leaderboards = "CreatorDashboard.Leaderboards", r.PersonalizedShop = "CreatorDashboard.PersonalizedShop", r.PresetChat = "CreatorDashboard.PresetChat", r);
    t.s(["default", 0, a])
}, 881670, t => {
    "use strict";
    var r = t.i(220311);
    t.s(["TranslationNamespace", () => r.default])
}, 691551, 947287, 571709, t => {
    "use strict";
    var r, a, n = t.i(164688);
    t.s(["withEmotionCache", () => n.w], 691551), t.s(["CacheProvider", () => n.C], 947287);
    var o = t.i(416340),
        s = t.i(905625),
        i = t.i(327209),
        c = t.i(220454);
    t.i(781979);
    var l = function(t, r) {
        var a = arguments;
        if (null == r || !n.h.call(r, "css")) return o.createElement.apply(void 0, a);
        var s = a.length,
            i = Array(s);
        i[0] = n.E, i[1] = (0, n.c)(t, r);
        for (var c = 2; c < s; c++) i[c] = a[c];
        return o.createElement.apply(null, i)
    };
    r = l || (l = {}), a || (a = r.JSX || (r.JSX = {}));
    var u = (0, n.w)(function(t, r) {
        var a = t.styles,
            l = (0, c.serializeStyles)([a], void 0, o.useContext(n.T)),
            u = o.useRef();
        return (0, i.useInsertionEffectWithLayoutFallback)(function() {
            var t = r.key + "-global",
                a = new r.sheet.constructor({
                    key: t,
                    nonce: r.sheet.nonce,
                    container: r.sheet.container,
                    speedy: r.sheet.isSpeedy
                }),
                n = !1,
                o = document.querySelector('style[data-emotion="' + t + " " + l.name + '"]');
            return r.sheet.tags.length && (a.before = r.sheet.tags[0]), null !== o && (n = !0, o.setAttribute("data-emotion", t), a.hydrate([o])), u.current = [a, n],
                function() {
                    a.flush()
                }
        }, [r]), (0, i.useInsertionEffectWithLayoutFallback)(function() {
            var t = u.current,
                a = t[0];
            if (t[1]) {
                t[1] = !1;
                return
            }
            if (void 0 !== l.next && (0, s.insertStyles)(r, l.next, !0), a.tags.length) {
                var n = a.tags[a.tags.length - 1].nextElementSibling;
                a.before = n, a.flush()
            }
            r.insert("", l, a, !1)
        }, [r, l.name]), null
    });

    function d() {
        for (var t = arguments.length, r = Array(t), a = 0; a < t; a++) r[a] = arguments[a];
        return (0, c.serializeStyles)(r)
    }
    t.s(["Global", 0, u, "css", 0, d, "keyframes", 0, function() {
        var t = d.apply(void 0, arguments),
            r = "animation-" + t.name;
        return {
            name: r,
            styles: "@keyframes " + r + "{" + t.styles + "}",
            anim: 1,
            toString: function() {
                return "_EMO_" + this.name + "_" + this.styles + "_EMO_"
            }
        }
    }], 571709)
}, 963320, t => {
    "use strict";
    var r = t.i(416340);
    t.i(273589);
    var a = t.i(221628),
        n = t.i(519618);
    let o = r.createContext(void 0);
    t.s(["D", 0, function(t) {
        let {
            value: r,
            children: n
        } = t;
        return (0, a.jsx)(o.Provider, {
            value: r,
            children: n
        })
    }, "u", 0, function(t) {
        return function(t) {
            let {
                props: a,
                name: s
            } = t;
            return function(t) {
                let {
                    theme: r,
                    name: a,
                    props: o
                } = t;
                if (!r || !r.components || !r.components[a]) return o;
                let s = r.components[a];
                return s.defaultProps ? (0, n.r)(s.defaultProps, o) : s.styleOverrides || s.variants ? o : (0, n.r)(s, o)
            }({
                props: a,
                name: s,
                theme: {
                    components: r.useContext(o)
                }
            })
        }(t)
    }])
}, 485511, t => {
    "use strict";
    t.s(["c", 0, function(t, r) {
        return () => null
    }])
}, 737153, t => {
    "use strict";
    var r = t.i(273589),
        a = (0, t.i(485511).c)(r.p.elementType, function(t, r, a, n, o) {
            let s, i = t[r];
            return null == i || "u" < typeof window ? null : ("function" != typeof i || function(t) {
                let {
                    prototype: r = {}
                } = t;
                return !!r.isReactComponent
            }(i) || (s = "Did you accidentally provide a plain function component instead?"), void 0 !== s ? Error("Invalid ".concat(n, " `").concat(o || r, "` supplied to `").concat(a, "`. Expected an element type that can hold a ref. ").concat(s, " For more information see https://mui.com/r/caveat-with-refs-guide")) : null)
        });
    t.s(["e", 0, a])
}, 696180, t => {
    "use strict";
    var r = t.i(273589);
    t.s(["g", 0, function(t, a) {
        let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "Mui",
            o = {};
        return a.forEach(a => {
            o[a] = (0, r.g)(t, a, n)
        }), o
    }])
}, 270673, t => {
    "use strict";
    var r = t.i(962560),
        a = t.i(273589),
        n = t.i(416340),
        o = t.i(221628);
    let s = ["value"],
        i = n.createContext();
    t.s(["R", 0, function(t) {
        let {
            value: n
        } = t, c = (0, a._)(t, s);
        return (0, o.jsx)(i.Provider, (0, r._)({
            value: null == n || n
        }, c))
    }, "u", 0, () => {
        let t = n.useContext(i);
        return null != t && t
    }])
}, 531950, t => {
    "use strict";
    var r = t.i(696180),
        a = t.i(273589),
        n = (0, r.g)("MuiPaper", ["root", "rounded", "outlined", "elevation", "elevation0", "elevation1", "elevation2", "elevation3", "elevation4", "elevation5", "elevation6", "elevation7", "elevation8", "elevation9", "elevation10", "elevation11", "elevation12", "elevation13", "elevation14", "elevation15", "elevation16", "elevation17", "elevation18", "elevation19", "elevation20", "elevation21", "elevation22", "elevation23", "elevation24"]);
    t.s(["g", 0, function(t) {
        return (0, a.g)("MuiPaper", t)
    }, "p", 0, n])
}, 519618, t => {
    "use strict";
    var r = t.i(962560);
    t.s(["r", 0, function t(a, n) {
        let o = (0, r._)({}, n);
        return Object.keys(a).forEach(s => {
            if (s.toString().match(/^(components|slots)$/)) o[s] = (0, r._)({}, a[s], o[s]);
            else if (s.toString().match(/^(componentsProps|slotProps)$/)) {
                let i = a[s] || {},
                    c = n[s];
                o[s] = {}, c && Object.keys(c) ? i && Object.keys(i) ? (o[s] = (0, r._)({}, c), Object.keys(i).forEach(r => {
                    o[s][r] = t(i[r], c[r])
                })) : o[s] = c : o[s] = i
            } else void 0 === o[s] && (o[s] = a[s])
        }), o
    }])
}, 42569, 780247, 511257, t => {
    "use strict";
    var r, a = t.i(273589),
        n = t.i(178417),
        o = t.i(416340),
        s = t.i(962560),
        i = t.i(691551),
        c = t.i(534424),
        l = t.i(947287),
        u = t.i(571709),
        d = t.i(724913),
        f = function() {
            function t(t) {
                var r = this;
                this._insertTag = function(t) {
                    var a;
                    a = 0 === r.tags.length ? r.insertionPoint ? r.insertionPoint.nextSibling : r.prepend ? r.container.firstChild : r.before : r.tags[r.tags.length - 1].nextSibling, r.container.insertBefore(t, a), r.tags.push(t)
                }, this.isSpeedy = void 0 === t.speedy || t.speedy, this.tags = [], this.ctr = 0, this.nonce = t.nonce, this.key = t.key, this.container = t.container, this.prepend = t.prepend, this.insertionPoint = t.insertionPoint, this.before = null
            }
            var r = t.prototype;
            return r.hydrate = function(t) {
                t.forEach(this._insertTag)
            }, r.insert = function(t) {
                this.ctr % (this.isSpeedy ? 65e3 : 1) == 0 && this._insertTag(((r = document.createElement("style")).setAttribute("data-emotion", this.key), void 0 !== this.nonce && r.setAttribute("nonce", this.nonce), r.appendChild(document.createTextNode("")), r.setAttribute("data-s", ""), r));
                var r, a = this.tags[this.tags.length - 1];
                if (this.isSpeedy) {
                    var n = function(t) {
                        if (t.sheet) return t.sheet;
                        for (var r = 0; r < document.styleSheets.length; r++)
                            if (document.styleSheets[r].ownerNode === t) return document.styleSheets[r]
                    }(a);
                    try {
                        n.insertRule(t, n.cssRules.length)
                    } catch (t) {}
                } else a.appendChild(document.createTextNode(t));
                this.ctr++
            }, r.flush = function() {
                this.tags.forEach(function(t) {
                    var r;
                    return null == (r = t.parentNode) ? void 0 : r.removeChild(t)
                }), this.tags = [], this.ctr = 0
            }, t
        }(),
        p = "-ms-",
        h = "-moz-",
        m = "-webkit-",
        y = "comm",
        b = "rule",
        v = "decl",
        g = "@keyframes",
        C = Math.abs,
        D = String.fromCharCode,
        S = Object.assign;

    function P(t, r, a) {
        return t.replace(r, a)
    }

    function k(t, r) {
        return t.indexOf(r)
    }

    function x(t, r) {
        return 0 | t.charCodeAt(r)
    }

    function A(t, r, a) {
        return t.slice(r, a)
    }

    function w(t) {
        return t.length
    }

    function _(t, r) {
        return r.push(t), t
    }
    var T = 1,
        O = 1,
        E = 0,
        M = 0,
        L = 0,
        R = "";

    function j(t, r, a, n, o, s, i) {
        return {
            value: t,
            root: r,
            parent: a,
            type: n,
            props: o,
            children: s,
            line: T,
            column: O,
            length: i,
            return: ""
        }
    }

    function $(t, r) {
        return S(j("", null, null, "", null, null, 0), t, {
            length: -t.length
        }, r)
    }

    function I() {
        return L = M < E ? x(R, M++) : 0, O++, 10 === L && (O = 1, T++), L
    }

    function z() {
        return x(R, M)
    }

    function F(t) {
        switch (t) {
            case 0:
            case 9:
            case 10:
            case 13:
            case 32:
                return 5;
            case 33:
            case 43:
            case 44:
            case 47:
            case 62:
            case 64:
            case 126:
            case 59:
            case 123:
            case 125:
                return 4;
            case 58:
                return 3;
            case 34:
            case 39:
            case 40:
            case 91:
                return 2;
            case 41:
            case 93:
                return 1
        }
        return 0
    }

    function G(t) {
        return T = O = 1, E = w(R = t), M = 0, []
    }

    function N(t) {
        var r, a;
        return (r = M - 1, a = function t(r) {
            for (; I();) switch (L) {
                case r:
                    return M;
                case 34:
                case 39:
                    34 !== r && 39 !== r && t(L);
                    break;
                case 40:
                    41 === r && t(r);
                    break;
                case 92:
                    I()
            }
            return M
        }(91 === t ? t + 2 : 40 === t ? t + 1 : t), A(R, r, a)).trim()
    }

    function U(t) {
        var r;
        return r = function t(r, a, n, o, s, i, c, l, u) {
            for (var d, f = 0, p = 0, h = c, m = 0, b = 0, v = 0, g = 1, C = 1, S = 1, E = 0, $ = "", G = s, U = i, B = o, W = $; C;) switch (v = E, E = I()) {
                case 40:
                    if (108 != v && 58 == x(W, h - 1)) {
                        -1 != k(W += P(N(E), "&", "&\f"), "&\f") && (S = -1);
                        break
                    }
                case 34:
                case 39:
                case 91:
                    W += N(E);
                    break;
                case 9:
                case 10:
                case 13:
                case 32:
                    W += function(t) {
                        for (;
                            (L = z()) && L < 33;) I();
                        return F(t) > 2 || F(L) > 3 ? "" : " "
                    }(v);
                    break;
                case 92:
                    W += function(t, r) {
                        for (var a; --r && I() && !(L < 48 || L > 102 || L > 57 && L < 65 || L > 70 && L < 97););
                        return a = M + (r < 6 && 32 == z() && 32 == I()), A(R, t, a)
                    }(M - 1, 7);
                    continue;
                case 47:
                    switch (z()) {
                        case 42:
                        case 47:
                            _((d = function(t, r) {
                                for (; I() && t + L !== 57 && (t + L !== 84 || 47 !== z()););
                                return "/*" + A(R, r, M - 1) + "*" + D(47 === t ? t : I())
                            }(I(), M), j(d, a, n, y, D(L), A(d, 2, -2), 0)), u);
                            break;
                        default:
                            W += "/"
                    }
                    break;
                case 123 * g:
                    l[f++] = w(W) * S;
                case 125 * g:
                case 59:
                case 0:
                    switch (E) {
                        case 0:
                        case 125:
                            C = 0;
                        case 59 + p:
                            -1 == S && (W = P(W, /\f/g, "")), b > 0 && w(W) - h && _(b > 32 ? V(W + ";", o, n, h - 1) : V(P(W, " ", "") + ";", o, n, h - 2), u);
                            break;
                        case 59:
                            W += ";";
                        default:
                            if (_(B = H(W, a, n, f, p, s, l, $, G = [], U = [], h), i), 123 === E)
                                if (0 === p) t(W, a, B, B, G, i, h, l, U);
                                else switch (99 === m && 110 === x(W, 3) ? 100 : m) {
                                    case 100:
                                    case 108:
                                    case 109:
                                    case 115:
                                        t(r, B, B, o && _(H(r, B, B, 0, 0, s, l, $, s, G = [], h), U), s, U, h, l, o ? G : U);
                                        break;
                                    default:
                                        t(W, B, B, B, [""], U, 0, l, U)
                                }
                    }
                    f = p = b = 0, g = S = 1, $ = W = "", h = c;
                    break;
                case 58:
                    h = 1 + w(W), b = v;
                default:
                    if (g < 1) {
                        if (123 == E) --g;
                        else if (125 == E && 0 == g++ && 125 == (L = M > 0 ? x(R, --M) : 0, O--, 10 === L && (O = 1, T--), L)) continue
                    }
                    switch (W += D(E), E * g) {
                        case 38:
                            S = p > 0 ? 1 : (W += "\f", -1);
                            break;
                        case 44:
                            l[f++] = (w(W) - 1) * S, S = 1;
                            break;
                        case 64:
                            45 === z() && (W += N(I())), m = z(), p = h = w($ = W += function(t) {
                                for (; !F(z());) I();
                                return A(R, t, M)
                            }(M)), E++;
                            break;
                        case 45:
                            45 === v && 2 == w(W) && (g = 0)
                    }
            }
            return i
        }("", null, null, null, [""], t = G(t), 0, [0], t), R = "", r
    }

    function H(t, r, a, n, o, s, i, c, l, u, d) {
        for (var f = o - 1, p = 0 === o ? s : [""], h = p.length, m = 0, y = 0, v = 0; m < n; ++m)
            for (var g = 0, D = A(t, f + 1, f = C(y = i[m])), S = t; g < h; ++g)(S = (y > 0 ? p[g] + " " + D : P(D, /&\f/g, p[g])).trim()) && (l[v++] = S);
        return j(t, r, a, 0 === o ? b : c, l, u, d)
    }

    function V(t, r, a, n) {
        return j(t, r, a, v, A(t, 0, n), A(t, n + 1, -1), n)
    }

    function B(t, r) {
        for (var a = "", n = t.length, o = 0; o < n; o++) a += r(t[o], o, t, r) || "";
        return a
    }

    function W(t, r, a, n) {
        switch (t.type) {
            case "@layer":
                if (t.children.length) break;
            case "@import":
            case v:
                return t.return = t.return || t.value;
            case y:
                return "";
            case g:
                return t.return = t.value + "{" + B(t.children, n) + "}";
            case b:
                t.value = t.props.join(",")
        }
        return w(a = B(t.children, n)) ? t.return = t.value + "{" + a + "}" : ""
    }

    function q(t) {
        var r = t.length;
        return function(a, n, o, s) {
            for (var i = "", c = 0; c < r; c++) i += t[c](a, n, o, s) || "";
            return i
        }
    }
    var X, K, Y = "u" > typeof document,
        Q = function(t, r, a) {
            for (var n = 0, o = 0; n = o, o = z(), 38 === n && 12 === o && (r[a] = 1), !F(o);) I();
            return A(R, t, M)
        },
        J = function(t, r) {
            var a;
            return a = function(t, r) {
                var a = -1,
                    n = 44;
                do switch (F(n)) {
                    case 0:
                        38 === n && 12 === z() && (r[a] = 1), t[a] += Q(M - 1, r, a);
                        break;
                    case 2:
                        t[a] += N(n);
                        break;
                    case 4:
                        if (44 === n) {
                            t[++a] = 58 === z() ? "&\f" : "", r[a] = t[a].length;
                            break
                        }
                    default:
                        t[a] += D(n)
                }
                while (n = I()) return t
            }(G(t), r), R = "", a
        },
        Z = new WeakMap,
        ee = function(t) {
            if ("rule" === t.type && t.parent && !(t.length < 1)) {
                for (var r = t.value, a = t.parent, n = t.column === a.column && t.line === a.line;
                    "rule" !== a.type;)
                    if (!(a = a.parent)) return;
                if ((1 !== t.props.length || 58 === r.charCodeAt(0) || Z.get(a)) && !n) {
                    Z.set(t, !0);
                    for (var o = [], s = J(r, o), i = a.props, c = 0, l = 0; c < s.length; c++)
                        for (var u = 0; u < i.length; u++, l++) t.props[l] = o[c] ? s[c].replace(/&\f/g, i[u]) : i[u] + " " + s[c]
                }
            }
        },
        et = function(t) {
            if ("decl" === t.type) {
                var r = t.value;
                108 === r.charCodeAt(0) && 98 === r.charCodeAt(2) && (t.return = "", t.value = "")
            }
        },
        er = Y ? void 0 : (X = function() {
            var t, r;
            return t = function() {
                    return {}
                }, r = Object.create(null),
                function(a) {
                    return void 0 === r[a] && (r[a] = t()), r[a]
                }
        }, K = new WeakMap, function(t) {
            if (K.has(t)) return K.get(t);
            var r = X();
            return K.set(t, r), r
        }),
        ea = [function(t, r, a, n) {
            if (t.length > -1 && !t.return) switch (t.type) {
                case v:
                    t.return = function t(r, a) {
                        switch (45 ^ x(r, 0) ? (((a << 2 ^ x(r, 0)) << 2 ^ x(r, 1)) << 2 ^ x(r, 2)) << 2 ^ x(r, 3) : 0) {
                            case 5103:
                                return m + "print-" + r + r;
                            case 5737:
                            case 4201:
                            case 3177:
                            case 3433:
                            case 1641:
                            case 4457:
                            case 2921:
                            case 5572:
                            case 6356:
                            case 5844:
                            case 3191:
                            case 6645:
                            case 3005:
                            case 6391:
                            case 5879:
                            case 5623:
                            case 6135:
                            case 4599:
                            case 4855:
                            case 4215:
                            case 6389:
                            case 5109:
                            case 5365:
                            case 5621:
                            case 3829:
                                return m + r + r;
                            case 5349:
                            case 4246:
                            case 4810:
                            case 6968:
                            case 2756:
                                return m + r + h + r + p + r + r;
                            case 6828:
                            case 4268:
                                return m + r + p + r + r;
                            case 6165:
                                return m + r + p + "flex-" + r + r;
                            case 5187:
                                return m + r + P(r, /(\w+).+(:[^]+)/, m + "box-$1$2" + p + "flex-$1$2") + r;
                            case 5443:
                                return m + r + p + "flex-item-" + P(r, /flex-|-self/, "") + r;
                            case 4675:
                                return m + r + p + "flex-line-pack" + P(r, /align-content|flex-|-self/, "") + r;
                            case 5548:
                                return m + r + p + P(r, "shrink", "negative") + r;
                            case 5292:
                                return m + r + p + P(r, "basis", "preferred-size") + r;
                            case 6060:
                                return m + "box-" + P(r, "-grow", "") + m + r + p + P(r, "grow", "positive") + r;
                            case 4554:
                                return m + P(r, /([^-])(transform)/g, "$1" + m + "$2") + r;
                            case 6187:
                                return P(P(P(r, /(zoom-|grab)/, m + "$1"), /(image-set)/, m + "$1"), r, "") + r;
                            case 5495:
                            case 3959:
                                return P(r, /(image-set\([^]*)/, m + "$1$`$1");
                            case 4968:
                                return P(P(r, /(.+:)(flex-)?(.*)/, m + "box-pack:$3" + p + "flex-pack:$3"), /s.+-b[^;]+/, "justify") + m + r + r;
                            case 4095:
                            case 3583:
                            case 4068:
                            case 2532:
                                return P(r, /(.+)-inline(.+)/, m + "$1$2") + r;
                            case 8116:
                            case 7059:
                            case 5753:
                            case 5535:
                            case 5445:
                            case 5701:
                            case 4933:
                            case 4677:
                            case 5533:
                            case 5789:
                            case 5021:
                            case 4765:
                                if (w(r) - 1 - a > 6) switch (x(r, a + 1)) {
                                    case 109:
                                        if (45 !== x(r, a + 4)) break;
                                    case 102:
                                        return P(r, /(.+:)(.+)-([^]+)/, "$1" + m + "$2-$3$1" + h + (108 == x(r, a + 3) ? "$3" : "$2-$3")) + r;
                                    case 115:
                                        return ~k(r, "stretch") ? t(P(r, "stretch", "fill-available"), a) + r : r
                                }
                                break;
                            case 4949:
                                if (115 !== x(r, a + 1)) break;
                            case 6444:
                                switch (x(r, w(r) - 3 - (~k(r, "!important") && 10))) {
                                    case 107:
                                        return P(r, ":", ":" + m) + r;
                                    case 101:
                                        return P(r, /(.+:)([^;!]+)(;|!.+)?/, "$1" + m + (45 === x(r, 14) ? "inline-" : "") + "box$3$1" + m + "$2$3$1" + p + "$2box$3") + r
                                }
                                break;
                            case 5936:
                                switch (x(r, a + 11)) {
                                    case 114:
                                        return m + r + p + P(r, /[svh]\w+-[tblr]{2}/, "tb") + r;
                                    case 108:
                                        return m + r + p + P(r, /[svh]\w+-[tblr]{2}/, "tb-rl") + r;
                                    case 45:
                                        return m + r + p + P(r, /[svh]\w+-[tblr]{2}/, "lr") + r
                                }
                                return m + r + p + r + r
                        }
                        return r
                    }(t.value, t.length);
                    break;
                case g:
                    return B([$(t, {
                        value: P(t.value, "@", "@" + m)
                    })], n);
                case b:
                    if (t.length) {
                        var o, s;
                        return o = t.props, s = function(r) {
                            var a;
                            switch ((a = /(::plac\w+|:read-\w+)/.exec(a = r)) ? a[0] : a) {
                                case ":read-only":
                                case ":read-write":
                                    return B([$(t, {
                                        props: [P(r, /:(read-\w+)/, ":" + h + "$1")]
                                    })], n);
                                case "::placeholder":
                                    return B([$(t, {
                                        props: [P(r, /:(plac\w+)/, ":" + m + "input-$1")]
                                    }), $(t, {
                                        props: [P(r, /:(plac\w+)/, ":" + h + "$1")]
                                    }), $(t, {
                                        props: [P(r, /:(plac\w+)/, p + "input-$1")]
                                    })], n)
                            }
                            return ""
                        }, o.map(s).join("")
                    }
            }
        }],
        en = function(t) {
            var r = t.key;
            if (Y && "css" === r) {
                var a = document.querySelectorAll("style[data-emotion]:not([data-s])");
                Array.prototype.forEach.call(a, function(t) {
                    -1 !== t.getAttribute("data-emotion").indexOf(" ") && (document.head.appendChild(t), t.setAttribute("data-s", ""))
                })
            }
            var n, o, s = t.stylisPlugins || ea,
                i = {},
                c = [];
            Y && (n = t.container || document.head, Array.prototype.forEach.call(document.querySelectorAll('style[data-emotion^="' + r + ' "]'), function(t) {
                for (var r = t.getAttribute("data-emotion").split(" "), a = 1; a < r.length; a++) i[r[a]] = !0;
                c.push(t)
            }));
            var l, u = [ee, et];
            if (er) {
                var d = q(u.concat(s, [W])),
                    p = er(s)(r),
                    h = function(t, r) {
                        var a = r.name;
                        return void 0 === p[a] && (p[a] = B(U(t ? t + "{" + r.styles + "}" : r.styles), d)), p[a]
                    };
                o = function(t, r, a, n) {
                    var o = r.name,
                        s = h(t, r);
                    return void 0 === v.compat ? (n && (v.inserted[o] = !0), s) : n ? void(v.inserted[o] = s) : s
                }
            } else {
                var m, y = [W, (l = function(t) {
                        m.insert(t)
                    }, function(t) {
                        t.root || (t = t.return) && l(t)
                    })],
                    b = q(u.concat(s, y));
                o = function(t, r, a, n) {
                    m = a, B(U(t ? t + "{" + r.styles + "}" : r.styles), b), n && (v.inserted[r.name] = !0)
                }
            }
            var v = {
                key: r,
                sheet: new f({
                    key: r,
                    container: n,
                    nonce: t.nonce,
                    speedy: t.speedy,
                    prepend: t.prepend,
                    insertionPoint: t.insertionPoint
                }),
                nonce: t.nonce,
                inserted: i,
                registered: {},
                insert: o
            };
            return v.sheet.hydrate(c), v
        };
    t.s(["c", 0, en], 780247);
    var eo = t.i(221628),
        es = /^((children|dangerouslySetInnerHTML|key|ref|autoFocus|defaultValue|defaultChecked|innerHTML|suppressContentEditableWarning|suppressHydrationWarning|valueLink|abbr|accept|acceptCharset|accessKey|action|allow|allowUserMedia|allowPaymentRequest|allowFullScreen|allowTransparency|alt|async|autoComplete|autoPlay|capture|cellPadding|cellSpacing|challenge|charSet|checked|cite|classID|className|cols|colSpan|content|contentEditable|contextMenu|controls|controlsList|coords|crossOrigin|data|dateTime|decoding|default|defer|dir|disabled|disablePictureInPicture|download|draggable|encType|enterKeyHint|form|formAction|formEncType|formMethod|formNoValidate|formTarget|frameBorder|headers|height|hidden|high|href|hrefLang|htmlFor|httpEquiv|id|inputMode|integrity|is|keyParams|keyType|kind|label|lang|list|loading|loop|low|marginHeight|marginWidth|max|maxLength|media|mediaGroup|method|min|minLength|multiple|muted|name|nonce|noValidate|open|optimum|pattern|placeholder|playsInline|poster|preload|profile|radioGroup|readOnly|referrerPolicy|rel|required|reversed|role|rows|rowSpan|sandbox|scope|scoped|scrolling|seamless|selected|shape|size|sizes|slot|span|spellCheck|src|srcDoc|srcLang|srcSet|start|step|style|summary|tabIndex|target|title|translate|type|useMap|value|width|wmode|wrap|about|datatype|inlist|prefix|property|resource|typeof|vocab|autoCapitalize|autoCorrect|autoSave|color|incremental|fallback|inert|itemProp|itemScope|itemType|itemID|itemRef|on|option|results|security|unselectable|accentHeight|accumulate|additive|alignmentBaseline|allowReorder|alphabetic|amplitude|arabicForm|ascent|attributeName|attributeType|autoReverse|azimuth|baseFrequency|baselineShift|baseProfile|bbox|begin|bias|by|calcMode|capHeight|clip|clipPathUnits|clipPath|clipRule|colorInterpolation|colorInterpolationFilters|colorProfile|colorRendering|contentScriptType|contentStyleType|cursor|cx|cy|d|decelerate|descent|diffuseConstant|direction|display|divisor|dominantBaseline|dur|dx|dy|edgeMode|elevation|enableBackground|end|exponent|externalResourcesRequired|fill|fillOpacity|fillRule|filter|filterRes|filterUnits|floodColor|floodOpacity|focusable|fontFamily|fontSize|fontSizeAdjust|fontStretch|fontStyle|fontVariant|fontWeight|format|from|fr|fx|fy|g1|g2|glyphName|glyphOrientationHorizontal|glyphOrientationVertical|glyphRef|gradientTransform|gradientUnits|hanging|horizAdvX|horizOriginX|ideographic|imageRendering|in|in2|intercept|k|k1|k2|k3|k4|kernelMatrix|kernelUnitLength|kerning|keyPoints|keySplines|keyTimes|lengthAdjust|letterSpacing|lightingColor|limitingConeAngle|local|markerEnd|markerMid|markerStart|markerHeight|markerUnits|markerWidth|mask|maskContentUnits|maskUnits|mathematical|mode|numOctaves|offset|opacity|operator|order|orient|orientation|origin|overflow|overlinePosition|overlineThickness|panose1|paintOrder|pathLength|patternContentUnits|patternTransform|patternUnits|pointerEvents|points|pointsAtX|pointsAtY|pointsAtZ|preserveAlpha|preserveAspectRatio|primitiveUnits|r|radius|refX|refY|renderingIntent|repeatCount|repeatDur|requiredExtensions|requiredFeatures|restart|result|rotate|rx|ry|scale|seed|shapeRendering|slope|spacing|specularConstant|specularExponent|speed|spreadMethod|startOffset|stdDeviation|stemh|stemv|stitchTiles|stopColor|stopOpacity|strikethroughPosition|strikethroughThickness|string|stroke|strokeDasharray|strokeDashoffset|strokeLinecap|strokeLinejoin|strokeMiterlimit|strokeOpacity|strokeWidth|surfaceScale|systemLanguage|tableValues|targetX|targetY|textAnchor|textDecoration|textRendering|textLength|to|transform|u1|u2|underlinePosition|underlineThickness|unicode|unicodeBidi|unicodeRange|unitsPerEm|vAlphabetic|vHanging|vIdeographic|vMathematical|values|vectorEffect|version|vertAdvY|vertOriginX|vertOriginY|viewBox|viewTarget|visibility|widths|wordSpacing|writingMode|x|xHeight|x1|x2|xChannelSelector|xlinkActuate|xlinkArcrole|xlinkHref|xlinkRole|xlinkShow|xlinkTitle|xlinkType|xmlBase|xmlns|xmlnsXlink|xmlLang|xmlSpace|y|y1|y2|yChannelSelector|z|zoomAndPan|for|class|autofocus)|(([Dd][Aa][Tt][Aa]|[Aa][Rr][Ii][Aa]|x)-.*))$/,
        ei = (eO = function(t) {
            return es.test(t) || 111 === t.charCodeAt(0) && 110 === t.charCodeAt(1) && 91 > t.charCodeAt(2)
        }, eE = Object.create(null), function(t) {
            return void 0 === eE[t] && (eE[t] = eO(t)), eE[t]
        }),
        ec = "u" > typeof document,
        el = !!o.useInsertionEffect && o.useInsertionEffect,
        eu = ec && el || function(t) {
            return t()
        },
        ed = function(t) {
            return "theme" !== t
        },
        ef = function(t) {
            return "string" == typeof t && t.charCodeAt(0) > 96 ? ei : ed
        },
        ep = function(t, r, a) {
            var n;
            if (r) {
                var o = r.shouldForwardProp;
                n = t.__emotion_forwardProp && o ? function(r) {
                    return t.__emotion_forwardProp(r) && o(r)
                } : o
            }
            return "function" != typeof n && a && (n = t.__emotion_forwardProp), n
        },
        eh = "u" > typeof document,
        em = function(t) {
            var r = t.cache,
                a = t.serialized,
                n = t.isStringTag;
            (0, d.r)(r, a, n);
            var s = eu(function() {
                return (0, d.i)(r, a, n)
            });
            if (!eh && void 0 !== s) {
                for (var i, c = a.name, l = a.next; void 0 !== l;) c += " " + l.name, l = l.next;
                return (0, o.createElement)("style", ((i = {})["data-emotion"] = r.key + " " + c, i.dangerouslySetInnerHTML = {
                    __html: s
                }, i.nonce = r.sheet.nonce, i))
            }
            return null
        },
        ey = (function t(r, a) {
            var n, l, u = r.__emotion_real === r,
                f = u && r.__emotion_base || r;
            void 0 !== a && (n = a.label, l = a.target);
            var p = ep(r, a, u),
                h = p || ef(f),
                m = !h("as");
            return function() {
                var y = arguments,
                    b = u && void 0 !== r.__emotion_styles ? r.__emotion_styles.slice(0) : [];
                if (void 0 !== n && b.push("label:" + n + ";"), null == y[0] || void 0 === y[0].raw) b.push.apply(b, y);
                else {
                    b.push(y[0][0]);
                    for (var v = y.length, g = 1; g < v; g++) b.push(y[g], y[0][g])
                }
                var C = (0, i.withEmotionCache)(function(t, r, a) {
                    var n = m && t.as || f,
                        s = "",
                        i = [],
                        u = t;
                    if (null == t.theme) {
                        for (var y in u = {}, t) u[y] = t[y];
                        u.theme = (0, o.useContext)(c.ThemeContext)
                    }
                    "string" == typeof t.className ? s = (0, d.g)(r.registered, i, t.className) : null != t.className && (s = t.className + " ");
                    var v = (0, d.s)(b.concat(i), r.registered, u);
                    s += r.key + "-" + v.name, void 0 !== l && (s += " " + l);
                    var g = m && void 0 === p ? ef(n) : h,
                        C = {};
                    for (var D in t) m && "as" === D || g(D) && (C[D] = t[D]);
                    return C.className = s, C.ref = a, (0, o.createElement)(o.Fragment, null, (0, o.createElement)(em, {
                        cache: r,
                        serialized: v,
                        isStringTag: "string" == typeof n
                    }), (0, o.createElement)(n, C))
                });
                return C.displayName = void 0 !== n ? n : "Styled(" + ("string" == typeof f ? f : f.displayName || f.name || "Component") + ")", C.defaultProps = r.defaultProps, C.__emotion_real = C, C.__emotion_base = f, C.__emotion_styles = b, C.__emotion_forwardProp = p, Object.defineProperty(C, "toString", {
                    value: function() {
                        return "." + l
                    }
                }), C.withComponent = function(r, n) {
                    return t(r, (0, s._)({}, a, n, {
                        shouldForwardProp: ep(C, n, !0)
                    })).apply(void 0, b)
                }, C
            }
        }).bind();
    ["a", "abbr", "address", "area", "article", "aside", "audio", "b", "base", "bdi", "bdo", "big", "blockquote", "body", "br", "button", "canvas", "caption", "cite", "code", "col", "colgroup", "data", "datalist", "dd", "del", "details", "dfn", "dialog", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption", "figure", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "keygen", "label", "legend", "li", "link", "main", "map", "mark", "marquee", "menu", "menuitem", "meta", "meter", "nav", "noscript", "object", "ol", "optgroup", "option", "output", "p", "param", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "script", "section", "select", "small", "source", "span", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track", "u", "ul", "var", "video", "wbr", "circle", "clipPath", "defs", "ellipse", "foreignObject", "g", "image", "line", "linearGradient", "mask", "path", "pattern", "polygon", "polyline", "radialGradient", "rect", "stop", "svg", "text", "tspan"].forEach(function(t) {
        ey[t] = ey(t)
    });
    let eb = new Map;

    function ev(t) {
        let {
            styles: r,
            defaultTheme: a = {}
        } = t;
        return (0, eo.jsx)(u.Global, {
            styles: "function" == typeof r ? t => r(null == t || 0 === Object.keys(t).length ? a : t) : r
        })
    }

    function eg(t, r) {
        return ey(t, r)
    }
    let eC = (t, r) => {
            Array.isArray(t.__emotion_styles) && (t.__emotion_styles = r(t.__emotion_styles))
        },
        eD = [];

    function eS(t) {
        return eD[0] = t, (0, d.s)(eD)
    }
    var eP = Object.freeze({
        __proto__: null,
        GlobalStyles: ev,
        StyledEngineProvider: function(t) {
            let {
                injectFirst: r,
                enableCssLayer: a,
                children: n
            } = t, s = o.useMemo(() => {
                let t = "".concat(r, "-").concat(a);
                if ("object" == typeof document && eb.has(t)) return eb.get(t);
                let n = function(t, r) {
                    let a = en({
                        key: "css",
                        prepend: t
                    });
                    if (r) {
                        let t = a.insert;
                        a.insert = function() {
                            for (var r = arguments.length, a = Array(r), n = 0; n < r; n++) a[n] = arguments[n];
                            return a[1].styles.match(/^@layer\s+[^{]*$/) || (a[1].styles = "@layer mui {".concat(a[1].styles, "}")), t(...a)
                        }
                    }
                    return a
                }(r, a);
                return eb.set(t, n), n
            }, [r, a]);
            return r || a ? (0, eo.jsx)(l.CacheProvider, {
                value: s,
                children: n
            }) : n
        },
        ThemeContext: c.ThemeContext,
        css: u.css,
        default: eg,
        internal_processStyles: eC,
        internal_serializeStyles: eS,
        keyframes: u.keyframes
    });
    t.s(["G", 0, ev, "a", 0, eS, "b", 0, eP, "i", 0, eC, "s", 0, eg], 511257);
    var ek = t.i(970624),
        ex = Object.freeze({
            __proto__: null,
            default: a.d,
            isPlainObject: a.i
        }),
        eA = Object.freeze({
            __proto__: null,
            default: a.a
        }),
        ew = Object.freeze({
            __proto__: null,
            default: a.c,
            private_createBreakpoints: a.o,
            unstable_applyStyles: a.q
        });
    let e_ = ["sx"];

    function eT(t) {
        var r, n, o;
        let i, c, l, {
                sx: u
            } = t,
            {
                systemProps: d,
                otherProps: f
            } = (c = {
                systemProps: {},
                otherProps: {}
            }, l = null != (n = null == (r = (0, a._)(t, e_)) || null == (o = r.theme) ? void 0 : o.unstable_sxConfig) ? n : a.t, Object.keys(r).forEach(t => {
                l[t] ? c.systemProps[t] = r[t] : c.otherProps[t] = r[t]
            }), c);
        return i = Array.isArray(u) ? [d, ...u] : "function" == typeof u ? function() {
            for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
            let o = u(...r);
            return (0, a.i)(o) ? (0, s._)({}, d, o) : d
        } : (0, s._)({}, d, u), (0, s._)({}, f, {
            sx: i
        })
    }
    var eO, eE, eM, eL = Object.freeze({
            __proto__: null,
            default: a.s,
            extendSxProp: eT,
            unstable_createStyleFunctionSx: a.u,
            unstable_defaultSxConfig: a.t
        }),
        eR = {},
        ej = {};
    ({
        get exports() {
            return eR
        },
        set exports(e) {
            eR = e
        }
    }).exports = function() {
        if (eM) return ej;
        eM = 1;
        var t = Symbol.for("react.transitional.element"),
            r = Symbol.for("react.portal"),
            a = Symbol.for("react.fragment"),
            n = Symbol.for("react.strict_mode"),
            o = Symbol.for("react.profiler"),
            s = Symbol.for("react.consumer"),
            i = Symbol.for("react.context"),
            c = Symbol.for("react.forward_ref"),
            l = Symbol.for("react.suspense"),
            u = Symbol.for("react.suspense_list"),
            d = Symbol.for("react.memo"),
            f = Symbol.for("react.lazy"),
            p = Symbol.for("react.view_transition"),
            h = Symbol.for("react.client.reference");

        function m(h) {
            if ("object" == typeof h && null !== h) {
                var m = h.$$typeof;
                switch (m) {
                    case t:
                        switch (h = h.type) {
                            case a:
                            case o:
                            case n:
                            case l:
                            case u:
                            case p:
                                return h;
                            default:
                                switch (h = h && h.$$typeof) {
                                    case i:
                                    case c:
                                    case f:
                                    case d:
                                    case s:
                                        return h;
                                    default:
                                        return m
                                }
                        }
                    case r:
                        return m
                }
            }
        }
        return ej.ContextConsumer = s, ej.ContextProvider = i, ej.Element = t, ej.ForwardRef = c, ej.Fragment = a, ej.Lazy = f, ej.Memo = d, ej.Portal = r, ej.Profiler = o, ej.StrictMode = n, ej.Suspense = l, ej.SuspenseList = u, ej.isContextConsumer = function(t) {
            return m(t) === s
        }, ej.isContextProvider = function(t) {
            return m(t) === i
        }, ej.isElement = function(r) {
            return "object" == typeof r && null !== r && r.$$typeof === t
        }, ej.isForwardRef = function(t) {
            return m(t) === c
        }, ej.isFragment = function(t) {
            return m(t) === a
        }, ej.isLazy = function(t) {
            return m(t) === f
        }, ej.isMemo = function(t) {
            return m(t) === d
        }, ej.isPortal = function(t) {
            return m(t) === r
        }, ej.isProfiler = function(t) {
            return m(t) === o
        }, ej.isStrictMode = function(t) {
            return m(t) === n
        }, ej.isSuspense = function(t) {
            return m(t) === l
        }, ej.isSuspenseList = function(t) {
            return m(t) === u
        }, ej.isValidElementType = function(t) {
            return "string" == typeof t || "function" == typeof t || t === a || t === o || t === n || t === l || t === u || "object" == typeof t && null !== t && (t.$$typeof === f || t.$$typeof === d || t.$$typeof === i || t.$$typeof === s || t.$$typeof === c || t.$$typeof === h || void 0 !== t.getModuleId)
        }, ej.typeOf = m, ej
    }();
    let e$ = /^\s*function(?:\s|\s*\/\*.*\*\/\s*)+([^(\s/]*)\s*/;

    function eI(t) {
        let r = "".concat(t).match(e$);
        return r && r[1] || ""
    }

    function ez(t) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "";
        return t.displayName || t.name || eI(t) || r
    }

    function eF(t, r, a) {
        let n = ez(r);
        return t.displayName || ("" !== n ? "".concat(a, "(").concat(n, ")") : a)
    }

    function eG(t) {
        if (null != t) {
            if ("string" == typeof t) return t;
            if ("function" == typeof t) return ez(t, "Component");
            if ("object" == typeof t) switch (t.$$typeof) {
                case eR.ForwardRef:
                    return eF(t, t.render, "ForwardRef");
                case eR.Memo:
                    return eF(t, t.type, "memo");
                default:
                    return
            }
        }
    }
    var eN, eU, eH = Object.freeze({
            __proto__: null,
            default: eG,
            getFunctionName: eI
        }),
        eV = {},
        eB = {},
        eW = {},
        eq = (0, n.g)(eP),
        eX = (0, n.g)(ex),
        eK = (0, n.g)(eA),
        eY = (0, n.g)(eH),
        eQ = (0, n.g)(ew),
        eJ = (0, n.g)(eL),
        eZ = a.v;
    Object.defineProperty(eV, "__esModule", {
        value: !0
    });
    var e0 = eV.default = function() {
            let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                {
                    themeId: r,
                    defaultTheme: a = tn,
                    rootShouldForwardProp: n = tr,
                    slotShouldForwardProp: o = tr
                } = t,
                s = t => (0, e6.default)((0, e2.default)({}, t, {
                    theme: ts((0, e2.default)({}, t, {
                        defaultTheme: a,
                        themeId: r
                    }))
                }));
            return s.__mui_systemSx = !0,
                function(t) {
                    var i;
                    let c, l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    (0, e4.internal_processStyles)(t, t => t.filter(t => !(null != t && t.__mui_systemSx)));
                    let {
                        name: u,
                        slot: d,
                        skipVariantsResolver: f,
                        skipSx: p,
                        overridesResolver: h = (i = to(d)) ? (t, r) => r[i] : null
                    } = l, m = (0, e5.default)(l, te), y = u && u.startsWith("Mui") || d ? "components" : "custom", b = void 0 !== f ? f : d && "Root" !== d && "root" !== d || !1, v = p || !1, g = tr;
                    "Root" === d || "root" === d ? g = n : d ? g = o : "string" == typeof t && t.charCodeAt(0) > 96 && (g = void 0);
                    let C = (0, e4.default)(t, (0, e2.default)({
                            shouldForwardProp: g,
                            label: c
                        }, m)),
                        D = t => "function" == typeof t && t.__emotion_real !== t || (0, e3.isPlainObject)(t) ? n => {
                            let o = ts({
                                theme: n.theme,
                                defaultTheme: a,
                                themeId: r
                            });
                            return ti(t, (0, e2.default)({}, n, {
                                theme: o
                            }), o.modularCssLayers ? y : void 0)
                        } : t,
                        S = function(n) {
                            for (var o = arguments.length, i = Array(o > 1 ? o - 1 : 0), c = 1; c < o; c++) i[c - 1] = arguments[c];
                            let l = D(n),
                                d = i ? i.map(D) : [];
                            u && h && d.push(t => {
                                let n = ts((0, e2.default)({}, t, {
                                    defaultTheme: a,
                                    themeId: r
                                }));
                                if (!n.components || !n.components[u] || !n.components[u].styleOverrides) return null;
                                let o = n.components[u].styleOverrides,
                                    s = {};
                                return Object.entries(o).forEach(r => {
                                    let [a, o] = r;
                                    s[a] = ti(o, (0, e2.default)({}, t, {
                                        theme: n
                                    }), n.modularCssLayers ? "theme" : void 0)
                                }), h(t, s)
                            }), u && !b && d.push(t => {
                                var n;
                                let o = ts((0, e2.default)({}, t, {
                                    defaultTheme: a,
                                    themeId: r
                                }));
                                return ti({
                                    variants: null == o || null == (n = o.components) || null == (n = n[u]) ? void 0 : n.variants
                                }, (0, e2.default)({}, t, {
                                    theme: o
                                }), o.modularCssLayers ? "theme" : void 0)
                            }), v || d.push(s);
                            let f = d.length - i.length;
                            if (Array.isArray(n) && f > 0) {
                                let t = Array(f).fill("");
                                (l = [...n, ...t]).raw = [...n.raw, ...t]
                            }
                            let p = C(l, ...d);
                            return t.muiName && (p.muiName = t.muiName), p
                        };
                    return C.withConfig && (S.withConfig = C.withConfig), S
                }
        },
        e1 = eV.shouldForwardProp = tr;
    eV.systemDefaultTheme = void 0;
    var e2 = eZ((eN || (eN = 1, function(t) {
            function r() {
                return t.exports = r = Object.assign.bind(), t.exports.__esModule = !0, t.exports.default = t.exports, r.apply(null, arguments)
            }
            t.exports = r, t.exports.__esModule = !0, t.exports.default = t.exports
        }({
            get exports() {
                return eB
            },
            set exports(e) {
                eB = e
            }
        })), eB)),
        e5 = eZ((eU || (eU = 1, (r = {
            get exports() {
                return eW
            },
            set exports(e) {
                eW = e
            }
        }).exports = function(t, r) {
            if (null == t) return {};
            var a = {};
            for (var n in t)
                if (({}).hasOwnProperty.call(t, n)) {
                    if (-1 !== r.indexOf(n)) continue;
                    a[n] = t[n]
                } return a
        }, r.exports.__esModule = !0, r.exports.default = r.exports), eW)),
        e4 = function(t) {
            if (t && t.__esModule) return t;
            if (null === t || "object" != typeof t && "function" != typeof t) return {
                default: t
            };
            var r = tt(void 0);
            if (r && r.has(t)) return r.get(t);
            var a = {
                    __proto__: null
                },
                n = Object.defineProperty && Object.getOwnPropertyDescriptor;
            for (var o in t)
                if ("default" !== o && Object.prototype.hasOwnProperty.call(t, o)) {
                    var s = n ? Object.getOwnPropertyDescriptor(t, o) : null;
                    s && (s.get || s.set) ? Object.defineProperty(a, o, s) : a[o] = t[o]
                } return a.default = t, r && r.set(t, a), a
        }(eq),
        e3 = eX,
        e9 = (eZ(eK), eZ(eY), eZ(eQ)),
        e6 = eZ(eJ);
    let e8 = ["ownerState"],
        e7 = ["variants"],
        te = ["name", "slot", "skipVariantsResolver", "skipSx", "overridesResolver"];

    function tt(t) {
        if ("function" != typeof WeakMap) return null;
        var r = new WeakMap,
            a = new WeakMap;
        return (tt = function(t) {
            return t ? a : r
        })(t)
    }

    function tr(t) {
        return "ownerState" !== t && "theme" !== t && "sx" !== t && "as" !== t
    }

    function ta(t, r) {
        return r && t && "object" == typeof t && t.styles && !t.styles.startsWith("@layer") && (t.styles = "@layer ".concat(r, "{").concat(String(t.styles), "}")), t
    }
    let tn = eV.systemDefaultTheme = (0, e9.default)(),
        to = t => t ? t.charAt(0).toLowerCase() + t.slice(1) : t;

    function ts(t) {
        let {
            defaultTheme: r,
            theme: a,
            themeId: n
        } = t;
        return 0 === Object.keys(a).length ? r : a[n] || a
    }

    function ti(t, r, a) {
        let {
            ownerState: n
        } = r, o = (0, e5.default)(r, e8), s = "function" == typeof t ? t((0, e2.default)({
            ownerState: n
        }, o)) : t;
        if (Array.isArray(s)) return s.flatMap(t => ti(t, (0, e2.default)({
            ownerState: n
        }, o), a));
        if (s && "object" == typeof s && Array.isArray(s.variants)) {
            let {
                variants: t = []
            } = s, r = (0, e5.default)(s, e7);
            return t.forEach(t => {
                let s = !0;
                if ("function" == typeof t.props ? s = t.props((0, e2.default)({
                        ownerState: n
                    }, o, n)) : Object.keys(t.props).forEach(r => {
                        (null == n ? void 0 : n[r]) !== t.props[r] && o[r] !== t.props[r] && (s = !1)
                    }), s) {
                    Array.isArray(r) || (r = [r]);
                    let s = "function" == typeof t.style ? t.style((0, e2.default)({
                        ownerState: n
                    }, o, n)) : t.style;
                    r.push(a ? ta((0, e4.internal_serializeStyles)(s), a) : s)
                }
            }), r
        }
        return a ? ta((0, e4.internal_serializeStyles)(s), a) : s
    }

    function tc(t) {
        return "ownerState" !== t && "theme" !== t && "sx" !== t && "as" !== t
    }
    var tl = t => tc(t) && "classes" !== t,
        tu = e0({
            themeId: ek.T,
            defaultTheme: ek.d,
            rootShouldForwardProp: tl
        });
    t.s(["a", 0, function(t, r, a) {
        let n = {};
        return Object.keys(t).forEach(o => {
            n[o] = t[o].reduce((t, n) => {
                if (n) {
                    let o = r(n);
                    "" !== o && t.push(o), a && a[n] && t.push(a[n])
                }
                return t
            }, []).join(" ")
        }), n
    }, "b", 0, tc, "c", 0, function() {
        for (var t, r, a = 0, n = "", o = arguments.length; a < o; a++)(t = arguments[a]) && (r = function t(r) {
            var a, n, o = "";
            if ("string" == typeof r || "number" == typeof r) o += r;
            else if ("object" == typeof r)
                if (Array.isArray(r)) {
                    var s = r.length;
                    for (a = 0; a < s; a++) r[a] && (n = t(r[a])) && (o && (o += " "), o += n)
                } else
                    for (n in r) r[n] && (o && (o += " "), o += n);
            return o
        }(t)) && (n && (n += " "), n += r);
        return n
    }, "d", 0, e1, "e", 0, eT, "f", 0, eq, "g", 0, eG, "r", 0, tl, "s", 0, tu], 42569)
}, 865800, t => {
    "use strict";
    var r = function() {
        return (r = Object.assign || function(t) {
            for (var r, a = 1, n = arguments.length; a < n; a++)
                for (var o in r = arguments[a]) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
            return t
        }).apply(this, arguments)
    };
    t.s(["_", () => r, "a", 0, function(t, r) {
        var a = {};
        for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && 0 > r.indexOf(n) && (a[n] = t[n]);
        if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
            var o = 0;
            for (n = Object.getOwnPropertySymbols(t); o < n.length; o++) 0 > r.indexOf(n[o]) && Object.prototype.propertyIsEnumerable.call(t, n[o]) && (a[n[o]] = t[n[o]])
        }
        return a
    }, "b", 0, function(t, r, a) {
        if (a || 2 == arguments.length)
            for (var n, o = 0, s = r.length; o < s; o++) !n && o in r || (n || (n = Array.prototype.slice.call(r, 0, o)), n[o] = r[o]);
        return t.concat(n || Array.prototype.slice.call(r))
    }])
}, 208958, t => {
    "use strict";
    var r = t.i(416340);

    function a(t, r) {
        "function" == typeof t ? t(r) : t && (t.current = r)
    }
    t.s(["s", 0, a, "u", 0, function() {
        for (var t = arguments.length, n = Array(t), o = 0; o < t; o++) n[o] = arguments[o];
        return r.useMemo(() => n.every(t => null == t) ? null : t => {
            n.forEach(r => {
                a(r, t)
            })
        }, n)
    }])
}, 738508, 163482, t => {
    "use strict";
    var r = t.i(416340);
    let a = {},
        n = [];
    class o {
        static create() {
            return new o
        }
        start(t, r) {
            this.clear(), this.currentId = setTimeout(() => {
                this.currentId = null, r()
            }, t)
        }
        constructor() {
            this.currentId = null, this.clear = () => {
                null !== this.currentId && (clearTimeout(this.currentId), this.currentId = null)
            }, this.disposeEffect = () => this.clear
        }
    }
    t.s(["T", 0, o, "u", 0, function() {
        var t, s;
        let i, c = (s = o.create, (i = r.useRef(a)).current === a && (i.current = s(void 0)), i).current;
        return t = c.disposeEffect, r.useEffect(t, n), c
    }], 163482);
    let s = !0,
        i = !1,
        c = new o,
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

    function u(t) {
        t.metaKey || t.altKey || t.ctrlKey || (s = !0)
    }

    function d() {
        s = !1
    }

    function f() {
        "hidden" === this.visibilityState && i && (s = !0)
    }
    t.s(["u", 0, function() {
        let t = r.useCallback(t => {
                var r;
                null != t && ((r = t.ownerDocument).addEventListener("keydown", u, !0), r.addEventListener("mousedown", d, !0), r.addEventListener("pointerdown", d, !0), r.addEventListener("touchstart", d, !0), r.addEventListener("visibilitychange", f, !0))
            }, []),
            a = r.useRef(!1);
        return {
            isFocusVisibleRef: a,
            onFocus: function(t) {
                return !! function(t) {
                    let {
                        target: r
                    } = t;
                    try {
                        return r.matches(":focus-visible")
                    } catch (t) {}
                    return s || function(t) {
                        let {
                            type: r,
                            tagName: a
                        } = t;
                        return !("INPUT" !== a || !l[r] || t.readOnly) || "TEXTAREA" === a && !t.readOnly || !!t.isContentEditable
                    }(r)
                }(t) && (a.current = !0, !0)
            },
            onBlur: function() {
                return !!a.current && (i = !0, c.start(100, () => {
                    i = !1
                }), a.current = !1, !0)
            },
            ref: t
        }
    }], 738508)
}, 993807, t => {
    "use strict";
    t.s(["default", 0, function(t, r) {
        var a = t || {};
        return r && (a.root = a.root ? "".concat(a.root, " ").concat(r) : r), a
    }])
}]);

//# debugId=8866930c-df20-0a5b-3e1a-cd242e7615cc
//# sourceMappingURL=3um9a83ixvw2k.js.map