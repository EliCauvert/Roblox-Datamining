;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "6b5e055f-dcb3-5661-3d83-714f597c24a7")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 29929, e => {
    "use strict";
    let t;
    var a, r, s, o, i, n, l, c, b, d, u, f, g, m, p, h, v, x, _, k, C = e.i(650502),
        y = e.i(864392),
        S = ((a = {}).ShowVrDeviceOption = "showVrDeviceOption", a.ShowIXPClientTest = "showIXPClientTest", a.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", a.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", a.EnableIA = "enableIA", a.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", a.EnableDevexEarnedRobux = "enableDevexEarnedRobux", a.EnableExperienceGenre = "enableExperienceGenre", a.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", a.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", a.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", a.EnableEventRequestFeaturing = "enableEventRequestFeaturing", a.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", a),
        E = ((r = {}).EnableRightsManager = "enableRightsManager", r.EnableBulkFiling = "enableBulkFiling", r.EnableOnDemandSearch = "enableOnDemandSearch", r.EnableEditRegistration = "enableEditRegistration", r.EnableImageSearch = "enableImageSearch", r.EnableClaimsAgainstMe = "enableClaimsAgainstMe", r.EnableGenAiOptOut = "enableGenAiOptOut", r.EnableInExperienceIpReporting = "enableInExperienceIpReporting", r.EnableIpContentSearch = "enableIpContentSearch", r.EnableTrademark = "enableTrademark", r),
        w = ((s = {}).EnableIPRecommender = "enableIPRecommender", s),
        P = ((o = P || {}).EnableVideoOnboarding = "enableVideoOnboarding", o),
        q = ((i = q || {}).EnableSignalLookup = "enableSignalLookup", i.AlwaysShow = "alwaysShow", i),
        H = H || {},
        j = ((n = j || {}).mobileVariant = "mobileVariant", n),
        I = I || {},
        R = ((l = {}).ShowEditInStudioButton = "showEditInStudioButton", l.EnableCreationsNavLayout = "enableCreationsIPNavLayout", l),
        A = ((c = {}).EnableBulkAssetUpload = "enableBulkAssetUpload", c),
        T = ((b = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", b.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", b.EnableAudienceControls = "enableAudienceControls", b.EnableNewBadgePattern = "enableNewBadgePattern", b.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", b.EnableAudiencesReplacement = "enableAudiencesReplacement", b),
        z = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        M = ((u = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", u),
        O = ((f = O || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", f),
        L = ((g = L || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", g),
        U = ((m = U || {}).EnableChangelogCMS = "enableChangelogCMS", m),
        D = ((p = {}).EnableSectionStepper = "enableSectionStepper", p),
        N = ((h = {}).CreatorDashboard = "CreatorDashboard", h.CreatorHubHomePage = "CreatorHub.HomePage.UserId", h.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", h.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", h.CreatorHubLandingPage = "CreatorHub.LandingPage", h.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", h.CreatorHubNavigation = "CreatorHub.Navigation", h.CreatorHubNavigationUser = "CreatorHub.Navigation.User", h.CreatorHubPublishing = "CreatorHub.Publishing.UserId", h.LicenseManager = "CreatorDashboard.LicenseManager", h.RightsManager = "CreatorDashboard.RightsManager", h.StarterPlaceCreation = "CRK.StarterPlace.StarterPlaceCreation", h.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", h.CreatorHubDocumentation = "CreatorHub.CreatorDocumentation.UserId", h.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", h.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", h.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", h.CreatorHubChangelog = "CreatorHub.Changelog", h.TalentHub = "CreatorHub.TalentHub.UserId", h.ContentSuitabilityQuestionnaire = "ContentSuitability.Questionnaire.UserId", h),
        B = ((v = B || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", v.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", v.ShowSecrets = "showSecrets", v.ShowQualitySignalCards = "showQualitySignalCards", v);
    let V = {
        CreatorDashboard: S,
        "CreatorHub.HomePage.UserId": P,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": q,
        "CreatorHub.LandingPage": H,
        "CreatorHub.LandingPage.UserId": j,
        "CreatorHub.Navigation": I,
        "CreatorHub.Navigation.User": R,
        "CreatorHub.Publishing.UserId": A,
        "CreatorDashboard.LicenseManager": w,
        "CreatorDashboard.RightsManager": E,
        "CRK.StarterPlace.StarterPlaceCreation": M,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.UserId": ((x = {}).EnableCourses = "enableCourses", x),
        "CreatorHub.CreatorDocumentation.Search.UserId": ((_ = {}).SearchVersion = "searchVersion", _),
        "CreatorHub.Creations.Permission": T,
        "CreatorHub.ExperienceWebhooks.UserId": O,
        "CreatorHub.HomePage.ExperienceTile.UserId": L,
        "CreatorHub.Changelog": U,
        "CreatorHub.TalentHub.UserId": z,
        "ContentSuitability.Questionnaire.UserId": D
    };
    async function G(e) {
        let t = (0, C.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(V[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let F = (0, y.default)(G);
    k = async function(e, t) {
        let a = (0, C.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            r = await fetch("".concat(a, "/v1/projects/1/values"), {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    layers: {
                        [e]: {
                            universeid: t
                        }
                    }
                }),
                credentials: "include"
            });
        return (await r.json()).layers[e].parameters
    }, t = [], e.s(["ContentSuitabilityQuestionnaireParameters", () => D, "CreatorHubCreationsPermissionParameters", () => T, "CreatorHubPublishingParameters", () => A, "IXPLayers", () => N, "LicenseManagerParameters", () => w, "TalentHubParameters", () => z, "fetchIXPParametersForCurrentUser", 0, F], 29929)
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
        b = e.i(475555),
        d = e.i(538302),
        u = e.i(387707),
        f = e.i(262135),
        g = e.i(240731),
        m = e.i(956923),
        p = e.i(84362),
        h = e.i(214665),
        v = e.i(455506),
        x = e.i(918290),
        _ = e.i(716933),
        k = e.i(347319),
        C = e.i(543657),
        y = e.i(850412),
        S = e.i(103329),
        E = e.i(692706),
        w = e.i(405654),
        P = e.i(891409),
        q = e.i(758060),
        H = e.i(710005),
        j = e.i(495550),
        I = e.i(320429),
        R = e.i(106017),
        A = e.i(821978),
        T = e.i(766389),
        z = e.i(374717),
        M = e.i(756733),
        O = e.i(251697),
        L = e.i(411118),
        U = e.i(839596),
        D = e.i(729733),
        N = e.i(66217),
        B = e.i(148865),
        V = e.i(45512),
        G = e.i(706478),
        F = e.i(166181),
        W = e.i(37474),
        K = e.i(147189),
        Q = e.i(105897),
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
    let eb = {
        secrets: {
            light: z.default,
            dark: T.default
        },
        noPermissions: {
            light: z.default,
            dark: T.default
        },
        notifications: {
            light: K.default,
            dark: W.default
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
            light: y.default,
            dark: C.default
        },
        avatarItem: {
            light: d.default,
            dark: b.default
        },
        models: {
            light: V.default,
            dark: B.default
        },
        plugins: {
            light: F.default,
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
            light: P.default,
            dark: w.default
        },
        videos: {
            light: ec.default,
            dark: ei.default
        },
        meshes: {
            light: N.default,
            dark: D.default
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
            light: h.default,
            dark: p.default
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
            light: f.default,
            dark: u.default
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
            dark: Q.default
        },
        makeupLooks: {
            light: O.default,
            dark: M.default
        },
        barGraph: {
            light: m.default,
            dark: g.default
        },
        leaderboard: {
            light: H.default,
            dark: q.default
        },
        findPeople: {
            light: E.default,
            dark: S.default
        },
        managedPricing: {
            light: U.default,
            dark: L.default
        }
    };
    e.s(["default", 0, eb], 938429);
    let ed = "".concat("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/assets", "/spot_illustrations"),
        eu = {
            small: {
                analytics: "".concat(ed, "/small/analytics.svg"),
                animations: "".concat(ed, "/small/animations.svg"),
                audio: "".concat(ed, "/small/audio.svg"),
                audioLight: "".concat(ed, "/small/audio_light.svg"),
                audioDark: "".concat(ed, "/small/audio_dark.svg"),
                avatarItem: "".concat(ed, "/small/avatar_item.svg"),
                beginSearch: "".concat(ed, "/small/beginSearch.svg"),
                creatorStore: "".concat(ed, "/small/creator_store.svg"),
                decals: "".concat(ed, "/small/decals.svg"),
                events: "".concat(ed, "/small/events.svg"),
                experiences: "".concat(ed, "/small/experiences.svg"),
                images: "".concat(ed, "/small/images.svg"),
                meshes: "".concat(ed, "/small/meshes.svg"),
                models: "".concat(ed, "/small/models.svg"),
                plugins: "".concat(ed, "/small/plugins.svg"),
                script: "".concat(ed, "/small/script.svg"),
                song: "".concat(ed, "/small/song.svg"),
                musicNote: "".concat(ed, "/small/audio_music_note.svg"),
                noUsers: "".concat(ed, "/small/no_users.svg"),
                user: "".concat(ed, "/small/user.svg"),
                users: "".concat(ed, "/small/users.svg"),
                videos: "".concat(ed, "/small/videos.svg"),
                search: "".concat(ed, "/small/search.svg"),
                oof: "".concat(ed, "/small/oof.svg"),
                download: "".concat(ed, "/small/download.svg"),
                attributes: "".concat(ed, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(ed, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(ed, "/large/api_keys.svg"),
                localization: "".concat(ed, "/large/localization.svg"),
                noPermissions: "".concat(ed, "/large/no_permissions.svg"),
                oAuthApps: "".concat(ed, "/large/oauth_apps.svg"),
                rights: "".concat(ed, "/large/rights.svg"),
                secrets: "".concat(ed, "/large/secrets.svg"),
                shareLinks: "".concat(ed, "/large/share_links.svg"),
                configurations: "".concat(ed, "/large/configurations.svg"),
                experienceConfigs: "".concat(ed, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(ed, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, eu], 321623);
    let ef = (0, r.makeStyles)()(() => ({
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
        eg = e => {
            let {
                illustration: a,
                size: r = "large"
            } = e, s = a && eb[a];
            if (s) return (0, t.jsx)(o.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let i = a ? eu[r][a] : null;
            return i && (0, t.jsx)("img", {
                height: "large" === r ? 240 : 96,
                width: "large" === r ? 320 : 96,
                src: i,
                alt: a
            })
        },
        em = e => {
            let {
                children: r,
                title: o,
                description: i,
                size: n = "large",
                illustration: l
            } = e, {
                classes: {
                    smallContainer: c,
                    largeContainer: b,
                    smallText: d,
                    largeText: u
                },
                cx: f
            } = ef();
            return (0, t.jsxs)(s.default, {
                classes: {
                    root: f({
                        [c]: "small" === n,
                        [b]: "large" === n
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eg, {
                    illustration: l,
                    size: n
                }), (0, t.jsxs)(s.default, {
                    classes: {
                        root: f({
                            [d]: "small" === n,
                            [u]: "large" === n
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
    em.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eg, "default", 0, em], 493924)
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
        b = new i.GroupsApi(c),
        d = function() {
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
                    }, b.groupsListGroups(e)
                }
            })
        },
        u = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: i
        } = (0, r.useRobloxAuthentication)(), {
            data: n,
            isLoading: l,
            refetch: c
        } = d(), [b, f] = (0, s.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [g, m] = (0, s.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [p, h] = (0, s.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), v = (0, a.useCallback)(e => {
            m(e);
            let t = null === e ? "user" : e;
            h(e => {
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
        }, [m, h]), x = (0, a.useMemo)(() => {
            if (null == n ? void 0 : n.groups) return null == n ? void 0 : n.groups;
            if (null === b) return [];
            try {
                return "string" == typeof b ? JSON.parse(b) : b
            } catch (e) {
                return []
            }
        }, [b, null == n ? void 0 : n.groups]), _ = (0, a.useMemo)(() => {
            var e;
            return g && null != (e = x.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, x]);
        (0, a.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == n ? void 0 : n.groups) && !l && f(null == n ? void 0 : n.groups)
        }, [null == n ? void 0 : n.groups, x, l, f, null == i ? void 0 : i.id]);
        let k = (0, a.useMemo)(() => ({
            groups: x,
            currentGroup: _,
            groupData: p,
            isFetched: !l && !!(null == i ? void 0 : i.id),
            refreshGroups: c,
            setCurrentGroup: v
        }), [_, p, x, l, c, v, null == i ? void 0 : i.id]);
        return (0, t.jsx)(u.Provider, {
            value: k,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(u);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(u);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 127792, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/84bfd1b916847bb3f028725bd65308b634cbd5fb/_next/static/media/video_light.1fum3vlxctp7w.svg")
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
        b = e.i(396249),
        d = e.i(121880);

    function u(e) {
        return (0, i.g)("MuiAlertTitle", e)
    }(0, l.g)("MuiAlertTitle", ["root"]);
    let f = ["className"],
        g = (0, n.s)(b.T, {
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
        m = a.forwardRef(function(e, t) {
            let a = (0, d.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: r
                } = a,
                s = (0, i._)(a, f),
                l = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, n.a)({
                        root: ["root"]
                    }, u, t)
                })(a);
            return (0, c.jsx)(g, (0, o._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, n.c)(l.root, r)
            }, s))
        });
    var p = (0, r.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, t._)((0, t._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        h = (0, a.forwardRef)(function(e, r) {
            var o = e.classes,
                i = e.className,
                n = (0, t.a)(e, ["classes", "className"]),
                l = p(void 0, {
                    props: {
                        classes: (0, s.default)(o, i)
                    }
                });
            return a.default.createElement(m, (0, t._)({}, n, {
                classes: l.classes,
                ref: r
            }))
        });
    e.s(["AlertTitle", 0, h], 367808)
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
        b = e.i(634034),
        d = e.i(221628),
        u = e.i(176595),
        f = e.i(121880),
        g = e.i(105006);
    e.i(465957);
    var m = (0, b.c)((0, d.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        p = (0, b.c)((0, d.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let h = (0, l.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: l.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, l.s)(m, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        x = (0, l.s)(p, {
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
        return (0, d.jsxs)(h, {
            className: a.root,
            ownerState: s,
            children: [(0, d.jsx)(v, {
                fontSize: r,
                className: a.background,
                ownerState: s
            }), (0, d.jsx)(x, {
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
    let y = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, l.s)(c.S, {
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
        E = (0, d.jsx)(_, {
            checked: !0
        }),
        w = (0, d.jsx)(_, {}),
        P = a.forwardRef(function(e, t) {
            var r, s, o, c;
            let b = (0, f.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: m,
                    checkedIcon: p = E,
                    color: h = "primary",
                    icon: v = w,
                    name: x,
                    onChange: _,
                    size: C = "medium",
                    className: P
                } = b,
                q = (0, i._)(b, y),
                H = (0, n._)({}, b, {
                    color: h,
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
                I = a.useContext(u.R),
                R = m,
                A = (0, g.c)(_, I && I.onChange),
                T = x;
            return I && (void 0 === R && (o = I.value, R = "object" == typeof(c = b.value) && null !== c ? o === c : String(o) === String(c)), void 0 === T && (T = I.name)), (0, d.jsx)(S, (0, n._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (r = w.props.fontSize) ? r : C
                }),
                checkedIcon: a.cloneElement(p, {
                    fontSize: null != (s = E.props.fontSize) ? s : C
                }),
                ownerState: H,
                classes: j,
                name: T,
                checked: R,
                onChange: A,
                ref: t,
                className: (0, l.c)(j.root, P)
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
                b = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                d = q(void 0, {
                    props: {
                        classes: (0, s.default)(o, c)
                    }
                });
            return a.default.createElement(P, (0, t._)({}, b, {
                classes: d.classes,
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
            b = (0, t.a)(e, ["children"]),
            d = (0, a.useRef)(null),
            u = (0, a.useState)(!1),
            f = u[0],
            g = u[1],
            m = (0, a.useState)([]),
            p = m[0],
            h = m[1],
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
                g(!1)
            }, [g]);
        (0, a.useEffect)(function() {
            p.length > 0 && g(!0)
        }, [p.length]);
        var _ = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: v,
                close: x
            }
        }, [x, v]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(s.Provider, {
            value: _
        }, c), a.default.createElement(r.S, (0, t._)({}, (null == (o = p[0]) ? void 0 : o.props) || {}, b, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (n = null == (i = p[0]) ? void 0 : i.props) ? void 0 : n.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, r, s, o;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (r = null == (a = p[0]) ? void 0 : a.props.TransitionProps) ? void 0 : r.onExited) && (null == (o = null == (s = p[0]) ? void 0 : s.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, r, s;
                (null == (a = p[0]) ? void 0 : a.shouldClose(t)) && g(!1), (null == (r = p[0]) ? void 0 : r.props.onClose) && (null == (s = p[0]) || s.props.onClose(e, t))
            },
            open: f
        }), null == (l = p[0]) ? void 0 : l.props.children))
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
            path: b
        } = e, d = null != (i = null == c ? void 0 : c.tags) ? i : r, u = null == c ? void 0 : c.rosId, f = (0, t.useMemo)(() => ({
            tags: d,
            rosId: u,
            path: b
        }), [d, u, b]), g = (0, t.useRef)(f), m = (0, t.useRef)(f);
        (0, t.useLayoutEffect)(() => {
            m.current = f, void 0 === g.current.path && void 0 !== f.path && (g.current = {
                ...g.current,
                path: f.path
            })
        }, [f]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, r = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && o.has(a)) ? g.current : m.current;
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
        let p = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: f
        }), [l, f]);
        return t.default.createElement(a.Provider, {
            value: p
        }, n)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=6b5e055f-dcb3-5661-3d83-714f597c24a7
//# sourceMappingURL=3dvxitt68oo2m.js.map