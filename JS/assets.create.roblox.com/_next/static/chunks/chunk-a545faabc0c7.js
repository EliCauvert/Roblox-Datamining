;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f1870943-e46c-1ba3-6c0b-3b5b80d6a8f6")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 29929, e => {
    "use strict";
    var t, a, r, s, o, i, n, l, c, d, u, g, m, p, b, h, v, f, x = e.i(650502),
        _ = e.i(864392),
        y = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        k = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        C = ((r = {}).EnableIPRecommender = "enableIPRecommender", r.EnableContentBadges = "enableContentBadges", r),
        w = ((s = w || {}).EnableVideoOnboarding = "enableVideoOnboarding", s),
        S = ((o = S || {}).LicenseSwimlanePlacement = "licenseSwimlanePlacement", o),
        q = ((i = q || {}).EnableSignalLookup = "enableSignalLookup", i.AlwaysShow = "alwaysShow", i),
        E = E || {},
        P = ((n = P || {}).mobileVariant = "mobileVariant", n),
        U = U || {},
        H = ((l = {}).ShowEditInStudioButton = "showEditInStudioButton", l.EnableCreationsNavLayout = "enableCreationsIPNavLayout", l),
        A = ((c = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", c),
        I = ((d = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", d.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", d.EnableAudienceControls = "enableAudienceControls", d.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", d.EnableAudiencesReplacement = "enableAudiencesReplacement", d),
        T = ((u = {}).EnableTalentHubV2 = "enableTalentHubV2", u.EnableTalentHubV2M2 = "enableTalentHubV2M2", u),
        R = ((g = R || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", g),
        G = ((m = G || {}).GameAppealsEnabled = "gameAppealsEnabled", m),
        j = ((p = j || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", p),
        L = ((b = L || {}).EnableChangelogCMS = "enableChangelogCMS", b),
        O = ((h = {}).CreatorDashboard = "CreatorDashboard", h.CreatorHubHomePage = "CreatorHub.HomePage.UserId", h.CreatorHomeDiscovery = "CreatorHomeDiscovery", h.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", h.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", h.CreatorHubLandingPage = "CreatorHub.LandingPage", h.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", h.CreatorHubNavigation = "CreatorHub.Navigation", h.CreatorHubNavigationUser = "CreatorHub.Navigation.User", h.CreatorHubPublishing = "CreatorHub.Publishing.UserId", h.LicenseManager = "CreatorDashboard.LicenseManager", h.RightsManager = "CreatorDashboard.RightsManager", h.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", h.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", h.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", h.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", h.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", h.CreatorHubChangelog = "CreatorHub.Changelog", h.TalentHub = "CreatorHub.TalentHub.UserId", h),
        M = ((v = M || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", v.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", v.ShowSecrets = "showSecrets", v.ShowQualitySignalCards = "showQualitySignalCards", v);
    let D = {
        CreatorDashboard: y,
        "CreatorHub.HomePage.UserId": w,
        CreatorHomeDiscovery: S,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": q,
        "CreatorHub.LandingPage": E,
        "CreatorHub.LandingPage.UserId": P,
        "CreatorHub.Navigation": U,
        "CreatorHub.Navigation.User": H,
        "CreatorHub.Publishing.UserId": A,
        "CreatorDashboard.LicenseManager": C,
        "CreatorDashboard.RightsManager": k,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((f = {}).SearchVersion = "searchVersion", f),
        "CreatorHub.Creations.Permission": I,
        "CreatorHub.ExperienceWebhooks.UserId": R,
        "CreatorHub.GameAppeals.UserId": G,
        "CreatorHub.HomePage.ExperienceTile.UserId": j,
        "CreatorHub.Changelog": L,
        "CreatorHub.TalentHub.UserId": T
    };
    async function F(e) {
        let t = (0, x.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(D[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let z = (0, _.default)(F);
    e.s(["CreatorHubCreationsPermissionParameters", () => I, "CreatorHubPublishingParameters", () => A, "IXPLayers", () => O, "LicenseManagerParameters", () => C, "TalentHubParameters", () => T, "fetchIXPParametersForCurrentUser", 0, z])
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
        o = e.i(462863),
        i = e.i(177244),
        n = e.i(346082),
        l = e.i(676695),
        c = e.i(551e3),
        d = e.i(265260),
        u = e.i(330351),
        g = e.i(267338),
        m = e.i(636172),
        p = e.i(508308),
        b = e.i(517406),
        h = e.i(918777),
        v = e.i(739181),
        f = e.i(381997),
        x = e.i(940530),
        _ = e.i(549779),
        y = e.i(814110),
        k = e.i(40761),
        C = e.i(155845),
        w = e.i(550425),
        S = e.i(396147),
        q = e.i(28401),
        E = e.i(464170),
        P = e.i(564751),
        U = e.i(307025),
        H = e.i(313639),
        A = e.i(147556),
        I = e.i(559061),
        T = e.i(316883),
        R = e.i(421106),
        G = e.i(597112),
        j = e.i(353483),
        L = e.i(686034),
        O = e.i(519715),
        M = e.i(502010),
        D = e.i(774889),
        F = e.i(801362),
        z = e.i(956159),
        V = e.i(149660),
        N = e.i(889703),
        B = e.i(414235),
        Q = e.i(118756),
        K = e.i(904302),
        W = e.i(178653),
        X = e.i(234503),
        J = e.i(638331),
        Y = e.i(775937),
        Z = e.i(272258),
        $ = e.i(671182),
        ee = e.i(335605),
        et = e.i(742089),
        ea = e.i(599094),
        er = e.i(939457),
        es = e.i(867987),
        eo = e.i(75599),
        ei = e.i(836849),
        en = e.i(956436),
        el = e.i(798641),
        ec = e.i(374526),
        ed = e.i(602235),
        eu = e.i(684112),
        eg = e.i(856476),
        em = e.i(663085),
        ep = e.i(665266),
        eb = e.i(927690);
    let eh = {
        secrets: {
            light: G.default,
            dark: R.default
        },
        noPermissions: {
            light: G.default,
            dark: R.default
        },
        notifications: {
            light: K.default,
            dark: Q.default
        },
        experiences: {
            light: ep.default,
            dark: em.default
        },
        shareLinks: {
            light: er.default,
            dark: ea.default
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
            light: V.default,
            dark: z.default
        },
        plugins: {
            light: B.default,
            dark: N.default
        },
        audio: {
            light: c.default,
            dark: l.default
        },
        decals: {
            light: x.default,
            dark: f.default
        },
        images: {
            light: E.default,
            dark: q.default
        },
        videos: {
            light: eb.default,
            dark: eg.default
        },
        meshes: {
            light: F.default,
            dark: D.default
        },
        animations: {
            light: et.default,
            dark: ee.default
        },
        textDocuments: {
            light: y.default,
            dark: _.default
        },
        noUsers: {
            light: v.default,
            dark: h.default
        },
        localization: {
            light: T.default,
            dark: I.default
        },
        rightsManager: {
            light: Y.default,
            dark: J.default
        },
        tokens: {
            light: en.default,
            dark: ei.default
        },
        chart: {
            light: A.default,
            dark: H.default
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
            light: eo.default,
            dark: es.default
        },
        oAuthApps: {
            light: X.default,
            dark: W.default
        },
        makeupLooks: {
            light: L.default,
            dark: j.default
        },
        barGraph: {
            light: b.default,
            dark: p.default
        },
        leaderboard: {
            light: U.default,
            dark: P.default
        },
        findPeople: {
            light: S.default,
            dark: w.default
        },
        managedPricing: {
            light: M.default,
            dark: O.default
        },
        robux: {
            light: $.default,
            dark: Z.default
        },
        trial: {
            light: eu.default,
            dark: el.default
        },
        trialGamepass: {
            light: ed.default,
            dark: ec.default
        }
    };
    e.s(["default", 0, eh], 938429);
    let ev = "".concat("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/assets", "/spot_illustrations"),
        ef = {
            small: {
                analytics: "".concat(ev, "/small/analytics.svg"),
                animations: "".concat(ev, "/small/animations.svg"),
                audio: "".concat(ev, "/small/audio.svg"),
                audioLight: "".concat(ev, "/small/audio_light.svg"),
                audioDark: "".concat(ev, "/small/audio_dark.svg"),
                avatarItem: "".concat(ev, "/small/avatar_item.svg"),
                beginSearch: "".concat(ev, "/small/beginSearch.svg"),
                creatorStore: "".concat(ev, "/small/creator_store.svg"),
                decals: "".concat(ev, "/small/decals.svg"),
                events: "".concat(ev, "/small/events.svg"),
                experiences: "".concat(ev, "/small/experiences.svg"),
                images: "".concat(ev, "/small/images.svg"),
                meshes: "".concat(ev, "/small/meshes.svg"),
                models: "".concat(ev, "/small/models.svg"),
                plugins: "".concat(ev, "/small/plugins.svg"),
                script: "".concat(ev, "/small/script.svg"),
                song: "".concat(ev, "/small/song.svg"),
                musicNote: "".concat(ev, "/small/audio_music_note.svg"),
                noUsers: "".concat(ev, "/small/no_users.svg"),
                user: "".concat(ev, "/small/user.svg"),
                users: "".concat(ev, "/small/users.svg"),
                videos: "".concat(ev, "/small/videos.svg"),
                search: "".concat(ev, "/small/search.svg"),
                oof: "".concat(ev, "/small/oof.svg"),
                download: "".concat(ev, "/small/download.svg"),
                attributes: "".concat(ev, "/small/attributes.svg"),
                matchmakingSimulation: "".concat(ev, "/small/matchmaking_simulation.svg")
            },
            large: {
                apiKeys: "".concat(ev, "/large/api_keys.svg"),
                localization: "".concat(ev, "/large/localization.svg"),
                noPermissions: "".concat(ev, "/large/no_permissions.svg"),
                oAuthApps: "".concat(ev, "/large/oauth_apps.svg"),
                rights: "".concat(ev, "/large/rights.svg"),
                secrets: "".concat(ev, "/large/secrets.svg"),
                shareLinks: "".concat(ev, "/large/share_links.svg"),
                configurations: "".concat(ev, "/large/configurations.svg"),
                experienceConfigs: "".concat(ev, "/large/experience_configs.svg"),
                emptyExperiments: "".concat(ev, "/large/empty_experiments.svg")
            }
        };
    e.s(["default", 0, ef], 321623);
    let ex = (0, r.makeStyles)()(() => ({
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
        e_ = e => {
            let {
                illustration: a,
                size: r = "large"
            } = e, s = a && eh[a];
            if (s) return (0, t.jsx)(o.default, {
                lightSrc: s.light,
                darkSrc: s.dark,
                alt: a
            });
            let i = a ? ef[r][a] : null;
            return i && (0, t.jsx)("img", {
                height: "large" === r ? 240 : 96,
                width: "large" === r ? 320 : 96,
                src: i,
                alt: a
            })
        },
        ey = e => {
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
            } = ex();
            return (0, t.jsxs)(s.default, {
                classes: {
                    root: m({
                        [c]: "small" === n,
                        [d]: "large" === n
                    })
                },
                flexDirection: "column",
                alignItems: "center",
                children: [(0, t.jsx)(e_, {
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
    ey.displayName = "EmptyState", e.s(["EmptyStateIllustration", 0, e_, "default", 0, ey], 493924)
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
    e.s(["default", 0, function(e, o) {
        var i;
        let n = null != (i = null == o ? void 0 : o.cacheOnly) && i,
            [l, c] = (0, t.useState)(() => n ? {
                params: r(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == o ? void 0 : o.restoreInitialValueFromCache) ? r(e) : {},
                status: "initial",
                isFetched: !1
            });
        return (0, t.useEffect)(() => {
            n || (async () => {
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
}, 191685, 875075, e => {
    "use strict";
    var t = e.i(260022);
    let a = async e => Array.from(new Uint8Array(await crypto.subtle.digest("SHA-256", new TextEncoder().encode(e))), e => e.toString(16).padStart(2, "0")).join(""), r = {
        create: async e => {
            let {
                userId: t
            } = e;
            return (await a("wasm-hash-v1:".concat(t))).slice(0, 16)
        },
        verify: async (e, t) => e === await r.create(t)
    }, s = new Map([
        ["3f", r]
    ]), o = "wasmJoinId", i = async e => {
        let t = s.get("3f");
        if (!t) throw Error("No scheme registered for CURRENT_SCHEME_ID 3f");
        return "3f".concat(await t.create(e))
    };
    e.s(["WASM_HASH_PARAM", 0, o, "createWasmHash", 0, i], 875075);
    var n = e.i(17829);
    let l = "https://www.".concat("roblox.com"),
        c = "https://advertise.".concat("roblox.com"),
        d = e => "".concat(l, "/groups/").concat(e),
        u = e => "".concat(l, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, c, "BUY_ROBUX_CTX_CREATOR_HUB", 0, "creatorhub", "getAccountSecurityMethodUrl", 0, e => "".concat(l, "/my/account#!/security?display=").concat(e), "getAccountSecurityUrl", 0, () => "".concat(l, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(l, "/my/account#!/info"), "getAppealsPortalUrl", 0, () => "".concat(l, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(l, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(l, "/bundles/").concat(e), "getBuyRobuxUrl", 0, e => "".concat(l, "/upgrades/robux?ctx=").concat(encodeURIComponent(e)), "getCatalogUrl", 0, e => "".concat(l, "/catalog/").concat(e), "getCommunitiesUrl", 0, e => "".concat(l, "/communities/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(l, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(l, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, t) => e === n.default.Group ? d(t) : u(t), "getEventUrl", 0, e => "".concat(l, "/events/").concat(e), "getGameDetailsUrl", 0, e => "".concat(l, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(l, "/game-pass/").concat(e), "getGroupUrl", 0, d, "getHomeUrl", 0, () => "".concat(l, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(l, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(l, "/transactions"), "getLookUrl", 0, e => "".concat(l, "/looks/").concat(e), "getPaymentMethodsUrl", 0, e => "".concat(l, "/upgrades/paymentmethods?ap=").concat(encodeURIComponent(e)), "getPlayOnWebUrl", 0, (e, a) => "".concat((0, t.resolveUrl)("playRobloxUrl", "production", "global"), "/games/start?placeId=").concat(e, "&").concat(o, "=").concat(a), "getSponsorAvatarItemsUrl", 0, () => "".concat(l, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(c, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(c, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(l, "/support"), "getTermsUrl", 0, () => "".concat(l, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(l, "/transactions"), "getUrl", 0, () => l, "getUserUrl", 0, u], 191685)
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
        o = e.i(157310),
        i = e.i(128513),
        n = e.i(602635),
        l = e.i(814975);
    let c = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new i.UserScreenApi(c),
        u = new i.GroupsApi(c),
        g = {
            groupsApi: u,
            userScreenApi: d,
            creatorHomeContentApi: new i.CreatorHomeContentApi(c),
            signalsApi: new i.SignalsApi(c)
        };
    e.s(["CreatorHomeClient", 0, g], 67262);
    let m = function() {
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
                }, g.groupsApi.groupsListGroups(e)
            }
        })
    };
    var p = e.i(809576);
    let b = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: i
        } = (0, r.useRobloxAuthentication)(), n = (0, p.useGroupPermissionFetchers)(), {
            data: l,
            isLoading: c,
            refetch: d
        } = m(), [u, g] = (0, s.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [h, v] = (0, s.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [f, x] = (0, s.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), _ = (0, a.useCallback)(e => {
            v(e);
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
        }, [v, x]), y = (0, a.useMemo)(() => {
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
            return h && null != (e = y.find(e => {
                let {
                    id: t
                } = e;
                return t === h
            })) ? e : null
        }, [h, y]), C = null == k ? void 0 : k.id, w = null == i ? void 0 : i.id, {
            data: S,
            error: q,
            isPending: E,
            refetch: P
        } = (0, p.useGroupResolvedPermissionsQuery)(C, w), {
            data: U,
            isPending: H,
            refetch: A
        } = (0, p.useGroupOwnershipQuery)(C, w), I = (0, a.useCallback)(() => null == C || null == w ? Promise.resolve() : Promise.all([P(), A()]), [A, P, C, w]);
        (0, a.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == l ? void 0 : l.groups) && !c && g(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, y, c, g, null == i ? void 0 : i.id]);
        let T = (0, a.useMemo)(() => {
            var e;
            return {
                groups: y,
                currentGroup: k,
                groupData: f,
                isFetched: !c && !!w,
                refreshGroups: d,
                setCurrentGroup: _,
                ...n,
                permissions: S,
                isOwner: null != w && (null == U || null == (e = U.owner) ? void 0 : e.userId) === w,
                isPermissionsLoading: null != k && (E || H),
                permissionsError: q,
                refreshPermissions: I
            }
        }, [k, f, y, c, H, E, U, n, S, q, d, I, _, w]);
        return (0, t.jsx)(b.Provider, {
            value: T,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(b);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(b);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(711367),
        r = e.i(157310),
        s = e.i(795621),
        o = e.i(458451),
        i = e.i(536745),
        n = e.i(272593);
    let l = new i.PermissionsV2Api((0, n.createClientConfiguration)("groups", "bedev1"));
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
            let o = await l.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            a.push(...null != (r = o.data) ? r : []), t = null != (s = o.nextPageCursor) ? s : void 0
        } while (t) return a
    }
    var g = e.i(156071);
    let m = new i.PermissionsV2Api((0, n.createClientConfiguration)("groups", "bedev1"));
    async function p(e) {
        var t;
        return null != (t = (await m.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var b = e.i(759283);
    let h = (e, t) => ["groups", e, t, "resolved-permissions"],
        v = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        f = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, r.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => g.default.getGroupInfo(e) : a.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, o.useRobloxAuthentication)(), a = (0, s.useQueryClient)(), r = null == e ? void 0 : e.id, i = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: f(e, r),
            queryFn: () => p(e),
            staleTime: 6e4
        }), [a, r]), n = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: h(e, r),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [a, r]), l = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: v(e, r),
            queryFn: () => u(e),
            staleTime: 6e4
        }), [a, r]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: n,
            fetchRolePermissions: l,
            fetchUniversePermissions: i
        }), [n, l, i])
    }, "useGroupResolvedPermissionsQuery", 0, function(e, t) {
        return (0, r.useQuery)({
            queryKey: h(e, t),
            queryFn: e && t ? () => d(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, o.useRobloxAuthentication)(), s = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: v(e, s),
            queryFn: e && s ? () => u(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, o.useRobloxAuthentication)(), s = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: f(e, s),
            queryFn: void 0 !== e && e !== b.uninitializedUniverseId ? () => p(e) : a.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 501704, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/alert_dark.1spa8ixzmujxs.svg")
}, 782294, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/alert_light.3o6_fob3g_8zu.svg")
}, 177244, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/api_key_dark.1k1v6y4zm3j28.svg")
}, 346082, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/api_key_light.06t4q4202-77s.svg")
}, 676695, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/audio_dark.16razgllw2ska.svg")
}, 551e3, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/audio_light.3ra073_18pbj-.svg")
}, 265260, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/avatar_setup_dark.0orjsl7i089hc.svg")
}, 330351, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/avatar_setup_light.32r86q54d7kuh.svg")
}, 267338, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/badge_dark.3m45r-3favo3f.svg")
}, 636172, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/badge_light.3fxfvj8ub7utb.svg")
}, 508308, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/bar_graph_dark.01vf9sty52re2.svg")
}, 517406, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/bar_graph_light.1iiixo_d8ur81.svg")
}, 918777, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/collaborators_dark.30gxkwssilacj.svg")
}, 739181, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/collaborators_light.3x7fovqhay1x5.svg")
}, 381997, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/decals_dark.2jpntsljojhzc.svg")
}, 940530, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/decals_light.16_gp3tnuc5p_.svg")
}, 549779, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/envelope_dark.2-ouf9shuihi4.svg")
}, 814110, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/envelope_light.1me9hqye66z7w.svg")
}, 40761, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/event_calendar_dark.3lx4_kse68by8.svg")
}, 155845, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/event_calendar_light.1pq-t84d90ty1.svg")
}, 550425, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/find_people_dark.220q6_cs04hcq.svg")
}, 396147, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/find_people_light.1gkb3pmwc8s2n.svg")
}, 28401, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/image_dark.2giew28wx4z86.svg")
}, 464170, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/image_light.0ouq8tcgpznz7.svg")
}, 564751, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/leaderboard_dark.301ypg94lbxpv.svg")
}, 307025, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/leaderboard_light.43sjz_ibwkiq_.svg")
}, 313639, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/line_chart_dark.0k7qf3mhepo6s.svg")
}, 147556, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/line_chart_light.049gcvvmai0ax.svg")
}, 559061, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/localization_dark.1ia7wat2mwyfi.svg")
}, 316883, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/localization_light.2jss_xvx2fuq0.svg")
}, 421106, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/lockSecrets_dark.0na6naigcbnkj.svg")
}, 597112, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/lockSecrets_light.0rzix2i1i13lt.svg")
}, 353483, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/makeup_look_dark.26-5-yn8598c9.svg")
}, 686034, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/makeup_look_light.0rc05t5n5al4m.svg")
}, 519715, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/managed_pricing_dark.2zdkf2-ctboa2.svg")
}, 502010, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/managed_pricing_light.0sioq_hruq1qp.svg")
}, 774889, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/meshes_dark.2tlm50ns1pq5o.svg")
}, 801362, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/meshes_light.36wh96flp2o3r.svg")
}, 956159, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/models_dark.30suu5lj5-ua5.svg")
}, 149660, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/models_light.0kiw6k3ejw-rn.svg")
}, 889703, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/models_plugins_parts_dark.3jp6jislnsqf8.svg")
}, 414235, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/models_plugins_parts_light.2nj1xhv0bfg_u.svg")
}, 118756, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/notifications_dark.2l_rf34_xo6o8.svg")
}, 904302, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/notifications_light.3p-b4rzvwwfmj.svg")
}, 178653, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/oauth_dark.42jv8--11_1i0.svg")
}, 234503, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/oauth_light.17vwiebwrn8ox.svg")
}, 638331, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/rights_manager_dark.0m7ca17sdbgim.svg")
}, 775937, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/rights_manager_light.1moaenz1cbft0.svg")
}, 272258, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/robux_dark.0adh_znay53ig.svg")
}, 671182, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/robux_light.0r27xddcy2n6m.svg")
}, 335605, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/run_dark.1sun4tvxh_arh.svg")
}, 742089, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/run_light.29f-3jyw910_v.svg")
}, 599094, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/shareLinks_dark.1l5fwuv6cgzmy.svg")
}, 939457, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/shareLinks_light.116igf-ldibmu.svg")
}, 867987, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/signin_dark.1k_gzn1-5q0ca.svg")
}, 75599, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/signin_light.1o1-jng_ct0y2.svg")
}, 836849, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/token_dark.2qy4jy9ffjhax.svg")
}, 956436, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/token_light.2xc00j5zp1q8_.svg")
}, 798641, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/trial_dark.2llr5mlhjq5fa.svg")
}, 374526, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/trial_gamepass_dark.35rtv5i112_gt.svg")
}, 602235, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/trial_gamepass_light.2wpn1oa2gkp7h.svg")
}, 684112, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/trial_light.13hip-hiizhla.svg")
}, 856476, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/video_dark.2-gdpodjtsjj3.svg")
}, 663085, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/video_game_dark.0tuxtkttj8gcu.svg")
}, 665266, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/video_game_light.3l155817mjupj.svg")
}, 927690, e => {
    e.q("https://assets.create.roblox.com/d722a9428d755989878c38d63441d75b79735e79/_next/static/media/video_light.1fum3vlxctp7w.svg")
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
        var o, i, n, l, c = e.children,
            d = (0, t.a)(e, ["children"]),
            u = (0, a.useRef)(null),
            g = (0, a.useState)(!1),
            m = g[0],
            p = g[1],
            b = (0, a.useState)([]),
            h = b[0],
            v = b[1],
            f = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), v(function(r) {
                    return (0, t.b)((0, t.b)([], r, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [v]),
            x = (0, a.useCallback)(function() {
                p(!1)
            }, [p]);
        (0, a.useEffect)(function() {
            h.length > 0 && p(!0)
        }, [h.length]);
        var _ = (0, a.useMemo)(function() {
            return {
                ref: u,
                enqueue: f,
                close: x
            }
        }, [x, f]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(s.Provider, {
            value: _
        }, c), a.default.createElement(r.S, (0, t._)({}, (null == (o = h[0]) ? void 0 : o.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (n = null == (i = h[0]) ? void 0 : i.props) ? void 0 : n.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, r, s, o;
                    v(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (r = null == (a = h[0]) ? void 0 : a.props.TransitionProps) ? void 0 : r.onExited) && (null == (o = null == (s = h[0]) ? void 0 : s.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, r, s;
                (null == (a = h[0]) ? void 0 : a.shouldClose(t)) && p(!1), (null == (r = h[0]) ? void 0 : r.props.onClose) && (null == (s = h[0]) || s.props.onClose(e, t))
            },
            open: m
        }), null == (l = h[0]) ? void 0 : l.props.children))
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
        o = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        i = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function n() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let l = () => null;
    e.s(["UnifiedLoggerProvider", 0, e => {
        var n;
        let {
            children: l,
            unifiedLogger: c,
            pageLoggerConfig: d,
            path: u,
            url: g,
            isReady: m = !0
        } = e, p = null != (n = null == d ? void 0 : d.tags) ? n : s, b = null == d ? void 0 : d.rosId, h = (0, t.useMemo)(() => ({
            tags: p,
            rosId: b,
            path: u,
            url: g,
            isReady: m
        }), [p, b, u, g, m]), v = (0, t.useRef)(h), f = (0, t.useRef)(h);
        (0, t.useLayoutEffect)(() => {
            f.current = h, void 0 === v.current.path && void 0 !== h.path && (v.current = {
                ...v.current,
                path: h.path
            })
        }, [h]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r;
                if (e instanceof a.W && void 0 !== e.pageContext) return;
                let s = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && i.has(r)) ? v.current : f.current;
                void 0 !== s.path && (e.parameters = {
                    ...e.parameters,
                    path: s.path
                }), s.tags.forEach(t => e.addTag(t)), void 0 !== s.rosId && e.addTag("owner: ".concat(s.rosId))
            };
            return o.forEach(t => {
                c.events.on(t, e)
            }), () => {
                o.forEach(t => {
                    c.events.off(t, e)
                })
            }
        }, [c]);
        let x = (0, t.useMemo)(() => ({
            unifiedLogger: c,
            pageContext: h
        }), [c, h]);
        return t.default.createElement(r.Provider, {
            value: x
        }, l)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(r)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: a,
            pageContext: r
        } = n(), {
            path: s,
            url: o,
            isReady: i
        } = r, c = a.pageSettledTracker, d = (0, t.useSyncExternalStore)(c.subscribe, c.getSnapshot, l);
        (0, t.useEffect)(() => {
            if (!d || d.isNavigating || !i || !s || !o || !e || d.url.split(/[?#]/)[0] !== o.split(/[?#]/)[0]) return;
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
        }, [d, i, o, s, e, a])
    }, "useUnifiedLoggerProvider", 0, n])
}]);

//# debugId=f1870943-e46c-1ba3-6c0b-3b5b80d6a8f6
//# sourceMappingURL=4308gdwbxgcg6.js.map