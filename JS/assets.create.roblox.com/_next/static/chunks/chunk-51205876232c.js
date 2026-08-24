;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4bb34187-8761-efcb-1c7c-7167d187f38c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 605050, e => {
    "use strict";
    var t = e.i(675454);
    let r = (0, e.i(272593).createClientConfiguration)("core-content", "bedev2"),
        n = new t.CoreContentApi(r);
    e.s(["default", 0, n])
}, 29929, e => {
    "use strict";
    let t;
    var r, n, i, o, a, l, s, u, c, d, p, v, b, h, y, C, g, f, w, m = e.i(650502),
        E = e.i(864392),
        P = ((r = {}).ShowVrDeviceOption = "showVrDeviceOption", r.ShowIXPClientTest = "showIXPClientTest", r.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", r.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", r.EnableIA = "enableIA", r.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", r.EnableDevexEarnedRobux = "enableDevexEarnedRobux", r.EnableExperienceGenre = "enableExperienceGenre", r.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", r.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", r.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", r.EnableEventRequestFeaturing = "enableEventRequestFeaturing", r.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", r),
        R = ((n = {}).EnableRightsManager = "enableRightsManager", n.EnableBulkFiling = "enableBulkFiling", n.EnableOnDemandSearch = "enableOnDemandSearch", n.EnableEditRegistration = "enableEditRegistration", n.EnableImageSearch = "enableImageSearch", n.EnableClaimsAgainstMe = "enableClaimsAgainstMe", n.EnableGenAiOptOut = "enableGenAiOptOut", n.EnableInExperienceIpReporting = "enableInExperienceIpReporting", n.EnableIpContentSearch = "enableIpContentSearch", n.EnableTrademark = "enableTrademark", n),
        A = ((i = {}).EnableIPRecommender = "enableIPRecommender", i),
        S = ((o = S || {}).EnableVideoOnboarding = "enableVideoOnboarding", o),
        I = ((a = I || {}).EnableSignalLookup = "enableSignalLookup", a.AlwaysShow = "alwaysShow", a),
        T = T || {},
        U = ((l = U || {}).mobileVariant = "mobileVariant", l),
        x = x || {},
        q = ((s = {}).ShowEditInStudioButton = "showEditInStudioButton", s.EnableCreationsNavLayout = "enableCreationsIPNavLayout", s),
        k = ((u = {}).EnablePublishingConsolidation = "enablePublishingConsolidation", u),
        H = ((c = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", c.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", c.EnableAudienceControls = "enableAudienceControls", c.EnableNewBadgePattern = "enableNewBadgePattern", c.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", c.EnableAudiencesReplacement = "enableAudiencesReplacement", c),
        O = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        K = ((p = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", p),
        G = ((v = G || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", v),
        D = ((b = D || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", b),
        L = ((h = L || {}).EnableChangelogCMS = "enableChangelogCMS", h),
        M = ((y = {}).CreatorDashboard = "CreatorDashboard", y.CreatorHubHomePage = "CreatorHub.HomePage.UserId", y.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", y.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", y.CreatorHubLandingPage = "CreatorHub.LandingPage", y.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", y.CreatorHubNavigation = "CreatorHub.Navigation", y.CreatorHubNavigationUser = "CreatorHub.Navigation.User", y.CreatorHubPublishing = "CreatorHub.Publishing.UserId", y.LicenseManager = "CreatorDashboard.LicenseManager", y.RightsManager = "CreatorDashboard.RightsManager", y.StarterPlaceCreation = "CRK.StarterPlace.StarterPlaceCreation", y.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", y.CreatorHubDocumentation = "CreatorHub.CreatorDocumentation.UserId", y.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", y.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", y.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", y.CreatorHubChangelog = "CreatorHub.Changelog", y.TalentHub = "CreatorHub.TalentHub.UserId", y),
        N = ((C = N || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", C.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", C.ShowSecrets = "showSecrets", C.ShowQualitySignalCards = "showQualitySignalCards", C);
    let B = {
        CreatorDashboard: P,
        "CreatorHub.HomePage.UserId": S,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": I,
        "CreatorHub.LandingPage": T,
        "CreatorHub.LandingPage.UserId": U,
        "CreatorHub.Navigation": x,
        "CreatorHub.Navigation.User": q,
        "CreatorHub.Publishing.UserId": k,
        "CreatorDashboard.LicenseManager": A,
        "CreatorDashboard.RightsManager": R,
        "CRK.StarterPlace.StarterPlaceCreation": K,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.UserId": ((g = {}).EnableCourses = "enableCourses", g),
        "CreatorHub.CreatorDocumentation.Search.UserId": ((f = {}).SearchVersion = "searchVersion", f),
        "CreatorHub.Creations.Permission": H,
        "CreatorHub.ExperienceWebhooks.UserId": G,
        "CreatorHub.HomePage.ExperienceTile.UserId": D,
        "CreatorHub.Changelog": L,
        "CreatorHub.TalentHub.UserId": O
    };
    async function V(e) {
        let t = (0, m.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            r = Object.values(B[e]).join(","),
            n = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(r);
        return (await fetch(n, {
            credentials: "include"
        })).json()
    }
    let _ = (0, E.default)(V);
    w = async function(e, t) {
        let r = (0, m.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            n = await fetch("".concat(r, "/v1/projects/1/values"), {
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
        return (await n.json()).layers[e].parameters
    }, t = [], e.s(["CreatorHubCreationsPermissionParameters", () => H, "CreatorHubPublishingParameters", () => k, "IXPLayers", () => M, "LicenseManagerParameters", () => A, "TalentHubParameters", () => O, "fetchIXPParametersForCurrentUser", 0, _], 29929)
}, 864392, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        let t = new Map;
        return r => {
            if (t.has(r)) return t.get(r);
            let n = e(r);
            return t.set(r, n), n
        }
    }])
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        r = e.i(237401);
    e.s(["default", 0, (e, n) => {
        let i = (0, r.useRouter)();
        return [(0, t.useMemo)(() => {
            let t = {};
            for (let r of e) t[r] = i.query[r];
            return t
        }, [e, i.query]), (0, t.useCallback)(function(t) {
            var r;
            let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                a = {
                    ...i.query
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let r = t[e];
                null == r ? delete a[e] : Array.isArray(r) ? a[e] = r.map(e => e.toString()) : a[e] = r.toString()
            }), r = i.query, Array.from(new Set([...Object.keys(r), ...Object.keys(a)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let r = Array.isArray(e) ? e : [e],
                    n = Array.isArray(t) ? t : [t];
                return r.length === n.length && r.every((e, t) => e === n[t])
            })(r[e], a[e])) || (o.skipHistory ? i.replace({
                pathname: i.pathname,
                query: a
            }) : i.push({
                pathname: i.pathname,
                query: a
            }, void 0, n))
        }, [i, e, n])]
    }, "normalizeSingleQueryParam", 0, e => {
        let t = Array.isArray(e) ? e[0] : e;
        return "" === t || null == t ? void 0 : t
    }])
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
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        r = e.i(416340),
        n = e.i(458451),
        i = e.i(533414),
        o = e.i(157310),
        a = e.i(279149),
        l = e.i(602635),
        s = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        c = new a.GroupsApi(u),
        d = function() {
            let {
                user: e
            } = (0, s.useAuthentication)();
            return (0, o.useQuery)({
                queryKey: l.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: a.GroupListSurface.CreatorHub
                    }, c.groupsListGroups(e)
                }
            })
        },
        p = (0, r.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: a
        } = (0, n.useRobloxAuthentication)(), {
            data: l,
            isLoading: s,
            refetch: u
        } = d(), [c, v] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == a ? void 0 : a.id), null), [b, h] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == a ? void 0 : a.id), null), [y, C] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == a ? void 0 : a.id), {}), g = (0, r.useCallback)(e => {
            h(e);
            let t = null === e ? "user" : e;
            C(e => {
                let r = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: i
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof i || Number.isNaN(i) || (r.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...e,
                    [t]: r
                }
            })
        }, [h, C]), f = (0, r.useMemo)(() => {
            if (null == l ? void 0 : l.groups) return null == l ? void 0 : l.groups;
            if (null === c) return [];
            try {
                return "string" == typeof c ? JSON.parse(c) : c
            } catch (e) {
                return []
            }
        }, [c, null == l ? void 0 : l.groups]), w = (0, r.useMemo)(() => {
            var e;
            return b && null != (e = f.find(e => {
                let {
                    id: t
                } = e;
                return t === b
            })) ? e : null
        }, [b, f]);
        (0, r.useEffect)(() => {
            (null == a ? void 0 : a.id) && (null == l ? void 0 : l.groups) && !s && v(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, f, s, v, null == a ? void 0 : a.id]);
        let m = (0, r.useMemo)(() => ({
            groups: f,
            currentGroup: w,
            groupData: y,
            isFetched: !s && !!(null == a ? void 0 : a.id),
            refreshGroups: u,
            setCurrentGroup: g
        }), [w, y, f, s, u, g, null == a ? void 0 : a.id]);
        return (0, t.jsx)(p.Provider, {
            value: m,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, r.useContext)(p);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, r.useContext)(p);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 675454, e => {
    "use strict";
    var t = e.i(677753),
        r = function(e, t) {
            return (r = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var r in t) Object.prototype.hasOwnProperty.call(t, r) && (e[r] = t[r])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        r(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function i(e, t, r, n) {
        return new(r || (r = Promise))(function(i, o) {
            function a(e) {
                try {
                    s(n.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                try {
                    s(n.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof r ? t : new r(function(e) {
                    e(t)
                })).then(a, l)
            }
            s((n = n.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var r, n, i, o = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            a = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return a.next = l(0), a.throw = l(1), a.return = l(2), "function" == typeof Symbol && (a[Symbol.iterator] = function() {
            return this
        }), a;

        function l(l) {
            return function(s) {
                var u = [l, s];
                if (r) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (r = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return o.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            o.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = o.ops.pop(), o.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = o.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                o = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                o.label = u[1];
                                break
                            }
                            if (6 === u[0] && o.label < i[1]) {
                                o.label = i[1], i = u;
                                break
                            }
                            if (i && o.label < i[2]) {
                                o.label = i[2], o.ops.push(u);
                                break
                            }
                            i[2] && o.ops.pop(), o.trys.pop();
                            continue
                    }
                    u = t.call(e, o)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    r = i = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function a(e) {
        return e
    }

    function l(e) {
        return e
    }

    function s(e) {
        if (void 0 !== e) return null === e ? null : {
            attributes: e.attributes,
            from_name_ls: e.fromNameLs,
            label_id: e.labelId,
            omit_alignment: e.omitAlignment,
            raw_ls: e.rawLs,
            target_id: e.targetId,
            target_type: e.targetType,
            type_ls: e.typeLs,
            values: e.values
        }
    }

    function u(e) {
        return e
    }

    function c(e) {
        var r;
        return null == (r = e) ? r : {
            selectStatus: r.selectStatus,
            reasons: r.reasons.map(u),
            indicator: (0, t.exists)(r, "indicator") ? r.indicator : void 0,
            engagedPlayersCount: (0, t.exists)(r, "engagedPlayersCount") ? r.engagedPlayersCount : void 0,
            engagedPlayersUpdatedAt: (0, t.exists)(r, "engagedPlayersUpdatedAt") ? null === r.engagedPlayersUpdatedAt ? null : new Date(r.engagedPlayersUpdatedAt) : void 0,
            thresholdTrigger: r.thresholdTrigger,
            thresholdReset: r.thresholdReset,
            gracePeriodDays: r.gracePeriodDays,
            publishedToGatedAudience: r.publishedToGatedAudience,
            reasonsMetadata: r.reasonsMetadata,
            underReview: (0, t.exists)(r, "underReview") ? r.underReview : void 0,
            ownerEveryoneTierWithoutSubscription: r.ownerEveryoneTierWithoutSubscription,
            activeAllowlists: (0, t.exists)(r, "activeAllowlists") ? null === r.activeAllowlists ? null : r.activeAllowlists.map(a) : void 0
        }
    }

    function d(e) {
        return e
    }

    function p(e) {
        return e
    }

    function v(e) {
        return e
    }

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            universeId: t.universeId,
            allowlistType: a(t.allowlistType),
            status: t.status,
            createdTime: new Date(t.createdTime),
            updatedTime: new Date(t.updatedTime)
        }
    }

    function h(e, t) {
        return null == e ? e : {
            universeId: e.universeId,
            records: e.records.map(b)
        }
    }

    function y(e, r) {
        return null == e ? e : {
            hasDeposit: e.hasDeposit,
            createdTime: (0, t.exists)(e, "createdTime") ? null === e.createdTime ? null : new Date(e.createdTime) : void 0
        }
    }
    var C = function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        return n(r, e), r.prototype.coreContentBatchGetUniversePublishEligibilityRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.coreContentBatchGetUniversePublishEligibilityRequest || void 0 === e.coreContentBatchGetUniversePublishEligibilityRequest) throw new t.RequiredError("coreContentBatchGetUniversePublishEligibilityRequest", "Required parameter requestParameters.coreContentBatchGetUniversePublishEligibilityRequest was null or undefined when calling coreContentBatchGetUniversePublishEligibility.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/batch",
                                schemaPath: "/v1/universe-eligibility/batch",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeIds: e.universeIds
                                    }
                                }(e.coreContentBatchGetUniversePublishEligibilityRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    universeEligibilities: (0, t.mapValues)(e.universeEligibilities, c)
                                }
                            })]
                    }
                })
            })
        }, r.prototype.coreContentBatchGetUniversePublishEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.coreContentBatchGetUniversePublishEligibilityRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.coreContentGetCreatorEligibilityRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling coreContentGetCreatorEligibility.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/creator-eligibility/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/creator-eligibility/{userId}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    creatorEligibility: e.creatorEligibility.map(d),
                                    creatorTier: v(e.creatorTier),
                                    ageBracket: e.ageBracket,
                                    warnings: e.warnings.map(p),
                                    warningMetadata: e.warningMetadata,
                                    allowlistTier: e.allowlistTier.map(v),
                                    everyoneTierWithoutSubscription: e.everyoneTierWithoutSubscription,
                                    countryCode: e.countryCode
                                }
                            })]
                    }
                })
            })
        }, r.prototype.coreContentGetCreatorEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.coreContentGetCreatorEligibilityRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.coreContentGetRealtimeSelectStatusForUniverseRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetRealtimeSelectStatusForUniverse.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/{universeId}/realtime-select-status".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universe-eligibility/{universeId}/realtime-select-status",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    selectStatus: e.selectStatus,
                                    reasons: e.reasons.map(u)
                                }
                            })]
                    }
                })
            })
        }, r.prototype.coreContentGetRealtimeSelectStatusForUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.coreContentGetRealtimeSelectStatusForUniverseRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.coreContentGetUniverseCreatorEligibilityRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetUniverseCreatorEligibility.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/{universeId}/creator-eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universe-eligibility/{universeId}/creator-eligibility",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    creatorTier: v(e.creatorTier)
                                }
                            })]
                    }
                })
            })
        }, r.prototype.coreContentGetUniverseCreatorEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.coreContentGetUniverseCreatorEligibilityRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.coreContentNotifyUniversePublicPublishRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.coreContentNotifyUniversePublicPublishRequest || void 0 === e.coreContentNotifyUniversePublicPublishRequest) throw new t.RequiredError("coreContentNotifyUniversePublicPublishRequest", "Required parameter requestParameters.coreContentNotifyUniversePublicPublishRequest was null or undefined when calling coreContentNotifyUniversePublicPublish.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/notify-public-publish",
                                schemaPath: "/v1/universe-eligibility/notify-public-publish",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.coreContentNotifyUniversePublicPublishRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.VoidApiResponse(a)]
                    }
                })
            })
        }, r.prototype.coreContentNotifyUniversePublicPublish = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.coreContentNotifyUniversePublicPublishRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, r
    }(t.BaseAPI);
    (function(e) {
        function r() {
            return null !== e && e.apply(this, arguments) || this
        }
        n(r, e), r.prototype.internalCoreContentEnqueueSafetyCheckRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.internalCoreContentEnqueueSafetyCheckRequest || void 0 === e.internalCoreContentEnqueueSafetyCheckRequest) throw new t.RequiredError("internalCoreContentEnqueueSafetyCheckRequest", "Required parameter requestParameters.internalCoreContentEnqueueSafetyCheckRequest was null or undefined when calling internalCoreContentEnqueueSafetyCheck.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/safety-check/enqueue",
                                schemaPath: "/v1/internal/safety-check/enqueue",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        sfcType: e.sfcType
                                    }
                                }(e.internalCoreContentEnqueueSafetyCheckRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.VoidApiResponse(a)]
                    }
                })
            })
        }, r.prototype.internalCoreContentEnqueueSafetyCheck = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentEnqueueSafetyCheckRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, r.prototype.internalCoreContentGetUniverseAllowlistRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentGetUniverseAllowlist.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-allowlist/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/universe-allowlist/{universeId}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, r.prototype.internalCoreContentGetUniverseAllowlist = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentGetUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.internalCoreContentHandleUniverseAllowlistDecisionWebhookRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return n = {}, (i = {})["Content-Type"] = "application/json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/moderation/universe-allowlist/decision",
                                schemaPath: "/v1/internal/moderation/universe-allowlist/decision",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        annotations: void 0 === e.annotations ? void 0 : null === e.annotations ? null : e.annotations.map(s),
                                        appeal: e.appeal,
                                        associated_entity: e.associatedEntity,
                                        category: e.category,
                                        content: function(e) {
                                            if (void 0 !== e) return null === e ? null : {
                                                content_type: e.contentType,
                                                custom: e.custom,
                                                id: e.id,
                                                locale: e.locale,
                                                media_type: e.mediaType,
                                                type: e.type,
                                                update_time: void 0 === e.updateTime ? void 0 : null === e.updateTime ? null : e.updateTime.toISOString(),
                                                user_id: e.userId
                                            }
                                        }(e.content),
                                        correlation_id: e.correlationId,
                                        custom: e.custom,
                                        decider_id: e.deciderId,
                                        decider_type: e.deciderType,
                                        decision_event_id: e.decisionEventId,
                                        decision_id: e.decisionId,
                                        idempotency_key: e.idempotencyKey,
                                        labels: e.labels,
                                        media: e.media,
                                        raw_ls: e.rawLs,
                                        reasons: e.reasons,
                                        report: e.report,
                                        run_id: e.runId,
                                        team: e.team,
                                        ticket_id: e.ticketId,
                                        ticket_priority: e.ticketPriority,
                                        universe: e.universe,
                                        user: e.user
                                    }
                                }(e.internalCoreContentHandleUniverseAllowlistDecisionWebhookRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, r.prototype.internalCoreContentHandleUniverseAllowlistDecisionWebhook = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentHandleUniverseAllowlistDecisionWebhookRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.internalCoreContentInvestigateUniverseRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, l;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentInvestigateUniverse.");
                            return n = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/investigation/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/investigation/{universeId}",
                                method: "GET",
                                headers: i,
                                query: n
                            }, r)];
                        case 1:
                            return l = o.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                var r, n, i;
                                return null == e ? e : {
                                    universeEligibility: null == (r = e.universeEligibility) ? r : {
                                        selectStatus: r.selectStatus,
                                        reasons: r.reasons.map(u),
                                        indicator: (0, t.exists)(r, "indicator") ? r.indicator : void 0,
                                        engagedPlayersCount: (0, t.exists)(r, "engagedPlayersCount") ? r.engagedPlayersCount : void 0,
                                        engagedPlayersUpdatedAt: (0, t.exists)(r, "engagedPlayersUpdatedAt") ? null === r.engagedPlayersUpdatedAt ? null : new Date(r.engagedPlayersUpdatedAt) : void 0,
                                        thresholdTrigger: r.thresholdTrigger,
                                        thresholdReset: r.thresholdReset,
                                        gracePeriodDays: r.gracePeriodDays,
                                        publishedToGatedAudience: r.publishedToGatedAudience,
                                        reasonsMetadata: r.reasonsMetadata,
                                        underReview: (0, t.exists)(r, "underReview") ? r.underReview : void 0,
                                        ownerEveryoneTierWithoutSubscription: r.ownerEveryoneTierWithoutSubscription,
                                        activeAllowlists: (0, t.exists)(r, "activeAllowlists") ? null === r.activeAllowlists ? null : r.activeAllowlists.map(a) : void 0
                                    },
                                    creatorEligibility: null == (n = e.creatorEligibility) ? n : {
                                        creatorEligibility: n.creatorEligibility.map(d),
                                        creatorTier: v(n.creatorTier),
                                        ageBracket: n.ageBracket,
                                        warnings: n.warnings.map(p),
                                        warningMetadata: n.warningMetadata,
                                        allowlistTier: n.allowlistTier.map(v),
                                        everyoneTierWithoutSubscription: n.everyoneTierWithoutSubscription,
                                        countryCode: n.countryCode
                                    },
                                    effectiveCreatorTier: v(e.effectiveCreatorTier),
                                    contentCatalog: null == (i = e.contentCatalog) ? i : {
                                        hasQppEligibility: (0, t.exists)(i, "hasQppEligibility") ? i.hasQppEligibility : void 0,
                                        creatorPublishEligibility: (0, t.exists)(i, "creatorPublishEligibility") ? i.creatorPublishEligibility : void 0
                                    },
                                    publishFee: y(e.publishFee),
                                    expeditedFee: y(e.expeditedFee),
                                    temporaryExpeditedFeeBypassStatus: (0, t.exists)(e, "temporaryExpeditedFeeBypassStatus") ? e.temporaryExpeditedFeeBypassStatus : void 0
                                }
                            })]
                    }
                })
            })
        }, r.prototype.internalCoreContentInvestigateUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentInvestigateUniverseRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.internalCoreContentListAllowlistsRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.internalCoreContentListAllowlistsRequest || void 0 === e.internalCoreContentListAllowlistsRequest) throw new t.RequiredError("internalCoreContentListAllowlistsRequest", "Required parameter requestParameters.internalCoreContentListAllowlistsRequest was null or undefined when calling internalCoreContentListAllowlists.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-allowlist/list",
                                schemaPath: "/v1/internal/universe-allowlist/list",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        allowlistType: e.allowlistType,
                                        status: e.status,
                                        exclusiveStartTimeUtcMs: e.exclusiveStartTimeUtcMs,
                                        inclusiveEndTimeUtcMs: e.inclusiveEndTimeUtcMs,
                                        limit: e.limit,
                                        cursor: e.cursor
                                    }
                                }(e.internalCoreContentListAllowlistsRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    records: e.records.map(b),
                                    nextCursor: (0, t.exists)(e, "nextCursor") ? e.nextCursor : void 0,
                                    hasMore: e.hasMore
                                }
                            })]
                    }
                })
            })
        }, r.prototype.internalCoreContentListAllowlists = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentListAllowlistsRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.internalCoreContentPromoteUniverseCreatorPublishEligibilityRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest || void 0 === e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest) throw new t.RequiredError("internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest", "Required parameter requestParameters.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest was null or undefined when calling internalCoreContentPromoteUniverseCreatorPublishEligibility.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-eligibility/promote-creator-publish-eligibility",
                                schemaPath: "/v1/internal/universe-eligibility/promote-creator-publish-eligibility",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.VoidApiResponse(a)]
                    }
                })
            })
        }, r.prototype.internalCoreContentPromoteUniverseCreatorPublishEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentPromoteUniverseCreatorPublishEligibilityRaw(e, t)];
                        case 1:
                            return r.sent(), [2]
                    }
                })
            })
        }, r.prototype.internalCoreContentRevokeUniverseAllowlistRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentRevokeUniverseAllowlist.");
                            if (null === e.internalCoreContentRevokeUniverseAllowlistRequest || void 0 === e.internalCoreContentRevokeUniverseAllowlistRequest) throw new t.RequiredError("internalCoreContentRevokeUniverseAllowlistRequest", "Required parameter requestParameters.internalCoreContentRevokeUniverseAllowlistRequest was null or undefined when calling internalCoreContentRevokeUniverseAllowlist.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-allowlist/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/universe-allowlist/{universeId}",
                                method: "PATCH",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        allowlistTypes: e.allowlistTypes.map(l)
                                    }
                                }(e.internalCoreContentRevokeUniverseAllowlistRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, r.prototype.internalCoreContentRevokeUniverseAllowlist = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentRevokeUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }, r.prototype.internalCoreContentUpsertUniverseAllowlistRaw = function(e, r) {
            return i(this, void 0, void 0, function() {
                var n, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.internalCoreContentUpsertUniverseAllowlistRequest || void 0 === e.internalCoreContentUpsertUniverseAllowlistRequest) throw new t.RequiredError("internalCoreContentUpsertUniverseAllowlistRequest", "Required parameter requestParameters.internalCoreContentUpsertUniverseAllowlistRequest was null or undefined when calling internalCoreContentUpsertUniverseAllowlist.");
                            return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-allowlist",
                                schemaPath: "/v1/internal/universe-allowlist",
                                method: "POST",
                                headers: i,
                                query: n,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        allowlistTypes: e.allowlistTypes.map(l)
                                    }
                                }(e.internalCoreContentUpsertUniverseAllowlistRequest)
                            }, r)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return h(e)
                            })]
                    }
                })
            })
        }, r.prototype.internalCoreContentUpsertUniverseAllowlist = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(r) {
                    switch (r.label) {
                        case 0:
                            return [4, this.internalCoreContentUpsertUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, r.sent().value()];
                        case 2:
                            return [2, r.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AgeBracketEnum", 0, {
        Unknown: "Unknown",
        Under13: "Under13",
        Between13And18: "Between13And18",
        Over18: "Over18"
    }, "AllowlistTypeEnum", 0, {
        UniverseBypass: "UniverseBypass",
        TemporaryExpeditedFeeBypass: "TemporaryExpeditedFeeBypass"
    }, "CoreContentApi", 0, C, "CreatorEligibilityEnum", 0, {
        AgeEstimationVerified: "AgeEstimationVerified",
        IdVerified: "IdVerified",
        HasRobloxPremium: "HasRobloxPremium",
        Has2SvEnabled: "Has2SVEnabled",
        ModerationStatusOk: "ModerationStatusOk",
        HasActiveSubscription: "HasActiveSubscription",
        PhoneVerified: "phoneVerified"
    }, "CreatorEligibilityWarningEnum", 0, {
        ParentLinkExpiration: "parentLinkExpiration",
        PlusExpiration: "plusExpiration"
    }, "CreatorTierEnum", 0, {
        Blocked: "Blocked",
        Private: "Private",
        Trusted: "Trusted",
        Everyone: "Everyone"
    }, "ReasonEnum", 0, {
        Threshold: "Threshold",
        CreatorEligibility: "CreatorEligibility",
        Audience: "Audience"
    }, "SelectStatusEnum", 0, {
        Eligible: "Eligible",
        NotEligible: "NotEligible",
        NotApplicable: "NotApplicable"
    }])
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        r = e.i(416340),
        n = e.i(323356);
    e.i(221628), e.i(149285);
    var i = (0, r.createContext)({
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
        var o, a, l, s, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, r.useRef)(null),
            p = (0, r.useState)(!1),
            v = p[0],
            b = p[1],
            h = (0, r.useState)([]),
            y = h[0],
            C = h[1],
            g = (0, r.useCallback)(function(e, r) {
                void 0 === e && (e = {}), void 0 === r && (r = function() {
                    return !0
                }), C(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: r
                    }], !1)
                })
            }, [C]),
            f = (0, r.useCallback)(function() {
                b(!1)
            }, [b]);
        (0, r.useEffect)(function() {
            y.length > 0 && b(!0)
        }, [y.length]);
        var w = (0, r.useMemo)(function() {
            return {
                ref: d,
                enqueue: g,
                close: f
            }
        }, [f, g]);
        return r.default.createElement(r.default.Fragment, null, r.default.createElement(i.Provider, {
            value: w
        }, u), r.default.createElement(n.S, (0, t._)({}, (null == (o = y[0]) ? void 0 : o.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (l = null == (a = y[0]) ? void 0 : a.props) ? void 0 : l.TransitionProps) || {}), {
                onExited: function(e) {
                    var r, n, i, o;
                    C(function(e) {
                        var r = e.slice(1);
                        return (0, t.b)([], r, !0)
                    }), (null == (n = null == (r = y[0]) ? void 0 : r.props.TransitionProps) ? void 0 : n.onExited) && (null == (o = null == (i = y[0]) ? void 0 : i.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var r, n, i;
                (null == (r = y[0]) ? void 0 : r.shouldClose(t)) && b(!1), (null == (n = y[0]) ? void 0 : n.props.onClose) && (null == (i = y[0]) || i.props.onClose(e, t))
            },
            open: v
        }), null == (s = y[0]) ? void 0 : s.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, r.useContext)(i);
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
        n = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var a;
        let {
            children: l,
            unifiedLogger: s,
            pageLoggerConfig: u,
            path: c
        } = e, d = null != (a = null == u ? void 0 : u.tags) ? a : n, p = null == u ? void 0 : u.rosId, v = (0, t.useMemo)(() => ({
            tags: d,
            rosId: p,
            path: c
        }), [d, p, c]), b = (0, t.useRef)(v), h = (0, t.useRef)(v);
        (0, t.useLayoutEffect)(() => {
            h.current = v, void 0 === b.current.path && void 0 !== v.path && (b.current = {
                ...b.current,
                path: v.path
            })
        }, [v]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let r, n = (r = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== r && o.has(r)) ? b.current : h.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return i.forEach(t => {
                s.events.on(t, e)
            }), () => {
                i.forEach(t => {
                    s.events.off(t, e)
                })
            }
        }, [s]);
        let y = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: v
        }), [s, v]);
        return t.default.createElement(r.Provider, {
            value: y
        }, l)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(r);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=4bb34187-8761-efcb-1c7c-7167d187f38c
//# sourceMappingURL=1in1nqaqbqxfd.js.map