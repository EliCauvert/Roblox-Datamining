;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "3ca0018e-e9f8-8f5c-e369-e15c51eea54a")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 29929, e => {
    "use strict";
    var t, a, r, s, o, i, n, l, c, d, u, g, m, h, f, b, p, v, x = e.i(650502),
        _ = e.i(864392),
        k = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        C = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        P = ((r = {}).EnableIPRecommender = "enableIPRecommender", r),
        y = ((s = y || {}).EnableVideoOnboarding = "enableVideoOnboarding", s),
        S = ((o = S || {}).EnableSignalLookup = "enableSignalLookup", o.AlwaysShow = "alwaysShow", o),
        w = w || {},
        E = ((i = E || {}).mobileVariant = "mobileVariant", i),
        q = q || {},
        H = ((n = {}).ShowEditInStudioButton = "showEditInStudioButton", n.EnableCreationsNavLayout = "enableCreationsIPNavLayout", n),
        j = ((l = {}).EnableBulkAssetUpload = "enableBulkAssetUpload", l),
        I = ((c = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", c.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", c.EnableAudienceControls = "enableAudienceControls", c.EnableNewBadgePattern = "enableNewBadgePattern", c.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", c.EnableAudiencesReplacement = "enableAudiencesReplacement", c),
        R = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        A = ((u = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", u),
        T = ((g = T || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", g),
        M = ((m = M || {}).GameAppealsEnabled = "gameAppealsEnabled", m),
        O = ((h = O || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", h),
        z = ((f = z || {}).EnableChangelogCMS = "enableChangelogCMS", f),
        N = ((b = {}).CreatorDashboard = "CreatorDashboard", b.CreatorHubHomePage = "CreatorHub.HomePage.UserId", b.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", b.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", b.CreatorHubLandingPage = "CreatorHub.LandingPage", b.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", b.CreatorHubNavigation = "CreatorHub.Navigation", b.CreatorHubNavigationUser = "CreatorHub.Navigation.User", b.CreatorHubPublishing = "CreatorHub.Publishing.UserId", b.LicenseManager = "CreatorDashboard.LicenseManager", b.RightsManager = "CreatorDashboard.RightsManager", b.StarterPlaceCreation = "CRK.StarterPlace.StarterPlaceCreation", b.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", b.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", b.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", b.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", b.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", b.CreatorHubChangelog = "CreatorHub.Changelog", b.TalentHub = "CreatorHub.TalentHub.UserId", b),
        L = ((p = L || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", p.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", p.ShowSecrets = "showSecrets", p.ShowQualitySignalCards = "showQualitySignalCards", p);
    let U = {
        CreatorDashboard: k,
        "CreatorHub.HomePage.UserId": y,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": S,
        "CreatorHub.LandingPage": w,
        "CreatorHub.LandingPage.UserId": E,
        "CreatorHub.Navigation": q,
        "CreatorHub.Navigation.User": H,
        "CreatorHub.Publishing.UserId": j,
        "CreatorDashboard.LicenseManager": P,
        "CreatorDashboard.RightsManager": C,
        "CRK.StarterPlace.StarterPlaceCreation": A,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((v = {}).SearchVersion = "searchVersion", v),
        "CreatorHub.Creations.Permission": I,
        "CreatorHub.ExperienceWebhooks.UserId": T,
        "CreatorHub.GameAppeals.UserId": M,
        "CreatorHub.HomePage.ExperienceTile.UserId": O,
        "CreatorHub.Changelog": z,
        "CreatorHub.TalentHub.UserId": R
    };
    async function D(e) {
        let t = (0, x.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(U[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let B = (0, _.default)(D);
    e.s(["CreatorHubCreationsPermissionParameters", () => I, "CreatorHubPublishingParameters", () => j, "IXPLayers", () => N, "LicenseManagerParameters", () => P, "TalentHubParameters", () => R, "fetchIXPParametersForCurrentUser", 0, B])
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
        a = e.i(623983),
        r = e.i(697973),
        s = e.i(776344),
        o = e.i(462863),
        i = e.i(343885),
        n = e.i(609794),
        l = e.i(57561),
        c = e.i(509747),
        d = e.i(475555),
        u = e.i(538302),
        g = e.i(387707),
        m = e.i(262135),
        h = e.i(240731),
        f = e.i(956923),
        b = e.i(84362),
        p = e.i(214665),
        v = e.i(455506),
        x = e.i(918290),
        _ = e.i(716933),
        k = e.i(347319),
        C = e.i(543657),
        P = e.i(850412),
        y = e.i(103329),
        S = e.i(692706),
        w = e.i(405654),
        E = e.i(891409),
        q = e.i(758060),
        H = e.i(710005),
        j = e.i(495550),
        I = e.i(320429),
        R = e.i(106017),
        A = e.i(821978),
        T = e.i(766389),
        M = e.i(374717),
        O = e.i(756733),
        z = e.i(251697),
        N = e.i(411118),
        L = e.i(839596),
        U = e.i(729733),
        D = e.i(66217),
        B = e.i(148865),
        F = e.i(45512),
        G = e.i(706478),
        V = e.i(166181),
        K = e.i(37474),
        Q = e.i(147189),
        W = e.i(105897),
        X = e.i(123524),
        J = e.i(752739),
        Z = e.i(331105),
        Y = e.i(564908),
        $ = e.i(663412),
        ee = e.i(215887),
        et = e.i(962803),
        ea = e.i(914865),
        er = e.i(818392),
        es = e.i(173034),
        eo = e.i(780078),
        ei = e.i(756885),
        en = e.i(260123),
        el = e.i(507792),
        ec = e.i(850994);
    let ed = {
        secrets: {
            light: M.default,
            dark: T.default
        },
        noPermissions: {
            light: M.default,
            dark: T.default
        },
        notifications: {
            light: Q.default,
            dark: K.default
        },
        experiences: {
            light: el.default,
            dark: en.default
        },
        shareLinks: {
            light: et.default,
            dark: ee.default
        },
        eventsAndUpdates: {
            light: P.default,
            dark: C.default
        },
        avatarItem: {
            light: u.default,
            dark: d.default
        },
        models: {
            light: F.default,
            dark: B.default
        },
        plugins: {
            light: V.default,
            dark: G.default
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
            light: E.default,
            dark: w.default
        },
        videos: {
            light: ec.default,
            dark: ei.default
        },
        meshes: {
            light: D.default,
            dark: U.default
        },
        animations: {
            light: $.default,
            dark: Y.default
        },
        textDocuments: {
            light: k.default,
            dark: _.default
        },
        noUsers: {
            light: p.default,
            dark: b.default
        },
        localization: {
            light: A.default,
            dark: R.default
        },
        rightsManager: {
            light: Z.default,
            dark: J.default
        },
        tokens: {
            light: eo.default,
            dark: es.default
        },
        chart: {
            light: I.default,
            dark: j.default
        },
        badge: {
            light: m.default,
            dark: g.default
        },
        apiKeys: {
            light: n.default,
            dark: i.default
        },
        signin: {
            light: er.default,
            dark: ea.default
        },
        oAuthApps: {
            light: X.default,
            dark: W.default
        },
        makeupLooks: {
            light: z.default,
            dark: O.default
        },
        barGraph: {
            light: f.default,
            dark: h.default
        },
        leaderboard: {
            light: H.default,
            dark: q.default
        },
        findPeople: {
            light: S.default,
            dark: y.default
        },
        managedPricing: {
            light: L.default,
            dark: N.default
        }
    };
    e.s(["default", 0, ed], 938429);
    let eu = "".concat("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/assets", "/spot_illustrations"),
        eg = {
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
    e.s(["default", 0, eg], 321623);
    let em = (0, r.makeStyles)()(() => ({
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
        eh = e => {
            let {
                illustration: a,
                size: r = "large"
            } = e, s = a && ed[a];
            if (s) return (0, t.jsx)(o.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let i = a ? eg[r][a] : null;
            return i && (0, t.jsx)("img", {
                height: "large" === r ? 240 : 96,
                width: "large" === r ? 320 : 96,
                src: i,
                alt: a
            })
        },
        ef = e => {
            let {
                children: r,
                title: o,
                description: i,
                size: n = "large",
                illustration: l
            } = e, {
                classes: {
                    smallContainer: c,
                    largeContainer: d,
                    smallText: u,
                    largeText: g
                },
                cx: m
            } = em();
            return (0, t.jsxs)(s.default, {
                classes: {
                    root: m({
                        [c]: "small" === n,
                        [d]: "large" === n
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eh, {
                    illustration: l,
                    size: n
                }), (0, t.jsxs)(s.default, {
                    classes: {
                        root: m({
                            [u]: "small" === n,
                            [g]: "large" === n
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: o
                    }), i && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: i
                    })]
                }), r]
            })
        };
    ef.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eh, "default", 0, ef], 493924)
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624);
    e.s(["default", 0, (e, r) => {
        let s = (0, a.useRouter)(),
            o = s.query;
        return [(0, t.useMemo)(() => {
            let t = null != o ? o : {},
                a = {};
            for (let r of e) a[r] = t[r];
            return a
        }, [e, o]), (0, t.useCallback)(function(t) {
            var a;
            let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                i = null != (a = s.query) ? a : {},
                n = {
                    ...i
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let a = t[e];
                null == a ? delete n[e] : Array.isArray(a) ? n[e] = a.map(e => e.toString()) : n[e] = a.toString()
            }), Array.from(new Set([...Object.keys(i), ...Object.keys(n)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let a = Array.isArray(e) ? e : [e],
                    r = Array.isArray(t) ? t : [t];
                return a.length === r.length && a.every((e, t) => e === r[t])
            })(i[e], n[e])) || (o.skipHistory ? s.replace({
                pathname: s.pathname,
                query: n
            }) : s.push({
                pathname: s.pathname,
                query: n
            }, void 0, r))
        }, [s, e, r])]
    }, "normalizeSingleQueryParam", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        return "" === t || null == t ? void 0 : t
    }])
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
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(458451),
        s = e.i(533414),
        o = e.i(157310),
        i = e.i(279149),
        n = e.i(602635),
        l = e.i(814975);
    let c = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new i.GroupsApi(c),
        u = function() {
            let {
                user: e
            } = (0, l.useAuthentication)();
            return (0, o.useQuery)({
                queryKey: n.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: i.GroupListSurface.CreatorHub
                    }, d.groupsListGroups(e)
                }
            })
        },
        g = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: i
        } = (0, r.useRobloxAuthentication)(), {
            data: n,
            isLoading: l,
            refetch: c
        } = u(), [d, m] = (0, s.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [h, f] = (0, s.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [b, p] = (0, s.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), v = (0, a.useCallback)(e => {
            f(e);
            let t = null === e ? "user" : e;
            p(e => {
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
        }, [f, p]), x = (0, a.useMemo)(() => {
            if (null == n ? void 0 : n.groups) return null == n ? void 0 : n.groups;
            if (null === d) return [];
            try {
                return "string" == typeof d ? JSON.parse(d) : d
            } catch (e) {
                return []
            }
        }, [d, null == n ? void 0 : n.groups]), _ = (0, a.useMemo)(() => {
            var e;
            return h && null != (e = x.find(e => {
                let {
                    id: t
                } = e;
                return t === h
            })) ? e : null
        }, [h, x]);
        (0, a.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == n ? void 0 : n.groups) && !l && m(null == n ? void 0 : n.groups)
        }, [null == n ? void 0 : n.groups, x, l, m, null == i ? void 0 : i.id]);
        let k = (0, a.useMemo)(() => ({
            groups: x,
            currentGroup: _,
            groupData: b,
            isFetched: !l && !!(null == i ? void 0 : i.id),
            refreshGroups: c,
            setCurrentGroup: v
        }), [_, b, x, l, c, v, null == i ? void 0 : i.id]);
        return (0, t.jsx)(g.Provider, {
            value: k,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(g);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(g);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 486736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(639102);
    let s = {
            enableImageTranslationEnrollment: !1,
            enableImageTranslationListingTab: !1,
            enableSharedTranslationListComponents: !1,
            enableIpPlatformMatchesTableEsIndexImprovements: !1
        },
        o = {
            ...s
        },
        i = async () => {
            try {
                let {
                    applicationSettings: e = {}
                } = await r.settingsClient.getApplicationSettings(), t = {};
                return Object.entries(e).forEach(e => {
                    let [a, r] = e;
                    try {
                        let e = typeof s[a];
                        t[a] = "boolean" === e || "number" === e ? JSON.parse(r) : r
                    } catch (e) {
                        console.error(e)
                    }
                }), t
            } catch (e) {
                return s
            }
        }, n = (0, a.createContext)({
            settings: {
                ...o
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: r
        } = e, [s, l] = (0, a.useState)(() => ({
            settings: {
                ...o
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, a.useEffect)(() => {
            (async () => {
                let e = await Promise.allSettled([i()]);
                l({
                    settings: e.reduce((e, t) => ({
                        ...e,
                        ..."fulfilled" === t.status ? t.value : {}
                    }), o),
                    isFetched: !0,
                    status: e.find(e => "rejected" === e.status) ? "error" : "success"
                })
            })()
        }, []), (0, t.jsx)(n.Provider, {
            value: s,
            children: r
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: r
        } = (0, a.useContext)(n), s = (0, a.useRef)(e);
        return {
            settings: (0, a.useMemo)(() => {
                let t = s.current;
                return Object.keys(e).some(a => e[a] !== t[a]) && (s.current = e), s.current
            }, [e]),
            status: t,
            isFetched: r
        }
    }], 486736)
}, 127792, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/509481769d176d0b09fc72f8748a5c2c53774a17/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 367808, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        r = e.i(863605),
        s = e.i(154502),
        o = e.i(945146),
        i = e.i(690569),
        n = e.i(251635),
        l = e.i(787802),
        c = e.i(221628),
        d = e.i(396249),
        u = e.i(121880);

    function g(e) {
        return (0, i.g)("MuiAlertTitle", e)
    }(0, l.g)("MuiAlertTitle", ["root"]);
    let m = ["className"],
        h = (0, n.s)(d.T, {
            name: "MuiAlertTitle",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })(e => {
            let {
                theme: t
            } = e;
            return {
                fontWeight: t.typography.fontWeightMedium,
                marginTop: -2
            }
        }),
        f = a.forwardRef(function(e, t) {
            let a = (0, u.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: r
                } = a,
                s = (0, i._)(a, m),
                l = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, n.a)({
                        root: ["root"]
                    }, g, t)
                })(a);
            return (0, c.jsx)(h, (0, o._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, n.c)(l.root, r)
            }, s))
        });
    var b = (0, r.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        p = (0, a.forwardRef)(function(e, r) {
            var o = e.classes,
                i = e.className,
                n = (0, t.a)(e, ["classes", "className"]),
                l = b(void 0, {
                    props: {
                        classes: (0, s.default)(o, i)
                    }
                });
            return a.default.createElement(f, (0, t._)({}, n, {
                classes: l.classes,
                ref: r
            }))
        });
    e.s(["AlertTitle", 0, p], 367808)
}, 957474, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        r = e.i(863605),
        s = e.i(154502),
        o = e.i(787802),
        i = e.i(690569),
        n = e.i(945146),
        l = e.i(251635),
        c = e.i(51928),
        d = e.i(634034),
        u = e.i(221628),
        g = e.i(176595),
        m = e.i(121880),
        h = e.i(105006);
    e.i(465957);
    var f = (0, d.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        b = (0, d.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let p = (0, l.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: l.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, l.s)(f, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        x = (0, l.s)(b, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, n._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeIn,
                    duration: t.transitions.duration.shortest
                })
            }, a.checked && {
                transform: "scale(1)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeOut,
                    duration: t.transitions.duration.shortest
                })
            })
        });

    function _(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: r
        } = e, s = (0, n._)({}, e, {
            checked: t
        });
        return (0, u.jsxs)(p, {
            className: a.root,
            ownerState: s,
            children: [(0, u.jsx)(v, {
                fontSize: r,
                className: a.background,
                ownerState: s
            }), (0, u.jsx)(x, {
                fontSize: r,
                className: a.dot,
                ownerState: s
            })]
        })
    }

    function k(e) {
        return (0, i.g)("MuiRadio", e)
    }
    var C = (0, o.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let P = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        y = (0, l.s)(c.S, {
            shouldForwardProp: e => (0, l.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, i.a)(a.size))], t["color".concat((0, i.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, n._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, i.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(C.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(C.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        S = (0, u.jsx)(_, {
            checked: !0
        }),
        w = (0, u.jsx)(_, {}),
        E = a.forwardRef(function(e, t) {
            var r, s, o, c;
            let d = (0, m.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: f,
                    checkedIcon: b = S,
                    color: p = "primary",
                    icon: v = w,
                    name: x,
                    onChange: _,
                    size: C = "medium",
                    className: E
                } = d,
                q = (0, i._)(d, P),
                H = (0, n._)({}, d, {
                    color: p,
                    size: C
                }),
                j = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: r
                    } = e, s = {
                        root: ["root", "color".concat((0, i.a)(a)), "medium" !== r && "size".concat((0, i.a)(r))]
                    };
                    return (0, n._)({}, t, (0, l.a)(s, k, t))
                })(H),
                I = a.useContext(g.R),
                R = f,
                A = (0, h.c)(_, I && I.onChange),
                T = x;
            return I && (void 0 === R && (o = I.value, R = "object" == typeof(c = d.value) && null !== c ? o === c : String(o) === String(c)), void 0 === T && (T = I.name)), (0, u.jsx)(y, (0, n._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (r = w.props.fontSize) ? r : C
                }),
                checkedIcon: a.cloneElement(b, {
                    fontSize: null != (s = S.props.fontSize) ? s : C
                }),
                ownerState: H,
                classes: j,
                name: T,
                checked: R,
                onChange: A,
                ref: t,
                className: (0, l.c)(j.root, E)
            }, q))
        });
    var q = (0, r.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(C.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(C.colorPrimary, ".").concat(C.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        H = (0, a.forwardRef)(function(e, r) {
            var o = e.classes,
                i = e.color,
                n = e.inputProps,
                l = e["aria-label"],
                c = e.className,
                d = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = q(void 0, {
                    props: {
                        classes: (0, s.default)(o, c)
                    }
                });
            return a.default.createElement(E, (0, t._)({}, d, {
                classes: u.classes,
                color: void 0 === i ? "primary" : i,
                ref: r,
                inputProps: (0, t._)({
                    "aria-label": l
                }, n)
            }))
        });
    e.s(["Radio", 0, H], 957474)
}, 176595, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 990729, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        r = e.i(863762);
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
        var o, i, n, l, c = e.children,
            d = (0, t.a)(e, ["children"]),
            u = (0, a.useRef)(null),
            g = (0, a.useState)(!1),
            m = g[0],
            h = g[1],
            f = (0, a.useState)([]),
            b = f[0],
            p = f[1],
            v = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), p(function(r) {
                    return (0, t.b)((0, t.b)([], r, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [p]),
            x = (0, a.useCallback)(function() {
                h(!1)
            }, [h]);
        (0, a.useEffect)(function() {
            b.length > 0 && h(!0)
        }, [b.length]);
        var _ = (0, a.useMemo)(function() {
            return {
                ref: u,
                enqueue: v,
                close: x
            }
        }, [x, v]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(s.Provider, {
            value: _
        }, c), a.default.createElement(r.S, (0, t._)({}, (null == (o = b[0]) ? void 0 : o.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (n = null == (i = b[0]) ? void 0 : i.props) ? void 0 : n.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, r, s, o;
                    p(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (r = null == (a = b[0]) ? void 0 : a.props.TransitionProps) ? void 0 : r.onExited) && (null == (o = null == (s = b[0]) ? void 0 : s.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, r, s;
                (null == (a = b[0]) ? void 0 : a.shouldClose(t)) && h(!1), (null == (r = b[0]) ? void 0 : r.props.onClose) && (null == (s = b[0]) || s.props.onClose(e, t))
            },
            open: m
        }), null == (l = b[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(s);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 722417, e => {
    "use strict";
    e.s(["v", 0, {
        border: 0,
        clip: "rect(0 0 0 0)",
        height: "1px",
        margin: "-1px",
        overflow: "hidden",
        padding: 0,
        position: "absolute",
        whiteSpace: "nowrap",
        width: "1px"
    }])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: r
        } = t, s = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[s], a, r[s], r) : void 0
    }

    function r(e, t) {
        var a;
        let {
            pages: r,
            pageParams: s
        } = t;
        return r.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, r[0], r, s[0], s) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != r(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (s, o) => {
                var i, n, l, c, d;
                let u = s.options,
                    g = null == (l = s.fetchOptions) || null == (n = l.meta) || null == (i = n.fetchMore) ? void 0 : i.direction,
                    m = (null == (c = s.state.data) ? void 0 : c.pages) || [],
                    h = (null == (d = s.state.data) ? void 0 : d.pageParams) || [],
                    f = {
                        pages: [],
                        pageParams: []
                    },
                    b = 0,
                    p = async () => {
                        let o = !1,
                            i = (0, t.ensureQueryFn)(s.options, s.fetchOptions),
                            n = async (e, a, r) => {
                                let n;
                                if (o) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let l = (Object.defineProperty(n = {
                                        client: s.client,
                                        queryKey: s.queryKey,
                                        pageParam: a,
                                        direction: r ? "backward" : "forward",
                                        meta: s.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (s.signal.aborted ? o = !0 : s.signal.addEventListener("abort", () => {
                                            o = !0
                                        }), s.signal)
                                    }), n),
                                    c = await i(l),
                                    {
                                        maxPages: d
                                    } = s.options,
                                    u = r ? t.addToStart : t.addToEnd;
                                return {
                                    pages: u(e.pages, c, d),
                                    pageParams: u(e.pageParams, a, d)
                                }
                            };
                        if (g && m.length) {
                            let e = "backward" === g,
                                t = {
                                    pages: m,
                                    pageParams: h
                                },
                                s = (e ? r : a)(u, t);
                            f = await n(t, s, e)
                        } else {
                            let t = null != e ? e : m.length;
                            do {
                                var l;
                                let e = 0 === b ? null != (l = h[0]) ? l : u.initialPageParam : a(u, f);
                                if (b > 0 && null == e) break;
                                f = await n(f, e), b++
                            } while (b < t)
                        }
                        return f
                    };
                s.options.persister ? s.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = s.options).persister) ? void 0 : e.call(t, p, {
                        client: s.client,
                        queryKey: s.queryKey,
                        meta: s.options.meta,
                        signal: s.signal
                    }, o)
                } : s.fetchFn = p
            }
        }
    }])
}, 630986, e => {
    "use strict";
    var t = e.i(468612),
        a = e.i(117437),
        r = class extends t.QueryObserver {
            bindMethods() {
                super.bindMethods(), this.fetchNextPage = this.fetchNextPage.bind(this), this.fetchPreviousPage = this.fetchPreviousPage.bind(this)
            }
            setOptions(e) {
                super.setOptions({
                    ...e,
                    behavior: (0, a.infiniteQueryBehavior)()
                })
            }
            getOptimisticResult(e) {
                return e.behavior = (0, a.infiniteQueryBehavior)(), super.getOptimisticResult(e)
            }
            fetchNextPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "forward"
                        }
                    }
                })
            }
            fetchPreviousPage(e) {
                return this.fetch({
                    ...e,
                    meta: {
                        fetchMore: {
                            direction: "backward"
                        }
                    }
                })
            }
            createResult(e, t) {
                var r, s;
                let {
                    state: o
                } = e, i = super.createResult(e, t), {
                    isFetching: n,
                    isRefetching: l,
                    isError: c,
                    isRefetchError: d
                } = i, u = null == (s = o.fetchMeta) || null == (r = s.fetchMore) ? void 0 : r.direction, g = c && "forward" === u, m = n && "forward" === u, h = c && "backward" === u, f = n && "backward" === u;
                return {
                    ...i,
                    fetchNextPage: this.fetchNextPage,
                    fetchPreviousPage: this.fetchPreviousPage,
                    hasNextPage: (0, a.hasNextPage)(t, o.data),
                    hasPreviousPage: (0, a.hasPreviousPage)(t, o.data),
                    isFetchNextPageError: g,
                    isFetchingNextPage: m,
                    isFetchPreviousPageError: h,
                    isFetchingPreviousPage: f,
                    isRefetchError: d && !g && !h,
                    isRefetching: l && !m && !f
                }
            }
            constructor(e, t) {
                super(e, t)
            }
        },
        s = e.i(624083);
    e.s(["useInfiniteQuery", 0, function(e, t) {
        return (0, s.useBaseQuery)(e, r, t)
    }], 630986)
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        r = [],
        s = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var i;
        let {
            children: n,
            unifiedLogger: l,
            pageLoggerConfig: c,
            path: d
        } = e, u = null != (i = null == c ? void 0 : c.tags) ? i : r, g = null == c ? void 0 : c.rosId, m = (0, t.useMemo)(() => ({
            tags: u,
            rosId: g,
            path: d
        }), [u, g, d]), h = (0, t.useRef)(m), f = (0, t.useRef)(m);
        (0, t.useLayoutEffect)(() => {
            f.current = m, void 0 === h.current.path && void 0 !== m.path && (h.current = {
                ...h.current,
                path: m.path
            })
        }, [m]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, r = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && o.has(a)) ? h.current : f.current;
                void 0 !== r.path && (e.parameters = {
                    ...e.parameters,
                    path: r.path
                }), r.tags.forEach(t => e.addTag(t)), void 0 !== r.rosId && e.addTag("owner: ".concat(r.rosId))
            };
            return s.forEach(t => {
                l.events.on(t, e)
            }), () => {
                s.forEach(t => {
                    l.events.off(t, e)
                })
            }
        }, [l]);
        let b = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: m
        }), [l, m]);
        return t.default.createElement(a.Provider, {
            value: b
        }, n)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=3ca0018e-e9f8-8f5c-e369-e15c51eea54a
//# sourceMappingURL=34ozssdepken_.js.map