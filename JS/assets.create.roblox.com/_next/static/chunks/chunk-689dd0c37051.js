;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "de53eb93-1384-4d7a-7a33-8ad1b5f82e93")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 358763, e => {
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
        }, [n]), [d] = (0, a.default)(u, null != l ? l : 250), c = (0, t.useCallback)(e => {
            let [t] = e;
            d(t.isIntersecting)
        }, [d]), m = null != o ? o : "instance";
        (0, t.useMemo)(() => {
            "callback" === m && (s.current = !1)
        }, [n]), (0, t.useEffect)(() => {
            if (!e.current) return r;
            let t = new IntersectionObserver(c, {
                threshold: null != i ? i : .5
            });
            return t.observe(e.current), () => {
                t.disconnect()
            }
        }, [e, i, c])
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
    var a, r, n, l, i, o, s, u, d, c, m, p, g, f, b, h, v, E, x, y, S = e.i(650502),
        C = e.i(864392),
        w = ((a = {}).ShowVrDeviceOption = "showVrDeviceOption", a.ShowIXPClientTest = "showIXPClientTest", a.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", a.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", a.EnableIA = "enableIA", a.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", a.EnableDevexEarnedRobux = "enableDevexEarnedRobux", a.EnableExperienceGenre = "enableExperienceGenre", a.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", a.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", a.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", a.EnableEventRequestFeaturing = "enableEventRequestFeaturing", a.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", a),
        N = ((r = {}).EnableRightsManager = "enableRightsManager", r.EnableBulkFiling = "enableBulkFiling", r.EnableOnDemandSearch = "enableOnDemandSearch", r.EnableEditRegistration = "enableEditRegistration", r.EnableImageSearch = "enableImageSearch", r.EnableClaimsAgainstMe = "enableClaimsAgainstMe", r.EnableGenAiOptOut = "enableGenAiOptOut", r.EnableInExperienceIpReporting = "enableInExperienceIpReporting", r.EnableIpContentSearch = "enableIpContentSearch", r.EnableTrademark = "enableTrademark", r),
        P = ((n = {}).EnableIPRecommender = "enableIPRecommender", n),
        k = ((l = k || {}).EnableVideoOnboarding = "enableVideoOnboarding", l),
        I = ((i = I || {}).EnableSignalLookup = "enableSignalLookup", i.AlwaysShow = "alwaysShow", i),
        M = M || {},
        L = ((o = L || {}).mobileVariant = "mobileVariant", o),
        T = T || {},
        U = ((s = {}).ShowEditInStudioButton = "showEditInStudioButton", s.EnableCreationsNavLayout = "enableCreationsIPNavLayout", s),
        A = ((u = {}).EnableBulkAssetUpload = "enableBulkAssetUpload", u),
        R = ((d = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", d.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", d.EnableAudienceControls = "enableAudienceControls", d.EnableNewBadgePattern = "enableNewBadgePattern", d.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", d.EnableAudiencesReplacement = "enableAudiencesReplacement", d),
        O = ((c = {}).EnableTalentHubV2 = "enableTalentHubV2", c.EnableTalentHubV2M2 = "enableTalentHubV2M2", c),
        H = ((m = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", m),
        D = ((p = D || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", p),
        z = ((g = z || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", g),
        B = ((f = B || {}).EnableChangelogCMS = "enableChangelogCMS", f),
        F = ((b = {}).EnableSectionStepper = "enableSectionStepper", b),
        V = ((h = {}).CreatorDashboard = "CreatorDashboard", h.CreatorHubHomePage = "CreatorHub.HomePage.UserId", h.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", h.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", h.CreatorHubLandingPage = "CreatorHub.LandingPage", h.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", h.CreatorHubNavigation = "CreatorHub.Navigation", h.CreatorHubNavigationUser = "CreatorHub.Navigation.User", h.CreatorHubPublishing = "CreatorHub.Publishing.UserId", h.LicenseManager = "CreatorDashboard.LicenseManager", h.RightsManager = "CreatorDashboard.RightsManager", h.StarterPlaceCreation = "CRK.StarterPlace.StarterPlaceCreation", h.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", h.CreatorHubDocumentation = "CreatorHub.CreatorDocumentation.UserId", h.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", h.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", h.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", h.CreatorHubChangelog = "CreatorHub.Changelog", h.TalentHub = "CreatorHub.TalentHub.UserId", h.ContentSuitabilityQuestionnaire = "ContentSuitability.Questionnaire.UserId", h),
        X = ((v = X || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", v.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", v.ShowSecrets = "showSecrets", v.ShowQualitySignalCards = "showQualitySignalCards", v);
    let G = {
        CreatorDashboard: w,
        "CreatorHub.HomePage.UserId": k,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": I,
        "CreatorHub.LandingPage": M,
        "CreatorHub.LandingPage.UserId": L,
        "CreatorHub.Navigation": T,
        "CreatorHub.Navigation.User": U,
        "CreatorHub.Publishing.UserId": A,
        "CreatorDashboard.LicenseManager": P,
        "CreatorDashboard.RightsManager": N,
        "CRK.StarterPlace.StarterPlaceCreation": H,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.UserId": ((E = {}).EnableCourses = "enableCourses", E),
        "CreatorHub.CreatorDocumentation.Search.UserId": ((x = {}).SearchVersion = "searchVersion", x),
        "CreatorHub.Creations.Permission": R,
        "CreatorHub.ExperienceWebhooks.UserId": D,
        "CreatorHub.HomePage.ExperienceTile.UserId": z,
        "CreatorHub.Changelog": B,
        "CreatorHub.TalentHub.UserId": O,
        "ContentSuitability.Questionnaire.UserId": F
    };
    async function j(e) {
        let t = (0, S.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            a = Object.values(G[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(a);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let _ = (0, C.default)(j);
    y = async function(e, t) {
        let a = (0, S.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
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
    }, t = [], e.s(["ContentSuitabilityQuestionnaireParameters", () => F, "CreatorHubCreationsPermissionParameters", () => R, "CreatorHubPublishingParameters", () => A, "IXPLayers", () => V, "LicenseManagerParameters", () => P, "TalentHubParameters", () => O, "fetchIXPParametersForCurrentUser", 0, _], 29929)
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
}, 756568, e => {
    "use strict";
    var t = e.i(776344);
    e.s(["Flex", () => t.default])
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
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(237401);
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
    var t = e.i(17829);
    let a = "https://www.".concat("roblox.com"),
        r = "https://advertise.".concat("roblox.com"),
        n = e => "".concat(a, "/groups/").concat(e),
        l = e => "".concat(a, "/users/").concat(e, "/profile");
    e.s(["AdsManagerUrl", 0, r, "getAccountSecurityUrl", 0, () => "".concat(a, "/my/account#!/security"), "getAccountSettingsUrl", 0, () => "".concat(a, "/my/account#!/info"), "getAdvertiseAssetUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=Asset"), "getAdvertisePassUrl", 0, e => "".concat(r, "?targetId=").concat(e, "&targetType=GamePass"), "getAppealsPortalUrl", 0, () => "".concat(a, "/report-appeals#"), "getBadgeUrl", 0, e => "".concat(a, "/badges/").concat(e), "getBundleUrl", 0, e => "".concat(a, "/bundles/").concat(e), "getCatalogUrl", 0, e => "".concat(a, "/catalog/").concat(e), "getConfigureGroupRevenueSalesUrl", 0, e => "".concat(a, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getConfigureGroupRolesUrl", 0, e => "".concat(a, "/groups/configure?id=").concat(e, "#!/roles"), "getCreatorUrl", 0, (e, a) => e === t.default.Group ? n(a) : l(a), "getEventUrl", 0, e => "".concat(a, "/events/").concat(e), "getFriendsUrl", 0, e => "".concat(a, "/users/").concat(e, "/friends#!/friends"), "getGameDetailsUrl", 0, e => "".concat(a, "/games/").concat(e), "getGamePassUrl", 0, e => "".concat(a, "/game-pass/").concat(e), "getGroupUrl", 0, n, "getHomeUrl", 0, () => "".concat(a, "/home"), "getLegacyGroupTransactionsUrl", 0, e => "".concat(a, "/groups/configure?id=").concat(e, "#!/revenue/sales"), "getLegacyTransactionsUrl", 0, () => "".concat(a, "/transactions"), "getLookUrl", 0, e => "".concat(a, "/looks/").concat(e), "getSponsorAvatarItemsUrl", 0, () => "".concat(a, "/sponsorships/list#!/avatar-items"), "getSponsorExperienceCreateUrl", 0, e => "".concat(r, "/create?universeId=").concat(e), "getSponsorExperienceUrl", 0, e => "".concat(r, "?universeId=").concat(e), "getSupportFormUrl", 0, () => "".concat(a, "/support"), "getTermsUrl", 0, () => "".concat(a, "/info/terms"), "getTransactionsUrl", 0, () => "".concat(a, "/transactions"), "getUrl", 0, () => a, "getUserUrl", 0, l])
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
        n = e.i(533414),
        l = e.i(157310),
        i = e.i(279149),
        o = e.i(602635),
        s = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        d = new i.GroupsApi(u),
        c = function() {
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
                    }, d.groupsListGroups(e)
                }
            })
        },
        m = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: l
        } = e, {
            user: i
        } = (0, r.useRobloxAuthentication)(), {
            data: o,
            isLoading: s,
            refetch: u
        } = c(), [d, p] = (0, n.useLocalStorage)("creatorHubGroups.".concat(null == i ? void 0 : i.id), null), [g, f] = (0, n.useLocalStorage)("creatorHubGroup.".concat(null == i ? void 0 : i.id), null), [b, h] = (0, n.useLocalStorage)("creatorHubGroupData.".concat(null == i ? void 0 : i.id), {}), v = (0, a.useCallback)(e => {
            f(e);
            let t = null === e ? "user" : e;
            h(e => {
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
        }, [f, h]), E = (0, a.useMemo)(() => {
            if (null == o ? void 0 : o.groups) return null == o ? void 0 : o.groups;
            if (null === d) return [];
            try {
                return "string" == typeof d ? JSON.parse(d) : d
            } catch (e) {
                return []
            }
        }, [d, null == o ? void 0 : o.groups]), x = (0, a.useMemo)(() => {
            var e;
            return g && null != (e = E.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, E]);
        (0, a.useEffect)(() => {
            (null == i ? void 0 : i.id) && (null == o ? void 0 : o.groups) && !s && p(null == o ? void 0 : o.groups)
        }, [null == o ? void 0 : o.groups, E, s, p, null == i ? void 0 : i.id]);
        let y = (0, a.useMemo)(() => ({
            groups: E,
            currentGroup: x,
            groupData: b,
            isFetched: !s && !!(null == i ? void 0 : i.id),
            refreshGroups: u,
            setCurrentGroup: v
        }), [x, b, E, s, u, v, null == i ? void 0 : i.id]);
        return (0, t.jsx)(m.Provider, {
            value: y,
            children: l
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
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        r = e.i(723570),
        n = e => {
            var n, i, o;
            let s, u, {
                    present: d,
                    children: c
                } = e,
                m = function(e) {
                    var a, n;
                    let [i, o] = t.useState(), s = t.useRef(null), u = t.useRef(e), d = t.useRef("none"), [c, m] = (a = e ? "mounted" : "unmounted", n = {
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
                        d.current = "mounted" === c ? e : "none"
                    }, [c]), (0, r.useLayoutEffect)(() => {
                        let t = s.current,
                            a = u.current;
                        if (a !== e) {
                            let r = d.current,
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
                                    e.target === i && (d.current = l(s.current))
                                };
                            return i.addEventListener("animationstart", n), i.addEventListener("animationcancel", r), i.addEventListener("animationend", r), () => {
                                a.clearTimeout(t), i.removeEventListener("animationstart", n), i.removeEventListener("animationcancel", r), i.removeEventListener("animationend", r)
                            }
                        }
                        m("ANIMATION_END")
                    }, [i, m]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(c),
                        ref: t.useCallback(e => {
                            s.current = e ? getComputedStyle(e) : null, o(e)
                        }, [])
                    }
                }(d),
                p = "function" == typeof c ? c({
                    present: m.isPresent
                }) : t.Children.only(c),
                g = (0, a.useComposedRefs)(m.ref, (u = (s = null == (i = Object.getOwnPropertyDescriptor((n = p).props, "ref")) ? void 0 : i.get) && "isReactWarning" in s && s.isReactWarning) ? n.ref : (u = (s = null == (o = Object.getOwnPropertyDescriptor(n, "ref")) ? void 0 : o.get) && "isReactWarning" in s && s.isReactWarning) ? n.props.ref : n.props.ref || n.ref);
            return "function" == typeof c || m.isPresent ? t.cloneElement(p, {
                ref: g
            }) : null
        };

    function l(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    n.displayName = "Presence", e.s(["Presence", 0, n])
}, 71597, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(39210),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(78892),
        i = e.i(608652),
        o = e.i(174617),
        s = e.i(199786),
        u = e.i(300792),
        d = e.i(692166),
        c = e.i(169525),
        m = e.i(600317),
        p = e.i(221628),
        g = "Checkbox",
        [f, b] = (0, i.createContextScope)(g),
        [h, v] = f(g);

    function E(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: r,
            defaultChecked: l,
            disabled: i,
            form: o,
            name: u,
            onCheckedChange: d,
            required: c,
            value: m = "on",
            internal_do_not_use_render: f
        } = e, [b, v] = (0, s.useControllableState)({
            prop: a,
            defaultProp: null != l && l,
            onChange: d,
            caller: g
        }), [E, x] = n.useState(null), [y, S] = n.useState(null), C = n.useRef(!1), w = !E || !!o || !!E.closest("form"), N = {
            checked: b,
            disabled: i,
            setChecked: v,
            control: E,
            setControl: x,
            name: u,
            form: o,
            value: m,
            hasConsumerStoppedPropagationRef: C,
            required: c,
            defaultChecked: !k(l) && l,
            isFormControl: w,
            bubbleInput: y,
            setBubbleInput: S
        };
        return (0, p.jsx)(h, {
            scope: t,
            ...N,
            children: "function" == typeof f ? f(N) : r
        })
    }
    var x = "CheckboxTrigger",
        y = n.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: r,
                onClick: i,
                ...s
            } = e, {
                control: u,
                value: d,
                disabled: c,
                checked: g,
                required: f,
                setControl: b,
                setChecked: h,
                hasConsumerStoppedPropagationRef: E,
                isFormControl: y,
                bubbleInput: S
            } = v(x, a), C = (0, l.useComposedRefs)(t, b), w = n.useRef(g);
            return n.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => h(w.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, h]), (0, p.jsx)(m.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": k(g) ? "mixed" : g,
                "aria-required": f,
                "data-state": I(g),
                "data-disabled": c ? "" : void 0,
                disabled: c,
                value: d,
                ...s,
                ref: C,
                onKeyDown: (0, o.composeEventHandlers)(r, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, o.composeEventHandlers)(i, e => {
                    h(e => !!k(e) || !e), S && y && (E.current = e.isPropagationStopped(), E.current || e.stopPropagation())
                })
            })
        });
    y.displayName = x;
    var S = n.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: r,
            checked: n,
            defaultChecked: l,
            required: i,
            disabled: o,
            value: s,
            onCheckedChange: u,
            form: d,
            ...c
        } = e;
        return (0, p.jsx)(E, {
            __scopeCheckbox: a,
            checked: n,
            defaultChecked: l,
            disabled: o,
            required: i,
            onCheckedChange: u,
            name: r,
            form: d,
            value: s,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: r
                } = e;
                return (0, p.jsxs)(p.Fragment, {
                    children: [(0, p.jsx)(y, {
                        ...c,
                        ref: t,
                        __scopeCheckbox: a
                    }), r && (0, p.jsx)(P, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    S.displayName = g;
    var C = "CheckboxIndicator",
        w = n.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: r,
                ...n
            } = e, l = v(C, a);
            return (0, p.jsx)(c.Presence, {
                present: r || k(l.checked) || !0 === l.checked,
                children: (0, p.jsx)(m.Primitive.span, {
                    "data-state": I(l.checked),
                    "data-disabled": l.disabled ? "" : void 0,
                    ...n,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    w.displayName = C;
    var N = "CheckboxBubbleInput",
        P = n.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...r
            } = e, {
                control: i,
                hasConsumerStoppedPropagationRef: o,
                checked: s,
                defaultChecked: c,
                required: g,
                disabled: f,
                name: b,
                value: h,
                form: E,
                bubbleInput: x,
                setBubbleInput: y
            } = v(N, a), S = (0, l.useComposedRefs)(t, y), C = (0, u.usePrevious)(s), w = (0, d.useSize)(i);
            n.useEffect(() => {
                if (!x) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !o.current;
                if (C !== s && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    x.indeterminate = k(s), e.call(x, !k(s) && s), x.dispatchEvent(a)
                }
            }, [x, C, s, o]);
            let P = n.useRef(!k(s) && s);
            return (0, p.jsx)(m.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != c ? c : P.current,
                required: g,
                disabled: f,
                name: b,
                value: h,
                form: E,
                ...r,
                tabIndex: -1,
                ref: S,
                style: {
                    ...r.style,
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

    function I(e) {
        return k(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    P.displayName = N;
    let M = {
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
        U = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: l,
            className: i,
            isChecked: o,
            isDisabled: s,
            size: u,
            hint: d,
            placement: c,
            onCheckedChange: m,
            id: p,
            ...g
        } = e, f = (0, a.default)(), b = p || f, h = l && n.default.createElement("label", {
            htmlFor: b,
            className: (0, r.default)("flex flex-col grow-1 gap-xsmall", !s && "cursor-pointer")
        }, n.default.createElement("span", {
            className: (0, r.default)(T[u], U[u], "content-emphasis")
        }, l), d && n.default.createElement("span", {
            className: "text-body-medium content-default"
        }, d));
        return n.default.createElement("div", {
            className: (0, r.default)("foundation-web-checkbox flex gap-medium", s && "opacity-[0.5]", !s && "cursor-pointer", i)
        }, "End" === c && h, n.default.createElement("div", {
            className: (0, r.default)(L[u])
        }, n.default.createElement(S, {
            "data-slot": "checkbox",
            className: (0, r.default)(M[u], t.interactable, !s && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: b,
            checked: o,
            disabled: s,
            onCheckedChange: m,
            "aria-label": l,
            ...g
        }, n.default.createElement(t.StateLayer, null), n.default.createElement(w, {
            "data-slot": "checkbox-indicator",
            className: (0, r.default)(M[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === c && h)
    }], 71597)
}, 270092, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        r = e.i(688702),
        n = e.i(197649),
        l = e.i(416340);
    let i = {
            Small: "XSmall",
            Medium: "Small",
            Large: "Medium"
        },
        o = {
            Small: ["height-600", "text-label-small"],
            Medium: ["height-800", "text-label-medium"],
            Large: ["height-1000", "text-label-medium"]
        },
        s = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-large"
        },
        u = {
            Small: "padding-left-small",
            Medium: "padding-left-medium",
            Large: "padding-left-medium"
        },
        d = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-large"
        },
        c = {
            Small: "padding-right-small",
            Medium: "padding-right-medium",
            Large: "padding-right-medium"
        },
        m = {
            Small: "padding-left-xsmall",
            Medium: "padding-left-[var(--size-150)]",
            Large: "padding-left-small"
        },
        p = {
            Small: "padding-right-[var(--size-150)]",
            Medium: "padding-right-small",
            Large: "padding-right-[var(--size-250)]"
        },
        g = {
            Standard: "bg-shift-300",
            Utility: "bg-none"
        },
        f = {
            Small: "size-[var(--icon-size-xsmall)]",
            Medium: "size-[var(--icon-size-small)]",
            Large: "size-[var(--icon-size-medium)]"
        },
        b = e => {
            let {
                iconName: t,
                node: a,
                size: o
            } = e;
            return null != t ? l.default.createElement(r.Icon, {
                name: t,
                size: i[o]
            }) : null != a ? l.default.createElement("span", {
                className: (0, n.default)("inline-flex items-center justify-center shrink-0", f[o])
            }, a) : null
        },
        h = (0, l.forwardRef)((e, r) => {
            let {
                className: i,
                style: f,
                text: h,
                isDisabled: v = !1,
                size: E = "Medium",
                variant: x = "Standard",
                leadingIconName: y,
                leadingIconNode: S,
                trailingIconName: C,
                trailingIconNode: w,
                ...N
            } = e, P = null != y || null != S, k = null != C || null != w, I = (0, n.default)(v ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex justify-center items-center radius-circle stroke-none", P ? u[E] : s[E], k ? c[E] : d[E], o[E], i), M = l.default.createElement(l.default.Fragment, null, l.default.createElement(t.StateLayer, null), l.default.createElement(b, {
                iconName: y,
                node: S,
                size: E
            }), l.default.createElement("span", {
                className: (0, n.default)("padding-y-xsmall text-no-wrap text-truncate-end", P && m[E], k && p[E])
            }, h), l.default.createElement(b, {
                iconName: C,
                node: w,
                size: E
            })), L = {
                textDecoration: "none",
                ...f
            };
            if ("a" === N.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = N;
                return l.default.createElement("a", {
                    ref: r,
                    ...a,
                    "aria-disabled": v,
                    href: v ? void 0 : t,
                    className: (0, n.default)(I, g[x], "content-action-utility"),
                    style: L
                }, M)
            }
            let {
                as: T,
                isChecked: U,
                onCheckedChange: A,
                ...R
            } = N;
            return l.default.createElement("button", {
                ref: r,
                type: "button",
                ...R,
                className: (0, n.default)(U ? "bg-inverse-surface-0" : g[x], U ? "content-inverse-emphasis" : "content-action-utility", I),
                style: L,
                "aria-pressed": U,
                disabled: v,
                onClick: null == A ? void 0 : () => A(!U)
            }, M)
        });
    e.s(["Chip", 0, h])
}, 942625, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let r = (0, a.forwardRef)((e, r) => {
        let {
            className: n,
            style: l,
            orientation: i = "horizontal",
            variant: o = "Standard",
            ...s
        } = e, u = "vertical" === i, d = {};
        return u || "Inset" !== o ? u || "InsetLeft" !== o ? u || "InsetRight" !== o || (d = {
            marginRight: "var(--padding-xlarge)"
        }) : d = {
            marginLeft: "var(--padding-xlarge)"
        } : d = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: r,
            ...s,
            role: "separator",
            "data-orientation": i,
            "aria-orientation": i,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...u ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === o ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...d,
                ...l
            },
            className: (0, t.default)("stroke-default self-stretch", n)
        })
    });
    r.displayName = "Divider", e.s(["Divider", 0, r])
}, 631719, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        r = e.i(197649),
        n = e.i(416340),
        l = e.i(23342);
    let i = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        o = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        s = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        u = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        c = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        m = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        p = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        g = (0, n.forwardRef)((e, g) => {
            let f, {
                className: b,
                icon: h,
                ariaLabel: v,
                isDisabled: E = !1,
                isCircular: x = !1,
                isSelected: y = !1,
                size: S = "Large",
                variant: C = "Emphasis",
                iconColor: w = "Default",
                asChild: N,
                children: P,
                ...k
            } = e;
            f = E ? d[C] : y ? c[C] : u[C];
            let I = (0, r.default)("foundation-web-icon-button", E ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", i[S], s[S][x ? "circular" : "square"], f, b),
                M = n.default.createElement(n.default.Fragment, null, n.default.createElement(t.StateLayer, null), n.default.createElement("span", {
                    className: (0, r.default)("icon", h, o[S], E ? p[w][C] : m[w][C])
                }));
            if (N) {
                let {
                    as: e,
                    ...t
                } = k, a = n.default.Children.only(P);
                return n.default.createElement(l.Slot, {
                    ref: g,
                    ...t,
                    className: I,
                    "aria-label": v,
                    "aria-disabled": E || void 0
                }, n.default.cloneElement(a, {}, M))
            }
            if ("a" === k.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = k;
                return n.default.createElement("a", {
                    ref: g,
                    ...a,
                    "aria-label": v,
                    "aria-disabled": E,
                    href: E ? void 0 : t,
                    className: I
                }, M)
            }
            let {
                as: L,
                ...T
            } = k;
            return n.default.createElement("button", {
                ref: g,
                type: "button",
                ...T,
                "aria-label": v,
                disabled: E,
                className: I
            }, M)
        });
    e.s(["IconButton", 0, g])
}, 934145, 616892, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(39210),
        r = e.i(339855),
        n = e.i(908202),
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
        d = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        c = {
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
        p = {
            XSmall: "gap-xsmall",
            Small: "gap-small",
            Medium: "gap-small",
            Large: "gap-small"
        },
        g = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        f = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        b = (0, i.forwardRef)((e, b) => {
            let {
                label: h,
                labelTooltip: v,
                ariaLabelledBy: E,
                ariaLabel: x,
                className: y,
                size: S,
                variant: C = "Standard",
                value: w,
                placeholder: N,
                isDisabled: P,
                hasError: k,
                hint: I,
                onValueChange: M,
                onOpenChange: L,
                children: T
            } = e, U = (0, a.default)(), A = (0, i.useMemo)(() => ({
                size: S
            }), [S]), R = h ? i.default.createElement("span", {
                id: U,
                className: (0, l.default)(c[S], "content-emphasis")
            }, h) : null;
            return i.default.createElement(s.Provider, {
                value: A
            }, i.default.createElement("div", {
                className: (0, l.default)("flex flex-col", P && ["opacity-[0.5]", "pointer-events-none"], p[S], y)
            }, R && (v ? i.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, R, i.default.createElement(r.LabelTooltip, v)) : R), i.default.createElement(o.Root, {
                value: w,
                disabled: P,
                onValueChange: M,
                onOpenChange: L
            }, i.default.createElement(o.Trigger, {
                className: (0, l.default)("relative clip group/interactable outline-none", "foundation-web-input flex items-center justify-between width-full cursor-pointer", n.INPUT_BACKGROUND_BY_VARIANT[C], n.INPUT_STROKE_BY_VARIANT[C], g[S], f[S], d[S], m[S], k ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis", void 0 === w ? "content-muted" : "content-default"),
                ref: b,
                "aria-labelledby": h ? U : E,
                "aria-label": x
            }, i.default.createElement(t.StateLayer, null), i.default.createElement("div", {
                className: "grow-1 text-truncate-split text-align-x-left"
            }, i.default.createElement(o.Value, {
                placeholder: N
            })), i.default.createElement(o.Icon, {
                className: (0, l.default)(u[S], "icon icon-regular-chevron-large-down content-default")
            })), i.default.createElement(o.Portal, null, i.default.createElement(o.Content, {
                position: "popper",
                className: "padding-y-small foundation-web-portal-zindex",
                style: {
                    maxHeight: "var(--radix-select-content-available-height)"
                }
            }, T))), I && i.default.createElement("span", {
                className: (0, l.default)("text-caption-small", {
                    "content-system-alert": k,
                    "content-default": !k
                })
            }, I)))
        });
    b.displayName = "Dropdown", e.s(["Dropdown", 0, b, "DropdownContext", 0, s], 616892);
    var h = e.i(23342),
        v = e.i(142953);
    let E = {
            XSmall: "radius-medium",
            Small: "radius-large",
            Medium: "radius-large",
            Large: "radius-large"
        },
        x = {
            XSmall: "padding-xsmall",
            Small: "padding-small",
            Medium: "padding-small",
            Large: "padding-small"
        },
        y = {
            XSmall: "padding-x-medium",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        S = {
            XSmall: "padding-y-xsmall",
            Small: "padding-y-small",
            Medium: "padding-y-small",
            Large: "padding-y-medium"
        },
        C = {
            XSmall: "gap-x-medium",
            Small: "gap-x-medium",
            Medium: "gap-x-medium",
            Large: "gap-x-large"
        },
        w = {
            XSmall: "gap-y-xxsmall",
            Small: "gap-y-xxsmall",
            Medium: "gap-y-xsmall",
            Large: "gap-y-xsmall"
        },
        N = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        P = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        k = (0, i.createContext)(null),
        I = () => {
            let e = (0, i.useContext)(k);
            if (!e) throw Error("Menu components must be used within a Menu");
            return e
        };
    e.s(["Menu", 0, e => {
        var t;
        let {
            children: a,
            className: r,
            size: n
        } = e, u = (0, i.useContext)(s), d = u ? "dropdown" : "standalone", c = null != (t = null != n ? n : null == u ? void 0 : u.size) ? t : "Medium", m = (0, i.useMemo)(() => ({
            size: c,
            mode: d
        }), [c, d]), p = (0, l.default)("foundation-web-menu bg-surface-100 stroke-standard stroke-default shadow-transient-high", E[c], r), g = "standalone" === d ? i.default.createElement(v.Root, {
            asChild: !0,
            orientation: "vertical",
            loop: !0
        }, i.default.createElement("div", {
            role: "menu",
            tabIndex: -1,
            className: p
        }, a)) : i.default.createElement("div", {
            className: p
        }, a);
        return i.default.createElement(k.Provider, {
            value: m
        }, "dropdown" === d ? i.default.createElement(o.Viewport, {
            asChild: !0,
            style: {
                width: "var(--radix-popper-anchor-width)"
            }
        }, g) : g)
    }, "MenuItem", 0, e => {
        let a, {
                value: r,
                leading: n,
                title: s,
                description: u,
                trailing: d,
                disabled: c,
                className: m,
                onSelect: p,
                asChild: g,
                children: f,
                ...b
            } = e,
            {
                size: E,
                mode: x
            } = I(),
            k = (0, l.default)(t.interactable, "foundation-web-menu-item flex items-center content-default text-truncate-split focus-visible:hover:outline-none cursor-pointer stroke-none bg-none text-align-x-left width-full", N[E], y[E], S[E], C[E], P[E], c && "opacity-[0.5]", c && "pointer-events-none", m),
            M = i.default.createElement("span", {
                className: "foundation-web-menu-item-title text-no-wrap text-truncate-split content-emphasis"
            }, s);
        switch (x) {
            case "dropdown":
                M = i.default.createElement(o.ItemText, {
                    asChild: !0
                }, M);
                break;
            case "standalone":
                break;
            default:
                console.error("Invalid menu mode:", x)
        }
        let L = i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.StateLayer, null), n, i.default.createElement("div", {
            className: (0, l.default)("grow-1 text-truncate-split flex flex-col", w[E])
        }, M, u && i.default.createElement("div", {
            className: "foundation-web-menu-item-description content-muted"
        }, u)), d);
        if (g) {
            let {
                as: e,
                ...r
            } = b, n = i.default.Children.only(f), l = void 0 === s && n.props.children;
            a = i.default.createElement(h.Slot, {
                ...r,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c || void 0,
                className: k,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : p
            }, l ? i.default.cloneElement(n, {}, i.default.createElement(i.default.Fragment, null, !c && i.default.createElement(t.StateLayer, null), n.props.children)) : i.default.cloneElement(n, {}, L))
        } else if ("a" === b.as) {
            let {
                as: e,
                href: t,
                ...r
            } = b;
            a = i.default.createElement("a", {
                ...r,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c,
                href: c ? void 0 : t,
                className: k,
                style: {
                    outlineOffset: 0,
                    textDecoration: "none"
                },
                onClick: c ? void 0 : p
            }, L)
        } else {
            let {
                as: e,
                ...t
            } = b;
            a = i.default.createElement("button", {
                type: "button",
                ...t,
                role: "standalone" === x ? "menuitem" : void 0,
                "aria-disabled": c,
                className: k,
                style: {
                    outlineOffset: 0
                },
                onClick: c ? void 0 : p
            }, L)
        }
        return "dropdown" === x ? i.default.createElement(o.Item, {
            value: r,
            disabled: c,
            asChild: !0
        }, a) : i.default.createElement(v.Item, {
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
        } = I(), d = (0, l.default)("foundation-web-menu-label flex items-center content-default text-truncate-split text-align-x-left width-full", N[u], y[u], S[u], C[u], o && "opacity-[0.5]", s);
        return i.default.createElement("div", {
            role: "none",
            className: d
        }, r, i.default.createElement("div", {
            className: (0, l.default)("grow-1 text-truncate-split flex flex-col", w[u])
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
        } = I();
        return i.default.createElement("div", {
            role: "group",
            className: (0, l.default)(x[r], a)
        }, t)
    }, "MenuSeparator", 0, e => {
        let {
            className: t
        } = e;
        return i.default.createElement("div", {
            role: "separator",
            className: (0, l.default)("foundation-web-menu-separator", t)
        })
    }], 934145)
}, 924747, e => {
    "use strict";
    var t = e.i(823981),
        a = e.i(688702),
        r = e.i(39210),
        n = e.i(339855),
        l = e.i(908202),
        i = e.i(197649),
        o = e.i(416340);
    let s = {
            XSmall: "padding-x-small",
            Small: "padding-x-medium",
            Medium: "padding-x-medium",
            Large: "padding-x-medium"
        },
        u = {
            XSmall: "gap-x-xsmall",
            Small: "gap-x-small",
            Medium: "gap-x-small",
            Large: "gap-x-small"
        },
        d = {
            XSmall: "height-600",
            Small: "height-800",
            Medium: "height-1000",
            Large: "height-1200"
        },
        c = {
            XSmall: "radius-small",
            Small: "radius-medium",
            Medium: "radius-medium",
            Large: "radius-medium"
        },
        m = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium",
            Large: "text-title-large"
        },
        p = {
            XSmall: ["text-body-small", "placeholder:text-body-small"],
            Small: ["text-body-small", "placeholder:text-body-small"],
            Medium: ["text-body-medium", "placeholder:text-body-medium"],
            Large: ["text-body-large", "placeholder:text-body-large"]
        },
        g = (0, o.forwardRef)((e, g) => {
            let {
                label: f,
                labelTooltip: b,
                leadingIconName: h,
                trailingIconName: v,
                leadingIconNode: E,
                trailingIconNode: x,
                hasError: y,
                error: S,
                helperText: C,
                size: w,
                variant: N = "Standard",
                isRequired: P,
                isDisabled: k,
                className: I,
                style: M,
                inputContainerClassName: L,
                inputContainerClassStyle: T,
                id: U,
                ...A
            } = e, R = (0, r.default)(), O = U || R, H = "".concat(O, "-description"), D = null != w ? w : "Large", z = y || !!S, B = S || C, F = (0, o.useMemo)(() => h ? o.default.createElement(a.Icon, {
                name: h,
                size: D,
                className: "content-emphasis",
                "data-testid": "text-input-leading-icon"
            }) : E, [h, E, D]), V = (0, o.useMemo)(() => v ? o.default.createElement(a.Icon, {
                name: v,
                size: D,
                className: "content-emphasis",
                "data-testid": "text-input-trailing-icon"
            }) : x, [D, v, x]), X = f ? o.default.createElement("label", {
                htmlFor: O,
                className: (0, i.default)(m[D], "content-emphasis")
            }, f, P && o.default.createElement(o.default.Fragment, null, " ", o.default.createElement("span", {
                className: "content-default"
            }, "*"))) : null;
            return o.default.createElement("div", {
                "data-testid": "text-input-wrapper",
                className: (0, i.default)("flex width-full flex-col gap-small ".concat(I), {
                    [t.disabledOpacity]: k
                }),
                style: M
            }, X && (b ? o.default.createElement("div", {
                className: "flex items-center gap-xsmall"
            }, X, o.default.createElement(n.LabelTooltip, b)) : X), o.default.createElement("div", {
                "data-testid": "text-input-container",
                className: (0, i.default)("foundation-web-input flex items-center width-full", l.INPUT_STROKE_BY_VARIANT[N], l.INPUT_BACKGROUND_BY_VARIANT[N], L, d[D], c[D], s[D], u[D], z ? "stroke-system-alert focus-within:stroke-system-alert" : "stroke-contrast-alpha focus-within:stroke-system-emphasis"),
                style: T
            }, F, o.default.createElement("input", {
                type: "text",
                id: O,
                ref: g,
                className: (0, i.default)("width-full padding-none bg-none stroke-none outline-none content-emphasis placeholder:content-muted", p[D]),
                style: {
                    appearance: "none"
                },
                "aria-invalid": z,
                "aria-describedby": B ? H : void 0,
                required: P,
                ...A,
                disabled: k
            }), V), B && o.default.createElement("span", {
                id: H,
                className: (0, i.default)("text-caption-small", {
                    "content-system-alert": z,
                    "content-default": !z
                })
            }, B))
        });
    g.displayName = "TextInput", e.s(["TextInput", 0, g])
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
    var n = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: l,
            hasBeak: i = !0,
            title: o,
            description: s,
            ariaLabel: u,
            delayDurationMs: d = 500,
            children: c,
            open: m,
            onOpenChange: p,
            contentClassName: g
        } = e, [f, b] = l.split("-"), h = null != u ? u : "string" == typeof o && null == s ? o : void 0;
        return a.createElement(n.Provider, {
            delayDuration: d
        }, a.createElement(n.Root, {
            open: m,
            onOpenChange: p
        }, c, a.createElement(n.Portal, null, a.createElement(n.Content, {
            side: f,
            align: b,
            "aria-label": h,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", g),
            sideOffset: 5
        }, i && a.createElement(n.Arrow, {
            asChild: !0
        }, a.createElement(r, {
            className: "content-[var(--inverse-surface-0)]"
        })), a.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, a.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, o), s && a.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, s))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: r,
            className: l
        } = e;
        return a.createElement(n.Trigger, {
            asChild: r,
            className: l
        }, t)
    }], 737420)
}, 339855, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(737420),
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
}, 908202, e => {
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
}, 39210, e => {
    "use strict";
    var t = e.i(416340);
    let a = 0;
    e.s(["default", 0, function() {
        let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "«r",
            r = (0, t.useRef)();
        return r.current || (a += 1, r.current = "".concat(e).concat(a)), r.current
    }])
}, 27281, e => {
    "use strict";
    var t = e.i(437272);
    e.s(["NavigateNextIcon", () => t.N])
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        r = e.i(323356);
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
            d = (0, t.a)(e, ["children"]),
            c = (0, a.useRef)(null),
            m = (0, a.useState)(!1),
            p = m[0],
            g = m[1],
            f = (0, a.useState)([]),
            b = f[0],
            h = f[1],
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
            E = (0, a.useCallback)(function() {
                g(!1)
            }, [g]);
        (0, a.useEffect)(function() {
            b.length > 0 && g(!0)
        }, [b.length]);
        var x = (0, a.useMemo)(function() {
            return {
                ref: c,
                enqueue: v,
                close: E
            }
        }, [E, v]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(n.Provider, {
            value: x
        }, u), a.default.createElement(r.S, (0, t._)({}, (null == (l = b[0]) ? void 0 : l.props) || {}, d, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (i = b[0]) ? void 0 : i.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, r, n, l;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (r = null == (a = b[0]) ? void 0 : a.props.TransitionProps) ? void 0 : r.onExited) && (null == (l = null == (n = b[0]) ? void 0 : n.props.TransitionProps) || l.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, r, n;
                (null == (a = b[0]) ? void 0 : a.shouldClose(t)) && g(!1), (null == (r = b[0]) ? void 0 : r.props.onClose) && (null == (n = b[0]) || n.props.onClose(e, t))
            },
            open: p
        }), null == (s = b[0]) ? void 0 : s.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(n);
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
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        r = [],
        n = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        l = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var i;
        let {
            children: o,
            unifiedLogger: s,
            pageLoggerConfig: u,
            path: d
        } = e, c = null != (i = null == u ? void 0 : u.tags) ? i : r, m = null == u ? void 0 : u.rosId, p = (0, t.useMemo)(() => ({
            tags: c,
            rosId: m,
            path: d
        }), [c, m, d]), g = (0, t.useRef)(p), f = (0, t.useRef)(p);
        (0, t.useLayoutEffect)(() => {
            f.current = p, void 0 === g.current.path && void 0 !== p.path && (g.current = {
                ...g.current,
                path: p.path
            })
        }, [p]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, r = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && l.has(a)) ? g.current : f.current;
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
        let b = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: p
        }), [s, p]);
        return t.default.createElement(a.Provider, {
            value: b
        }, o)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=de53eb93-1384-4d7a-7a33-8ad1b5f82e93
//# sourceMappingURL=09c4hcg1msz8t.js.map