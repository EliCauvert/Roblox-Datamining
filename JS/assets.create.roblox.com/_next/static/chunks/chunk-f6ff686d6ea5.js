;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "1f6b1e77-97c9-f975-b6f2-5616242e1e30")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 358763, e => {
    "use strict";
    var a = e.i(416340),
        t = e.i(296380);
    let r = () => {};
    e.s(["default", 0, function(e, s) {
        let {
            debounceDelay: o,
            intersectionObserverThreshold: n,
            resetOncePer: i
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, l = (0, a.useRef)(!1), c = (0, a.useCallback)(e => {
            !e || l.current || (l.current = !0, s())
        }, [s]), [d] = (0, t.default)(c, null != o ? o : 250), u = (0, a.useCallback)(e => {
            let [a] = e;
            d(a.isIntersecting)
        }, [d]), b = null != i ? i : "instance";
        (0, a.useMemo)(() => {
            "callback" === b && (l.current = !1)
        }, [s]), (0, a.useEffect)(() => {
            if (!e.current) return r;
            let a = new IntersectionObserver(u, {
                threshold: null != n ? n : .5
            });
            return a.observe(e.current), () => {
                a.disconnect()
            }
        }, [e, n, u])
    }])
}, 605050, e => {
    "use strict";
    var a = e.i(974729);
    let t = (0, e.i(272593).createClientConfiguration)("core-content", "bedev2"),
        r = new a.CoreContentApi(t);
    e.s(["default", 0, r])
}, 29929, e => {
    "use strict";
    let a;
    var t, r, s, o, n, i, l, c, d, u, b, g, f, m, p, h, v, x, _, k, C = e.i(650502),
        y = e.i(864392),
        S = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        w = ((r = {}).EnableRightsManager = "enableRightsManager", r.EnableBulkFiling = "enableBulkFiling", r.EnableOnDemandSearch = "enableOnDemandSearch", r.EnableEditRegistration = "enableEditRegistration", r.EnableImageSearch = "enableImageSearch", r.EnableClaimsAgainstMe = "enableClaimsAgainstMe", r.EnableGenAiOptOut = "enableGenAiOptOut", r.EnableInExperienceIpReporting = "enableInExperienceIpReporting", r.EnableIpContentSearch = "enableIpContentSearch", r.EnableTrademark = "enableTrademark", r),
        E = ((s = {}).EnableIPRecommender = "enableIPRecommender", s),
        P = ((o = P || {}).EnableVideoOnboarding = "enableVideoOnboarding", o),
        q = ((n = q || {}).EnableSignalLookup = "enableSignalLookup", n.AlwaysShow = "alwaysShow", n),
        A = A || {},
        I = ((i = I || {}).mobileVariant = "mobileVariant", i),
        U = U || {},
        T = ((l = {}).ShowEditInStudioButton = "showEditInStudioButton", l.EnableCreationsNavLayout = "enableCreationsIPNavLayout", l),
        H = ((c = {}).EnableBulkAssetUpload = "enableBulkAssetUpload", c),
        j = ((d = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", d.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", d.EnableAudienceControls = "enableAudienceControls", d.EnableNewBadgePattern = "enableNewBadgePattern", d.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", d.EnableAudiencesReplacement = "enableAudiencesReplacement", d),
        R = ((u = {}).EnableTalentHubV2 = "enableTalentHubV2", u.EnableTalentHubV2M2 = "enableTalentHubV2M2", u),
        z = ((b = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", b),
        M = ((g = M || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", g),
        N = ((f = N || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", f),
        L = ((m = L || {}).EnableChangelogCMS = "enableChangelogCMS", m),
        D = ((p = {}).EnableSectionStepper = "enableSectionStepper", p),
        O = ((h = {}).CreatorDashboard = "CreatorDashboard", h.CreatorHubHomePage = "CreatorHub.HomePage.UserId", h.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", h.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", h.CreatorHubLandingPage = "CreatorHub.LandingPage", h.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", h.CreatorHubNavigation = "CreatorHub.Navigation", h.CreatorHubNavigationUser = "CreatorHub.Navigation.User", h.CreatorHubPublishing = "CreatorHub.Publishing.UserId", h.LicenseManager = "CreatorDashboard.LicenseManager", h.RightsManager = "CreatorDashboard.RightsManager", h.StarterPlaceCreation = "CRK.StarterPlace.StarterPlaceCreation", h.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", h.CreatorHubDocumentation = "CreatorHub.CreatorDocumentation.UserId", h.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", h.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", h.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", h.CreatorHubChangelog = "CreatorHub.Changelog", h.TalentHub = "CreatorHub.TalentHub.UserId", h.ContentSuitabilityQuestionnaire = "ContentSuitability.Questionnaire.UserId", h),
        B = ((v = B || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", v.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", v.ShowSecrets = "showSecrets", v.ShowQualitySignalCards = "showQualitySignalCards", v);
    let G = {
        CreatorDashboard: S,
        "CreatorHub.HomePage.UserId": P,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": q,
        "CreatorHub.LandingPage": A,
        "CreatorHub.LandingPage.UserId": I,
        "CreatorHub.Navigation": U,
        "CreatorHub.Navigation.User": T,
        "CreatorHub.Publishing.UserId": H,
        "CreatorDashboard.LicenseManager": E,
        "CreatorDashboard.RightsManager": w,
        "CRK.StarterPlace.StarterPlaceCreation": z,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.UserId": ((x = {}).EnableCourses = "enableCourses", x),
        "CreatorHub.CreatorDocumentation.Search.UserId": ((_ = {}).SearchVersion = "searchVersion", _),
        "CreatorHub.Creations.Permission": j,
        "CreatorHub.ExperienceWebhooks.UserId": M,
        "CreatorHub.HomePage.ExperienceTile.UserId": N,
        "CreatorHub.Changelog": L,
        "CreatorHub.TalentHub.UserId": R,
        "ContentSuitability.Questionnaire.UserId": D
    };
    async function V(e) {
        let a = (0, C.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            t = Object.values(G[e]).join(","),
            r = "".concat(a, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(t);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let F = (0, y.default)(V);
    k = async function(e, a) {
        let t = (0, C.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            r = await fetch("".concat(t, "/v1/projects/1/values"), {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    layers: {
                        [e]: {
                            universeid: a
                        }
                    }
                }),
                credentials: "include"
            });
        return (await r.json()).layers[e].parameters
    }, a = [], e.s(["ContentSuitabilityQuestionnaireParameters", () => D, "CreatorHubCreationsPermissionParameters", () => j, "CreatorHubPublishingParameters", () => H, "IXPLayers", () => O, "LicenseManagerParameters", () => E, "TalentHubParameters", () => R, "fetchIXPParametersForCurrentUser", 0, F], 29929)
}, 864392, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        let a = new Map;
        return t => {
            if (a.has(t)) return a.get(t);
            let r = e(t);
            return a.set(t, r), r
        }
    }])
}, 493924, 938429, 321623, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(199834),
        r = e.i(706442),
        s = e.i(776344),
        o = e.i(462863),
        n = e.i(343885),
        i = e.i(609794),
        l = e.i(57561),
        c = e.i(509747),
        d = e.i(475555),
        u = e.i(538302),
        b = e.i(387707),
        g = e.i(262135),
        f = e.i(240731),
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
        w = e.i(692706),
        E = e.i(405654),
        P = e.i(891409),
        q = e.i(758060),
        A = e.i(710005),
        I = e.i(495550),
        U = e.i(320429),
        T = e.i(106017),
        H = e.i(821978),
        j = e.i(766389),
        R = e.i(374717),
        z = e.i(756733),
        M = e.i(251697),
        N = e.i(411118),
        L = e.i(839596),
        D = e.i(729733),
        O = e.i(66217),
        B = e.i(148865),
        G = e.i(45512),
        V = e.i(706478),
        F = e.i(166181),
        W = e.i(37474),
        Q = e.i(147189),
        K = e.i(105897),
        X = e.i(123524),
        J = e.i(752739),
        Z = e.i(331105),
        Y = e.i(564908),
        $ = e.i(663412),
        ee = e.i(215887),
        ea = e.i(962803),
        et = e.i(914865),
        er = e.i(818392),
        es = e.i(173034),
        eo = e.i(780078),
        en = e.i(756885),
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
            light: Q.default,
            dark: W.default
        },
        experiences: {
            light: el.default,
            dark: ei.default
        },
        shareLinks: {
            light: ea.default,
            dark: ee.default
        },
        eventsAndUpdates: {
            light: y.default,
            dark: C.default
        },
        avatarItem: {
            light: u.default,
            dark: d.default
        },
        models: {
            light: G.default,
            dark: B.default
        },
        plugins: {
            light: F.default,
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
            light: P.default,
            dark: E.default
        },
        videos: {
            light: ec.default,
            dark: en.default
        },
        meshes: {
            light: O.default,
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
            light: H.default,
            dark: T.default
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
            light: U.default,
            dark: I.default
        },
        badge: {
            light: g.default,
            dark: b.default
        },
        apiKeys: {
            light: i.default,
            dark: n.default
        },
        signin: {
            light: er.default,
            dark: et.default
        },
        oAuthApps: {
            light: X.default,
            dark: K.default
        },
        makeupLooks: {
            light: M.default,
            dark: z.default
        },
        barGraph: {
            light: m.default,
            dark: f.default
        },
        leaderboard: {
            light: A.default,
            dark: q.default
        },
        findPeople: {
            light: w.default,
            dark: S.default
        },
        managedPricing: {
            light: L.default,
            dark: N.default
        }
    };
    e.s(["default", 0, ed], 938429);
    let eu = "".concat("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/assets", "/spot_illustrations"),
        eb = {
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
    e.s(["default", 0, eb], 321623);
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
        ef = e => {
            let {
                illustration: t,
                size: r = "large"
            } = e, s = t && ed[t];
            if (s) return (0, a.jsx)(o.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: t
            });
            let n = t ? eb[r][t] : null;
            return n && (0, a.jsx)("img", {
                height: "large" === r ? 240 : 96,
                width: "large" === r ? 320 : 96,
                src: n,
                alt: t
            })
        },
        em = e => {
            let {
                children: r,
                title: o,
                description: n,
                size: i = "large",
                illustration: l
            } = e, {
                classes: {
                    smallContainer: c,
                    largeContainer: d,
                    smallText: u,
                    largeText: b
                },
                cx: g
            } = eg();
            return (0, a.jsxs)(s.default, {
                classes: {
                    root: g({
                        [c]: "small" === i,
                        [d]: "large" === i
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, a.jsx)(ef, {
                    illustration: l,
                    size: i
                }), (0, a.jsxs)(s.default, {
                    classes: {
                        root: g({
                            [u]: "small" === i,
                            [b]: "large" === i
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, a.jsx)(t.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: o
                    }), n && (0, a.jsx)(t.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: n
                    })]
                }), r]
            })
        };
    em.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, ef, "default", 0, em], 493924)
}, 296380, e => {
    "use strict";
    var a = e.i(416340);
    let t = (e, t) => {
        let r = (0, a.useRef)(null),
            s = (0, a.useCallback)(() => {
                null !== r.current && (clearTimeout(r.current), r.current = null)
            }, [r]);
        return [(0, a.useCallback)(function() {
            for (var a = arguments.length, o = Array(a), n = 0; n < a; n++) o[n] = arguments[n];
            s(), r.current = window.setTimeout(() => {
                e(...o), r.current = null
            }, t)
        }, [e, t, s]), s, r]
    };
    e.s(["default", 0, t, "useDebouncedFunction", 0, t])
}, 198528, e => {
    "use strict";
    var a = e.i(416340),
        t = e.i(237401);
    e.s(["default", 0, (e, r) => {
        let s = (0, t.useRouter)(),
            o = s.query;
        return [(0, a.useMemo)(() => {
            let a = null != o ? o : {},
                t = {};
            for (let r of e) t[r] = a[r];
            return t
        }, [e, o]), (0, a.useCallback)(function(a) {
            var t;
            let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                n = null != (t = s.query) ? t : {},
                i = {
                    ...n
                };
            e.forEach(e => {
                if (!Object.hasOwn(a, e)) return;
                let t = a[e];
                null == t ? delete i[e] : Array.isArray(t) ? i[e] = t.map(e => e.toString()) : i[e] = t.toString()
            }), Array.from(new Set([...Object.keys(n), ...Object.keys(i)])).every(e => ((e, a) => {
                if (null == e && null == a) return !0;
                if (null == e || null == a) return !1;
                let t = Array.isArray(e) ? e : [e],
                    r = Array.isArray(a) ? a : [a];
                return t.length === r.length && t.every((e, a) => e === r[a])
            })(n[e], i[e])) || (o.skipHistory ? s.replace({
                pathname: s.pathname,
                query: i
            }) : s.push({
                pathname: s.pathname,
                query: i
            }, void 0, r))
        }, [s, e, r])]
    }, "normalizeSingleQueryParam", 0, e => {
        let a = Array.isArray(e) ? e[0] : e;
        return "" === a || null == a ? void 0 : a
    }])
}, 780880, e => {
    "use strict";
    var a = e.i(198528);
    e.s(["useQueryParams", () => a.default])
}, 191685, e => {
    "use strict";
    var a = e.i(17829);
    let t = "https://www.".concat("roblox.com"),
        r = "https://advertise.".concat("roblox.com"),
        s = e => "".concat(t, "/groups/").concat(e),
        o = e => "".concat(t, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, r, "getAccountSecurityUrl", 0, () => "".concat(t, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(t, "/my/account#!/info"), "getAdvertiseAssetUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=Asset"), "getAdvertisePassUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=GamePass"), "getAppealsPortalUrl", 0, () => "".concat(t, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(t, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(t, "/bundles/").concat(e), "getCatalogUrl", 0, e => "".concat(t, "/catalog/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(t, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(t, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, t) => e === a.default.Group ? s(t) : o(t), "getEventUrl", 0, e => "".concat(t, "/events/").concat(e), "getFriendsUrl", 0, e => "".concat(t, "/users/").concat(e, "/friends#!/friends"), "getGameDetailsUrl", 0, e => "".concat(t, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(t, "/game-pass/").concat(e), "getGroupUrl", 0, s, "getHomeUrl", 0, () => "".concat(t, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(t, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(t, "/transactions"), "getLookUrl", 0, e => "".concat(t, "/looks/").concat(e), "getSponsorAvatarItemsUrl", 0, () => "".concat(t, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(r, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(r, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(t, "/support"), "getTermsUrl", 0, () => "".concat(t, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(t, "/transactions"), "getUrl", 0, () => t, "getUserUrl", 0, o])
}, 426546, e => {
    "use strict";
    var a = e.i(191685);
    e.s(["www", 0, a])
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, a) => {
        let t = Object.entries(e).find(e => {
            let [, t] = e;
            return t === a
        });
        return t ? t[0] : null
    }, "isValidArrayEnumValue", 0, (e, a) => e.includes(a), "isValidEnumValue", 0, (e, a) => Object.values(e).includes(a)])
}, 745873, e => {
    "use strict";
    var a = e.i(221628),
        t = e.i(416340),
        r = e.i(458451),
        s = e.i(533414),
        o = e.i(157310),
        n = e.i(279149),
        i = e.i(602635),
        l = e.i(814975);
    let c = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new n.GroupsApi(c),
        u = function() {
            let {
                user: e
            } = (0, l.useAuthentication)();
            return (0, o.useQuery)({
                queryKey: i.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: n.GroupListSurface.CreatorHub
                    }, d.groupsListGroups(e)
                }
            })
        },
        b = (0, t.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: n
        } = (0, r.useRobloxAuthentication)(), {
            data: i,
            isLoading: l,
            refetch: c
        } = u(), [d, g] = (0, s.useLocalStorage)("creatorHubGroups.".concat(null == n ? void 0 : n.id), null), [f, m] = (0, s.useLocalStorage)("creatorHubGroup.".concat(null == n ? void 0 : n.id), null), [p, h] = (0, s.useLocalStorage)("creatorHubGroupData.".concat(null == n ? void 0 : n.id), {}), v = (0, t.useCallback)(e => {
            m(e);
            let a = null === e ? "user" : e;
            h(e => {
                let t = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[a]) {
                    let {
                        priority: r,
                        lastSelected: s
                    } = e[a];
                    "number" != typeof r || Number.isNaN(r) || "number" != typeof s || Number.isNaN(s) || (t.priority = r * (1 + Math.log10(1 + 10 / Math.max(Date.now() - s, 864e5))))
                }
                return {
                    ...e,
                    [a]: t
                }
            })
        }, [m, h]), x = (0, t.useMemo)(() => {
            if (null == i ? void 0 : i.groups) return null == i ? void 0 : i.groups;
            if (null === d) return [];
            try {
                return "string" == typeof d ? JSON.parse(d) : d
            } catch (e) {
                return []
            }
        }, [d, null == i ? void 0 : i.groups]), _ = (0, t.useMemo)(() => {
            var e;
            return f && null != (e = x.find(e => {
                let {
                    id: a
                } = e;
                return a === f
            })) ? e : null
        }, [f, x]);
        (0, t.useEffect)(() => {
            (null == n ? void 0 : n.id) && (null == i ? void 0 : i.groups) && !l && g(null == i ? void 0 : i.groups)
        }, [null == i ? void 0 : i.groups, x, l, g, null == n ? void 0 : n.id]);
        let k = (0, t.useMemo)(() => ({
            groups: x,
            currentGroup: _,
            groupData: p,
            isFetched: !l && !!(null == n ? void 0 : n.id),
            refreshGroups: c,
            setCurrentGroup: v
        }), [_, p, x, l, c, v, null == n ? void 0 : n.id]);
        return (0, a.jsx)(b.Provider, {
            value: k,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, t.useContext)(b);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, t.useContext)(b);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 127792, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/fadf6bf6d993be27303a59803a17d15c24ba1757/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 737420, 706386, e => {
    "use strict";
    var a = e.i(197649),
        t = e.i(416340);

    function r(e) {
        let {
            className: r
        } = e;
        return t.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, a.default)("block", r),
            style: {
                marginTop: -1
            }
        }, t.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, r], 706386);
    var s = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: o,
            hasBeak: n = !0,
            title: i,
            description: l,
            ariaLabel: c,
            delayDurationMs: d = 500,
            children: u,
            open: b,
            onOpenChange: g,
            contentClassName: f
        } = e, [m, p] = o.split("-"), h = null != c ? c : "string" == typeof i && null == l ? i : void 0;
        return t.createElement(s.Provider, {
            delayDuration: d
        }, t.createElement(s.Root, {
            open: b,
            onOpenChange: g
        }, u, t.createElement(s.Portal, null, t.createElement(s.Content, {
            side: m,
            align: p,
            "aria-label": h,
            className: (0, a.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
            sideOffset: 5
        }, n && t.createElement(s.Arrow, {
            asChild: !0
        }, t.createElement(r, {
            className: "content-[var(--inverse-surface-0)]"
        })), t.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, t.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, i), l && t.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, l))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: a,
            asChild: r,
            className: o
        } = e;
        return t.createElement(s.Trigger, {
            asChild: r,
            className: o
        }, a)
    }], 737420)
}, 514455, e => {
    "use strict";
    var a = e.i(865800),
        t = e.i(416340),
        r = e.i(614515),
        s = e.i(993807),
        o = e.i(962560),
        n = e.i(273589),
        i = e.i(42569),
        l = e.i(696180),
        c = e.i(221628),
        d = e.i(972455),
        u = e.i(963320);

    function b(e) {
        return (0, n.g)("MuiAlertTitle", e)
    }(0, l.g)("MuiAlertTitle", ["root"]);
    let g = ["className"],
        f = (0, i.s)(d.T, {
            name: "MuiAlertTitle",
            slot: "Root",
            overridesResolver: (e, a) => a.root
        })(e => {
            let {
                theme: a
            } = e;
            return {
                fontWeight: a.typography.fontWeightMedium,
                marginTop: -2
            }
        }),
        m = t.forwardRef(function(e, a) {
            let t = (0, u.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: r
                } = t,
                s = (0, n._)(t, g),
                l = (e => {
                    let {
                        classes: a
                    } = e;
                    return (0, i.a)({
                        root: ["root"]
                    }, b, a)
                })(t);
            return (0, c.jsx)(f, (0, o._)({
                gutterBottom: !0,
                component: "div",
                ownerState: t,
                ref: a,
                className: (0, i.c)(l.root, r)
            }, s))
        });
    var p = (0, r.default)({
            name: "AlertTitle"
        })(function(e) {
            return {
                root: (0, a._)((0, a._)({}, e.typography.alertTitle), {
                    margin: "-1px 0"
                })
            }
        }),
        h = (0, t.forwardRef)(function(e, r) {
            var o = e.classes,
                n = e.className,
                i = (0, a.a)(e, ["classes", "className"]),
                l = p(void 0, {
                    props: {
                        classes: (0, s.default)(o, n)
                    }
                });
            return t.default.createElement(m, (0, a._)({}, i, {
                classes: l.classes,
                ref: r
            }))
        });
    e.s(["AlertTitle", 0, h], 514455)
}, 27281, e => {
    "use strict";
    var a = e.i(437272);
    e.s(["NavigateNextIcon", () => a.N])
}, 854705, e => {
    "use strict";
    var a = e.i(865800),
        t = e.i(416340),
        r = e.i(614515),
        s = e.i(993807),
        o = e.i(696180),
        n = e.i(273589),
        i = e.i(962560),
        l = e.i(42569),
        c = e.i(576881),
        d = e.i(751498),
        u = e.i(221628),
        b = e.i(219224),
        g = e.i(963320),
        f = e.i(275966);
    e.i(197094);
    var m = (0, d.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        p = (0, d.c)((0, u.jsx)("path", {
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
                theme: a,
                ownerState: t
            } = e;
            return (0, i._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: a.transitions.create("transform", {
                    easing: a.transitions.easing.easeIn,
                    duration: a.transitions.duration.shortest
                })
            }, t.checked && {
                transform: "scale(1)",
                transition: a.transitions.create("transform", {
                    easing: a.transitions.easing.easeOut,
                    duration: a.transitions.duration.shortest
                })
            })
        });

    function _(e) {
        let {
            checked: a = !1,
            classes: t = {},
            fontSize: r
        } = e, s = (0, i._)({}, e, {
            checked: a
        });
        return (0, u.jsxs)(h, {
            className: t.root,
            ownerState: s,
            children: [(0, u.jsx)(v, {
                fontSize: r,
                className: t.background,
                ownerState: s
            }), (0, u.jsx)(x, {
                fontSize: r,
                className: t.dot,
                ownerState: s
            })]
        })
    }

    function k(e) {
        return (0, n.g)("MuiRadio", e)
    }
    var C = (0, o.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let y = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, l.s)(c.S, {
            shouldForwardProp: e => (0, l.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, a) => {
                let {
                    ownerState: t
                } = e;
                return [a.root, "medium" !== t.size && a["size".concat((0, n.a)(t.size))], a["color".concat((0, n.a)(t.color))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: t
            } = e;
            return (0, i._)({
                color: (a.vars || a).palette.text.secondary
            }, !t.disableRipple && {
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat("default" === t.color ? a.vars.palette.action.activeChannel : a.vars.palette[t.color].mainChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, n.b)("default" === t.color ? a.palette.action.active : a.palette[t.color].main, a.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== t.color && {
                ["&.".concat(C.checked)]: {
                    color: (a.vars || a).palette[t.color].main
                }
            }, {
                ["&.".concat(C.disabled)]: {
                    color: (a.vars || a).palette.action.disabled
                }
            })
        }),
        w = (0, u.jsx)(_, {
            checked: !0
        }),
        E = (0, u.jsx)(_, {}),
        P = t.forwardRef(function(e, a) {
            var r, s, o, c;
            let d = (0, g.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: m,
                    checkedIcon: p = w,
                    color: h = "primary",
                    icon: v = E,
                    name: x,
                    onChange: _,
                    size: C = "medium",
                    className: P
                } = d,
                q = (0, n._)(d, y),
                A = (0, i._)({}, d, {
                    color: h,
                    size: C
                }),
                I = (e => {
                    let {
                        classes: a,
                        color: t,
                        size: r
                    } = e, s = {
                        root: ["root", "color".concat((0, n.a)(t)), "medium" !== r && "size".concat((0, n.a)(r))]
                    };
                    return (0, i._)({}, a, (0, l.a)(s, k, a))
                })(A),
                U = t.useContext(b.R),
                T = m,
                H = (0, f.c)(_, U && U.onChange),
                j = x;
            return U && (void 0 === T && (o = U.value, T = "object" == typeof(c = d.value) && null !== c ? o === c : String(o) === String(c)), void 0 === j && (j = U.name)), (0, u.jsx)(S, (0, i._)({
                type: "radio",
                icon: t.cloneElement(v, {
                    fontSize: null != (r = E.props.fontSize) ? r : C
                }),
                checkedIcon: t.cloneElement(p, {
                    fontSize: null != (s = w.props.fontSize) ? s : C
                }),
                ownerState: A,
                classes: I,
                name: j,
                checked: T,
                onChange: H,
                ref: a,
                className: (0, l.c)(I.root, P)
            }, q))
        });
    var q = (0, r.default)({
            name: "Radio"
        })(function(e) {
            var a, t;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((a = {
                    color: e.palette.content.muted
                })["&.".concat(C.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, a),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((t = {
                    color: e.palette.states.disabled
                })["&.".concat(C.colorPrimary, ".").concat(C.checked)] = {
                    color: e.palette.states.disabled
                }, t)
            }
        }),
        A = (0, t.forwardRef)(function(e, r) {
            var o = e.classes,
                n = e.color,
                i = e.inputProps,
                l = e["aria-label"],
                c = e.className,
                d = (0, a.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = q(void 0, {
                    props: {
                        classes: (0, s.default)(o, c)
                    }
                });
            return t.default.createElement(P, (0, a._)({}, d, {
                classes: u.classes,
                color: void 0 === n ? "primary" : n,
                ref: r,
                inputProps: (0, a._)({
                    "aria-label": l
                }, i)
            }))
        });
    e.s(["Radio", 0, A], 854705)
}, 219224, e => {
    "use strict";
    let a = e.i(416340).createContext(void 0);
    e.s(["R", 0, a])
}, 196945, e => {
    "use strict";
    var a = e.i(865800),
        t = e.i(416340),
        r = e.i(323356);
    e.i(221628), e.i(149285);
    var s = (0, t.createContext)({
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
        var o, n, i, l, c = e.children,
            d = (0, a.a)(e, ["children"]),
            u = (0, t.useRef)(null),
            b = (0, t.useState)(!1),
            g = b[0],
            f = b[1],
            m = (0, t.useState)([]),
            p = m[0],
            h = m[1],
            v = (0, t.useCallback)(function(e, t) {
                void 0 === e && (e = {}), void 0 === t && (t = function() {
                    return !0
                }), h(function(r) {
                    return (0, a.b)((0, a.b)([], r, !0), [{
                        props: e,
                        shouldClose: t
                    }], !1)
                })
            }, [h]),
            x = (0, t.useCallback)(function() {
                f(!1)
            }, [f]);
        (0, t.useEffect)(function() {
            p.length > 0 && f(!0)
        }, [p.length]);
        var _ = (0, t.useMemo)(function() {
            return {
                ref: u,
                enqueue: v,
                close: x
            }
        }, [x, v]);
        return t.default.createElement(t.default.Fragment, null, t.default.createElement(s.Provider, {
            value: _
        }, c), t.default.createElement(r.S, (0, a._)({}, (null == (o = p[0]) ? void 0 : o.props) || {}, d, {
            TransitionProps: (0, a._)((0, a._)({}, (null == (i = null == (n = p[0]) ? void 0 : n.props) ? void 0 : i.TransitionProps) || {}), {
                onExited: function(e) {
                    var t, r, s, o;
                    h(function(e) {
                        var t = e.slice(1);
                        return (0, a.b)([], t, !0)
                    }), (null == (r = null == (t = p[0]) ? void 0 : t.props.TransitionProps) ? void 0 : r.onExited) && (null == (o = null == (s = p[0]) ? void 0 : s.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, a) {
                var t, r, s;
                (null == (t = p[0]) ? void 0 : t.shouldClose(a)) && f(!1), (null == (r = p[0]) ? void 0 : r.props.onClose) && (null == (s = p[0]) || s.props.onClose(e, a))
            },
            open: g
        }), null == (l = p[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, t.useContext)(s);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 774807, e => {
    "use strict";
    var a = e.i(833172);
    e.s(["ArrowDownwardIcon", () => a.ArrowDownward])
}, 558826, e => {
    "use strict";
    var a = e.i(833172);
    e.s(["ArrowUpwardIcon", () => a.ArrowUpward])
}, 93235, e => {
    "use strict";
    var a = e.i(833172);
    e.s(["NavigateBeforeIcon", () => a.NavigateBefore])
}, 169923, e => {
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
    var a = e.i(416340);
    let t = (0, a.createContext)(null),
        r = [],
        s = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var n;
        let {
            children: i,
            unifiedLogger: l,
            pageLoggerConfig: c,
            path: d
        } = e, u = null != (n = null == c ? void 0 : c.tags) ? n : r, b = null == c ? void 0 : c.rosId, g = (0, a.useMemo)(() => ({
            tags: u,
            rosId: b,
            path: d
        }), [u, b, d]), f = (0, a.useRef)(g), m = (0, a.useRef)(g);
        (0, a.useLayoutEffect)(() => {
            m.current = g, void 0 === f.current.path && void 0 !== g.path && (f.current = {
                ...f.current,
                path: g.path
            })
        }, [g]), (0, a.useLayoutEffect)(() => {
            let e = e => {
                var a;
                let t, r = (t = null == (a = e.parameters) ? void 0 : a.metricName, "webvitals" === e.eventType && void 0 !== t && o.has(t)) ? f.current : m.current;
                void 0 !== r.path && (e.parameters = {
                    ...e.parameters,
                    path: r.path
                }), r.tags.forEach(a => e.addTag(a)), void 0 !== r.rosId && e.addTag("owner: ".concat(r.rosId))
            };
            return s.forEach(a => {
                l.events.on(a, e)
            }), () => {
                s.forEach(a => {
                    l.events.off(a, e)
                })
            }
        }, [l]);
        let p = (0, a.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: g
        }), [l, g]);
        return a.default.createElement(t.Provider, {
            value: p
        }, i)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, a.useContext)(t);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=1f6b1e77-97c9-f975-b6f2-5616242e1e30
//# sourceMappingURL=1ytjwh7owqcc4.js.map