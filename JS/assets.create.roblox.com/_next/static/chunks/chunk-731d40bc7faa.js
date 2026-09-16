;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "338d003e-b35d-5314-7053-83bc95c14acc")
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
}, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableUGCFolders",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        });
    e.s(["enableCreatorShowcases", 0, i, "enableTaxonomyBasedCreatorDashboard", 0, n, "enableUgcFolders", 0, a, "isAutoPublishPreferencesEnabled", 0, r])
}, 954119, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "communities",
        name: "CreatorAnalytics",
        defaultValue: !0
    });
    e.s(["creatorAnalytics", 0, t])
}, 134731, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isAssetPrivacyOptOutSurveyEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, o, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, s])
}, 165136, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0
        }),
        n = (0, t.defineFlag)({
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
            defaultValue: !0
        }),
        l = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isAvatarItemLicensingEnabled",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isInGameSalesLicensingEnabled",
            defaultValue: !1
        }),
        u = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled",
            defaultValue: !1
        });
    e.s(["enableIpPlatformLicenseRecommendations", 0, n, "isAvatarItemLicensingEnabled", 0, l, "isExperiencePreviewEnabled", 0, a, "isIgnoreMatchEnabled", 0, s, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isInGameSalesLicensingEnabled", 0, c, "isIpLicensingEarningsEnabled", 0, i, "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled", 0, u, "isShowcaseExperiencesEnabled", 0, o])
}, 942100, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "content-publishing",
        name: "isPromotionalTextEnabled",
        defaultValue: !1
    });
    e.s(["isPromotionalTextEnabled", 0, t])
}, 428993, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "newCreatorWallets",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "newTransactionsFlag",
            defaultValue: !1
        });
    e.s(["enableVirtualTransactionsTab", 0, n, "isRevenueShareAgreementsEnabled", 0, a, "newCreatorWallets", 0, i, "newTransactionsFlag", 0, r])
}, 9436, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isBadgeDefaultIconEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
            name: "isTextDocumentEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, s, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, o, "isTextDocumentEnabled", 0, r])
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
}, 92174, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1
        });
    e.s(["isTaxDocumentationEnabled", 0, n, "shouldUseWatermarkFiatCalculation", 0, a])
}, 926415, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "engine-networking",
        name: "isBandwidthNetworkTabEnabled",
        defaultValue: !1
    });
    e.s(["isBandwidthNetworkTabEnabled", 0, t])
}, 242002, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsLayoutRefreshEnabled",
            defaultValue: !1
        });
    e.s(["isAcquisitionThumbnailUpsellEnabled", 0, a, "isHomeAcquisitionSignalsLayoutRefreshEnabled", 0, n])
}, 967230, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkLow",
            defaultValue: .01
        }),
        r = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkHigh",
            defaultValue: .05
        });
    e.s(["isAdsPageRedesignEnabled", 0, a, "isManagedRewardedTabEnabled", 0, n, "managedRewardedCtrBenchmarkHigh", 0, r, "managedRewardedCtrBenchmarkLow", 0, i])
}, 199972, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "localization",
        name: "imageLocalizationSettingsEnabled",
        defaultValue: !1
    });
    e.s(["imageLocalizationSettingsEnabled", 0, t])
}, 477797, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockManagedPricingSummary",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
        }),
        s = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "monetization",
            name: "isExperimentEligibilityEnabled",
            defaultValue: !1
        });
    e.s(["isExperimentEligibilityEnabled", 0, l, "isProductArchiveEnabled", 0, o, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, n, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, a, "mockShopItemsExternalEligibility", 0, s])
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
        a = e.i(416340),
        n = e.i(458451),
        i = e.i(889311),
        r = e.i(823062),
        o = e.i(486736);
    let s = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        l = encodeURIComponent("studio/CollaborationSettings"),
        c = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                n = a.status % 100 * 100;
            if (!a.ok && 500 === n && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), c(e, t + 1);
            if (500 === n && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let i = await a.json();
            if (!("access" in i)) throw Error('"access" not found in response');
            return i.access
        }, u = async () => await c("".concat(s, "/v1/upsell-feature-access?nameSpace=").concat(l, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", d = "CreatorHub.AgeVerificationBannerSettings", p = async () => {
            localStorage.removeItem(d)
        }, m = async () => {
            let e, t = localStorage.getItem(d);
            if (!t) return !1;
            try {
                let {
                    dismissedAt: a
                } = (e => {
                    let t = JSON.parse(e);
                    if (!(null == t ? void 0 : t.dismissedAt)) throw Error("Dismissed date must be set");
                    let a = new Date(t.dismissedAt);
                    if (Number.isNaN(a.getTime())) throw TypeError("Dismissed date string is not a valid date string");
                    if (a.getTime() > Date.now()) throw Error("Dismissed date cannot be in the future");
                    return {
                        dismissedAt: a
                    }
                })(t);
                e = a
            } catch (e) {
                return p(), !1
            }
            let a = new Date;
            return e.getFullYear() === a.getFullYear() && e.getMonth() === a.getMonth() && e.getDate() === a.getDate()
        }, g = async () => {
            localStorage.setItem(d, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, h = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), f = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, y = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: s
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: l,
                ageVerificationUpsellBannerEndDate: c,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, o.useSettings)(), [d, p] = (0, a.useState)(!0), [b, S] = (0, a.useState)("doNotShow"), {
            isFetched: C,
            user: A
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: P
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: T,
            isEnabled: w
        } = (0, a.useMemo)(() => {
            let e = f(l),
                t = f(c),
                a = f(u),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, [c, l, u]), E = (0, a.useCallback)(async () => {
            await g(), p(!0)
        }, [p]);
        (0, a.useEffect)(() => {
            w && C && (null == A ? void 0 : A.id) && (async () => {
                let e = !1;
                try {
                    e = await m()
                } catch (e) {
                    P.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                p(e);
                let t = "doNotShow";
                try {
                    t = await y()
                } catch (e) {
                    P.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                S(t)
            })().catch(e => {
                P.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [w, C, A, P]);
        let R = (0, a.useMemo)(() => {
            let e = w && "doNotShow" !== b;
            return {
                isBannerVisible: e && !d,
                isBannerEligible: e,
                isHighPriority: T,
                variant: "doNotShow" !== b ? b : "ageVerification",
                dismissBanner: E
            }
        }, [w, b, d, T, E]);
        return (0, t.jsx)(h.Provider, {
            value: R,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(h)], 906791)
}, 968439, e => {
    "use strict";
    var t, a = e.i(721281),
        n = e.i(280162),
        i = e.i(272593),
        r = ((t = {}).PrivacyPolicyUri = "privacyPolicyUri", t.TermsOfServiceUri = "termsOfServiceUri", t.Summary = "summary", t.Name = "name", t.CategoryJustification = "categoryJustification", t.VideoUri = "videoUri", t.RequestedCategory = "requestedCategory", t);
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
                (0, a._)(this, "applicationApi", void 0), (0, a._)(this, "scopeApi", void 0);
                const e = (0, i.createClientConfiguration)("oauth", "bedev2");
                this.applicationApi = new n.ApplicationApi(e), this.scopeApi = new n.ScopeApi(e)
            }
        },
        s = (0, i.createClientConfiguration)("oauth", "bedev2"),
        l = new n.AuthorizationApi(s),
        c = new n.DiscoveryApi(s);
    e.s(["ApplicationAuthorizationsClient", 0, {
        authorizationApi: l,
        discoveryApi: c
    }, "EApplicationErrorResponseFields", () => r, "default", 0, o])
}, 6923, e => {
    "use strict";
    var t = e.i(328104);
    let a = (0, e.i(272593).createClientConfiguration)("creator-settings", "bedev2"),
        n = new t.CreatorSettingsAPIApi(a);
    e.s(["creatorSettingsClient", 0, {
        getCreatorSettings: (e, t) => {
            let a = {
                getAllCreatorNotificationSettingsRequest: {
                    userId: Number(e),
                    notificationChannels: t
                }
            };
            return n.v1NotificationsSettingsPost(a)
        },
        updateCreatorSettings: async (e, t) => {
            let a = {
                updateCreatorNotificationSettingsRequest: {
                    userId: Number(e),
                    notificationsSettings: t
                }
            };
            await n.v1NotificationsSettingsPatch(a)
        },
        validateUnsubscribeRequest: async (e, t, a) => {
            await n.v1NotificationsValidatePost({
                validateCreatorNotificationsUnsubscribeHashRequest: {
                    hash: e,
                    userId: Number(t),
                    notificationType: a
                }
            })
        },
        unsubscribeFromNotification: async (e, t, a, i) => {
            await n.v1NotificationsUnsubscribePost({
                unsubscribeFromCreatorNotificationsRequest: {
                    hash: e,
                    userId: Number(t),
                    choice: a,
                    notificationType: i
                }
            })
        }
    }, "genericCreatorSettingsClient", 0, {
        getGenericCreatorSetting: (e, t) => n.v2SettingsUserUserIdSettingSettingTypeGet({
            userId: e,
            settingType: t
        }),
        getGenericCreatorSettingsByUserId: e => n.v2SettingsUserUserIdGet({
            userId: e
        }),
        updateGenericCreatorSetting: (e, t, a) => n.v2SettingsUserUserIdSettingSettingTypePatch({
            userId: e,
            settingType: t,
            updateOrCreateGenericCreatorSettingsByUserIdAndSettingTypeRequest: {
                settingValue: a
            }
        })
    }])
}, 196990, 47033, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(677753),
        n = function(e, t) {
            return (n = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function i(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function a() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
    }

    function r(e, t, a, n) {
        return new(a || (a = Promise))(function(i, r) {
            function o(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                try {
                    l(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(o, s)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function o(e, t) {
        var a, n, i, r = {
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
                if (a) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, c[0] && (r = 0)), r;) try {
                    if (a = 1, n && (i = 2 & c[0] ? n.return : c[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, c[1])).done) return i;
                    switch (n = 0, i && (c = [2 & c[0], i.value]), c[0]) {
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
                            r.label++, n = c[1], c = [0];
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
                    c = [6, e], n = 0
                } finally {
                    a = i = 0
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
        var t, a;
        return null == (t = e) ? t : {
            agreement: null == (a = t.agreement) ? a : {
                id: a.id,
                version: a.version,
                agreementType: a.agreementType,
                clientType: a.clientType,
                regulationType: a.regulationType,
                displayUrl: a.displayUrl,
                archiveUrl: a.archiveUrl,
                createdDateTime: new Date(a.createdDateTime)
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
            errorCode: (0, a.exists)(t, "errorCode") ? t.errorCode : void 0,
            message: (0, a.exists)(t, "message") ? t.message : void 0,
            agreementId: t.agreementId
        }
    }

    function m(e, t) {
        return null == e ? e : {
            results: (0, a.exists)(e, "results") ? null === e.results ? null : e.results.map(p) : void 0
        }
    }
    var g = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.acceptanceDeleteRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "DELETE",
                                    headers: i,
                                    query: n,
                                    body: function(e) {
                                        if (void 0 !== e) return null === e ? null : {
                                            userId: e.userId,
                                            agreementId: e.agreementId
                                        }
                                    }(e.acceptanceRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        errorCode: (0, a.exists)(e, "errorCode") ? e.errorCode : void 0,
                                        message: (0, a.exists)(e, "message") ? e.message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceDelete = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceDeleteRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.acceptanceGetByUserIdRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new a.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceGetByUserId.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        results: (0, a.exists)(e, "results") ? null === e.results ? null : e.results.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceGetByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceGetByUserIdRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: d(e.insertAcceptancesRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsert = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceInsertRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertByUserIdRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new a.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceInsertByUserId.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: d(e.insertAcceptancesRequest)
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return m(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.acceptanceInsertByUserIdRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t
        }(a.BaseAPI),
        h = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.agreementResolutionGetByContextRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return o(this, function(o) {
                        switch (o.label) {
                            case 0:
                                if (null === e.clientType || void 0 === e.clientType) throw new a.RequiredError("clientType", "Required parameter requestParameters.clientType was null or undefined when calling agreementResolutionGetByContext.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/agreements-resolution/{clientType}".replace("{".concat("clientType", "}"), encodeURIComponent(String(e.clientType))),
                                    schemaPath: "/v1/agreements-resolution/{clientType}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = o.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return e.map(c)
                                })]
                        }
                    })
                })
            }, t.prototype.agreementResolutionGetByContext = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return o(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.agreementResolutionGetByContextRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t
        }(a.BaseAPI);
    e.s(["AcceptanceApi", 0, g, "AgreementResolutionApi", 0, h, "AgreementType", 0, {
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
    var f = e.i(272593);
    let y = new class {
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
            const e = (0, f.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new h(e), this.acceptanceApi = new g(e)
        }
    };
    e.s(["userAgreementsClient", 0, y], 196990)
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(176936),
        n = e.i(272593);
    let i = new class {
            getAgeBracket() {
                return this.usersApi.v1UsersAuthenticatedAgeBracketGet()
            }
            getAuthenticatedUser() {
                return this.usersApi.v1UsersAuthenticatedGet()
            }
            async validateDisplayName(e) {
                await this.displayNameApi.v1DisplayNamesValidateGet(e)
            }
            searchUsers(e, t, a) {
                return this.userSearchApi.v1UsersSearchGet({
                    keyword: e,
                    limit: t,
                    cursor: a
                })
            }
            getUserById(e) {
                return this.usersApi.v1UsersUserIdGet({
                    userId: e
                })
            }
            getUsersByIds(e) {
                return this.usersApi.v1UsersPost({
                    request: {
                        userIds: e
                    }
                })
            }
            constructor() {
                (0, t._)(this, "displayNameApi", void 0), (0, t._)(this, "usersApi", void 0), (0, t._)(this, "userSearchApi", void 0);
                const e = (0, n.createClientConfiguration)("users", "bedev1");
                this.displayNameApi = new a.DisplayNamesApi(e), this.usersApi = new a.UsersApi(e), this.userSearchApi = new a.UserSearchApi(e)
            }
        },
        r = new a.UsersApi((0, n.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: r
    }, "default", 0, i])
}, 718067, e => {
    "use strict";
    var t, a, n, i = ((t = {})[t.Unknown = -1] = "Unknown", t[t.Init = 0] = "Init", t[t.ArchivedExperience = 1] = "ArchivedExperience", t[t.PlayabilityChanged = 2] = "PlayabilityChanged", t[t.NotificationStringCreated = 3] = "NotificationStringCreated", t[t.NotificationStringDeleted = 4] = "NotificationStringDeleted", t[t.NotificationStringUpdated = 5] = "NotificationStringUpdated", t[t.AvatarSettingsAvatarType = 6] = "AvatarSettingsAvatarType", t[t.AvatarSettingsAnimation = 7] = "AvatarSettingsAnimation", t[t.AvatarSettingsCollision = 8] = "AvatarSettingsCollision", t[t.AvatarSettingsScaleHeight = 9] = "AvatarSettingsScaleHeight", t[t.AvatarSettingsScaleWidth = 10] = "AvatarSettingsScaleWidth", t[t.AvatarSettingsScaleHead = 11] = "AvatarSettingsScaleHead", t[t.AvatarSettingsScaleBodyType = 12] = "AvatarSettingsScaleBodyType", t[t.AvatarSettingsScaleProportions = 13] = "AvatarSettingsScaleProportions", t[t.AvatarSettingsBodyParts = 14] = "AvatarSettingsBodyParts", t[t.AvatarSettingsClothing = 15] = "AvatarSettingsClothing", t[t.ExperienceName = 16] = "ExperienceName", t[t.ExperienceDescription = 17] = "ExperienceDescription", t[t.ExperienceGenre = 18] = "ExperienceGenre", t[t.SecuritySettingsHTTPRequests = 19] = "SecuritySettingsHTTPRequests", t[t.SecuritySettingsStudioAccessToAPI = 20] = "SecuritySettingsStudioAccessToAPI", t[t.SecuritySettingsThirdPartySales = 21] = "SecuritySettingsThirdPartySales", t[t.SecuritySettingsThirdPartyTeleports = 22] = "SecuritySettingsThirdPartyTeleports", t[t.ExperienceShutDown = 23] = "ExperienceShutDown", t[t.SocialLinksAdded = 24] = "SocialLinksAdded", t[t.SocialLinksRemoved = 25] = "SocialLinksRemoved", t[t.SocialLinksUpdated = 26] = "SocialLinksUpdated", t[t.SpatialVoice = 27] = "SpatialVoice", t[t.WorldSettingsWorkSpaceGravity = 28] = "WorldSettingsWorkSpaceGravity", t[t.WorldSettingsJumpHeight = 29] = "WorldSettingsJumpHeight", t[t.WorldSettingsJumpPower = 30] = "WorldSettingsJumpPower", t[t.WorldSettingsWalkSpeed = 31] = "WorldSettingsWalkSpeed", t[t.WorldSettingsMaxSlopeAngle = 32] = "WorldSettingsMaxSlopeAngle", t[t.SentUpdate = 33] = "SentUpdate", t[t.SupportedLanguages = 34] = "SupportedLanguages", t[t.AutoTranslationExperienceInformation = 35] = "AutoTranslationExperienceInformation", t[t.AutoTranslationExperienceStringsAndProducts = 36] = "AutoTranslationExperienceStringsAndProducts", t[t.LocalizationSettingsAutomaticTextCapture = 37] = "LocalizationSettingsAutomaticTextCapture", t[t.LocalizationSettingsUserTranslatedContent = 38] = "LocalizationSettingsUserTranslatedContent", t[t.ClearUnmodifiedAutoCaptureEntries = 39] = "ClearUnmodifiedAutoCaptureEntries", t[t.AnalyticsReport = 40] = "AnalyticsReport", t[t.TranslationIconAdded = 41] = "TranslationIconAdded", t[t.TranslationIconDeleted = 42] = "TranslationIconDeleted", t[t.TranslationExperienceName = 43] = "TranslationExperienceName", t[t.TranslationExperienceDescription = 44] = "TranslationExperienceDescription", t[t.TranslationThumbnailAltText = 45] = "TranslationThumbnailAltText", t[t.TranslationThumbnailAdded = 46] = "TranslationThumbnailAdded", t[t.TranslationThumbnailDeleted = 47] = "TranslationThumbnailDeleted", t[t.TranslationThumbnailOrder = 48] = "TranslationThumbnailOrder", t[t.TranslationStringAdded = 49] = "TranslationStringAdded", t[t.TranslationStringDeleted = 50] = "TranslationStringDeleted", t[t.TranslationStringUpdated = 51] = "TranslationStringUpdated", t[t.TranslationBadgeIconDeleted = 52] = "TranslationBadgeIconDeleted", t[t.TranslationBadgeDescription = 53] = "TranslationBadgeDescription", t[t.TranslationBadgeIconAdded = 54] = "TranslationBadgeIconAdded", t[t.TranslationBadgeName = 55] = "TranslationBadgeName", t[t.TranslationDeveloperProductIconDeleted = 56] = "TranslationDeveloperProductIconDeleted", t[t.TranslationDeveloperProductDescription = 57] = "TranslationDeveloperProductDescription", t[t.TranslationDeveloperProductIconAdded = 58] = "TranslationDeveloperProductIconAdded", t[t.TranslationDeveloperProductName = 59] = "TranslationDeveloperProductName", t[t.TranslationGamePassIconDeleted = 60] = "TranslationGamePassIconDeleted", t[t.TranslationGamePassDescription = 61] = "TranslationGamePassDescription", t[t.TranslationGamePassIconAdded = 62] = "TranslationGamePassIconAdded", t[t.TranslationGamePassName = 63] = "TranslationGamePassName", t[t.UserTranslator = 64] = "UserTranslator", t[t.GroupTranslator = 65] = "GroupTranslator", t[t.ExperienceAdvertisement = 66] = "ExperienceAdvertisement", t[t.MonetizationSettingsAccessType = 67] = "MonetizationSettingsAccessType", t[t.MonetizationSettingsRequiresRobux = 68] = "MonetizationSettingsRequiresRobux", t[t.MonetizationSettingsRobuxPrice = 69] = "MonetizationSettingsRobuxPrice", t[t.MonetizationSettingsPlayableDevices = 70] = "MonetizationSettingsPlayableDevices", t[t.MonetizationSettingsAllowPrivateServers = 71] = "MonetizationSettingsAllowPrivateServers", t[t.MonetizationSettingsPrivateServerPrice = 72] = "MonetizationSettingsPrivateServerPrice", t[t.ExperienceSponsor = 73] = "ExperienceSponsor", t[t.BadgeName = 74] = "BadgeName", t[t.BadgeDescription = 75] = "BadgeDescription", t[t.BadgeIcon = 76] = "BadgeIcon", t[t.BadgeCreate = 77] = "BadgeCreate", t[t.DeveloperProductName = 78] = "DeveloperProductName", t[t.DeveloperProductDescription = 79] = "DeveloperProductDescription", t[t.DeveloperProductIcon = 80] = "DeveloperProductIcon", t[t.DeveloperProductPrice = 81] = "DeveloperProductPrice", t[t.DeveloperProductCreate = 82] = "DeveloperProductCreate", t[t.GamePassName = 83] = "GamePassName", t[t.GamePassDescription = 84] = "GamePassDescription", t[t.GamePassIcon = 85] = "GamePassIcon", t[t.GamePassPrice = 86] = "GamePassPrice", t[t.GamePassCreate = 87] = "GamePassCreate", t[t.PermissionsUserAdded = 88] = "PermissionsUserAdded", t[t.PermissionsGroupAdded = 89] = "PermissionsGroupAdded", t[t.PermissionsUserChanged = 90] = "PermissionsUserChanged", t[t.PermissionsUserRemoved = 91] = "PermissionsUserRemoved", t[t.PermissionsGroupChanged = 92] = "PermissionsGroupChanged", t[t.PermissionsGroupRemoved = 93] = "PermissionsGroupRemoved", t[t.TeamCreate = 94] = "TeamCreate", t[t.PlaceIconAutoGenerated = 95] = "PlaceIconAutoGenerated", t[t.PlaceIconChanged = 96] = "PlaceIconChanged", t[t.PlaceIconRemoved = 97] = "PlaceIconRemoved", t[t.PlaceGearGenresOnlyAllowFromExperiencesGenre = 98] = "PlaceGearGenresOnlyAllowFromExperiencesGenre", t[t.PlaceGearGenresAllowAllGearGenres = 99] = "PlaceGearGenresAllowAllGearGenres", t[t.PlaceGearTypes = 100] = "PlaceGearTypes", t[t.PlaceDownloadPermission = 101] = "PlaceDownloadPermission", t[t.PlaceGenre = 102] = "PlaceGenre", t[t.PlaceName = 103] = "PlaceName", t[t.PlaceDescription = 104] = "PlaceDescription", t[t.PlaceMaxVisitorCount = 105] = "PlaceMaxVisitorCount", t[t.PlaceSocialSlotsRobloxOptimized = 106] = "PlaceSocialSlotsRobloxOptimized", t[t.PlaceSocialSlotsDisabled = 107] = "PlaceSocialSlotsDisabled", t[t.PlaceSocialSlotsCustomize = 108] = "PlaceSocialSlotsCustomize", t[t.PlacePermissionsCreatePlaceAPI = 109] = "PlacePermissionsCreatePlaceAPI", t[t.PlacePermissionsSavePlaceAPI = 110] = "PlacePermissionsSavePlaceAPI", t[t.PlaceRevert = 111] = "PlaceRevert", t[t.PlaceShutDown = 112] = "PlaceShutDown", t[t.PlaceRestart = 113] = "PlaceRestart", t[t.PlaceThumbnailAltText = 114] = "PlaceThumbnailAltText", t[t.PlaceThumbnailAdded = 115] = "PlaceThumbnailAdded", t[t.PlaceThumbnailOrder = 116] = "PlaceThumbnailOrder", t[t.PlaceThumbnailDeleted = 117] = "PlaceThumbnailDeleted", t[t.PlaceAdded = 118] = "PlaceAdded", t[t.PlaceRemoved = 119] = "PlaceRemoved", t[t.PlacePublished = 120] = "PlacePublished", t[t.CompletedQuestionnaire = 121] = "CompletedQuestionnaire", t[t.MonetizationSettingsPrivateServerRequiresRobux = 122] = "MonetizationSettingsPrivateServerRequiresRobux", t[t.SecuritySettingsEditableMeshAndTextureAPIAccess = 123] = "SecuritySettingsEditableMeshAndTextureAPIAccess", t[t.PackagePublish = 124] = "PackagePublish", t[t.PackageManualUpdate = 125] = "PackageManualUpdate", t[t.PackageAutoUpdate = 126] = "PackageAutoUpdate", t[t.PackageAutoUpdateToggle = 127] = "PackageAutoUpdateToggle", t[t.RoleCreated = 128] = "RoleCreated", t[t.RoleDeleted = 129] = "RoleDeleted", t[t.RolePermissionsUpdated = 130] = "RolePermissionsUpdated", t[t.RoleNameUpdated = 131] = "RoleNameUpdated", t[t.MemberRemoved = 132] = "MemberRemoved", t[t.MemberInvited = 133] = "MemberInvited", t[t.InviteRevoked = 134] = "InviteRevoked", t[t.MemberJoined = 135] = "MemberJoined", t[t.RoleAssigned = 136] = "RoleAssigned", t[t.RoleUnassigned = 137] = "RoleUnassigned", t[t.GroupIconUpdated = 138] = "GroupIconUpdated", t[t.GroupNameUpdated = 139] = "GroupNameUpdated", t[t.GroupDescriptionUpdated = 140] = "GroupDescriptionUpdated", t[t.GroupSocialLinksUpdated = 141] = "GroupSocialLinksUpdated", t[t.GroupOwnerUpdated = 142] = "GroupOwnerUpdated", t[t.OneTimePayoutSent = 143] = "OneTimePayoutSent", t[t.PayoutsConfigured = 144] = "PayoutsConfigured", t[t.DraftCommit = 145] = "DraftCommit", t[t.ExperiencePermissionsUpdated = 146] = "ExperiencePermissionsUpdated", t[t.ExperienceCreated = 147] = "ExperienceCreated", t[t.AdCreated = 148] = "AdCreated", t[t.PlaceModerated = 149] = "PlaceModerated", t[t.AssetModerated = 150] = "AssetModerated", t[t.EscapeHatchSaveCopyToCloud = 151] = "EscapeHatchSaveCopyToCloud", t),
        r = ((a = {})[a.Universe = 0] = "Universe", a[a.Place = 1] = "Place", a[a.User = 2] = "User", a[a.Badge = 3] = "Badge", a[a.DeveloperProduct = 4] = "DeveloperProduct", a[a.GamePass = 5] = "GamePass", a[a.Group = 6] = "Group", a[a.Robux = 7] = "Robux", a[a.Asset = 8] = "Asset", a),
        o = ((n = {}).ExperienceConfiguration = "Experience Configuration", n.Localization = "Localization", n.Permissions = "Permissions", n.PlaceConfiguration = "Place Configuration", n.PlacePublish = "Place Publish", n.Content = "Content", n);
    let s = new Set([64, 88, 90, 91, 132, 133, 134, 135, 136, 137]);
    e.s(["Categories", () => o, "EventType", () => i, "ResourceType", () => r, "allCategoriesEnums", 0, ["Experience Configuration", "Permissions", "Place Configuration", "Place Publish", "Content"], "categoriesToTranslationKey", 0, {
        "Experience Configuration": "Label.ExperienceConfiguration",
        Localization: "Label.FilterOptionLocalization",
        Permissions: "Label.FilterOptionPermissions",
        "Place Configuration": "Label.FilterOptionPlaceConfiguration",
        "Place Publish": "Label.FilterOptionPlacePublish",
        Content: "Label.FilterOptionContent"
    }, "categoryEventMapping", 0, {
        "Experience Configuration": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 121, 122, 123, 144, 148],
        Localization: [34, 35, 36, 37, 38, 41, 42, 43, 44, 45, 46, 47, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65],
        Permissions: [88, 89, 90, 91, 92, 93, 94, 146],
        "Place Configuration": [95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 117],
        "Place Publish": [118, 119, 120, 151],
        Content: [147, 149, 150]
    }, "playabilityTranslationKeys", 0, {
        Private: "Description.ActionPrivate",
        Public: "Description.ActionPublic",
        Friends: "Description.ActionFriendsTitle"
    }, "usernameEvents", 0, s])
}, 354088, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(814975),
        i = e.i(6923);
    let r = {
            ExperienceGuidelines: [],
            CreatorExperiencePermissions: [],
            CloudServices: [],
            Oauth2: [],
            CreatorOutreach: [],
            PlatformFeedback: []
        },
        o = (e, t, a) => null == e && null == t || e === t ? 0 : null == e ? 1 : null == t ? -1 : null != a && (a.includes(e) || a.includes(t)) ? a.includes(e) && a.includes(t) ? a.indexOf(e) - a.indexOf(t) : a.includes(e) ? -1 : 1 : e.localeCompare(t),
        s = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : r,
                a = Object.keys(t);
            return e.sort((e, t) => o(e.notificationCategoryName, t.notificationCategoryName, a))
        },
        l = function(e, t) {
            let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : r,
                n = a[e];
            return t.sort((e, t) => o(e.notificationType, t.notificationType, n))
        },
        c = (0, a.createContext)({
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
        } = (0, n.useAuthentication)(), [u, d] = (0, a.useState)([]), [p, m] = (0, a.useState)(!1), [g, h] = (0, a.useState)(!0), [f, y] = (0, a.useState)(!1), b = (0, a.useCallback)(async () => {
            if (!p && (null == o ? void 0 : o.id) != null) try {
                y(!1), h(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(o.id.toString()),
                    t = (e => {
                        s(e);
                        for (let t = 0; t < e.length; t += 1) l(e[t].notificationCategoryName || "", e[t].notifications || []);
                        return e
                    })(e.categories || []);
                d(t), m(!0)
            } catch (e) {
                y(!0), m(!1)
            } finally {
                h(!1)
            }
        }, [null == o ? void 0 : o.id, p]), S = (0, a.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: f,
            notificationSettingsContextLoading: g,
            getNotificationSettings: b,
            setNotificationSettings: d
        }), [u, f, b, g, p]);
        return (0, t.jsx)(c.Provider, {
            value: S,
            children: r
        })
    }], 354088)
}, 582977, e => {
    "use strict";
    var t, a, n, i = e.i(520004),
        r = e.i(156071),
        o = e.i(581548),
        s = e.i(718067);
    let l = new Map([
            ["Facebook", /^\s*((http|https):\/\/)?(www\.)?facebook\.com\/(?:(?:\w)*#!\/)?(?:pages\/)?(?:[?\w-]*\/)?(?:profile\.php\?id=(?=\d.*))?([\w-]*)\s*$/],
            ["Twitter", /^\s*(((http|https):\/\/)?(www\.)?(twitter\.com|x\.com)\/|@)([a-zA-Z0-9_]{1,15})\s*$/],
            ["YouTube", /^((http|https):\/\/)?(www\.)?youtube\.com\/(?!logout(\/|$))[@a-zA-Z0-9\-/_]+$/],
            ["Twitch", /^\s*((http|https):\/\/)?(www\.)?twitch\.tv\/[a-zA-Z0-9\-/_]+\s*$/],
            ["GooglePlus", /{}/],
            ["Discord", /^\s*((http|https):\/\/)?(www\.)?discord\.(gg|io|me|li)\/[a-zA-Z0-9\-_/]+\s*$/],
            ["RobloxGroup", /^\s*(?:https?):\/\/(?:[a-z0-9-]{2,}\.)*(?:roblox(labs)?\.com\/)(?:[Gg]roups\/[Gg]roup\.aspx\?gid=|[Mm]y\/[Gg]roups\.aspx\?gid=|groups\/|communities\/)([\d]+)\s*$/],
            ["Amazon", /^((https?):\/\/)?(www\.)?amazon\.com\/stores\/page\/[\w\-/]+(\?[\w\-/]+(=[\w\-/]*)?(&[\w\-/]+(=[\w\-/]*)?)*)?$/]
        ]),
        c = new Map([
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_0, "Facebook"],
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_1, "Twitter"],
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_2, "YouTube"],
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_3, "Twitch"],
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_4, "GooglePlus"],
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_5, "Discord"],
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_6, "RobloxGroup"],
            [i.RobloxGroupsApiSocialLinkResponseTypeEnum.NUMBER_7, "Amazon"]
        ]),
        u = new Map([
            [o.RoleColorType.Invalid, "A1A2A5"],
            [o.RoleColorType.Blue, "00A2FF"],
            [o.RoleColorType.LightBlue, "55C1FF"],
            [o.RoleColorType.Green, "00B864"],
            [o.RoleColorType.LightGreen, "26FF9C"],
            [o.RoleColorType.Purple, "9E78EC"],
            [o.RoleColorType.LightPurple, "B69AF1"],
            [o.RoleColorType.Yellow, "D8A009"],
            [o.RoleColorType.LightYellow, "F7C744"],
            [o.RoleColorType.Orange, "EF7A36"],
            [o.RoleColorType.LightOrange, "F29057"],
            [o.RoleColorType.Red, "F2453D"],
            [o.RoleColorType.LightRed, "F4645D"],
            [o.RoleColorType.Pink, "E245CD"],
            [o.RoleColorType.LightPink, "EC83DE"],
            [o.RoleColorType.Teal, "00D0D0"],
            [o.RoleColorType.LightTeal, "36FFFF"],
            [o.RoleColorType.Standard, "FFFFFF"]
        ]),
        d = [o.RoleColorType.Blue, o.RoleColorType.Green, o.RoleColorType.Purple, o.RoleColorType.Yellow, o.RoleColorType.Orange, o.RoleColorType.Red, o.RoleColorType.Pink, o.RoleColorType.Teal];
    var p = ((t = p || {}).Creator = "Creator", t.Content = "Content", t.Membership = "Membership", t.Monetization = "Monetization", t.GroupSettings = "GroupSettings", t.Roles = "Roles", t.GroupMembers = "GroupMembers", t),
        m = ((a = m || {}).CreateOrDeleteRoles = "CreateOrDeleteRoles", a.ConfigureRolesPermissions = "ConfigureRolesPermissions", a.ConfigureRolesSettings = "ConfigureRolesSettings", a.CreateExperience = "CreateExperience", a.UploadAsset = "UploadAsset", a.Invitation = "Invitation", a.ManageMembers = "ManageMembers", a.RoleAssignment = "RoleAssignment", a.SendOneTimePayout = "SendOneTimePayout", a.ConfigureRecurringPayouts = "ConfigureRecurringPayouts", a.GroupInformationUpdate = "GroupInformationUpdate", a.TransferOwnership = "TransferOwnership", a.SpendGroupFunds = "SpendGroupFunds", a.AdCreated = "AdCreated", a.AssetModerated = "AssetModerated", a),
        g = ((n = g || {}).Members = "Members", n.Invited = "Invited", n);
    let h = {
            CreateOrDeleteRoles: [s.EventType.RoleCreated, s.EventType.RoleDeleted],
            ConfigureRolesPermissions: [s.EventType.RolePermissionsUpdated, s.EventType.ExperiencePermissionsUpdated, r.GroupAuditLogActionTypeEnum.UpdateRoleSetPermissions],
            ConfigureRolesSettings: [s.EventType.RoleNameUpdated, r.GroupAuditLogActionTypeEnum.UpdateRolesetData, r.GroupAuditLogActionTypeEnum.UpdateRoleSetPosition],
            Invitation: [s.EventType.MemberInvited, s.EventType.InviteRevoked],
            ManageMembers: [r.GroupAuditLogActionTypeEnum.JoinGroup, r.GroupAuditLogActionTypeEnum.LeaveGroup, r.GroupAuditLogActionTypeEnum.RemoveMember],
            RoleAssignment: [s.EventType.RoleAssigned, s.EventType.RoleUnassigned],
            SendOneTimePayout: [s.EventType.OneTimePayoutSent],
            GroupInformationUpdate: [r.GroupAuditLogActionTypeEnum.Rename, r.GroupAuditLogActionTypeEnum.UpdateGroupIcon],
            TransferOwnership: [r.GroupAuditLogActionTypeEnum.ChangeOwner],
            CreateExperience: [s.EventType.ExperienceCreated],
            UploadAsset: [r.GroupAuditLogActionTypeEnum.CreateGroupAsset],
            ConfigureRecurringPayouts: [s.EventType.PayoutsConfigured],
            AssetModerated: [s.EventType.AssetModerated, s.EventType.PlaceModerated],
            SpendGroupFunds: [r.GroupAuditLogActionTypeEnum.SpendGroupFunds],
            AdCreated: [r.GroupAuditLogActionTypeEnum.BuyAd]
        },
        f = new Set([s.EventType.ExperiencePermissionsUpdated, s.EventType.ExperienceCreated, s.EventType.PayoutsConfigured, s.EventType.PlaceModerated]);
    e.s(["ActivityHistoryPageSize", 0, 20, "DefaultMemberIdPlaceholder", 0, "-1", "DefaultMemberRoleId", 0, "12884901889", "GroupActivityHistoryEventTypesMapping", 0, h, "GroupActivityHistoryFilterCategoriesMapping", 0, {
        Creator: [],
        Content: [],
        Membership: ["Roles", "GroupMembers"],
        Monetization: [],
        GroupSettings: [],
        Roles: [],
        GroupMembers: []
    }, "GroupActivityHistoryFilterDimensions", () => p, "GroupActivityHistoryFilterOptionsMapping", 0, {
        Creator: [],
        Content: ["UploadAsset", "CreateExperience", "AssetModerated"],
        Membership: [],
        Monetization: ["SpendGroupFunds", "ConfigureRecurringPayouts", "AdCreated"],
        GroupSettings: ["GroupInformationUpdate", "TransferOwnership"],
        Roles: ["CreateOrDeleteRoles", "ConfigureRolesPermissions", "ConfigureRolesSettings"],
        GroupMembers: ["Invitation", "RoleAssignment", "ManageMembers"]
    }, "GroupActivityHistoryFilterOptionsToTranslationKey", 0, {
        Creator: "Label.FilterOptionCreator",
        Content: "Label.FilterOptionContent",
        Membership: "Label.FilterOptionMembership",
        Monetization: "Label.FilterOptionMonetization",
        GroupSettings: "Label.FilterOptionGroupSettings",
        Roles: "Label.FilterOptionRoles",
        GroupMembers: "Label.FilterOptionGroupMembers",
        CreateOrDeleteRoles: "Label.FilterOptionCreateOrDeleteRoles",
        ConfigureRolesPermissions: "Label.FilterOptionConfigureRolesPermissions",
        ConfigureRolesSettings: "Label.FilterOptionConfigureRolesSettings",
        CreateExperience: "Label.FilterOptionCreateExperience",
        UploadAsset: "Label.FilterOptionUploadAsset",
        Invitation: "Label.FilterOptionInvitation",
        ManageMembers: "Label.FilterOptionManageMembers",
        RoleAssignment: "Label.FilterOptionRoleAssignment",
        SendOneTimePayout: "Label.FilterOptionSendOneTimePayout",
        ConfigureRecurringPayouts: "Label.FilterOptionConfigureRecurringPayouts",
        GroupInformationUpdate: "Label.FilterOptionGroupInformationUpdate",
        TransferOwnership: "Label.FilterOptionTransferOwnership",
        SpendGroupFunds: "Label.FilterOptionSpendGroupFunds",
        AdCreated: "Label.FilterOptionAdCreated",
        AssetModerated: "Label.FilterOptionAssetModerated"
    }, "GroupMembersMenuState", () => g, "GroupNameChangeCost", 0, 100, "GroupSocialLinkTypesPatternMap", 0, l, "GroupSocialLinkTypesToNameMap", 0, c, "InviteQueryKey", 0, "invitationGroupId", "MaximumRoles", 0, 99, "MembersPageSize", 0, 10, "MigratedGroupStatus", 0, "Migrated", "NewGroupPrice", 0, 100, "RoleColorTypeToHexMap", 0, u, "SocialLinksLimit", 0, 3, "SupportedRoleColorTypes", 0, d, "THIRTY_DAYS", 0, 2592e6, "getEndOfDay", 0, function(e) {
        return new Date(e.getFullYear(), e.getMonth(), e.getDate(), 23, 59, 59, 999)
    }, "noResultsIconPath", 0, "".concat("https://assets.create.roblox.com/17154a3bd8669d1c1b5c8a799a0be1f497b8549f/assets", "/group/no_results.svg"), "universeEvents", 0, f])
}, 911502, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(237401),
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
        h = e.i(169722),
        f = e.i(199834),
        y = e.i(706442),
        b = e.i(196945),
        S = e.i(156071),
        C = e.i(790806),
        A = e.i(759283),
        P = e.i(384340);
    let T = (0, y.makeStyles)()(() => ({
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
        w = (0, i.withTranslation)(e => {
            let {
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, P.default)(), {
                classes: {
                    dialogTitle: y,
                    dialogContent: w,
                    dialogSubActions: E
                }
            } = T(), {
                enqueue: R,
                close: x
            } = (0, b.useSnackbar)(), M = (0, a.useCallback)(e => {
                R({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: A.toastDurationTime,
                    autoHide: !0,
                    onClose: x
                })
            }, [R, x]), [I, D] = (0, a.useState)(), [F, G] = (0, a.useState)(), [L, U] = (0, a.useState)(), [O, k] = (0, a.useState)(), _ = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    U(e.name), k(!1)
                } catch (e) {
                    k(!0)
                }
            }, [l]), N = (0, a.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await S.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    D(null == e ? void 0 : e.name)
                } catch (e) {
                    M(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, M, c]);
            (0, a.useEffect)(() => {
                _(), N()
            }, [N, _]);
            let V = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                B = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        G(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            M(c("Error.DecliningInvitation")), G(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, M, c]),
                j = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        G(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            M(c("Error.AcceptingInvitation")), G(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, M, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(g.DialogContent, {
                    className: w,
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(h.Grid, {
                            container: !0,
                            children: (0, t.jsx)(f.Typography, {
                                variant: "h4",
                                className: y,
                                children: c("Label.JoinOrganization", {
                                    organizationName: null != I ? I : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(h.Grid, {
                            container: !0,
                            children: (0, t.jsx)(f.Typography, {
                                variant: "body1",
                                children: O ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != L ? L : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: V,
                            disabled: F,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(h.Grid, {
                            className: E,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: B,
                                disabled: F,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: j,
                                loading: F,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        E = (0, y.makeStyles)()(() => ({
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
        R = (0, i.withTranslation)(e => {
            let {
                open: n,
                onClose: r,
                invitation: o,
                accepted: s
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: y
                }
            } = E(), [b, S] = (0, a.useState)(), [A, P] = (0, a.useState)(), T = (0, a.useCallback)(async () => {
                if (null == o ? void 0 : o.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(o.senderUserId, 10));
                    S(e.name), P(!1)
                } catch (e) {
                    P(!0)
                }
            }, [o]);
            (0, a.useEffect)(() => {
                T()
            }, [T]);
            let w = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(g.DialogContent, {
                    className: u,
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(f.Typography, {
                            variant: "h4",
                            className: c,
                            children: l(s ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(f.Typography, {
                            variant: "body1",
                            children: s ? (0, t.jsx)(t.Fragment, {
                                children: A ? l("Message.InvitationAcceptedWithoutUsername") : l("Message.InvitationAccepted", {
                                    username: null != b ? b : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: A ? l("Message.InvitationDeclinedWithoutUsername") : l("Message.InvitationDeclined", {
                                    username: null != b ? b : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    className: y,
                    children: (0, t.jsx)(h.Grid, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.Button, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: w,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]);
    var x = e.i(582977),
        M = e.i(672401);
    let I = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: m
        } = (0, c.default)(), [g, h] = (0, a.useState)(), [f, y] = (0, a.useState)(), [b, S] = (0, a.useState)(), [C, A] = (0, a.useState)(!1), [P, T] = (0, a.useState)(!1), [E, I] = (0, a.useState)(), [D, F] = (0, a.useState)(!1), G = null == d ? void 0 : d.id, L = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : m
        }, [p, m]), U = l.query[x.InviteQueryKey], O = l.isReady, k = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), _ = (0, a.useCallback)(async e => {
            if (!G) return void S(null);
            try {
                let t = await o.default.userClient.getUserInvitationByOrganization(e, G.toString());
                S(t)
            } catch (e) {
                S(null), k()
            }
        }, [G, k]), N = (0, a.useCallback)(async e => {
            if (!G) return void y(null);
            try {
                let t = await o.default.userClient.getUserPermissions(e, G.toString());
                y(t)
            } catch (e) {
                y(null)
            }
        }, [G]), V = (0, a.useCallback)(async () => {
            if (O) {
                T(!0);
                try {
                    if ("string" == typeof U) return void await _(U);
                    if (!L) return void h(null);
                    if (S(null), L) {
                        let e = await o.default.organizationClient.getOrganization(L.toString());
                        h(e), await N(e.id)
                    } else h(void 0);
                    A(!1)
                } catch (e) {
                    h(null), y(null), S(null)
                } finally {
                    T(!1)
                }
            }
        }, [L, _, N, U, O]), B = (0, a.useCallback)(() => {
            A(!0), V()
        }, [V]), j = (0, a.useCallback)(async () => {
            (null == g ? void 0 : g.id) && await N(null == g ? void 0 : g.id)
        }, [N, null == g ? void 0 : g.id]), z = (0, a.useMemo)(() => ({
            organization: g,
            permissions: f,
            refreshOrganization: B,
            refreshPermission: j,
            isOrganizationRefreshRequired: C,
            isOrganizationLoading: P
        }), [g, f, B, j, C, P]);
        return (0, a.useEffect)(() => {
            V()
        }, [V]), (0, t.jsx)(M.default.Provider, {
            value: z,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, b && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(w, {
                        open: b.invitationStatusType === s.InvitationStatusType.Open && void 0 === E,
                        onClose: e => {
                            !0 === e ? (I(!0), F(!0)) : !1 === e ? (I(!1), F(!0)) : (k(), S(null))
                        },
                        invitation: b
                    }), (0, t.jsx)(R, {
                        open: D,
                        onClose: () => {
                            F(!1), !0 === E && B(), k()
                        },
                        invitation: b,
                        accepted: !0 === E
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, I], 911502)
}, 758835, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(237401);
    let n = () => {
        let e = Error("Blocking route change for unsaved changes");
        throw Object.assign(e, {
            cancelled: !0
        }), e
    };
    e.s(["default", 0, (e, i) => {
        (0, t.useEffect)(() => {
            let t = void 0 !== e ? e(n) : void 0;
            return t && a.default.events.on("routeChangeStart", t), () => {
                t && a.default.events.off("routeChangeStart", t)
            }
        }, [e]), (0, t.useEffect)(() => (i && a.default.events.on("routeChangeComplete", i), () => {
            i && a.default.events.off("routeChangeComplete", i)
        }), [i])
    }])
}, 210205, 120654, e => {
    "use strict";
    var t = e.i(416340);
    let a = {
            info: console.info,
            error: console.error,
            captureError: console.error,
            reportEvent: console.log
        },
        n = (0, t.createContext)(a);
    n.displayName = "TencentPerformanceMonitor", e.s(["default", 0, n], 120654), e.s(["useMetricsMonitoring", 0, function() {
        return (0, t.useContext)(n)
    }], 210205)
}, 839165, e => {
    "use strict";
    var t = e.i(677753);
    class a extends t.BaseAPI {
        get(e) {
            return this.request({
                headers: {},
                method: "GET",
                path: e,
                schemaPath: e
            }).then(e => new t.JSONApiResponse(e).value())
        }
        post(e, a) {
            return this.request({
                body: a,
                headers: a ? {
                    "Content-Type": "application/json"
                } : {},
                method: "POST",
                path: e,
                schemaPath: e
            }).then(e => new t.JSONApiResponse(e).value())
        }
        postWithoutResponse(e, a) {
            return this.request({
                body: a,
                headers: a ? {
                    "Content-Type": "application/json"
                } : {},
                method: "POST",
                path: e,
                schemaPath: e
            }).then(e => new t.VoidApiResponse(e).value())
        }
    }
    let n = new a(new t.Configuration({
        basePath: "",
        credentials: "include",
        robloxSiteDomain: "roblox.com"
    }));
    e.s(["authenticatedHttpGet", 0, e => n.get(e), "authenticatedHttpPost", 0, (e, t) => n.post(e, t), "authenticatedHttpPostWithoutResponse", 0, (e, t) => n.postWithoutResponse(e, t)])
}, 336964, e => {
    "use strict";
    let t;
    var a = e.i(798280);

    function n(e) {
        var t, a, n, i;
        if ((null == e ? void 0 : e.mode) === "standalone") return {
            mode: "standalone",
            shouldUnmountOnClose: null == (i = e.shouldUnmountOnClose) || i
        };
        let r = null != e ? e : {};
        return {
            mode: "content",
            size: null != (t = r.size) ? t : "Medium",
            isModal: null == (a = r.isModal) || a,
            hasCloseAffordance: void 0 !== r.closeLabel,
            closeLabel: r.closeLabel,
            hasMarginTop: r.hasMarginTop,
            hasMarginBottom: r.hasMarginBottom,
            hasDescription: r.hasDescription,
            shouldUnmountOnClose: null == (n = r.shouldUnmountOnClose) || n
        }
    }
    let i = n(),
        r = {
            ...t = (0, a.createStore)({
                render: null,
                options: null,
                isOpen: !1
            }),
            open: (e, a) => {
                t.setState({
                    render: e,
                    options: n(a),
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
            a = e;
        return {
            getSnapshot: function() {
                return a
            },
            setState: function(e) {
                let n = a;
                a = {
                    ...a,
                    ...e
                }, t.forEach(e => e(a, n))
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
    let a = 0,
        n = (0, t.createStore)({
            current: null
        }),
        i = {
            ...n,
            enqueue: function(e) {
                var t, i;
                let r = n.getSnapshot().current;
                null == r || null == (t = (i = r.props).onClose) || t.call(i), a += 1, n.setState({
                    current: {
                        id: "snackbar-".concat(a),
                        props: e
                    }
                })
            },
            dismiss: function() {
                var e, t;
                let {
                    current: a
                } = n.getSnapshot();
                a && (null == (e = (t = a.props).onClose) || e.call(t), n.setState({
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
            a = null != (e = t.redirectUri) ? e : window.location.href,
            n = new URL("/oauth/v1/authorize", "https://apis.roblox.com"),
            i = {
                client_id: "4273917941353191905",
                response_type: "none",
                redirect_uri: a,
                scope: "openid",
                prompt: "none"
            };
        return void 0 !== t.state && (i.state = t.state), n.search = new URLSearchParams(i).toString(), n.href
    };
    e.s(["getAuthorizationEndpoint", 0, t])
}, 670777, (e, t, a) => {
    t.exports = {
        "OpenGraph.Title": "Creator Dashboard",
        "OpenGraph.Description": "Make anything you can imagine. Everything you need to start building on Roblox for free; join a global community of Creators and publish instantly to the world."
    }
}, 811683, (e, t, a) => {
    t.exports = {
        "OpenGraph.Description": "创作你能想象出的一切。免费为你提供在 Roblox 上开始创作所需的一切资源；加入全球创作者社区并立即向全世界发布你的创作。",
        "OpenGraph.Title": "创作中心"
    }
}, 681559, 272749, e => {
    "use strict";
    var t = e.i(79187),
        a = e.i(998683);
    let n = {
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
    class i extends t.CdnTranslationResourceProvider {
        async loadRuntimeLocaleInfo() {
            let {
                generalExperience: e
            } = await a.default.getUserLocalizationLocusSupportedLocales(), i = null == e ? void 0 : e.locale;
            if (void 0 === i) return this.defaultLocaleInfo;
            if (i in n) {
                let e = n[i];
                return {
                    locale: e,
                    nativeName: (0, t.toLocaleNativeName)(e)
                }
            }
            return console.warn("Unexpected locale ".concat(i, " received, fallback to default locale")), this.defaultLocaleInfo
        }
        constructor(e, t) {
            super(e, {
                cdnDomain: "roblox.com",
                fallbackLocale: t,
                useLocalOverrides: !1
            })
        }
    }
    e.s(["TranslationResourceProvider", 0, i], 681559);
    var r = e.i(670777),
        o = e.i(811683);
    let s = t.Locale.English,
        l = t.NativeName.English,
        c = s === t.Locale.SimplifiedChinese ? o.default : r.default;
    e.s(["defaultLocale", 0, s, "defaultMetadataJson", 0, c, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 757432, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(174617),
        n = e.i(78892),
        i = e.i(608652),
        r = e.i(600317),
        o = e.i(142953),
        s = e.i(199786),
        l = e.i(974539),
        c = e.i(692166),
        u = e.i(300792),
        d = e.i(169525),
        p = e.i(221628),
        m = "Radio",
        [g, h] = (0, i.createContextScope)(m),
        [f, y] = g(m),
        b = t.forwardRef((e, i) => {
            let {
                __scopeRadio: o,
                name: s,
                checked: l = !1,
                required: c,
                disabled: u,
                value: d = "on",
                onCheck: m,
                form: g,
                ...h
            } = e, [y, b] = t.useState(null), S = (0, n.useComposedRefs)(i, e => b(e)), C = t.useRef(!1), T = !y || g || !!y.closest("form");
            return (0, p.jsxs)(f, {
                scope: o,
                checked: l,
                disabled: u,
                children: [(0, p.jsx)(r.Primitive.button, {
                    type: "button",
                    role: "radio",
                    "aria-checked": l,
                    "data-state": P(l),
                    "data-disabled": u ? "" : void 0,
                    disabled: u,
                    value: d,
                    ...h,
                    ref: S,
                    onClick: (0, a.composeEventHandlers)(e.onClick, e => {
                        l || null == m || m(), T && (C.current = e.isPropagationStopped(), C.current || e.stopPropagation())
                    })
                }), T && (0, p.jsx)(A, {
                    control: y,
                    bubbles: !C.current,
                    name: s,
                    value: d,
                    checked: l,
                    required: c,
                    disabled: u,
                    form: g,
                    style: {
                        transform: "translateX(-100%)"
                    }
                })]
            })
        });
    b.displayName = m;
    var S = "RadioIndicator",
        C = t.forwardRef((e, t) => {
            let {
                __scopeRadio: a,
                forceMount: n,
                ...i
            } = e, o = y(S, a);
            return (0, p.jsx)(d.Presence, {
                present: n || o.checked,
                children: (0, p.jsx)(r.Primitive.span, {
                    "data-state": P(o.checked),
                    "data-disabled": o.disabled ? "" : void 0,
                    ...i,
                    ref: t
                })
            })
        });
    C.displayName = S;
    var A = t.forwardRef((e, a) => {
        let {
            __scopeRadio: i,
            control: o,
            checked: s,
            bubbles: l = !0,
            ...d
        } = e, m = t.useRef(null), g = (0, n.useComposedRefs)(m, a), h = (0, u.usePrevious)(s), f = (0, c.useSize)(o);
        return t.useEffect(() => {
            let e = m.current;
            if (!e) return;
            let t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
            if (h !== s && t) {
                let a = new Event("click", {
                    bubbles: l
                });
                t.call(e, s), e.dispatchEvent(a)
            }
        }, [h, s, l]), (0, p.jsx)(r.Primitive.input, {
            type: "radio",
            "aria-hidden": !0,
            defaultChecked: s,
            ...d,
            tabIndex: -1,
            ref: g,
            style: {
                ...d.style,
                ...f,
                position: "absolute",
                pointerEvents: "none",
                opacity: 0,
                margin: 0
            }
        })
    });

    function P(e) {
        return e ? "checked" : "unchecked"
    }
    A.displayName = "RadioBubbleInput";
    var T = ["ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight"],
        w = "RadioGroup",
        [E, R] = (0, i.createContextScope)(w, [o.createRovingFocusGroupScope, h]),
        x = (0, o.createRovingFocusGroupScope)(),
        M = h(),
        [I, D] = E(w),
        F = t.forwardRef((e, t) => {
            let {
                __scopeRadioGroup: a,
                name: n,
                defaultValue: i,
                value: c,
                required: u = !1,
                disabled: d = !1,
                orientation: m,
                dir: g,
                loop: h = !0,
                onValueChange: f,
                ...y
            } = e, b = x(a), S = (0, l.useDirection)(g), [C, A] = (0, s.useControllableState)({
                prop: c,
                defaultProp: null != i ? i : null,
                onChange: f,
                caller: w
            });
            return (0, p.jsx)(I, {
                scope: a,
                name: n,
                required: u,
                disabled: d,
                value: C,
                onValueChange: A,
                children: (0, p.jsx)(o.Root, {
                    asChild: !0,
                    ...b,
                    orientation: m,
                    dir: S,
                    loop: h,
                    children: (0, p.jsx)(r.Primitive.div, {
                        role: "radiogroup",
                        "aria-required": u,
                        "aria-orientation": m,
                        "data-disabled": d ? "" : void 0,
                        dir: S,
                        ...y,
                        ref: t
                    })
                })
            })
        });
    F.displayName = w;
    var G = "RadioGroupItem",
        L = t.forwardRef((e, i) => {
            let {
                __scopeRadioGroup: r,
                disabled: s,
                ...l
            } = e, c = D(G, r), u = c.disabled || s, d = x(r), m = M(r), g = t.useRef(null), h = (0, n.useComposedRefs)(i, g), f = c.value === l.value, y = t.useRef(!1);
            return t.useEffect(() => {
                let e = e => {
                        T.includes(e.key) && (y.current = !0)
                    },
                    t = () => y.current = !1;
                return document.addEventListener("keydown", e), document.addEventListener("keyup", t), () => {
                    document.removeEventListener("keydown", e), document.removeEventListener("keyup", t)
                }
            }, []), (0, p.jsx)(o.Item, {
                asChild: !0,
                ...d,
                focusable: !u,
                active: f,
                children: (0, p.jsx)(b, {
                    disabled: u,
                    required: c.required,
                    checked: f,
                    ...m,
                    ...l,
                    name: c.name,
                    ref: h,
                    onCheck: () => c.onValueChange(l.value),
                    onKeyDown: (0, a.composeEventHandlers)(e => {
                        "Enter" === e.key && e.preventDefault()
                    }),
                    onFocus: (0, a.composeEventHandlers)(l.onFocus, () => {
                        var e;
                        y.current && (null == (e = g.current) || e.click())
                    })
                })
            })
        });
    L.displayName = G;
    var U = t.forwardRef((e, t) => {
        let {
            __scopeRadioGroup: a,
            ...n
        } = e, i = M(a);
        return (0, p.jsx)(C, {
            ...i,
            ...n,
            ref: t
        })
    });
    U.displayName = "RadioGroupIndicator", e.s(["RadioGroup", 0, F, "RadioGroupIndicator", 0, U, "RadioGroupItem", 0, L])
}, 170702, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(174617),
        n = e.i(608652),
        i = e.i(142953),
        r = e.i(169525),
        o = e.i(600317),
        s = e.i(974539),
        l = e.i(199786),
        c = e.i(40266),
        u = e.i(221628),
        d = "Tabs",
        [p, m] = (0, n.createContextScope)(d, [i.createRovingFocusGroupScope]),
        g = (0, i.createRovingFocusGroupScope)(),
        [h, f] = p(d),
        y = t.forwardRef((e, t) => {
            let {
                __scopeTabs: a,
                value: n,
                onValueChange: i,
                defaultValue: r,
                orientation: p = "horizontal",
                dir: m,
                activationMode: g = "automatic",
                ...f
            } = e, y = (0, s.useDirection)(m), [b, S] = (0, l.useControllableState)({
                prop: n,
                onChange: i,
                defaultProp: null != r ? r : "",
                caller: d
            });
            return (0, u.jsx)(h, {
                scope: a,
                baseId: (0, c.useId)(),
                value: b,
                onValueChange: S,
                orientation: p,
                dir: y,
                activationMode: g,
                children: (0, u.jsx)(o.Primitive.div, {
                    dir: y,
                    "data-orientation": p,
                    ...f,
                    ref: t
                })
            })
        });
    y.displayName = d;
    var b = "TabsList",
        S = t.forwardRef((e, t) => {
            let {
                __scopeTabs: a,
                loop: n = !0,
                ...r
            } = e, s = f(b, a), l = g(a);
            return (0, u.jsx)(i.Root, {
                asChild: !0,
                ...l,
                orientation: s.orientation,
                dir: s.dir,
                loop: n,
                children: (0, u.jsx)(o.Primitive.div, {
                    role: "tablist",
                    "aria-orientation": s.orientation,
                    ...r,
                    ref: t
                })
            })
        });
    S.displayName = b;
    var C = "TabsTrigger",
        A = t.forwardRef((e, t) => {
            let {
                __scopeTabs: n,
                value: r,
                disabled: s = !1,
                ...l
            } = e, c = f(C, n), d = g(n), p = w(c.baseId, r), m = E(c.baseId, r), h = r === c.value;
            return (0, u.jsx)(i.Item, {
                asChild: !0,
                ...d,
                focusable: !s,
                active: h,
                children: (0, u.jsx)(o.Primitive.button, {
                    type: "button",
                    role: "tab",
                    "aria-selected": h,
                    "aria-controls": m,
                    "data-state": h ? "active" : "inactive",
                    "data-disabled": s ? "" : void 0,
                    disabled: s,
                    id: p,
                    ...l,
                    ref: t,
                    onMouseDown: (0, a.composeEventHandlers)(e.onMouseDown, e => {
                        s || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : c.onValueChange(r)
                    }),
                    onKeyDown: (0, a.composeEventHandlers)(e.onKeyDown, e => {
                        [" ", "Enter"].includes(e.key) && c.onValueChange(r)
                    }),
                    onFocus: (0, a.composeEventHandlers)(e.onFocus, () => {
                        let e = "manual" !== c.activationMode;
                        h || s || !e || c.onValueChange(r)
                    })
                })
            })
        });
    A.displayName = C;
    var P = "TabsContent",
        T = t.forwardRef((e, a) => {
            let {
                __scopeTabs: n,
                value: i,
                forceMount: s,
                children: l,
                ...c
            } = e, d = f(P, n), p = w(d.baseId, i), m = E(d.baseId, i), g = i === d.value, h = t.useRef(g);
            return t.useEffect(() => {
                let e = requestAnimationFrame(() => h.current = !1);
                return () => cancelAnimationFrame(e)
            }, []), (0, u.jsx)(r.Presence, {
                present: s || g,
                children: t => {
                    let {
                        present: n
                    } = t;
                    return (0, u.jsx)(o.Primitive.div, {
                        "data-state": g ? "active" : "inactive",
                        "data-orientation": d.orientation,
                        role: "tabpanel",
                        "aria-labelledby": p,
                        hidden: !n,
                        id: m,
                        tabIndex: 0,
                        ...c,
                        ref: a,
                        style: {
                            ...e.style,
                            animationDuration: h.current ? "0s" : void 0
                        },
                        children: n && l
                    })
                }
            })
        });

    function w(e, t) {
        return "".concat(e, "-trigger-").concat(t)
    }

    function E(e, t) {
        return "".concat(e, "-content-").concat(t)
    }
    T.displayName = P, e.s(["Content", 0, T, "List", 0, S, "Root", 0, y, "Trigger", 0, A])
}, 339338, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(734463);
    let i = e => {
        var t, a, n, i, r, o;
        let s = null != (t = null == (n = (i = window).matchMedia) || null == (a = n.call(i, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            l = null == (r = document.activeElement) ? void 0 : r.matches(":focus-visible");
        if (s && !l) return void e.preventDefault();
        let c = null == (o = e.currentTarget) ? void 0 : o.querySelector('[role="menuitem"]:not([aria-disabled="true"])');
        c && (e.preventDefault(), c.focus())
    };
    e.s(["Popover", 0, function(e) {
        let {
            open: t,
            defaultOpen: i,
            onOpenChange: r,
            children: o
        } = e;
        return a.createElement(n.Root, {
            open: t,
            defaultOpen: i,
            onOpenChange: r
        }, o)
    }, "PopoverAnchor", 0, function(e) {
        let {
            asChild: t,
            className: i,
            children: r
        } = e;
        return a.createElement(n.Anchor, {
            asChild: t,
            className: i
        }, r)
    }, "PopoverContent", 0, function(e) {
        let {
            side: r = "bottom",
            align: o = "center",
            sideOffset: s = 4,
            className: l,
            children: c,
            ariaLabel: u,
            onOpenAutoFocus: d,
            ...p
        } = e;
        return a.createElement(n.Portal, null, a.createElement(n.Content, {
            side: r,
            align: o,
            sideOffset: s,
            ...p,
            "aria-label": null != u ? u : p["aria-label"],
            onOpenAutoFocus: null != d ? d : i,
            className: (0, t.default)("foundation-web-portal-zindex", l)
        }, c))
    }, "PopoverTrigger", 0, function(e) {
        let {
            asChild: t,
            disabled: i,
            className: r,
            children: o
        } = e;
        return a.createElement(n.Trigger, {
            asChild: t,
            disabled: i,
            className: r
        }, o)
    }])
}, 664933, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = "text-label-medium",
        i = a.default.forwardRef((e, i) => {
            let {
                className: r,
                variant: o = "Determinate",
                value: s = 0,
                minValue: l,
                maxValue: c,
                valuesLocation: u = "None",
                ariaLabel: d,
                ...p
            } = e, m = "Determinate" === o, g = Math.min(100, Math.max(0, s)), h = m && void 0 !== l && "None" !== u, f = m && void 0 !== c && "None" !== u, y = "Sides" === u, b = a.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", y ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: y ? {
                    flexBasis: 0
                } : void 0
            }, m ? a.default.createElement("div", {
                className: "absolute top-0 left-0 height-100 radius-circle transition-all duration-300 ease-out",
                style: {
                    width: "".concat(g, "%"),
                    backgroundColor: "var(--fui-future-alpha-color-system-progress)"
                }
            }) : a.default.createElement("div", {
                className: "foundation-web-progress-bar-indeterminate absolute top-0 height-100 radius-circle"
            })), S = h && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, l), C = f && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, c), A = (h || f) && a.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, h ? S : a.default.createElement("span", null), f ? C : a.default.createElement("span", null));
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": m ? 0 : void 0,
                "aria-valuemax": m ? 100 : void 0,
                "aria-valuenow": m ? g : void 0,
                ...p
            }, y ? a.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, S, b, C) : a.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === u && A, b, "Bottom" === u && A))
        });
    i.displayName = "ProgressBar", e.s(["ProgressBar", 0, i])
}, 176148, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = {
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
        i = a.default.forwardRef((e, i) => {
            let {
                className: r,
                size: o = "Large",
                variant: s = "Determinate",
                value: l = 0,
                showValue: c = !1,
                ariaLabel: u,
                ...d
            } = e, {
                dimension: p,
                strokeWidth: m,
                textClass: g,
                valueContainerSize: h
            } = n[o], f = (p - m) / 2, y = 2 * Math.PI * f, b = p / 2, S = Math.min(100, Math.max(0, l)), C = c && void 0 !== h ? h : p, A = "Determinate" === s;
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", r),
                role: "progressbar",
                "aria-label": u,
                "aria-valuemin": A ? 0 : void 0,
                "aria-valuemax": A ? 100 : void 0,
                "aria-valuenow": A ? S : void 0,
                style: {
                    width: C,
                    height: C
                },
                ...d
            }, a.default.createElement("svg", {
                width: p,
                height: p,
                viewBox: "0 0 ".concat(p, " ").concat(p),
                className: "relative"
            }, a.default.createElement("circle", {
                cx: b,
                cy: b,
                r: f,
                fill: "none",
                strokeWidth: m,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: b,
                cy: b,
                r: f,
                fill: "none",
                strokeWidth: m,
                strokeDasharray: A ? y : "".concat(.75 * y, " ").concat(.25 * y),
                strokeDashoffset: A ? y * (1 - S / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!A && "foundation-web-progress-circle-indeterminate"),
                style: A ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), A && c && "Large" === o && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", g),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(S)), a.default.createElement("span", null, "%")))
        });
    i.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, i])
}, 235684, e => {
    "use strict";
    var t = e.i(962560),
        a = e.i(273589),
        n = e.i(416340),
        i = e.i(42569),
        r = e.i(696180),
        o = e.i(219224),
        s = e.i(221628),
        l = e.i(640878),
        c = e.i(208958),
        u = e.i(154447),
        d = e.i(155607),
        p = e.i(301353),
        m = e.i(963320);

    function g(e) {
        return (0, a.g)("MuiFormGroup", e)
    }(0, r.g)("MuiFormGroup", ["root", "row", "error"]);
    let h = ["className", "row"],
        f = (0, i.s)("div", {
            name: "MuiFormGroup",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, a.row && t.row]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, t._)({
                display: "flex",
                flexDirection: "column",
                flexWrap: "wrap"
            }, a.row && {
                flexDirection: "row"
            })
        }),
        y = n.forwardRef(function(e, n) {
            let r = (0, m.u)({
                    props: e,
                    name: "MuiFormGroup"
                }),
                {
                    className: o,
                    row: l = !1
                } = r,
                c = (0, a._)(r, h),
                u = (0, d.u)(),
                y = (0, p.f)({
                    props: r,
                    muiFormControl: u,
                    states: ["error"]
                }),
                b = (0, t._)({}, r, {
                    row: l,
                    error: y.error
                }),
                S = (e => {
                    let {
                        classes: t,
                        row: a,
                        error: n
                    } = e;
                    return (0, i.a)({
                        root: ["root", a && "row", n && "error"]
                    }, g, t)
                })(b);
            return (0, s.jsx)(f, (0, t._)({
                className: (0, i.c)(S.root, o),
                ownerState: b,
                ref: n
            }, c))
        });
    var b = e.i(270673),
        S = e.i(751498),
        C = e.i(169923),
        A = e.i(738508);
    e.i(485511);
    var P = e.i(983545);

    function T(e) {
        return (0, a.g)("MuiRadioGroup", e)
    }(0, r.g)("MuiRadioGroup", ["root", "row", "error"]);
    let w = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        E = n.forwardRef(function(e, r) {
            let {
                actions: d,
                children: p,
                className: m,
                defaultValue: g,
                name: h,
                onChange: f,
                value: b
            } = e, S = (0, a._)(e, w), C = n.useRef(null), A = (e => {
                let {
                    classes: t,
                    row: a,
                    error: n
                } = e;
                return (0, i.a)({
                    root: ["root", a && "row", n && "error"]
                }, T, t)
            })(e), [P, E] = (0, l.u)({
                controlled: b,
                default: g,
                name: "RadioGroup"
            });
            n.useImperativeHandle(d, () => ({
                focus: () => {
                    let e = C.current.querySelector("input:not(:disabled):checked");
                    e || (e = C.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let R = (0, c.u)(r, C),
                x = (0, u.u)(h),
                M = n.useMemo(() => ({
                    name: x,
                    onChange(e) {
                        E(e.target.value), f && f(e, e.target.value)
                    },
                    value: P
                }), [x, f, E, P]);
            return (0, s.jsx)(o.R.Provider, {
                value: M,
                children: (0, s.jsx)(y, (0, t._)({
                    role: "radiogroup",
                    ref: R,
                    className: (0, i.c)(A.root, m)
                }, S, {
                    children: p
                }))
            })
        });
    var R = (0, S.c)((0, s.jsx)("path", {
            d: "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
        }), "Star"),
        x = (0, S.c)((0, s.jsx)("path", {
            d: "M22 9.24l-7.19-.62L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21 12 17.27 18.18 21l-1.63-7.03L22 9.24zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"
        }), "StarBorder");

    function M(e) {
        return (0, a.g)("MuiRating", e)
    }
    var I = (0, r.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let D = ["value"],
        F = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function G(e, t) {
        let a;
        return null == e ? e : Number((Math.round(e / t) * t).toFixed((a = t.toString().split(".")[1]) ? a.length : 0))
    }
    let L = (0, i.s)("span", {
            name: "MuiRating",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: n
                } = e;
                return [{
                    ["& .".concat(I.visuallyHidden)]: t.visuallyHidden
                }, t.root, t["size".concat((0, a.a)(n.size))], n.readOnly && t.readOnly]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, t._)({
                display: "inline-flex",
                position: "relative",
                fontSize: a.typography.pxToRem(24),
                color: "#faaf00",
                cursor: "pointer",
                textAlign: "left",
                width: "min-content",
                WebkitTapHighlightColor: "transparent",
                ["&.".concat(I.disabled)]: {
                    opacity: (a.vars || a).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["&.".concat(I.focusVisible, " .").concat(I.iconActive)]: {
                    outline: "1px solid #999"
                },
                ["& .".concat(I.visuallyHidden)]: C.v
            }, "small" === n.size && {
                fontSize: a.typography.pxToRem(18)
            }, "large" === n.size && {
                fontSize: a.typography.pxToRem(30)
            }, n.readOnly && {
                pointerEvents: "none"
            })
        }),
        U = (0, i.s)("label", {
            name: "MuiRating",
            slot: "Label",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.label, a.emptyValueFocused && t.labelEmptyValueActive]
            }
        })(e => {
            let {
                ownerState: a
            } = e;
            return (0, t._)({
                cursor: "inherit"
            }, a.emptyValueFocused && {
                top: 0,
                bottom: 0,
                position: "absolute",
                outline: "1px solid #999",
                width: "100%"
            })
        }),
        O = (0, i.s)("span", {
            name: "MuiRating",
            slot: "Icon",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.icon, a.iconEmpty && t.iconEmpty, a.iconFilled && t.iconFilled, a.iconHover && t.iconHover, a.iconFocus && t.iconFocus, a.iconActive && t.iconActive]
            }
        })(e => {
            let {
                theme: a,
                ownerState: n
            } = e;
            return (0, t._)({
                display: "flex",
                transition: a.transitions.create("transform", {
                    duration: a.transitions.duration.shortest
                }),
                pointerEvents: "none"
            }, n.iconActive && {
                transform: "scale(1.2)"
            }, n.iconEmpty && {
                color: (a.vars || a).palette.action.disabled
            })
        }),
        k = (0, i.s)("span", {
            name: "MuiRating",
            slot: "Decimal",
            shouldForwardProp: e => (0, i.b)(e) && "iconActive" !== e,
            overridesResolver: (e, t) => {
                let {
                    iconActive: a
                } = e;
                return [t.decimal, a && t.iconActive]
            }
        })(e => {
            let {
                iconActive: a
            } = e;
            return (0, t._)({
                position: "relative"
            }, a && {
                transform: "scale(1.2)"
            })
        });

    function _(e) {
        let n = (0, a._)(e, D);
        return (0, s.jsx)("span", (0, t._)({}, n))
    }

    function N(e) {
        let {
            classes: a,
            disabled: r,
            emptyIcon: o,
            focus: l,
            getLabelText: c,
            highlightSelectedOnly: d,
            hover: p,
            icon: m,
            IconContainerComponent: g,
            isActive: h,
            itemValue: f,
            labelProps: y,
            name: b,
            onBlur: S,
            onChange: C,
            onClick: A,
            onFocus: P,
            readOnly: T,
            ownerState: w,
            ratingValue: E,
            ratingValueRounded: R
        } = e, x = d ? f === E : f <= E, M = f <= p, I = f <= l, D = f === R, F = (0, u.u)(), G = (0, s.jsx)(O, {
            as: g,
            value: f,
            className: (0, i.c)(a.icon, x ? a.iconFilled : a.iconEmpty, M && a.iconHover, I && a.iconFocus, h && a.iconActive),
            ownerState: (0, t._)({}, w, {
                iconEmpty: !x,
                iconFilled: x,
                iconHover: M,
                iconFocus: I,
                iconActive: h
            }),
            children: o && !x ? o : m
        });
        return T ? (0, s.jsx)("span", (0, t._)({}, y, {
            children: G
        })) : (0, s.jsxs)(n.Fragment, {
            children: [(0, s.jsxs)(U, (0, t._)({
                ownerState: (0, t._)({}, w, {
                    emptyValueFocused: void 0
                }),
                htmlFor: F
            }, y, {
                children: [G, (0, s.jsx)("span", {
                    className: a.visuallyHidden,
                    children: c(f)
                })]
            })), (0, s.jsx)("input", {
                className: a.visuallyHidden,
                onFocus: P,
                onBlur: S,
                onChange: C,
                onClick: A,
                disabled: r,
                value: f,
                id: F,
                type: "radio",
                name: b,
                checked: D
            })]
        })
    }
    let V = (0, s.jsx)(R, {
            fontSize: "inherit"
        }),
        B = (0, s.jsx)(x, {
            fontSize: "inherit"
        });

    function j(e) {
        return "".concat(e, " Star").concat(1 !== e ? "s" : "")
    }
    n.forwardRef(function(e, r) {
        let o = (0, m.u)({
                name: "MuiRating",
                props: e
            }),
            {
                className: d,
                defaultValue: p = null,
                disabled: g = !1,
                emptyIcon: h = B,
                emptyLabelText: f = "Empty",
                getLabelText: y = j,
                highlightSelectedOnly: S = !1,
                icon: C = V,
                IconContainerComponent: T = _,
                max: w = 5,
                name: E,
                onChange: R,
                onChangeActive: x,
                onMouseLeave: I,
                onMouseMove: D,
                precision: O = 1,
                readOnly: z = !1,
                size: q = "medium",
                value: H
            } = o,
            W = (0, a._)(o, F),
            Q = (0, u.u)(E),
            [K, J] = (0, l.u)({
                controlled: H,
                default: p,
                name: "Rating"
            }),
            Y = G(K, O),
            $ = (0, b.u)(),
            [{
                hover: X,
                focus: Z
            }, ee] = n.useState({
                hover: -1,
                focus: -1
            }),
            et = Y; - 1 !== X && (et = X), -1 !== Z && (et = Z);
        let {
            isFocusVisibleRef: ea,
            onBlur: en,
            onFocus: ei,
            ref: er
        } = (0, A.u)(), [eo, es] = n.useState(!1), el = n.useRef(), ec = (0, c.u)(er, el, r), eu = e => {
            let t = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== X && (t = X), J(t), R && R(e, t)
        }, ed = e => {
            0 === e.clientX && 0 === e.clientY || (ee({
                hover: -1,
                focus: -1
            }), J(null), R && parseFloat(e.target.value) === Y && R(e, null))
        }, ep = e => {
            ei(e), !0 === ea.current && es(!0);
            let t = parseFloat(e.target.value);
            ee(e => ({
                hover: e.hover,
                focus: t
            }))
        }, em = e => {
            -1 === X && (en(e), !1 === ea.current && es(!1), ee(e => ({
                hover: e.hover,
                focus: -1
            })))
        }, [eg, eh] = n.useState(!1), ef = (0, t._)({}, o, {
            defaultValue: p,
            disabled: g,
            emptyIcon: h,
            emptyLabelText: f,
            emptyValueFocused: eg,
            focusVisible: eo,
            getLabelText: y,
            icon: C,
            IconContainerComponent: T,
            max: w,
            precision: O,
            readOnly: z,
            size: q
        }), ev = (e => {
            let {
                classes: t,
                size: n,
                readOnly: r,
                disabled: o,
                emptyValueFocused: s,
                focusVisible: l
            } = e, c = {
                root: ["root", "size".concat((0, a.a)(n)), o && "disabled", l && "focusVisible", r && "readOnly"],
                label: ["label", "pristine"],
                labelEmptyValue: [s && "labelEmptyValueActive"],
                icon: ["icon"],
                iconEmpty: ["iconEmpty"],
                iconFilled: ["iconFilled"],
                iconHover: ["iconHover"],
                iconFocus: ["iconFocus"],
                iconActive: ["iconActive"],
                decimal: ["decimal"],
                visuallyHidden: ["visuallyHidden"]
            };
            return (0, i.a)(c, M, t)
        })(ef);
        return (0, s.jsxs)(L, (0, t._)({
            ref: ec,
            onMouseMove: e => {
                D && D(e);
                let {
                    right: t,
                    left: a,
                    width: n
                } = el.current.getBoundingClientRect(), i = G(w * ($ ? (t - e.clientX) / n : (e.clientX - a) / n) + O / 2, O);
                i = (0, P.c)(i, O, w), ee(e => e.hover === i && e.focus === i ? e : {
                    hover: i,
                    focus: i
                }), es(!1), x && X !== i && x(e, i)
            },
            onMouseLeave: e => {
                I && I(e), ee({
                    hover: -1,
                    focus: -1
                }), x && -1 !== X && x(e, -1)
            },
            className: (0, i.c)(ev.root, d, z && "MuiRating-readOnly"),
            ownerState: ef,
            role: z ? "img" : null,
            "aria-label": z ? y(et) : null
        }, W, {
            children: [Array.from(Array(w)).map((e, a) => {
                let n = a + 1,
                    r = {
                        classes: ev,
                        disabled: g,
                        emptyIcon: h,
                        focus: Z,
                        getLabelText: y,
                        highlightSelectedOnly: S,
                        hover: X,
                        icon: C,
                        IconContainerComponent: T,
                        name: Q,
                        onBlur: em,
                        onChange: eu,
                        onClick: ed,
                        onFocus: ep,
                        ratingValue: et,
                        ratingValueRounded: Y,
                        readOnly: z,
                        ownerState: ef
                    },
                    o = n === Math.ceil(et) && (-1 !== X || -1 !== Z);
                if (O < 1) {
                    let e = Array.from(Array(1 / O));
                    return (0, s.jsx)(k, {
                        className: (0, i.c)(ev.decimal, o && ev.iconActive),
                        ownerState: ef,
                        iconActive: o,
                        children: e.map((a, i) => {
                            let o = G(n - 1 + (i + 1) * O, O);
                            return (0, s.jsx)(N, (0, t._)({}, r, {
                                isActive: !1,
                                itemValue: o,
                                labelProps: {
                                    style: e.length - 1 === i ? {} : {
                                        width: o === et ? (i + 1) * O * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), o)
                        })
                    }, n)
                }
                return (0, s.jsx)(N, (0, t._)({}, r, {
                    isActive: o,
                    itemValue: n
                }), n)
            }), !z && !g && (0, s.jsxs)(U, {
                className: (0, i.c)(ev.label, ev.labelEmptyValue),
                ownerState: ef,
                children: [(0, s.jsx)("input", {
                    className: ev.visuallyHidden,
                    value: "",
                    id: "".concat(Q, "-empty"),
                    type: "radio",
                    name: Q,
                    checked: null == Y,
                    onFocus: () => eh(!0),
                    onBlur: () => eh(!1),
                    onChange: eu
                }), (0, s.jsx)("span", {
                    className: ev.visuallyHidden,
                    children: f
                })]
            })]
        }))
    }), e.s(["RadioGroup", 0, E], 235684)
}, 908578, e => {
    "use strict";
    var t = e.i(273589),
        a = e.i(962560),
        n = e.i(416340),
        i = e.i(42569),
        r = e.i(696180),
        o = e.i(221628),
        s = e.i(972455),
        l = e.i(963320);

    function c(e) {
        return (0, t.g)("MuiDialogContentText", e)
    }(0, r.g)("MuiDialogContentText", ["root"]);
    let u = ["children", "className"],
        d = (0, i.s)(s.T, {
            shouldForwardProp: e => (0, i.r)(e) || "classes" === e,
            name: "MuiDialogContentText",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        p = n.forwardRef(function(e, n) {
            let r = (0, l.u)({
                    props: e,
                    name: "MuiDialogContentText"
                }),
                {
                    className: s
                } = r,
                p = (0, t._)(r, u),
                m = (e => {
                    let {
                        classes: t
                    } = e, n = (0, i.a)({
                        root: ["root"]
                    }, c, t);
                    return (0, a._)({}, t, n)
                })(p);
            return (0, o.jsx)(d, (0, a._)({
                component: "p",
                variant: "body1",
                color: "text.secondary",
                ref: n,
                ownerState: p,
                className: (0, i.c)(m.root, s)
            }, r, {
                classes: m
            }))
        });
    e.s(["D", 0, p])
}, 186214, e => {
    "use strict";
    var t = e.i(908578);
    e.s(["DialogContentText", () => t.D])
}, 417410, 565907, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        n = e.i(614515),
        i = e.i(993807),
        r = e.i(35985),
        o = e.i(126582),
        s = e.i(544453),
        l = e.i(273589),
        c = e.i(962560),
        u = e.i(42569),
        d = e.i(200964),
        p = e.i(696180),
        m = e.i(221628),
        g = e.i(963320);

    function h(e) {
        return (0, l.g)("MuiStep", e)
    }
    e.i(26724), (0, p.g)("MuiStep", ["root", "horizontal", "vertical", "alternativeLabel", "completed"]);
    let f = ["active", "children", "className", "component", "completed", "disabled", "expanded", "index", "last"],
        y = (0, u.s)("div", {
            name: "MuiStep",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, t[a.orientation], a.alternativeLabel && t.alternativeLabel, a.completed && t.completed]
            }
        })(e => {
            let {
                ownerState: t
            } = e;
            return (0, c._)({}, "horizontal" === t.orientation && {
                paddingLeft: 8,
                paddingRight: 8
            }, t.alternativeLabel && {
                flex: 1,
                position: "relative"
            })
        }),
        b = a.forwardRef(function(e, t) {
            let n = (0, g.u)({
                    props: e,
                    name: "MuiStep"
                }),
                {
                    active: i,
                    children: r,
                    className: o,
                    component: s = "div",
                    completed: p,
                    disabled: b,
                    expanded: S = !1,
                    index: C,
                    last: A
                } = n,
                P = (0, l._)(n, f),
                {
                    activeStep: T,
                    connector: w,
                    alternativeLabel: E,
                    orientation: R,
                    nonLinear: x
                } = a.useContext(d.S),
                [M = !1, I = !1, D = !1] = [i, p, b];
            T === C ? M = void 0 === i || i : !x && T > C ? I = void 0 === p || p : !x && T < C && (D = void 0 === b || b);
            let F = a.useMemo(() => ({
                    index: C,
                    last: A,
                    expanded: S,
                    icon: C + 1,
                    active: M,
                    completed: I,
                    disabled: D
                }), [C, A, S, M, I, D]),
                G = (0, c._)({}, n, {
                    active: M,
                    orientation: R,
                    alternativeLabel: E,
                    completed: I,
                    disabled: D,
                    expanded: S,
                    component: s
                }),
                L = (e => {
                    let {
                        classes: t,
                        orientation: a,
                        alternativeLabel: n,
                        completed: i
                    } = e;
                    return (0, u.a)({
                        root: ["root", a, n && "alternativeLabel", i && "completed"]
                    }, h, t)
                })(G),
                U = (0, m.jsxs)(y, (0, c._)({
                    as: s,
                    className: (0, u.c)(L.root, o),
                    ref: t,
                    ownerState: G
                }, P, {
                    children: [w && E && 0 !== C ? w : null, r]
                }));
            return (0, m.jsx)(d.a.Provider, {
                value: F,
                children: w && !E && 0 !== C ? (0, m.jsxs)(a.Fragment, {
                    children: [w, U]
                }) : U
            })
        });
    var S = (0, n.default)({
            name: "Step"
        })(function(e, a) {
            var n, i, l, c = a.alternativeLabel,
                u = a.orientation,
                d = ((n = {
                    color: e.palette.actionV2.primaryBrand.fill,
                    backgroundColor: e.palette.content.static.light,
                    borderRadius: "50%",
                    boxShadow: "inset 0 0 0 1px ".concat(e.palette.actionV2.primaryBrand.fill)
                })["& .".concat(r.s.text)] = {
                    fill: e.palette.content.static.light
                }, n),
                p = ((i = {})["& .".concat(o.s.iconContainer, ":not(.").concat(o.s.error, ")")] = ((l = {})["&.".concat(o.s.active, " .").concat(s.s.root)] = d, l["&.".concat(o.s.completed, " .").concat(s.s.root)] = d, l), i);
            return c && "vertical" === u && (p = (0, t._)((0, t._)({}, p), {
                display: "flex",
                flexDirection: "column",
                alignItems: "center"
            })), {
                root: p
            }
        }),
        C = (0, a.forwardRef)(function(e, n) {
            var r = e.classes,
                o = e.children,
                s = e.className,
                l = (0, t.a)(e, ["classes", "children", "className"]),
                c = S(e, {
                    props: {
                        classes: (0, i.default)(r, s)
                    }
                });
            return a.default.createElement(b, (0, t._)({}, l, {
                classes: c.classes,
                ref: n
            }), o)
        });
    e.s(["Step", 0, C], 417410);
    var A = e.i(174456);
    e.s(["StepLabel", () => A.c], 565907)
}, 591598, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        n = e.i(430686);
    e.i(221628), e.i(149285);
    var i = (0, a.createContext)({
        ref: {
            current: null
        },
        configure: function() {
            throw Error("useDialog was invoked without DialogProvider")
        },
        open: function() {
            throw Error("useDialog was invoked without DialogProvider")
        },
        close: function() {
            throw Error("useDialog was invoked without DialogProvider")
        }
    });
    e.s(["default", 0, function(e) {
        var r = e.children,
            o = (0, t.a)(e, ["children"]),
            s = (0, a.useRef)(null),
            l = (0, a.useState)({
                props: {},
                children: void 0
            }),
            c = l[0],
            u = l[1],
            d = (0, a.useState)(!1),
            p = d[0],
            m = d[1],
            g = (0, a.useCallback)(function() {
                m(!0)
            }, [m]),
            h = (0, a.useCallback)(function() {
                m(!1)
            }, [m]),
            f = (0, a.useCallback)(function(e, t) {
                void 0 === t && (t = {}), u({
                    props: t,
                    children: e
                })
            }, [u]),
            y = (0, a.useMemo)(function() {
                return {
                    ref: s,
                    open: g,
                    close: h,
                    configure: f
                }
            }, [h, f, g]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: y
        }, r), a.default.createElement(n.default, (0, t._)({}, c.props, o, {
            "aria-labelledby": c.props.id,
            "aria-describedby": "dialog-content-text-describe-id",
            open: p,
            onClose: h,
            ref: s
        }), c.children))
    }, "useDialog", 0, function() {
        var e = (0, a.useContext)(i);
        return {
            ref: e.ref,
            open: e.open,
            close: e.close,
            configure: e.configure
        }
    }])
}, 592171, e => {
    "use strict";
    var t = e.i(591598);
    e.s(["DialogProvider", () => t.default])
}, 649319, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(682671),
        n = e.i(341782),
        i = e.i(711489),
        r = e.i(891123),
        o = e.i(908578);
    e.i(221628), e.s(["DialogTemplate", 0, function(e) {
        var s = e.id;
        e.variant;
        var l = e.title,
            c = e.color,
            u = e.loading,
            d = void 0 !== u && u,
            p = e.content,
            m = e.confirmText,
            g = e.cancelText,
            h = e.onCancel,
            f = e.onConfirm;
        return t.default.createElement("div", null, t.default.createElement(a.default, {
            id: s
        }, l), t.default.createElement(n.default, null, t.default.createElement(o.D, {
            id: "dialog-content-text-describe-id"
        }, p)), t.default.createElement(i.default, null, t.default.createElement(r.default, {
            size: "large",
            variant: "outlined",
            "aria-label": g,
            color: "secondary",
            onClick: h,
            disabled: d
        }, g), t.default.createElement(r.default, {
            size: "large",
            variant: "contained",
            loading: d,
            "aria-label": m,
            color: void 0 === c ? "primaryBrand" : c,
            onClick: f
        }, m)))
    }], 649319)
}, 766324, e => {
    "use strict";
    var t = e.i(196945);
    e.s(["SnackbarProvider", () => t.default])
}, 44161, e => {
    "use strict";
    var t = e.i(198525);
    e.s(["Input", () => t.default])
}, 955490, 296357, e => {
    "use strict";
    var t = {
            experience_chat: {
                bodyKeys: {
                    Nudge: "AbuseVector.TextChat.DialogBody.Nudge",
                    Suspended: "AbuseVector.TextChat.DialogBody.Suspended",
                    Banned: "AbuseVector.TextChat.DialogBody.Banned"
                },
                titleKeys: {
                    Nudge: "AbuseVector.TextChat.DialogTitle.Nudge"
                },
                labelKey: "AbuseVector.TextChat"
            },
            party_chat: {
                labelKey: "AbuseVector.PartyChat"
            },
            age_verification: {
                labelKey: "AbuseVector.AgeVerification"
            },
            rights_management: {
                labelKey: "AbuseVector.RightsManagement"
            }
        },
        a = new Set(["voice"]),
        n = (e, t) => "".concat(e).concat("/v1/not-approved", "?abuseVector=").concat(encodeURIComponent(t)),
        i = e => "".concat(e).concat("/v1/dismiss-intervention");
    e.s(["getAppealsPortalUrl", 0, e => new URL("/report-appeals", e).toString(), "getDismissInterventionUrl", 0, i, "getModerationDetailUrl", 0, n, "getRegistryEntry", 0, function(e) {
        if (Object.hasOwn(t, e)) return t[e]
    }, "getSafetyDashboardAppealsUrl", 0, e => new URL("/safety-dashboard", e).toString(), "isOverrideBackedAbuseVector", 0, function(e) {
        return a.has(e)
    }], 296357);
    var r = e.i(416340),
        o = e.i(221628),
        s = (0, r.createContext)(void 0);
    e.s(["UniversalFeatureRestrictionsProvider", 0, e => {
        let {
            Surface: t,
            children: a
        } = e, [{
            request: n,
            open: i
        }, l] = (0, r.useState)({
            open: !1
        }), c = (0, r.useCallback)(e => {
            l({
                request: e,
                open: !0
            })
        }, []), u = (0, r.useCallback)(() => {
            l(e => ({
                ...e,
                open: !1
            }))
        }, []), d = (0, r.useMemo)(() => ({
            showFeatureRestriction: c,
            closeFeatureRestriction: u
        }), [c, u]);
        return (0, o.jsxs)(s.Provider, {
            value: d,
            children: [a, n && (0, o.jsx)(t, {
                request: n,
                open: i,
                onDismiss: u
            })]
        })
    }, "createUniversalFeatureRestrictionsApi", 0, function(e) {
        let {
            httpGet: t,
            httpPost: a,
            userModerationApiUrl: r
        } = e;
        return {
            fetchModerationDetail: e => t(n(r, e)),
            dismissIntervention: e => a(i(r), {
                intervention_id: e
            })
        }
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 955490)
}, 387125, e => {
    "use strict";
    var t, a, n, i, r, o, s, l, c, u, d, p, m = e.i(711300),
        g = e.i(634203),
        h = e.i(35877),
        f = e.i(747304);

    function y(e, t) {
        var a = (0, f._)(e, t, "update");
        if (a.set) {
            if (!a.get) throw TypeError("attempted to read set only private field");
            return "__destrWrapper" in a || (a.__destrWrapper = {
                set value(v) {
                    a.set.call(e, v)
                },
                get value() {
                    return a.get.call(e)
                }
            }), a.__destrWrapper
        }
        if (!a.writable) throw TypeError("attempted to set read only private field");
        return a
    }
    var b = e.i(711367),
        S = e.i(772278),
        C = e.i(665564),
        A = e.i(211089),
        P = (t = new WeakMap, class extends A.Subscribable {
            build(e, t, a) {
                var n;
                let i = t.queryKey,
                    r = null != (n = t.queryHash) ? n : (0, b.hashQueryKeyByOptions)(i, t),
                    o = this.get(r);
                return o || (o = new S.Query({
                    client: e,
                    queryKey: i,
                    queryHash: r,
                    options: e.defaultQueryOptions(t),
                    state: a,
                    defaultOptions: e.getQueryDefaults(i)
                }), this.add(o)), o
            }
            add(e) {
                (0, m._)(this, t).has(e.queryHash) || ((0, m._)(this, t).set(e.queryHash, e), this.notify({
                    type: "added",
                    query: e
                }))
            }
            remove(e) {
                let a = (0, m._)(this, t).get(e.queryHash);
                a && (e.destroy(), a === e && (0, m._)(this, t).delete(e.queryHash), this.notify({
                    type: "removed",
                    query: e
                }))
            }
            clear() {
                C.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        this.remove(e)
                    })
                })
            }
            get(e) {
                return (0, m._)(this, t).get(e)
            }
            getAll() {
                return [...(0, m._)(this, t).values()]
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, b.matchQuery)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {},
                    t = this.getAll();
                return Object.keys(e).length > 0 ? t.filter(t => (0, b.matchQuery)(e, t)) : t
            }
            notify(e) {
                C.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            onFocus() {
                C.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onFocus()
                    })
                })
            }
            onOnline() {
                C.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onOnline()
                    })
                })
            }
            constructor(e = {}) {
                super(), (0, g._)(this, t, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, h._)(this, t, new Map)
            }
        }),
        T = e.i(436175),
        w = A,
        E = (a = new WeakMap, n = new WeakMap, i = new WeakMap, class extends w.Subscribable {
            build(e, t, a) {
                let n = new T.Mutation({
                    client: e,
                    mutationCache: this,
                    mutationId: ++y(this, i).value,
                    options: e.defaultMutationOptions(t),
                    state: a
                });
                return this.add(n), n
            }
            add(e) {
                (0, m._)(this, a).add(e);
                let t = R(e);
                if ("string" == typeof t) {
                    let a = (0, m._)(this, n).get(t);
                    a ? a.push(e) : (0, m._)(this, n).set(t, [e])
                }
                this.notify({
                    type: "added",
                    mutation: e
                })
            }
            remove(e) {
                if ((0, m._)(this, a).delete(e)) {
                    let t = R(e);
                    if ("string" == typeof t) {
                        let a = (0, m._)(this, n).get(t);
                        if (a)
                            if (a.length > 1) {
                                let t = a.indexOf(e); - 1 !== t && a.splice(t, 1)
                            } else a[0] === e && (0, m._)(this, n).delete(t)
                    }
                }
                this.notify({
                    type: "removed",
                    mutation: e
                })
            }
            canRun(e) {
                let t = R(e);
                if ("string" != typeof t) return !0;
                {
                    let a = (0, m._)(this, n).get(t),
                        i = null == a ? void 0 : a.find(e => "pending" === e.state.status);
                    return !i || i === e
                }
            }
            runNext(e) {
                let t = R(e);
                if ("string" != typeof t) return Promise.resolve();
                {
                    var a, i;
                    let r = null == (i = (0, m._)(this, n).get(t)) ? void 0 : i.find(t => t !== e && t.state.isPaused);
                    return null != (a = null == r ? void 0 : r.continue()) ? a : Promise.resolve()
                }
            }
            clear() {
                C.notifyManager.batch(() => {
                    (0, m._)(this, a).forEach(e => {
                        this.notify({
                            type: "removed",
                            mutation: e
                        })
                    }), (0, m._)(this, a).clear(), (0, m._)(this, n).clear()
                })
            }
            getAll() {
                return Array.from((0, m._)(this, a))
            }
            find(e) {
                let t = {
                    exact: !0,
                    ...e
                };
                return this.getAll().find(e => (0, b.matchMutation)(t, e))
            }
            findAll() {
                let e = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {};
                return this.getAll().filter(t => (0, b.matchMutation)(e, t))
            }
            notify(e) {
                C.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            resumePausedMutations() {
                let e = this.getAll().filter(e => e.state.isPaused);
                return C.notifyManager.batch(() => Promise.all(e.map(e => e.continue().catch(b.noop))))
            }
            constructor(e = {}) {
                super(), (0, g._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, i, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, h._)(this, a, new Set), (0, h._)(this, n, new Map), (0, h._)(this, i, 0)
            }
        });

    function R(e) {
        var t;
        return null == (t = e.options.scope) ? void 0 : t.id
    }
    var x = e.i(549772),
        M = e.i(841246),
        I = e.i(117437),
        D = (r = new WeakMap, o = new WeakMap, s = new WeakMap, l = new WeakMap, c = new WeakMap, u = new WeakMap, d = new WeakMap, p = new WeakMap, class {
            mount() {
                y(this, u).value++, 1 === (0, m._)(this, u) && ((0, h._)(this, d, x.focusManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, m._)(this, r).onFocus())
                })), (0, h._)(this, p, M.onlineManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, m._)(this, r).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, u).value--, 0 === (0, m._)(this, u) && (null == (e = (0, m._)(this, d)) || e.call(this), (0, h._)(this, d, void 0), null == (t = (0, m._)(this, p)) || t.call(this), (0, h._)(this, p, void 0))
            }
            isFetching(e) {
                return (0, m._)(this, r).findAll({
                    ...e,
                    fetchStatus: "fetching"
                }).length
            }
            isMutating(e) {
                return (0, m._)(this, o).findAll({
                    ...e,
                    status: "pending"
                }).length
            }
            getQueryData(e) {
                var t;
                let a = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, m._)(this, r).get(a.queryHash)) ? void 0 : t.state.data
            }
            ensureQueryData(e) {
                let t = this.defaultQueryOptions(e),
                    a = (0, m._)(this, r).build(this, t),
                    n = a.state.data;
                return void 0 === n ? this.fetchQuery(e) : (e.revalidateIfStale && a.isStaleByTime((0, b.resolveStaleTime)(t.staleTime, a)) && this.prefetchQuery(t), Promise.resolve(n))
            }
            getQueriesData(e) {
                return (0, m._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: t,
                        state: a
                    } = e;
                    return [t, a.data]
                })
            }
            setQueryData(e, t, a) {
                let n = this.defaultQueryOptions({
                        queryKey: e
                    }),
                    i = (0, m._)(this, r).get(n.queryHash),
                    o = null == i ? void 0 : i.state.data,
                    s = (0, b.functionalUpdate)(t, o);
                if (void 0 !== s) return (0, m._)(this, r).build(this, n).setData(s, {
                    ...a,
                    manual: !0
                })
            }
            setQueriesData(e, t, a) {
                return C.notifyManager.batch(() => (0, m._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: n
                    } = e;
                    return [n, this.setQueryData(n, t, a)]
                }))
            }
            getQueryState(e) {
                var t;
                let a = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, m._)(this, r).get(a.queryHash)) ? void 0 : t.state
            }
            removeQueries(e) {
                let t = (0, m._)(this, r);
                C.notifyManager.batch(() => {
                    t.findAll(e).forEach(e => {
                        t.remove(e)
                    })
                })
            }
            resetQueries(e, t) {
                let a = (0, m._)(this, r);
                return C.notifyManager.batch(() => (a.findAll(e).forEach(e => {
                    e.reset()
                }), this.refetchQueries({
                    type: "active",
                    ...e
                }, t)))
            }
            cancelQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = {
                        revert: !0,
                        ...t
                    };
                return Promise.all(C.notifyManager.batch(() => (0, m._)(this, r).findAll(e).map(e => e.cancel(a)))).then(b.noop).catch(b.noop)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return C.notifyManager.batch(() => {
                    var a, n;
                    return ((0, m._)(this, r).findAll(e).forEach(e => {
                        e.invalidate()
                    }), (null == e ? void 0 : e.refetchType) === "none") ? Promise.resolve() : this.refetchQueries({
                        ...e,
                        type: null != (a = null != (n = null == e ? void 0 : e.refetchType) ? n : null == e ? void 0 : e.type) ? a : "active"
                    }, t)
                })
            }
            refetchQueries(e) {
                var t;
                let a = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = {
                        ...a,
                        cancelRefetch: null == (t = a.cancelRefetch) || t
                    };
                return Promise.all(C.notifyManager.batch(() => (0, m._)(this, r).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
                    let t = e.fetch(void 0, n);
                    return n.throwOnError || (t = t.catch(b.noop)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(b.noop)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let a = (0, m._)(this, r).build(this, t);
                return a.isStaleByTime((0, b.resolveStaleTime)(t.staleTime, a)) ? a.fetch(t) : Promise.resolve(a.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(b.noop).catch(b.noop)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, I.infiniteQueryBehavior)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(b.noop).catch(b.noop)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, I.infiniteQueryBehavior)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return M.onlineManager.isOnline() ? (0, m._)(this, o).resumePausedMutations() : Promise.resolve()
            }
            getQueryCache() {
                return (0, m._)(this, r)
            }
            getMutationCache() {
                return (0, m._)(this, o)
            }
            getDefaultOptions() {
                return (0, m._)(this, s)
            }
            setDefaultOptions(e) {
                (0, h._)(this, s, e)
            }
            setQueryDefaults(e, t) {
                (0, m._)(this, l).set((0, b.hashKey)(e), {
                    queryKey: e,
                    defaultOptions: t
                })
            }
            getQueryDefaults(e) {
                let t = [...(0, m._)(this, l).values()],
                    a = {};
                return t.forEach(t => {
                    (0, b.partialMatchKey)(e, t.queryKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            setMutationDefaults(e, t) {
                (0, m._)(this, c).set((0, b.hashKey)(e), {
                    mutationKey: e,
                    defaultOptions: t
                })
            }
            getMutationDefaults(e) {
                let t = [...(0, m._)(this, c).values()],
                    a = {};
                return t.forEach(t => {
                    (0, b.partialMatchKey)(e, t.mutationKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            defaultQueryOptions(e) {
                if (e._defaulted) return e;
                let t = {
                    ...(0, m._)(this, s).queries,
                    ...this.getQueryDefaults(e.queryKey),
                    ...e,
                    _defaulted: !0
                };
                return t.queryHash || (t.queryHash = (0, b.hashQueryKeyByOptions)(t.queryKey, t)), void 0 === t.refetchOnReconnect && (t.refetchOnReconnect = "always" !== t.networkMode), void 0 === t.throwOnError && (t.throwOnError = !!t.suspense), !t.networkMode && t.persister && (t.networkMode = "offlineFirst"), t.queryFn === b.skipToken && (t.enabled = !1), t
            }
            defaultMutationOptions(e) {
                return (null == e ? void 0 : e._defaulted) ? e : {
                    ...(0, m._)(this, s).mutations,
                    ...(null == e ? void 0 : e.mutationKey) && this.getMutationDefaults(e.mutationKey),
                    ...e,
                    _defaulted: !0
                }
            }
            clear() {
                (0, m._)(this, r).clear(), (0, m._)(this, o).clear()
            }
            constructor(e = {}) {
                (0, g._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, r, e.queryCache || new P), (0, h._)(this, o, e.mutationCache || new E), (0, h._)(this, s, e.defaultOptions || {}), (0, h._)(this, l, new Map), (0, h._)(this, c, new Map), (0, h._)(this, u, 0)
            }
        });
    e.s(["QueryClient", 0, D], 387125)
}, 929036, e => {
    "use strict";
    var t = "u" > typeof globalThis ? globalThis : window;
    e.s(["a", 0, function(e) {
        return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
    }, "c", 0, t, "g", 0, function(e) {
        if (Object.prototype.hasOwnProperty.call(e, "__esModule")) return e;
        var t = e.default;
        if ("function" == typeof t) {
            var a = function e() {
                var a = !1;
                try {
                    a = this instanceof e
                } catch (e) {}
                return a ? Reflect.construct(t, arguments, this.constructor) : t.apply(this, arguments)
            };
            a.prototype = t.prototype
        } else a = {};
        return Object.defineProperty(a, "__esModule", {
            value: !0
        }), Object.keys(e).forEach(function(t) {
            var n = Object.getOwnPropertyDescriptor(e, t);
            Object.defineProperty(a, t, n.get ? n : {
                enumerable: !0,
                get: function() {
                    return e[t]
                }
            })
        }), a
    }])
}]);

//# debugId=338d003e-b35d-5314-7053-83bc95c14acc
//# sourceMappingURL=2rgg-eew_1vxo.js.map