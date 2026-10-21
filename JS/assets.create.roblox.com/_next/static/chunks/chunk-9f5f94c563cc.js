;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "94eb9800-5717-bbbe-cdc5-023e6f3dabba")
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
        } = e, f = (0, t.useMemo)(() => ({
            ready: a,
            translate: i,
            translateHTML: o,
            translateWithNamespace: d,
            translateWithNamespaceHTML: m
        }), [a, i, o, d, m]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: f.ready,
                translate: (0, c.translationFn)(f),
                translateHTML: (0, c.translateHTMLFn)(f),
                translateWithNamespace: f.translateWithNamespace,
                translateWithNamespaceHTML: f.translateWithNamespaceHTML
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
                        let f = s();
                        if (!f.isAllowed) return i(c, d, m);
                        if (f.preferLoadedTranslations && a) {
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
                            let f = [...m];
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
                                        f[e] = r
                                    })
                                })
                            }
                            if (!Array.isArray(a) || 0 === a.length) return (0, t.createElement)(t.Fragment, null, ...f);
                            let p = a.reduce((e, t) => {
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
                                g = [],
                                b = [],
                                v = [];
                            for (let e = f.shift(); void 0 !== e; e = f.shift())
                                if ("string" == typeof e && n.test(e))
                                    if (Object.hasOwn(p, e)) b.push(e), v.push(e);
                                    else {
                                        let a = b.pop();
                                        if (void 0 !== a) {
                                            let {
                                                match: r,
                                                content: n
                                            } = p[a];
                                            if (e !== r) break;
                                            let l = [],
                                                i = !1;
                                            for (; v.length > 0 && !i;) {
                                                let e = v.pop();
                                                e === a ? i = !0 : l.unshift(e)
                                            }
                                            let o = n(l.every(e => "string" == typeof e) ? l : (0, t.createElement)(t.Fragment, null, ...l));
                                            0 === v.length ? g.push(o) : v.push(o)
                                        }
                                    }
                            else 0 === v.length ? g.push(e) : v.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...g)
                        })(f.preferLoadedTranslations && !a ? e : u(e, f), d, m)
                    }
                })(e)
            }
        }, [f])
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
    var t, a, r, n, l, i, o, s, u, c, d, m, f, p, g, b, v, h = e.i(650502),
        y = e.i(864392),
        E = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        C = ((a = {}).EnableRightsManager = "enableRightsManager", a.EnableBulkFiling = "enableBulkFiling", a.EnableOnDemandSearch = "enableOnDemandSearch", a.EnableEditRegistration = "enableEditRegistration", a.EnableImageSearch = "enableImageSearch", a.EnableClaimsAgainstMe = "enableClaimsAgainstMe", a.EnableGenAiOptOut = "enableGenAiOptOut", a.EnableInExperienceIpReporting = "enableInExperienceIpReporting", a.EnableIpContentSearch = "enableIpContentSearch", a.EnableTrademark = "enableTrademark", a),
        x = ((r = {}).EnableIPRecommender = "enableIPRecommender", r),
        w = ((n = w || {}).EnableVideoOnboarding = "enableVideoOnboarding", n),
        S = ((l = S || {}).EnableSignalLookup = "enableSignalLookup", l.AlwaysShow = "alwaysShow", l),
        P = P || {},
        N = ((i = N || {}).mobileVariant = "mobileVariant", i),
        T = T || {},
        M = ((o = {}).ShowEditInStudioButton = "showEditInStudioButton", o.EnableCreationsNavLayout = "enableCreationsIPNavLayout", o),
        k = ((s = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", s),
        A = ((u = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", u.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", u.EnableAudienceControls = "enableAudienceControls", u.EnableNewBadgePattern = "enableNewBadgePattern", u.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", u.EnableAudiencesReplacement = "enableAudiencesReplacement", u),
        I = ((c = {}).EnableTalentHubV2 = "enableTalentHubV2", c.EnableTalentHubV2M2 = "enableTalentHubV2M2", c),
        U = ((d = U || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", d),
        R = ((m = R || {}).GameAppealsEnabled = "gameAppealsEnabled", m),
        L = ((f = L || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", f),
        O = ((p = O || {}).EnableChangelogCMS = "enableChangelogCMS", p),
        H = ((g = {}).CreatorDashboard = "CreatorDashboard", g.CreatorHubHomePage = "CreatorHub.HomePage.UserId", g.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", g.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", g.CreatorHubLandingPage = "CreatorHub.LandingPage", g.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", g.CreatorHubNavigation = "CreatorHub.Navigation", g.CreatorHubNavigationUser = "CreatorHub.Navigation.User", g.CreatorHubPublishing = "CreatorHub.Publishing.UserId", g.LicenseManager = "CreatorDashboard.LicenseManager", g.RightsManager = "CreatorDashboard.RightsManager", g.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", g.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", g.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", g.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", g.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", g.CreatorHubChangelog = "CreatorHub.Changelog", g.TalentHub = "CreatorHub.TalentHub.UserId", g),
        D = ((b = D || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", b.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", b.ShowSecrets = "showSecrets", b.ShowQualitySignalCards = "showQualitySignalCards", b);
    let F = {
        CreatorDashboard: E,
        "CreatorHub.HomePage.UserId": w,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": S,
        "CreatorHub.LandingPage": P,
        "CreatorHub.LandingPage.UserId": N,
        "CreatorHub.Navigation": T,
        "CreatorHub.Navigation.User": M,
        "CreatorHub.Publishing.UserId": k,
        "CreatorDashboard.LicenseManager": x,
        "CreatorDashboard.RightsManager": C,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((v = {}).SearchVersion = "searchVersion", v),
        "CreatorHub.Creations.Permission": A,
        "CreatorHub.ExperienceWebhooks.UserId": U,
        "CreatorHub.GameAppeals.UserId": R,
        "CreatorHub.HomePage.ExperienceTile.UserId": L,
        "CreatorHub.Changelog": O,
        "CreatorHub.TalentHub.UserId": I
    };
    async function G(e) {
        let t = (0, h.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(F[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let j = (0, y.default)(G);
    e.s(["CreatorHubCreationsPermissionParameters", () => A, "CreatorHubPublishingParameters", () => k, "IXPLayers", () => H, "LicenseManagerParameters", () => x, "TalentHubParameters", () => I, "fetchIXPParametersForCurrentUser", 0, j])
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
    let f = function() {
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
    var p = e.i(809576);
    let g = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: l
        } = e, {
            user: i
        } = (0, r.useRobloxAuthentication)(), o = (0, p.useGroupPermissionFetchers)(), {
            data: s,
            isLoading: u,
            refetch: c
        } = f(), [d, m] = (0, n.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [b, v] = (0, n.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [h, y] = (0, n.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), E = (0, a.useCallback)(e => {
            v(e);
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
        }, [v, y]), C = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === d) return [];
            try {
                let e = "string" == typeof d ? JSON.parse(d) : d;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [d, null == s ? void 0 : s.groups]), x = (0, a.useMemo)(() => {
            var e;
            return b && null != (e = C.find(e => {
                let {
                    id: t
                } = e;
                return t === b
            })) ? e : null
        }, [b, C]), w = null == x ? void 0 : x.id, S = null == i ? void 0 : i.id, {
            data: P,
            error: N,
            isPending: T,
            refetch: M
        } = (0, p.useGroupResolvedPermissionsQuery)(w, S), {
            data: k,
            isPending: A,
            refetch: I
        } = (0, p.useGroupOwnershipQuery)(w, S), U = (0, a.useCallback)(() => null == w || null == S ? Promise.resolve() : Promise.all([M(), I()]), [I, M, w, S]);
        (0, a.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == s ? void 0 : s.groups) && !u && m(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, C, u, m, null == i ? void 0 : i.id]);
        let R = (0, a.useMemo)(() => {
            var e;
            return {
                groups: C,
                currentGroup: x,
                groupData: h,
                isFetched: !u && !!S,
                refreshGroups: c,
                setCurrentGroup: E,
                ...o,
                permissions: P,
                isOwner: null != S && (null == k || null == (e = k.owner) ? void 0 : e.userId) === S,
                isPermissionsLoading: null != x && (T || A),
                permissionsError: N,
                refreshPermissions: U
            }
        }, [x, h, C, u, A, T, k, o, P, N, c, U, E, S]);
        return (0, t.jsx)(g.Provider, {
            value: R,
            children: l
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
    let f = new i.PermissionsV2Api((0, o.createClientConfiguration)("groups", "bedev1"));
    async function p(e) {
        var t;
        return null != (t = (await f.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var g = e.i(759283);
    let b = (e, t) => ["groups", e, t, "resolved-permissions"],
        v = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        h = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, r.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => m.default.getGroupInfo(e) : a.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, l.useRobloxAuthentication)(), a = (0, n.useQueryClient)(), r = null == e ? void 0 : e.id, i = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: h(e, r),
            queryFn: () => p(e),
            staleTime: 6e4
        }), [a, r]), o = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: b(e, r),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [a, r]), s = (0, t.useCallback)(e => a.fetchQuery({
            queryKey: v(e, r),
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
            queryKey: b(e, t),
            queryFn: e && t ? () => c(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, l.useRobloxAuthentication)(), n = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: v(e, n),
            queryFn: e && n ? () => d(e) : a.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, l.useRobloxAuthentication)(), n = null == t ? void 0 : t.id;
        return (0, r.useQuery)({
            queryKey: h(e, n),
            queryFn: void 0 !== e && e !== g.uninitializedUniverseId ? () => p(e) : a.skipToken,
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
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        r = e.i(723570),
        n = e => {
            var n, i, o;
            let s, u, {
                    present: c,
                    children: d
                } = e,
                m = function(e) {
                    var a, n;
                    let [i, o] = t.useState(), s = t.useRef(null), u = t.useRef(e), c = t.useRef("none"), [d, m] = (a = e ? "mounted" : "unmounted", n = {
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
                        let a = n[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = l(s.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, r.useLayoutEffect)(() => {
                        let t = s.current,
                            a = u.current;
                        if (a !== e) {
                            let r = c.current,
                                n = l(t);
                            e ? m("MOUNT") : "none" === n || (null == t ? void 0 : t.display) === "none" ? m("UNMOUNT") : a && r !== n ? m("ANIMATION_OUT") : m("UNMOUNT"), u.current = e
                        }
                    }, [e, m]), (0, r.useLayoutEffect)(() => {
                        if (i) {
                            var e;
                            let t, a = null != (e = i.ownerDocument.defaultView) ? e : window,
                                r = e => {
                                    let r = l(s.current).includes(CSS.escape(e.animationName));
                                    if (e.target === i && r && (m("ANIMATION_END"), !u.current)) {
                                        let e = i.style.animationFillMode;
                                        i.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === i.style.animationFillMode && (i.style.animationFillMode = e)
                                        })
                                    }
                                },
                                n = e => {
                                    e.target === i && (c.current = l(s.current))
                                };
                            return i.addEventListener("animationstart", n), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r), () => {
                                a.clearTimeout(t), i.removeEventListener("animationstart", n), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                            }
                        }
                        m("ANIMATION_END")
                    }, [i, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            s.current = e ? getComputedStyle(e) : null, o(e)
                        }, [])
                    }
                }(c),
                f = "function" == typeof d ? d({
                    present: m.isPresent
                }) : t.Children.only(d),
                p = (0, a.useComposedRefs)(m.ref, (u = (s = null == (i = Object.getOwnPropertyDescriptor((n = f).props, "ref")) ? void 0 : i.get) && "isReactWarning" in s && s.isReactWarning) ? n.ref : (u = (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? n.props.ref : n.props.ref || n.ref);
            return "function" == typeof d || m.isPresent ? t.cloneElement(f, {
                ref: p
            }) : null
        };

    function l(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    n.displayName = "Presence", e.s(["Presence", 0, n])
}, 152324, 108872, e => {
    "use strict";
    var t = e.i(999210),
        a = e.i(641659),
        r = e.i(825942),
        n = e.i(753534),
        l = e.i(197649),
        i = e.i(416340),
        o = e.i(563921);
    let s = (0, i.createContext)(null),
        u = {
            XSmall: "size-300",
            Small: "size-400",
            Medium: "size-500",
            Large: "size-600"
        },
        c = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        d = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        m = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        f = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        p = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        g = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        b = (0, i.forwardRef)((e, b) => {
            let {
                label: v,
                labelTooltip: h,
                ariaLabelledBy: y,
                ariaLabel: E,
                className: C,
                size: x,
                variant: w = "Standard",
                value: S,
                placeholder: P,
                isDisabled: N,
                hasError: T,
                hint: M,
                onValueChange: k,
                onOpenChange: A,
                children: I
            } = e, U = (0, a.default)(), R = (0, i.useMemo)(() => ({
                size: x
            }), [x]), L = v ? i.default.createElement("span", {
                id: U,
                className: (0, l.default)(d[x], "content-emphasis")
            }, v) : null;
            return i.default.createElement(s.Provider, {
                value: R
            }, i.default.createElement("div", {
                className: (0, l.default)("flex flex-col", N && ["opacity-[0.5]", "pointer-events-none"], f[x], C)
            }, L && (h ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, L, i.default.createElement(r.LabelTooltip, h)) : L), i.default.createElement(o.Root, {
                value: S,
                disabled: N,
                onValueChange: k,
                onOpenChange: A
            }, i.default.createElement(o.Trigger, {
                className: (0, l.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", n.INPUT_BACKGROUND_BY_VARIANT[w], n.INPUT_STROKE_BY_VARIANT[w], p[x], g[x], c[x], m[x], T ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === S ? "content-muted" : "content-default"),
                ref: b,
                "aria-labelledby": v ? U : y,
                "aria-label": E
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(o.Value, {
                placeholder: P
            })), i.default.createElement(o.Icon, {
                className: (0, l.default)(u[x], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(o.Portal, null, i.default.createElement(o.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, I))), M && i.default.createElement("span", {
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": T,
                    "content-default": !T
                })
            }, M)))
        });
    b.displayName = "Dropdown", e.s(["Dropdown", 0, b, "DropdownContext", 0, s], 108872);
    var v = e.i(23342),
        h = e.i(142953);
    let y = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        E = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        C = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        x = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        w = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        S = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        P = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        N = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        T = (0, i.createContext)(null),
        M = () => {
            let e = (0, i.useContext)(T);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: a,
            className: r,
            size: n
        } = e, u = (0, i.useContext)(s), c = u ? "dropdown" : "standalone", d = null != (t = null != n ? n : null == u ? void 0 : u.size) ? t : "Medium", m = (0, i.useMemo)(() => ({
            size: d,
            mode: c
        }), [d, c]), f = (0, l.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", y[d], r), p = "standalone" === c ? i.default.createElement(h.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, i.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: f
        }, a)) : i.default.createElement("div", {
            className: f
        }, a);
        return i.default.createElement(T.Provider, {
            value: m
        }, "dropdown" === c ? i.default.createElement(o.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, p) : p)
    }, "MenuItem", 0, e => {
        let a, {
                value: r,
                leading: n,
                title: s,
                description: u,
                trailing: c,
                disabled: d,
                className: m,
                onSelect: f,
                asChild: p,
                children: g,
                ...b
            } = e,
            {
                size: y,
                mode: E
            } = M(),
            T = (0, l.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", P[y], C[y], x[y], w[y], N[y], d && "opacity-[0.5]", d && "pointer-events-none", m),
            k = i.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, s);
        switch (E) {
            case "dropdown":
                k = i.default.createElement(o.ItemText, {
                    asChild: !0
                }, k);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", E)
        }
        let A = i.default.createElement(i.default.Fragment, null, !d && i.default.createElement(t.StateLayer, null), n, i.default.createElement("div", {
            className: (0, l.default)("grow-1 text-truncate-split flex flex-col", S[y])
        }, k, u && i.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, u)), c);
        if (p) {
            let {
                as: e,
                ...r
            } = b, n = i.default.Children.only(g), l = void 0 === s && n.props.children;
            a = i.default.createElement(v.Slot, {
                ...r,
                role: "standalone" === E ? "menuitem" : void 0,
                "aria-disabled": d || void 0,
                className: T,
                style: {
                    outlineOffset: 0
                },
                onClick: d ? void 0 : f
            }, l ? i.default.cloneElement(n, {}, i.default.createElement(i.default.Fragment, null, !d && i.default.createElement(t.StateLayer, null), n.props.children)) : i.default.cloneElement(n, {}, A))
        } else if ("a" === b.as) {
            let {
                as: e,
                href: t,
                ...r
            } = b;
            a = i.default.createElement("a", {
                ...r,
                role: "standalone" === E ? "menuitem" : void 0,
                "aria-disabled": d,
                href: d ? void 0 : t,
                className: T,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: d ? void 0 : f
            }, A)
        } else {
            let {
                as: e,
                ...t
            } = b;
            a = i.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === E ? "menuitem" : void 0,
                "aria-disabled": d,
                className: T,
                style: {
                    outlineOffset: 0
                },
                onClick: d ? void 0 : f
            }, A)
        }
        return "dropdown" === E ? i.default.createElement(o.Item, {
            value: r,
            disabled: d,
            asChild: !0
        }, a) : i.default.createElement(h.Item, {
            asChild: !0,
            focusable: !0,
            tabStopId: r
        }, a)
    }, "MenuLabel", 0, e => {
        let {
            title: t,
            description: a,
            leading: r,
            trailing: n,
            disabled: o,
            className: s
        } = e, {
            size: u
        } = M(), c = (0, l.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", P[u], C[u], x[u], w[u], o && "opacity-[0.5]", s);
        return i.default.createElement("div", {
            role: "none",
            className: c
        }, r, i.default.createElement("div", {
            className: (0, l.default)("grow-1 text-truncate-split flex flex-col", S[u])
        }, i.default.createElement("span", {
            className: "foundation-web-menu-label-title text-no-wrap text-truncate-split content-emphasis"
        }, t), a && i.default.createElement("div", {
            className: "foundation-web-menu-label-description content-muted"
        }, a)), n)
    }, "MenuSection", 0, e => {
        let {
            children: t,
            className: a
        } = e, {
            size: r
        } = M();
        return i.default.createElement("div", {
            role: "group",
            className: (0, l.default)(E[r], a)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return i.default.createElement("div", {
            role: "separator",
            className: (0, l.default)("foundation-web-menu-separator", t)
        })
    }], 152324)
}, 984863, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        r = e.i(734463);
    let n = e => {
        var t, a, r, n, l, i;
        let o = null != (t = null == (r = (n = window).matchMedia) || null == (a = r.call(n, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            s = null == (l = document.activeElement) ? void 0 : l.matches(":focus-visible");
        if (o && !s) return void e.preventDefault();
        let u = null == (i = e.currentTarget) ? void 0 : i.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        u && (e.preventDefault(), u.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: n,
            onOpenChange: l,
            children: i
        } = e;
        return a.createElement(r.Root, {
            open: t,
            defaultOpen: n,
            onOpenChange: l
        }, i)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: n,
            children: l
        } = e;
        return a.createElement(r.Anchor, {
            asChild: t,
            className: n
        }, l)
    }, "PopoverClose", 0, function(e) {
        let {
            children: t,
            ...n
        } = e;
        return a.createElement(r.Close, n, t)
    }, "PopoverContent", 0, function(e) {
        let {
            side: l = "bottom",
            align: i = "center",
            sideOffset: o = 4,
            className: s,
            children: u,
            ariaLabel: c,
            onOpenAutoFocus: d,
            ...m
        } = e;
        return a.createElement(r.Portal, null, a.createElement(r.Content, {
            side: l,
            align: i,
            sideOffset: o,
            ...m,
            "aria-label": null != c ? c : m["aria-label"],
            onOpenAutoFocus: null != d ? d : n,
            className: (0, t.default)("foundation-web-portal-zindex", s)
        }, u))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: n,
            className: l,
            children: i
        } = e;
        return a.createElement(r.Trigger, {
            asChild: t,
            disabled: n,
            className: l
        }, i)
    }])
}, 580683, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let r = {
            Small: {
                dimension: 16,
                strokeWidth: 2,
                textClass: "text-caption-small"
            },
            Medium: {
                dimension: 32,
                strokeWidth: 3,
                textClass: "text-caption-small",
                valueContainerSize: 36
            },
            Large: {
                dimension: 48,
                strokeWidth: 4,
                textClass: "text-caption-medium",
                valueContainerSize: 52
            }
        },
        n = a.default.forwardRef((e, n) => {
            let {
                className: l,
                size: i = "Large",
                variant: o = "Determinate",
                value: s = 0,
                showValue: u = !1,
                ariaLabel: c,
                ...d
            } = e, {
                dimension: m,
                strokeWidth: f,
                textClass: p,
                valueContainerSize: g
            } = r[i], b = (m - f) / 2, v = 2 * Math.PI * b, h = m / 2, y = Math.min(100, Math.max(0, s)), E = u && void 0 !== g ? g : m, C = "Determinate" === o;
            return a.default.createElement("div", {
                ref: n,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", l),
                role: "progressbar",
                "aria-label": c,
                "aria-valuemin": C ? 0 : void 0,
                "aria-valuemax": C ? 100 : void 0,
                "aria-valuenow": C ? y : void 0,
                style: {
                    width: E,
                    height: E
                },
                ...d
            }, a.default.createElement("svg", {
                width: m,
                height: m,
                viewBox: "0 0 ".concat(m, " ").concat(m),
                className: "relative"
            }, a.default.createElement("circle", {
                cx: h,
                cy: h,
                r: b,
                fill: "none",
                strokeWidth: f,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: h,
                cy: h,
                r: b,
                fill: "none",
                strokeWidth: f,
                strokeDasharray: C ? v : "".concat(.75 * v, " ").concat(.25 * v),
                strokeDashoffset: C ? v * (1 - y / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!C && "foundation-web-progress-circle-indeterminate"),
                style: C ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), C && u && "Large" === i && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", p),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(y)), a.default.createElement("span", null, "%")))
        });
    n.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, n])
}, 25505, e => {
    "use strict";
    var t = e.i(562991),
        a = e.i(999210),
        r = e.i(489098),
        n = e.i(197649),
        l = e.i(416340);
    let i = {
            Small: "XSmall",
            Medium: "Small"
        },
        o = {
            Small: "size-600",
            Medium: "size-800"
        },
        s = {
            Small: "text-label-small",
            Medium: "text-label-medium"
        },
        u = (e, t) => t ? "Page ".concat(e, ", current page") : "Go to page ".concat(e),
        c = (0, l.forwardRef)((e, t) => {
            let {
                currentPage: c,
                totalPages: d,
                onPageChange: m,
                navType: f = "MultiPage",
                size: p = "Medium",
                hasFirstLastButtons: g,
                firstPageLabel: b,
                previousPageLabel: v,
                nextPageLabel: h,
                lastPageLabel: y,
                pageLabel: E = u,
                isAlwaysVisible: C = !1,
                className: x,
                "aria-label": w,
                ...S
            } = e, P = Math.max(0, Math.floor(d)), N = Math.min(Math.max(1, Math.floor(c)), Math.max(1, P)), T = 0 === P || 1 === N, M = 0 === P || N === P;
            if (P <= 1 && !C) return null;
            let k = [];
            if ("MultiPage" === f) k = P <= 7 ? Array.from({
                length: P
            }, (e, t) => t + 1) : N <= 4 ? [1, 2, 3, 4, 5, "trailing-ellipsis", P] : N >= P - 3 ? [1, "leading-ellipsis", P - 4, P - 3, P - 2, P - 1, P] : [1, "leading-ellipsis", N - 1, N, N + 1, "trailing-ellipsis", P];
            else "SinglePage" === f && P > 0 && (k = [N]);
            let A = i[p];
            return l.default.createElement("nav", {
                ref: t,
                "aria-label": w,
                className: (0, n.default)("foundation-web-pagination inline-flex items-center gap-small", x),
                ...S
            }, l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, g && l.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: b,
                size: A,
                variant: "Utility",
                isCircular: !0,
                isDisabled: T,
                onClick: () => m(1)
            }), l.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: v,
                size: A,
                variant: "Utility",
                isCircular: !0,
                isDisabled: T,
                onClick: () => m(N - 1)
            })), k.length > 0 && l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, k.map(e => "number" != typeof e ? l.default.createElement("span", {
                key: e,
                "aria-hidden": "true",
                className: (0, n.default)("inline-flex items-center justify-center content-action-utility select-none", o[p], s[p])
            }, "…") : e === N ? l.default.createElement("span", {
                key: e,
                role: "img",
                "aria-current": "page",
                "aria-label": E(e, !0),
                className: (0, n.default)("inline-flex items-center justify-center radius-circle bg-inverse-surface-0 content-inverse-emphasis select-none", o[p], s[p])
            }, e) : l.default.createElement("button", {
                key: e,
                type: "button",
                "aria-label": E(e, !1),
                className: (0, n.default)("relative clip group/interactable focus-visible:outline-focus disabled:outline-none", "relative inline-flex items-center justify-center radius-circle stroke-none bg-none content-action-utility cursor-pointer", o[p], s[p]),
                onClick: () => m(e)
            }, l.default.createElement(a.StateLayer, null), e))), l.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, l.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: h,
                size: A,
                variant: "Utility",
                isCircular: !0,
                isDisabled: M,
                onClick: () => m(N + 1)
            }), g && l.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: y,
                size: A,
                variant: "Utility",
                isCircular: !0,
                isDisabled: M,
                onClick: () => m(P)
            })))
        });
    c.displayName = "Pagination";
    let d = (0, l.createContext)(null),
        m = e => {
            let t = (0, l.useContext)(d);
            if (!t) throw Error("".concat(e, " must be used within a <Table>"));
            return t
        },
        f = {
            XSmall: "height-800",
            Small: "height-1200",
            Medium: "height-1500"
        },
        p = {
            XSmall: "padding-x-medium",
            Small: "padding-x-large",
            Medium: "padding-x-xlarge"
        },
        g = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        b = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        v = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        h = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        y = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        E = (0, l.forwardRef)((e, t) => {
            let {
                children: a,
                size: r = "Medium",
                variant: i = "Divided",
                className: o,
                ...s
            } = e, u = (0, l.useMemo)(() => ({
                size: r,
                variant: i
            }), [r, i]), c = "Framed" === i;
            return l.default.createElement(d.Provider, {
                value: u
            }, l.default.createElement("div", {
                className: (0, n.default)("width-full bg-surface-100", c && "radius-medium clip stroke-standard stroke-default")
            }, l.default.createElement("table", {
                ref: t,
                className: (0, n.default)("foundation-web-table width-full content-default", o),
                ...s
            }, a)))
        });
    E.displayName = "Table";
    let C = (0, l.forwardRef)((e, t) => {
        let {
            children: a,
            className: r,
            ...i
        } = e;
        return m("TableHeader"), l.default.createElement("thead", {
            ref: t,
            className: (0, n.default)("foundation-web-table-header", r),
            ...i
        }, a)
    });
    C.displayName = "TableHeader";
    let x = (0, l.forwardRef)((e, t) => {
        let {
            children: a,
            className: r,
            ...i
        } = e;
        return m("TableBody"), l.default.createElement("tbody", {
            ref: t,
            className: (0, n.default)("foundation-web-table-body", r),
            ...i
        }, a)
    });
    x.displayName = "TableBody";
    let w = (0, l.forwardRef)((e, t) => {
        let {
            children: a,
            className: r,
            isInteractive: i = !1,
            isHoverable: o = !1,
            isSelected: s = !1,
            isDisabled: u = !1,
            onClick: c,
            onKeyDown: d,
            tabIndex: f,
            role: p,
            ...g
        } = e;
        m("TableRow");
        let b = i ? {
            role: null != p ? p : "row",
            tabIndex: null != f ? f : 0,
            onClick: u ? void 0 : c,
            onKeyDown: e => {
                u || (null == d || d(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == c || c(e)))
            }
        } : {
            role: p,
            tabIndex: f,
            onClick: c,
            onKeyDown: d
        };
        return l.default.createElement("tr", {
            ref: t,
            "aria-selected": i ? s : void 0,
            "aria-disabled": !!i && !!u || void 0,
            "data-selected": s || void 0,
            className: (0, n.default)("foundation-web-table-row", (i || o) && "hover:bg-shift-100", i && !u && "cursor-pointer", i && u && "opacity-disabled pointer-events-none", s && "bg-shift-200", r),
            ...b,
            ...g
        }, a)
    });
    w.displayName = "TableRow";
    let S = (0, l.forwardRef)((e, a) => {
        let {
            children: r,
            className: i,
            sortDirection: o,
            onSort: s,
            align: u = "start",
            sortLabel: c,
            scope: d,
            ...f
        } = e, {
            size: v
        } = m("TableHeaderCell"), E = !!s, C = null != o ? o : "none", x = E && "none" !== C && l.default.createElement(t.Icon, {
            name: "ascending" === C ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), w = l.default.createElement("div", {
            className: (0, n.default)("flex items-center gap-xsmall", b[v], "content-muted", y[u])
        }, "end" === u && x, l.default.createElement("span", {
            className: "text-truncate-end"
        }, r), "end" !== u && x), S = "string" == typeof r ? "Sort by ".concat(r) : void 0;
        return l.default.createElement("th", {
            ref: a,
            scope: null != d ? d : "col",
            "aria-sort": E ? C : void 0,
            className: (0, n.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", g[v], p[v], h[u], "content-muted", i),
            ...f
        }, E ? l.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: s,
            "aria-label": null != c ? c : S
        }, w) : w)
    });
    S.displayName = "TableHeaderCell";
    let P = (0, l.forwardRef)((e, t) => {
        let {
            children: a,
            className: r,
            align: i = "start",
            ...o
        } = e, {
            size: s
        } = m("TableCell");
        return l.default.createElement("td", {
            ref: t,
            className: (0, n.default)("foundation-web-table-cell foundation-web-table-row-divider", f[s], p[s], v[s], h[i], "content-default", r),
            ...o
        }, a)
    });
    P.displayName = "TableCell";
    let N = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-large"
        },
        T = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-medium"
        },
        M = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        k = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium"
        },
        A = (0, l.forwardRef)((e, t) => {
            let {
                size: a = "Medium",
                page: r,
                rowsPerPage: i,
                totalRows: o,
                rowsPerPageOptions: s = [10, 25, 50],
                onPageChange: u,
                onRowsPerPageChange: d,
                paginationAriaLabel: m,
                rowsPerPageLabel: f = "Rows per page",
                firstPageLabel: p = "First page",
                previousPageLabel: g = "Previous page",
                nextPageLabel: b = "Next page",
                lastPageLabel: v = "Last page",
                rangeLabel: h,
                className: y,
                ...E
            } = e, C = Math.max(1, Math.ceil(o / i)), x = 0 === o ? 0 : r * i + 1, w = Math.min((r + 1) * i, o), S = (0, l.useCallback)(e => {
                let t = Number(e.target.value);
                null == d || d(t), u(0)
            }, [d, u]);
            return l.default.createElement("div", {
                ref: t,
                className: (0, n.default)("flex items-center justify-end", N[a], T[a], y),
                ...E
            }, l.default.createElement("div", {
                className: "flex items-center gap-large"
            }, l.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, d && l.default.createElement("div", {
                className: "flex items-center gap-small"
            }, l.default.createElement("span", {
                className: (0, n.default)(M[a], "content-default")
            }, f), l.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, l.default.createElement("select", {
                className: (0, n.default)("foundation-web-table-pagination-select", M[a], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === a ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: i,
                onChange: S,
                "aria-label": f
            }, s.map(e => l.default.createElement("option", {
                key: e,
                value: e
            }, e))))), l.default.createElement("span", {
                className: (0, n.default)(k[a], "content-default")
            }, h ? h(x, w, o) : "".concat(x, "-").concat(w, " of ").concat(o))), l.default.createElement(c, {
                "aria-label": m,
                currentPage: r + 1,
                totalPages: C,
                navType: "NoPage",
                size: "Medium" === a ? "Medium" : "Small",
                hasFirstLastButtons: !0,
                isAlwaysVisible: !0,
                firstPageLabel: p,
                previousPageLabel: g,
                nextPageLabel: b,
                lastPageLabel: v,
                onPageChange: e => u(e - 1)
            })))
        });
    A.displayName = "TablePagination", e.s(["Table", 0, E, "TableBody", 0, x, "TableCell", 0, P, "TableHeader", 0, C, "TableHeaderCell", 0, S, "TablePagination", 0, A, "TableRow", 0, w], 25505)
}, 825942, e => {
    "use strict";
    var t = e.i(562991),
        a = e.i(508019),
        r = e.i(416340);
    e.s(["LabelTooltip", 0, e => {
        let {
            title: n,
            description: l,
            position: i = "top-center"
        } = e;
        return r.default.createElement(a.Tooltip, {
            position: i,
            title: n,
            description: l
        }, r.default.createElement(a.TooltipTrigger, {
            asChild: !0
        }, r.default.createElement("span", {
            role: "button",
            tabIndex: 0,
            "aria-label": n,
            className: "flex items-center content-muted",
            "data-testid": "label-tooltip-trigger"
        }, r.default.createElement(t.Icon, {
            name: "icon-regular-circle-i",
            size: "Small"
        }))))
    }])
}, 753534, e => {
    "use strict";
    e.s(["INPUT_BACKGROUND_BY_VARIANT", 0, {
        Standard: "bg-none",
        Contrast: "bg-shift-200",
        Utility: "bg-none"
    }, "INPUT_STROKE_BY_VARIANT", 0, {
        Standard: "stroke-standard",
        Contrast: "stroke-none",
        Utility: "stroke-none"
    }, "INPUT_VARIANTS", 0, ["Standard", "Contrast", "Utility"]])
}, 641659, e => {
    "use strict";
    var t = e.i(416340);
    let a = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            r = (0, t.useRef)();
        return r.current || (a += 1, r.current = "".concat(e).concat(a)), r.current
    }])
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
            f = m[0],
            p = m[1],
            g = (0, a.useState)([]),
            b = g[0],
            v = g[1],
            h = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), v(function(r) {
                    return (0, t.b)((0, t.b)([], r, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [v]),
            y = (0, a.useCallback)(function() {
                p(!1)
            }, [p]);
        (0, a.useEffect)(function() {
            b.length > 0 && p(!0)
        }, [b.length]);
        var E = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: h,
                close: y
            }
        }, [y, h]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(n.Provider, {
            value: E
        }, u), a.default.createElement(r.S, (0, t._)({}, (null == (l = b[0]) ? void 0 : l.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (i = b[0]) ? void 0 : i.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, r, n, l;
                    v(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (r = null == (a = b[0]) ? void 0 : a.props.TransitionProps) ? void 0 : r.onExited) && (null == (l = null == (n = b[0]) ? void 0 : n.props.TransitionProps) || l.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, r, n;
                (null == (a = b[0]) ? void 0 : a.shouldClose(t)) && p(!1), (null == (r = b[0]) ? void 0 : r.props.onClose) && (null == (n = b[0]) || n.props.onClose(e, t))
            },
            open: f
        }), null == (s = b[0]) ? void 0 : s.props.children))
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
        } = e, f = null != (i = null == u ? void 0 : u.tags) ? i : r, p = null == u ? void 0 : u.rosId, g = (0, t.useMemo)(() => ({
            tags: f,
            rosId: p,
            path: c,
            url: d,
            isReady: m
        }), [f, p, c, d, m]), b = (0, t.useRef)(g), v = (0, t.useRef)(g);
        (0, t.useLayoutEffect)(() => {
            v.current = g, void 0 === b.current.path && void 0 !== g.path && (b.current = {
                ...b.current,
                path: g.path
            })
        }, [g]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, r = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && l.has(a)) ? b.current : v.current;
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
        let h = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: g
        }), [s, g]);
        return t.default.createElement(a.Provider, {
            value: h
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

//# debugId=94eb9800-5717-bbbe-cdc5-023e6f3dabba
//# sourceMappingURL=1o01nyx5ve3me.js.map