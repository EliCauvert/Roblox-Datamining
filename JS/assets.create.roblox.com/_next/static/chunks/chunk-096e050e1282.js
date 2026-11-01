;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "59f93ce4-42da-9c9d-3671-bb30d040dfa6")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let a = /{(.+?)}/g,
        r = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(a, (e, a) => {
            var r;
            return null != (r = t[a]) ? r : "{".concat(a, "}")
        });
    e.s(["default", 0, r], 884213);
    let s = /{(.+?)}/,
        n = /({.+?})/g,
        o = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        i = /(?:^|\.)robloxlabs\.com$/,
        l = () => {
            let e, t = o.test(window.location.hostname),
                a = window.location.hostname.includes("localhost"),
                r = "string" == typeof(e = window.location.hostname) && i.test(e);
            return {
                isSSR: !1,
                isAllowed: t || a || r,
                isDangerous: t || r,
                preferLoadedTranslations: r
            }
        },
        c = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var d = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: a,
            translate: o,
            translateHTML: i,
            translateWithNamespace: u,
            translateWithNamespaceHTML: f
        } = e, g = (0, t.useMemo)(() => ({
            ready: a,
            translate: o,
            translateHTML: i,
            translateWithNamespace: u,
            translateWithNamespaceHTML: f
        }), [a, o, i, u, f]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: g.ready,
                translate: (0, d.translationFn)(g),
                translateHTML: (0, d.translateHTMLFn)(g),
                translateWithNamespace: g.translateWithNamespace,
                translateWithNamespaceHTML: g.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: a
                    } = e;
                    return (e, s, n, o) => {
                        let i = l();
                        if (!i.isAllowed) return a(n, o);
                        if (i.preferLoadedTranslations && t) {
                            let e = a(n, o);
                            if (e.length > 0) return e
                        }
                        return r(i.preferLoadedTranslations && !t ? e : c(e, i), o)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: o
                    } = e;
                    return (e, i, d, u, f) => {
                        let g = l();
                        if (!g.isAllowed) return o(d, u, f);
                        if (g.preferLoadedTranslations && a) {
                            let e = o(d, u, f);
                            if ("" !== e) return e
                        }
                        return ((e, a, o) => {
                            let i, l;
                            if (void 0 === a && void 0 === o) return e;
                            let {
                                stringArgs: c,
                                htmlArgs: d
                            } = (i = {}, l = {}, void 0 === o || Object.entries(o).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? i[t] = a : l[t] = a
                            }), {
                                stringArgs: i,
                                htmlArgs: l
                            }), u = r(e, c), f = u.split(n).filter(e => !!e);
                            if (1 === f.length) return u;
                            let g = [...f];
                            if (0 !== Object.keys(d).length) {
                                let e = f.reduce((e, t, a) => {
                                    let r = s.exec(t);
                                    if (r) {
                                        let t = r[1];
                                        if (Object.hasOwn(d, t)) {
                                            let r = e[t];
                                            if (!r) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            r.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(d).forEach(t => {
                                    let [a, r] = t, s = e[a];
                                    s && s.forEach(e => {
                                        g[e] = r
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...g);
                            let m = a.reduce((e, t) => {
                                    let {
                                        opening: a,
                                        closing: r,
                                        content: s
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(a, "}")]: {
                                            match: "{".concat(r, "}"),
                                            content: s
                                        }
                                    })
                                }, {}),
                                p = [],
                                b = [],
                                h = [];
                            for (let e = g.shift(); void 0 !== e; e = g.shift())
                                if ("string" == typeof e && s.test(e))
                                    if (Object.hasOwn(m, e)) b.push(e), h.push(e);
                                    else {
                                        let a = b.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: r,
                                                content: s
                                            } = m[a];
                                            if (e !== r) break;
                                            let n = [],
                                                o = !1;
                                            for (; h.length > 0 && !o;) {
                                                let e = h.pop();
                                                e === a ? o = !0 : n.unshift(e)
                                            }
                                            let i = s(n.every(e => "string" == typeof e) ? n : (0, t.createElement)(t.Fragment, null, ...n));
                                            0 === h.length ? p.push(i) : h.push(i)
                                        }
                                    }
                            else 0 === h.length ? p.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...p)
                        })(g.preferLoadedTranslations && !a ? e : c(e, g), u, f)
                    }
                })(e)
            }
        }, [g])
    }], 401263)
}, 29929, e => {
    "use strict";
    var t, a, r, s, n, o, i, l, c, d, u, f, g, m, p, b, h, v = e.i(650502),
        x = e.i(864392),
        y = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        _ = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        k = ((r = {}).EnableIPRecommender = "enableIPRecommender", r.EnableContentBadges = "enableContentBadges", r),
        C = ((s = C || {}).EnableVideoOnboarding = "enableVideoOnboarding", s),
        w = ((n = w || {}).EnableSignalLookup = "enableSignalLookup", n.AlwaysShow = "alwaysShow", n),
        E = E || {},
        S = ((o = S || {}).mobileVariant = "mobileVariant", o),
        q = q || {},
        P = ((i = {}).ShowEditInStudioButton = "showEditInStudioButton", i.EnableCreationsNavLayout = "enableCreationsIPNavLayout", i),
        A = ((l = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", l),
        T = ((c = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", c.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", c.EnableAudienceControls = "enableAudienceControls", c.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", c.EnableAudiencesReplacement = "enableAudiencesReplacement", c),
        U = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        H = ((u = H || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", u),
        I = ((f = I || {}).GameAppealsEnabled = "gameAppealsEnabled", f),
        j = ((g = j || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", g),
        R = ((m = R || {}).EnableChangelogCMS = "enableChangelogCMS", m),
        L = ((p = {}).CreatorDashboard = "CreatorDashboard", p.CreatorHubHomePage = "CreatorHub.HomePage.UserId", p.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", p.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", p.CreatorHubLandingPage = "CreatorHub.LandingPage", p.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", p.CreatorHubNavigation = "CreatorHub.Navigation", p.CreatorHubNavigationUser = "CreatorHub.Navigation.User", p.CreatorHubPublishing = "CreatorHub.Publishing.UserId", p.LicenseManager = "CreatorDashboard.LicenseManager", p.RightsManager = "CreatorDashboard.RightsManager", p.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", p.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", p.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", p.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", p.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", p.CreatorHubChangelog = "CreatorHub.Changelog", p.TalentHub = "CreatorHub.TalentHub.UserId", p),
        O = ((b = O || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", b.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", b.ShowSecrets = "showSecrets", b.ShowQualitySignalCards = "showQualitySignalCards", b);
    let G = {
        CreatorDashboard: y,
        "CreatorHub.HomePage.UserId": C,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": w,
        "CreatorHub.LandingPage": E,
        "CreatorHub.LandingPage.UserId": S,
        "CreatorHub.Navigation": q,
        "CreatorHub.Navigation.User": P,
        "CreatorHub.Publishing.UserId": A,
        "CreatorDashboard.LicenseManager": k,
        "CreatorDashboard.RightsManager": _,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((h = {}).SearchVersion = "searchVersion", h),
        "CreatorHub.Creations.Permission": T,
        "CreatorHub.ExperienceWebhooks.UserId": H,
        "CreatorHub.GameAppeals.UserId": I,
        "CreatorHub.HomePage.ExperienceTile.UserId": j,
        "CreatorHub.Changelog": R,
        "CreatorHub.TalentHub.UserId": U
    };
    async function F(e) {
        let t = (0, v.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(G[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let M = (0, x.default)(F);
    e.s(["CreatorHubCreationsPermissionParameters", () => T, "CreatorHubPublishingParameters", () => A, "IXPLayers", () => L, "LicenseManagerParameters", () => k, "TalentHubParameters", () => U, "fetchIXPParametersForCurrentUser", 0, M])
}, 864392, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        let t = new Map;
        return a => {
            if (t.has(a)) return t.get(a);
            let r = e(a);
            return t.set(a, r), r
        }
    }])
}, 493924, 938429, 321623, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(611043),
        r = e.i(695763),
        s = e.i(776344),
        n = e.i(462863),
        o = e.i(343885),
        i = e.i(609794),
        l = e.i(57561),
        c = e.i(509747),
        d = e.i(475555),
        u = e.i(538302),
        f = e.i(387707),
        g = e.i(262135),
        m = e.i(240731),
        p = e.i(956923),
        b = e.i(84362),
        h = e.i(214665),
        v = e.i(455506),
        x = e.i(918290),
        y = e.i(716933),
        _ = e.i(347319),
        k = e.i(543657),
        C = e.i(850412),
        w = e.i(103329),
        E = e.i(692706),
        S = e.i(405654),
        q = e.i(891409),
        P = e.i(758060),
        A = e.i(710005),
        T = e.i(495550),
        U = e.i(320429),
        H = e.i(106017),
        I = e.i(821978),
        j = e.i(766389),
        R = e.i(374717),
        L = e.i(756733),
        O = e.i(251697),
        G = e.i(411118),
        F = e.i(839596),
        M = e.i(729733),
        D = e.i(66217),
        N = e.i(148865),
        z = e.i(45512),
        V = e.i(706478),
        B = e.i(166181),
        Q = e.i(37474),
        W = e.i(147189),
        K = e.i(105897),
        X = e.i(123524),
        J = e.i(752739),
        Z = e.i(331105),
        $ = e.i(564908),
        Y = e.i(663412),
        ee = e.i(215887),
        et = e.i(962803),
        ea = e.i(914865),
        er = e.i(818392),
        es = e.i(173034),
        en = e.i(780078),
        eo = e.i(756885),
        ei = e.i(260123),
        el = e.i(507792),
        ec = e.i(850994);
    let ed = {
        secrets: {
            light: R.default,
            dark: j.default
        },
        noPermissions: {
            light: R.default,
            dark: j.default
        },
        notifications: {
            light: W.default,
            dark: Q.default
        },
        experiences: {
            light: el.default,
            dark: ei.default
        },
        shareLinks: {
            light: et.default,
            dark: ee.default
        },
        eventsAndUpdates: {
            light: C.default,
            dark: k.default
        },
        avatarItem: {
            light: u.default,
            dark: d.default
        },
        models: {
            light: z.default,
            dark: N.default
        },
        plugins: {
            light: B.default,
            dark: V.default
        },
        audio: {
            light: c.default,
            dark: l.default
        },
        decals: {
            light: x.default,
            dark: v.default
        },
        images: {
            light: q.default,
            dark: S.default
        },
        videos: {
            light: ec.default,
            dark: eo.default
        },
        meshes: {
            light: D.default,
            dark: M.default
        },
        animations: {
            light: Y.default,
            dark: $.default
        },
        textDocuments: {
            light: _.default,
            dark: y.default
        },
        noUsers: {
            light: h.default,
            dark: b.default
        },
        localization: {
            light: I.default,
            dark: H.default
        },
        rightsManager: {
            light: Z.default,
            dark: J.default
        },
        tokens: {
            light: en.default,
            dark: es.default
        },
        chart: {
            light: U.default,
            dark: T.default
        },
        badge: {
            light: g.default,
            dark: f.default
        },
        apiKeys: {
            light: i.default,
            dark: o.default
        },
        signin: {
            light: er.default,
            dark: ea.default
        },
        oAuthApps: {
            light: X.default,
            dark: K.default
        },
        makeupLooks: {
            light: O.default,
            dark: L.default
        },
        barGraph: {
            light: p.default,
            dark: m.default
        },
        leaderboard: {
            light: A.default,
            dark: P.default
        },
        findPeople: {
            light: E.default,
            dark: w.default
        },
        managedPricing: {
            light: F.default,
            dark: G.default
        }
    };
    e.s(["default", 0, ed], 938429);
    let eu = "".concat("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/assets", "/spot_illustrations"),
        ef = {
            small: {
                analytics: "".concat(eu, "/small/analytics.svg"),
                animations: "".concat(eu, "/small/animations.svg"),
                audio: "".concat(eu, "/small/audio.svg"),
                audioLight: "".concat(eu, "/small/audio_light.svg"),
                audioDark: "".concat(eu, "/small/audio_dark.svg"),
                avatarItem: "".concat(eu, "/small/avatar_item.svg"),
                beginSearch: "".concat(eu, "/small/beginSearch.svg"),
                creatorStore: "".concat(eu, "/small/creator_store.svg"),
                decals: "".concat(eu, "/small/decals.svg"),
                events: "".concat(eu, "/small/events.svg"),
                experiences: "".concat(eu, "/small/experiences.svg"),
                images: "".concat(eu, "/small/images.svg"),
                meshes: "".concat(eu, "/small/meshes.svg"),
                models: "".concat(eu, "/small/models.svg"),
                plugins: "".concat(eu, "/small/plugins.svg"),
                script: "".concat(eu, "/small/script.svg"),
                song: "".concat(eu, "/small/song.svg"),
                musicNote: "".concat(eu, "/small/audio_music_note.svg"),
                noUsers: "".concat(eu, "/small/no_users.svg"),
                user: "".concat(eu, "/small/user.svg"),
                users: "".concat(eu, "/small/users.svg"),
                videos: "".concat(eu, "/small/videos.svg"),
                search: "".concat(eu, "/small/search.svg"),
                oof: "".concat(eu, "/small/oof.svg"),
                download: "".concat(eu, "/small/download.svg"),
                attributes: "".concat(eu, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(eu, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(eu, "/large/api_keys.svg"),
                localization: "".concat(eu, "/large/localization.svg"),
                noPermissions: "".concat(eu, "/large/no_permissions.svg"),
                oAuthApps: "".concat(eu, "/large/oauth_apps.svg"),
                rights: "".concat(eu, "/large/rights.svg"),
                secrets: "".concat(eu, "/large/secrets.svg"),
                shareLinks: "".concat(eu, "/large/share_links.svg"),
                configurations: "".concat(eu, "/large/configurations.svg"),
                experienceConfigs: "".concat(eu, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(eu, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, ef], 321623);
    let eg = (0, r.makeStyles)()(() => ({
            smallContainer: {
                margin: "48px 0",
                padding: "0 24px",
                width: "100%"
            },
            largeContainer: {
                margin: "100px 0",
                width: "100%"
            },
            smallText: {
                gap: 6,
                maxWidth: 510,
                marginBottom: 16
            },
            largeText: {
                gap: 6,
                maxWidth: 480,
                marginBottom: 24
            }
        })),
        em = e => {
            let {
                illustration: a,
                size: r = "large"
            } = e, s = a && ed[a];
            if (s) return (0, t.jsx)(n.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let o = a ? ef[r][a] : null;
            return o && (0, t.jsx)("img", {
                height: "large" === r ? 240 : 96,
                width: "large" === r ? 320 : 96,
                src: o,
                alt: a
            })
        },
        ep = e => {
            let {
                children: r,
                title: n,
                description: o,
                size: i = "large",
                illustration: l
            } = e, {
                classes: {
                    smallContainer: c,
                    largeContainer: d,
                    smallText: u,
                    largeText: f
                },
                cx: g
            } = eg();
            return (0, t.jsxs)(s.default, {
                classes: {
                    root: g({
                        [c]: "small" === i,
                        [d]: "large" === i
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(em, {
                    illustration: l,
                    size: i
                }), (0, t.jsxs)(s.default, {
                    classes: {
                        root: g({
                            [u]: "small" === i,
                            [f]: "large" === i
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: n
                    }), o && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: o
                    })]
                }), r]
            })
        };
    ep.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, em, "default", 0, ep], 493924)
}, 60373, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(29929);
    let r = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                let a = window.localStorage.getItem(e);
                return a ? JSON.parse(a) : t
            } catch (e) {
                return t
            }
        },
        s = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                window.localStorage.setItem(e, JSON.stringify(t))
            } catch (e) {
                console.warn("Unable to write to local storage", e)
            }
        };
    e.s(["default", 0, function(e, n) {
        var o;
        let i = null != (o = null == n ? void 0 : n.cacheOnly) && o,
            [l, c] = (0, t.useState)(() => i ? {
                params: r(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == n ? void 0 : n.restoreInitialValueFromCache) ? r(e) : {},
                status: "initial",
                isFetched: !1
            });
        return (0, t.useEffect)(() => {
            i || (async () => {
                let t = {};
                try {
                    c(e => ({
                        ...e,
                        status: "loading"
                    })), t = await (0, a.fetchIXPParametersForCurrentUser)(e), c({
                        params: t,
                        isFetched: !0,
                        status: "success"
                    }), s(e, t)
                } catch (e) {
                    c(e => ({
                        ...e,
                        isFetched: !0,
                        status: "error"
                    }))
                }
            })()
        }, []), l
    }])
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624);
    e.s(["default", 0, (e, r) => {
        let s = (0, a.useRouter)(),
            n = s.query;
        return [(0, t.useMemo)(() => {
            let t = null != n ? n : {},
                a = {};
            for (let r of e) a[r] = t[r];
            return a
        }, [e, n]), (0, t.useCallback)(function(t) {
            var a;
            let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                o = null != (a = s.query) ? a : {},
                i = {
                    ...o
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let a = t[e];
                null == a ? delete i[e] : Array.isArray(a) ? i[e] = a.map(e => e.toString()) : i[e] = a.toString()
            }), Array.from(new Set([...Object.keys(o), ...Object.keys(i)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let a = Array.isArray(e) ? e : [e],
                    r = Array.isArray(t) ? t : [t];
                return a.length === r.length && a.every((e, t) => e === r[t])
            })(o[e], i[e])) || (n.skipHistory ? s.replace({
                pathname: s.pathname,
                query: i
            }) : s.push({
                pathname: s.pathname,
                query: i
            }, void 0, r))
        }, [s, e, r])]
    }, "normalizeSingleQueryParam", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        return "" === t || null == t ? void 0 : t
    }])
}, 191685, e => {
    "use strict";
    var t = e.i(260022),
        a = e.i(17829);
    let r = "https://www.".concat("roblox.com"),
        s = "https://advertise.".concat("roblox.com"),
        n = e => "".concat(r, "/groups/").concat(e),
        o = e => "".concat(r, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, s, "BUY_ROBUX_CTX_CREATOR_HUB", 0, "creatorhub", "getAccountSecurityMethodUrl", 0, e => "".concat(r, "/my/account#!/security?display=").concat(e), "getAccountSecurityUrl", 0, () => "".concat(r, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(r, "/my/account#!/info"), "getAppealsPortalUrl", 0, () => "".concat(r, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(r, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(r, "/bundles/").concat(e), "getBuyRobuxUrl", 0, e => "".concat(r, "/upgrades/robux?ctx=").concat(encodeURIComponent(e)), "getCatalogUrl", 0, e => "".concat(r, "/catalog/").concat(e), "getCommunitiesUrl", 0, e => "".concat(r, "/communities/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(r, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(r, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, t) => e === a.default.Group ? n(t) : o(t), "getEventUrl", 0, e => "".concat(r, "/events/").concat(e), "getGameDetailsUrl", 0, e => "".concat(r, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(r, "/game-pass/").concat(e), "getGroupUrl", 0, n, "getHomeUrl", 0, () => "".concat(r, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(r, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(r, "/transactions"), "getLookUrl", 0, e => "".concat(r, "/looks/").concat(e), "getPaymentMethodsUrl", 0, e => "".concat(r, "/upgrades/paymentmethods?ap=").concat(encodeURIComponent(e)), "getPlayOnWebUrl", 0, e => "".concat((0, t.resolveUrl)("playRobloxUrl", "production", "global"), "/games/start?placeId=").concat(e), "getSponsorAvatarItemsUrl", 0, () => "".concat(r, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(s, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(s, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(r, "/support"), "getTermsUrl", 0, () => "".concat(r, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(r, "/transactions"), "getUrl", 0, () => r, "getUserUrl", 0, o])
}, 426546, e => {
    "use strict";
    var t = e.i(191685);
    e.s(["www", 0, t])
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let a = Object.entries(e).find(e => {
            let [, a] = e;
            return a === t
        });
        return a ? a[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(458451),
        s = e.i(533414),
        n = e.i(157310),
        o = e.i(279149),
        i = e.i(602635),
        l = e.i(814975);
    let c = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new o.UserScreenApi(c),
        u = new o.GroupsApi(c),
        f = {
            groupsApi: u,
            userScreenApi: d,
            creatorHomeContentApi: new o.CreatorHomeContentApi(c),
            signalsApi: new o.SignalsApi(c)
        };
    e.s(["CreatorHomeClient", 0, f], 67262);
    let g = function() {
        let {
            user: e
        } = (0, l.useAuthentication)();
        return (0, n.useQuery)({
            queryKey: i.getGroupsQueryKey,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: o.GroupListSurface.CreatorHub
                }, f.groupsApi.groupsListGroups(e)
            }
        })
    };
    var m = e.i(809576);
    let p = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: n
        } = e, {
            user: o
        } = (0, r.useRobloxAuthentication)(), i = (0, m.useGroupPermissionFetchers)(), {
            data: l,
            isLoading: c,
            refetch: d
        } = g(), [u, f] = (0, s.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [b, h] = (0, s.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [v, x] = (0, s.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), y = (0, a.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            x(e => {
                let a = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: r,
                        lastSelected: s
                    } = e[t];
                    "number" != typeof r || Number.isNaN(r) || "number" != typeof s || Number.isNaN(s) || (a.priority = r * (1 + Math.log10(1 + 10 / Math.max(Date.now() - s, 864e5))))
                }
                return {
                    ...e,
                    [t]: a
                }
            })
        }, [h, x]), _ = (0, a.useMemo)(() => {
            if (null == l ? void 0 : l.groups) return null == l ? void 0 : l.groups;
            if (null === u) return [];
            try {
                let e = "string" == typeof u ? JSON.parse(u) : u;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [u, null == l ? void 0 : l.groups]), k = (0, a.useMemo)(() => {
            var e;
            return b && null != (e = _.find(e => {
                let {
                    id: t
                } = e;
                return t === b
            })) ? e : null
        }, [b, _]), C = null == k ? void 0 : k.id, w = null == o ? void 0 : o.id, {
            data: E,
            error: S,
            isPending: q,
            refetch: P
        } = (0, m.useGroupResolvedPermissionsQuery)(C, w), {
            data: A,
            isPending: T,
            refetch: U
        } = (0, m.useGroupOwnershipQuery)(C, w), H = (0, a.useCallback)(() => null == C || null == w ? Promise.resolve() : Promise.all([P(), U()]), [U, P, C, w]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == l ? void 0 : l.groups) && !c && f(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, _, c, f, null == o ? void 0 : o.id]);
        let I = (0, a.useMemo)(() => {
            var e;
            return {
                groups: _,
                currentGroup: k,
                groupData: v,
                isFetched: !c && !!w,
                refreshGroups: d,
                setCurrentGroup: y,
                ...i,
                permissions: E,
                isOwner: null != w && (null == A || null == (e = A.owner) ? void 0 : e.userId) === w,
                isPermissionsLoading: null != k && (q || T),
                permissionsError: S,
                refreshPermissions: H
            }
        }, [k, v, _, c, T, q, A, i, E, S, d, H, y, w]);
        return (0, t.jsx)(p.Provider, {
            value: I,
            children: n
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(p);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(p);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(711367),
        r = e.i(157310),
        s = e.i(795621),
        n = e.i(458451),
        o = e.i(285666),
        i = e.i(272593);
    let l = new o.PermissionsV2Api((0, i.createClientConfiguration)("groups", "bedev1"));
    async function c(e, t, a) {
        var r;
        return null != (r = (await l.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: a
        })).permissions) ? r : {}
    }
    async function d(e) {
        return c(e, "groups", String(e))
    }
    async function u(e) {
        let t, a = [];
        do {
            var r, s;
            let n = await l.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            a.push(...null != (r = n.data) ? r : []), t = null != (s = n.nextPageCursor) ? s : void 0
        } while (t) return a
    }
    var f = e.i(156071);
    let g = new o.PermissionsV2Api((0, i.createClientConfiguration)("groups", "bedev1"));
    async function m(e) {
        var t;
        return null != (t = (await g.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var p = e.i(759283);
    let b = (e, t) => ["groups", e, t, "resolved-permissions"],
        h = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        v = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, r.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => f.default.getGroupInfo(e) : a.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, n.useRobloxAuthentication)(), a = (0, s.useQueryClient)(), r = null == e ? void 0 : e.id, o = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: v(e, r),
            queryFn: () => m(e),
            staleTime: 6e4
        }), [a, r]), i = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: b(e, r),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [a, r]), l = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: h(e, r),
            queryFn: () => u(e),
            staleTime: 6e4
        }), [a, r]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: i,
            fetchRolePermissions: l,
            fetchUniversePermissions: o
        }), [i, l, o])
    }, "useGroupResolvedPermissionsQuery", 0, function(e, t) {
        return (0, r.useQuery)({
            queryKey: b(e, t),
            queryFn: e && t ? () => d(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, n.useRobloxAuthentication)(), s = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: h(e, s),
            queryFn: e && s ? () => u(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, n.useRobloxAuthentication)(), s = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: v(e, s),
            queryFn: void 0 !== e && e !== p.uninitializedUniverseId ? () => m(e) : a.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 127792, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/f58fdfef2d08293e832c6df19c04db927411e75a/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 776569, 560130, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);

    function r(e) {
        let {
            className: r
        } = e;
        return a.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.default)("block", r),
            style: {
                marginTop: -1
            }
        }, a.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, r], 560130);
    var s = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: n,
            hasBeak: o = !0,
            title: i,
            description: l,
            ariaLabel: c,
            delayDurationMs: d = 500,
            children: u,
            open: f,
            onOpenChange: g,
            contentClassName: m
        } = e, [p, b] = n.split("-"), h = null != c ? c : "string" == typeof i && null == l ? i : void 0;
        return a.createElement(s.Provider, {
            delayDuration: d
        }, a.createElement(s.Root, {
            open: f,
            onOpenChange: g
        }, u, a.createElement(s.Portal, null, a.createElement(s.Content, {
            side: p,
            align: b,
            "aria-label": h,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", m),
            sideOffset: 5
        }, o && a.createElement(s.Arrow, {
            asChild: !0
        }, a.createElement(r, {
            className: "content-[var(--inverse-surface-0)]"
        })), a.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, a.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, i), l && a.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, l))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: r,
            className: n
        } = e;
        return a.createElement(s.Trigger, {
            asChild: r,
            className: n
        }, t)
    }], 776569)
}, 459703, e => {
    "use strict";
    var t = e.i(30941),
        a = e.i(416340),
        r = e.i(787159);
    e.i(221628), e.i(149285);
    var s = (0, a.createContext)({
        ref: {
            current: null
        },
        enqueue: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        },
        close: function() {
            throw Error("useSnackbar was invoked without SnackbarProvider")
        }
    });
    e.s(["default", 0, function(e) {
        var n, o, i, l, c = e.children,
            d = (0, t.a)(e, ["children"]),
            u = (0, a.useRef)(null),
            f = (0, a.useState)(!1),
            g = f[0],
            m = f[1],
            p = (0, a.useState)([]),
            b = p[0],
            h = p[1],
            v = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), h(function(r) {
                    return (0, t.b)((0, t.b)([], r, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [h]),
            x = (0, a.useCallback)(function() {
                m(!1)
            }, [m]);
        (0, a.useEffect)(function() {
            b.length > 0 && m(!0)
        }, [b.length]);
        var y = (0, a.useMemo)(function() {
            return {
                ref: u,
                enqueue: v,
                close: x
            }
        }, [x, v]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(s.Provider, {
            value: y
        }, c), a.default.createElement(r.S, (0, t._)({}, (null == (n = b[0]) ? void 0 : n.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (i = null == (o = b[0]) ? void 0 : o.props) ? void 0 : i.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, r, s, n;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (r = null == (a = b[0]) ? void 0 : a.props.TransitionProps) ? void 0 : r.onExited) && (null == (n = null == (s = b[0]) ? void 0 : s.props.TransitionProps) || n.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, r, s;
                (null == (a = b[0]) ? void 0 : a.shouldClose(t)) && m(!1), (null == (r = b[0]) ? void 0 : r.props.onClose) && (null == (s = b[0]) || s.props.onClose(e, t))
            },
            open: g
        }), null == (l = b[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(s);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 823062, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(230644);
    let r = (0, t.createContext)(null),
        s = [],
        n = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function i() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let l = () => null;
    e.s(["UnifiedLoggerProvider", 0, e => {
        var i;
        let {
            children: l,
            unifiedLogger: c,
            pageLoggerConfig: d,
            path: u,
            url: f,
            isReady: g = !0
        } = e, m = null != (i = null == d ? void 0 : d.tags) ? i : s, p = null == d ? void 0 : d.rosId, b = (0, t.useMemo)(() => ({
            tags: m,
            rosId: p,
            path: u,
            url: f,
            isReady: g
        }), [m, p, u, f, g]), h = (0, t.useRef)(b), v = (0, t.useRef)(b);
        (0, t.useLayoutEffect)(() => {
            v.current = b, void 0 === h.current.path && void 0 !== b.path && (h.current = {
                ...h.current,
                path: b.path
            })
        }, [b]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r;
                if (e instanceof a.W && void 0 !== e.pageContext) return;
                let s = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && o.has(r)) ? h.current : v.current;
                void 0 !== s.path && (e.parameters = {
                    ...e.parameters,
                    path: s.path
                }), s.tags.forEach(t => e.addTag(t)), void 0 !== s.rosId && e.addTag("owner: ".concat(s.rosId))
            };
            return n.forEach(t => {
                c.events.on(t, e)
            }), () => {
                n.forEach(t => {
                    c.events.off(t, e)
                })
            }
        }, [c]);
        let x = (0, t.useMemo)(() => ({
            unifiedLogger: c,
            pageContext: b
        }), [c, b]);
        return t.default.createElement(r.Provider, {
            value: x
        }, l)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(r)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: a,
            pageContext: r
        } = i(), {
            path: s,
            url: n,
            isReady: o
        } = r, c = a.pageSettledTracker, d = (0, t.useSyncExternalStore)(c.subscribe, c.getSnapshot, l);
        (0, t.useEffect)(() => {
            if (!d || d.isNavigating || !o || !s || !n || !e || d.url.split(/[?#]/)[0] !== n.split(/[?#]/)[0]) return;
            let t = new URL(s, window.location.origin).pathname,
                r = requestAnimationFrame(() => {
                    r = requestAnimationFrame(() => {
                        a.logPageSettledEvent({
                            navigationId: d.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(r)
        }, [d, o, n, s, e, a])
    }, "useUnifiedLoggerProvider", 0, i])
}]);

//# debugId=59f93ce4-42da-9c9d-3671-bb30d040dfa6
//# sourceMappingURL=1ba21i-elst3u.js.map