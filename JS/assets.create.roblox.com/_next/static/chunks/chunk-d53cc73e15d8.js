;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b8ee162c-4431-9a63-3be8-8b248bcffd0e")
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
        s = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        u = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1
        }),
        d = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["enableEarlyTestersUserOwnedGame", 0, d, "enablePlayerHostedEvents", 0, r, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, s, "enablePlayerSupportCategoryChange", 0, l, "enablePlayerSupportCreatorTicketReroute", 0, i, "enablePlayerSupportSpamManagement", 0, u, "enablePlayerSupportTicketTranslation", 0, n, "enableReachStatusBadge", 0, o])
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
        s = /(?:^|\.)robloxlabs\.com$/,
        l = () => {
            let e, t = o.test(window.location.hostname),
                a = window.location.hostname.includes("localhost"),
                n = "string" == typeof(e = window.location.hostname) && s.test(e);
            return {
                isSSR: !1,
                isAllowed: t || a || n,
                isDangerous: t || n,
                preferLoadedTranslations: n
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var d = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: a,
            translate: o,
            translateHTML: s,
            translateWithNamespace: c,
            translateWithNamespaceHTML: p
        } = e, g = (0, t.useMemo)(() => ({
            ready: a,
            translate: o,
            translateHTML: s,
            translateWithNamespace: c,
            translateWithNamespaceHTML: p
        }), [a, o, s, c, p]);
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
                    return (e, r, i, o) => {
                        let s = l();
                        if (!s.isAllowed) return a(i, o);
                        if (s.preferLoadedTranslations && t) {
                            let e = a(i, o);
                            if (e.length > 0) return e
                        }
                        return n(s.preferLoadedTranslations && !t ? e : u(e, s), o)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: o
                    } = e;
                    return (e, s, d, c, p) => {
                        let g = l();
                        if (!g.isAllowed) return o(d, c, p);
                        if (g.preferLoadedTranslations && a) {
                            let e = o(d, c, p);
                            if ("" !== e) return e
                        }
                        return ((e, a, o) => {
                            let s, l;
                            if (void 0 === a && void 0 === o) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: d
                            } = (s = {}, l = {}, void 0 === o || Object.entries(o).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? s[t] = a : l[t] = a
                            }), {
                                stringArgs: s,
                                htmlArgs: l
                            }), c = n(e, u), p = c.split(i).filter(e => !!e);
                            if (1 === p.length) return c;
                            let g = [...p];
                            if (0 !== Object.keys(d).length) {
                                let e = p.reduce((e, t, a) => {
                                    let n = r.exec(t);
                                    if (n) {
                                        let t = n[1];
                                        if (Object.hasOwn(d, t)) {
                                            let n = e[t];
                                            if (!n) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            n.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(d).forEach(t => {
                                    let [a, n] = t, r = e[a];
                                    r && r.forEach(e => {
                                        g[e] = n
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...g);
                            let m = a.reduce((e, t) => {
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
                                f = [],
                                b = [],
                                v = [];
                            for (let e = g.shift(); void 0 !== e; e = g.shift())
                                if ("string" == typeof e && r.test(e))
                                    if (Object.hasOwn(m, e)) b.push(e), v.push(e);
                                    else {
                                        let a = b.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: n,
                                                content: r
                                            } = m[a];
                                            if (e !== n) break;
                                            let i = [],
                                                o = !1;
                                            for (; v.length > 0 && !o;) {
                                                let e = v.pop();
                                                e === a ? o = !0 : i.unshift(e)
                                            }
                                            let s = r(i.every(e => "string" == typeof e) ? i : (0, t.createElement)(t.Fragment, null, ...i));
                                            0 === v.length ? f.push(s) : v.push(s)
                                        }
                                    }
                            else 0 === v.length ? f.push(e) : v.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...f)
                        })(g.preferLoadedTranslations && !a ? e : u(e, g), c, p)
                    }
                })(e)
            }
        }, [g])
    }], 401263)
}, 29929, e => {
    "use strict";
    var t, a, n, r, i, o, s, l, u, d, c, p, g, m, f, b, v, h = e.i(650502),
        y = e.i(864392),
        C = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        P = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        E = ((n = {}).EnableIPRecommender = "enableIPRecommender", n),
        S = ((r = S || {}).EnableVideoOnboarding = "enableVideoOnboarding", r),
        I = ((i = I || {}).EnableSignalLookup = "enableSignalLookup", i.AlwaysShow = "alwaysShow", i),
        O = O || {},
        w = ((o = w || {}).mobileVariant = "mobileVariant", o),
        x = x || {},
        R = ((s = {}).ShowEditInStudioButton = "showEditInStudioButton", s.EnableCreationsNavLayout = "enableCreationsIPNavLayout", s),
        A = ((l = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", l),
        L = ((u = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", u.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", u.EnableAudienceControls = "enableAudienceControls", u.EnableNewBadgePattern = "enableNewBadgePattern", u.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", u.EnableAudiencesReplacement = "enableAudiencesReplacement", u),
        T = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        k = ((c = k || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", c),
        H = ((p = H || {}).GameAppealsEnabled = "gameAppealsEnabled", p),
        N = ((g = N || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", g),
        M = ((m = M || {}).EnableChangelogCMS = "enableChangelogCMS", m),
        U = ((f = {}).CreatorDashboard = "CreatorDashboard", f.CreatorHubHomePage = "CreatorHub.HomePage.UserId", f.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", f.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", f.CreatorHubLandingPage = "CreatorHub.LandingPage", f.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", f.CreatorHubNavigation = "CreatorHub.Navigation", f.CreatorHubNavigationUser = "CreatorHub.Navigation.User", f.CreatorHubPublishing = "CreatorHub.Publishing.UserId", f.LicenseManager = "CreatorDashboard.LicenseManager", f.RightsManager = "CreatorDashboard.RightsManager", f.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", f.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", f.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", f.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", f.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", f.CreatorHubChangelog = "CreatorHub.Changelog", f.TalentHub = "CreatorHub.TalentHub.UserId", f),
        z = ((b = z || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", b.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", b.ShowSecrets = "showSecrets", b.ShowQualitySignalCards = "showQualitySignalCards", b);
    let F = {
        CreatorDashboard: C,
        "CreatorHub.HomePage.UserId": S,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": I,
        "CreatorHub.LandingPage": O,
        "CreatorHub.LandingPage.UserId": w,
        "CreatorHub.Navigation": x,
        "CreatorHub.Navigation.User": R,
        "CreatorHub.Publishing.UserId": A,
        "CreatorDashboard.LicenseManager": E,
        "CreatorDashboard.RightsManager": P,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((v = {}).SearchVersion = "searchVersion", v),
        "CreatorHub.Creations.Permission": L,
        "CreatorHub.ExperienceWebhooks.UserId": k,
        "CreatorHub.GameAppeals.UserId": H,
        "CreatorHub.HomePage.ExperienceTile.UserId": N,
        "CreatorHub.Changelog": M,
        "CreatorHub.TalentHub.UserId": T
    };
    async function G(e) {
        let t = (0, h.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(F[e]).join(","),
            n = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(n, {
            credentials: "include"
        })).json()
    }
    let D = (0, y.default)(G);
    e.s(["CreatorHubCreationsPermissionParameters", () => L, "IXPLayers", () => U, "LicenseManagerParameters", () => E, "TalentHubParameters", () => T, "fetchIXPParametersForCurrentUser", 0, D])
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
}, 607204, e => {
    "use strict";
    var t = e.i(581548),
        a = e.i(272593),
        n = e.i(127403);
    let r = (0, a.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new n.default]
        }),
        i = new t.OrganizationApi(r),
        o = new t.InvitationApi(r),
        s = new t.RoleApi(r),
        l = new t.UserApi(r),
        u = new t.GroupUniversePayoutApi(r);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => i.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, a) => o.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getInvitation: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, a) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: a
            }),
            deleteInvitationById: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
                organizationId: e,
                invitationId: t
            })
        },
        roleClient: {
            createRole: async (e, t) => s.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: a
            }),
            updateRoleMetadata: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: a
            }),
            updateRolePosition: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: a
            }),
            getRolesByOrganization: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            deleteRole: async (e, t) => s.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, a, n) => s.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n
            })
        },
        userClient: {
            getUserInvitationByOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            getUserPermissions: async (e, t) => {
                let {
                    raw: a
                } = await l.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await a.json()
            },
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return u.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
            },
            getSuggestedPayouts: async e => u.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
                organizationId: e
            })
        }
    }])
}, 127403, e => {
    "use strict";
    e.s(["default", 0, class {
        post(e) {
            let {
                fetch: t,
                url: a,
                init: n,
                response: r
            } = e, i = new URL(a);
            return "POST" !== n.method && "PATCH" !== n.method || "true" === i.searchParams.get("isSecure") || 403 !== r.status ? Promise.resolve(r) : (i.searchParams.set("isSecure", "true"), t(i.toString(), n))
        }
    }])
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
}, 384340, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        permissions: void 0,
        refreshOrganization: () => ({}),
        refreshPermission: () => Promise.resolve(),
        isOrganizationLoading: !1
    });
    a.displayName = "Organization", e.s(["default", 0, a], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 384340)
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
        s = e.i(602635),
        l = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new o.UserScreenApi(u),
        c = new o.GroupsApi(u),
        p = {
            groupsApi: c,
            userScreenApi: d,
            creatorHomeContentApi: new o.CreatorHomeContentApi(u),
            signalsApi: new o.SignalsApi(u)
        };
    e.s(["CreatorHomeClient", 0, p], 67262);
    let g = function() {
            let {
                user: e
            } = (0, l.useAuthentication)();
            return (0, i.useQuery)({
                queryKey: s.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: o.GroupListSurface.CreatorHub
                    }, p.groupsApi.groupsListGroups(e)
                }
            })
        },
        m = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: i
        } = e, {
            user: o
        } = (0, n.useRobloxAuthentication)(), {
            data: s,
            isLoading: l,
            refetch: u
        } = g(), [d, c] = (0, r.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [p, f] = (0, r.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [b, v] = (0, r.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), h = (0, a.useCallback)(e => {
            f(e);
            let t = null != e ? e : "user";
            v(e => {
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
        }, [f, v]), y = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === d) return [];
            try {
                let e = "string" == typeof d ? JSON.parse(d) : d;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [d, null == s ? void 0 : s.groups]), C = (0, a.useMemo)(() => {
            var e;
            return p && null != (e = y.find(e => {
                let {
                    id: t
                } = e;
                return t === p
            })) ? e : null
        }, [p, y]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !l && c(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, y, l, c, null == o ? void 0 : o.id]);
        let P = (0, a.useMemo)(() => ({
            groups: y,
            currentGroup: C,
            groupData: b,
            isFetched: !l && !!(null == o ? void 0 : o.id),
            refreshGroups: u,
            setCurrentGroup: h
        }), [C, b, y, l, u, h, null == o ? void 0 : o.id]);
        return (0, t.jsx)(m.Provider, {
            value: P,
            children: i
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, a.useContext)(m);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, a.useContext)(m);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
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
        }, s = (0, a.createContext)({
            settings: {
                ...i
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: n
        } = e, [r, l] = (0, a.useState)(() => ({
            settings: {
                ...i
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, a.useEffect)(() => {
            (async () => {
                let e = await Promise.allSettled([o()]);
                l({
                    settings: e.reduce((e, t) => ({
                        ...e,
                        ..."fulfilled" === t.status ? t.value : {}
                    }), i),
                    isFetched: !0,
                    status: e.find(e => "rejected" === e.status) ? "error" : "success"
                })
            })()
        }, []), (0, t.jsx)(s.Provider, {
            value: r,
            children: n
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: n
        } = (0, a.useContext)(s), r = (0, a.useRef)(e);
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
            var r, o, s;
            let l, u, {
                    present: d,
                    children: c
                } = e,
                p = function(e) {
                    var a, r;
                    let [o, s] = t.useState(), l = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [c, p] = (a = e ? "mounted" : "unmounted", r = {
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
                        let e = i(l.current);
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, n.useLayoutEffect)(() => {
                        let t = l.current,
                            a = u.current;
                        if (a !== e) {
                            let n = d.current,
                                r = i(t);
                            e ? p("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? p("UNMOUNT") : a && n !== r ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = e
                        }
                    }, [e, p]), (0, n.useLayoutEffect)(() => {
                        if (o) {
                            var e;
                            let t, a = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = i(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === o && n && (p("ANIMATION_END"), !u.current)) {
                                        let e = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === o && (d.current = i(l.current))
                                };
                            return o.addEventListener("animationstart", r), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), o.removeEventListener("animationstart", r), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                            }
                        }
                        p("ANIMATION_END")
                    }, [o, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            l.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(d),
                g = "function" == typeof c ? c({
                    present: p.isPresent
                }) : t.Children.only(c),
                m = (0, a.useComposedRefs)(p.ref, (u = (l = null == (o = Object.getOwnPropertyDescriptor((r = g).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? r.ref : (u = (l = null == (s = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof c || p.isPresent ? t.cloneElement(g, {
                ref: m
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
        s = e.i(174617),
        l = e.i(199786),
        u = e.i(300792),
        d = e.i(692166),
        c = e.i(169525),
        p = e.i(600317),
        g = e.i(221628),
        m = "Checkbox",
        [f, b] = (0, o.createContextScope)(m),
        [v, h] = f(m);

    function y(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: i,
            disabled: o,
            form: s,
            name: u,
            onCheckedChange: d,
            required: c,
            value: p = "on",
            internal_do_not_use_render: f
        } = e, [b, h] = (0, l.useControllableState)({
            prop: a,
            defaultProp: null != i && i,
            onChange: d,
            caller: m
        }), [y, C] = r.useState(null), [P, E] = r.useState(null), S = r.useRef(!1), I = !y || !!s || !!y.closest("form"), O = {
            checked: b,
            disabled: o,
            setChecked: h,
            control: y,
            setControl: C,
            name: u,
            form: s,
            value: p,
            hasConsumerStoppedPropagationRef: S,
            required: c,
            defaultChecked: !x(i) && i,
            isFormControl: I,
            bubbleInput: P,
            setBubbleInput: E
        };
        return (0, g.jsx)(v, {
            scope: t,
            ...O,
            children: "function" == typeof f ? f(O) : n
        })
    }
    var C = "CheckboxTrigger",
        P = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: o,
                ...l
            } = e, {
                control: u,
                value: d,
                disabled: c,
                checked: m,
                required: f,
                setControl: b,
                setChecked: v,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: P,
                bubbleInput: E
            } = h(C, a), S = (0, i.useComposedRefs)(t, b), I = r.useRef(m);
            return r.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => v(I.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, v]), (0, g.jsx)(p.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": x(m) ? "mixed" : m,
                "aria-required": f,
                "data-state": R(m),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: d,
                ...l,
                ref: S,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(o, e => {
                    v(e => !!x(e) || !e), E && P && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    P.displayName = C;
    var E = r.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: r,
            defaultChecked: i,
            required: o,
            disabled: s,
            value: l,
            onCheckedChange: u,
            form: d,
            ...c
        } = e;
        return (0, g.jsx)(y, {
            __scopeCheckbox: a,
            checked: r,
            defaultChecked: i,
            disabled: s,
            required: o,
            onCheckedChange: u,
            name: n,
            form: d,
            value: l,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, g.jsxs)(g.Fragment, {
                    children: [(0, g.jsx)(P, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, g.jsx)(w, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    E.displayName = m;
    var S = "CheckboxIndicator",
        I = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...r
            } = e, i = h(S, a);
            return (0, g.jsx)(c.Presence, {
                present: n || x(i.checked) || !0 === i.checked,
                children: (0, g.jsx)(p.Primitive.span, {
                    "data-state": R(i.checked),
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
    I.displayName = S;
    var O = "CheckboxBubbleInput",
        w = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: s,
                checked: l,
                defaultChecked: c,
                required: m,
                disabled: f,
                name: b,
                value: v,
                form: y,
                bubbleInput: C,
                setBubbleInput: P
            } = h(O, a), E = (0, i.useComposedRefs)(t, P), S = (0, u.usePrevious)(l), I = (0, d.useSize)(o);
            r.useEffect(() => {
                if (!C) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (S !== l && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    C.indeterminate = x(l), e.call(C, !x(l) && l), C.dispatchEvent(a)
                }
            }, [C, S, l, s]);
            let w = r.useRef(!x(l) && l);
            return (0, g.jsx)(p.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : w.current,
                required: m,
                disabled: f,
                name: b,
                value: v,
                form: y,
                ...n,
                tabIndex: -1,
                ref: E,
                style: {
                    ...n.style,
                    ...I,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function x(e) {
        return "indeterminate" === e
    }

    function R(e) {
        return x(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    w.displayName = O;
    let A = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        L = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        T = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        k = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: i,
            className: o,
            isChecked: s,
            isDisabled: l,
            size: u,
            hint: d,
            placement: c,
            onCheckedChange: p,
            id: g,
            ...m
        } = e, f = (0, a.default)(), b = g || f, v = i && r.default.createElement("label", {
            htmlFor: b,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !l && "cursor-pointer")
        }, r.default.createElement("span", {
            className: (0, n.default)(T[u], k[u], "content-emphasis")
        }, i), d && r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, d));
        return r.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", l && "opacity-[0.5]", !l && "cursor-pointer", o)
        }, "End" === c && v, r.default.createElement("div", {
            className: (0, n.default)(L[u])
        }, r.default.createElement(E, {
            "data-slot": "checkbox",
            className: (0, n.default)(A[u], t.interactable, !l && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: b,
            checked: s,
            disabled: l,
            onCheckedChange: p,
            "aria-label": i,
            ...m
        }, r.default.createElement(t.StateLayer, null), r.default.createElement(I, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(A[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && v)
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
        s = (0, a.forwardRef)((e, s) => {
            var l, u, d;
            let {
                children: c,
                className: p,
                size: g,
                color: m = "Emphasis",
                variant: f = "Standalone",
                underline: b = "hover",
                isExternal: v,
                asChild: h,
                ...y
            } = e, C = (u = null != (l = y.as) ? l : "a", d = "button" === y.as ? void 0 : y.target, void 0 !== v ? v : "button" !== u && void 0 !== d && !r.has(d)), P = (0, t.default)("foundation-web-link", "button" === y.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === f || C) && "inline-flex items-center gap-xsmall", void 0 !== g && i[g], o[m], "always" === b ? "underline" : "no-underline", "hover" === b && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", p), E = C ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (h) {
                let {
                    as: e,
                    ...t
                } = y, r = a.default.Children.only(c);
                return a.default.isValidElement(r) ? a.default.createElement(n.Slot, {
                    ref: s,
                    ...t,
                    className: P
                }, a.default.cloneElement(r, {}, a.default.createElement(a.default.Fragment, null, r.props.children, E))) : null
            }
            if ("button" === y.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = y;
                return a.default.createElement("button", {
                    ref: s,
                    type: null != t ? t : "button",
                    ...n,
                    className: P
                }, c, E)
            }
            let {
                as: S,
                ...I
            } = y;
            return a.default.createElement("a", {
                ref: s,
                ...I,
                className: P
            }, c, E)
        });
    s.displayName = "Link", e.s(["Link", 0, s])
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
        var i, o, s, l, u = e.children,
            d = (0, t.a)(e, ["children"]),
            c = (0, a.useRef)(null),
            p = (0, a.useState)(!1),
            g = p[0],
            m = p[1],
            f = (0, a.useState)([]),
            b = f[0],
            v = f[1],
            h = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), v(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [v]),
            y = (0, a.useCallback)(function() {
                m(!1)
            }, [m]);
        (0, a.useEffect)(function() {
            b.length > 0 && m(!0)
        }, [b.length]);
        var C = (0, a.useMemo)(function() {
            return {
                ref: c,
                enqueue: h,
                close: y
            }
        }, [y, h]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(r.Provider, {
            value: C
        }, u), a.default.createElement(n.S, (0, t._)({}, (null == (i = b[0]) ? void 0 : i.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (o = b[0]) ? void 0 : o.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, r, i;
                    v(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = b[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (i = null == (r = b[0]) ? void 0 : r.props.TransitionProps) || i.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, r;
                (null == (a = b[0]) ? void 0 : a.shouldClose(t)) && m(!1), (null == (n = b[0]) ? void 0 : n.props.onClose) && (null == (r = b[0]) || r.props.onClose(e, t))
            },
            open: g
        }), null == (l = b[0]) ? void 0 : l.props.children))
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
                var o, s, l, u, d;
                let c = r.options,
                    p = null == (l = r.fetchOptions) || null == (s = l.meta) || null == (o = s.fetchMore) ? void 0 : o.direction,
                    g = (null == (u = r.state.data) ? void 0 : u.pages) || [],
                    m = (null == (d = r.state.data) ? void 0 : d.pageParams) || [],
                    f = {
                        pages: [],
                        pageParams: []
                    },
                    b = 0,
                    v = async () => {
                        let i = !1,
                            o = (0, t.ensureQueryFn)(r.options, r.fetchOptions),
                            s = async (e, a, n) => {
                                let s;
                                if (i) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let l = (Object.defineProperty(s = {
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
                                    }), s),
                                    u = await o(l),
                                    {
                                        maxPages: d
                                    } = r.options,
                                    c = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: c(e.pages, u, d),
                                    pageParams: c(e.pageParams, a, d)
                                }
                            };
                        if (p && g.length) {
                            let e = "backward" === p,
                                t = {
                                    pages: g,
                                    pageParams: m
                                },
                                r = (e ? n : a)(c, t);
                            f = await s(t, r, e)
                        } else {
                            let t = null != e ? e : g.length;
                            do {
                                var l;
                                let e = 0 === b ? null != (l = m[0]) ? l : c.initialPageParam : a(c, f);
                                if (b > 0 && null == e) break;
                                f = await s(f, e), b++
                            } while (b < t)
                        }
                        return f
                    };
                r.options.persister ? r.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = r.options).persister) ? void 0 : e.call(t, v, {
                        client: r.client,
                        queryKey: r.queryKey,
                        meta: r.options.meta,
                        signal: r.signal
                    }, i)
                } : r.fetchFn = v
            }
        }
    }])
}, 725924, e => {
    "use strict";
    let t, a;
    var n, r, i = e.i(416340);
    let o = "u" > typeof Intl,
        s = !o || void 0 === Intl.Locale,
        l = !o || void 0 === Intl.RelativeTimeFormat,
        u = !o || void 0 === Intl.PluralRules,
        d = !o || void 0 === Intl.DisplayNames,
        c = "function" != typeof window.ResizeObserver,
        p = (n = s || l || u || d || c, r = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, d ? e.A(951862).then(() => e.A(890267)) : null])), c ? e.A(956827) : null])
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
    let s = () => null;
    e.s(["UnifiedLoggerProvider", 0, e => {
        var o;
        let {
            children: s,
            unifiedLogger: l,
            pageLoggerConfig: u,
            path: d,
            url: c,
            isReady: p = !0
        } = e, g = null != (o = null == u ? void 0 : u.tags) ? o : n, m = null == u ? void 0 : u.rosId, f = (0, t.useMemo)(() => ({
            tags: g,
            rosId: m,
            path: d,
            url: c,
            isReady: p
        }), [g, m, d, c, p]), b = (0, t.useRef)(f), v = (0, t.useRef)(f);
        (0, t.useLayoutEffect)(() => {
            v.current = f, void 0 === b.current.path && void 0 !== f.path && (b.current = {
                ...b.current,
                path: f.path
            })
        }, [f]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && i.has(a)) ? b.current : v.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return r.forEach(t => {
                l.events.on(t, e)
            }), () => {
                r.forEach(t => {
                    l.events.off(t, e)
                })
            }
        }, [l]);
        let h = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: f
        }), [l, f]);
        return t.default.createElement(a.Provider, {
            value: h
        }, s)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: a,
            pageContext: n
        } = o(), {
            path: r,
            url: i,
            isReady: l
        } = n, u = a.pageSettledTracker, d = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, s);
        (0, t.useEffect)(() => {
            if (!d || d.isNavigating || !l || !r || !i || !e || d.url.split(/[?#]/)[0] !== i.split(/[?#]/)[0]) return;
            let t = new URL(r, window.location.origin).pathname,
                n = requestAnimationFrame(() => {
                    n = requestAnimationFrame(() => {
                        a.logPageSettledEvent({
                            navigationId: d.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(n)
        }, [d, l, i, r, e, a])
    }, "useUnifiedLoggerProvider", 0, o])
}]);

//# debugId=b8ee162c-4431-9a63-3be8-8b248bcffd0e
//# sourceMappingURL=12vzaff3d8u61.js.map