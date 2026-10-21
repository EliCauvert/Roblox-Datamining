;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "abca706f-cd95-a260-b4d2-c0ea808d7689")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 401263, 884213, e => {
    "use strict";
    var t = e.i(416340);
    let r = /{(.+?)}/g,
        a = (e, t) => void 0 === t || 0 === Object.keys(t).length ? e : e.replace(r, (e, r) => {
            var a;
            return null != (a = t[r]) ? a : "{".concat(r, "}")
        });
    e.s(["default", 0, a], 884213);
    let n = /{(.+?)}/,
        l = /({.+?})/g,
        i = /^[a-zA-Z0-9-]+\.(?:capture-loopback\.)?chromatic\.com$/,
        o = /(?:^|\.)robloxlabs\.com$/,
        s = () => {
            let e, t = i.test(window.location.hostname),
                r = window.location.hostname.includes("localhost"),
                a = "string" == typeof(e = window.location.hostname) && o.test(e);
            return {
                isSSR: !1,
                isAllowed: t || r || a,
                isDangerous: t || a,
                preferLoadedTranslations: a
            }
        },
        u = (e, t) => t.isDangerous ? "[!!".concat(e, "!!]") : e;
    var d = e.i(730530);
    e.s(["default", 0, e => {
        let {
            ready: r,
            translate: i,
            translateHTML: o,
            translateWithNamespace: c,
            translateWithNamespaceHTML: m
        } = e, b = (0, t.useMemo)(() => ({
            ready: r,
            translate: i,
            translateHTML: o,
            translateWithNamespace: c,
            translateWithNamespaceHTML: m
        }), [r, i, o, c, m]);
        return (0, t.useMemo)(() => {
            let e = {
                ready: b.ready,
                translate: (0, d.translationFn)(b),
                translateHTML: (0, d.translateHTMLFn)(b),
                translateWithNamespace: b.translateWithNamespace,
                translateWithNamespaceHTML: b.translateWithNamespaceHTML
            };
            return {
                ...e,
                tPendingTranslation: (e => {
                    let {
                        ready: t,
                        translate: r
                    } = e;
                    return (e, n, l, i) => {
                        let o = s();
                        if (!o.isAllowed) return r(l, i);
                        if (o.preferLoadedTranslations && t) {
                            let e = r(l, i);
                            if (e.length > 0) return e
                        }
                        return a(o.preferLoadedTranslations && !t ? e : u(e, o), i)
                    }
                })(e),
                tPendingHtmlTranslation: (e => {
                    let {
                        ready: r,
                        translateHTML: i
                    } = e;
                    return (e, o, d, c, m) => {
                        let b = s();
                        if (!b.isAllowed) return i(d, c, m);
                        if (b.preferLoadedTranslations && r) {
                            let e = i(d, c, m);
                            if ("" !== e) return e
                        }
                        return ((e, r, i) => {
                            let o, s;
                            if (void 0 === r && void 0 === i) return e;
                            let {
                                stringArgs: u,
                                htmlArgs: d
                            } = (o = {}, s = {}, void 0 === i || Object.entries(i).forEach(e => {
                                let [t, r] = e;
                                "string" == typeof r ? o[t] = r : s[t] = r
                            }), {
                                stringArgs: o,
                                htmlArgs: s
                            }), c = a(e, u), m = c.split(l).filter(e => !!e);
                            if (1 === m.length) return c;
                            let b = [...m];
                            if (0 !== Object.keys(d).length) {
                                let e = m.reduce((e, t, r) => {
                                    let a = n.exec(t);
                                    if (a) {
                                        let t = a[1];
                                        if (Object.hasOwn(d, t)) {
                                            let a = e[t];
                                            if (!a) return Object.assign(e, {
                                                [t]: [r]
                                            });
                                            a.push(r)
                                        }
                                    }
                                    return e
                                }, {});
                                Object.entries(d).forEach(t => {
                                    let [r, a] = t, n = e[r];
                                    n && n.forEach(e => {
                                        b[e] = a
                                    })
                                })
                            }
                            if (!Array.isArray(r) || 0 === r.length) return (0, t.createElement)(t.Fragment, null, ...b);
                            let p = r.reduce((e, t) => {
                                    let {
                                        opening: r,
                                        closing: a,
                                        content: n
                                    } = t;
                                    return Object.assign(e, {
                                        ["{".concat(r, "}")]: {
                                            match: "{".concat(a, "}"),
                                            content: n
                                        }
                                    })
                                }, {}),
                                g = [],
                                f = [],
                                h = [];
                            for (let e = b.shift(); void 0 !== e; e = b.shift())
                                if ("string" == typeof e && n.test(e))
                                    if (Object.hasOwn(p, e)) f.push(e), h.push(e);
                                    else {
                                        let r = f.pop();
                                        if (void 0 !== r) {
                                            let {
                                                match: a,
                                                content: n
                                            } = p[r];
                                            if (e !== a) break;
                                            let l = [],
                                                i = !1;
                                            for (; h.length > 0 && !i;) {
                                                let e = h.pop();
                                                e === r ? i = !0 : l.unshift(e)
                                            }
                                            let o = n(l.every(e => "string" == typeof e) ? l : (0, t.createElement)(t.Fragment, null, ...l));
                                            0 === h.length ? g.push(o) : h.push(o)
                                        }
                                    }
                            else 0 === h.length ? g.push(e) : h.push(e);
                            return (0, t.createElement)(t.Fragment, null, ...g)
                        })(b.preferLoadedTranslations && !r ? e : u(e, b), c, m)
                    }
                })(e)
            }
        }, [b])
    }], 401263)
}, 358763, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(296380);
    let a = () => {};
    e.s(["default", 0, function(e, n) {
        let {
            debounceDelay: l,
            intersectionObserverThreshold: i,
            resetOncePer: o
        } = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {}, s = (0, t.useRef)(!1), u = (0, t.useCallback)(e => {
            !e || s.current || (s.current = !0, n())
        }, [n]), [d] = (0, r.default)(u, null != l ? l : 250), c = (0, t.useCallback)(e => {
            let [t] = e;
            d(t.isIntersecting)
        }, [d]), m = null != o ? o : "instance";
        (0, t.useMemo)(() => {
            "callback" === m && (s.current = !1)
        }, [n]), (0, t.useEffect)(() => {
            if (!e.current) return a;
            let t = new IntersectionObserver(c, {
                threshold: null != i ? i : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, i, c])
    }])
}, 29929, e => {
    "use strict";
    var t, r, a, n, l, i, o, s, u, d, c, m, b, p, g, f, h, v = e.i(650502),
        y = e.i(864392),
        C = ((t = {}).ShowVrDeviceOption = "showVrDeviceOption", t.ShowIXPClientTest = "showIXPClientTest", t.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", t.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", t.EnableIA = "enableIA", t.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", t.EnableDevexEarnedRobux = "enableDevexEarnedRobux", t.EnableExperienceGenre = "enableExperienceGenre", t.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", t.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", t.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", t.EnableEventRequestFeaturing = "enableEventRequestFeaturing", t.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", t),
        E = ((r = {}).EnableRightsManager = "enableRightsManager", r.EnableBulkFiling = "enableBulkFiling", r.EnableOnDemandSearch = "enableOnDemandSearch", r.EnableEditRegistration = "enableEditRegistration", r.EnableImageSearch = "enableImageSearch", r.EnableClaimsAgainstMe = "enableClaimsAgainstMe", r.EnableGenAiOptOut = "enableGenAiOptOut", r.EnableInExperienceIpReporting = "enableInExperienceIpReporting", r.EnableIpContentSearch = "enableIpContentSearch", r.EnableTrademark = "enableTrademark", r),
        w = ((a = {}).EnableIPRecommender = "enableIPRecommender", a),
        S = ((n = S || {}).EnableVideoOnboarding = "enableVideoOnboarding", n),
        P = ((l = P || {}).EnableSignalLookup = "enableSignalLookup", l.AlwaysShow = "alwaysShow", l),
        x = x || {},
        T = ((i = T || {}).mobileVariant = "mobileVariant", i),
        H = H || {},
        k = ((o = {}).ShowEditInStudioButton = "showEditInStudioButton", o.EnableCreationsNavLayout = "enableCreationsIPNavLayout", o),
        A = ((s = {}).EnableMultiAssetSearch = "enableMultiAssetSearch", s),
        I = ((u = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", u.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", u.EnableAudienceControls = "enableAudienceControls", u.EnableNewBadgePattern = "enableNewBadgePattern", u.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", u.EnableAudiencesReplacement = "enableAudiencesReplacement", u),
        R = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        M = ((c = M || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", c),
        N = ((m = N || {}).GameAppealsEnabled = "gameAppealsEnabled", m),
        O = ((b = O || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", b),
        L = ((p = L || {}).EnableChangelogCMS = "enableChangelogCMS", p),
        F = ((g = {}).CreatorDashboard = "CreatorDashboard", g.CreatorHubHomePage = "CreatorHub.HomePage.UserId", g.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", g.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", g.CreatorHubLandingPage = "CreatorHub.LandingPage", g.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", g.CreatorHubNavigation = "CreatorHub.Navigation", g.CreatorHubNavigationUser = "CreatorHub.Navigation.User", g.CreatorHubPublishing = "CreatorHub.Publishing.UserId", g.LicenseManager = "CreatorDashboard.LicenseManager", g.RightsManager = "CreatorDashboard.RightsManager", g.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", g.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", g.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", g.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", g.CreatorHubGameAppeals = "CreatorHub.GameAppeals.UserId", g.CreatorHubChangelog = "CreatorHub.Changelog", g.TalentHub = "CreatorHub.TalentHub.UserId", g),
        G = ((f = G || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", f.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", f.ShowSecrets = "showSecrets", f.ShowQualitySignalCards = "showQualitySignalCards", f);
    let U = {
        CreatorDashboard: C,
        "CreatorHub.HomePage.UserId": S,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": P,
        "CreatorHub.LandingPage": x,
        "CreatorHub.LandingPage.UserId": T,
        "CreatorHub.Navigation": H,
        "CreatorHub.Navigation.User": k,
        "CreatorHub.Publishing.UserId": A,
        "CreatorDashboard.LicenseManager": w,
        "CreatorDashboard.RightsManager": E,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.Search.UserId": ((h = {}).SearchVersion = "searchVersion", h),
        "CreatorHub.Creations.Permission": I,
        "CreatorHub.ExperienceWebhooks.UserId": M,
        "CreatorHub.GameAppeals.UserId": N,
        "CreatorHub.HomePage.ExperienceTile.UserId": O,
        "CreatorHub.Changelog": L,
        "CreatorHub.TalentHub.UserId": R
    };
    async function D(e) {
        let t = (0, v.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            r = Object.values(U[e]).join(","),
            a = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(r);
        return (await fetch(a, {
            credentials: "include"
        })).json()
    }
    let j = (0, y.default)(D);
    e.s(["CreatorHubCreationsPermissionParameters", () => I, "CreatorHubPublishingParameters", () => A, "IXPLayers", () => F, "LicenseManagerParameters", () => w, "TalentHubParameters", () => R, "fetchIXPParametersForCurrentUser", 0, j])
}, 864392, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        let t = new Map;
        return r => {
            if (t.has(r)) return t.get(r);
            let a = e(r);
            return t.set(r, a), a
        }
    }])
}, 296380, e => {
    "use strict";
    var t = e.i(416340);
    let r = (e, r) => {
        let a = (0, t.useRef)(null),
            n = (0, t.useCallback)(() => {
                null !== a.current && (clearTimeout(a.current), a.current = null)
            }, [a]);
        return [(0, t.useCallback)(function() {
            for (var t = arguments.length, l = Array(t), i = 0; i < t; i++) l[i] = arguments[i];
            n(), a.current = window.setTimeout(() => {
                e(...l), a.current = null
            }, r)
        }, [e, r, n]), n, a]
    };
    e.s(["default", 0, r, "useDebouncedFunction", 0, r])
}, 60373, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(29929);
    let a = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
            try {
                let r = window.localStorage.getItem(e);
                return r ? JSON.parse(r) : t
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
                params: a(e),
                status: "success",
                isFetched: !0
            } : {
                params: (null == l ? void 0 : l.restoreInitialValueFromCache) ? a(e) : {},
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
                    })), t = await (0, r.fetchIXPParametersForCurrentUser)(e), u({
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
        r = e.i(589624);
    e.s(["default", 0, (e, a) => {
        let n = (0, r.useRouter)(),
            l = n.query;
        return [(0, t.useMemo)(() => {
            let t = null != l ? l : {},
                r = {};
            for (let a of e) r[a] = t[a];
            return r
        }, [e, l]), (0, t.useCallback)(function(t) {
            var r;
            let l = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                i = null != (r = n.query) ? r : {},
                o = {
                    ...i
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let r = t[e];
                null == r ? delete o[e] : Array.isArray(r) ? o[e] = r.map(e => e.toString()) : o[e] = r.toString()
            }), Array.from(new Set([...Object.keys(i), ...Object.keys(o)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let r = Array.isArray(e) ? e : [e],
                    a = Array.isArray(t) ? t : [t];
                return r.length === a.length && r.every((e, t) => e === a[t])
            })(i[e], o[e])) || (l.skipHistory ? n.replace({
                pathname: n.pathname,
                query: o
            }) : n.push({
                pathname: n.pathname,
                query: o
            }, void 0, a))
        }, [n, e, a])]
    }, "normalizeSingleQueryParam", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        return "" === t || null == t ? void 0 : t
    }])
}, 780880, e => {
    "use strict";
    var t = e.i(198528);
    e.s(["useQueryParams", () => t.default])
}, 426546, e => {
    "use strict";
    var t = e.i(191685);
    e.s(["www", 0, t])
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let r = Object.entries(e).find(e => {
            let [, r] = e;
            return r === t
        });
        return r ? r[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        a = e.i(458451),
        n = e.i(533414),
        l = e.i(157310),
        i = e.i(279149),
        o = e.i(602635),
        s = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new i.UserScreenApi(u),
        c = new i.GroupsApi(u),
        m = {
            groupsApi: c,
            userScreenApi: d,
            creatorHomeContentApi: new i.CreatorHomeContentApi(u),
            signalsApi: new i.SignalsApi(u)
        };
    e.s(["CreatorHomeClient", 0, m], 67262);
    let b = function() {
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
    let g = (0, r.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: l
        } = e, {
            user: i
        } = (0, a.useRobloxAuthentication)(), o = (0, p.useGroupPermissionFetchers)(), {
            data: s,
            isLoading: u,
            refetch: d
        } = b(), [c, m] = (0, n.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [f, h] = (0, n.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [v, y] = (0, n.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), C = (0, r.useCallback)(e => {
            h(e);
            let t = null != e ? e : "user";
            y(e => {
                let r = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: a,
                        lastSelected: n
                    } = e[t];
                    "number" != typeof a || Number.isNaN(a) || "number" != typeof n || Number.isNaN(n) || (r.priority = a * (1 + Math.log10(1 + 10 / Math.max(Date.now() - n, 864e5))))
                }
                return {
                    ...e,
                    [t]: r
                }
            })
        }, [h, y]), E = (0, r.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === c) return [];
            try {
                let e = "string" == typeof c ? JSON.parse(c) : c;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [c, null == s ? void 0 : s.groups]), w = (0, r.useMemo)(() => {
            var e;
            return f && null != (e = E.find(e => {
                let {
                    id: t
                } = e;
                return t === f
            })) ? e : null
        }, [f, E]), S = null == w ? void 0 : w.id, P = null == i ? void 0 : i.id, {
            data: x,
            error: T,
            isPending: H,
            refetch: k
        } = (0, p.useGroupResolvedPermissionsQuery)(S, P), {
            data: A,
            isPending: I,
            refetch: R
        } = (0, p.useGroupOwnershipQuery)(S, P), M = (0, r.useCallback)(() => null == S || null == P ? Promise.resolve() : Promise.all([k(), R()]), [R, k, S, P]);
        (0, r.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == s ? void 0 : s.groups) && !u && m(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, E, u, m, null == i ? void 0 : i.id]);
        let N = (0, r.useMemo)(() => {
            var e;
            return {
                groups: E,
                currentGroup: w,
                groupData: v,
                isFetched: !u && !!P,
                refreshGroups: d,
                setCurrentGroup: C,
                ...o,
                permissions: x,
                isOwner: null != P && (null == A || null == (e = A.owner) ? void 0 : e.userId) === P,
                isPermissionsLoading: null != w && (H || I),
                permissionsError: T,
                refreshPermissions: M
            }
        }, [w, v, E, u, I, H, A, o, x, T, d, M, C, P]);
        return (0, t.jsx)(g.Provider, {
            value: N,
            children: l
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, r.useContext)(g);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, r.useContext)(g);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(711367),
        a = e.i(157310),
        n = e.i(795621),
        l = e.i(458451),
        i = e.i(285666),
        o = e.i(272593);
    let s = new i.PermissionsV2Api((0, o.createClientConfiguration)("groups", "bedev1"));
    async function u(e, t, r) {
        var a;
        return null != (a = (await s.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: r
        })).permissions) ? a : {}
    }
    async function d(e) {
        return u(e, "groups", String(e))
    }
    async function c(e) {
        let t, r = [];
        do {
            var a, n;
            let l = await s.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            r.push(...null != (a = l.data) ? a : []), t = null != (n = l.nextPageCursor) ? n : void 0
        } while (t) return r
    }
    var m = e.i(156071);
    let b = new i.PermissionsV2Api((0, o.createClientConfiguration)("groups", "bedev1"));
    async function p(e) {
        var t;
        return null != (t = (await b.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var g = e.i(759283);
    let f = (e, t) => ["groups", e, t, "resolved-permissions"],
        h = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        v = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, a.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => m.default.getGroupInfo(e) : r.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, l.useRobloxAuthentication)(), r = (0, n.useQueryClient)(), a = null == e ? void 0 : e.id, i = (0, t.useCallback)(e => r.fetchQuery({
            queryKey: v(e, a),
            queryFn: () => p(e),
            staleTime: 6e4
        }), [r, a]), o = (0, t.useCallback)(e => r.fetchQuery({
            queryKey: f(e, a),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [r, a]), s = (0, t.useCallback)(e => r.fetchQuery({
            queryKey: h(e, a),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [r, a]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: o,
            fetchRolePermissions: s,
            fetchUniversePermissions: i
        }), [o, s, i])
    }, "useGroupResolvedPermissionsQuery", 0, function(e, t) {
        return (0, a.useQuery)({
            queryKey: f(e, t),
            queryFn: e && t ? () => d(e) : r.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, l.useRobloxAuthentication)(), n = null == t ? void 0 : t.id;
        return (0, a.useQuery)({
            queryKey: h(e, n),
            queryFn: e && n ? () => c(e) : r.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, l.useRobloxAuthentication)(), n = null == t ? void 0 : t.id;
        return (0, a.useQuery)({
            queryKey: v(e, n),
            queryFn: void 0 !== e && e !== g.uninitializedUniverseId ? () => p(e) : r.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 486736, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        a = e.i(639102);
    let n = {
            enableIpPlatformMatchesTableEsIndexImprovements: !1
        },
        l = {
            ...n
        },
        i = async () => {
            try {
                let {
                    applicationSettings: e = {}
                } = await a.settingsClient.getApplicationSettings(), t = {};
                return Object.entries(e).forEach(e => {
                    let [r, a] = e;
                    try {
                        let e = typeof n[r];
                        t[r] = "boolean" === e || "number" === e ? JSON.parse(a) : a
                    } catch (e) {
                        console.error(e)
                    }
                }), t
            } catch (e) {
                return n
            }
        }, o = (0, r.createContext)({
            settings: {
                ...l
            },
            status: "initial",
            isFetched: !1
        });
    e.s(["SettingsProvider", 0, e => {
        let {
            children: a
        } = e, [n, s] = (0, r.useState)(() => ({
            settings: {
                ...l
            },
            status: "initial",
            isFetched: !1
        }));
        return (0, r.useEffect)(() => {
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
            children: a
        })
    }, "useSettings", 0, () => {
        let {
            settings: e,
            status: t,
            isFetched: a
        } = (0, r.useContext)(o), n = (0, r.useRef)(e);
        return {
            settings: (0, r.useMemo)(() => {
                let t = n.current;
                return Object.keys(e).some(r => e[r] !== t[r]) && (n.current = e), n.current
            }, [e]),
            status: t,
            isFetched: a
        }
    }], 486736)
}, 369114, e => {
    "use strict";
    var t = e.i(75584),
        r = e.i(659332),
        a = e.i(197649),
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
        d = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        c = {
            XSmall: "text-body-small",
            Small: "text-body-medium",
            Medium: "text-body-medium"
        },
        m = {
            start: "text-align-x-start",
            center: "text-align-x-center",
            end: "text-align-x-end"
        },
        b = {
            start: "justify-start",
            center: "justify-center",
            end: "justify-end"
        },
        p = (0, n.forwardRef)((e, t) => {
            let {
                children: r,
                size: i = "Medium",
                variant: o = "Divided",
                className: s,
                ...u
            } = e, d = (0, n.useMemo)(() => ({
                size: i,
                variant: o
            }), [i, o]), c = "Framed" === o;
            return n.default.createElement(l.Provider, {
                value: d
            }, n.default.createElement("div", {
                className: (0, a.default)("width-full bg-surface-100", c && "radius-medium clip stroke-standard stroke-default")
            }, n.default.createElement("table", {
                ref: t,
                className: (0, a.default)("foundation-web-table width-full content-default", s),
                ...u
            }, r)))
        });
    p.displayName = "Table";
    let g = (0, n.forwardRef)((e, t) => {
        let {
            children: r,
            className: l,
            ...o
        } = e;
        return i("TableHeader"), n.default.createElement("thead", {
            ref: t,
            className: (0, a.default)("foundation-web-table-header", l),
            ...o
        }, r)
    });
    g.displayName = "TableHeader";
    let f = (0, n.forwardRef)((e, t) => {
        let {
            children: r,
            className: l,
            ...o
        } = e;
        return i("TableBody"), n.default.createElement("tbody", {
            ref: t,
            className: (0, a.default)("foundation-web-table-body", l),
            ...o
        }, r)
    });
    f.displayName = "TableBody";
    let h = (0, n.forwardRef)((e, t) => {
        let {
            children: r,
            className: l,
            isInteractive: o = !1,
            isHoverable: s = !1,
            isSelected: u = !1,
            isDisabled: d = !1,
            onClick: c,
            onKeyDown: m,
            tabIndex: b,
            role: p,
            ...g
        } = e;
        i("TableRow");
        let f = o ? {
            role: null != p ? p : "row",
            tabIndex: null != b ? b : 0,
            onClick: d ? void 0 : c,
            onKeyDown: e => {
                d || (null == m || m(e), e.defaultPrevented || ("Enter" === e.key || " " === e.key) && (e.preventDefault(), null == c || c(e)))
            }
        } : {
            role: p,
            tabIndex: b,
            onClick: c,
            onKeyDown: m
        };
        return n.default.createElement("tr", {
            ref: t,
            "aria-selected": o ? u : void 0,
            "aria-disabled": !!o && !!d || void 0,
            "data-selected": u || void 0,
            className: (0, a.default)("foundation-web-table-row", (o || s) && "hover:bg-shift-100", o && !d && "cursor-pointer", o && d && "opacity-disabled pointer-events-none", u && "bg-shift-200", l),
            ...f,
            ...g
        }, r)
    });
    h.displayName = "TableRow";
    let v = (0, n.forwardRef)((e, r) => {
        let {
            children: l,
            className: o,
            sortDirection: c,
            onSort: p,
            align: g = "start",
            sortLabel: f,
            scope: h,
            ...v
        } = e, {
            size: y
        } = i("TableHeaderCell"), C = !!p, E = null != c ? c : "none", w = C && "none" !== E && n.default.createElement(t.Icon, {
            name: "ascending" === E ? "icon-regular-arrow-small-up" : "icon-regular-arrow-small-down",
            size: "XSmall",
            className: "shrink-0 content-muted"
        }), S = n.default.createElement("div", {
            className: (0, a.default)("flex items-center gap-xsmall", d[y], "content-muted", b[g])
        }, "end" === g && w, n.default.createElement("span", {
            className: "text-truncate-end"
        }, l), "end" !== g && w), P = "string" == typeof l ? "Sort by ".concat(l) : void 0;
        return n.default.createElement("th", {
            ref: r,
            scope: null != h ? h : "col",
            "aria-sort": C ? E : void 0,
            className: (0, a.default)("foundation-web-table-header-cell foundation-web-table-header-cell-divider", u[y], s[y], m[g], "content-muted", o),
            ...v
        }, C ? n.default.createElement("button", {
            type: "button",
            className: "bg-none stroke-none padding-none margin-none cursor-pointer width-full content-inherit [font:inherit] [text-align:inherit] focus-visible:outline-focus hover:content-default hover:bg-shift-100 radius-small",
            onClick: p,
            "aria-label": null != f ? f : P
        }, S) : S)
    });
    v.displayName = "TableHeaderCell";
    let y = (0, n.forwardRef)((e, t) => {
        let {
            children: r,
            className: l,
            align: u = "start",
            ...d
        } = e, {
            size: b
        } = i("TableCell");
        return n.default.createElement("td", {
            ref: t,
            className: (0, a.default)("foundation-web-table-cell foundation-web-table-row-divider", o[b], s[b], c[b], m[u], "content-default", l),
            ...d
        }, r)
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
        w = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-small"
        },
        S = {
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
                onPageChange: d,
                onRowsPerPageChange: c,
                rowsPerPageLabel: m = "Rows per page",
                firstPageLabel: b = "First page",
                previousPageLabel: p = "Previous page",
                nextPageLabel: g = "Next page",
                lastPageLabel: f = "Last page",
                rangeLabel: h,
                className: v,
                ...y
            } = e, T = Math.max(1, Math.ceil(s / o)), H = 0 === i, k = i >= T - 1, A = 0 === s ? 0 : i * o + 1, I = Math.min((i + 1) * o, s), R = (0, n.useCallback)(e => {
                let t = Number(e.target.value);
                null == c || c(t), d(0)
            }, [c, d]), M = x[l];
            return n.default.createElement("div", {
                ref: t,
                className: (0, a.default)("flex items-center justify-end", C[l], E[l], v),
                ...y
            }, n.default.createElement("div", {
                className: "flex items-center gap-large"
            }, n.default.createElement("div", {
                className: "flex items-center gap-xlarge"
            }, c && n.default.createElement("div", {
                className: "flex items-center gap-small"
            }, n.default.createElement("span", {
                className: (0, a.default)(w[l], "content-default")
            }, m), n.default.createElement("div", {
                className: "foundation-web-table-pagination-select-wrapper relative"
            }, n.default.createElement("select", {
                className: (0, a.default)("foundation-web-table-pagination-select", w[l], "content-default bg-action-standard radius-small cursor-pointer", "Medium" === l ? "height-800 padding-x-medium" : "height-600 padding-x-small"),
                value: o,
                onChange: R,
                "aria-label": m
            }, u.map(e => n.default.createElement("option", {
                key: e,
                value: e
            }, e))))), n.default.createElement("span", {
                className: (0, a.default)(S[l], "content-default")
            }, h ? h(A, I, s) : "".concat(A, "-").concat(I, " of ").concat(s))), n.default.createElement("div", {
                className: (0, a.default)("flex items-center", P[l])
            }, n.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-left",
                ariaLabel: b,
                size: M,
                variant: "Utility",
                isDisabled: H,
                onClick: () => d(0)
            }), n.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-left",
                ariaLabel: p,
                size: M,
                variant: "Utility",
                isDisabled: H,
                onClick: () => d(i - 1)
            }), n.default.createElement(r.IconButton, {
                icon: "icon-regular-chevron-small-right",
                ariaLabel: g,
                size: M,
                variant: "Utility",
                isDisabled: k,
                onClick: () => d(i + 1)
            }), n.default.createElement(r.IconButton, {
                icon: "icon-regular-double-chevron-large-right",
                ariaLabel: f,
                size: M,
                variant: "Utility",
                isDisabled: k,
                onClick: () => d(T - 1)
            }))))
        });
    T.displayName = "TablePagination", e.s(["Table", 0, p, "TableBody", 0, f, "TableCell", 0, y, "TableHeader", 0, g, "TableHeaderCell", 0, v, "TablePagination", 0, T, "TableRow", 0, h])
}, 990729, e => {
    "use strict";
    var t = e.i(194250),
        r = e.i(416340),
        a = e.i(863762);
    e.i(221628), e.i(149285);
    var n = (0, r.createContext)({
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
            d = (0, t.a)(e, ["children"]),
            c = (0, r.useRef)(null),
            m = (0, r.useState)(!1),
            b = m[0],
            p = m[1],
            g = (0, r.useState)([]),
            f = g[0],
            h = g[1],
            v = (0, r.useCallback)(function(e, r) {
                void 0 === e && (e = {}), void 0 === r && (r = function() {
                    return !0
                }), h(function(a) {
                    return (0, t.b)((0, t.b)([], a, !0), [{
                        props: e,
                        shouldClose: r
                    }], !1)
                })
            }, [h]),
            y = (0, r.useCallback)(function() {
                p(!1)
            }, [p]);
        (0, r.useEffect)(function() {
            f.length > 0 && p(!0)
        }, [f.length]);
        var C = (0, r.useMemo)(function() {
            return {
                ref: c,
                enqueue: v,
                close: y
            }
        }, [y, v]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(n.Provider, {
            value: C
        }, u), r.default.createElement(a.S, (0, t._)({}, (null == (l = f[0]) ? void 0 : l.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (i = f[0]) ? void 0 : i.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var r, a, n, l;
                    h(function(e) {
                        var r = e.slice(1);
                        return (0, t.b)([], r, !0)
                    }), (null == (a = null == (r = f[0]) ? void 0 : r.props.TransitionProps) ? void 0 : a.onExited) && (null == (l = null == (n = f[0]) ? void 0 : n.props.TransitionProps) || l.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var r, a, n;
                (null == (r = f[0]) ? void 0 : r.shouldClose(t)) && p(!1), (null == (a = f[0]) ? void 0 : a.props.onClose) && (null == (n = f[0]) || n.props.onClose(e, t))
            },
            open: b
        }), null == (s = f[0]) ? void 0 : s.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, r.useContext)(n);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let r = (0, t.createContext)(null),
        a = [],
        n = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        l = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function i() {
        let e = (0, t.useContext)(r);
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
            path: d,
            url: c,
            isReady: m = !0
        } = e, b = null != (i = null == u ? void 0 : u.tags) ? i : a, p = null == u ? void 0 : u.rosId, g = (0, t.useMemo)(() => ({
            tags: b,
            rosId: p,
            path: d,
            url: c,
            isReady: m
        }), [b, p, d, c, m]), f = (0, t.useRef)(g), h = (0, t.useRef)(g);
        (0, t.useLayoutEffect)(() => {
            h.current = g, void 0 === f.current.path && void 0 !== g.path && (f.current = {
                ...f.current,
                path: g.path
            })
        }, [g]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r, a = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && l.has(r)) ? f.current : h.current;
                void 0 !== a.path && (e.parameters = {
                    ...e.parameters,
                    path: a.path
                }), a.tags.forEach(t => e.addTag(t)), void 0 !== a.rosId && e.addTag("owner: ".concat(a.rosId))
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
            pageContext: g
        }), [s, g]);
        return t.default.createElement(r.Provider, {
            value: v
        }, o)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(r)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: r,
            pageContext: a
        } = i(), {
            path: n,
            url: l,
            isReady: s
        } = a, u = r.pageSettledTracker, d = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, o);
        (0, t.useEffect)(() => {
            if (!d || d.isNavigating || !s || !n || !l || !e || d.url.split(/[?#]/)[0] !== l.split(/[?#]/)[0]) return;
            let t = new URL(n, window.location.origin).pathname,
                a = requestAnimationFrame(() => {
                    a = requestAnimationFrame(() => {
                        r.logPageSettledEvent({
                            navigationId: d.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(a)
        }, [d, s, l, n, e, r])
    }, "useUnifiedLoggerProvider", 0, i])
}]);

//# debugId=abca706f-cd95-a260-b4d2-c0ea808d7689
//# sourceMappingURL=27u59tlcf--m8.js.map