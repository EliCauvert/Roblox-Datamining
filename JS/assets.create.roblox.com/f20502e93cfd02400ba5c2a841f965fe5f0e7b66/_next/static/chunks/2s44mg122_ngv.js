;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "ce7e7c59-987f-b71e-ea91-740549004890")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "freeAvatarModuleStorePageLink",
            defaultValue: "#"
        }),
        a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "freeAvatarModuleDocsPageLink",
            defaultValue: "#"
        }),
        i = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableUGCFolders",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        });
    e.s(["enableTaxonomyBasedCreatorDashboard", 0, r, "enableUgcFolders", 0, i, "freeAvatarModuleDocsPageLink", 0, a, "freeAvatarModuleStorePageLink", 0, n, "isAutoPublishPreferencesEnabled", 0, o])
}, 954119, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "communities",
            name: "CreatorAnalytics",
            defaultValue: !0
        }),
        a = (0, t.defineFlag)({
            namespace: "communities",
            name: "AnnouncementAnalytics",
            defaultValue: !0
        });
    e.s(["announcementAnalytics", 0, a, "creatorAnalytics", 0, n])
}, 134731, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetAccessRequestsEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isModelCustomThumbnailUploadEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetDependenciesViewerEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, a, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, n, "isCreatorStoreVideoMultipartUploadEnabled", 0, o, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, s])
}, 165136, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0
        }),
        a = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIpLicensingEarningsEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !1
        });
    e.s(["enableIpPlatformLicenseRecommendations", 0, a, "isExperiencePreviewEnabled", 0, n, "isIgnoreMatchEnabled", 0, s, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isIpLicensingEarningsEnabled", 0, i, "isShowcaseExperiencesEnabled", 0, o])
}, 428993, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "showDevExO18LandingPage",
            defaultValue: !0
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "showDevExO18LandingPageAnalyticsSection",
            defaultValue: !0
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "isDailyRevenueByBalanceTypeChartEnabled",
            defaultValue: !0
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0
        });
    e.s(["enableVirtualTransactionsTab", 0, o, "isDailyRevenueByBalanceTypeChartEnabled", 0, i, "isRevenueShareAgreementsEnabled", 0, r, "showDevExO18LandingPage", 0, n, "showDevExO18LandingPageAnalyticsSection", 0, a])
}, 9436, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsSitetestUrlParsingEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, n, "isMomentsFeedIdEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, a, "isMomentsUploadLanguageSelectEnabled", 0, r])
}, 360894, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "creator-roadmap",
        name: "creatorRoadmapEnabled",
        defaultValue: !1
    });
    e.s(["creatorRoadmapEnabled", 0, t])
}, 704211, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "creator-services-insights",
        name: "isCsmExtendedMetricsEnabled",
        defaultValue: !1
    });
    e.s(["isCsmExtendedMetricsEnabled", 0, t])
}, 477797, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockManagedPricingEvents",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockHardCodedPrices",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockManagedPricingProductWrites",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1
        });
    e.s(["isProductArchiveEnabled", 0, o, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, a, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, n])
}, 100022, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "payouts",
        name: "enablePayoutWatermarkContributions",
        defaultValue: !0
    });
    e.s(["enablePayoutWatermarkContributions", 0, t])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(458451),
        i = e.i(889311),
        r = e.i(823062),
        o = e.i(486736);
    let s = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        l = encodeURIComponent("studio/CollaborationSettings"),
        c = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                n = await fetch(e, {
                    credentials: "include"
                }),
                a = n.status % 100 * 100;
            if (!n.ok && 500 === a && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), c(e, t + 1);
            if (500 === a && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let i = await n.json();
            if (!("access" in i)) throw Error('"access" not found in response');
            return i.access
        }, u = async () => await c("".concat(s, "/v1/upsell-feature-access?nameSpace=").concat(l, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", d = "CreatorHub.AgeVerificationBannerSettings", p = async () => {
            localStorage.removeItem(d)
        }, m = async () => {
            let e, t = localStorage.getItem(d);
            if (!t) return !1;
            try {
                let {
                    dismissedAt: n
                } = (e => {
                    let t = JSON.parse(e);
                    if (!(null == t ? void 0 : t.dismissedAt)) throw Error("Dismissed date must be set");
                    let n = new Date(t.dismissedAt);
                    if (Number.isNaN(n.getTime())) throw TypeError("Dismissed date string is not a valid date string");
                    if (n.getTime() > Date.now()) throw Error("Dismissed date cannot be in the future");
                    return {
                        dismissedAt: n
                    }
                })(t);
                e = n
            } catch (e) {
                return p(), !1
            }
            let n = new Date;
            return e.getFullYear() === n.getFullYear() && e.getMonth() === n.getMonth() && e.getDate() === n.getDate()
        }, g = async () => {
            localStorage.setItem(d, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, f = (0, n.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), h = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, v = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: s
        } = e, {
            settings: {
                enableAgeVerificationUpsellBanner: l,
                ageVerificationUpsellBannerStartDate: c,
                ageVerificationUpsellBannerEndDate: u,
                ageVerificationUpsellBannerHighPriorityDate: d
            }
        } = (0, o.useSettings)(), [p, y] = (0, n.useState)(!0), [b, S] = (0, n.useState)("doNotShow"), {
            isFetched: C,
            user: A
        } = (0, a.useRobloxAuthentication)(), {
            unifiedLogger: w
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: I,
            isEnabled: E
        } = (0, n.useMemo)(() => {
            let e = h(c),
                t = h(u),
                n = h(d),
                a = new Date,
                i = l && e <= a && a < t;
            return {
                isHighPriority: n <= a,
                isEnabled: i
            }
        }, [l, u, c, d]), T = (0, n.useCallback)(async () => {
            await g(), y(!0)
        }, [y]);
        (0, n.useEffect)(() => {
            E && C && (null == A ? void 0 : A.id) && (async () => {
                let e = !1;
                try {
                    e = await m()
                } catch (e) {
                    w.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                y(e);
                let t = "doNotShow";
                try {
                    t = await v()
                } catch (e) {
                    w.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                S(t)
            })().catch(e => {
                w.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [E, C, A, w]);
        let P = (0, n.useMemo)(() => {
            let e = E && "doNotShow" !== b;
            return {
                isBannerVisible: e && !p,
                isBannerEligible: e,
                isHighPriority: I,
                variant: "doNotShow" !== b ? b : "ageVerification",
                dismissBanner: T
            }
        }, [E, b, p, I, T]);
        return (0, t.jsx)(f.Provider, {
            value: P,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, n.useContext)(f)], 906791)
}, 968439, e => {
    "use strict";
    var t, n = e.i(721281),
        a = e.i(703440),
        i = e.i(272593),
        r = ((t = {}).PrivacyPolicyUri = "privacyPolicyUri", t.TermsOfServiceUri = "termsOfServiceUri", t.Summary = "summary", t.Name = "name", t);
    let o = new class {
            createApplicationForUser(e) {
                return this.applicationApi.applicationCreateApplicationForUser(e)
            }
            createApplicationForGroup(e) {
                return this.applicationApi.applicationCreateApplicationForGroup(e)
            }
            getApplication(e) {
                return this.applicationApi.applicationGetApplication(e)
            }
            updateApplication(e) {
                return this.applicationApi.applicationUpdateApplication(e)
            }
            uploadApplicationImage(e) {
                return this.applicationApi.applicationUploadApplicationImage(e)
            }
            deleteApplication(e) {
                return this.applicationApi.applicationDeleteApplication(e)
            }
            listApplicationsForUser(e) {
                return this.applicationApi.applicationListApplicationsForUser(e)
            }
            listApplicationsForGroup(e) {
                return this.applicationApi.applicationListApplicationsForGroup(e)
            }
            getScopesConfiguration() {
                return this.scopeApi.scopeGetScopes()
            }
            regenerateApplicationSecret(e) {
                return this.applicationApi.applicationRegenerateApplicationSecret(e)
            }
            getMetadataInformation() {
                return this.applicationApi.applicationGetApplicationManagementMetadata()
            }
            publishApplication(e) {
                return this.applicationApi.applicationPublishApplication(e)
            }
            constructor() {
                (0, n._)(this, "applicationApi", void 0), (0, n._)(this, "scopeApi", void 0);
                const e = (0, i.createClientConfiguration)("oauth", "bedev2");
                this.applicationApi = new a.ApplicationApi(e), this.scopeApi = new a.ScopeApi(e)
            }
        },
        s = (0, i.createClientConfiguration)("oauth", "bedev2"),
        l = new a.AuthorizationApi(s),
        c = new a.DiscoveryApi(s);
    e.s(["ApplicationAuthorizationsClient", 0, {
        authorizationApi: l,
        discoveryApi: c
    }, "EApplicationErrorResponseFields", () => r, "default", 0, o])
}, 6923, e => {
    "use strict";
    var t = e.i(328104);
    let n = (0, e.i(272593).createClientConfiguration)("creator-settings", "bedev2"),
        a = new t.CreatorSettingsAPIApi(n);
    e.s(["creatorSettingsClient", 0, {
        getCreatorSettings: (e, t) => {
            let n = {
                getAllCreatorNotificationSettingsRequest: {
                    userId: Number(e),
                    notificationChannels: t
                }
            };
            return a.v1NotificationsSettingsPost(n)
        },
        updateCreatorSettings: async (e, t) => {
            let n = {
                updateCreatorNotificationSettingsRequest: {
                    userId: Number(e),
                    notificationsSettings: t
                }
            };
            await a.v1NotificationsSettingsPatch(n)
        },
        validateUnsubscribeRequest: async (e, t, n) => {
            await a.v1NotificationsValidatePost({
                validateCreatorNotificationsUnsubscribeHashRequest: {
                    hash: e,
                    userId: Number(t),
                    notificationType: n
                }
            })
        },
        unsubscribeFromNotification: async (e, t, n, i) => {
            await a.v1NotificationsUnsubscribePost({
                unsubscribeFromCreatorNotificationsRequest: {
                    hash: e,
                    userId: Number(t),
                    choice: n,
                    notificationType: i
                }
            })
        }
    }, "genericCreatorSettingsClient", 0, {
        getGenericCreatorSetting: (e, t) => a.v2SettingsUserUserIdSettingSettingTypeGet({
            userId: e,
            settingType: t
        }),
        getGenericCreatorSettingsByUserId: e => a.v2SettingsUserUserIdGet({
            userId: e
        }),
        updateGenericCreatorSetting: (e, t, n) => a.v2SettingsUserUserIdSettingSettingTypePatch({
            userId: e,
            settingType: t,
            updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest: {
                settingValue: n
            }
        })
    }])
}, 196990, 47033, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(677753),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var n in t) Object.prototype.hasOwnProperty.call(t, n) && (e[n] = t[n])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        a(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function r(e, t, n, a) {
        return new(n || (n = Promise))(function(i, r) {
            function o(e) {
                try {
                    l(a.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(a.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof n ? t : new n(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((a = a.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var n, a, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            o = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return o.next = s(0), o.throw = s(1), o.return = s(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function s(s) {
            return function(l) {
                var c = [s, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (r = 0)), r;) try {
                    if (n = 1, a && (i = 2 & c[0] ? a.return : c[0] ? a.throw || ((i = a.return) && i.call(a), 0) : a.next) && !(i = i.call(a, c[1])).done) return i;
                    switch (a = 0, i && (c = [2 & c[0], i.value]), c[0]) {
                        case 0:
                        case 1:
                            i = c;
                            break;
                        case 4:
                            return r.label++, {
                                value: c[1],
                                done: !1
                            };
                        case 5:
                            r.label++, a = c[1], c = [0];
                            continue;
                        case 7:
                            c = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === c[0] || 2 === c[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === c[0] && (!i || c[1] > i[0] && c[1] < i[3])) {
                                r.label = c[1];
                                break
                            }
                            if (6 === c[0] && r.label < i[1]) {
                                r.label = i[1], i = c;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(c);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    c = t.call(e, r)
                } catch (e) {
                    c = [6, e], a = 0
                } finally {
                    n = i = 0
                }
                if (5 & c[0]) throw c[1];
                return {
                    value: c[0] ? c[1] : void 0,
                    done: !0
                }
            }
        }
    }
    "function" == typeof SuppressedError && SuppressedError;
    var s = {
        Global: "Global",
        Luobu: "Luobu",
        Europe: "Europe",
        SouthKorea: "SouthKorea"
    };

    function l(e) {
        var t, n;
        return null == (t = e) ? t : {
            agreement: null == (n = t.agreement) ? n : {
                id: n.id,
                version: n.version,
                agreementType: n.agreementType,
                clientType: n.clientType,
                regulationType: n.regulationType,
                displayUrl: n.displayUrl,
                archiveUrl: n.archiveUrl,
                createdDateTime: new Date(n.createdDateTime)
            },
            acceptedDatetime: new Date(t.acceptedDatetime)
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            agreementType: t.agreementType,
            clientType: t.clientType,
            regulationType: t.regulationType,
            displayUrl: t.displayUrl
        }
    }

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            agreementId: e.agreementId
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            acceptances: e.acceptances.map(u)
        }
    }

    function p(e) {
        var t;
        return null == (t = e) ? t : {
            errorCode: (0, n.exists)(t, "errorCode") ? t.errorCode : void 0,
            message: (0, n.exists)(t, "message") ? t.message : void 0,
            agreementId: t.agreementId
        }
    }

    function m(e, t) {
        return null == e ? e : {
            results: (0, n.exists)(e, "results") ? null === e.results ? null : e.results.map(p) : void 0
        }
    }
    var g = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.acceptanceDeleteRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return a = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "DELETE",
                                    headers: i,
                                    query: a,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userId: e.userId,
                                            agreementId: e.agreementId
                                        }
                                    }(e.acceptanceRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        errorCode: (0, n.exists)(e, "errorCode") ? e.errorCode : void 0,
                                        message: (0, n.exists)(e, "message") ? e.message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceDelete = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.acceptanceDeleteRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.acceptanceGetByUserIdRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceGetByUserId.");
                                return a = {}, i = {}, [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        results: (0, n.exists)(e, "results") ? null === e.results ? null : e.results.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceGetByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.acceptanceGetByUserIdRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return a = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "POST",
                                    headers: i,
                                    query: a,
                                    body: d(e.insertAcceptancesRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsert = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.acceptanceInsertRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertByUserIdRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new n.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceInsertByUserId.");
                                return a = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "POST",
                                    headers: i,
                                    query: a,
                                    body: d(e.insertAcceptancesRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.acceptanceInsertByUserIdRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n.BaseAPI),
        f = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.agreementResolutionGetByContextRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.clientType || void 0 === e.clientType) throw new n.RequiredError("clientType", "Required parameter requestParameters.clientType was null or undefined when calling agreementResolutionGetByContext.");
                                return a = {}, i = {}, [4, this.request({
                                    path: "/v1/agreements-resolution/{clientType}".replace("{".concat("clientType", "}"), encodeURIComponent(String(e.clientType))),
                                    schemaPath: "/v1/agreements-resolution/{clientType}",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return e.map(c)
                                })]
                        }
                    })
                })
            }, t.prototype.agreementResolutionGetByContext = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.agreementResolutionGetByContextRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n.BaseAPI);
    e.s(["AcceptanceApi", 0, g, "AgreementResolutionApi", 0, f, "AgreementType", 0, {
        TermsOfService: "TermsOfService",
        PrivacyPolicy: "PrivacyPolicy",
        RiderTerms: "RiderTerms",
        ChildrenPrivacyPolicy: "ChildrenPrivacyPolicy",
        ConsentFlow: "ConsentFlow",
        RefundTerms: "RefundTerms",
        LuobuThirdPartyDataUse: "LuobuThirdPartyDataUse",
        PersonalInformationPolicy: "PersonalInformationPolicy"
    }, "ClientType", 0, {
        Web: "Web",
        App: "App",
        Studio: "Studio",
        TalentHub: "TalentHub",
        None: "None",
        CreatorDashboardAnalytics: "CreatorDashboardAnalytics",
        ImmersiveAds: "ImmersiveAds",
        CreatorAiAssistant: "CreatorAIAssistant",
        CreatorStore: "CreatorStore",
        AudioDistribution: "AudioDistribution",
        AffiliateProgram: "AffiliateProgram",
        Commerce: "Commerce",
        ExtendedServices: "ExtendedServices"
    }, "RegulationType", 0, s], 47033);
    var h = e.i(272593);
    let v = new class {
        async acceptUserAgreements(e) {
            let t = {
                insertAcceptancesRequest: {
                    acceptances: e.map(e => ({
                        agreementId: e
                    }))
                }
            };
            return this.acceptanceApi.acceptanceInsert(t)
        }
        async getLuobuUserAgreement(e) {
            return (await this.agreementResolutionApi.agreementResolutionGetByContext({
                clientType: e.clientType
            })).filter(e => e.regulationType !== s.Luobu)
        }
        getUserAgreements(e) {
            return this.agreementResolutionApi.agreementResolutionGetByContext(e)
        }
        constructor() {
            (0, t._)(this, "agreementResolutionApi", void 0), (0, t._)(this, "acceptanceApi", void 0);
            const e = (0, h.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new f(e), this.acceptanceApi = new g(e)
        }
    };
    e.s(["userAgreementsClient", 0, v], 196990)
}, 354088, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(814975),
        i = e.i(6923);
    let r = {
            ExperienceGuidelines: [],
            CreatorExperiencePermissions: [],
            CloudServices: [],
            Oauth2: [],
            CreatorOutreach: [],
            PlatformFeedback: []
        },
        o = (e, t, n) => null == e && null == t || e === t ? 0 : null == e ? 1 : null == t ? -1 : null != n && (n.includes(e) || n.includes(t)) ? n.includes(e) && n.includes(t) ? n.indexOf(e) - n.indexOf(t) : n.includes(e) ? -1 : 1 : e.localeCompare(t),
        s = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : r,
                n = Object.keys(t);
            return e.sort((e, t) => o(e.notificationCategoryName, t.notificationCategoryName, n))
        },
        l = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : r,
                a = n[e];
            return t.sort((e, t) => o(e.notificationType, t.notificationType, a))
        },
        c = (0, n.createContext)({
            notificationSettings: [],
            notificationsSettingsContextStored: !1,
            notificationSettingsFailedToLoad: !1,
            notificationSettingsContextLoading: !0,
            getNotificationSettings: () => {},
            setNotificationSettings: () => {}
        });
    e.s(["CreatorNotificationsSettingsContext", 0, c, "default", 0, e => {
        let {
            children: r
        } = e, {
            user: o
        } = (0, a.useAuthentication)(), [u, d] = (0, n.useState)([]), [p, m] = (0, n.useState)(!1), [g, f] = (0, n.useState)(!0), [h, v] = (0, n.useState)(!1), y = (0, n.useCallback)(async () => {
            if (!p && (null == o ? void 0 : o.id) != null) try {
                v(!1), f(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(o.id.toString()),
                    t = (e => {
                        s(e);
                        for (let t = 0; t < e.length; t += 1) l(e[t].notificationCategoryName || "", e[t].notifications || []);
                        return e
                    })(e.categories || []);
                d(t), m(!0)
            } catch (e) {
                v(!0), m(!1)
            } finally {
                f(!1)
            }
        }, [null == o ? void 0 : o.id, p]), b = (0, n.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: h,
            notificationSettingsContextLoading: g,
            getNotificationSettings: y,
            setNotificationSettings: d
        }), [u, h, y, g, p]);
        return (0, t.jsx)(c.Provider, {
            value: b,
            children: r
        })
    }], 354088)
}, 911502, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(237401),
        i = e.i(79187),
        r = e.i(814975),
        o = e.i(607204),
        s = e.i(581548),
        l = e.i(881670),
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(872204),
        p = e.i(291037),
        m = e.i(35298),
        g = e.i(777004),
        f = e.i(169722),
        h = e.i(199834),
        v = e.i(706442),
        y = e.i(196945),
        b = e.i(156071),
        S = e.i(790806),
        C = e.i(759283),
        A = e.i(384340);
    let w = (0, v.makeStyles)()(() => ({
            dialogTitle: {
                marginBottom: 12
            },
            dialogContent: {
                paddingBottom: 0
            },
            dialogSubActions: {
                "& > button:not(:last-child)": {
                    marginRight: 8
                }
            }
        })),
        I = (0, i.withTranslation)(e => {
            let {
                open: a,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, A.default)(), {
                classes: {
                    dialogTitle: v,
                    dialogContent: I,
                    dialogSubActions: E
                }
            } = w(), {
                enqueue: T,
                close: P
            } = (0, y.useSnackbar)(), x = (0, n.useCallback)(e => {
                T({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: C.toastDurationTime,
                    autoHide: !0,
                    onClose: P
                })
            }, [T, P]), [U, R] = (0, n.useState)(), [O, D] = (0, n.useState)(), [L, F] = (0, n.useState)(), [N, k] = (0, n.useState)(), V = (0, n.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await S.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    F(e.name), k(!1)
                } catch (e) {
                    k(!0)
                }
            }, [l]), j = (0, n.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await b.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    R(null == e ? void 0 : e.name)
                } catch (e) {
                    x(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, x, c]);
            (0, n.useEffect)(() => {
                V(), j()
            }, [j, V]);
            let B = (0, n.useCallback)(() => {
                    r(void 0)
                }, [r]),
                M = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        D(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            x(c("Error.DecliningInvitation")), D(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, x, c]),
                G = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        D(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            x(c("Error.AcceptingInvitation")), D(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, x, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                children: [(0, t.jsx)(g.DialogContent, {
                    className: I,
                    children: (0, t.jsxs)(f.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(f.Grid, {
                            container: !0,
                            children: (0, t.jsx)(h.Typography, {
                                variant: "h4",
                                className: v,
                                children: c("Label.JoinOrganization", {
                                    organizationName: null != U ? U : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(f.Grid, {
                            container: !0,
                            children: (0, t.jsx)(h.Typography, {
                                variant: "body1",
                                children: N ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != L ? L : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    children: (0, t.jsxs)(f.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: B,
                            disabled: O,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(f.Grid, {
                            className: E,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: M,
                                disabled: O,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: G,
                                loading: O,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        E = (0, v.makeStyles)()(() => ({
            dialogTitle: {
                marginBottom: 12
            },
            dialogContent: {
                paddingBottom: 0
            },
            dialogActions: {
                margin: "0px 16px 0px 16px"
            }
        })),
        T = (0, i.withTranslation)(e => {
            let {
                open: a,
                onClose: r,
                invitation: o,
                accepted: s
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: v
                }
            } = E(), [y, b] = (0, n.useState)(), [C, A] = (0, n.useState)(), w = (0, n.useCallback)(async () => {
                if (null == o ? void 0 : o.senderUserId) try {
                    let e = await S.default.getUserById(Number.parseInt(o.senderUserId, 10));
                    b(e.name), A(!1)
                } catch (e) {
                    A(!0)
                }
            }, [o]);
            (0, n.useEffect)(() => {
                w()
            }, [w]);
            let I = (0, n.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                onClose: r,
                children: [(0, t.jsx)(g.DialogContent, {
                    className: u,
                    children: (0, t.jsxs)(f.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(h.Typography, {
                            variant: "h4",
                            className: c,
                            children: l(s ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(h.Typography, {
                            variant: "body1",
                            children: s ? (0, t.jsx)(t.Fragment, {
                                children: C ? l("Message.InvitationAcceptedWithoutUsername") : l("Message.InvitationAccepted", {
                                    username: null != y ? y : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: C ? l("Message.InvitationDeclinedWithoutUsername") : l("Message.InvitationDeclined", {
                                    username: null != y ? y : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    className: v,
                    children: (0, t.jsx)(f.Grid, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.Button, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: I,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]);
    var P = e.i(582977),
        x = e.i(672401);
    let U = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, a.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: m
        } = (0, c.default)(), [g, f] = (0, n.useState)(), [h, v] = (0, n.useState)(), [y, b] = (0, n.useState)(), [S, C] = (0, n.useState)(!1), [A, w] = (0, n.useState)(!1), [E, U] = (0, n.useState)(), [R, O] = (0, n.useState)(!1), D = null == d ? void 0 : d.id, L = (0, n.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : m
        }, [p, m]), F = l.query[P.InviteQueryKey], N = l.isReady, k = (0, n.useCallback)(() => {
            a.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), V = (0, n.useCallback)(async e => {
            if (!D) return void b(null);
            try {
                let t = await o.default.userClient.getUserInvitationByOrganization(e, D.toString());
                b(t)
            } catch (e) {
                b(null), k()
            }
        }, [D, k]), j = (0, n.useCallback)(async e => {
            if (!D) return void v(null);
            try {
                let t = await o.default.userClient.getUserPermissions(e, D.toString());
                v(t)
            } catch (e) {
                v(null)
            }
        }, [D]), B = (0, n.useCallback)(async () => {
            if (N) {
                w(!0);
                try {
                    if ("string" == typeof F) return void await V(F);
                    if (!L) return void f(null);
                    if (b(null), L) {
                        let e = await o.default.organizationClient.getOrganization(L.toString());
                        f(e), await j(e.id)
                    } else f(void 0);
                    C(!1)
                } catch (e) {
                    f(null), v(null), b(null)
                } finally {
                    w(!1)
                }
            }
        }, [L, V, j, F, N]), M = (0, n.useCallback)(() => {
            C(!0), B()
        }, [B]), G = (0, n.useCallback)(async () => {
            (null == g ? void 0 : g.id) && await j(null == g ? void 0 : g.id)
        }, [j, null == g ? void 0 : g.id]), z = (0, n.useMemo)(() => ({
            organization: g,
            permissions: h,
            refreshOrganization: M,
            refreshPermission: G,
            isOrganizationRefreshRequired: S,
            isOrganizationLoading: A
        }), [g, h, M, G, S, A]);
        return (0, n.useEffect)(() => {
            B()
        }, [B]), (0, t.jsx)(x.default.Provider, {
            value: z,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(I, {
                        open: y.invitationStatusType === s.InvitationStatusType.Open && void 0 === E,
                        onClose: e => {
                            !0 === e ? (U(!0), O(!0)) : !1 === e ? (U(!1), O(!0)) : (k(), b(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(T, {
                        open: R,
                        onClose: () => {
                            O(!1), !0 === E && M(), k()
                        },
                        invitation: y,
                        accepted: !0 === E
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, U], 911502)
}, 758835, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(237401);
    let a = () => {
        let e = Error("Blocking route change for unsaved changes");
        throw Object.assign(e, {
            cancelled: !0
        }), e
    };
    e.s(["default", 0, (e, i) => {
        (0, t.useEffect)(() => {
            let t = void 0 !== e ? e(a) : void 0;
            return t && n.default.events.on("routeChangeStart", t), () => {
                t && n.default.events.off("routeChangeStart", t)
            }
        }, [e]), (0, t.useEffect)(() => (i && n.default.events.on("routeChangeComplete", i), () => {
            i && n.default.events.off("routeChangeComplete", i)
        }), [i])
    }])
}, 210205, 120654, e => {
    "use strict";
    var t = e.i(416340);
    let n = {
            info: console.info,
            error: console.error,
            captureError: console.error,
            reportEvent: console.log
        },
        a = (0, t.createContext)(n);
    a.displayName = "TencentPerformanceMonitor", e.s(["default", 0, a], 120654), e.s(["useMetricsMonitoring", 0, function() {
        return (0, t.useContext)(a)
    }], 210205)
}, 336964, e => {
    "use strict";
    let t;
    var n = e.i(798280);

    function a(e) {
        var t, n, a, i;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (i = e.shouldUnmountOnClose) || i
        };
        let r = null != e ? e : {};
        return {
            mode: "content",
            size: null != (t = r.size) ? t : "Medium",
            isModal: null == (n = r.isModal) || n,
            hasCloseAffordance: void 0 !== r.closeLabel,
            closeLabel: r.closeLabel,
            hasMarginTop: r.hasMarginTop,
            hasMarginBottom: r.hasMarginBottom,
            hasDescription: r.hasDescription,
            shouldUnmountOnClose: null == (a = r.shouldUnmountOnClose) || a
        }
    }
    let i = a(),
        r = {
            ...t = (0, n.createStore)({
                render: null,
                options: null,
                isOpen: !1
            }),
            open: (e, n) => {
                t.setState({
                    render: e,
                    options: a(n),
                    isOpen: !0
                })
            },
            close: () => {
                t.getSnapshot().isOpen && t.setState({
                    isOpen: !1
                })
            },
            clearContent: () => {
                t.getSnapshot().isOpen || t.setState({
                    render: null,
                    options: null
                })
            }
        };
    e.s(["DEFAULT_RESOLVED_CONTENT_OPTIONS", 0, i, "dialogStore", 0, r])
}, 798280, e => {
    "use strict";
    e.s(["createStore", 0, e => {
        let t = new Set,
            n = e;
        return {
            getSnapshot: function() {
                return n
            },
            setState: function(e) {
                let a = n;
                n = {
                    ...n,
                    ...e
                }, t.forEach(e => e(n, a))
            },
            subscribe: function(e) {
                return t.add(e), () => {
                    t.delete(e)
                }
            }
        }
    }])
}, 209534, e => {
    "use strict";
    var t = e.i(798280);
    let n = 0,
        a = (0, t.createStore)({
            current: null
        }),
        i = {
            ...a,
            enqueue: function(e) {
                var t, i;
                let r = a.getSnapshot().current;
                null == r || null == (t = (i = r.props).onClose) || t.call(i), n += 1, a.setState({
                    current: {
                        id: "snackbar-".concat(n),
                        props: e
                    }
                })
            },
            dismiss: function() {
                var e, t;
                let {
                    current: n
                } = a.getSnapshot();
                n && (null == (e = (t = n.props).onClose) || e.call(t), a.setState({
                    current: null
                }))
            }
        };
    e.s(["snackbarStore", 0, i])
}, 894244, e => {
    "use strict";
    let t = async function() {
        var e;
        let t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
            n = null != (e = t.redirectUri) ? e : window.location.href,
            a = new URL("/oauth/v1/authorize", "https://apis.roblox.com"),
            i = {
                client_id: "4273917941353191905",
                response_type: "none",
                redirect_uri: n,
                scope: "openid",
                prompt: "none"
            };
        return void 0 !== t.state && (i.state = t.state), a.search = new URLSearchParams(i).toString(), a.href
    };
    e.s(["getAuthorizationEndpoint", 0, t])
}, 670777, (e, t, n) => {
    t.exports = {
        "OpenGraph.Title": "Creator Dashboard",
        "OpenGraph.Description": "Make anything you can imagine. Everything you need to start building on Roblox for free; join a global community of Creators and publish instantly to the world."
    }
}, 811683, (e, t, n) => {
    t.exports = {
        "OpenGraph.Description": "创作你能想象出的一切。免费为你提供在 Roblox 上开始创作所需的一切资源；加入全球创作者社区并立即向全世界发布你的创作。",
        "OpenGraph.Title": "创作中心"
    }
}, 681559, 272749, e => {
    "use strict";
    var t = e.i(79187),
        n = e.i(998683);
    let a = {
        en_us: t.Locale.English,
        es_es: t.Locale.Spanish,
        fr_fr: t.Locale.French,
        de_de: t.Locale.German,
        it_it: t.Locale.Italian,
        pt_br: t.Locale.BrazilPortuguese,
        ko_kr: t.Locale.Korean,
        zh_cn: t.Locale.SimplifiedChinese,
        zh_tw: t.Locale.TraditionalChinese,
        ja_jp: t.Locale.Japanese,
        ru_ru: t.Locale.Russian,
        id_id: t.Locale.Indonesian,
        pl_pl: t.Locale.Polish,
        vi_vn: t.Locale.Vietnamese,
        th_th: t.Locale.Thai,
        hi_in: t.Locale.Hindi
    };
    class i extends t.TranslationResourceProviderBase {
        async loadRuntimeLocaleInfo() {
            let {
                generalExperience: e
            } = await n.default.getUserLocalizationLocusSupportedLocales(), i = null == e ? void 0 : e.locale;
            if (void 0 === i) return this.defaultLocaleInfo;
            if (i in a) {
                let e = a[i],
                    n = (0, t.toLocaleNativeName)(e);
                return {
                    locale: e,
                    nativeName: n
                }
            }
            return console.warn("Unexpected locale ".concat(i, " received, fallback to default locale")), this.defaultLocaleInfo
        }
        async fetchTranslationResource(e, n) {
            let a = (0, t.toRobloxLocaleCode)(n),
                i = "https://translations-cdn.".concat("roblox.com", "/10/latest/").concat(a, "/").concat(e, ".json");
            return Object.fromEntries(Object.entries(await fetch(i).then(e => e.json())).map(e => {
                var t;
                let [n, a] = e;
                return [n, null != (t = null == a ? void 0 : a.localizedString) ? t : null]
            }))
        }
        async loadLocalOverrides(e, t) {
            try {
                let n = await fetch("/locales/".concat(t, "/").concat(e, ".json"));
                if (!n.ok) return {};
                let a = await n.json();
                if (0 === Object.keys(a).length) return {};
                return a
            } catch (e) {
                return {}
            }
        }
        constructor(e, t) {
            super(e, t)
        }
    }
    e.s(["TranslationResourceProvider", 0, i], 681559);
    var r = e.i(670777),
        o = e.i(811683);
    let s = t.Locale.English,
        l = t.NativeName.English,
        c = s === t.Locale.SimplifiedChinese ? o.default : r.default;
    e.s(["defaultLocale", 0, s, "defaultMetadataJson", 0, c, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 766324, e => {
    "use strict";
    var t = e.i(196945);
    e.s(["SnackbarProvider", () => t.default])
}]);

//# debugId=ce7e7c59-987f-b71e-ea91-740549004890
//# sourceMappingURL=1xhacettt8a-9.js.map