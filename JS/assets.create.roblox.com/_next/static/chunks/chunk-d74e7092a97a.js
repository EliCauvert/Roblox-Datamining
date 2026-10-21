;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b8132c32-d04c-4939-477a-d59f7355b55d")
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
    let n = /{(.+?)}/,
        l = /({.+?})/g,
        i = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        o = /(?:^|\.)robloxlabs\.com$/,
        s = () => {
            let e, t = i.test(window.location.hostname),
                a = window.location.hostname.includes("localhost"),
                r = "string" == typeof(e = window.location.hostname) && o.test(e);
            return {
                isSSR: !1,
                isAllowed: t || a || r,
                isDangerous: t || r,
                preferLoadedTranslations: r
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var c = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: a,
            translate: i,
            translateHTML: o,
            translateWithNamespace: d,
            translateWithNamespaceHTML: m
        } = e, g = (0, t.useMemo)(() => ({
            ready: a,
            translate: i,
            translateHTML: o,
            translateWithNamespace: d,
            translateWithNamespaceHTML: m
        }), [a, i, o, d, m]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: g.ready,
                translate: (0, c.translationFn)(g),
                translateHTML: (0, c.translateHTMLFn)(g),
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
                    return (e, n, l, i) => {
                        let o = s();
                        if (!o.isAllowed) return a(l, i);
                        if (o.preferLoadedTranslations && t) {
                            let e = a(l, i);
                            if (e.length > 0) return e
                        }
                        return r(o.preferLoadedTranslations && !t ? e : u(e, o), i)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: a,
                        translateHTML: i
                    } = e;
                    return (e, o, c, d, m) => {
                        let g = s();
                        if (!g.isAllowed) return i(c, d, m);
                        if (g.preferLoadedTranslations && a) {
                            let e = i(c, d, m);
                            if ("" !== e) return e
                        }
                        return ((e, a, i) => {
                            let o, s;
                            if (void 0 === a && void 0 === i) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: c
                            } = (o = {}, s = {}, void 0 === i || Object.entries(i).forEach(e => {
                                let [t, a] = e;
                                "string" == typeof a ? o[t] = a : s[t] = a
                            }), {
                                stringArgs: o,
                                htmlArgs: s
                            }), d = r(e, u), m = d.split(l).filter(e => !!e);
                            if (1 === m.length) return d;
                            let g = [...m];
                            if (0 !== Object.keys(c).length) {
                                let e = m.reduce((e, t, a) => {
                                    let r = n.exec(t);
                                    if (r) {
                                        let t = r[1];
                                        if (Object.hasOwn(c, t)) {
                                            let r = e[t];
                                            if (!r) return Object.assign(e, {
                                                [t]: [a]
                                            });
                                            r.push(a)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(c).forEach(t => {
                                    let [a, r] = t, n = e[a];
                                    n && n.forEach(e => {
                                        g[e] = r
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...g);
                            let b = a.reduce((e, t) => {
                                    let {
                                        opening: a,
                                        closing: r,
                                        content: n
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(a, "}")]: {
                                            match: "{".concat(r, "}"),
                                            content: n
                                        }
                                    })
                                }, {}),
                                p = [],
                                f = [],
                                h = [];
                            for (let e = g.shift(); void 0 !== e; e = g.shift())
                                if ("string" == typeof e && n.test(e))
                                    if (Object.hasOwn(b, e)) f.push(e), h.push(e);
                                    else {
                                        let a = f.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: r,
                                                content: n
                                            } = b[a];
                                            if (e !== r) break;
                                            let l = [],
                                                i = !1;
                                            for (; h.length > 0 && !i;) {
                                                let e = h.pop();
                                                e === a ? i = !0 : l.unshift(e)
                                            }
                                            let o = n(l.every(e => "string" == typeof e) ? l : (0, t.createElement)(t.Fragment, null, ...l));
                                            0 === h.length ? p.push(o) : h.push(o)
                                        }
                                    }
                            else 0 === h.length ? p.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...p)
                        })(g.preferLoadedTranslations && !a ? e : u(e, g), d, m)
                    }
                })(e)
            }
        }, [g])
    }], 401263)
}, 358763, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(296380);
    let r = () => {};
    e.s(["default", 0, function(e, n) {
        let {
            debounceDelay: l,
            intersectionObserverThreshold: i,
            resetOncePer: o
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, s = (0, t.useRef)(!1), u = (0, t.useCallback)(e => {
            !e || s.current || (s.current = !0, n())
        }, [n]), [c] = (0, a.default)(u, null != l ? l : 250), d = (0, t.useCallback)(e => {
            let [t] = e;
            c(t.isIntersecting)
        }, [c]), m = null != o ? o : "instance";
        (0, t.useMemo)(() => {
            "callback" === m && (s.current = !1)
        }, [n]), (0, t.useEffect)(() => {
            if (!e.current) return r;
            let t = new IntersectionObserver(d, {
                threshold: null != i ? i : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, i, d])
    }])
}, 29929, e => {
    "use strict";
    var t, a, r, n, l, i, o, s, u, c, d, m, g, b, p, f, h, v = e.i(650502),
        y = e.i(864392),
        C = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        E = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        S = ((r = {}).EnableIPRecommender = "enableIPRecommender", r),
        w = ((n = w || {}).EnableVideoOnboarding = "enableVideoOnboarding", n),
        P = ((l = P || {}).EnableSignalLookup = "enableSignalLookup", l.AlwaysShow = "alwaysShow", l),
        x = x || {},
        T = ((i = T || {}).mobileVariant = "mobileVariant", i),
        H = H || {},
        A = ((o = {}).ShowEditInStudioButton = "showEditInStudioButton", o.EnableCreationsNavLayout = "enableCreationsIPNavLayout", o),
        U = ((s = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", s),
        k = ((u = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", u.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", u.EnableAudienceControls = "enableAudienceControls", u.EnableNewBadgePattern = "enableNewBadgePattern", u.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", u.EnableAudiencesReplacement = "enableAudiencesReplacement", u),
        I = ((c = {}).EnableTalentHubV2 = "enableTalentHubV2", c.EnableTalentHubV2M2 = "enableTalentHubV2M2", c),
        R = ((d = R || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", d),
        M = ((m = M || {}).GameAppealsEnabled = "gameAppealsEnabled", m),
        O = ((g = O || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", g),
        N = ((b = N || {}).EnableChangelogCMS = "enableChangelogCMS", b),
        L = ((p = {}).CreatorDashboard = "CreatorDashboard", p.CreatorHubHomePage = "CreatorHub.HomePage.UserId", p.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", p.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", p.CreatorHubLandingPage = "CreatorHub.LandingPage", p.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", p.CreatorHubNavigation = "CreatorHub.Navigation", p.CreatorHubNavigationUser = "CreatorHub.Navigation.User", p.CreatorHubPublishing = "CreatorHub.Publishing.UserId", p.LicenseManager = "CreatorDashboard.LicenseManager", p.RightsManager = "CreatorDashboard.RightsManager", p.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", p.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", p.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", p.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", p.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", p.CreatorHubChangelog = "CreatorHub.Changelog", p.TalentHub = "CreatorHub.TalentHub.UserId", p),
        F = ((f = F || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", f.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", f.ShowSecrets = "showSecrets", f.ShowQualitySignalCards = "showQualitySignalCards", f);
    let G = {
        CreatorDashboard: C,
        "CreatorHub.HomePage.UserId": w,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": P,
        "CreatorHub.LandingPage": x,
        "CreatorHub.LandingPage.UserId": T,
        "CreatorHub.Navigation": H,
        "CreatorHub.Navigation.User": A,
        "CreatorHub.Publishing.UserId": U,
        "CreatorDashboard.LicenseManager": S,
        "CreatorDashboard.RightsManager": E,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((h = {}).SearchVersion = "searchVersion", h),
        "CreatorHub.Creations.Permission": k,
        "CreatorHub.ExperienceWebhooks.UserId": R,
        "CreatorHub.GameAppeals.UserId": M,
        "CreatorHub.HomePage.ExperienceTile.UserId": O,
        "CreatorHub.Changelog": N,
        "CreatorHub.TalentHub.UserId": I
    };
    async function D(e) {
        let t = (0, v.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(G[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let j = (0, y.default)(D);
    e.s(["CreatorHubCreationsPermissionParameters", () => k, "CreatorHubPublishingParameters", () => U, "IXPLayers", () => L, "LicenseManagerParameters", () => S, "TalentHubParameters", () => I, "fetchIXPParametersForCurrentUser", 0, j])
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
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let a = (e, a) => {
        let r = (0, t.useRef)(null),
            n = (0, t.useCallback)(() => {
                null !== r.current && (clearTimeout(r.current), r.current = null)
            }, [r]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, l = Array(t), i = 0; i < t; i++) l[i] = arguments[i];
            n(), r.current = window.setTimeout(() => {
                e(...l), r.current = null
            }, a)
        }, [e, a, n]), n, r]
    };
    e.s(["default", 0, a, "useDebouncedFunction", 0, a])
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
        n = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                window.localStorage.setItem(e, JSON.stringify(t))
            } catch (e) {
                console.warn("Unable to write to local storage", e)
            }
        };
    e.s(["default", 0, function(e, l) {
        var i;
        let o = null != (i = null == l ? void 0 : l.cacheOnly) && i,
            [s, u] = (0, t.useState)(() => o ? {
                params: r(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == l ? void 0 : l.restoreInitialValueFromCache) ? r(e) : {},
                status: "initial",
                isFetched: !1
            });
        return (0, t.useEffect)(() => {
            o || (async () => {
                let t = {};
                try {
                    u(e => ({
                        ...e,
                        status: "loading"
                    })), t = await (0, a.fetchIXPParametersForCurrentUser)(e), u({
                        params: t,
                        isFetched: !0,
                        status: "success"
                    }), n(e, t)
                } catch (e) {
                    u(e => ({
                        ...e,
                        isFetched: !0,
                        status: "error"
                    }))
                }
            })()
        }, []), s
    }])
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624);
    e.s(["default", 0, (e, r) => {
        let n = (0, a.useRouter)(),
            l = n.query;
        return [(0, t.useMemo)(() => {
            let t = null != l ? l : {},
                a = {};
            for (let r of e) a[r] = t[r];
            return a
        }, [e, l]), (0, t.useCallback)(function(t) {
            var a;
            let l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                i = null != (a = n.query) ? a : {},
                o = {
                    ...i
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let a = t[e];
                null == a ? delete o[e] : Array.isArray(a) ? o[e] = a.map(e => e.toString()) : o[e] = a.toString()
            }), Array.from(new Set([...Object.keys(i), ...Object.keys(o)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let a = Array.isArray(e) ? e : [e],
                    r = Array.isArray(t) ? t : [t];
                return a.length === r.length && a.every((e, t) => e === r[t])
            })(i[e], o[e])) || (l.skipHistory ? n.replace({
                pathname: n.pathname,
                query: o
            }) : n.push({
                pathname: n.pathname,
                query: o
            }, void 0, r))
        }, [n, e, r])]
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
    var t = e.i(260022),
        a = e.i(17829);
    let r = "https://www.".concat("roblox.com"),
        n = "https://advertise.".concat("roblox.com"),
        l = e => "".concat(r, "/groups/").concat(e),
        i = e => "".concat(r, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, n, "BUY_ROBUX_CTX_CREATOR_HUB", 0, "creatorhub", "getAccountSecurityUrl", 0, () => "".concat(r, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(r, "/my/account#!/info"), "getAppealsPortalUrl", 0, () => "".concat(r, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(r, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(r, "/bundles/").concat(e), "getBuyRobuxUrl", 0, e => "".concat(r, "/upgrades/robux?ctx=").concat(encodeURIComponent(e)), "getCatalogUrl", 0, e => "".concat(r, "/catalog/").concat(e), "getCommunitiesUrl", 0, e => "".concat(r, "/communities/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(r, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(r, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, t) => e === a.default.Group ? l(t) : i(t), "getEventUrl", 0, e => "".concat(r, "/events/").concat(e), "getGameDetailsUrl", 0, e => "".concat(r, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(r, "/game-pass/").concat(e), "getGroupUrl", 0, l, "getHomeUrl", 0, () => "".concat(r, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(r, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(r, "/transactions"), "getLookUrl", 0, e => "".concat(r, "/looks/").concat(e), "getPlayOnWebUrl", 0, e => "".concat((0, t.resolveUrl)("playRobloxUrl", "production", "global"), "/games/start?placeId=").concat(e), "getSponsorAvatarItemsUrl", 0, () => "".concat(r, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(n, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(n, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(r, "/support"), "getTermsUrl", 0, () => "".concat(r, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(r, "/transactions"), "getUrl", 0, () => r, "getUserUrl", 0, i])
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
        n = e.i(533414),
        l = e.i(157310),
        i = e.i(279149),
        o = e.i(602635),
        s = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        c = new i.UserScreenApi(u),
        d = new i.GroupsApi(u),
        m = {
            groupsApi: d,
            userScreenApi: c,
            creatorHomeContentApi: new i.CreatorHomeContentApi(u),
            signalsApi: new i.SignalsApi(u)
        };
    e.s(["CreatorHomeClient", 0, m], 67262);
    let g = function() {
        let {
            user: e
        } = (0, s.useAuthentication)();
        return (0, l.useQuery)({
            queryKey: o.getGroupsQueryKey,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: i.GroupListSurface.CreatorHub
                }, m.groupsApi.groupsListGroups(e)
            }
        })
    };
    var b = e.i(809576);
    let p = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: l
        } = e, {
            user: i
        } = (0, r.useRobloxAuthentication)(), o = (0, b.useGroupPermissionFetchers)(), {
            data: s,
            isLoading: u,
            refetch: c
        } = g(), [d, m] = (0, n.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [f, h] = (0, n.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [v, y] = (0, n.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), C = (0, a.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            y(e => {
                let a = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: r,
                        lastSelected: n
                    } = e[t];
                    "number" != typeof r || Number.isNaN(r) || "number" != typeof n || Number.isNaN(n) || (a.priority = r * (1 + Math.log10(1 + 10 / Math.max(Date.now() - n, 864e5))))
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
        }, [d, null == s ? void 0 : s.groups]), S = (0, a.useMemo)(() => {
            var e;
            return f && null != (e = E.find(e => {
                let {
                    id: t
                } = e;
                return t === f
            })) ? e : null
        }, [f, E]), w = null == S ? void 0 : S.id, P = null == i ? void 0 : i.id, {
            data: x,
            error: T,
            isPending: H,
            refetch: A
        } = (0, b.useGroupResolvedPermissionsQuery)(w, P), {
            data: U,
            isPending: k,
            refetch: I
        } = (0, b.useGroupOwnershipQuery)(w, P), R = (0, a.useCallback)(() => null == w || null == P ? Promise.resolve() : Promise.all([A(), I()]), [I, A, w, P]);
        (0, a.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == s ? void 0 : s.groups) && !u && m(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, E, u, m, null == i ? void 0 : i.id]);
        let M = (0, a.useMemo)(() => {
            var e;
            return {
                groups: E,
                currentGroup: S,
                groupData: v,
                isFetched: !u && !!P,
                refreshGroups: c,
                setCurrentGroup: C,
                ...o,
                permissions: x,
                isOwner: null != P && (null == U || null == (e = U.owner) ? void 0 : e.userId) === P,
                isPermissionsLoading: null != S && (H || k),
                permissionsError: T,
                refreshPermissions: R
            }
        }, [S, v, E, u, k, H, U, o, x, T, c, R, C, P]);
        return (0, t.jsx)(p.Provider, {
            value: M,
            children: l
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
        n = e.i(795621),
        l = e.i(458451),
        i = e.i(285666),
        o = e.i(272593);
    let s = new i.PermissionsV2Api((0, o.createClientConfiguration)("groups", "bedev1"));
    async function u(e, t, a) {
        var r;
        return null != (r = (await s.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: a
        })).permissions) ? r : {}
    }
    async function c(e) {
        return u(e, "groups", String(e))
    }
    async function d(e) {
        let t, a = [];
        do {
            var r, n;
            let l = await s.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            a.push(...null != (r = l.data) ? r : []), t = null != (n = l.nextPageCursor) ? n : void 0
        } while (t) return a
    }
    var m = e.i(156071);
    let g = new i.PermissionsV2Api((0, o.createClientConfiguration)("groups", "bedev1"));
    async function b(e) {
        var t;
        return null != (t = (await g.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var p = e.i(759283);
    let f = (e, t) => ["groups", e, t, "resolved-permissions"],
        h = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        v = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, r.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => m.default.getGroupInfo(e) : a.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, l.useRobloxAuthentication)(), a = (0, n.useQueryClient)(), r = null == e ? void 0 : e.id, i = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: v(e, r),
            queryFn: () => b(e),
            staleTime: 6e4
        }), [a, r]), o = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: f(e, r),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [a, r]), s = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: h(e, r),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [a, r]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: o,
            fetchRolePermissions: s,
            fetchUniversePermissions: i
        }), [o, s, i])
    }, "useGroupResolvedPermissionsQuery", 0, function(e, t) {
        return (0, r.useQuery)({
            queryKey: f(e, t),
            queryFn: e && t ? () => c(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, l.useRobloxAuthentication)(), n = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: h(e, n),
            queryFn: e && n ? () => d(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, l.useRobloxAuthentication)(), n = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: v(e, n),
            queryFn: void 0 !== e && e !== p.uninitializedUniverseId ? () => b(e) : a.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 486736, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        r = e.i(639102);
    let n = {},
        l = {
            ...n
        },
        i = async () => {
            try {
                let {
                    applicationSettings: e = {}
                } = await r.settingsClient.getApplicationSettings(), t = {};
                return Object.entries(e).forEach(e => {
                    let [a, r] = e;
                    try {
                        let e = typeof n[a];
                        t[a] = "boolean" === e || "number" === e ? JSON.parse(r) : r
                    } catch (e) {
                        console.error(e)
                    }
                }), t
            } catch (e) {
                return n
            }
        }, o = (0, a.createContext)({
            settings: {
                ...l
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: r
        } = e, [n, s] = (0, a.useState)(() => ({
            settings: {
                ...l
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, a.useEffect)(() => {
            (async () => {
                let e = await Promise.allSettled([i()]);
                s({
                    settings: e.reduce((e, t) => ({
                        ...e,
                        ..."fulfilled" === t.status ? t.value : {}
                    }), l),
                    isFetched: !0,
                    status: e.find(e => "rejected" === e.status) ? "error" : "success"
                })
            })()
        }, []), (0, t.jsx)(o.Provider, {
            value: n,
            children: r
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: r
        } = (0, a.useContext)(o), n = (0, a.useRef)(e);
        return {
            settings: (0, a.useMemo)(() => {
                let t = n.current;
                return Object.keys(e).some(a => e[a] !== t[a]) && (n.current = e), n.current
            }, [e]),
            status: t,
            isFetched: r
        }
    }], 486736)
}, 369114, e => {
    "use strict";
    var t = e.i(75584),
        a = e.i(659332),
        r = e.i(197649),
        n = e.i(416340);
    let l = (0, n.createContext)(null),
        i = e => {
            let t = (0, n.useContext)(l);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        o = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        s = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        u = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        c = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        d = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        m = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        g = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        b = (0, n.forwardRef)((e, t) => {
            let {
                children: a,
                size: i = "Medium",
                variant: o = "Divided",
                className: s,
                ...u
            } = e, c = (0, n.useMemo)(() => ({
                size: i,
                variant: o
            }), [i, o]), d = "Framed" === o;
            return n.default.createElement(l.Provider, {
                value: c
            }, n.default.createElement("div", {
                className: (0, r.default)("width-full bg-surface-100", d && "radius-medium clip stroke-standard stroke-default")
            }, n.default.createElement("table", {
                ref: t,
                className: (0, r.default)("foundation-web-table width-full content-default", s),
                ...u
            }, a)))
        });
    b.displayName = "Table";
    let p = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            ...o
        } = e;
        return i("TableHeader"), n.default.createElement("thead", {
            ref: t,
            className: (0, r.default)("foundation-web-table-header", l),
            ...o
        }, a)
    });
    p.displayName = "TableHeader";
    let f = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            ...o
        } = e;
        return i("TableBody"), n.default.createElement("tbody", {
            ref: t,
            className: (0, r.default)("foundation-web-table-body", l),
            ...o
        }, a)
    });
    f.displayName = "TableBody";
    let h = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            isInteractive: o = !1,
            isHoverable: s = !1,
            isSelected: u = !1,
            isDisabled: c = !1,
            onClick: d,
            onKeyDown: m,
            tabIndex: g,
            role: b,
            ...p
        } = e;
        i("TableRow");
        let f = o ? {
            role: null != b ? b : "row",
            tabIndex: null != g ? g : 0,
            onClick: c ? void 0 : d,
            onKeyDown: e => {
                c || (null == m || m(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == d || d(e)))
            }
        } : {
            role: b,
            tabIndex: g,
            onClick: d,
            onKeyDown: m
        };
        return n.default.createElement("tr", {
            ref: t,
            "aria-selected": o ? u : void 0,
            "aria-disabled": !!o && !!c || void 0,
            "data-selected": u || void 0,
            className: (0, r.default)("foundation-web-table-row", (o || s) && "hover:bg-shift-100", o && !c && "cursor-pointer", o && c && "opacity-disabled pointer-events-none", u && "bg-shift-200", l),
            ...f,
            ...p
        }, a)
    });
    h.displayName = "TableRow";
    let v = (0, n.forwardRef)((e, a) => {
        let {
            children: l,
            className: o,
            sortDirection: d,
            onSort: b,
            align: p = "start",
            sortLabel: f,
            scope: h,
            ...v
        } = e, {
            size: y
        } = i("TableHeaderCell"), C = !!b, E = null != d ? d : "none", S = C && "none" !== E && n.default.createElement(t.Icon, {
            name: "ascending" === E ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), w = n.default.createElement("div", {
            className: (0, r.default)("flex items-center gap-xsmall", c[y], "content-muted", g[p])
        }, "end" === p && S, n.default.createElement("span", {
            className: "text-truncate-end"
        }, l), "end" !== p && S), P = "string" == typeof l ? "Sort by ".concat(l) : void 0;
        return n.default.createElement("th", {
            ref: a,
            scope: null != h ? h : "col",
            "aria-sort": C ? E : void 0,
            className: (0, r.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", u[y], s[y], m[p], "content-muted", o),
            ...v
        }, C ? n.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: b,
            "aria-label": null != f ? f : P
        }, w) : w)
    });
    v.displayName = "TableHeaderCell";
    let y = (0, n.forwardRef)((e, t) => {
        let {
            children: a,
            className: l,
            align: u = "start",
            ...c
        } = e, {
            size: g
        } = i("TableCell");
        return n.default.createElement("td", {
            ref: t,
            className: (0, r.default)("foundation-web-table-cell foundation-web-table-row-divider", o[g], s[g], d[g], m[u], "content-default", l),
            ...c
        }, a)
    });
    y.displayName = "TableCell";
    let C = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        E = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        S = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        w = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        P = {
            XSmall: "gap-xsmall",
            Small: "gap-xsmall",
            Medium: "gap-small"
        },
        x = {
            XSmall: "XSmall",
            Small: "XSmall",
            Medium: "Small"
        },
        T = (0, n.forwardRef)((e, t) => {
            let {
                size: l = "Medium",
                page: i,
                rowsPerPage: o,
                totalRows: s,
                rowsPerPageOptions: u = [10, 25, 50],
                onPageChange: c,
                onRowsPerPageChange: d,
                rowsPerPageLabel: m = "Rows per page",
                firstPageLabel: g = "First page",
                previousPageLabel: b = "Previous page",
                nextPageLabel: p = "Next page",
                lastPageLabel: f = "Last page",
                rangeLabel: h,
                className: v,
                ...y
            } = e, T = Math.max(1, Math.ceil(s / o)), H = 0 === i, A = i >= T - 1, U = 0 === s ? 0 : i * o + 1, k = Math.min((i + 1) * o, s), I = (0, n.useCallback)(e => {
                let t = Number(e.target.value);
                null == d || d(t), c(0)
            }, [d, c]), R = x[l];
            return n.default.createElement("div", {
                ref: t,
                className: (0, r.default)("flex items-center justify-end", C[l], E[l], v),
                ...y
            }, n.default.createElement("div", {
                className: "flex items-center gap-large"
            }, n.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, d && n.default.createElement("div", {
                className: "flex items-center gap-small"
            }, n.default.createElement("span", {
                className: (0, r.default)(S[l], "content-default")
            }, m), n.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, n.default.createElement("select", {
                className: (0, r.default)("foundation-web-table-pagination-select", S[l], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === l ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: o,
                onChange: I,
                "aria-label": m
            }, u.map(e => n.default.createElement("option", {
                key: e,
                value: e
            }, e))))), n.default.createElement("span", {
                className: (0, r.default)(w[l], "content-default")
            }, h ? h(U, k, s) : "".concat(U, "-").concat(k, " of ").concat(s))), n.default.createElement("div", {
                className: (0, r.default)("flex items-center", P[l])
            }, n.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: g,
                size: R,
                variant: "Utility",
                isDisabled: H,
                onClick: () => c(0)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: b,
                size: R,
                variant: "Utility",
                isDisabled: H,
                onClick: () => c(i - 1)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: p,
                size: R,
                variant: "Utility",
                isDisabled: A,
                onClick: () => c(i + 1)
            }), n.default.createElement(a.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: f,
                size: R,
                variant: "Utility",
                isDisabled: A,
                onClick: () => c(T - 1)
            }))))
        });
    T.displayName = "TablePagination", e.s(["Table", 0, b, "TableBody", 0, f, "TableCell", 0, y, "TableHeader", 0, p, "TableHeaderCell", 0, v, "TablePagination", 0, T, "TableRow", 0, h])
}, 990729, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        r = e.i(863762);
    e.i(221628), e.i(149285);
    var n = (0, a.createContext)({
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
        var l, i, o, s, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, a.useRef)(null),
            m = (0, a.useState)(!1),
            g = m[0],
            b = m[1],
            p = (0, a.useState)([]),
            f = p[0],
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
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(n.Provider, {
            value: C
        }, u), a.default.createElement(r.S, (0, t._)({}, (null == (l = f[0]) ? void 0 : l.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (i = f[0]) ? void 0 : i.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, r, n, l;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (r = null == (a = f[0]) ? void 0 : a.props.TransitionProps) ? void 0 : r.onExited) && (null == (l = null == (n = f[0]) ? void 0 : n.props.TransitionProps) || l.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, r, n;
                (null == (a = f[0]) ? void 0 : a.shouldClose(t)) && b(!1), (null == (r = f[0]) ? void 0 : r.props.onClose) && (null == (n = f[0]) || n.props.onClose(e, t))
            },
            open: g
        }), null == (s = f[0]) ? void 0 : s.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(n);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        r = [],
        n = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        l = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function i() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let o = () => null;
    e.s(["UnifiedLoggerProvider", 0, e => {
        var i;
        let {
            children: o,
            unifiedLogger: s,
            pageLoggerConfig: u,
            path: c,
            url: d,
            isReady: m = !0
        } = e, g = null != (i = null == u ? void 0 : u.tags) ? i : r, b = null == u ? void 0 : u.rosId, p = (0, t.useMemo)(() => ({
            tags: g,
            rosId: b,
            path: c,
            url: d,
            isReady: m
        }), [g, b, c, d, m]), f = (0, t.useRef)(p), h = (0, t.useRef)(p);
        (0, t.useLayoutEffect)(() => {
            h.current = p, void 0 === f.current.path && void 0 !== p.path && (f.current = {
                ...f.current,
                path: p.path
            })
        }, [p]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, r = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && l.has(a)) ? f.current : h.current;
                void 0 !== r.path && (e.parameters = {
                    ...e.parameters,
                    path: r.path
                }), r.tags.forEach(t => e.addTag(t)), void 0 !== r.rosId && e.addTag("owner: ".concat(r.rosId))
            };
            return n.forEach(t => {
                s.events.on(t, e)
            }), () => {
                n.forEach(t => {
                    s.events.off(t, e)
                })
            }
        }, [s]);
        let v = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: p
        }), [s, p]);
        return t.default.createElement(a.Provider, {
            value: v
        }, o)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: a,
            pageContext: r
        } = i(), {
            path: n,
            url: l,
            isReady: s
        } = r, u = a.pageSettledTracker, c = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, o);
        (0, t.useEffect)(() => {
            if (!c || c.isNavigating || !s || !n || !l || !e || c.url.split(/[?#]/)[0] !== l.split(/[?#]/)[0]) return;
            let t = new URL(n, window.location.origin).pathname,
                r = requestAnimationFrame(() => {
                    r = requestAnimationFrame(() => {
                        a.logPageSettledEvent({
                            navigationId: c.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(r)
        }, [c, s, l, n, e, a])
    }, "useUnifiedLoggerProvider", 0, i])
}]);

//# debugId=b8132c32-d04c-4939-477a-d59f7355b55d
//# sourceMappingURL=1pssm76x1c-5y.js.map