;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "21cccfb8-760b-20e6-0dac-c0a3ba4ba6cc")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 220311, t => {
    "use strict";
    var r, n = ((r = n || {}).Home = "CreatorDashboard.Home", r.RoadMap = "CreatorDashboard.RoadMap", r.Features = "CreatorDashboard.Features", r.Landing = "CreatorDashboard.Landing", r.Navigation = "CreatorDashboard.Navigation", r.Metadata = "CreatorDashboard.Metadata", r.LogIn = "CreatorDashboard.LogIn", r.SignUp = "CreatorDashboard.SignUp", r.DevEx = "CreatorDashboard.DevEx", r.TaxDocumentation = "CreatorDashboard.TaxDocumentation", r.Controls = "CreatorDashboard.Controls", r.Error = "CreatorDashboard.Error", r.Creations = "CreatorDashboard.Creations", r.AgreementsManager = "CreatorDashboard.AgreementsManager", r.AssetTypes = "CreatorDashboard.AssetTypes", r.DevStatsGame = "CreatorDashboard.DevStatsGame", r.DevStatsExport = "CreatorDashboard.DevStatsExport", r.DevStatsPremium = "CreatorDashboard.EngagementPayout", r.DeveloperQuestionnaire = "CreatorDashboard.DeveloperQuestionnaire", r.Analytics = "CreatorDashboard.Analytics", r.AudienceReach = "CreatorDashboard.AudienceReach", r.ExperienceAlerts = "CreatorDashboard.ExperienceAlerts", r.ImmersiveAdsAnalytics = "CreatorDashboard.ImmersiveAdsAnalytics", r.Insights = "CreatorDashboard.Insights", r.AvatarAnalytics = "CreatorDashboard.AvatarAnalytics", r.StoreAnalytics = "CreatorDashboard.StoreAnalytics", r.ShareLinkAnalytics = "CreatorDashboard.ShareLinkAnalytics", r.ComputeTelemetry = "CreatorDashboard.ComputeTelemetry", r.GameLocalization = "CreatorDashboard.GameLocalization", r.GameLocalizationLanguages = "CreatorDashboard.GameLocalizationLanguages", r.GameLocalizationReports = "CreatorDashboard.GameLocalizationReports", r.GameLocalizationSettings = "CreatorDashboard.GameLocalizationSettings", r.GameLocalizationTranslators = "CreatorDashboard.GameLocalizationTranslators", r.GameLocalizationTableManagement = "CreatorDashboard.GameLocalizationTableManagement", r.GameTranslation = "CreatorDashboard.GameTranslation", r.GameInfoTranslation = "CreatorDashboard.GameInfoTranslation", r.GameStringTranslation = "CreatorDashboard.GameStringTranslation", r.GameProductTranslation = "CreatorDashboard.GameProductTranslation", r.ConfigureItem = "CreatorDashboard.ConfigureItem", r.OpenCloud = "CreatorDashboard.OpenCloud", r.OAuth = "CreatorDashboard.OAuth", r.ScopeSystem = "CreatorDashboard.ScopeSystem", r.AgreementsUpdate = "CreatorDashboard.AgreementsUpdate", r.AssetAnalytics = "CreatorDashboard.AssetAnalytics", r.UniverseConfigAndExperimentation = "CreatorDashboard.UniverseConfigAndExperimentation", r.Table = "CreatorDashboard.Table", r.TranslatorPortal = "CreatorDashboard.TranslatorPortal", r.Badges = "CreatorDashboard.Badges", r.DeveloperProducts = "CreatorDashboard.DeveloperProducts", r.SocialLinks = "CreatorDashboard.SocialLinks", r.Updates = "CreatorDashboard.Updates", r.Places = "CreatorDashboard.Places", r.PlaceThumbnails = "CreatorDashboard.PlaceThumbnails", r.GenreType = "CreatorDashboard.GenreType", r.AssetUpload = "CreatorDashboard.AssetUpload", r.AssetPermissions = "CreatorDashboard.AssetPermissions", r.Access = "CreatorDashboard.Access", r.Secrets = "CreatorDashboard.Secrets", r.PlaceAccess = "CreatorDashboard.PlaceAccess", r.Passes = "CreatorDashboard.Passes", r.ActivityFeed = "CreatorDashboard.ActivityFeed", r.VersionHistory = "CreatorDashboard.VersionHistory", r.Notifications = "CreatorDashboard.Notifications", r.DeveloperItem = "CreatorDashboard.DeveloperItem", r.Settings = "CreatorDashboard.Settings", r.SendrNotificationPreferences = "Notifications.Preferences", r.CloudServices = "CreatorDashboard.CloudServices", r.Community = "CreatorDashboard.Community", r.Preferences = "CreatorDashboard.Preferences", r.ExperienceSubscriptions = "CreatorDashboard.DeveloperSubscriptions", r.Commerce = "CreatorDashboard.Commerce", r.CreatorAccount = "CreatorDashboard.CreatorAccount", r.Advanced = "CreatorDashboard.Advanced", r.RightsPortal = "CreatorDashboard.RightsPortal", r.Transactions = "CreatorDashboard.Transactions", r.DataCollection = "CreatorDashboard.DataCollection", r.DataCollectionSettings = "CreatorDashboard.DataCollectionSettings", r.DataCollectionTerms = "CreatorDashboard.DataCollectionTerms", r.MarketplaceOnboarding = "CreatorDashboard.MarketplaceOnboarding", r.Organization = "CreatorDashboard.Organization", r.CommunicationSettings = "CreatorDashboard.CommunicationSettings", r.UnifiedNavigation = "CreatorDocumentation.Navigation", r.DeveloperLanding = "CreatorDashboard.DeveloperLanding", r.Payouts = "CreatorDashboard.Payouts", r.RevenueShareAgreements = "CreatorDashboard.RevenueShareAgreements", r.DataSharingSettingsV2 = "CreatorDashboard.DataSharingSettingsV2", r.PriceOptimization = "CreatorDashboard.PriceOptimization", r.SafetyControls = "CreatorDashboard.SafetyControls", r.ShareLinksManagement = "CreatorDashboard.ShareLinksManagament", r.ShareLinkPromo = "CreatorDashboard.ShareLinkPromo", r.FiatPaidAccess = "CreatorDashboard.FiatPaidAccess", r.PublicPublish = "CreatorDashboard.PublicReach", r.Genres = "Experience.Genre", r.OwnershipTransfer = "CreatorDashboard.OwnershipTransfer", r.DocsAssistant = "Feature.QNAB", r.AssetPrivacy = "CreatorDashboard.AssetPrivacy", r.AffiliateProgram = "CreatorDashboard.AffiliateProgram", r.PlayerFeedback = "CreatorDashboard.PlayerFeedback", r.RegionalPricing = "CreatorDashboard.RegionalPricing", r.AnalyticsAssistant = "CreatorDashboard.AnalyticsAssistant", r.Matchmaking = "CreatorDashboard.CustomMatchmaking", r.Licenses = "CreatorDashboard.Licenses", r.Permissions = "CreatorDashboard.Permissions", r.ReferralRewards = "CreatorDashboard.ReferralRewards", r.DynamicPriceCheck = "CreatorDashboard.DynamicPriceCheck", r.NotApproved = "Feature.NotApproved", r.Moderation = "Feature.Moderation", r.AppealsPortal = "Feature.AppealsPortal", r.DashboardModeration = "CreatorDashboard.Moderation", r.Environments = "CreatorDashboard.Environments", r.PageTitles = "CreatorDashboard.PageTitles", r.CreatorRewards = "CreatorDashboard.CreatorRewards", r.CreatorRewardsLanding = "CreatorDashboard.CreatorRewardsLanding", r.ExperienceReleases = "CreatorDashboard.ExperienceReleases", r.Variants = "CreatorDashboard.Variants", r.ServerManagement = "CreatorDashboard.ServerManagement", r.Safety = "CreatorDashboard.Safety", r.CommonUIControls = "CommonUI.Controls", r.CommonUIMessages = "CommonUI.Messages", r.Taxonomy = "CreatorDashboard.Taxonomy", r.RecommendationService = "CreatorDashboard.RecommendationService", r.DataStoresManager = "CreatorDashboard.DataStoresManager", r.AccessPolicy = "CreatorDashboard.AccessPolicy", r.Groups = "Feature.Groups", r.GroupManagement = "Feature.GroupManagement", r.Privacy = "Feature.Privacy", r.ManagedPricing = "CreatorDashboard.ManagedPricing", r.HardCodedPrices = "CreatorDashboard.HardCodedPrices", r.SocialLinksAgeVerificationUpsell = "Feature.SocialLinks", r.PurchaseError = "IAPExperience.PurchaseError", r.TalentHubV2 = "CreatorDashboard.TalentHubV2", r.Leaderboards = "CreatorDashboard.Leaderboards", r.PersonalizedShop = "CreatorDashboard.PersonalizedShop", r.PresetChat = "CreatorDashboard.PresetChat", r);
    t.s(["default", 0, n])
}, 881670, t => {
    "use strict";
    var r = t.i(220311);
    t.s(["TranslationNamespace", () => r.default])
}, 691551, 947287, 571709, t => {
    "use strict";
    var r, n, a = t.i(164688);
    t.s(["withEmotionCache", () => a.w], 691551), t.s(["CacheProvider", () => a.C], 947287);
    var o = t.i(416340),
        i = t.i(905625),
        s = t.i(327209),
        l = t.i(220454);
    t.i(781979);
    var c = function(t, r) {
        var n = arguments;
        if (null == r || !a.h.call(r, "css")) return o.createElement.apply(void 0, n);
        var i = n.length,
            s = Array(i);
        s[0] = a.E, s[1] = (0, a.c)(t, r);
        for (var l = 2; l < i; l++) s[l] = n[l];
        return o.createElement.apply(null, s)
    };
    r = c || (c = {}), n || (n = r.JSX || (r.JSX = {}));
    var u = (0, a.w)(function(t, r) {
        var n = t.styles,
            c = (0, l.serializeStyles)([n], void 0, o.useContext(a.T)),
            u = o.useRef();
        return (0, s.useInsertionEffectWithLayoutFallback)(function() {
            var t = r.key + "-global",
                n = new r.sheet.constructor({
                    key: t,
                    nonce: r.sheet.nonce,
                    container: r.sheet.container,
                    speedy: r.sheet.isSpeedy
                }),
                a = !1,
                o = document.querySelector('style[data-emotion="' + t + " " + c.name + '"]');
            return r.sheet.tags.length && (n.before = r.sheet.tags[0]), null !== o && (a = !0, o.setAttribute("data-emotion", t), n.hydrate([o])), u.current = [n, a],
                function() {
                    n.flush()
                }
        }, [r]), (0, s.useInsertionEffectWithLayoutFallback)(function() {
            var t = u.current,
                n = t[0];
            if (t[1]) {
                t[1] = !1;
                return
            }
            if (void 0 !== c.next && (0, i.insertStyles)(r, c.next, !0), n.tags.length) {
                var a = n.tags[n.tags.length - 1].nextElementSibling;
                n.before = a, n.flush()
            }
            r.insert("", c, n, !1)
        }, [r, c.name]), null
    });

    function f() {
        for (var t = arguments.length, r = Array(t), n = 0; n < t; n++) r[n] = arguments[n];
        return (0, l.serializeStyles)(r)
    }
    t.s(["Global", 0, u, "css", 0, f, "keyframes", 0, function() {
        var t = f.apply(void 0, arguments),
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
    var n = t.i(221628),
        a = t.i(519618);
    let o = r.createContext(void 0);
    t.s(["D", 0, function(t) {
        let {
            value: r,
            children: a
        } = t;
        return (0, n.jsx)(o.Provider, {
            value: r,
            children: a
        })
    }, "u", 0, function(t) {
        return function(t) {
            let {
                props: n,
                name: i
            } = t;
            return function(t) {
                let {
                    theme: r,
                    name: n,
                    props: o
                } = t;
                if (!r || !r.components || !r.components[n]) return o;
                let i = r.components[n];
                return i.defaultProps ? (0, a.r)(i.defaultProps, o) : i.styleOverrides || i.variants ? o : (0, a.r)(i, o)
            }({
                props: n,
                name: i,
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
        n = (0, t.i(485511).c)(r.p.elementType, function(t, r, n, a, o) {
            let i, s = t[r];
            return null == s || "u" < typeof window ? null : ("function" != typeof s || function(t) {
                let {
                    prototype: r = {}
                } = t;
                return !!r.isReactComponent
            }(s) || (i = "Did you accidentally provide a plain function component instead?"), void 0 !== i ? Error("Invalid ".concat(a, " `").concat(o || r, "` supplied to `").concat(n, "`. Expected an element type that can hold a ref. ").concat(i, " For more information see https://mui.com/r/caveat-with-refs-guide")) : null)
        });
    t.s(["e", 0, n])
}, 696180, t => {
    "use strict";
    var r = t.i(273589);
    t.s(["g", 0, function(t, n) {
        let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : "Mui",
            o = {};
        return n.forEach(n => {
            o[n] = (0, r.g)(t, n, a)
        }), o
    }])
}, 270673, t => {
    "use strict";
    var r = t.i(962560),
        n = t.i(273589),
        a = t.i(416340),
        o = t.i(221628);
    let i = ["value"],
        s = a.createContext();
    t.s(["R", 0, function(t) {
        let {
            value: a
        } = t, l = (0, n._)(t, i);
        return (0, o.jsx)(s.Provider, (0, r._)({
            value: null == a || a
        }, l))
    }, "u", 0, () => {
        let t = a.useContext(s);
        return null != t && t
    }])
}, 531950, t => {
    "use strict";
    var r = t.i(696180),
        n = t.i(273589),
        a = (0, r.g)("MuiPaper", ["root", "rounded", "outlined", "elevation", "elevation0", "elevation1", "elevation2", "elevation3", "elevation4", "elevation5", "elevation6", "elevation7", "elevation8", "elevation9", "elevation10", "elevation11", "elevation12", "elevation13", "elevation14", "elevation15", "elevation16", "elevation17", "elevation18", "elevation19", "elevation20", "elevation21", "elevation22", "elevation23", "elevation24"]);
    t.s(["g", 0, function(t) {
        return (0, n.g)("MuiPaper", t)
    }, "p", 0, a])
}, 519618, t => {
    "use strict";
    var r = t.i(962560);
    t.s(["r", 0, function t(n, a) {
        let o = (0, r._)({}, a);
        return Object.keys(n).forEach(i => {
            if (i.toString().match(/^(components|slots)$/)) o[i] = (0, r._)({}, n[i], o[i]);
            else if (i.toString().match(/^(componentsProps|slotProps)$/)) {
                let s = n[i] || {},
                    l = a[i];
                o[i] = {}, l && Object.keys(l) ? s && Object.keys(s) ? (o[i] = (0, r._)({}, l), Object.keys(s).forEach(r => {
                    o[i][r] = t(s[r], l[r])
                })) : o[i] = l : o[i] = s
            } else void 0 === o[i] && (o[i] = n[i])
        }), o
    }])
}, 42569, 780247, 511257, t => {
    "use strict";
    var r, n = t.i(273589),
        a = t.i(178417),
        o = t.i(416340),
        i = t.i(962560),
        s = t.i(691551),
        l = t.i(534424),
        c = t.i(947287),
        u = t.i(571709),
        f = t.i(724913),
        d = function() {
            function t(t) {
                var r = this;
                this._insertTag = function(t) {
                    var n;
                    n = 0 === r.tags.length ? r.insertionPoint ? r.insertionPoint.nextSibling : r.prepend ? r.container.firstChild : r.before : r.tags[r.tags.length - 1].nextSibling, r.container.insertBefore(t, n), r.tags.push(t)
                }, this.isSpeedy = void 0 === t.speedy || t.speedy, this.tags = [], this.ctr = 0, this.nonce = t.nonce, this.key = t.key, this.container = t.container, this.prepend = t.prepend, this.insertionPoint = t.insertionPoint, this.before = null
            }
            var r = t.prototype;
            return r.hydrate = function(t) {
                t.forEach(this._insertTag)
            }, r.insert = function(t) {
                this.ctr % (this.isSpeedy ? 65e3 : 1) == 0 && this._insertTag(((r = document.createElement("style")).setAttribute("data-emotion", this.key), void 0 !== this.nonce && r.setAttribute("nonce", this.nonce), r.appendChild(document.createTextNode("")), r.setAttribute("data-s", ""), r));
                var r, n = this.tags[this.tags.length - 1];
                if (this.isSpeedy) {
                    var a = function(t) {
                        if (t.sheet) return t.sheet;
                        for (var r = 0; r < document.styleSheets.length; r++)
                            if (document.styleSheets[r].ownerNode === t) return document.styleSheets[r]
                    }(n);
                    try {
                        a.insertRule(t, a.cssRules.length)
                    } catch (t) {}
                } else n.appendChild(document.createTextNode(t));
                this.ctr++
            }, r.flush = function() {
                this.tags.forEach(function(t) {
                    var r;
                    return null == (r = t.parentNode) ? void 0 : r.removeChild(t)
                }), this.tags = [], this.ctr = 0
            }, t
        }(),
        h = "-ms-",
        p = "-moz-",
        m = "-webkit-",
        y = "comm",
        v = "rule",
        b = "decl",
        g = "@keyframes",
        C = Math.abs,
        S = String.fromCharCode,
        k = Object.assign;

    function _(t, r, n) {
        return t.replace(r, n)
    }

    function w(t, r) {
        return t.indexOf(r)
    }

    function T(t, r) {
        return 0 | t.charCodeAt(r)
    }

    function P(t, r, n) {
        return t.slice(r, n)
    }

    function x(t) {
        return t.length
    }

    function D(t, r) {
        return r.push(t), t
    }
    var A = 1,
        E = 1,
        R = 0,
        O = 0,
        L = 0,
        j = "";

    function I(t, r, n, a, o, i, s) {
        return {
            value: t,
            root: r,
            parent: n,
            type: a,
            props: o,
            children: i,
            line: A,
            column: E,
            length: s,
            return: ""
        }
    }

    function M(t, r) {
        return k(I("", null, null, "", null, null, 0), t, {
            length: -t.length
        }, r)
    }

    function z() {
        return L = O < R ? T(j, O++) : 0, E++, 10 === L && (E = 1, A++), L
    }

    function F() {
        return T(j, O)
    }

    function $(t) {
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

    function N(t) {
        return A = E = 1, R = x(j = t), O = 0, []
    }

    function H(t) {
        var r, n;
        return (r = O - 1, n = function t(r) {
            for (; z();) switch (L) {
                case r:
                    return O;
                case 34:
                case 39:
                    34 !== r && 39 !== r && t(L);
                    break;
                case 40:
                    41 === r && t(r);
                    break;
                case 92:
                    z()
            }
            return O
        }(91 === t ? t + 2 : 40 === t ? t + 1 : t), P(j, r, n)).trim()
    }

    function G(t) {
        var r;
        return r = function t(r, n, a, o, i, s, l, c, u) {
            for (var f, d = 0, h = 0, p = l, m = 0, v = 0, b = 0, g = 1, C = 1, k = 1, R = 0, M = "", N = i, G = s, B = o, J = M; C;) switch (b = R, R = z()) {
                case 40:
                    if (108 != b && 58 == T(J, p - 1)) {
                        -1 != w(J += _(H(R), "&", "&\f"), "&\f") && (k = -1);
                        break
                    }
                case 34:
                case 39:
                case 91:
                    J += H(R);
                    break;
                case 9:
                case 10:
                case 13:
                case 32:
                    J += function(t) {
                        for (;
                            (L = F()) && L < 33;) z();
                        return $(t) > 2 || $(L) > 3 ? "" : " "
                    }(b);
                    break;
                case 92:
                    J += function(t, r) {
                        for (var n; --r && z() && !(L < 48 || L > 102 || L > 57 && L < 65 || L > 70 && L < 97););
                        return n = O + (r < 6 && 32 == F() && 32 == z()), P(j, t, n)
                    }(O - 1, 7);
                    continue;
                case 47:
                    switch (F()) {
                        case 42:
                        case 47:
                            D((f = function(t, r) {
                                for (; z() && t + L !== 57 && (t + L !== 84 || 47 !== F()););
                                return "/*" + P(j, r, O - 1) + "*" + S(47 === t ? t : z())
                            }(z(), O), I(f, n, a, y, S(L), P(f, 2, -2), 0)), u);
                            break;
                        default:
                            J += "/"
                    }
                    break;
                case 123 * g:
                    c[d++] = x(J) * k;
                case 125 * g:
                case 59:
                case 0:
                    switch (R) {
                        case 0:
                        case 125:
                            C = 0;
                        case 59 + h:
                            -1 == k && (J = _(J, /\f/g, "")), v > 0 && x(J) - p && D(v > 32 ? U(J + ";", o, a, p - 1) : U(_(J, " ", "") + ";", o, a, p - 2), u);
                            break;
                        case 59:
                            J += ";";
                        default:
                            if (D(B = V(J, n, a, d, h, i, c, M, N = [], G = [], p), s), 123 === R)
                                if (0 === h) t(J, n, B, B, N, s, p, c, G);
                                else switch (99 === m && 110 === T(J, 3) ? 100 : m) {
                                    case 100:
                                    case 108:
                                    case 109:
                                    case 115:
                                        t(r, B, B, o && D(V(r, B, B, 0, 0, i, c, M, i, N = [], p), G), i, G, p, c, o ? N : G);
                                        break;
                                    default:
                                        t(J, B, B, B, [""], G, 0, c, G)
                                }
                    }
                    d = h = v = 0, g = k = 1, M = J = "", p = l;
                    break;
                case 58:
                    p = 1 + x(J), v = b;
                default:
                    if (g < 1) {
                        if (123 == R) --g;
                        else if (125 == R && 0 == g++ && 125 == (L = O > 0 ? T(j, --O) : 0, E--, 10 === L && (E = 1, A--), L)) continue
                    }
                    switch (J += S(R), R * g) {
                        case 38:
                            k = h > 0 ? 1 : (J += "\f", -1);
                            break;
                        case 44:
                            c[d++] = (x(J) - 1) * k, k = 1;
                            break;
                        case 64:
                            45 === F() && (J += H(z())), m = F(), h = p = x(M = J += function(t) {
                                for (; !$(F());) z();
                                return P(j, t, O)
                            }(O)), R++;
                            break;
                        case 45:
                            45 === b && 2 == x(J) && (g = 0)
                    }
            }
            return s
        }("", null, null, null, [""], t = N(t), 0, [0], t), j = "", r
    }

    function V(t, r, n, a, o, i, s, l, c, u, f) {
        for (var d = o - 1, h = 0 === o ? i : [""], p = h.length, m = 0, y = 0, b = 0; m < a; ++m)
            for (var g = 0, S = P(t, d + 1, d = C(y = s[m])), k = t; g < p; ++g)(k = (y > 0 ? h[g] + " " + S : _(S, /&\f/g, h[g])).trim()) && (c[b++] = k);
        return I(t, r, n, 0 === o ? v : l, c, u, f)
    }

    function U(t, r, n, a) {
        return I(t, r, n, b, P(t, 0, a), P(t, a + 1, -1), a)
    }

    function B(t, r) {
        for (var n = "", a = t.length, o = 0; o < a; o++) n += r(t[o], o, t, r) || "";
        return n
    }

    function J(t, r, n, a) {
        switch (t.type) {
            case "@layer":
                if (t.children.length) break;
            case "@import":
            case b:
                return t.return = t.return || t.value;
            case y:
                return "";
            case g:
                return t.return = t.value + "{" + B(t.children, a) + "}";
            case v:
                t.value = t.props.join(",")
        }
        return x(n = B(t.children, a)) ? t.return = t.value + "{" + n + "}" : ""
    }

    function W(t) {
        var r = t.length;
        return function(n, a, o, i) {
            for (var s = "", l = 0; l < r; l++) s += t[l](n, a, o, i) || "";
            return s
        }
    }
    var q, K, X = "u" > typeof document,
        Y = function(t, r, n) {
            for (var a = 0, o = 0; a = o, o = F(), 38 === a && 12 === o && (r[n] = 1), !$(o);) z();
            return P(j, t, O)
        },
        Q = function(t, r) {
            var n;
            return n = function(t, r) {
                var n = -1,
                    a = 44;
                do switch ($(a)) {
                    case 0:
                        38 === a && 12 === F() && (r[n] = 1), t[n] += Y(O - 1, r, n);
                        break;
                    case 2:
                        t[n] += H(a);
                        break;
                    case 4:
                        if (44 === a) {
                            t[++n] = 58 === F() ? "&\f" : "", r[n] = t[n].length;
                            break
                        }
                    default:
                        t[n] += S(a)
                }
                while (a = z()) return t
            }(N(t), r), j = "", n
        },
        Z = new WeakMap,
        ee = function(t) {
            if ("rule" === t.type && t.parent && !(t.length < 1)) {
                for (var r = t.value, n = t.parent, a = t.column === n.column && t.line === n.line;
                    "rule" !== n.type;)
                    if (!(n = n.parent)) return;
                if ((1 !== t.props.length || 58 === r.charCodeAt(0) || Z.get(n)) && !a) {
                    Z.set(t, !0);
                    for (var o = [], i = Q(r, o), s = n.props, l = 0, c = 0; l < i.length; l++)
                        for (var u = 0; u < s.length; u++, c++) t.props[c] = o[l] ? i[l].replace(/&\f/g, s[u]) : s[u] + " " + i[l]
                }
            }
        },
        et = function(t) {
            if ("decl" === t.type) {
                var r = t.value;
                108 === r.charCodeAt(0) && 98 === r.charCodeAt(2) && (t.return = "", t.value = "")
            }
        },
        er = X ? void 0 : (q = function() {
            var t, r;
            return t = function() {
                    return {}
                }, r = Object.create(null),
                function(n) {
                    return void 0 === r[n] && (r[n] = t()), r[n]
                }
        }, K = new WeakMap, function(t) {
            if (K.has(t)) return K.get(t);
            var r = q();
            return K.set(t, r), r
        }),
        en = [function(t, r, n, a) {
            if (t.length > -1 && !t.return) switch (t.type) {
                case b:
                    t.return = function t(r, n) {
                        switch (45 ^ T(r, 0) ? (((n << 2 ^ T(r, 0)) << 2 ^ T(r, 1)) << 2 ^ T(r, 2)) << 2 ^ T(r, 3) : 0) {
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
                                return m + r + p + r + h + r + r;
                            case 6828:
                            case 4268:
                                return m + r + h + r + r;
                            case 6165:
                                return m + r + h + "flex-" + r + r;
                            case 5187:
                                return m + r + _(r, /(\w+).+(:[^]+)/, m + "box-$1$2" + h + "flex-$1$2") + r;
                            case 5443:
                                return m + r + h + "flex-item-" + _(r, /flex-|-self/, "") + r;
                            case 4675:
                                return m + r + h + "flex-line-pack" + _(r, /align-content|flex-|-self/, "") + r;
                            case 5548:
                                return m + r + h + _(r, "shrink", "negative") + r;
                            case 5292:
                                return m + r + h + _(r, "basis", "preferred-size") + r;
                            case 6060:
                                return m + "box-" + _(r, "-grow", "") + m + r + h + _(r, "grow", "positive") + r;
                            case 4554:
                                return m + _(r, /([^-])(transform)/g, "$1" + m + "$2") + r;
                            case 6187:
                                return _(_(_(r, /(zoom-|grab)/, m + "$1"), /(image-set)/, m + "$1"), r, "") + r;
                            case 5495:
                            case 3959:
                                return _(r, /(image-set\([^]*)/, m + "$1$`$1");
                            case 4968:
                                return _(_(r, /(.+:)(flex-)?(.*)/, m + "box-pack:$3" + h + "flex-pack:$3"), /s.+-b[^;]+/, "justify") + m + r + r;
                            case 4095:
                            case 3583:
                            case 4068:
                            case 2532:
                                return _(r, /(.+)-inline(.+)/, m + "$1$2") + r;
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
                                if (x(r) - 1 - n > 6) switch (T(r, n + 1)) {
                                    case 109:
                                        if (45 !== T(r, n + 4)) break;
                                    case 102:
                                        return _(r, /(.+:)(.+)-([^]+)/, "$1" + m + "$2-$3$1" + p + (108 == T(r, n + 3) ? "$3" : "$2-$3")) + r;
                                    case 115:
                                        return ~w(r, "stretch") ? t(_(r, "stretch", "fill-available"), n) + r : r
                                }
                                break;
                            case 4949:
                                if (115 !== T(r, n + 1)) break;
                            case 6444:
                                switch (T(r, x(r) - 3 - (~w(r, "!important") && 10))) {
                                    case 107:
                                        return _(r, ":", ":" + m) + r;
                                    case 101:
                                        return _(r, /(.+:)([^;!]+)(;|!.+)?/, "$1" + m + (45 === T(r, 14) ? "inline-" : "") + "box$3$1" + m + "$2$3$1" + h + "$2box$3") + r
                                }
                                break;
                            case 5936:
                                switch (T(r, n + 11)) {
                                    case 114:
                                        return m + r + h + _(r, /[svh]\w+-[tblr]{2}/, "tb") + r;
                                    case 108:
                                        return m + r + h + _(r, /[svh]\w+-[tblr]{2}/, "tb-rl") + r;
                                    case 45:
                                        return m + r + h + _(r, /[svh]\w+-[tblr]{2}/, "lr") + r
                                }
                                return m + r + h + r + r
                        }
                        return r
                    }(t.value, t.length);
                    break;
                case g:
                    return B([M(t, {
                        value: _(t.value, "@", "@" + m)
                    })], a);
                case v:
                    if (t.length) {
                        var o, i;
                        return o = t.props, i = function(r) {
                            var n;
                            switch ((n = /(::plac\w+|:read-\w+)/.exec(n = r)) ? n[0] : n) {
                                case ":read-only":
                                case ":read-write":
                                    return B([M(t, {
                                        props: [_(r, /:(read-\w+)/, ":" + p + "$1")]
                                    })], a);
                                case "::placeholder":
                                    return B([M(t, {
                                        props: [_(r, /:(plac\w+)/, ":" + m + "input-$1")]
                                    }), M(t, {
                                        props: [_(r, /:(plac\w+)/, ":" + p + "$1")]
                                    }), M(t, {
                                        props: [_(r, /:(plac\w+)/, h + "input-$1")]
                                    })], a)
                            }
                            return ""
                        }, o.map(i).join("")
                    }
            }
        }],
        ea = function(t) {
            var r = t.key;
            if (X && "css" === r) {
                var n = document.querySelectorAll("style[data-emotion]:not([data-s])");
                Array.prototype.forEach.call(n, function(t) {
                    -1 !== t.getAttribute("data-emotion").indexOf(" ") && (document.head.appendChild(t), t.setAttribute("data-s", ""))
                })
            }
            var a, o, i = t.stylisPlugins || en,
                s = {},
                l = [];
            X && (a = t.container || document.head, Array.prototype.forEach.call(document.querySelectorAll('style[data-emotion^="' + r + ' "]'), function(t) {
                for (var r = t.getAttribute("data-emotion").split(" "), n = 1; n < r.length; n++) s[r[n]] = !0;
                l.push(t)
            }));
            var c, u = [ee, et];
            if (er) {
                var f = W(u.concat(i, [J])),
                    h = er(i)(r),
                    p = function(t, r) {
                        var n = r.name;
                        return void 0 === h[n] && (h[n] = B(G(t ? t + "{" + r.styles + "}" : r.styles), f)), h[n]
                    };
                o = function(t, r, n, a) {
                    var o = r.name,
                        i = p(t, r);
                    return void 0 === b.compat ? (a && (b.inserted[o] = !0), i) : a ? void(b.inserted[o] = i) : i
                }
            } else {
                var m, y = [J, (c = function(t) {
                        m.insert(t)
                    }, function(t) {
                        t.root || (t = t.return) && c(t)
                    })],
                    v = W(u.concat(i, y));
                o = function(t, r, n, a) {
                    m = n, B(G(t ? t + "{" + r.styles + "}" : r.styles), v), a && (b.inserted[r.name] = !0)
                }
            }
            var b = {
                key: r,
                sheet: new d({
                    key: r,
                    container: a,
                    nonce: t.nonce,
                    speedy: t.speedy,
                    prepend: t.prepend,
                    insertionPoint: t.insertionPoint
                }),
                nonce: t.nonce,
                inserted: s,
                registered: {},
                insert: o
            };
            return b.sheet.hydrate(l), b
        };
    t.s(["c", 0, ea], 780247);
    var eo = t.i(221628),
        ei = /^((children|dangerouslySetInnerHTML|key|ref|autoFocus|defaultValue|defaultChecked|innerHTML|suppressContentEditableWarning|suppressHydrationWarning|valueLink|abbr|accept|acceptCharset|accessKey|action|allow|allowUserMedia|allowPaymentRequest|allowFullScreen|allowTransparency|alt|async|autoComplete|autoPlay|capture|cellPadding|cellSpacing|challenge|charSet|checked|cite|classID|className|cols|colSpan|content|contentEditable|contextMenu|controls|controlsList|coords|crossOrigin|data|dateTime|decoding|default|defer|dir|disabled|disablePictureInPicture|download|draggable|encType|enterKeyHint|form|formAction|formEncType|formMethod|formNoValidate|formTarget|frameBorder|headers|height|hidden|high|href|hrefLang|htmlFor|httpEquiv|id|inputMode|integrity|is|keyParams|keyType|kind|label|lang|list|loading|loop|low|marginHeight|marginWidth|max|maxLength|media|mediaGroup|method|min|minLength|multiple|muted|name|nonce|noValidate|open|optimum|pattern|placeholder|playsInline|poster|preload|profile|radioGroup|readOnly|referrerPolicy|rel|required|reversed|role|rows|rowSpan|sandbox|scope|scoped|scrolling|seamless|selected|shape|size|sizes|slot|span|spellCheck|src|srcDoc|srcLang|srcSet|start|step|style|summary|tabIndex|target|title|translate|type|useMap|value|width|wmode|wrap|about|datatype|inlist|prefix|property|resource|typeof|vocab|autoCapitalize|autoCorrect|autoSave|color|incremental|fallback|inert|itemProp|itemScope|itemType|itemID|itemRef|on|option|results|security|unselectable|accentHeight|accumulate|additive|alignmentBaseline|allowReorder|alphabetic|amplitude|arabicForm|ascent|attributeName|attributeType|autoReverse|azimuth|baseFrequency|baselineShift|baseProfile|bbox|begin|bias|by|calcMode|capHeight|clip|clipPathUnits|clipPath|clipRule|colorInterpolation|colorInterpolationFilters|colorProfile|colorRendering|contentScriptType|contentStyleType|cursor|cx|cy|d|decelerate|descent|diffuseConstant|direction|display|divisor|dominantBaseline|dur|dx|dy|edgeMode|elevation|enableBackground|end|exponent|externalResourcesRequired|fill|fillOpacity|fillRule|filter|filterRes|filterUnits|floodColor|floodOpacity|focusable|fontFamily|fontSize|fontSizeAdjust|fontStretch|fontStyle|fontVariant|fontWeight|format|from|fr|fx|fy|g1|g2|glyphName|glyphOrientationHorizontal|glyphOrientationVertical|glyphRef|gradientTransform|gradientUnits|hanging|horizAdvX|horizOriginX|ideographic|imageRendering|in|in2|intercept|k|k1|k2|k3|k4|kernelMatrix|kernelUnitLength|kerning|keyPoints|keySplines|keyTimes|lengthAdjust|letterSpacing|lightingColor|limitingConeAngle|local|markerEnd|markerMid|markerStart|markerHeight|markerUnits|markerWidth|mask|maskContentUnits|maskUnits|mathematical|mode|numOctaves|offset|opacity|operator|order|orient|orientation|origin|overflow|overlinePosition|overlineThickness|panose1|paintOrder|pathLength|patternContentUnits|patternTransform|patternUnits|pointerEvents|points|pointsAtX|pointsAtY|pointsAtZ|preserveAlpha|preserveAspectRatio|primitiveUnits|r|radius|refX|refY|renderingIntent|repeatCount|repeatDur|requiredExtensions|requiredFeatures|restart|result|rotate|rx|ry|scale|seed|shapeRendering|slope|spacing|specularConstant|specularExponent|speed|spreadMethod|startOffset|stdDeviation|stemh|stemv|stitchTiles|stopColor|stopOpacity|strikethroughPosition|strikethroughThickness|string|stroke|strokeDasharray|strokeDashoffset|strokeLinecap|strokeLinejoin|strokeMiterlimit|strokeOpacity|strokeWidth|surfaceScale|systemLanguage|tableValues|targetX|targetY|textAnchor|textDecoration|textRendering|textLength|to|transform|u1|u2|underlinePosition|underlineThickness|unicode|unicodeBidi|unicodeRange|unitsPerEm|vAlphabetic|vHanging|vIdeographic|vMathematical|values|vectorEffect|version|vertAdvY|vertOriginX|vertOriginY|viewBox|viewTarget|visibility|widths|wordSpacing|writingMode|x|xHeight|x1|x2|xChannelSelector|xlinkActuate|xlinkArcrole|xlinkHref|xlinkRole|xlinkShow|xlinkTitle|xlinkType|xmlBase|xmlns|xmlnsXlink|xmlLang|xmlSpace|y|y1|y2|yChannelSelector|z|zoomAndPan|for|class|autofocus)|(([Dd][Aa][Tt][Aa]|[Aa][Rr][Ii][Aa]|x)-.*))$/,
        es = (eE = function(t) {
            return ei.test(t) || 111 === t.charCodeAt(0) && 110 === t.charCodeAt(1) && 91 > t.charCodeAt(2)
        }, eR = Object.create(null), function(t) {
            return void 0 === eR[t] && (eR[t] = eE(t)), eR[t]
        }),
        el = "u" > typeof document,
        ec = !!o.useInsertionEffect && o.useInsertionEffect,
        eu = el && ec || function(t) {
            return t()
        },
        ef = function(t) {
            return "theme" !== t
        },
        ed = function(t) {
            return "string" == typeof t && t.charCodeAt(0) > 96 ? es : ef
        },
        eh = function(t, r, n) {
            var a;
            if (r) {
                var o = r.shouldForwardProp;
                a = t.__emotion_forwardProp && o ? function(r) {
                    return t.__emotion_forwardProp(r) && o(r)
                } : o
            }
            return "function" != typeof a && n && (a = t.__emotion_forwardProp), a
        },
        ep = "u" > typeof document,
        em = function(t) {
            var r = t.cache,
                n = t.serialized,
                a = t.isStringTag;
            (0, f.r)(r, n, a);
            var i = eu(function() {
                return (0, f.i)(r, n, a)
            });
            if (!ep && void 0 !== i) {
                for (var s, l = n.name, c = n.next; void 0 !== c;) l += " " + c.name, c = c.next;
                return (0, o.createElement)("style", ((s = {})["data-emotion"] = r.key + " " + l, s.dangerouslySetInnerHTML = {
                    __html: i
                }, s.nonce = r.sheet.nonce, s))
            }
            return null
        },
        ey = (function t(r, n) {
            var a, c, u = r.__emotion_real === r,
                d = u && r.__emotion_base || r;
            void 0 !== n && (a = n.label, c = n.target);
            var h = eh(r, n, u),
                p = h || ed(d),
                m = !p("as");
            return function() {
                var y = arguments,
                    v = u && void 0 !== r.__emotion_styles ? r.__emotion_styles.slice(0) : [];
                if (void 0 !== a && v.push("label:" + a + ";"), null == y[0] || void 0 === y[0].raw) v.push.apply(v, y);
                else {
                    v.push(y[0][0]);
                    for (var b = y.length, g = 1; g < b; g++) v.push(y[g], y[0][g])
                }
                var C = (0, s.withEmotionCache)(function(t, r, n) {
                    var a = m && t.as || d,
                        i = "",
                        s = [],
                        u = t;
                    if (null == t.theme) {
                        for (var y in u = {}, t) u[y] = t[y];
                        u.theme = (0, o.useContext)(l.ThemeContext)
                    }
                    "string" == typeof t.className ? i = (0, f.g)(r.registered, s, t.className) : null != t.className && (i = t.className + " ");
                    var b = (0, f.s)(v.concat(s), r.registered, u);
                    i += r.key + "-" + b.name, void 0 !== c && (i += " " + c);
                    var g = m && void 0 === h ? ed(a) : p,
                        C = {};
                    for (var S in t) m && "as" === S || g(S) && (C[S] = t[S]);
                    return C.className = i, C.ref = n, (0, o.createElement)(o.Fragment, null, (0, o.createElement)(em, {
                        cache: r,
                        serialized: b,
                        isStringTag: "string" == typeof a
                    }), (0, o.createElement)(a, C))
                });
                return C.displayName = void 0 !== a ? a : "Styled(" + ("string" == typeof d ? d : d.displayName || d.name || "Component") + ")", C.defaultProps = r.defaultProps, C.__emotion_real = C, C.__emotion_base = d, C.__emotion_styles = v, C.__emotion_forwardProp = h, Object.defineProperty(C, "toString", {
                    value: function() {
                        return "." + c
                    }
                }), C.withComponent = function(r, a) {
                    return t(r, (0, i._)({}, n, a, {
                        shouldForwardProp: eh(C, a, !0)
                    })).apply(void 0, v)
                }, C
            }
        }).bind();
    ["a", "abbr", "address", "area", "article", "aside", "audio", "b", "base", "bdi", "bdo", "big", "blockquote", "body", "br", "button", "canvas", "caption", "cite", "code", "col", "colgroup", "data", "datalist", "dd", "del", "details", "dfn", "dialog", "div", "dl", "dt", "em", "embed", "fieldset", "figcaption", "figure", "footer", "form", "h1", "h2", "h3", "h4", "h5", "h6", "head", "header", "hgroup", "hr", "html", "i", "iframe", "img", "input", "ins", "kbd", "keygen", "label", "legend", "li", "link", "main", "map", "mark", "marquee", "menu", "menuitem", "meta", "meter", "nav", "noscript", "object", "ol", "optgroup", "option", "output", "p", "param", "picture", "pre", "progress", "q", "rp", "rt", "ruby", "s", "samp", "script", "section", "select", "small", "source", "span", "strong", "style", "sub", "summary", "sup", "table", "tbody", "td", "textarea", "tfoot", "th", "thead", "time", "title", "tr", "track", "u", "ul", "var", "video", "wbr", "circle", "clipPath", "defs", "ellipse", "foreignObject", "g", "image", "line", "linearGradient", "mask", "path", "pattern", "polygon", "polyline", "radialGradient", "rect", "stop", "svg", "text", "tspan"].forEach(function(t) {
        ey[t] = ey(t)
    });
    let ev = new Map;

    function eb(t) {
        let {
            styles: r,
            defaultTheme: n = {}
        } = t;
        return (0, eo.jsx)(u.Global, {
            styles: "function" == typeof r ? t => r(null == t || 0 === Object.keys(t).length ? n : t) : r
        })
    }

    function eg(t, r) {
        return ey(t, r)
    }
    let eC = (t, r) => {
            Array.isArray(t.__emotion_styles) && (t.__emotion_styles = r(t.__emotion_styles))
        },
        eS = [];

    function ek(t) {
        return eS[0] = t, (0, f.s)(eS)
    }
    var e_ = Object.freeze({
        __proto__: null,
        GlobalStyles: eb,
        StyledEngineProvider: function(t) {
            let {
                injectFirst: r,
                enableCssLayer: n,
                children: a
            } = t, i = o.useMemo(() => {
                let t = "".concat(r, "-").concat(n);
                if ("object" == typeof document && ev.has(t)) return ev.get(t);
                let a = function(t, r) {
                    let n = ea({
                        key: "css",
                        prepend: t
                    });
                    if (r) {
                        let t = n.insert;
                        n.insert = function() {
                            for (var r = arguments.length, n = Array(r), a = 0; a < r; a++) n[a] = arguments[a];
                            return n[1].styles.match(/^@layer\s+[^{]*$/) || (n[1].styles = "@layer mui {".concat(n[1].styles, "}")), t(...n)
                        }
                    }
                    return n
                }(r, n);
                return ev.set(t, a), a
            }, [r, n]);
            return r || n ? (0, eo.jsx)(c.CacheProvider, {
                value: i,
                children: a
            }) : a
        },
        ThemeContext: l.ThemeContext,
        css: u.css,
        default: eg,
        internal_processStyles: eC,
        internal_serializeStyles: ek,
        keyframes: u.keyframes
    });
    t.s(["G", 0, eb, "a", 0, ek, "b", 0, e_, "i", 0, eC, "s", 0, eg], 511257);
    var ew = t.i(970624),
        eT = Object.freeze({
            __proto__: null,
            default: n.d,
            isPlainObject: n.i
        }),
        eP = Object.freeze({
            __proto__: null,
            default: n.a
        }),
        ex = Object.freeze({
            __proto__: null,
            default: n.c,
            private_createBreakpoints: n.o,
            unstable_applyStyles: n.q
        });
    let eD = ["sx"];

    function eA(t) {
        var r, a, o;
        let s, l, c, {
                sx: u
            } = t,
            {
                systemProps: f,
                otherProps: d
            } = (l = {
                systemProps: {},
                otherProps: {}
            }, c = null != (a = null == (r = (0, n._)(t, eD)) || null == (o = r.theme) ? void 0 : o.unstable_sxConfig) ? a : n.t, Object.keys(r).forEach(t => {
                c[t] ? l.systemProps[t] = r[t] : l.otherProps[t] = r[t]
            }), l);
        return s = Array.isArray(u) ? [f, ...u] : "function" == typeof u ? function() {
            for (var t = arguments.length, r = Array(t), a = 0; a < t; a++) r[a] = arguments[a];
            let o = u(...r);
            return (0, n.i)(o) ? (0, i._)({}, f, o) : f
        } : (0, i._)({}, f, u), (0, i._)({}, d, {
            sx: s
        })
    }
    var eE, eR, eO, eL = Object.freeze({
            __proto__: null,
            default: n.s,
            extendSxProp: eA,
            unstable_createStyleFunctionSx: n.u,
            unstable_defaultSxConfig: n.t
        }),
        ej = {},
        eI = {};
    ({
        get exports() {
            return ej
        },
        set exports(e) {
            ej = e
        }
    }).exports = function() {
        if (eO) return eI;
        eO = 1;
        var t = Symbol.for("react.transitional.element"),
            r = Symbol.for("react.portal"),
            n = Symbol.for("react.fragment"),
            a = Symbol.for("react.strict_mode"),
            o = Symbol.for("react.profiler"),
            i = Symbol.for("react.consumer"),
            s = Symbol.for("react.context"),
            l = Symbol.for("react.forward_ref"),
            c = Symbol.for("react.suspense"),
            u = Symbol.for("react.suspense_list"),
            f = Symbol.for("react.memo"),
            d = Symbol.for("react.lazy"),
            h = Symbol.for("react.view_transition"),
            p = Symbol.for("react.client.reference");

        function m(p) {
            if ("object" == typeof p && null !== p) {
                var m = p.$$typeof;
                switch (m) {
                    case t:
                        switch (p = p.type) {
                            case n:
                            case o:
                            case a:
                            case c:
                            case u:
                            case h:
                                return p;
                            default:
                                switch (p = p && p.$$typeof) {
                                    case s:
                                    case l:
                                    case d:
                                    case f:
                                    case i:
                                        return p;
                                    default:
                                        return m
                                }
                        }
                    case r:
                        return m
                }
            }
        }
        return eI.ContextConsumer = i, eI.ContextProvider = s, eI.Element = t, eI.ForwardRef = l, eI.Fragment = n, eI.Lazy = d, eI.Memo = f, eI.Portal = r, eI.Profiler = o, eI.StrictMode = a, eI.Suspense = c, eI.SuspenseList = u, eI.isContextConsumer = function(t) {
            return m(t) === i
        }, eI.isContextProvider = function(t) {
            return m(t) === s
        }, eI.isElement = function(r) {
            return "object" == typeof r && null !== r && r.$$typeof === t
        }, eI.isForwardRef = function(t) {
            return m(t) === l
        }, eI.isFragment = function(t) {
            return m(t) === n
        }, eI.isLazy = function(t) {
            return m(t) === d
        }, eI.isMemo = function(t) {
            return m(t) === f
        }, eI.isPortal = function(t) {
            return m(t) === r
        }, eI.isProfiler = function(t) {
            return m(t) === o
        }, eI.isStrictMode = function(t) {
            return m(t) === a
        }, eI.isSuspense = function(t) {
            return m(t) === c
        }, eI.isSuspenseList = function(t) {
            return m(t) === u
        }, eI.isValidElementType = function(t) {
            return "string" == typeof t || "function" == typeof t || t === n || t === o || t === a || t === c || t === u || "object" == typeof t && null !== t && (t.$$typeof === d || t.$$typeof === f || t.$$typeof === s || t.$$typeof === i || t.$$typeof === l || t.$$typeof === p || void 0 !== t.getModuleId)
        }, eI.typeOf = m, eI
    }();
    let eM = /^\s*function(?:\s|\s*\/\*.*\*\/\s*)+([^(\s/]*)\s*/;

    function ez(t) {
        let r = "".concat(t).match(eM);
        return r && r[1] || ""
    }

    function eF(t) {
        let r = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : "";
        return t.displayName || t.name || ez(t) || r
    }

    function e$(t, r, n) {
        let a = eF(r);
        return t.displayName || ("" !== a ? "".concat(n, "(").concat(a, ")") : n)
    }

    function eN(t) {
        if (null != t) {
            if ("string" == typeof t) return t;
            if ("function" == typeof t) return eF(t, "Component");
            if ("object" == typeof t) switch (t.$$typeof) {
                case ej.ForwardRef:
                    return e$(t, t.render, "ForwardRef");
                case ej.Memo:
                    return e$(t, t.type, "memo");
                default:
                    return
            }
        }
    }
    var eH, eG, eV = Object.freeze({
            __proto__: null,
            default: eN,
            getFunctionName: ez
        }),
        eU = {},
        eB = {},
        eJ = {},
        eW = (0, a.g)(e_),
        eq = (0, a.g)(eT),
        eK = (0, a.g)(eP),
        eX = (0, a.g)(eV),
        eY = (0, a.g)(ex),
        eQ = (0, a.g)(eL),
        eZ = n.v;
    Object.defineProperty(eU, "__esModule", {
        value: !0
    });
    var e0 = eU.default = function() {
            let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                {
                    themeId: r,
                    defaultTheme: n = ta,
                    rootShouldForwardProp: a = tr,
                    slotShouldForwardProp: o = tr
                } = t,
                i = t => (0, e6.default)((0, e2.default)({}, t, {
                    theme: ti((0, e2.default)({}, t, {
                        defaultTheme: n,
                        themeId: r
                    }))
                }));
            return i.__mui_systemSx = !0,
                function(t) {
                    var s;
                    let l, c = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                    (0, e4.internal_processStyles)(t, t => t.filter(t => !(null != t && t.__mui_systemSx)));
                    let {
                        name: u,
                        slot: f,
                        skipVariantsResolver: d,
                        skipSx: h,
                        overridesResolver: p = (s = to(f)) ? (t, r) => r[s] : null
                    } = c, m = (0, e5.default)(c, te), y = u && u.startsWith("Mui") || f ? "components" : "custom", v = void 0 !== d ? d : f && "Root" !== f && "root" !== f || !1, b = h || !1, g = tr;
                    "Root" === f || "root" === f ? g = a : f ? g = o : "string" == typeof t && t.charCodeAt(0) > 96 && (g = void 0);
                    let C = (0, e4.default)(t, (0, e2.default)({
                            shouldForwardProp: g,
                            label: l
                        }, m)),
                        S = t => "function" == typeof t && t.__emotion_real !== t || (0, e3.isPlainObject)(t) ? a => {
                            let o = ti({
                                theme: a.theme,
                                defaultTheme: n,
                                themeId: r
                            });
                            return ts(t, (0, e2.default)({}, a, {
                                theme: o
                            }), o.modularCssLayers ? y : void 0)
                        } : t,
                        k = function(a) {
                            for (var o = arguments.length, s = Array(o > 1 ? o - 1 : 0), l = 1; l < o; l++) s[l - 1] = arguments[l];
                            let c = S(a),
                                f = s ? s.map(S) : [];
                            u && p && f.push(t => {
                                let a = ti((0, e2.default)({}, t, {
                                    defaultTheme: n,
                                    themeId: r
                                }));
                                if (!a.components || !a.components[u] || !a.components[u].styleOverrides) return null;
                                let o = a.components[u].styleOverrides,
                                    i = {};
                                return Object.entries(o).forEach(r => {
                                    let [n, o] = r;
                                    i[n] = ts(o, (0, e2.default)({}, t, {
                                        theme: a
                                    }), a.modularCssLayers ? "theme" : void 0)
                                }), p(t, i)
                            }), u && !v && f.push(t => {
                                var a;
                                let o = ti((0, e2.default)({}, t, {
                                    defaultTheme: n,
                                    themeId: r
                                }));
                                return ts({
                                    variants: null == o || null == (a = o.components) || null == (a = a[u]) ? void 0 : a.variants
                                }, (0, e2.default)({}, t, {
                                    theme: o
                                }), o.modularCssLayers ? "theme" : void 0)
                            }), b || f.push(i);
                            let d = f.length - s.length;
                            if (Array.isArray(a) && d > 0) {
                                let t = Array(d).fill("");
                                (c = [...a, ...t]).raw = [...a.raw, ...t]
                            }
                            let h = C(c, ...f);
                            return t.muiName && (h.muiName = t.muiName), h
                        };
                    return C.withConfig && (k.withConfig = C.withConfig), k
                }
        },
        e1 = eU.shouldForwardProp = tr;
    eU.systemDefaultTheme = void 0;
    var e2 = eZ((eH || (eH = 1, function(t) {
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
        e5 = eZ((eG || (eG = 1, (r = {
            get exports() {
                return eJ
            },
            set exports(e) {
                eJ = e
            }
        }).exports = function(t, r) {
            if (null == t) return {};
            var n = {};
            for (var a in t)
                if (({}).hasOwnProperty.call(t, a)) {
                    if (-1 !== r.indexOf(a)) continue;
                    n[a] = t[a]
                } return n
        }, r.exports.__esModule = !0, r.exports.default = r.exports), eJ)),
        e4 = function(t) {
            if (t && t.__esModule) return t;
            if (null === t || "object" != typeof t && "function" != typeof t) return {
                default: t
            };
            var r = tt(void 0);
            if (r && r.has(t)) return r.get(t);
            var n = {
                    __proto__: null
                },
                a = Object.defineProperty && Object.getOwnPropertyDescriptor;
            for (var o in t)
                if ("default" !== o && Object.prototype.hasOwnProperty.call(t, o)) {
                    var i = a ? Object.getOwnPropertyDescriptor(t, o) : null;
                    i && (i.get || i.set) ? Object.defineProperty(n, o, i) : n[o] = t[o]
                } return n.default = t, r && r.set(t, n), n
        }(eW),
        e3 = eq,
        e9 = (eZ(eK), eZ(eX), eZ(eY)),
        e6 = eZ(eQ);
    let e8 = ["ownerState"],
        e7 = ["variants"],
        te = ["name", "slot", "skipVariantsResolver", "skipSx", "overridesResolver"];

    function tt(t) {
        if ("function" != typeof WeakMap) return null;
        var r = new WeakMap,
            n = new WeakMap;
        return (tt = function(t) {
            return t ? n : r
        })(t)
    }

    function tr(t) {
        return "ownerState" !== t && "theme" !== t && "sx" !== t && "as" !== t
    }

    function tn(t, r) {
        return r && t && "object" == typeof t && t.styles && !t.styles.startsWith("@layer") && (t.styles = "@layer ".concat(r, "{").concat(String(t.styles), "}")), t
    }
    let ta = eU.systemDefaultTheme = (0, e9.default)(),
        to = t => t ? t.charAt(0).toLowerCase() + t.slice(1) : t;

    function ti(t) {
        let {
            defaultTheme: r,
            theme: n,
            themeId: a
        } = t;
        return 0 === Object.keys(n).length ? r : n[a] || n
    }

    function ts(t, r, n) {
        let {
            ownerState: a
        } = r, o = (0, e5.default)(r, e8), i = "function" == typeof t ? t((0, e2.default)({
            ownerState: a
        }, o)) : t;
        if (Array.isArray(i)) return i.flatMap(t => ts(t, (0, e2.default)({
            ownerState: a
        }, o), n));
        if (i && "object" == typeof i && Array.isArray(i.variants)) {
            let {
                variants: t = []
            } = i, r = (0, e5.default)(i, e7);
            return t.forEach(t => {
                let i = !0;
                if ("function" == typeof t.props ? i = t.props((0, e2.default)({
                        ownerState: a
                    }, o, a)) : Object.keys(t.props).forEach(r => {
                        (null == a ? void 0 : a[r]) !== t.props[r] && o[r] !== t.props[r] && (i = !1)
                    }), i) {
                    Array.isArray(r) || (r = [r]);
                    let i = "function" == typeof t.style ? t.style((0, e2.default)({
                        ownerState: a
                    }, o, a)) : t.style;
                    r.push(n ? tn((0, e4.internal_serializeStyles)(i), n) : i)
                }
            }), r
        }
        return n ? tn((0, e4.internal_serializeStyles)(i), n) : i
    }

    function tl(t) {
        return "ownerState" !== t && "theme" !== t && "sx" !== t && "as" !== t
    }
    var tc = t => tl(t) && "classes" !== t,
        tu = e0({
            themeId: ew.T,
            defaultTheme: ew.d,
            rootShouldForwardProp: tc
        });
    t.s(["a", 0, function(t, r, n) {
        let a = {};
        return Object.keys(t).forEach(o => {
            a[o] = t[o].reduce((t, a) => {
                if (a) {
                    let o = r(a);
                    "" !== o && t.push(o), n && n[a] && t.push(n[a])
                }
                return t
            }, []).join(" ")
        }), a
    }, "b", 0, tl, "c", 0, function() {
        for (var t, r, n = 0, a = "", o = arguments.length; n < o; n++)(t = arguments[n]) && (r = function t(r) {
            var n, a, o = "";
            if ("string" == typeof r || "number" == typeof r) o += r;
            else if ("object" == typeof r)
                if (Array.isArray(r)) {
                    var i = r.length;
                    for (n = 0; n < i; n++) r[n] && (a = t(r[n])) && (o && (o += " "), o += a)
                } else
                    for (a in r) r[a] && (o && (o += " "), o += a);
            return o
        }(t)) && (a && (a += " "), a += r);
        return a
    }, "d", 0, e1, "e", 0, eA, "f", 0, eW, "g", 0, eN, "r", 0, tc, "s", 0, tu], 42569)
}, 865800, t => {
    "use strict";
    var r = function() {
        return (r = Object.assign || function(t) {
            for (var r, n = 1, a = arguments.length; n < a; n++)
                for (var o in r = arguments[n]) Object.prototype.hasOwnProperty.call(r, o) && (t[o] = r[o]);
            return t
        }).apply(this, arguments)
    };
    t.s(["_", () => r, "a", 0, function(t, r) {
        var n = {};
        for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && 0 > r.indexOf(a) && (n[a] = t[a]);
        if (null != t && "function" == typeof Object.getOwnPropertySymbols) {
            var o = 0;
            for (a = Object.getOwnPropertySymbols(t); o < a.length; o++) 0 > r.indexOf(a[o]) && Object.prototype.propertyIsEnumerable.call(t, a[o]) && (n[a[o]] = t[a[o]])
        }
        return n
    }, "b", 0, function(t, r, n) {
        if (n || 2 == arguments.length)
            for (var a, o = 0, i = r.length; o < i; o++) !a && o in r || (a || (a = Array.prototype.slice.call(r, 0, o)), a[o] = r[o]);
        return t.concat(a || Array.prototype.slice.call(r))
    }])
}, 208958, t => {
    "use strict";
    var r = t.i(416340);

    function n(t, r) {
        "function" == typeof t ? t(r) : t && (t.current = r)
    }
    t.s(["s", 0, n, "u", 0, function() {
        for (var t = arguments.length, a = Array(t), o = 0; o < t; o++) a[o] = arguments[o];
        return r.useMemo(() => a.every(t => null == t) ? null : t => {
            a.forEach(r => {
                n(r, t)
            })
        }, a)
    }])
}, 738508, 163482, t => {
    "use strict";
    var r = t.i(416340);
    let n = {},
        a = [];
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
        var t, i;
        let s, l = (i = o.create, (s = r.useRef(n)).current === n && (s.current = i(void 0)), s).current;
        return t = l.disposeEffect, r.useEffect(t, a), l
    }], 163482);
    let i = !0,
        s = !1,
        l = new o,
        c = {
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
        t.metaKey || t.altKey || t.ctrlKey || (i = !0)
    }

    function f() {
        i = !1
    }

    function d() {
        "hidden" === this.visibilityState && s && (i = !0)
    }
    t.s(["u", 0, function() {
        let t = r.useCallback(t => {
                var r;
                null != t && ((r = t.ownerDocument).addEventListener("keydown", u, !0), r.addEventListener("mousedown", f, !0), r.addEventListener("pointerdown", f, !0), r.addEventListener("touchstart", f, !0), r.addEventListener("visibilitychange", d, !0))
            }, []),
            n = r.useRef(!1);
        return {
            isFocusVisibleRef: n,
            onFocus: function(t) {
                return !! function(t) {
                    let {
                        target: r
                    } = t;
                    try {
                        return r.matches(":focus-visible")
                    } catch (t) {}
                    return i || function(t) {
                        let {
                            type: r,
                            tagName: n
                        } = t;
                        return !("INPUT" !== n || !c[r] || t.readOnly) || "TEXTAREA" === n && !t.readOnly || !!t.isContentEditable
                    }(r)
                }(t) && (n.current = !0, !0)
            },
            onBlur: function() {
                return !!n.current && (s = !0, l.start(100, () => {
                    s = !1
                }), n.current = !1, !0)
            },
            ref: t
        }
    }], 738508)
}, 993807, t => {
    "use strict";
    t.s(["default", 0, function(t, r) {
        var n = t || {};
        return r && (n.root = n.root ? "".concat(n.root, " ").concat(r) : r), n
    }])
}, 721281, t => {
    "use strict";
    t.s(["_", 0, function(t, r, n) {
        return r in t ? Object.defineProperty(t, r, {
            value: n,
            enumerable: !0,
            configurable: !0,
            writable: !0
        }) : t[r] = n, t
    }])
}, 689898, (t, r, n) => {
    var a = {
            156: function(t) {
                var r, n, a, o = t.exports = {};

                function i() {
                    throw Error("setTimeout has not been defined")
                }

                function s() {
                    throw Error("clearTimeout has not been defined")
                }
                try {
                    r = "function" == typeof setTimeout ? setTimeout : i
                } catch (t) {
                    r = i
                }
                try {
                    n = "function" == typeof clearTimeout ? clearTimeout : s
                } catch (t) {
                    n = s
                }

                function l(t) {
                    if (r === setTimeout) return setTimeout(t, 0);
                    if ((r === i || !r) && setTimeout) return r = setTimeout, setTimeout(t, 0);
                    try {
                        return r(t, 0)
                    } catch (n) {
                        try {
                            return r.call(null, t, 0)
                        } catch (n) {
                            return r.call(this, t, 0)
                        }
                    }
                }
                var c = [],
                    u = !1,
                    f = -1;

                function d() {
                    u && a && (u = !1, a.length ? c = a.concat(c) : f = -1, c.length && h())
                }

                function h() {
                    if (!u) {
                        var t = l(d);
                        u = !0;
                        for (var r = c.length; r;) {
                            for (a = c, c = []; ++f < r;) a && a[f].run();
                            f = -1, r = c.length
                        }
                        a = null, u = !1,
                            function(t) {
                                if (n === clearTimeout) return clearTimeout(t);
                                if ((n === s || !n) && clearTimeout) return n = clearTimeout, clearTimeout(t);
                                try {
                                    n(t)
                                } catch (r) {
                                    try {
                                        return n.call(null, t)
                                    } catch (r) {
                                        return n.call(this, t)
                                    }
                                }
                            }(t)
                    }
                }

                function p(t, r) {
                    this.fun = t, this.array = r
                }

                function m() {}
                o.nextTick = function(t) {
                    var r = Array(arguments.length - 1);
                    if (arguments.length > 1)
                        for (var n = 1; n < arguments.length; n++) r[n - 1] = arguments[n];
                    c.push(new p(t, r)), 1 !== c.length || u || l(h)
                }, p.prototype.run = function() {
                    this.fun.apply(null, this.array)
                }, o.title = "browser", o.browser = !0, o.env = {}, o.argv = [], o.version = "", o.versions = {}, o.on = m, o.addListener = m, o.once = m, o.off = m, o.removeListener = m, o.removeAllListeners = m, o.emit = m, o.prependListener = m, o.prependOnceListener = m, o.listeners = function(t) {
                    return []
                }, o.binding = function(t) {
                    throw Error("process.binding is not supported")
                }, o.cwd = function() {
                    return "/"
                }, o.chdir = function(t) {
                    throw Error("process.chdir is not supported")
                }, o.umask = function() {
                    return 0
                }
            }
        },
        o = {};

    function i(t) {
        var r = o[t];
        if (void 0 !== r) return r.exports;
        var n = o[t] = {
                exports: {}
            },
            s = !0;
        try {
            a[t](n, n.exports, i), s = !1
        } finally {
            s && delete o[t]
        }
        return n.exports
    }
    i.ab = "/ROOT/node_modules/.pnpm/next@16.3.0_@babel+core@7.29.0_@opentelemetry+api@1.9.1_@playwright+test@1.61.1_@types+_379fb98fecc9fc5f7bce6eca48d1b2a5/node_modules/next/dist/compiled/process/", r.exports = i(156)
}, 2226, (t, r, n) => {
    "use strict";
    var a, o;
    r.exports = (null == (a = t.g.process) ? void 0 : a.env) && "object" == typeof(null == (o = t.g.process) ? void 0 : o.env) ? t.g.process : t.r(689898)
}, 302233, (t, r, n) => {
    "use strict";
    var a = Symbol.for("react.transitional.element");

    function o(t, r, n) {
        var o = null;
        if (void 0 !== n && (o = "" + n), void 0 !== r.key && (o = "" + r.key), "key" in r)
            for (var i in n = {}, r) "key" !== i && (n[i] = r[i]);
        else n = r;
        return {
            $$typeof: a,
            type: t,
            key: o,
            ref: void 0 !== (r = n.ref) ? r : null,
            props: n
        }
    }
    n.Fragment = Symbol.for("react.fragment"), n.jsx = o, n.jsxs = o
}, 221628, (t, r, n) => {
    "use strict";
    r.exports = t.r(302233)
}, 71316, (t, r, n) => {
    "use strict";
    var a = t.i(2226),
        o = Symbol.for("react.transitional.element"),
        i = Symbol.for("react.portal"),
        s = Symbol.for("react.fragment"),
        l = Symbol.for("react.strict_mode"),
        c = Symbol.for("react.profiler"),
        u = Symbol.for("react.consumer"),
        f = Symbol.for("react.context"),
        d = Symbol.for("react.forward_ref"),
        h = Symbol.for("react.suspense"),
        p = Symbol.for("react.memo"),
        m = Symbol.for("react.lazy"),
        y = Symbol.for("react.activity"),
        v = Symbol.iterator,
        b = {
            isMounted: function() {
                return !1
            },
            enqueueForceUpdate: function() {},
            enqueueReplaceState: function() {},
            enqueueSetState: function() {}
        },
        g = Object.assign,
        C = {};

    function S(t, r, n) {
        this.props = t, this.context = r, this.refs = C, this.updater = n || b
    }

    function k() {}

    function _(t, r, n) {
        this.props = t, this.context = r, this.refs = C, this.updater = n || b
    }
    S.prototype.isReactComponent = {}, S.prototype.setState = function(t, r) {
        if ("object" != typeof t && "function" != typeof t && null != t) throw Error("takes an object of state variables to update or a function which returns an object of state variables.");
        this.updater.enqueueSetState(this, t, r, "setState")
    }, S.prototype.forceUpdate = function(t) {
        this.updater.enqueueForceUpdate(this, t, "forceUpdate")
    }, k.prototype = S.prototype;
    var w = _.prototype = new k;
    w.constructor = _, g(w, S.prototype), w.isPureReactComponent = !0;
    var T = Array.isArray;

    function P() {}
    var x = {
            H: null,
            A: null,
            T: null,
            S: null
        },
        D = Object.prototype.hasOwnProperty;

    function A(t, r, n) {
        var a = n.ref;
        return {
            $$typeof: o,
            type: t,
            key: r,
            ref: void 0 !== a ? a : null,
            props: n
        }
    }

    function E(t) {
        return "object" == typeof t && null !== t && t.$$typeof === o
    }
    var R = /\/+/g;

    function O(t, r) {
        var n, a;
        return "object" == typeof t && null !== t && null != t.key ? (n = "" + t.key, a = {
            "=": "=0",
            ":": "=2"
        }, "$" + n.replace(/[=:]/g, function(t) {
            return a[t]
        })) : r.toString(36)
    }

    function L(t, r, n) {
        if (null == t) return t;
        var a = [],
            s = 0;
        return ! function t(r, n, a, s, l) {
            var c, u, f, d = typeof r;
            ("undefined" === d || "boolean" === d) && (r = null);
            var h = !1;
            if (null === r) h = !0;
            else switch (d) {
                case "bigint":
                case "string":
                case "number":
                    h = !0;
                    break;
                case "object":
                    switch (r.$$typeof) {
                        case o:
                        case i:
                            h = !0;
                            break;
                        case m:
                            return t((h = r._init)(r._payload), n, a, s, l)
                    }
            }
            if (h) return l = l(r), h = "" === s ? "." + O(r, 0) : s, T(l) ? (a = "", null != h && (a = h.replace(R, "$&/") + "/"), t(l, n, a, "", function(t) {
                return t
            })) : null != l && (E(l) && (c = l, u = a + (null == l.key || r && r.key === l.key ? "" : ("" + l.key).replace(R, "$&/") + "/") + h, l = A(c.type, u, c.props)), n.push(l)), 1;
            h = 0;
            var p = "" === s ? "." : s + ":";
            if (T(r))
                for (var y = 0; y < r.length; y++) d = p + O(s = r[y], y), h += t(s, n, a, d, l);
            else if ("function" == typeof(y = null === (f = r) || "object" != typeof f ? null : "function" == typeof(f = v && f[v] || f["@@iterator"]) ? f : null))
                for (r = y.call(r), y = 0; !(s = r.next()).done;) d = p + O(s = s.value, y++), h += t(s, n, a, d, l);
            else if ("object" === d) {
                if ("function" == typeof r.then) return t(function(t) {
                    switch (t.status) {
                        case "fulfilled":
                            return t.value;
                        case "rejected":
                            throw t.reason;
                        default:
                            switch ("string" == typeof t.status ? t.then(P, P) : (t.status = "pending", t.then(function(r) {
                                    "pending" === t.status && (t.status = "fulfilled", t.value = r)
                                }, function(r) {
                                    "pending" === t.status && (t.status = "rejected", t.reason = r)
                                })), t.status) {
                                case "fulfilled":
                                    return t.value;
                                case "rejected":
                                    throw t.reason
                            }
                    }
                    throw t
                }(r), n, a, s, l);
                throw Error("Objects are not valid as a React child (found: " + ("[object Object]" === (n = String(r)) ? "object with keys {" + Object.keys(r).join(", ") + "}" : n) + "). If you meant to render a collection of children, use an array instead.")
            }
            return h
        }(t, a, "", "", function(t) {
            return r.call(n, t, s++)
        }), a
    }

    function j(t) {
        if (-1 === t._status) {
            var r = t._result;
            (r = r()).then(function(r) {
                (0 === t._status || -1 === t._status) && (t._status = 1, t._result = r)
            }, function(r) {
                (0 === t._status || -1 === t._status) && (t._status = 2, t._result = r)
            }), -1 === t._status && (t._status = 0, t._result = r)
        }
        if (1 === t._status) return t._result.default;
        throw t._result
    }
    var I = "function" == typeof reportError ? reportError : function(t) {
        if ("object" == typeof window && "function" == typeof window.ErrorEvent) {
            var r = new window.ErrorEvent("error", {
                bubbles: !0,
                cancelable: !0,
                message: "object" == typeof t && null !== t && "string" == typeof t.message ? String(t.message) : String(t),
                error: t
            });
            if (!window.dispatchEvent(r)) return
        } else if ("object" == typeof a.default && "function" == typeof a.default.emit) return void a.default.emit("uncaughtException", t);
        console.error(t)
    };
    n.Activity = y, n.Children = {
        map: L,
        forEach: function(t, r, n) {
            L(t, function() {
                r.apply(this, arguments)
            }, n)
        },
        count: function(t) {
            var r = 0;
            return L(t, function() {
                r++
            }), r
        },
        toArray: function(t) {
            return L(t, function(t) {
                return t
            }) || []
        },
        only: function(t) {
            if (!E(t)) throw Error("React.Children.only expected to receive a single React element child.");
            return t
        }
    }, n.Component = S, n.Fragment = s, n.Profiler = c, n.PureComponent = _, n.StrictMode = l, n.Suspense = h, n.__CLIENT_INTERNALS_DO_NOT_USE_OR_WARN_USERS_THEY_CANNOT_UPGRADE = x, n.__COMPILER_RUNTIME = {
        __proto__: null,
        c: function(t) {
            return x.H.useMemoCache(t)
        }
    }, n.cache = function(t) {
        return function() {
            return t.apply(null, arguments)
        }
    }, n.cacheSignal = function() {
        return null
    }, n.cloneElement = function(t, r, n) {
        if (null == t) throw Error("The argument must be a React element, but you passed " + t + ".");
        var a = g({}, t.props),
            o = t.key;
        if (null != r)
            for (i in void 0 !== r.key && (o = "" + r.key), r) D.call(r, i) && "key" !== i && "__self" !== i && "__source" !== i && ("ref" !== i || void 0 !== r.ref) && (a[i] = r[i]);
        var i = arguments.length - 2;
        if (1 === i) a.children = n;
        else if (1 < i) {
            for (var s = Array(i), l = 0; l < i; l++) s[l] = arguments[l + 2];
            a.children = s
        }
        return A(t.type, o, a)
    }, n.createContext = function(t) {
        return (t = {
            $$typeof: f,
            _currentValue: t,
            _currentValue2: t,
            _threadCount: 0,
            Provider: null,
            Consumer: null
        }).Provider = t, t.Consumer = {
            $$typeof: u,
            _context: t
        }, t
    }, n.createElement = function(t, r, n) {
        var a, o = {},
            i = null;
        if (null != r)
            for (a in void 0 !== r.key && (i = "" + r.key), r) D.call(r, a) && "key" !== a && "__self" !== a && "__source" !== a && (o[a] = r[a]);
        var s = arguments.length - 2;
        if (1 === s) o.children = n;
        else if (1 < s) {
            for (var l = Array(s), c = 0; c < s; c++) l[c] = arguments[c + 2];
            o.children = l
        }
        if (t && t.defaultProps)
            for (a in s = t.defaultProps) void 0 === o[a] && (o[a] = s[a]);
        return A(t, i, o)
    }, n.createRef = function() {
        return {
            current: null
        }
    }, n.forwardRef = function(t) {
        return {
            $$typeof: d,
            render: t
        }
    }, n.isValidElement = E, n.lazy = function(t) {
        return {
            $$typeof: m,
            _payload: {
                _status: -1,
                _result: t
            },
            _init: j
        }
    }, n.memo = function(t, r) {
        return {
            $$typeof: p,
            type: t,
            compare: void 0 === r ? null : r
        }
    }, n.startTransition = function(t) {
        var r = x.T,
            n = {};
        x.T = n;
        try {
            var a = t(),
                o = x.S;
            null !== o && o(n, a), "object" == typeof a && null !== a && "function" == typeof a.then && a.then(P, I)
        } catch (t) {
            I(t)
        } finally {
            null !== r && null !== n.types && (r.types = n.types), x.T = r
        }
    }, n.unstable_useCacheRefresh = function() {
        return x.H.useCacheRefresh()
    }, n.use = function(t) {
        return x.H.use(t)
    }, n.useActionState = function(t, r, n) {
        return x.H.useActionState(t, r, n)
    }, n.useCallback = function(t, r) {
        return x.H.useCallback(t, r)
    }, n.useContext = function(t) {
        return x.H.useContext(t)
    }, n.useDebugValue = function() {}, n.useDeferredValue = function(t, r) {
        return x.H.useDeferredValue(t, r)
    }, n.useEffect = function(t, r) {
        return x.H.useEffect(t, r)
    }, n.useEffectEvent = function(t) {
        return x.H.useEffectEvent(t)
    }, n.useId = function() {
        return x.H.useId()
    }, n.useImperativeHandle = function(t, r, n) {
        return x.H.useImperativeHandle(t, r, n)
    }, n.useInsertionEffect = function(t, r) {
        return x.H.useInsertionEffect(t, r)
    }, n.useLayoutEffect = function(t, r) {
        return x.H.useLayoutEffect(t, r)
    }, n.useMemo = function(t, r) {
        return x.H.useMemo(t, r)
    }, n.useOptimistic = function(t, r) {
        return x.H.useOptimistic(t, r)
    }, n.useReducer = function(t, r, n) {
        return x.H.useReducer(t, r, n)
    }, n.useRef = function(t) {
        return x.H.useRef(t)
    }, n.useState = function(t) {
        return x.H.useState(t)
    }, n.useSyncExternalStore = function(t, r, n) {
        return x.H.useSyncExternalStore(t, r, n)
    }, n.useTransition = function() {
        return x.H.useTransition()
    }, n.version = "19.2.6"
}, 416340, (t, r, n) => {
    "use strict";
    r.exports = t.r(71316)
}, 79187, t => {
    "use strict";
    var r, n, a, o = t.i(721281),
        i = t.i(416340),
        s = ((r = s || {}).English = "en-US", r.Spanish = "es-ES", r.French = "fr-FR", r.German = "de-DE", r.Italian = "it-IT", r.BrazilPortuguese = "pt-BR", r.Korean = "ko-KR", r.SimplifiedChinese = "zh-CN", r.SimplifiedChineseJV = "zh-CJV", r.TraditionalChinese = "zh-TW", r.Japanese = "ja-JP", r.Russian = "ru-RU", r.Indonesian = "id-ID", r.Polish = "pl-PL", r.Vietnamese = "vi-VN", r.Turkish = "tr-TR", r.Arabic = "ar-001", r.Thai = "th-TH", r.Hindi = "hi-IN", r),
        l = ((n = l || {}).English = "en_us", n.Spanish = "es_es", n.French = "fr_fr", n.German = "de_de", n.Italian = "it_it", n.BrazilPortuguese = "pt_br", n.Korean = "ko_kr", n.SimplifiedChinese = "zh_cn", n.SimplifiedChineseJV = "zh_cjv", n.TraditionalChinese = "zh_tw", n.Japanese = "ja_jp", n.Russian = "ru_ru", n.Indonesian = "id_id", n.Polish = "pl_pl", n.Vietnamese = "vi_vn", n.Turkish = "tr_tr", n.Arabic = "ar_001", n.Thai = "th_th", n.Hindi = "hi_in", n),
        c = ((a = c || {}).English = "English", a.Spanish = "Español", a.French = "Français", a.German = "Deutsch", a.Italian = "Italiano", a.BrazilPortuguese = "Português (Brasil)", a.Korean = "한국어", a.SimplifiedChinese = "中文(简体)", a.SimplifiedChineseJV = "中文(简体)", a.TraditionalChinese = "中文(繁體)", a.Japanese = "日本語", a.Russian = "Русский", a.Indonesian = "Bahasa Indonesia", a.Polish = "Polski", a.Vietnamese = "Tiếng Việt", a.Turkish = "Türkçe", a.Arabic = "العربية", a.Thai = "ภาษาไทย", a.Hindi = "हिन्दी", a);
    let u = (0, i.createContext)(void 0);
    u.displayName = " Localization";
    let f = (0, i.createContext)({
        provider: null
    });
    f.displayName = "TranslationProvider";
    let d = (0, i.createContext)({
        resources: null,
        ready: !1
    });

    function h(t, r) {
        return Array.isArray(r) ? r.reduce((r, n, a) => (r[n] = t[a], r), {}) : {
            "": t.reduce((t, r) => Object.assign(t, r), {})
        }
    }
    d.displayName = "Translation";
    let p = /{(.+?)}/,
        m = /{(.+?)}/g,
        y = /({.+?})/g,
        v = t => void 0 !== t ? Object.entries(t).reduce((t, r) => {
            let [n, a] = r;
            return "string" == typeof a ? Object.assign(t.stringArgs, {
                [n]: a
            }) : Object.assign(t.htmlArgs, {
                [n]: a
            }), t
        }, {
            stringArgs: {},
            htmlArgs: {}
        }) : {};

    function b(t, r) {
        return void 0 !== r && 0 !== Object.keys(r).length ? t.replace(m, (t, n) => {
            var a;
            return null != (a = r[n]) ? a : "{".concat(n, "}")
        }) : t
    }

    function g(t, r, n, a, o, s) {
        let l, c = t.split(y);
        if (1 === c.length) return t;
        if (c = c.filter(t => !!t), void 0 !== s && 0 !== Object.keys(s).length) {
            let t = c.reduce((t, r, n) => {
                if ("string" != typeof r) return t;
                let a = p.exec(r);
                if (a) {
                    let r = a[1];
                    if (Object.hasOwn(s, r)) {
                        let a = t[r];
                        if (!a) return Object.assign(t, {
                            [r]: [n]
                        });
                        a.push(n)
                    }
                }
                return t
            }, {});
            Object.entries(s).forEach(r => {
                let [n, a] = r;
                if (Object.hasOwn(t, n))
                    for (let r of t[n]) c[r] = a
            })
        }
        if (!Array.isArray(o) || 0 === o.length) return (0, i.createElement)(i.Fragment, null, ...c);
        let u = o.reduce((t, r) => {
                let {
                    opening: n,
                    closing: a,
                    content: o
                } = r;
                return Object.assign(t, {
                    ["{".concat(n, "}")]: {
                        match: "{".concat(a, "}"),
                        content: o
                    }
                })
            }, {}),
            f = [],
            d = [],
            h = [];
        for (; l = c.shift();)
            if ("string" == typeof l && p.test(l))
                if (Object.hasOwn(u, l)) d.push(l), h.push(l);
                else {
                    let t = d.pop();
                    if (void 0 !== t) {
                        let {
                            match: o,
                            content: s
                        } = u[t];
                        if (l === o) {
                            let o, l = [];
                            for (; o = h.pop();)
                                if (o !== t) l.unshift(o);
                                else {
                                    let t = null;
                                    t = s(l.every(t => "string" == typeof t) ? l : (0, i.createElement)(i.Fragment, null, ...l)), 0 === h.length ? f.push(t) : h.push(t);
                                    break
                                } if (void 0 === o) {
                                console.warn("[From context - ".concat(n, "] Unexpected condition encountered inside translateHTML for key ").concat(r, " of locale ").concat(a, "!"));
                                break
                            }
                        } else {
                            console.warn("[From context - ".concat(n, "] Unmatched closing tag ").concat(l, " encountered inside translateHTML for key ").concat(r, " of locale ").concat(a, "!"));
                            break
                        }
                    } else {
                        console.warn("[From context - ".concat(n, "] Unexpected condition encountered inside translateHTML for key ").concat(r, " of locale ").concat(a, "!"));
                        break
                    }
                }
        else 0 === h.length ? f.push(l) : h.push(l);
        return (0, i.createElement)(i.Fragment, null, ...f)
    }

    function C() {
        let t = (0, i.useContext)(u),
            {
                key: r = "Unknown",
                resources: n,
                ready: a
            } = (0, i.useContext)(d),
            o = (0, i.useCallback)((a, o) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: i
                } = t;
                if (null !== n) {
                    let t;
                    for (let r of Object.values(n)) Object.hasOwn(r, a) && (t = r[a]);
                    if (void 0 !== t) {
                        if (null != t) return b(t, o);
                        console.warn("[From context - ".concat(r, "] The translation of key '").concat(a, "' for locale '").concat(i.locale, "' does not exist!"))
                    } else console.warn("[From context - ".concat(r, "] The translation key '").concat(a, "' doesn't exist for locale '").concat(i.locale, "'!"))
                }
                return ""
            }, [t, r, n]),
            s = (0, i.useCallback)((a, o, i) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: s
                } = t;
                if (null !== n) {
                    let t = n[a];
                    if (void 0 !== t && Object.hasOwn(t, o)) {
                        let n = t[o];
                        if (null != n) return b(n, i);
                        console.warn("[From context - ".concat(r, "] The translation of key '").concat(a, "::").concat(o, "' for locale '").concat(s.locale, "' does not exist!"))
                    } else console.warn("[From context - ".concat(r, "] The translation key '").concat(a, "::").concat(o, "' doesn't exist for locale '").concat(s.locale, "'!"))
                }
                return ""
            }, [t, r, n]),
            l = (0, i.useCallback)((n, a, i) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: s
                } = t;
                if (void 0 === a && void 0 === i) return o(n);
                let {
                    stringArgs: l,
                    htmlArgs: c
                } = v(i), u = o(n, l);
                return u ? g(u, n, r, s.locale, a, c) : u
            }, [t, r, o]),
            c = (0, i.useCallback)((n, a, o, i) => {
                if (void 0 === t) return console.warn("Localization context is missing, useTranslation cannot work outside of the LocalizationProvider"), "";
                let {
                    localeInfo: l
                } = t;
                if (void 0 === o && void 0 === i) return s(n, a);
                let {
                    stringArgs: c,
                    htmlArgs: u
                } = v(i), f = s(n, a, c);
                return f ? g(f, a, r, l.locale, o, u) : f
            }, [t, r, s]);
        return (0, i.useMemo)(() => ({
            ready: a,
            translate: o,
            translateWithNamespace: s,
            translateHTML: l,
            translateWithNamespaceHTML: c
        }), [a, o, s, l, c])
    }
    let S = t => {
            let {
                namespace: r,
                translationKey: n,
                args: a,
                fallback: o = null
            } = t, {
                translateWithNamespace: i,
                ready: s
            } = C();
            return s && i(r, n, a) || o
        },
        k = {
            [s.English]: l.English,
            [s.Spanish]: l.Spanish,
            [s.French]: l.French,
            [s.German]: l.German,
            [s.Italian]: l.Italian,
            [s.BrazilPortuguese]: l.BrazilPortuguese,
            [s.Korean]: l.Korean,
            [s.SimplifiedChinese]: l.SimplifiedChinese,
            [s.SimplifiedChineseJV]: l.SimplifiedChineseJV,
            [s.TraditionalChinese]: l.TraditionalChinese,
            [s.Japanese]: l.Japanese,
            [s.Russian]: l.Russian,
            [s.Indonesian]: l.Indonesian,
            [s.Polish]: l.Polish,
            [s.Vietnamese]: l.Vietnamese,
            [s.Turkish]: l.Turkish,
            [s.Arabic]: l.Arabic,
            [s.Thai]: l.Thai,
            [s.Hindi]: l.Hindi
        },
        _ = (l.English, s.English, l.Spanish, s.Spanish, l.French, s.French, l.German, s.German, l.Italian, s.Italian, l.BrazilPortuguese, s.BrazilPortuguese, l.Korean, s.Korean, l.SimplifiedChinese, s.SimplifiedChinese, l.SimplifiedChineseJV, s.SimplifiedChineseJV, l.TraditionalChinese, s.TraditionalChinese, l.Japanese, s.Japanese, l.Russian, s.Russian, l.Indonesian, s.Indonesian, l.Polish, s.Polish, l.Vietnamese, s.Vietnamese, l.Turkish, s.Turkish, l.Arabic, s.Arabic, l.Thai, s.Thai, l.Hindi, s.Hindi, {
            [s.English]: c.English,
            [s.Spanish]: c.Spanish,
            [s.French]: c.French,
            [s.German]: c.German,
            [s.Italian]: c.Italian,
            [s.BrazilPortuguese]: c.BrazilPortuguese,
            [s.Korean]: c.Korean,
            [s.SimplifiedChinese]: c.SimplifiedChinese,
            [s.SimplifiedChineseJV]: c.SimplifiedChineseJV,
            [s.TraditionalChinese]: c.TraditionalChinese,
            [s.Japanese]: c.Japanese,
            [s.Russian]: c.Russian,
            [s.Indonesian]: c.Indonesian,
            [s.Polish]: c.Polish,
            [s.Vietnamese]: c.Vietnamese,
            [s.Turkish]: c.Turkish,
            [s.Arabic]: c.Arabic,
            [s.Thai]: c.Thai,
            [s.Hindi]: c.Hindi
        }),
        w = (l.English, c.English, l.Spanish, c.Spanish, l.French, c.French, l.German, c.German, l.Italian, c.Italian, l.BrazilPortuguese, c.BrazilPortuguese, l.Korean, c.Korean, l.SimplifiedChinese, c.SimplifiedChinese, l.SimplifiedChineseJV, c.SimplifiedChineseJV, l.TraditionalChinese, c.TraditionalChinese, l.Japanese, c.Japanese, l.Russian, c.Russian, l.Indonesian, c.Indonesian, l.Polish, c.Polish, l.Vietnamese, c.Vietnamese, l.Turkish, c.Turkish, l.Arabic, c.Arabic, l.Thai, c.Thai, l.Hindi, c.Hindi, /^(\w+)_(\w+)$/),
        T = /^(\w+)-(\w+)$/;
    t.s(["Locale", 0, s, "LocalizationProvider", 0, t => {
        let {
            provider: r,
            children: n
        } = t, [a, o] = (0, i.useState)(!1), [s, l] = (0, i.useState)(r.defaultLocaleInfo), c = (0, i.useMemo)(() => ({
            ready: a,
            localeInfo: s,
            setLocaleInfo: l
        }), [a, s]), d = (0, i.useMemo)(() => ({
            provider: r
        }), [r]);
        return (0, i.useEffect)(() => {
            !async function() {
                try {
                    let {
                        locale: t,
                        nativeName: n
                    } = await r.loadRuntimeLocaleInfo();
                    l({
                        locale: t,
                        nativeName: n
                    })
                } catch (t) {
                    console.warn("Failed to load runtime locale info, fallback to default locale info")
                } finally {
                    o(!0)
                }
            }()
        }, [r]), i.default.createElement(u.Provider, {
            value: c
        }, i.default.createElement(f.Provider, {
            value: d
        }, n))
    }, "NativeName", 0, c, "Translate", 0, function(t) {
        let {
            namespace: r,
            translationKey: n,
            args: a,
            fallback: o
        } = t, {
            provider: s
        } = (0, i.useContext)(f), l = (0, i.useContext)(u), [c, p] = (0, i.useState)(null);
        (0, i.useEffect)(() => {
            if (null === s || !(null == l ? void 0 : l.ready)) return;
            let {
                localeInfo: {
                    locale: t
                }
            } = l;
            s.loadTranslationResources([r], t).then(t => {
                p(h(t, [r]))
            })
        }, [l, s, r]);
        let m = (0, i.useMemo)(() => ({
            key: "Translate-".concat(r),
            resources: c,
            ready: null !== c
        }), [r, c]);
        return null === s ? i.default.createElement(S, {
            namespace: r,
            translationKey: n,
            args: a,
            fallback: o
        }) : i.default.createElement(d.Provider, {
            value: m
        }, i.default.createElement(S, {
            namespace: r,
            translationKey: n,
            args: a,
            fallback: o
        }))
    }, "TranslationResourceProviderBase", 0, class {
        loadTranslationResources(t, r) {
            return Promise.all(t.map(async t => {
                try {
                    return await this.loadTranslationResource(t, r)
                } catch (n) {
                    return console.warn("Failed to retrieve namespace ".concat(t, " for locale ").concat(r)), {}
                }
            }))
        }
        getTranslationResources(t, r) {
            return t.every(t => void 0 !== this.tryGetTranslationResourceFromCache(t, r)) ? t.map(t => {
                var n;
                return null != (n = this.tryGetTranslationResourceFromCache(t, r)) ? n : {}
            }) : null
        }
        async loadTranslationResource(t, r) {
            let n = this.tryGetTranslationResourceFromCache(t, r);
            if (n) return n;
            let a = "".concat(r, "-").concat(t);
            if (Object.hasOwn(this.translationResourceRequestCache, a)) return this.translationResourceRequestCache[a];
            let o = {};
            try {
                let n = this.fetchTranslationResourceWithFallback(t, r);
                this.translationResourceRequestCache[a] = n, o = await n, null == this.translationResourceCache[r] && (this.translationResourceCache[r] = {}), this.translationResourceCache[r][t] = o
            } catch (n) {
                console.warn("Failed to retrieve translation resources of ".concat(t, " for ").concat(r))
            } finally {
                delete this.translationResourceRequestCache[a]
            }
            return o
        }
        tryGetTranslationResourceFromCache(t, r) {
            var n;
            return null == (n = this.translationResourceCache[r]) ? void 0 : n[t]
        }
        async fetchTranslationResourceWithFallback(t, r) {
            let n = {};
            try {
                n = await this.fetchTranslationResource(t, r)
            } catch (n) {
                console.warn("Failed to retrieve translation resources of ".concat(t, " for ").concat(r))
            }
            if (r !== this.fallbackLocale && (Object.values(n).some(t => null == t) || 0 === Object.keys(n).length)) try {
                let r = await this.loadTranslationResource(t, this.fallbackLocale);
                return Object.keys({
                    ...r,
                    ...n
                }).reduce((t, a) => {
                    var o;
                    return Object.assign(t, {
                        [a]: null != (o = n[a]) ? o : r[a]
                    }), t
                }, {})
            } catch (t) {}
            return n
        }
        constructor(t, r = t.locale) {
            (0, o._)(this, "defaultLocaleInfo", void 0), (0, o._)(this, "fallbackLocale", void 0), (0, o._)(this, "translationResourceCache", void 0), (0, o._)(this, "translationResourceRequestCache", void 0), this.defaultLocaleInfo = t, this.fallbackLocale = r, this.translationResourceCache = {}, this.translationResourceRequestCache = {}
        }
    }, "toLocaleCode", 0, t => t.replace(w, (t, r, n) => "".concat(r.toLowerCase(), "-").concat(n.toUpperCase())), "toLocaleNativeName", 0, t => _[t], "toRobloxLocale", 0, t => k[t], "toRobloxLocaleCode", 0, t => t.replace(T, (t, r, n) => "".concat(r.toLowerCase(), "_").concat(n.toLowerCase())), "useLocalization", 0, function() {
        let t = (0, i.useContext)(u),
            r = (0, i.useMemo)(() => {
                if (void 0 !== t) {
                    let {
                        localeInfo: {
                            locale: r,
                            nativeName: n
                        },
                        setLocaleInfo: a
                    } = t;
                    return {
                        locale: r,
                        nativeName: n,
                        setLocaleInfo: a
                    }
                }
                return {
                    locale: null,
                    nativeName: null,
                    setLocaleInfo: t => {}
                }
            }, [t]);
        return void 0 === t && console.warn("Localization context is missing, useLocalization cannot work outside of the LocalizationProvider"), r
    }, "useTranslation", 0, C, "useTranslationWithNamespace", 0, function(t) {
        let {
            ready: r,
            translateWithNamespace: n,
            translateWithNamespaceHTML: a
        } = C(), o = (0, i.useCallback)((r, a) => n(t, r, a), [t, n]), s = (0, i.useCallback)((r, n, o) => a(t, r, n, o), [t, a]);
        return (0, i.useMemo)(() => ({
            ready: r,
            translate: o,
            translateHTML: s
        }), [r, o, s])
    }, "withTranslation", 0, function(t, r) {
        var n, a;
        let o = null != (n = null != (a = t.displayName) ? a : t.name) ? n : "Component",
            s = n => {
                let a = (0, i.useContext)(u),
                    {
                        provider: s
                    } = (0, i.useContext)(f),
                    [l, c] = (0, i.useState)(() => {
                        let t = null;
                        if ((null == a ? void 0 : a.ready) && null !== s) {
                            let {
                                localeInfo: {
                                    locale: n
                                }
                            } = a, o = s.getTranslationResources(r, n);
                            null !== o && (t = h(o, r))
                        } else void 0 === a && console.warn("Localization context is missing, withTranslation cannot work outside of the LocalizationProvider"), null === s && console.warn("TranslationResourceProvider context is missing, withTranslation cannot work outside of the TranslationResourceProvider");
                        return t
                    }),
                    p = (0, i.useMemo)(() => ({
                        key: o,
                        resources: l,
                        ready: null !== l
                    }), [l]);
                return (0, i.useEffect)(() => {
                    if ((null == a ? void 0 : a.ready) && null !== s) {
                        let {
                            localeInfo: {
                                locale: t
                            }
                        } = a;
                        s.loadTranslationResources(r, t).then(t => {
                            c(h(t, r))
                        })
                    }
                }, [a, s]), i.default.createElement(d.Provider, {
                    value: p
                }, i.default.createElement(t, n))
            };
        return s.displayName = "WithTranslation(".concat(o, ")"), s
    }])
}]);

//# debugId=21cccfb8-760b-20e6-0dac-c0a3ba4ba6cc
//# sourceMappingURL=2x4jps4hkzyr4.js.map