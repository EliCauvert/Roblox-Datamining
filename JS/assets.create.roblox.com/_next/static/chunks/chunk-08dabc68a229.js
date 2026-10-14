;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b5014c4c-1055-af8b-cadf-5d47323b63cb")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 245299, e => {
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
        c = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["enableEarlyTestersUserOwnedGame", 0, c, "enablePlayerHostedEvents", 0, r, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, s, "enablePlayerSupportCategoryChange", 0, l, "enablePlayerSupportCreatorTicketReroute", 0, i, "enablePlayerSupportSpamManagement", 0, u, "enablePlayerSupportTicketTranslation", 0, n, "enableReachStatusBadge", 0, o])
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
    var c = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: a,
            translate: o,
            translateHTML: s,
            translateWithNamespace: d,
            translateWithNamespaceHTML: g
        } = e, p = (0, t.useMemo)(() => ({
            ready: a,
            translate: o,
            translateHTML: s,
            translateWithNamespace: d,
            translateWithNamespaceHTML: g
        }), [a, o, s, d, g]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: p.ready,
                translate: (0, c.translationFn)(p),
                translateHTML: (0, c.translateHTMLFn)(p),
                translateWithNamespace: p.translateWithNamespace,
                translateWithNamespaceHTML: p.translateWithNamespaceHTML
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
                    return (e, s, c, d, g) => {
                        let p = l();
                        if (!p.isAllowed) return o(c, d, g);
                        if (p.preferLoadedTranslations && a) {
                            let e = o(c, d, g);
                            if ("" !== e) return e
                        }
                        return ((e, a, o) => {
                            let s, l;
                            if (void 0 === a && void 0 === o) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: c
                            } = (s = {}, l = {}, void 0 === o || Object.entries(o).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? s[t] = a : l[t] = a
                            }), {
                                stringArgs: s,
                                htmlArgs: l
                            }), d = n(e, u), g = d.split(i).filter(e => !!e);
                            if (1 === g.length) return d;
                            let p = [...g];
                            if (0 !== Object.keys(c).length) {
                                let e = g.reduce((e, t, a) => {
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
                                        p[e] = n
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...p);
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
                                b = [],
                                f = [],
                                v = [];
                            for (let e = p.shift(); void 0 !== e; e = p.shift())
                                if ("string" == typeof e && r.test(e))
                                    if (Object.hasOwn(m, e)) f.push(e), v.push(e);
                                    else {
                                        let a = f.pop();
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
                                            0 === v.length ? b.push(s) : v.push(s)
                                        }
                                    }
                            else 0 === v.length ? b.push(e) : v.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...b)
                        })(p.preferLoadedTranslations && !a ? e : u(e, p), d, g)
                    }
                })(e)
            }
        }, [p])
    }], 401263)
}, 29929, e => {
    "use strict";
    var t, a, n, r, i, o, s, l, u, c, d, g, p, m, b, f, v, h, y = e.i(650502),
        P = e.i(864392),
        C = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        E = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        I = ((n = {}).EnableIPRecommender = "enableIPRecommender", n),
        O = ((r = O || {}).EnableVideoOnboarding = "enableVideoOnboarding", r),
        S = ((i = S || {}).EnableSignalLookup = "enableSignalLookup", i.AlwaysShow = "alwaysShow", i),
        R = R || {},
        w = ((o = w || {}).mobileVariant = "mobileVariant", o),
        T = T || {},
        x = ((s = {}).ShowEditInStudioButton = "showEditInStudioButton", s.EnableCreationsNavLayout = "enableCreationsIPNavLayout", s),
        L = ((l = {}).EnableBulkAssetUpload = "enableBulkAssetUpload", l),
        U = ((u = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", u.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", u.EnableAudienceControls = "enableAudienceControls", u.EnableNewBadgePattern = "enableNewBadgePattern", u.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", u.EnableAudiencesReplacement = "enableAudiencesReplacement", u),
        k = ((c = {}).EnableTalentHubV2 = "enableTalentHubV2", c.EnableTalentHubV2M2 = "enableTalentHubV2M2", c),
        z = ((d = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", d),
        A = ((g = A || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", g),
        H = ((p = H || {}).GameAppealsEnabled = "gameAppealsEnabled", p),
        M = ((m = M || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", m),
        N = ((b = N || {}).EnableChangelogCMS = "enableChangelogCMS", b),
        F = ((f = {}).CreatorDashboard = "CreatorDashboard", f.CreatorHubHomePage = "CreatorHub.HomePage.UserId", f.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", f.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", f.CreatorHubLandingPage = "CreatorHub.LandingPage", f.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", f.CreatorHubNavigation = "CreatorHub.Navigation", f.CreatorHubNavigationUser = "CreatorHub.Navigation.User", f.CreatorHubPublishing = "CreatorHub.Publishing.UserId", f.LicenseManager = "CreatorDashboard.LicenseManager", f.RightsManager = "CreatorDashboard.RightsManager", f.StarterPlaceCreation = "CRK.StarterPlace.StarterPlaceCreation", f.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", f.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", f.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", f.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", f.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", f.CreatorHubChangelog = "CreatorHub.Changelog", f.TalentHub = "CreatorHub.TalentHub.UserId", f),
        G = ((v = G || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", v.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", v.ShowSecrets = "showSecrets", v.ShowQualitySignalCards = "showQualitySignalCards", v);
    let D = {
        CreatorDashboard: C,
        "CreatorHub.HomePage.UserId": O,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": S,
        "CreatorHub.LandingPage": R,
        "CreatorHub.LandingPage.UserId": w,
        "CreatorHub.Navigation": T,
        "CreatorHub.Navigation.User": x,
        "CreatorHub.Publishing.UserId": L,
        "CreatorDashboard.LicenseManager": I,
        "CreatorDashboard.RightsManager": E,
        "CRK.StarterPlace.StarterPlaceCreation": z,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((h = {}).SearchVersion = "searchVersion", h),
        "CreatorHub.Creations.Permission": U,
        "CreatorHub.ExperienceWebhooks.UserId": A,
        "CreatorHub.GameAppeals.UserId": H,
        "CreatorHub.HomePage.ExperienceTile.UserId": M,
        "CreatorHub.Changelog": N,
        "CreatorHub.TalentHub.UserId": k
    };
    async function V(e) {
        let t = (0, y.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(D[e]).join(","),
            n = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(n, {
            credentials: "include"
        })).json()
    }
    let j = (0, P.default)(V);
    e.s(["CreatorHubCreationsPermissionParameters", () => U, "CreatorHubPublishingParameters", () => L, "IXPLayers", () => F, "LicenseManagerParameters", () => I, "TalentHubParameters", () => k, "fetchIXPParametersForCurrentUser", 0, j])
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
            getUsersWithRole: async (e, t, a, n, r) => s.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n,
                isDefault: r
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
            getUsersByOrganization: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            removeUserFromOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdDelete({
                organizationId: e,
                userId: t
            }),
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
            getUserRoles: async (e, t, a, n) => l.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: a,
                maxPageSize: n
            }),
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: a
            }),
            removeUserFromRole: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: a
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
}, 745873, e => {
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
        c = new o.GroupsApi(u),
        d = function() {
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
                    }, c.groupsListGroups(e)
                }
            })
        },
        g = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: i
        } = e, {
            user: o
        } = (0, n.useRobloxAuthentication)(), {
            data: s,
            isLoading: l,
            refetch: u
        } = d(), [c, p] = (0, r.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [m, b] = (0, r.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [f, v] = (0, r.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), h = (0, a.useCallback)(e => {
            b(e);
            let t = null === e ? "user" : e;
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
        }, [b, v]), y = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === c) return [];
            try {
                return "string" == typeof c ? JSON.parse(c) : c
            } catch (e) {
                return []
            }
        }, [c, null == s ? void 0 : s.groups]), P = (0, a.useMemo)(() => {
            var e;
            return m && null != (e = y.find(e => {
                let {
                    id: t
                } = e;
                return t === m
            })) ? e : null
        }, [m, y]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !l && p(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, y, l, p, null == o ? void 0 : o.id]);
        let C = (0, a.useMemo)(() => ({
            groups: y,
            currentGroup: P,
            groupData: f,
            isFetched: !l && !!(null == o ? void 0 : o.id),
            refreshGroups: u,
            setCurrentGroup: h
        }), [P, f, y, l, u, h, null == o ? void 0 : o.id]);
        return (0, t.jsx)(g.Provider, {
            value: C,
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
                    present: c,
                    children: d
                } = e,
                g = function(e) {
                    var a, r;
                    let [o, s] = t.useState(), l = t.useRef(null), u = t.useRef(e), c = t.useRef("none"), [d, g] = (a = e ? "mounted" : "unmounted", r = {
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
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, n.useLayoutEffect)(() => {
                        let t = l.current,
                            a = u.current;
                        if (a !== e) {
                            let n = c.current,
                                r = i(t);
                            e ? g("MOUNT") : "none" === r || (null == t ? void 0 : t.display) === "none" ? g("UNMOUNT") : a && n !== r ? g("ANIMATION_OUT") : g("UNMOUNT"), u.current = e
                        }
                    }, [e, g]), (0, n.useLayoutEffect)(() => {
                        if (o) {
                            var e;
                            let t, a = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = i(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === o && n && (g("ANIMATION_END"), !u.current)) {
                                        let e = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                        })
                                    }
                                },
                                r = e => {
                                    e.target === o && (c.current = i(l.current))
                                };
                            return o.addEventListener("animationstart", r), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), o.removeEventListener("animationstart", r), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                            }
                        }
                        g("ANIMATION_END")
                    }, [o, g]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            l.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(c),
                p = "function" == typeof d ? d({
                    present: g.isPresent
                }) : t.Children.only(d),
                m = (0, a.useComposedRefs)(g.ref, (u = (l = null == (o = Object.getOwnPropertyDescriptor((r = p).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? r.ref : (u = (l = null == (s = Object.getOwnPropertyDescriptor(r, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? r.props.ref : r.props.ref || r.ref);
            return "function" == typeof d || g.isPresent ? t.cloneElement(p, {
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
        c = e.i(692166),
        d = e.i(169525),
        g = e.i(600317),
        p = e.i(221628),
        m = "Checkbox",
        [b, f] = (0, o.createContextScope)(m),
        [v, h] = b(m);

    function y(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: i,
            disabled: o,
            form: s,
            name: u,
            onCheckedChange: c,
            required: d,
            value: g = "on",
            internal_do_not_use_render: b
        } = e, [f, h] = (0, l.useControllableState)({
            prop: a,
            defaultProp: null != i && i,
            onChange: c,
            caller: m
        }), [y, P] = r.useState(null), [C, E] = r.useState(null), I = r.useRef(!1), O = !y || !!s || !!y.closest("form"), S = {
            checked: f,
            disabled: o,
            setChecked: h,
            control: y,
            setControl: P,
            name: u,
            form: s,
            value: g,
            hasConsumerStoppedPropagationRef: I,
            required: d,
            defaultChecked: !w(i) && i,
            isFormControl: O,
            bubbleInput: C,
            setBubbleInput: E
        };
        return (0, p.jsx)(v, {
            scope: t,
            ...S,
            children: "function" == typeof b ? b(S) : n
        })
    }
    var P = "CheckboxTrigger",
        C = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: o,
                ...l
            } = e, {
                control: u,
                value: c,
                disabled: d,
                checked: m,
                required: b,
                setControl: f,
                setChecked: v,
                hasConsumerStoppedPropagationRef: y,
                isFormControl: C,
                bubbleInput: E
            } = h(P, a), I = (0, i.useComposedRefs)(t, f), O = r.useRef(m);
            return r.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => v(O.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, v]), (0, p.jsx)(g.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": w(m) ? "mixed" : m,
                "aria-required": b,
                "data-state": T(m),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: c,
                ...l,
                ref: I,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(o, e => {
                    v(e => !!w(e) || !e), E && C && (y.current = e.isPropagationStopped(), y.current || e.stopPropagation())
                })
            })
        });
    C.displayName = P;
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
            form: c,
            ...d
        } = e;
        return (0, p.jsx)(y, {
            __scopeCheckbox: a,
            checked: r,
            defaultChecked: i,
            disabled: s,
            required: o,
            onCheckedChange: u,
            name: n,
            form: c,
            value: l,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, p.jsxs)(p.Fragment, {
                    children: [(0, p.jsx)(C, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, p.jsx)(R, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    E.displayName = m;
    var I = "CheckboxIndicator",
        O = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...r
            } = e, i = h(I, a);
            return (0, p.jsx)(d.Presence, {
                present: n || w(i.checked) || !0 === i.checked,
                children: (0, p.jsx)(g.Primitive.span, {
                    "data-state": T(i.checked),
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
    O.displayName = I;
    var S = "CheckboxBubbleInput",
        R = r.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: s,
                checked: l,
                defaultChecked: d,
                required: m,
                disabled: b,
                name: f,
                value: v,
                form: y,
                bubbleInput: P,
                setBubbleInput: C
            } = h(S, a), E = (0, i.useComposedRefs)(t, C), I = (0, u.usePrevious)(l), O = (0, c.useSize)(o);
            r.useEffect(() => {
                if (!P) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (I !== l && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    P.indeterminate = w(l), e.call(P, !w(l) && l), P.dispatchEvent(a)
                }
            }, [P, I, l, s]);
            let R = r.useRef(!w(l) && l);
            return (0, p.jsx)(g.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != d ? d : R.current,
                required: m,
                disabled: b,
                name: f,
                value: v,
                form: y,
                ...n,
                tabIndex: -1,
                ref: E,
                style: {
                    ...n.style,
                    ...O,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function w(e) {
        return "indeterminate" === e
    }

    function T(e) {
        return w(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    R.displayName = S;
    let x = {
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
        U = {
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
            hint: c,
            placement: d,
            onCheckedChange: g,
            id: p,
            ...m
        } = e, b = (0, a.default)(), f = p || b, v = i && r.default.createElement("label", {
            htmlFor: f,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !l && "cursor-pointer")
        }, r.default.createElement("span", {
            className: (0, n.default)(U[u], k[u], "content-emphasis")
        }, i), c && r.default.createElement("span", {
            className: "text-body-medium content-default"
        }, c));
        return r.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", l && "opacity-[0.5]", !l && "cursor-pointer", o)
        }, "End" === d && v, r.default.createElement("div", {
            className: (0, n.default)(L[u])
        }, r.default.createElement(E, {
            "data-slot": "checkbox",
            className: (0, n.default)(x[u], t.interactable, !l && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: f,
            checked: s,
            disabled: l,
            onCheckedChange: g,
            "aria-label": i,
            ...m
        }, r.default.createElement(t.StateLayer, null), r.default.createElement(O, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(x[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === d && v)
    }], 904451)
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
            c = (0, t.a)(e, ["children"]),
            d = (0, a.useRef)(null),
            g = (0, a.useState)(!1),
            p = g[0],
            m = g[1],
            b = (0, a.useState)([]),
            f = b[0],
            v = b[1],
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
            f.length > 0 && m(!0)
        }, [f.length]);
        var P = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: h,
                close: y
            }
        }, [y, h]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(r.Provider, {
            value: P
        }, u), a.default.createElement(n.S, (0, t._)({}, (null == (i = f[0]) ? void 0 : i.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (o = f[0]) ? void 0 : o.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, r, i;
                    v(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = f[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (i = null == (r = f[0]) ? void 0 : r.props.TransitionProps) || i.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, r;
                (null == (a = f[0]) ? void 0 : a.shouldClose(t)) && m(!1), (null == (n = f[0]) ? void 0 : n.props.onClose) && (null == (r = f[0]) || r.props.onClose(e, t))
            },
            open: p
        }), null == (l = f[0]) ? void 0 : l.props.children))
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
                var o, s, l, u, c;
                let d = r.options,
                    g = null == (l = r.fetchOptions) || null == (s = l.meta) || null == (o = s.fetchMore) ? void 0 : o.direction,
                    p = (null == (u = r.state.data) ? void 0 : u.pages) || [],
                    m = (null == (c = r.state.data) ? void 0 : c.pageParams) || [],
                    b = {
                        pages: [],
                        pageParams: []
                    },
                    f = 0,
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
                                        maxPages: c
                                    } = r.options,
                                    d = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: d(e.pages, u, c),
                                    pageParams: d(e.pageParams, a, c)
                                }
                            };
                        if (g && p.length) {
                            let e = "backward" === g,
                                t = {
                                    pages: p,
                                    pageParams: m
                                },
                                r = (e ? n : a)(d, t);
                            b = await s(t, r, e)
                        } else {
                            let t = null != e ? e : p.length;
                            do {
                                var l;
                                let e = 0 === f ? null != (l = m[0]) ? l : d.initialPageParam : a(d, b);
                                if (f > 0 && null == e) break;
                                b = await s(b, e), f++
                            } while (f < t)
                        }
                        return b
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
        c = !o || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        g = (n = s || l || u || c || d, r = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
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
    e.s(["usePolyfills", 0, g], 725924)
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
            path: c,
            url: d,
            isReady: g = !0
        } = e, p = null != (o = null == u ? void 0 : u.tags) ? o : n, m = null == u ? void 0 : u.rosId, b = (0, t.useMemo)(() => ({
            tags: p,
            rosId: m,
            path: c,
            url: d,
            isReady: g
        }), [p, m, c, d, g]), f = (0, t.useRef)(b), v = (0, t.useRef)(b);
        (0, t.useLayoutEffect)(() => {
            v.current = b, void 0 === f.current.path && void 0 !== b.path && (f.current = {
                ...f.current,
                path: b.path
            })
        }, [b]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && i.has(a)) ? f.current : v.current;
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
            pageContext: b
        }), [l, b]);
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
        } = n, u = a.pageSettledTracker, c = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, s);
        (0, t.useEffect)(() => {
            if (!c || c.isNavigating || !l || !r || !i || !e || c.url.split(/[?#]/)[0] !== i.split(/[?#]/)[0]) return;
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
        }, [c, l, i, r, e, a])
    }, "useUnifiedLoggerProvider", 0, o])
}]);

//# debugId=b5014c4c-1055-af8b-cadf-5d47323b63cb
//# sourceMappingURL=1n89wvc00itxj.js.map