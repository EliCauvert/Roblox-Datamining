;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "38e8eca8-2000-e439-1ef0-f898d97cf3fa")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 605050, e => {
    "use strict";
    var t = e.i(513997);
    let n = (0, e.i(272593).createClientConfiguration)("core-content", "bedev2"),
        r = new t.CoreContentApi(n);
    e.s(["default", 0, r])
}, 29929, e => {
    "use strict";
    let t;
    var n, r, i, o, a, l, s, u, c, d, p, b, v, h, y, C, f, g, w, m = e.i(650502),
        E = e.i(864392),
        P = ((n = {}).ShowVrDeviceOption = "showVrDeviceOption", n.ShowIXPClientTest = "showIXPClientTest", n.ShowMemoryStoresDashboard = "showMemoryStoresDashboard", n.ShowAdvancedSettingsPage = "showAdvancedSettingsPage", n.EnableIA = "enableIA", n.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", n.EnableDevexEarnedRobux = "enableDevexEarnedRobux", n.EnableExperienceGenre = "enableExperienceGenre", n.EnablePlayerFeedbackTranslationsWeb = "EnablePlayerFeedbackTranslationsWeb", n.EnablePlayerFeedbackTranslationRetries = "EnablePlayerFeedbackTranslationRetries", n.EnablePlayerFeedbackDetailedFilter = "enablePlayerFeedbackDetailedFilter", n.EnableEventRequestFeaturing = "enableEventRequestFeaturing", n.EnableCollaboratorsPageV2 = "enableCollaboratorsPageV2", n),
        R = ((r = {}).EnableRightsManager = "enableRightsManager", r.EnableBulkFiling = "enableBulkFiling", r.EnableOnDemandSearch = "enableOnDemandSearch", r.EnableEditRegistration = "enableEditRegistration", r.EnableImageSearch = "enableImageSearch", r.EnableClaimsAgainstMe = "enableClaimsAgainstMe", r.EnableGenAiOptOut = "enableGenAiOptOut", r.EnableInExperienceIpReporting = "enableInExperienceIpReporting", r.EnableIpContentSearch = "enableIpContentSearch", r.EnableTrademark = "enableTrademark", r),
        S = ((i = {}).EnableIPRecommender = "enableIPRecommender", i),
        A = ((o = A || {}).EnableVideoOnboarding = "enableVideoOnboarding", o),
        I = ((a = I || {}).EnableSignalLookup = "enableSignalLookup", a.AlwaysShow = "alwaysShow", a),
        U = U || {},
        q = ((l = q || {}).mobileVariant = "mobileVariant", l),
        T = T || {},
        x = ((s = {}).ShowEditInStudioButton = "showEditInStudioButton", s.EnableCreationsNavLayout = "enableCreationsIPNavLayout", s),
        k = ((u = {}).EnablePublishingConsolidation = "enablePublishingConsolidation", u),
        H = ((c = {}).EnableAudienceReachOnOverview = "enableAudienceReachOnOverviewPage", c.EnableAudienceReachGrowthOpportunitiesBanner = "enableAudienceReachGrowthOpportunitiesBanner", c.EnableAudienceControls = "enableAudienceControls", c.EnableNewBadgePattern = "enableNewBadgePattern", c.EnableAtRiskAnnotationOnExperiences = "enableAtRiskAnnotationOnExperiences", c.EnableAudiencesReplacement = "enableAudiencesReplacement", c),
        O = ((d = {}).EnableTalentHubV2 = "enableTalentHubV2", d.EnableTalentHubV2M2 = "enableTalentHubV2M2", d),
        G = ((p = {}).StarterPlaceTemplateId = "starterPlaceTemplateId", p),
        K = ((b = K || {}).EnableExperienceWebhooks = "enableExperienceWebhooks", b),
        N = ((v = N || {}).EnableExperienceDataTileV2 = "enableExperienceDataTileV2", v),
        D = ((h = D || {}).EnableChangelogCMS = "enableChangelogCMS", h),
        L = ((y = {}).CreatorDashboard = "CreatorDashboard", y.CreatorHubHomePage = "CreatorHub.HomePage.UserId", y.CreatorHubHomePageExperienceTile = "CreatorHub.HomePage.ExperienceTile.UserId", y.CreatorHubHomePageOpportunitiesSection = "CreatorHub.HomePage.OpportunitiesSection.UserId", y.CreatorHubLandingPage = "CreatorHub.LandingPage", y.CreatorHubLandingPageUserId = "CreatorHub.LandingPage.UserId", y.CreatorHubNavigation = "CreatorHub.Navigation", y.CreatorHubNavigationUser = "CreatorHub.Navigation.User", y.CreatorHubPublishing = "CreatorHub.Publishing.UserId", y.LicenseManager = "CreatorDashboard.LicenseManager", y.RightsManager = "CreatorDashboard.RightsManager", y.StarterPlaceCreation = "CRK.StarterPlace.StarterPlaceCreation", y.CreatorSuccessOrganizations = "CreatorSuccess.OrganizationsV2", y.CreatorHubDocumentation = "CreatorHub.CreatorDocumentation.UserId", y.CreatorHubDocumentationSearch = "CreatorHub.CreatorDocumentation.Search.UserId", y.CreatorHubCreationsPermission = "CreatorHub.Creations.Permission", y.CreatorHubExperienceWebhooks = "CreatorHub.ExperienceWebhooks.UserId", y.CreatorHubChangelog = "CreatorHub.Changelog", y.TalentHub = "CreatorHub.TalentHub.UserId", y),
        V = ((C = V || {}).ShowMemoryStoresDashboard = "showMemoryStoresDashboard", C.EnableSubscriptionActivationTest = "enableSubscriptionActivationTest", C.ShowSecrets = "showSecrets", C.ShowQualitySignalCards = "showQualitySignalCards", C);
    let M = {
        CreatorDashboard: P,
        "CreatorHub.HomePage.UserId": A,
        "CreatorHub.HomePage.OpportunitiesSection.UserId": I,
        "CreatorHub.LandingPage": U,
        "CreatorHub.LandingPage.UserId": q,
        "CreatorHub.Navigation": T,
        "CreatorHub.Navigation.User": x,
        "CreatorHub.Publishing.UserId": k,
        "CreatorDashboard.LicenseManager": S,
        "CreatorDashboard.RightsManager": R,
        "CRK.StarterPlace.StarterPlaceCreation": G,
        "CreatorSuccess.OrganizationsV2": {},
        "CreatorHub.CreatorDocumentation.UserId": ((f = {}).EnableCourses = "enableCourses", f),
        "CreatorHub.CreatorDocumentation.Search.UserId": ((g = {}).SearchVersion = "searchVersion", g),
        "CreatorHub.Creations.Permission": H,
        "CreatorHub.ExperienceWebhooks.UserId": K,
        "CreatorHub.HomePage.ExperienceTile.UserId": N,
        "CreatorHub.Changelog": D,
        "CreatorHub.TalentHub.UserId": O
    };
    async function _(e) {
        let t = (0, m.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            n = Object.values(M[e]).join(","),
            r = "".concat(t, "/v1/projects/1/layers/").concat(e, "/values?parameters=").concat(n);
        return (await fetch(r, {
            credentials: "include"
        })).json()
    }
    let B = (0, E.default)(_);
    w = async function(e, t) {
        let n = (0, m.getBEDEV2ServiceBasePath)("product-experimentation-platform"),
            r = await fetch("".concat(n, "/v1/projects/1/values"), {
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
    }, t = [], e.s(["CreatorHubCreationsPermissionParameters", () => H, "CreatorHubPublishingParameters", () => k, "IXPLayers", () => L, "LicenseManagerParameters", () => S, "TalentHubParameters", () => O, "fetchIXPParametersForCurrentUser", 0, B], 29929)
}, 864392, e => {
    "use strict";
    e.s(["default", 0, function(e) {
        let t = new Map;
        return n => {
            if (t.has(n)) return t.get(n);
            let r = e(n);
            return t.set(n, r), r
        }
    }])
}, 198528, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(237401);
    e.s(["default", 0, (e, r) => {
        let i = (0, n.useRouter)();
        return [(0, t.useMemo)(() => {
            let t = {};
            for (let n of e) t[n] = i.query[n];
            return t
        }, [e, i.query]), (0, t.useCallback)(function(t) {
            var n;
            let o = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {
                    skipHistory: !1
                },
                a = {
                    ...i.query
                };
            e.forEach(e => {
                if (!Object.hasOwn(t, e)) return;
                let n = t[e];
                null == n ? delete a[e] : Array.isArray(n) ? a[e] = n.map(e => e.toString()) : a[e] = n.toString()
            }), n = i.query, Array.from(new Set([...Object.keys(n), ...Object.keys(a)])).every(e => ((e, t) => {
                if (null == e && null == t) return !0;
                if (null == e || null == t) return !1;
                let n = Array.isArray(e) ? e : [e],
                    r = Array.isArray(t) ? t : [t];
                return n.length === r.length && n.every((e, t) => e === r[t])
            })(n[e], a[e])) || (o.skipHistory ? i.replace({
                pathname: i.pathname,
                query: a
            }) : i.push({
                pathname: i.pathname,
                query: a
            }, void 0, r))
        }, [i, e, r])]
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
        let n = Object.entries(e).find(e => {
            let [, n] = e;
            return n === t
        });
        return n ? n[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        r = e.i(458451),
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
        p = (0, n.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: o
        } = e, {
            user: a
        } = (0, r.useRobloxAuthentication)(), {
            data: l,
            isLoading: s,
            refetch: u
        } = d(), [c, b] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == a ? void 0 : a.id), null), [v, h] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == a ? void 0 : a.id), null), [y, C] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == a ? void 0 : a.id), {}), f = (0, n.useCallback)(e => {
            h(e);
            let t = null === e ? "user" : e;
            C(e => {
                let n = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: r,
                        lastSelected: i
                    } = e[t];
                    "number" != typeof r || Number.isNaN(r) || "number" != typeof i || Number.isNaN(i) || (n.priority = r * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...e,
                    [t]: n
                }
            })
        }, [h, C]), g = (0, n.useMemo)(() => {
            if (null == l ? void 0 : l.groups) return null == l ? void 0 : l.groups;
            if (null === c) return [];
            try {
                return "string" == typeof c ? JSON.parse(c) : c
            } catch (e) {
                return []
            }
        }, [c, null == l ? void 0 : l.groups]), w = (0, n.useMemo)(() => {
            var e;
            return v && null != (e = g.find(e => {
                let {
                    id: t
                } = e;
                return t === v
            })) ? e : null
        }, [v, g]);
        (0, n.useEffect)(() => {
            (null == a ? void 0 : a.id) && (null == l ? void 0 : l.groups) && !s && b(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, g, s, b, null == a ? void 0 : a.id]);
        let m = (0, n.useMemo)(() => ({
            groups: g,
            currentGroup: w,
            groupData: y,
            isFetched: !s && !!(null == a ? void 0 : a.id),
            refreshGroups: u,
            setCurrentGroup: f
        }), [w, y, g, s, u, f, null == a ? void 0 : a.id]);
        return (0, t.jsx)(p.Provider, {
            value: m,
            children: o
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, n.useContext)(p);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, n.useContext)(p);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 513997, e => {
    "use strict";
    var t = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function r(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function r() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (r.prototype = t.prototype, new r)
    }

    function i(e, t, n, r) {
        return new(n || (n = Promise))(function(i, o) {
            function a(e) {
                try {
                    s(r.next(e))
                } catch (e) {
                    o(e)
                }
            }

            function l(e) {
                try {
                    s(r.throw(e))
                } catch (e) {
                    o(e)
                }
            }

            function s(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(a, l)
            }
            s((r = r.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var n, r, i, o = {
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
                if (n) throw TypeError("Generator is already executing.");
                for (; a && (a = 0, u[0] && (o = 0)), o;) try {
                    if (n = 1, r && (i = 2 & u[0] ? r.return : u[0] ? r.throw || ((i = r.return) && i.call(r), 0) : r.next) && !(i = i.call(r, u[1])).done) return i;
                    switch (r = 0, i && (u = [2 & u[0], i.value]), u[0]) {
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
                            o.label++, r = u[1], u = [0];
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
                    u = [6, e], r = 0
                } finally {
                    n = i = 0
                }
                if (5 & u[0]) throw u[1];
                return {
                    value: u[0] ? u[1] : void 0,
                    done: !0
                }
            }
        }
    }

    function a(e) {
        return e
    }

    function l(e) {
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

    function s(e) {
        return e
    }
    "function" == typeof SuppressedError && SuppressedError;

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            selectStatus: n.selectStatus,
            reasons: n.reasons.map(s),
            indicator: (0, t.exists)(n, "indicator") ? n.indicator : void 0,
            engagedPlayersCount: (0, t.exists)(n, "engagedPlayersCount") ? n.engagedPlayersCount : void 0,
            engagedPlayersUpdatedAt: (0, t.exists)(n, "engagedPlayersUpdatedAt") ? null === n.engagedPlayersUpdatedAt ? null : new Date(n.engagedPlayersUpdatedAt) : void 0,
            thresholdTrigger: n.thresholdTrigger,
            thresholdReset: n.thresholdReset,
            publishedToGatedAudience: n.publishedToGatedAudience,
            reasonsMetadata: n.reasonsMetadata,
            underReview: (0, t.exists)(n, "underReview") ? n.underReview : void 0,
            ownerEveryoneTierWithoutSubscription: n.ownerEveryoneTierWithoutSubscription
        }
    }

    function c(e) {
        return e
    }

    function d(e) {
        return e
    }

    function p(e) {
        return e
    }

    function b(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            universeId: t.universeId,
            allowlistType: t.allowlistType,
            status: t.status,
            createdTime: new Date(t.createdTime),
            updatedTime: new Date(t.updatedTime)
        }
    }

    function v(e, t) {
        return null == e ? e : {
            universeId: e.universeId,
            records: e.records.map(b)
        }
    }
    var h = function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        return r(n, e), n.prototype.coreContentBatchGetUniversePublishEligibilityRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.coreContentBatchGetUniversePublishEligibilityRequest || void 0 === e.coreContentBatchGetUniversePublishEligibilityRequest) throw new t.RequiredError("coreContentBatchGetUniversePublishEligibilityRequest", "Required parameter requestParameters.coreContentBatchGetUniversePublishEligibilityRequest was null or undefined when calling coreContentBatchGetUniversePublishEligibility.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/batch",
                                schemaPath: "/v1/universe-eligibility/batch",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeIds: e.universeIds
                                    }
                                }(e.coreContentBatchGetUniversePublishEligibilityRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    universeEligibilities: (0, t.mapValues)(e.universeEligibilities, u)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentBatchGetUniversePublishEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentBatchGetUniversePublishEligibilityRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetCreatorEligibilityRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling coreContentGetCreatorEligibility.");
                            return r = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/creator-eligibility/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                schemaPath: "/v1/creator-eligibility/{userId}",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    creatorEligibility: e.creatorEligibility.map(c),
                                    creatorTier: p(e.creatorTier),
                                    ageBracket: e.ageBracket,
                                    warnings: e.warnings.map(d),
                                    warningMetadata: e.warningMetadata,
                                    allowlistTier: e.allowlistTier.map(p),
                                    everyoneTierWithoutSubscription: e.everyoneTierWithoutSubscription,
                                    countryCode: e.countryCode
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetCreatorEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetCreatorEligibilityRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetRealtimeSelectStatusForUniverseRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetRealtimeSelectStatusForUniverse.");
                            return r = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/{universeId}/realtime-select-status".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universe-eligibility/{universeId}/realtime-select-status",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    selectStatus: e.selectStatus,
                                    reasons: e.reasons.map(s)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetRealtimeSelectStatusForUniverse = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetRealtimeSelectStatusForUniverseRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseCreatorEligibilityRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling coreContentGetUniverseCreatorEligibility.");
                            return r = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/{universeId}/creator-eligibility".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/universe-eligibility/{universeId}/creator-eligibility",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return null == e ? e : {
                                    creatorTier: p(e.creatorTier)
                                }
                            })]
                    }
                })
            })
        }, n.prototype.coreContentGetUniverseCreatorEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentGetUniverseCreatorEligibilityRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.coreContentNotifyUniversePublicPublishRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.coreContentNotifyUniversePublicPublishRequest || void 0 === e.coreContentNotifyUniversePublicPublishRequest) throw new t.RequiredError("coreContentNotifyUniversePublicPublishRequest", "Required parameter requestParameters.coreContentNotifyUniversePublicPublishRequest was null or undefined when calling coreContentNotifyUniversePublicPublish.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/universe-eligibility/notify-public-publish",
                                schemaPath: "/v1/universe-eligibility/notify-public-publish",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.coreContentNotifyUniversePublicPublishRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.coreContentNotifyUniversePublicPublish = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.coreContentNotifyUniversePublicPublishRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n
    }(t.BaseAPI);
    (function(e) {
        function n() {
            return null !== e && e.apply(this, arguments) || this
        }
        r(n, e), n.prototype.internalCoreContentEnqueueSafetyCheckRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.internalCoreContentEnqueueSafetyCheckRequest || void 0 === e.internalCoreContentEnqueueSafetyCheckRequest) throw new t.RequiredError("internalCoreContentEnqueueSafetyCheckRequest", "Required parameter requestParameters.internalCoreContentEnqueueSafetyCheckRequest was null or undefined when calling internalCoreContentEnqueueSafetyCheck.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/safety-check/enqueue",
                                schemaPath: "/v1/internal/safety-check/enqueue",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        sfcType: e.sfcType
                                    }
                                }(e.internalCoreContentEnqueueSafetyCheckRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.internalCoreContentEnqueueSafetyCheck = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentEnqueueSafetyCheckRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.internalCoreContentGetUniverseAllowlistRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentGetUniverseAllowlist.");
                            return r = {}, i = {}, void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-allowlist/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/universe-allowlist/{universeId}",
                                method: "GET",
                                headers: i,
                                query: r
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentGetUniverseAllowlist = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentGetUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentHandleUniverseAllowlistDecisionWebhookRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            return r = {}, (i = {})["Content-Type"] = "application/json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/moderation/universe-allowlist/decision",
                                schemaPath: "/v1/internal/moderation/universe-allowlist/decision",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        annotations: void 0 === e.annotations ? void 0 : null === e.annotations ? null : e.annotations.map(l),
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
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.JSONApiResponse(a, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentHandleUniverseAllowlistDecisionWebhook = function() {
            return i(this, arguments, void 0, function(e, t) {
                return void 0 === e && (e = {}), o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentHandleUniverseAllowlistDecisionWebhookRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentPromoteUniverseCreatorPublishEligibilityRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, a;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest || void 0 === e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest) throw new t.RequiredError("internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest", "Required parameter requestParameters.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest was null or undefined when calling internalCoreContentPromoteUniverseCreatorPublishEligibility.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-eligibility/promote-creator-publish-eligibility",
                                schemaPath: "/v1/internal/universe-eligibility/promote-creator-publish-eligibility",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId
                                    }
                                }(e.internalCoreContentPromoteUniverseCreatorPublishEligibilityRequest)
                            }, n)];
                        case 1:
                            return a = o.sent(), [2, new t.VoidApiResponse(a)]
                    }
                })
            })
        }, n.prototype.internalCoreContentPromoteUniverseCreatorPublishEligibility = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentPromoteUniverseCreatorPublishEligibilityRaw(e, t)];
                        case 1:
                            return n.sent(), [2]
                    }
                })
            })
        }, n.prototype.internalCoreContentRevokeUniverseAllowlistRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, l;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.universeId || void 0 === e.universeId) throw new t.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling internalCoreContentRevokeUniverseAllowlist.");
                            if (null === e.internalCoreContentRevokeUniverseAllowlistRequest || void 0 === e.internalCoreContentRevokeUniverseAllowlistRequest) throw new t.RequiredError("internalCoreContentRevokeUniverseAllowlistRequest", "Required parameter requestParameters.internalCoreContentRevokeUniverseAllowlistRequest was null or undefined when calling internalCoreContentRevokeUniverseAllowlist.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-allowlist/{universeId}".replace("{".concat("universeId", "}"), encodeURIComponent(String(e.universeId))),
                                schemaPath: "/v1/internal/universe-allowlist/{universeId}",
                                method: "PATCH",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        allowlistTypes: e.allowlistTypes.map(a)
                                    }
                                }(e.internalCoreContentRevokeUniverseAllowlistRequest)
                            }, n)];
                        case 1:
                            return l = o.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentRevokeUniverseAllowlist = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentRevokeUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }, n.prototype.internalCoreContentUpsertUniverseAllowlistRaw = function(e, n) {
            return i(this, void 0, void 0, function() {
                var r, i, l;
                return o(this, function(o) {
                    switch (o.label) {
                        case 0:
                            if (null === e.internalCoreContentUpsertUniverseAllowlistRequest || void 0 === e.internalCoreContentUpsertUniverseAllowlistRequest) throw new t.RequiredError("internalCoreContentUpsertUniverseAllowlistRequest", "Required parameter requestParameters.internalCoreContentUpsertUniverseAllowlistRequest was null or undefined when calling internalCoreContentUpsertUniverseAllowlist.");
                            return r = {}, (i = {})["Content-Type"] = "application/json-patch+json", void 0 !== e.robloxApiKey && null !== e.robloxApiKey && (i["Roblox-Api-Key"] = String(e.robloxApiKey)), [4, this.request({
                                path: "/v1/internal/universe-allowlist",
                                schemaPath: "/v1/internal/universe-allowlist",
                                method: "POST",
                                headers: i,
                                query: r,
                                body: function(e) {
                                    if (void 0 !== e) return null === e ? null : {
                                        universeId: e.universeId,
                                        allowlistTypes: e.allowlistTypes.map(a)
                                    }
                                }(e.internalCoreContentUpsertUniverseAllowlistRequest)
                            }, n)];
                        case 1:
                            return l = o.sent(), [2, new t.JSONApiResponse(l, function(e) {
                                return v(e)
                            })]
                    }
                })
            })
        }, n.prototype.internalCoreContentUpsertUniverseAllowlist = function(e, t) {
            return i(this, void 0, void 0, function() {
                return o(this, function(n) {
                    switch (n.label) {
                        case 0:
                            return [4, this.internalCoreContentUpsertUniverseAllowlistRaw(e, t)];
                        case 1:
                            return [4, n.sent().value()];
                        case 2:
                            return [2, n.sent()]
                    }
                })
            })
        }
    })(t.BaseAPI), e.s(["AgeBracketEnum", 0, {
        Unknown: "Unknown",
        Under13: "Under13",
        Between13And18: "Between13And18",
        Over18: "Over18"
    }, "CoreContentApi", 0, h, "CreatorEligibilityEnum", 0, {
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
        n = e.i(416340),
        r = e.i(323356);
    e.i(221628), e.i(149285);
    var i = (0, n.createContext)({
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
            d = (0, n.useRef)(null),
            p = (0, n.useState)(!1),
            b = p[0],
            v = p[1],
            h = (0, n.useState)([]),
            y = h[0],
            C = h[1],
            f = (0, n.useCallback)(function(e, n) {
                void 0 === e && (e = {}), void 0 === n && (n = function() {
                    return !0
                }), C(function(r) {
                    return (0, t.b)((0, t.b)([], r, !0), [{
                        props: e,
                        shouldClose: n
                    }], !1)
                })
            }, [C]),
            g = (0, n.useCallback)(function() {
                v(!1)
            }, [v]);
        (0, n.useEffect)(function() {
            y.length > 0 && v(!0)
        }, [y.length]);
        var w = (0, n.useMemo)(function() {
            return {
                ref: d,
                enqueue: f,
                close: g
            }
        }, [g, f]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(i.Provider, {
            value: w
        }, u), n.default.createElement(r.S, (0, t._)({}, (null == (o = y[0]) ? void 0 : o.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (l = null == (a = y[0]) ? void 0 : a.props) ? void 0 : l.TransitionProps) || {}), {
                onExited: function(e) {
                    var n, r, i, o;
                    C(function(e) {
                        var n = e.slice(1);
                        return (0, t.b)([], n, !0)
                    }), (null == (r = null == (n = y[0]) ? void 0 : n.props.TransitionProps) ? void 0 : r.onExited) && (null == (o = null == (i = y[0]) ? void 0 : i.props.TransitionProps) || o.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var n, r, i;
                (null == (n = y[0]) ? void 0 : n.shouldClose(t)) && v(!1), (null == (r = y[0]) ? void 0 : r.props.onClose) && (null == (i = y[0]) || i.props.onClose(e, t))
            },
            open: b
        }), null == (s = y[0]) ? void 0 : s.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, n.useContext)(i);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let n = (0, t.createContext)(null),
        r = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        o = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var a;
        let {
            children: l,
            unifiedLogger: s,
            pageLoggerConfig: u,
            path: c
        } = e, d = null != (a = null == u ? void 0 : u.tags) ? a : r, p = null == u ? void 0 : u.rosId, b = (0, t.useMemo)(() => ({
            tags: d,
            rosId: p,
            path: c
        }), [d, p, c]), v = (0, t.useRef)(b), h = (0, t.useRef)(b);
        (0, t.useLayoutEffect)(() => {
            h.current = b, void 0 === v.current.path && void 0 !== b.path && (v.current = {
                ...v.current,
                path: b.path
            })
        }, [b]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let n, r = (n = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== n && o.has(n)) ? v.current : h.current;
                void 0 !== r.path && (e.parameters = {
                    ...e.parameters,
                    path: r.path
                }), r.tags.forEach(t => e.addTag(t)), void 0 !== r.rosId && e.addTag("owner: ".concat(r.rosId))
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
            pageContext: b
        }), [s, b]);
        return t.default.createElement(n.Provider, {
            value: y
        }, l)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(n);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=38e8eca8-2000-e439-1ef0-f898d97cf3fa
//# sourceMappingURL=1efqa07dmuxyv.js.map