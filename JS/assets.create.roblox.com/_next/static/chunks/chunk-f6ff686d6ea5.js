;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "bb706ca7-fcb7-3616-bbd7-30ec41acff79")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 358763, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(296380);
    let r = () => {};
    e.s(["default", 0, function(e, s) {
        let {
            debounceDelay: o,
            intersectionObserverThreshold: c,
            resetOncePer: n
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, i = (0, t.useRef)(!1), l = (0, t.useCallback)(e => {
            !e || i.current || (i.current = !0, s())
        }, [s]), [d] = (0, a.default)(l, null != o ? o : 250), u = (0, t.useCallback)(e => {
            let [t] = e;
            d(t.isIntersecting)
        }, [d]), f = null != n ? n : "instance";
        (0, t.useMemo)(() => {
            "callback" === f && (i.current = !1)
        }, [s]), (0, t.useEffect)(() => {
            if (!e.current) return r;
            let t = new IntersectionObserver(u, {
                threshold: null != c ? c : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, c, u])
    }])
}, 605050, e => {
    "use strict";
    var t = e.i(495662);
    let a = (0, e.i(272593).createClientConfiguration)("core-content", "bedev2"),
        r = new t.CoreContentApi(a);
    e.s(["default", 0, r])
}, 29929, e => {
    "use strict";
    let t;
    var a, r, s, o, c, n, i, l, d, u, f, b, g, m, p, h, v, x, _, k, C = e.i(650502),
        y = e.i(864392),
        S = ((a = {}).ShowVrDeviceOption = "showVrDeviceOption", a.ShowIXPClientTest = "showIXPClientTest", a.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", a.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", a.EnableIA = "enableIA", a.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", a.EnableDevexEarnedRobux = "enableDevexEarnedRobux", a.EnableExperienceGenre = "enableExperienceGenre", a.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", a.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", a.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", a.EnableEventRequestFeaturing = "enableEventRequestFeaturing", a.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", a),
        w = ((r = {}).EnableRightsManager = "enableRightsManager", r.EnableBulkFiling = "enableBulkFiling", r.EnableOnDemandSearch = "enableOnDemandSearch", r.EnableEditRegistration = "enableEditRegistration", r.EnableImageSearch = "enableImageSearch", r.EnableClaimsAgainstMe = "enableClaimsAgainstMe", r.EnableGenAiOptOut = "enableGenAiOptOut", r.EnableInExperienceIpReporting = "enableInExperienceIpReporting", r.EnableIpContentSearch = "enableIpContentSearch", r.EnableTrademark = "enableTrademark", r),
        E = ((s = {}).EnableIPRecommender = "enableIPRecommender", s),
        P = ((o = P || {}).EnableVideoOnboarding = "enableVideoOnboarding", o),
        q = ((c = q || {}).EnableSignalLookup = "enableSignalLookup", c.AlwaysShow = "alwaysShow", c),
        A = A || {},
        I = ((n = I || {}).mobileVariant = "mobileVariant", n),
        U = U || {},
        T = ((i = {}).ShowEditInStudioButton = "showEditInStudioButton", i.EnableCreationsNavLayout = "enableCreationsIPNavLayout", i),
        H = ((l = {}).EnableBulkAssetUpload = "enableBulkAssetUpload", l),
        j = ((d = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", d.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", d.EnableAudienceControls = "enableAudienceControls", d.EnableNewBadgePattern = "enableNewBadgePattern", d.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", d.EnableAudiencesReplacement = "enableAudiencesReplacement", d),
        R = ((u = {}).EnableTalentHubV2 = "enableTalentHubV2", u.EnableTalentHubV2M2 = "enableTalentHubV2M2", u),
        z = ((f = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", f),
        M = ((b = M || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", b),
        N = ((g = N || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", g),
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
        let t = (0, C.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(G[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let F = (0, y.default)(V);
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
    }, t = [], e.s(["ContentSuitabilityQuestionnaireParameters", () => D, "CreatorHubCreationsPermissionParameters", () => j, "CreatorHubPublishingParameters", () => H, "IXPLayers", () => O, "LicenseManagerParameters", () => E, "TalentHubParameters", () => R, "fetchIXPParametersForCurrentUser", 0, F], 29929)
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
        a = e.i(199834),
        r = e.i(706442),
        s = e.i(776344),
        o = e.i(462863),
        c = e.i(343885),
        n = e.i(609794),
        i = e.i(57561),
        l = e.i(509747),
        d = e.i(475555),
        u = e.i(538302),
        f = e.i(387707),
        b = e.i(262135),
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
        et = e.i(962803),
        ea = e.i(914865),
        er = e.i(818392),
        es = e.i(173034),
        eo = e.i(780078),
        ec = e.i(756885),
        en = e.i(260123),
        ei = e.i(507792),
        el = e.i(850994);
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
            light: ei.default,
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
            light: l.default,
            dark: i.default
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
            light: el.default,
            dark: ec.default
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
            light: b.default,
            dark: f.default
        },
        apiKeys: {
            light: n.default,
            dark: c.default
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
            light: M.default,
            dark: z.default
        },
        barGraph: {
            light: m.default,
            dark: g.default
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
    let eu = "".concat("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/assets", "/spot_illustrations"),
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
    let eb = (0, r.makeStyles)()(() => ({
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
            } = e, s = a && ed[a];
            if (s) return (0, t.jsx)(o.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let c = a ? ef[r][a] : null;
            return c && (0, t.jsx)("img", {
                height: "large" === r ? 240 : 96,
                width: "large" === r ? 320 : 96,
                src: c,
                alt: a
            })
        },
        em = e => {
            let {
                children: r,
                title: o,
                description: c,
                size: n = "large",
                illustration: i
            } = e, {
                classes: {
                    smallContainer: l,
                    largeContainer: d,
                    smallText: u,
                    largeText: f
                },
                cx: b
            } = eb();
            return (0, t.jsxs)(s.default, {
                classes: {
                    root: b({
                        [l]: "small" === n,
                        [d]: "large" === n
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(eg, {
                    illustration: i,
                    size: n
                }), (0, t.jsxs)(s.default, {
                    classes: {
                        root: b({
                            [u]: "small" === n,
                            [f]: "large" === n
                        })
                    },
                    flexDirection: "column",
                    alignItems: "center",
                    children: [(0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        variant: "h4",
                        color: "primary",
                        children: o
                    }), c && (0, t.jsx)(a.Typography, {
                        textAlign: "center",
                        color: "secondary",
                        children: c
                    })]
                }), r]
            })
        };
    em.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, eg, "default", 0, em], 493924)
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let a = (e, a) => {
        let r = (0, t.useRef)(null),
            s = (0, t.useCallback)(() => {
                null !== r.current && (clearTimeout(r.current), r.current = null)
            }, [r]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, o = Array(t), c = 0; c < t; c++) o[c] = arguments[c];
            s(), r.current = window.setTimeout(() => {
                e(...o), r.current = null
            }, a)
        }, [e, a, s]), s, r]
    };
    e.s(["default", 0, a, "useDebouncedFunction", 0, a])
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(237401);
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
                c = null != (a = s.query) ? a : {},
                n = {
                    ...c
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let a = t[e];
                null == a ? delete n[e] : Array.isArray(a) ? n[e] = a.map(e => e.toString()) : n[e] = a.toString()
            }), Array.from(new Set([...Object.keys(c), ...Object.keys(n)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let a = Array.isArray(e) ? e : [e],
                    r = Array.isArray(t) ? t : [t];
                return a.length === r.length && a.every((e, t) => e === r[t])
            })(c[e], n[e])) || (o.skipHistory ? s.replace({
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
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["useQueryParams", () => t.default])
}, 191685, e => {
    "use strict";
    var t = e.i(17829);
    let a = "https://www.".concat("roblox.com"),
        r = "https://advertise.".concat("roblox.com"),
        s = e => "".concat(a, "/groups/").concat(e),
        o = e => "".concat(a, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, r, "getAccountSecurityUrl", 0, () => "".concat(a, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(a, "/my/account#!/info"), "getAdvertiseAssetUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=Asset"), "getAdvertisePassUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=GamePass"), "getAppealsPortalUrl", 0, () => "".concat(a, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(a, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(a, "/bundles/").concat(e), "getCatalogUrl", 0, e => "".concat(a, "/catalog/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(a, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(a, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, a) => e === t.default.Group ? s(a) : o(a), "getEventUrl", 0, e => "".concat(a, "/events/").concat(e), "getFriendsUrl", 0, e => "".concat(a, "/users/").concat(e, "/friends#!/friends"), "getGameDetailsUrl", 0, e => "".concat(a, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(a, "/game-pass/").concat(e), "getGroupUrl", 0, s, "getHomeUrl", 0, () => "".concat(a, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(a, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(a, "/transactions"), "getLookUrl", 0, e => "".concat(a, "/looks/").concat(e), "getSponsorAvatarItemsUrl", 0, () => "".concat(a, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(r, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(r, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(a, "/support"), "getTermsUrl", 0, () => "".concat(a, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(a, "/transactions"), "getUrl", 0, () => a, "getUserUrl", 0, o])
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
        c = e.i(279149),
        n = e.i(602635),
        i = e.i(814975);
    let l = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new c.GroupsApi(l),
        u = function() {
            let {
                user: e
            } = (0, i.useAuthentication)();
            return (0, o.useQuery)({
                queryKey: n.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: c.GroupListSurface.CreatorHub
                    }, d.groupsListGroups(e)
                }
            })
        },
        f = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: c
        } = (0, r.useRobloxAuthentication)(), {
            data: n,
            isLoading: i,
            refetch: l
        } = u(), [d, b] = (0, s.useLocalStorage)("creatorHubGroups.".concat(null == c ? void 0 : c.id), null), [g, m] = (0, s.useLocalStorage)("creatorHubGroup.".concat(null == c ? void 0 : c.id), null), [p, h] = (0, s.useLocalStorage)("creatorHubGroupData.".concat(null == c ? void 0 : c.id), {}), v = (0, a.useCallback)(e => {
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
            if (null === d) return [];
            try {
                return "string" == typeof d ? JSON.parse(d) : d
            } catch (e) {
                return []
            }
        }, [d, null == n ? void 0 : n.groups]), _ = (0, a.useMemo)(() => {
            var e;
            return g && null != (e = x.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, x]);
        (0, a.useEffect)(() => {
            (null == c ? void 0 : c.id) && (null == n ? void 0 : n.groups) && !i && b(null == n ? void 0 : n.groups)
        }, [null == n ? void 0 : n.groups, x, i, b, null == c ? void 0 : c.id]);
        let k = (0, a.useMemo)(() => ({
            groups: x,
            currentGroup: _,
            groupData: p,
            isFetched: !i && !!(null == c ? void 0 : c.id),
            refreshGroups: l,
            setCurrentGroup: v
        }), [_, p, x, i, l, v, null == c ? void 0 : c.id]);
        return (0, t.jsx)(f.Provider, {
            value: k,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(f);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(f);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 127792, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 858517, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 343885, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 609794, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 57561, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 509747, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 475555, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 538302, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 387707, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 262135, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 240731, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 956923, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 84362, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 214665, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 455506, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 918290, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 716933, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 347319, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 543657, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 850412, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 103329, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 692706, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 405654, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 891409, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 758060, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 710005, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 495550, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 320429, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 106017, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 821978, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 766389, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 374717, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 756733, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 251697, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 411118, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 839596, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 729733, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 66217, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 148865, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 45512, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 706478, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 166181, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 37474, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 147189, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 105897, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 123524, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 752739, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 331105, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 564908, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 663412, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 215887, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 962803, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 914865, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 818392, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 173034, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 780078, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 756885, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 260123, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 507792, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 850994, e => {
    e.q("https://assets.create.roblox.com/0d9fdcf3b3b5acaf0d07c5244cf7bf8607b48798/_next/static/media/video_light.1fum3vlxctp7w.svg")
}, 737420, 706386, e => {
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
    e.s(["Beak", 0, r], 706386);
    var s = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: o,
            hasBeak: c = !0,
            title: n,
            description: i,
            ariaLabel: l,
            delayDurationMs: d = 500,
            children: u,
            open: f,
            onOpenChange: b,
            contentClassName: g
        } = e, [m, p] = o.split("-"), h = null != l ? l : "string" == typeof n && null == i ? n : void 0;
        return a.createElement(s.Provider, {
            delayDuration: d
        }, a.createElement(s.Root, {
            open: f,
            onOpenChange: b
        }, u, a.createElement(s.Portal, null, a.createElement(s.Content, {
            side: m,
            align: p,
            "aria-label": h,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", g),
            sideOffset: 5
        }, c && a.createElement(s.Arrow, {
            asChild: !0
        }, a.createElement(r, {
            className: "content-[var(--inverse-surface-0)]"
        })), a.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, a.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, n), i && a.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, i))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: r,
            className: o
        } = e;
        return a.createElement(s.Trigger, {
            asChild: r,
            className: o
        }, t)
    }], 737420)
}, 514455, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        r = e.i(614515),
        s = e.i(993807),
        o = e.i(962560),
        c = e.i(273589),
        n = e.i(42569),
        i = e.i(696180),
        l = e.i(221628),
        d = e.i(972455),
        u = e.i(963320);

    function f(e) {
        return (0, c.g)("MuiAlertTitle", e)
    }(0, i.g)("MuiAlertTitle", ["root"]);
    let b = ["className"],
        g = (0, n.s)(d.T, {
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
            let a = (0, u.u)({
                    props: e,
                    name: "MuiAlertTitle"
                }),
                {
                    className: r
                } = a,
                s = (0, c._)(a, b),
                i = (e => {
                    let {
                        classes: t
                    } = e;
                    return (0, n.a)({
                        root: ["root"]
                    }, f, t)
                })(a);
            return (0, l.jsx)(g, (0, o._)({
                gutterBottom: !0,
                component: "div",
                ownerState: a,
                ref: t,
                className: (0, n.c)(i.root, r)
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
                c = e.className,
                n = (0, t.a)(e, ["classes", "className"]),
                i = p(void 0, {
                    props: {
                        classes: (0, s.default)(o, c)
                    }
                });
            return a.default.createElement(m, (0, t._)({}, n, {
                classes: i.classes,
                ref: r
            }))
        });
    e.s(["AlertTitle", 0, h], 514455)
}, 27281, e => {
    "use strict";
    var t = e.i(437272);
    e.s(["NavigateNextIcon", () => t.N])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        r = e.i(614515),
        s = e.i(993807),
        o = e.i(696180),
        c = e.i(273589),
        n = e.i(962560),
        i = e.i(42569),
        l = e.i(576881),
        d = e.i(751498),
        u = e.i(221628),
        f = e.i(219224),
        b = e.i(963320),
        g = e.i(275966);
    e.i(197094);
    var m = (0, d.c)((0, u.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        p = (0, d.c)((0, u.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let h = (0, i.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: i.r
        })({
            position: "relative",
            display: "flex"
        }),
        v = (0, i.s)(m, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        x = (0, i.s)(p, {
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
        return (0, u.jsxs)(h, {
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
        return (0, c.g)("MuiRadio", e)
    }
    var C = (0, o.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let y = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        S = (0, i.s)(l.S, {
            shouldForwardProp: e => (0, i.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, c.a)(a.size))], t["color".concat((0, c.a)(a.color))]]
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
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, c.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
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
        w = (0, u.jsx)(_, {
            checked: !0
        }),
        E = (0, u.jsx)(_, {}),
        P = a.forwardRef(function(e, t) {
            var r, s, o, l;
            let d = (0, b.u)({
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
                q = (0, c._)(d, y),
                A = (0, n._)({}, d, {
                    color: h,
                    size: C
                }),
                I = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: r
                    } = e, s = {
                        root: ["root", "color".concat((0, c.a)(a)), "medium" !== r && "size".concat((0, c.a)(r))]
                    };
                    return (0, n._)({}, t, (0, i.a)(s, k, t))
                })(A),
                U = a.useContext(f.R),
                T = m,
                H = (0, g.c)(_, U && U.onChange),
                j = x;
            return U && (void 0 === T && (o = U.value, T = "object" == typeof(l = d.value) && null !== l ? o === l : String(o) === String(l)), void 0 === j && (j = U.name)), (0, u.jsx)(S, (0, n._)({
                type: "radio",
                icon: a.cloneElement(v, {
                    fontSize: null != (r = E.props.fontSize) ? r : C
                }),
                checkedIcon: a.cloneElement(p, {
                    fontSize: null != (s = w.props.fontSize) ? s : C
                }),
                ownerState: A,
                classes: I,
                name: j,
                checked: T,
                onChange: H,
                ref: t,
                className: (0, i.c)(I.root, P)
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
        A = (0, a.forwardRef)(function(e, r) {
            var o = e.classes,
                c = e.color,
                n = e.inputProps,
                i = e["aria-label"],
                l = e.className,
                d = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                u = q(void 0, {
                    props: {
                        classes: (0, s.default)(o, l)
                    }
                });
            return a.default.createElement(P, (0, t._)({}, d, {
                classes: u.classes,
                color: void 0 === c ? "primary" : c,
                ref: r,
                inputProps: (0, t._)({
                    "aria-label": i
                }, n)
            }))
        });
    e.s(["Radio", 0, A], 854705)
}, 219224, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        r = e.i(323356);
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
        var o, c, n, i, l = e.children,
            d = (0, t.a)(e, ["children"]),
            u = (0, a.useRef)(null),
            f = (0, a.useState)(!1),
            b = f[0],
            g = f[1],
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
                ref: u,
                enqueue: v,
                close: x
            }
        }, [x, v]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(s.Provider, {
            value: _
        }, l), a.default.createElement(r.S, (0, t._)({}, (null == (o = p[0]) ? void 0 : o.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (n = null == (c = p[0]) ? void 0 : c.props) ? void 0 : n.TransitionProps) || {}), {
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
            open: b
        }), null == (i = p[0]) ? void 0 : i.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(s);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 774807, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowDownwardIcon", () => t.ArrowDownward])
}, 558826, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["ArrowUpwardIcon", () => t.ArrowUpward])
}, 93235, e => {
    "use strict";
    var t = e.i(833172);
    e.s(["NavigateBeforeIcon", () => t.NavigateBefore])
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
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        r = [],
        s = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var c;
        let {
            children: n,
            unifiedLogger: i,
            pageLoggerConfig: l,
            path: d
        } = e, u = null != (c = null == l ? void 0 : l.tags) ? c : r, f = null == l ? void 0 : l.rosId, b = (0, t.useMemo)(() => ({
            tags: u,
            rosId: f,
            path: d
        }), [u, f, d]), g = (0, t.useRef)(b), m = (0, t.useRef)(b);
        (0, t.useLayoutEffect)(() => {
            m.current = b, void 0 === g.current.path && void 0 !== b.path && (g.current = {
                ...g.current,
                path: b.path
            })
        }, [b]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, r = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && o.has(a)) ? g.current : m.current;
                void 0 !== r.path && (e.parameters = {
                    ...e.parameters,
                    path: r.path
                }), r.tags.forEach(t => e.addTag(t)), void 0 !== r.rosId && e.addTag("owner: ".concat(r.rosId))
            };
            return s.forEach(t => {
                i.events.on(t, e)
            }), () => {
                s.forEach(t => {
                    i.events.off(t, e)
                })
            }
        }, [i]);
        let p = (0, t.useMemo)(() => ({
            unifiedLogger: i,
            pageContext: b
        }), [i, b]);
        return t.default.createElement(a.Provider, {
            value: p
        }, n)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=bb706ca7-fcb7-3616-bbd7-30ec41acff79
//# sourceMappingURL=217isn0190yq0.js.map