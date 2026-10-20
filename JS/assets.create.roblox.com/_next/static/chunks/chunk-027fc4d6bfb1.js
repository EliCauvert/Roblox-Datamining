;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "e97ebe2c-bb0f-bae1-0ab7-d90198d07b13")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 523426, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "anti-cheat",
        name: "enhancedAntiCheatAccess",
        defaultValue: !1
    });
    e.s(["enhancedAntiCheatAccess", 0, t])
}, 245299, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "collaborative-tools",
        name: "enableEnvironments",
        defaultValue: !1
    });
    e.s(["enableEnvironments", 0, t])
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableReachStatusBadge",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        u = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["enableEarlyTestersUserOwnedGame", 0, c, "enablePlayerHostedEvents", 0, r, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, l, "enablePlayerSupportCategoryChange", 0, s, "enablePlayerSupportCreatorTicketReroute", 0, i, "enablePlayerSupportSpamManagement", 0, u, "enablePlayerSupportTicketTranslation", 0, n, "enableReachStatusBadge", 0, o])
}, 886525, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-engine-streaming",
        name: "enableExperienceLaunchTimeChart",
        defaultValue: !1
    });
    e.s(["enableExperienceLaunchTimeChart", 0, t])
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["isLeaderboardConfigsEnabled", 0, t])
}, 494192, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["presetChatEnabled", 0, t])
}, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let a = /{(.+?)}/g,
        n = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(a, (e, a) => {
            var n;
            return null != (n = t[a]) ? n : "{".concat(a, "}")
        });
    e.s(["default", 0, n], 884213);
    let r = /{(.+?)}/,
        i = /({.+?})/g,
        o = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        l = /(?:^|\.)robloxlabs\.com$/,
        s = () => {
            let e, t = o.test(window.location.hostname),
                a = window.location.hostname.includes("localhost"),
                n = "string" == typeof(e = window.location.hostname) && l.test(e);
            return {
                isSSR: !1,
                isAllowed: t || a || n,
                isDangerous: t || n,
                preferLoadedTranslations: n
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var c = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: a,
            translate: o,
            translateHTML: l,
            translateWithNamespace: d,
            translateWithNamespaceHTML: p
        } = e, m = (0, t.useMemo)(() => ({
            ready: a,
            translate: o,
            translateHTML: l,
            translateWithNamespace: d,
            translateWithNamespaceHTML: p
        }), [a, o, l, d, p]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: m.ready,
                translate: (0, c.translationFn)(m),
                translateHTML: (0, c.translateHTMLFn)(m),
                translateWithNamespace: m.translateWithNamespace,
                translateWithNamespaceHTML: m.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: a
                    } = e;
                    return (e, r, i, o) => {
                        let l = s();
                        if (!l.isAllowed) return a(i, o);
                        if (l.preferLoadedTranslations && t) {
                            let e = a(i, o);
                            if (e.length > 0) return e
                        }
                        return n(l.preferLoadedTranslations && !t ? e : u(e, l), o)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: o
                    } = e;
                    return (e, l, c, d, p) => {
                        let m = s();
                        if (!m.isAllowed) return o(c, d, p);
                        if (m.preferLoadedTranslations && a) {
                            let e = o(c, d, p);
                            if ("" !== e) return e
                        }
                        return ((e, a, o) => {
                            let l, s;
                            if (void 0 === a && void 0 === o) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: c
                            } = (l = {}, s = {}, void 0 === o || Object.entries(o).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? l[t] = a : s[t] = a
                            }), {
                                stringArgs: l,
                                htmlArgs: s
                            }), d = n(e, u), p = d.split(i).filter(e => !!e);
                            if (1 === p.length) return d;
                            let m = [...p];
                            if (0 !== Object.keys(c).length) {
                                let e = p.reduce((e, t, a) => {
                                    let n = r.exec(t);
                                    if (n) {
                                        let t = n[1];
                                        if (Object.hasOwn(c, t)) {
                                            let n = e[t];
                                            if (!n) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            n.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(c).forEach(t => {
                                    let [a, n] = t, r = e[a];
                                    r && r.forEach(e => {
                                        m[e] = n
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...m);
                            let b = a.reduce((e, t) => {
                                    let {
                                        opening: a,
                                        closing: n,
                                        content: r
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(a, "}")]: {
                                            match: "{".concat(n, "}"),
                                            content: r
                                        }
                                    })
                                }, {}),
                                g = [],
                                f = [],
                                h = [];
                            for (let e = m.shift(); void 0 !== e; e = m.shift())
                                if ("string" == typeof e && r.test(e))
                                    if (Object.hasOwn(b, e)) f.push(e), h.push(e);
                                    else {
                                        let a = f.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: n,
                                                content: r
                                            } = b[a];
                                            if (e !== n) break;
                                            let i = [],
                                                o = !1;
                                            for (; h.length > 0 && !o;) {
                                                let e = h.pop();
                                                e === a ? o = !0 : i.unshift(e)
                                            }
                                            let l = r(i.every(e => "string" == typeof e) ? i : (0, t.createElement)(t.Fragment, null, ...i));
                                            0 === h.length ? g.push(l) : h.push(l)
                                        }
                                    }
                            else 0 === h.length ? g.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...g)
                        })(m.preferLoadedTranslations && !a ? e : u(e, m), d, p)
                    }
                })(e)
            }
        }, [m])
    }], 401263)
}, 29929, e => {
    "use strict";
    var t, a, n, r, i, o, l, s, u, c, d, p, m, b, g, f, h, v = e.i(650502),
        y = e.i(864392),
        C = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        E = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        P = ((n = {}).EnableIPRecommender = "enableIPRecommender", n),
        S = ((r = S || {}).EnableVideoOnboarding = "enableVideoOnboarding", r),
        w = ((i = w || {}).EnableSignalLookup = "enableSignalLookup", i.AlwaysShow = "alwaysShow", i),
        x = x || {},
        T = ((o = T || {}).mobileVariant = "mobileVariant", o),
        k = k || {},
        A = ((l = {}).ShowEditInStudioButton = "showEditInStudioButton", l.EnableCreationsNavLayout = "enableCreationsIPNavLayout", l),
        L = ((s = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", s),
        I = ((u = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", u.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", u.EnableAudienceControls = "enableAudienceControls", u.EnableNewBadgePattern = "enableNewBadgePattern", u.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", u.EnableAudiencesReplacement = "enableAudiencesReplacement", u),
        H = ((c = {}).EnableTalentHubV2 = "enableTalentHubV2", c.EnableTalentHubV2M2 = "enableTalentHubV2M2", c),
        R = ((d = R || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", d),
        O = ((p = O || {}).GameAppealsEnabled = "gameAppealsEnabled", p),
        F = ((m = F || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", m),
        N = ((b = N || {}).EnableChangelogCMS = "enableChangelogCMS", b),
        M = ((g = {}).CreatorDashboard = "CreatorDashboard", g.CreatorHubHomePage = "CreatorHub.HomePage.UserId", g.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", g.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", g.CreatorHubLandingPage = "CreatorHub.LandingPage", g.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", g.CreatorHubNavigation = "CreatorHub.Navigation", g.CreatorHubNavigationUser = "CreatorHub.Navigation.User", g.CreatorHubPublishing = "CreatorHub.Publishing.UserId", g.LicenseManager = "CreatorDashboard.LicenseManager", g.RightsManager = "CreatorDashboard.RightsManager", g.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", g.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", g.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", g.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", g.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", g.CreatorHubChangelog = "CreatorHub.Changelog", g.TalentHub = "CreatorHub.TalentHub.UserId", g),
        U = ((f = U || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", f.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", f.ShowSecrets = "showSecrets", f.ShowQualitySignalCards = "showQualitySignalCards", f);
    let G = {
        CreatorDashboard: C,
        "CreatorHub.HomePage.UserId": S,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": w,
        "CreatorHub.LandingPage": x,
        "CreatorHub.LandingPage.UserId": T,
        "CreatorHub.Navigation": k,
        "CreatorHub.Navigation.User": A,
        "CreatorHub.Publishing.UserId": L,
        "CreatorDashboard.LicenseManager": P,
        "CreatorDashboard.RightsManager": E,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((h = {}).SearchVersion = "searchVersion", h),
        "CreatorHub.Creations.Permission": I,
        "CreatorHub.ExperienceWebhooks.UserId": R,
        "CreatorHub.GameAppeals.UserId": O,
        "CreatorHub.HomePage.ExperienceTile.UserId": F,
        "CreatorHub.Changelog": N,
        "CreatorHub.TalentHub.UserId": H
    };
    async function V(e) {
        let t = (0, v.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(G[e]).join(","),
            n = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(n, {
            credentials: "include"
        })).json()
    }
    let D = (0, y.default)(V);
    e.s(["CreatorHubCreationsPermissionParameters", () => I, "CreatorHubPublishingParameters", () => L, "IXPLayers", () => M, "LicenseManagerParameters", () => P, "TalentHubParameters", () => H, "fetchIXPParametersForCurrentUser", 0, D])
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(502585),
        n = e.i(272593);
    let r = new class {
        async getLocale(e) {
            return this.localeApi.v1LocalesGet(e)
        }
        async getUserLocalizationLocusSupportedLocales() {
            return this.localeApi.v1LocalesUserLocalizationLocusSupportedLocalesGet()
        }
        async getSupportedLocalesForCreators(e) {
            return this.localeApi.v1LocalesSupportedLocalesForCreatorsGet(e)
        }
        async getSupportedLocalesForFeature(e) {
            return this.localeApi.v1LocalesSupportedLocalesForFeatureGet(e)
        }
        constructor() {
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.LocaleApi((0, n.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, r])
}, 864392, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        let t = new Map;
        return a => {
            if (t.has(a)) return t.get(a);
            let n = e(a);
            return t.set(a, n), n
        }
    }])
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
        n = e.i(458451),
        r = e.i(533414),
        i = e.i(157310),
        o = e.i(279149),
        l = e.i(602635),
        s = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        c = new o.UserScreenApi(u),
        d = new o.GroupsApi(u),
        p = {
            groupsApi: d,
            userScreenApi: c,
            creatorHomeContentApi: new o.CreatorHomeContentApi(u),
            signalsApi: new o.SignalsApi(u)
        };
    e.s(["CreatorHomeClient", 0, p], 67262);
    let m = function() {
        let {
            user: e
        } = (0, s.useAuthentication)();
        return (0, i.useQuery)({
            queryKey: l.getGroupsQueryKey,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: o.GroupListSurface.CreatorHub
                }, p.groupsApi.groupsListGroups(e)
            }
        })
    };
    var b = e.i(809576);
    let g = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: i
        } = e, {
            user: o
        } = (0, n.useRobloxAuthentication)(), l = (0, b.useGroupPermissionFetchers)(), {
            data: s,
            isLoading: u,
            refetch: c
        } = m(), [d, p] = (0, r.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [f, h] = (0, r.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [v, y] = (0, r.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), C = (0, a.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            y(e => {
                let a = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: r
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof r || Number.isNaN(r) || (a.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - r, 864e5))))
                }
                return {
                    ...e,
                    [t]: a
                }
            })
        }, [h, y]), E = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === d) return [];
            try {
                let e = "string" == typeof d ? JSON.parse(d) : d;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [d, null == s ? void 0 : s.groups]), P = (0, a.useMemo)(() => {
            var e;
            return f && null != (e = E.find(e => {
                let {
                    id: t
                } = e;
                return t === f
            })) ? e : null
        }, [f, E]), S = null == P ? void 0 : P.id, w = null == o ? void 0 : o.id, {
            data: x,
            error: T,
            isPending: k,
            refetch: A
        } = (0, b.useGroupResolvedPermissionsQuery)(S, w), {
            data: L,
            isPending: I,
            refetch: H
        } = (0, b.useGroupOwnershipQuery)(S, w), R = (0, a.useCallback)(() => null == S || null == w ? Promise.resolve() : Promise.all([A(), H()]), [H, A, S, w]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !u && p(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, E, u, p, null == o ? void 0 : o.id]);
        let O = (0, a.useMemo)(() => {
            var e;
            return {
                groups: E,
                currentGroup: P,
                groupData: v,
                isFetched: !u && !!w,
                refreshGroups: c,
                setCurrentGroup: C,
                ...l,
                permissions: x,
                isOwner: null != w && (null == L || null == (e = L.owner) ? void 0 : e.userId) === w,
                isPermissionsLoading: null != P && (k || I),
                permissionsError: T,
                refreshPermissions: R
            }
        }, [P, v, E, u, I, k, L, l, x, T, c, R, C, w]);
        return (0, t.jsx)(g.Provider, {
            value: O,
            children: i
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
}, 809576, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(711367),
        n = e.i(157310),
        r = e.i(795621),
        i = e.i(458451),
        o = e.i(285666),
        l = e.i(272593);
    let s = new o.PermissionsV2Api((0, l.createClientConfiguration)("groups", "bedev1"));
    async function u(e, t, a) {
        var n;
        return null != (n = (await s.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: a
        })).permissions) ? n : {}
    }
    async function c(e) {
        return u(e, "groups", String(e))
    }
    async function d(e) {
        let t, a = [];
        do {
            var n, r;
            let i = await s.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            a.push(...null != (n = i.data) ? n : []), t = null != (r = i.nextPageCursor) ? r : void 0
        } while (t) return a
    }
    var p = e.i(156071);
    let m = new o.PermissionsV2Api((0, l.createClientConfiguration)("groups", "bedev1"));
    async function b(e) {
        var t;
        return null != (t = (await m.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var g = e.i(759283);
    let f = (e, t) => ["groups", e, t, "resolved-permissions"],
        h = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        v = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, n.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => p.default.getGroupInfo(e) : a.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, i.useRobloxAuthentication)(), a = (0, r.useQueryClient)(), n = null == e ? void 0 : e.id, o = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: v(e, n),
            queryFn: () => b(e),
            staleTime: 6e4
        }), [a, n]), l = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: f(e, n),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [a, n]), s = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: h(e, n),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [a, n]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: l,
            fetchRolePermissions: s,
            fetchUniversePermissions: o
        }), [l, s, o])
    }, "useGroupResolvedPermissionsQuery", 0, function(e, t) {
        return (0, n.useQuery)({
            queryKey: f(e, t),
            queryFn: e && t ? () => c(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, i.useRobloxAuthentication)(), r = null == t ? void 0 : t.id;
        return (0, n.useQuery)({
            queryKey: h(e, r),
            queryFn: e && r ? () => d(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, i.useRobloxAuthentication)(), r = null == t ? void 0 : t.id;
        return (0, n.useQuery)({
            queryKey: v(e, r),
            queryFn: void 0 !== e && e !== g.uninitializedUniverseId ? () => b(e) : a.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 486736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(639102);
    let r = {
            enableImageTranslationEnrollment: !1,
            enableImageTranslationListingTab: !1,
            enableSharedTranslationListComponents: !1,
            enableIpPlatformMatchesTableEsIndexImprovements: !1
        },
        i = {
            ...r
        },
        o = async () => {
            try {
                let {
                    applicationSettings: e = {}
                } = await n.settingsClient.getApplicationSettings(), t = {};
                return Object.entries(e).forEach(e => {
                    let [a, n] = e;
                    try {
                        let e = typeof r[a];
                        t[a] = "boolean" === e || "number" === e ? JSON.parse(n) : n
                    } catch (e) {
                        console.error(e)
                    }
                }), t
            } catch (e) {
                return r
            }
        }, l = (0, a.createContext)({
            settings: {
                ...i
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: n
        } = e, [r, s] = (0, a.useState)(() => ({
            settings: {
                ...i
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, a.useEffect)(() => {
            (async () => {
                let e = await Promise.allSettled([o()]);
                s({
                    settings: e.reduce((e, t) => ({
                        ...e,
                        ..."fulfilled" === t.status ? t.value : {}
                    }), i),
                    isFetched: !0,
                    status: e.find(e => "rejected" === e.status) ? "error" : "success"
                })
            })()
        }, []), (0, t.jsx)(l.Provider, {
            value: r,
            children: n
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: n
        } = (0, a.useContext)(l), r = (0, a.useRef)(e);
        return {
            settings: (0, a.useMemo)(() => {
                let t = r.current;
                return Object.keys(e).some(a => e[a] !== t[a]) && (r.current = e), r.current
            }, [e]),
            status: t,
            isFetched: n
        }
    }], 486736)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(723570),
        r = e => {
            var r, o, l;
            let s, u, {
                    present: c,
                    children: d
                } = e,
                p = function(e) {
                    var a, r;
                    let [o, l] = t.useState(), s = t.useRef(null), u = t.useRef(e), c = t.useRef("none"), [d, p] = (a = e ? "mounted" : "unmounted", r = {
                        mounted: {
                            UNMOUNT: "unmounted",
                            ANIMATION_OUT: "unmountSuspended"
                        },
                        unmountSuspended: {
                            MOUNT: "mounted",
                            ANIMATION_END: "unmounted"
                        },
                        unmounted: {
                            MOUNT: "mounted"
                        }
                    }, t.useReducer((e, t) => {
                        let a = r[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = i(s.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, n.useLayoutEffect)(() => {
                        let t = s.current,
                            a = u.current;
                        if (a !== e) {
                            let n = c.current,
                                r = i(t);
                            e ? p("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? p("UNMOUNT") : a && n !== r ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = e
                        }
                    }, [e, p]), (0, n.useLayoutEffect)(() => {
                        if (o) {
                            var e;
                            let t, a = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = i(s.current).includes(CSS.escape(e.animationName));
                                    if (e.target === o && n && (p("ANIMATION_END"), !u.current)) {
                                        let e = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === o && (c.current = i(s.current))
                                };
                            return o.addEventListener("animationstart", r), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), o.removeEventListener("animationstart", r), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                            }
                        }
                        p("ANIMATION_END")
                    }, [o, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            s.current = e ? getComputedStyle(e) : null, l(e)
                        }, [])
                    }
                }(c),
                m = "function" == typeof d ? d({
                    present: p.isPresent
                }) : t.Children.only(d),
                b = (0, a.useComposedRefs)(p.ref, (u = (s = null == (o = Object.getOwnPropertyDescriptor((r = m).props, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? r.ref : (u = (s = null == (l = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : l.get) && "isReactWarning" in s && s.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof d || p.isPresent ? t.cloneElement(m, {
                ref: b
            }) : null
        };

    function i(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    r.displayName = "Presence", e.s(["Presence", 0, r])
}, 904451, e => {
    "use strict";
    var t = e.i(140625),
        a = e.i(408832),
        n = e.i(197649),
        r = e.i(416340),
        i = e.i(78892),
        o = e.i(608652),
        l = e.i(174617),
        s = e.i(199786),
        u = e.i(300792),
        c = e.i(692166),
        d = e.i(169525),
        p = e.i(600317),
        m = e.i(221628),
        b = "Checkbox",
        [g, f] = (0, o.createContextScope)(b),
        [h, v] = g(b);

    function y(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: i,
            disabled: o,
            form: l,
            name: u,
            onCheckedChange: c,
            required: d,
            value: p = "on",
            internal_do_not_use_render: g
        } = e, [f, v] = (0, s.useControllableState)({
            prop: a,
            defaultProp: null != i && i,
            onChange: c,
            caller: b
        }), [y, C] = r.useState(null), [E, P] = r.useState(null), S = r.useRef(!1), w = !y || !!l || !!y.closest("form"), x = {
            checked: f,
            disabled: o,
            setChecked: v,
            control: y,
            setControl: C,
            name: u,
            form: l,
            value: p,
            hasConsumerStoppedPropagationRef: S,
            required: d,
            defaultChecked: !k(i) && i,
            isFormControl: w,
            bubbleInput: E,
            setBubbleInput: P
        };
        return (0, m.jsx)(h, {
            scope: t,
            ...x,
            children: "function" == typeof g ? g(x) : n
        })
    }
    var C = "CheckboxTrigger",
        E = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: o,
                ...s
            } = e, {
                control: u,
                value: c,
                disabled: d,
                checked: b,
                required: g,
                setControl: f,
                setChecked: h,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: E,
                bubbleInput: P
            } = v(C, a), S = (0, i.useComposedRefs)(t, f), w = r.useRef(b);
            return r.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => h(w.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, h]), (0, m.jsx)(p.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": k(b) ? "mixed" : b,
                "aria-required": g,
                "data-state": A(b),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: c,
                ...s,
                ref: S,
                onKeyDown: (0, l.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, l.composeEventHandlers)(o, e => {
                    h(e => !!k(e) || !e), P && E && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    E.displayName = C;
    var P = r.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: r,
            defaultChecked: i,
            required: o,
            disabled: l,
            value: s,
            onCheckedChange: u,
            form: c,
            ...d
        } = e;
        return (0, m.jsx)(y, {
            __scopeCheckbox: a,
            checked: r,
            defaultChecked: i,
            disabled: l,
            required: o,
            onCheckedChange: u,
            name: n,
            form: c,
            value: s,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, m.jsxs)(m.Fragment, {
                    children: [(0, m.jsx)(E, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, m.jsx)(T, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    P.displayName = b;
    var S = "CheckboxIndicator",
        w = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...r
            } = e, i = v(S, a);
            return (0, m.jsx)(d.Presence, {
                present: n || k(i.checked) || !0 === i.checked,
                children: (0, m.jsx)(p.Primitive.span, {
                    "data-state": A(i.checked),
                    "data-disabled": i.disabled ? "" : void 0,
                    ...r,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    w.displayName = S;
    var x = "CheckboxBubbleInput",
        T = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: l,
                checked: s,
                defaultChecked: d,
                required: b,
                disabled: g,
                name: f,
                value: h,
                form: y,
                bubbleInput: C,
                setBubbleInput: E
            } = v(x, a), P = (0, i.useComposedRefs)(t, E), S = (0, u.usePrevious)(s), w = (0, c.useSize)(o);
            r.useEffect(() => {
                if (!C) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !l.current;
                if (S !== s && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    C.indeterminate = k(s), e.call(C, !k(s) && s), C.dispatchEvent(a)
                }
            }, [C, S, s, l]);
            let T = r.useRef(!k(s) && s);
            return (0, m.jsx)(p.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != d ? d : T.current,
                required: b,
                disabled: g,
                name: f,
                value: h,
                form: y,
                ...n,
                tabIndex: -1,
                ref: P,
                style: {
                    ...n.style,
                    ...w,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function k(e) {
        return "indeterminate" === e
    }

    function A(e) {
        return k(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    T.displayName = x;
    let L = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        I = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        H = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        R = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: i,
            className: o,
            isChecked: l,
            isDisabled: s,
            size: u,
            hint: c,
            placement: d,
            onCheckedChange: p,
            id: m,
            ...b
        } = e, g = (0, a.default)(), f = m || g, h = i && r.default.createElement("label", {
            htmlFor: f,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !s && "cursor-pointer")
        }, r.default.createElement("span", {
            className: (0, n.default)(H[u], R[u], "content-emphasis")
        }, i), c && r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, c));
        return r.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", s && "opacity-[0.5]", !s && "cursor-pointer", o)
        }, "End" === d && h, r.default.createElement("div", {
            className: (0, n.default)(I[u])
        }, r.default.createElement(P, {
            "data-slot": "checkbox",
            className: (0, n.default)(L[u], t.interactable, !s && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: f,
            checked: l,
            disabled: s,
            onCheckedChange: p,
            "aria-label": i,
            ...b
        }, r.default.createElement(t.StateLayer, null), r.default.createElement(w, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(L[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === d && h)
    }], 904451)
}, 607895, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(23342);
    let r = new Set(["_self", "_parent", "_top"]),
        i = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        o = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        l = (0, a.forwardRef)((e, l) => {
            var s, u, c;
            let {
                children: d,
                className: p,
                size: m,
                color: b = "Emphasis",
                variant: g = "Standalone",
                underline: f = "hover",
                isExternal: h,
                asChild: v,
                ...y
            } = e, C = (u = null != (s = y.as) ? s : "a", c = "button" === y.as ? void 0 : y.target, void 0 !== h ? h : "button" !== u && void 0 !== c && !r.has(c)), E = (0, t.default)("foundation-web-link", "button" === y.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || C) && "inline-flex items-center gap-xsmall", void 0 !== m && i[m], o[b], "always" === f ? "underline" : "no-underline", "hover" === f && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", p), P = C ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (v) {
                let {
                    as: e,
                    ...t
                } = y, r = a.default.Children.only(d);
                return a.default.isValidElement(r) ? a.default.createElement(n.Slot, {
                    ref: l,
                    ...t,
                    className: E
                }, a.default.cloneElement(r, {}, a.default.createElement(a.default.Fragment, null, r.props.children, P))) : null
            }
            if ("button" === y.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = y;
                return a.default.createElement("button", {
                    ref: l,
                    type: null != t ? t : "button",
                    ...n,
                    className: E
                }, d, P)
            }
            let {
                as: S,
                ...w
            } = y;
            return a.default.createElement("a", {
                ref: l,
                ...w,
                className: E
            }, d, P)
        });
    l.displayName = "Link", e.s(["Link", 0, l])
}, 990729, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        n = e.i(863762);
    e.i(221628), e.i(149285);
    var r = (0, a.createContext)({
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
        var i, o, l, s, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, a.useRef)(null),
            p = (0, a.useState)(!1),
            m = p[0],
            b = p[1],
            g = (0, a.useState)([]),
            f = g[0],
            h = g[1],
            v = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), h(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [h]),
            y = (0, a.useCallback)(function() {
                b(!1)
            }, [b]);
        (0, a.useEffect)(function() {
            f.length > 0 && b(!0)
        }, [f.length]);
        var C = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: v,
                close: y
            }
        }, [y, v]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(r.Provider, {
            value: C
        }, u), a.default.createElement(n.S, (0, t._)({}, (null == (i = f[0]) ? void 0 : i.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (l = null == (o = f[0]) ? void 0 : o.props) ? void 0 : l.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, r, i;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = f[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (i = null == (r = f[0]) ? void 0 : r.props.TransitionProps) || i.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, r;
                (null == (a = f[0]) ? void 0 : a.shouldClose(t)) && b(!1), (null == (n = f[0]) ? void 0 : n.props.onClose) && (null == (r = f[0]) || r.props.onClose(e, t))
            },
            open: m
        }), null == (s = f[0]) ? void 0 : s.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(r);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: n
        } = t, r = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[r], a, n[r], n) : void 0
    }

    function n(e, t) {
        var a;
        let {
            pages: n,
            pageParams: r
        } = t;
        return n.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, n[0], n, r[0], r) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (r, i) => {
                var o, l, s, u, c;
                let d = r.options,
                    p = null == (s = r.fetchOptions) || null == (l = s.meta) || null == (o = l.fetchMore) ? void 0 : o.direction,
                    m = (null == (u = r.state.data) ? void 0 : u.pages) || [],
                    b = (null == (c = r.state.data) ? void 0 : c.pageParams) || [],
                    g = {
                        pages: [],
                        pageParams: []
                    },
                    f = 0,
                    h = async () => {
                        let i = !1,
                            o = (0, t.ensureQueryFn)(r.options, r.fetchOptions),
                            l = async (e, a, n) => {
                                let l;
                                if (i) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let s = (Object.defineProperty(l = {
                                        client: r.client,
                                        queryKey: r.queryKey,
                                        pageParam: a,
                                        direction: n ? "backward" : "forward",
                                        meta: r.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (r.signal.aborted ? i = !0 : r.signal.addEventListener("abort", () => {
                                            i = !0
                                        }), r.signal)
                                    }), l),
                                    u = await o(s),
                                    {
                                        maxPages: c
                                    } = r.options,
                                    d = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: d(e.pages, u, c),
                                    pageParams: d(e.pageParams, a, c)
                                }
                            };
                        if (p && m.length) {
                            let e = "backward" === p,
                                t = {
                                    pages: m,
                                    pageParams: b
                                },
                                r = (e ? n : a)(d, t);
                            g = await l(t, r, e)
                        } else {
                            let t = null != e ? e : m.length;
                            do {
                                var s;
                                let e = 0 === f ? null != (s = b[0]) ? s : d.initialPageParam : a(d, g);
                                if (f > 0 && null == e) break;
                                g = await l(g, e), f++
                            } while (f < t)
                        }
                        return g
                    };
                r.options.persister ? r.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = r.options).persister) ? void 0 : e.call(t, h, {
                        client: r.client,
                        queryKey: r.queryKey,
                        meta: r.options.meta,
                        signal: r.signal
                    }, i)
                } : r.fetchFn = h
            }
        }
    }])
}, 725924, e => {
    "use strict";
    let t, a;
    var n, r, i = e.i(416340);
    let o = "u" > typeof Intl,
        l = !o || void 0 === Intl.Locale,
        s = !o || void 0 === Intl.RelativeTimeFormat,
        u = !o || void 0 === Intl.PluralRules,
        c = !o || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (n = l || s || u || c || d, r = function() {
            return Promise.all([(l ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([s ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, a = n ? r().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, n] = (0, i.useState)(!a || t);
            return (0, i.useEffect)(() => {
                a && !e && a.then(() => n(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, p], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        n = [],
        r = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        i = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function o() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let l = () => null;
    e.s(["UnifiedLoggerProvider", 0, e => {
        var o;
        let {
            children: l,
            unifiedLogger: s,
            pageLoggerConfig: u,
            path: c,
            url: d,
            isReady: p = !0
        } = e, m = null != (o = null == u ? void 0 : u.tags) ? o : n, b = null == u ? void 0 : u.rosId, g = (0, t.useMemo)(() => ({
            tags: m,
            rosId: b,
            path: c,
            url: d,
            isReady: p
        }), [m, b, c, d, p]), f = (0, t.useRef)(g), h = (0, t.useRef)(g);
        (0, t.useLayoutEffect)(() => {
            h.current = g, void 0 === f.current.path && void 0 !== g.path && (f.current = {
                ...f.current,
                path: g.path
            })
        }, [g]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && i.has(a)) ? f.current : h.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return r.forEach(t => {
                s.events.on(t, e)
            }), () => {
                r.forEach(t => {
                    s.events.off(t, e)
                })
            }
        }, [s]);
        let v = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: g
        }), [s, g]);
        return t.default.createElement(a.Provider, {
            value: v
        }, l)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: a,
            pageContext: n
        } = o(), {
            path: r,
            url: i,
            isReady: s
        } = n, u = a.pageSettledTracker, c = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, l);
        (0, t.useEffect)(() => {
            if (!c || c.isNavigating || !s || !r || !i || !e || c.url.split(/[?#]/)[0] !== i.split(/[?#]/)[0]) return;
            let t = new URL(r, window.location.origin).pathname,
                n = requestAnimationFrame(() => {
                    n = requestAnimationFrame(() => {
                        a.logPageSettledEvent({
                            navigationId: c.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(n)
        }, [c, s, i, r, e, a])
    }, "useUnifiedLoggerProvider", 0, o])
}]);

//# debugId=e97ebe2c-bb0f-bae1-0ab7-d90198d07b13
//# sourceMappingURL=33kgy6nws9xr1.js.map