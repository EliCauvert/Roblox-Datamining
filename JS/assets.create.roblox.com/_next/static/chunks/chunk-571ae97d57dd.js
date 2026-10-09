;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "59da0c36-6b00-3fd7-969a-14841a669f2f")
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
    let n = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableAvatarCreationTokenCategories",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableBulkMakeupTokenCreation",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableCoreContentGatedBanner",
            defaultValue: !1
        });
    e.s(["enableAvatarCreationTokenCategories", 0, i, "enableBulkMakeupTokenCreation", 0, r, "enableCoreContentGatedBanner", 0, l, "enableCreatorShowcases", 0, a, "enableTaxonomyBasedCreatorDashboard", 0, n, "isAutoPublishPreferencesEnabled", 0, s, "showTaxonomyOnAvatarItemAnalyticsTab", 0, o])
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
        s = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isCreatorStoreVideoMultipartUploadEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, a, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, n, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, o, "isPublishBeforeExposeEnabled", 0, l])
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
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0
        }),
        o = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isAvatarItemLicensingEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isInGameSalesLicensingEnabled",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30
        }),
        u = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled",
            defaultValue: !1
        });
    e.s(["enableIpPlatformLicenseRecommendations", 0, a, "isAvatarItemLicensingEnabled", 0, o, "isExperiencePreviewEnabled", 0, n, "isIgnoreMatchEnabled", 0, s, "isImageAttachmentEnabledInLicenseApplication", 0, i, "isInGameSalesLicensingEnabled", 0, l, "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled", 0, u, "isShowcaseExperiencesEnabled", 0, r, "maxCollectibleItemDetailsRequestCount", 0, c])
}, 942100, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "content-publishing",
            name: "isPromotionalTextEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "content-publishing",
            name: "isExperienceNameCharacterValidationEnabled",
            defaultValue: !1
        });
    e.s(["isExperienceNameCharacterValidationEnabled", 0, a, "isPromotionalTextEnabled", 0, n])
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
            name: "isTextDocumentEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsShareLinkEnabled",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, n, "isMomentsFeedIdEnabled", 0, o, "isMomentsPostCreationEnabled", 0, c, "isMomentsShareLinkEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, a, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, r])
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
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-services-insights",
            name: "isServerLogStructuredStackTracesEnabled",
            defaultValue: !1
        });
    e.s(["isCsmExtendedMetricsEnabled", 0, n, "isServerLogStructuredStackTracesEnabled", 0, a])
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
    let n = (0, t.defineFlag)({
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsLayoutRefreshEnabled",
            defaultValue: !1
        });
    e.s(["isAcquisitionThumbnailUpsellEnabled", 0, n, "isHomeAcquisitionSignalsLayoutRefreshEnabled", 0, a])
}, 224223, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-engine-geometry",
        name: "enableMeshTextureApiRemoveIdVerification",
        defaultValue: !1
    });
    e.s(["enableMeshTextureApiRemoveIdVerification", 0, t])
}, 967230, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isAdsPageRedesignEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isManagedRewardedTabEnabled",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isInGameTemplatePlacementEnabled",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkLow",
            defaultValue: .01
        }),
        s = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "managedRewardedCtrBenchmarkHigh",
            defaultValue: .05
        }),
        o = (0, t.defineFlag)({
            namespace: "immersive-ads",
            name: "isRewardItemAnalyticsEnabled",
            defaultValue: !1
        });
    e.s(["isAdsPageRedesignEnabled", 0, n, "isInGameTemplatePlacementEnabled", 0, i, "isManagedRewardedTabEnabled", 0, a, "isRewardItemAnalyticsEnabled", 0, o, "managedRewardedCtrBenchmarkHigh", 0, s, "managedRewardedCtrBenchmarkLow", 0, r])
}, 199972, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "localization",
            name: "imageLocalizationSettingsEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "localization",
            name: "imageTranslationAllowlist",
            defaultValue: !1
        });
    e.s(["imageLocalizationSettingsEnabled", 0, n, "imageTranslationAllowlist", 0, a])
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
        s = (0, t.defineFlag)({
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "monetization",
            name: "isExperimentEligibilityEnabled",
            defaultValue: !1
        });
    e.s(["isExperimentEligibilityEnabled", 0, l, "isProductArchiveEnabled", 0, s, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, a, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, n, "mockShopItemsExternalEligibility", 0, o])
}, 100022, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "payouts",
        name: "enablePayoutWatermarkContributions",
        defaultValue: !0
    });
    e.s(["enablePayoutWatermarkContributions", 0, t])
}, 378089, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "talent-hub",
            name: "enableTalentHubV2",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "talent-hub",
            name: "enableTalentHubV2M2",
            defaultValue: !1
        });
    e.s(["enableTalentHubV2", 0, n, "enableTalentHubV2M2", 0, a])
}, 814984, e => {
    "use strict";
    let t = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        n = encodeURIComponent("studio/CollaborationSettings"),
        a = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                n = await fetch(e, {
                    credentials: "include"
                }),
                i = n.status % 100 * 100;
            if (!n.ok && 500 === i && t < 2) return await new Promise(e => {
                setTimeout(e, 2 ** (t + 1) * 500)
            }), a(e, t + 1);
            if (500 === i && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let r = await n.json();
            if ("object" != typeof r || null === r || !("access" in r)) throw Error('"access" not found in response');
            return r.access
        }, i = async () => await a("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(n, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["getAgeVerificationUpsellFeatureAccess", 0, i])
}, 904969, e => {
    "use strict";
    e.s(["AGE_VERIFICATION_UPSELL_BANNER_END_DATE", 0, "2030-01-01T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE", 0, "2026-01-21T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_START_DATE", 0, "2025-12-03T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693", "ESTABLISH_TRUST_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693"])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(458451),
        i = e.i(889311),
        r = e.i(823062),
        s = e.i(814984),
        o = e.i(904969);
    let l = "CreatorHub.AgeVerificationBannerSettings",
        c = async () => {
            localStorage.removeItem(l)
        }, u = async () => {
            let e, t = localStorage.getItem(l);
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
                return c(), !1
            }
            let n = new Date;
            return e.getFullYear() === n.getFullYear() && e.getMonth() === n.getMonth() && e.getDate() === n.getDate()
        }, d = async () => {
            localStorage.setItem(l, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, p = (0, n.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), m = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, f = async () => await (0, s.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: s
        } = e, [l, c] = (0, n.useState)(!0), [g, v] = (0, n.useState)("doNotShow"), {
            isFetched: h,
            user: y
        } = (0, a.useRobloxAuthentication)(), {
            unifiedLogger: b
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: w,
            isEnabled: A
        } = (0, n.useMemo)(() => {
            let e = m(o.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = m(o.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                n = m(o.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                a = new Date;
            return {
                isHighPriority: n <= a,
                isEnabled: e <= a && a < t
            }
        }, []), E = (0, n.useCallback)(async () => {
            await d(), c(!0)
        }, [c]);
        (0, n.useEffect)(() => {
            A && h && (null == y ? void 0 : y.id) && (async () => {
                let e = !1;
                try {
                    e = await u()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                c(e);
                let t = "doNotShow";
                try {
                    t = await f()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                v(t)
            })().catch(e => {
                b.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [A, h, y, b]);
        let S = (0, n.useMemo)(() => {
            let e = A && "doNotShow" !== g;
            return {
                isBannerVisible: e && !l,
                isBannerEligible: e,
                isHighPriority: w,
                variant: "doNotShow" !== g ? g : "ageVerification",
                dismissBanner: E
            }
        }, [A, g, l, w, E]);
        return (0, t.jsx)(p.Provider, {
            value: S,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, n.useContext)(p)], 906791)
}, 968439, e => {
    "use strict";
    var t, n = e.i(721281),
        a = e.i(280162),
        i = e.i(272593),
        r = ((t = {}).PrivacyPolicyUri = "privacyPolicyUri", t.TermsOfServiceUri = "termsOfServiceUri", t.Summary = "summary", t.Name = "name", t.CategoryJustification = "categoryJustification", t.VideoUri = "videoUri", t.RequestedCategory = "requestedCategory", t);
    let s = new class {
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
        o = (0, i.createClientConfiguration)("oauth", "bedev2"),
        l = new a.AuthorizationApi(o),
        c = new a.DiscoveryApi(o);
    e.s(["ApplicationAuthorizationsClient", 0, {
        authorizationApi: l,
        discoveryApi: c
    }, "EApplicationErrorResponseFields", () => r, "default", 0, s])
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
}, 28850, e => {
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
        },
        i = function() {
            return (i = Object.assign || function(e) {
                for (var t, n = 1, a = arguments.length; n < a; n++)
                    for (var i in t = arguments[n]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }).apply(this, arguments)
        };

    function r(e, t, n, a) {
        return new(n || (n = Promise))(function(i, r) {
            function s(e) {
                try {
                    l(a.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
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
                })).then(s, o)
            }
            l((a = a.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var n, a, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(l) {
                var c = [o, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (r = 0)), r;) try {
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

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, n.exists)(t, "created_at") ? new Date(t.created_at) : void 0,
            expiresAt: (0, n.exists)(t, "expires_at") ? new Date(t.expires_at) : void 0,
            id: (0, n.exists)(t, "id") ? t.id : void 0,
            universeId: (0, n.exists)(t, "universe_id") ? t.universe_id : void 0,
            values: (0, n.exists)(t, "values") ? function(e) {
                if (null == e) return e;
                if ("SelectGracePeriod" === e.type) return i(i({}, null == e ? e : {
                    decisionEventId: e.decision_event_id,
                    type: e.type,
                    version: e.version
                }), {
                    type: "SelectGracePeriod"
                });
                throw Error("No variant of CreatorAcknowledgmentValues exists with 'type=".concat(e.type, "'"))
            }(t.values) : void 0,
            visible: (0, n.exists)(t, "visible") ? t.visible : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, t) {
        return null == e ? e : {
            items: (0, n.exists)(e, "items") ? e.items.map(o) : void 0,
            nextCursor: (0, n.exists)(e, "next_cursor") ? e.next_cursor : void 0
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, n.exists)(t, "created_at") ? new Date(t.created_at) : void 0,
            id: (0, n.exists)(t, "id") ? t.id : void 0,
            policy: (0, n.exists)(t, "policy") ? t.policy : void 0,
            policyLabelKey: (0, n.exists)(t, "policy_label_key") ? t.policy_label_key : void 0
        }
    }
    var u = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function n() {
                    this.constructor = e
                }
                a(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
            }(t, e), t.prototype.creatorTransparencyServiceGetCreatorAcknowledgmentRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new n.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling creatorTransparencyServiceGetCreatorAcknowledgment.");
                                return a = {}, i = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/creator-acknowledgments/{id}",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetCreatorAcknowledgment = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetCreatorAcknowledgmentRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestrictionRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.contentId || void 0 === e.contentId) throw new n.RequiredError("contentId", "Required parameter requestParameters.contentId was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                if (null === e.contentType || void 0 === e.contentType) throw new n.RequiredError("contentType", "Required parameter requestParameters.contentType was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                return a = {}, void 0 !== e.contentId && (a.content_id = e.contentId), void 0 !== e.contentType && (a.content_type = e.contentType), i = {}, [4, this.request({
                                    path: "/v1/restriction",
                                    schemaPath: "/v1/restriction",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        isRestricted: (0, n.exists)(e, "is_restricted") ? e.is_restricted : void 0,
                                        restrictionMessage: (0, n.exists)(e, "restriction_message") ? e.restriction_message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestriction = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetRestrictionRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgmentsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return a = {}, void 0 !== e.cursor && (a.cursor = e.cursor), void 0 !== e.limit && (a.limit = e.limit), i = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments",
                                    schemaPath: "/v1/creator-acknowledgments",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgments = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseCreatorAcknowledgments.");
                                return a = {}, void 0 !== e.cursor && (a.cursor = e.cursor), void 0 !== e.limit && (a.limit = e.limit), i = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/creator-acknowledgments".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/creator-acknowledgments",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgments = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolationsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new n.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseViolations.");
                                return a = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/violations".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/violations",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        items: (0, n.exists)(e, "items") ? e.items.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolations = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
                        switch (n.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseViolationsRaw(e, t)];
                            case 1:
                                return [4, n.sent().value()];
                            case 2:
                                return [2, n.sent()]
                        }
                    })
                })
            }, t
        }(n.BaseAPI),
        d = e.i(272593);
    let p = new class {
        async getRestriction(e, t, n) {
            return this.api.creatorTransparencyServiceGetRestriction({
                contentId: e,
                contentType: t
            }, n)
        }
        async listCreatorAcknowledgments(e, t, n) {
            return this.api.creatorTransparencyServiceListCreatorAcknowledgments({
                cursor: e,
                limit: t
            }, n)
        }
        async listUniverseCreatorAcknowledgments(e, t, n, a) {
            return this.api.creatorTransparencyServiceListUniverseCreatorAcknowledgments({
                universeId: e,
                cursor: t,
                limit: n
            }, a)
        }
        async listUniverseViolations(e, t) {
            return this.api.creatorTransparencyServiceListUniverseViolations({
                universeId: e
            }, t)
        }
        constructor() {
            (0, t._)(this, "api", void 0);
            const e = (0, d.createClientConfiguration)("creator-transparency-service", "bedev2");
            this.api = new u(e)
        }
    };
    e.s(["default", 0, p], 28850)
}, 66424, 873001, e => {
    "use strict";
    var t = e.i(887317),
        n = e.i(721281),
        a = e.i(677753);
    class i extends Error {
        constructor(e, t, a) {
            super("Creator Wallets API error: ".concat(e, " ").concat(t)), (0, n._)(this, "status", void 0), (0, n._)(this, "statusText", void 0), (0, n._)(this, "body", void 0), this.name = "CreatorWalletsApiError", this.status = e, this.statusText = t, this.body = a
        }
    }
    let r = new Set(Object.values(t.KycPrerequisite).filter(e => e !== t.KycPrerequisite.Invalid));

    function s(e) {
        return "object" == typeof e && null !== e
    }

    function o(e) {
        return "string" == typeof e && r.has(e)
    }
    async function l(e) {
        try {
            return await e
        } catch (e) {
            if (e instanceof a.ResponseError || e instanceof Error && "ResponseError" === e.name && "response" in e && e.response instanceof Response) {
                let t;
                try {
                    t = await e.response.clone().json()
                } catch (e) {
                    t = null
                }
                throw new i(e.response.status, e.response.statusText, t)
            }
            throw e
        }
    }
    e.s(["g", 0, function(e) {
        if (!(e instanceof i) || !s(e.body)) return null;
        let {
            details: t
        } = e.body;
        if (!Array.isArray(t)) return null;
        for (let e of t) {
            if (!s(e) || !Array.isArray(e.unmetPrerequisites)) continue;
            let t = e["@type"];
            if ("string" == typeof t && !t.endsWith(".KycPrerequisitesNotMet")) continue;
            let n = e.unmetPrerequisites.filter(o);
            if (n.length > 0) return n
        }
        return null
    }, "m", 0, function(e) {
        var t, n;
        return e && (void 0 !== e.units || void 0 !== e.attos) ? (null != (t = e.units) ? t : 0) + (null != (n = e.attos) ? n : 0) / 1e18 : null
    }, "w", 0, l], 873001);
    var c = e.i(272593);
    let u = new t.CreatorWalletsAPIApi((0, c.createClientConfiguration)("creator-wallets", "bedev2"));

    function d(e) {
        if (void 0 === e) return;
        if (!/^[1-9]\d*$/.test(e)) throw TypeError("Creator Wallet group id must be a positive integer");
        let t = Number(e);
        if (!Number.isSafeInteger(t)) throw TypeError("Creator Wallet group id must be a safe integer");
        return t
    }
    e.s(["default", 0, {
        getOnboardingState(e, t) {
            let n = d(e);
            return l(void 0 === n ? u.v1SelfOnboardingStateGet({}, t) : u.v1GroupCreatorWalletIdGroupIdOnboardingStateGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        getOnboardingRequirements: e => l(u.v1SelfOnboardingRequirementsGet({}, e)),
        selectOnboardingAccountType: e => l(u.v1SelfOnboardingAccountTypeselectPost({
            selectOnboardingAccountTypeRequest: e
        })),
        acceptOnboardingTerms: e => l(u.v1SelfOnboardingTermsacceptPost({
            acceptOnboardingTermsRequest: e
        })),
        deleteOnboardingDraft: () => l(u.v1SelfOnboardingDraftDelete({})),
        getWalletBalance(e, t) {
            let n = d(e);
            return l(void 0 === n ? u.v1SelfWalletBalanceGet({}, t) : u.v1GroupCreatorWalletIdGroupIdWalletBalanceGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        getWalletEarningsEstimate(e, t) {
            let n = d(e);
            return l(void 0 === n ? u.v1SelfWalletEarningsEstimateGet({}, t) : u.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        listBeneficiaries(e, t, n) {
            let a = d(e),
                i = (null == n ? void 0 : n.includeArchived) ? {
                    includeArchived: !0
                } : {};
            return l(void 0 === a ? u.v1SelfWalletBeneficiariesGet(i, t) : u.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet({
                creatorWalletIdGroupId: a,
                ...i
            }, t))
        },
        initializeKycEmbedding(e, t) {
            let n = d(t);
            return l(void 0 === n ? u.v1SelfOnboardingKycEmbeddinginitializePost({
                initializeKycEmbeddingRequest: e
            }) : u.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeKycEmbeddingRequest: e
            }))
        },
        initializeKycRfiEmbedding(e, t) {
            let n = d(t);
            return l(void 0 === n ? u.v1SelfOnboardingKycRfiEmbeddinginitializePost({
                initializeKycRfiEmbeddingRequest: e
            }) : u.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeKycRfiEmbeddingRequest: e
            }))
        },
        async initializeBeneficiaryEmbedding(e, t) {
            let n = d(t);
            return function(e) {
                let {
                    clientId: t,
                    authCode: n
                } = e;
                if ("string" != typeof t || "string" != typeof n) throw TypeError("InitializeBeneficiaryEmbedding returned an unexpected payload");
                return {
                    clientId: t,
                    authCode: n
                }
            }(await l(void 0 === n ? u.v1SelfWalletBeneficiaryEmbeddinginitializePost({
                initializeBeneficiaryEmbeddingRequest: e
            }) : u.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeBeneficiaryEmbeddingRequest: e
            })))
        },
        async saveBeneficiary(e, t) {
            let n = d(t);
            return function(e) {
                let {
                    beneficiary: t
                } = e;
                if (!t || "string" != typeof t.beneficiaryId) throw TypeError("SaveBeneficiary returned an unexpected payload");
                return t
            }(await l(void 0 === n ? u.v1SelfWalletBeneficiariesPost({
                saveBeneficiaryRequest: e
            }) : u.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost({
                creatorWalletIdGroupId: n,
                saveBeneficiaryRequest: e
            })))
        },
        archiveBeneficiary(e, t) {
            let n = d(t);
            return l(void 0 === n ? u.v1SelfWalletBeneficiariesBeneficiaryIdDelete({
                beneficiaryId: e
            }) : u.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete({
                creatorWalletIdGroupId: n,
                beneficiaryId: e
            }))
        },
        initiateWithdrawal(e, t) {
            let n = d(t);
            return l(u.v1WalletWithdrawalsPost({
                initiateWithdrawalRequest: {
                    ...e,
                    creatorWalletId: void 0 === n ? e.creatorWalletId : {
                        ...e.creatorWalletId,
                        groupId: n
                    }
                }
            }))
        }
    }], 66424)
}, 196990, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(142330),
        a = e.i(272593);
    let i = new class {
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
            })).filter(e => e.regulationType !== n.RegulationType.Luobu)
        }
        getUserAgreements(e) {
            return this.agreementResolutionApi.agreementResolutionGetByContext(e)
        }
        constructor() {
            (0, t._)(this, "agreementResolutionApi", void 0), (0, t._)(this, "acceptanceApi", void 0);
            const e = (0, a.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new n.AgreementResolutionApi(e), this.acceptanceApi = new n.AcceptanceApi(e)
        }
    };
    e.s(["userAgreementsClient", 0, i])
}, 790806, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(176936),
        a = e.i(272593);
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
            searchUsers(e, t, n) {
                return this.userSearchApi.v1UsersSearchGet({
                    keyword: e,
                    limit: t,
                    cursor: n
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
                const e = (0, a.createClientConfiguration)("users", "bedev1");
                this.displayNameApi = new n.DisplayNamesApi(e), this.usersApi = new n.UsersApi(e), this.userSearchApi = new n.UserSearchApi(e)
            }
        },
        r = new n.UsersApi((0, a.createClientConfiguration)("users", "bedev1"));
    e.s(["UsersClient", 0, {
        usersApi: r
    }, "default", 0, i])
}, 950492, e => {
    "use strict";
    let t = async e => {
        let t, {
                api: n,
                getItems: a,
                getPageToken: i
            } = e,
            r = [];
        do {
            let e = await n(t);
            r = r.concat(a(e)), t = i(e)
        } while (t) return r
    };
    e.s(["default", 0, t])
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
        s = (e, t, n) => null == e && null == t || e === t ? 0 : null == e ? 1 : null == t ? -1 : null != n && (n.includes(e) || n.includes(t)) ? n.includes(e) && n.includes(t) ? n.indexOf(e) - n.indexOf(t) : n.includes(e) ? -1 : 1 : e.localeCompare(t),
        o = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : r,
                n = Object.keys(t);
            return e.sort((e, t) => s(e.notificationCategoryName, t.notificationCategoryName, n))
        },
        l = function(e, t) {
            let n = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : r,
                a = n[e];
            return t.sort((e, t) => s(e.notificationType, t.notificationType, a))
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
            user: s
        } = (0, a.useAuthentication)(), [u, d] = (0, n.useState)([]), [p, m] = (0, n.useState)(!1), [f, g] = (0, n.useState)(!0), [v, h] = (0, n.useState)(!1), y = (0, n.useCallback)(async () => {
            if (!p && (null == s ? void 0 : s.id) != null) try {
                h(!1), g(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(s.id.toString()),
                    t = (e => {
                        for (let a of (o(e), e)) {
                            var t, n;
                            l(null != (t = a.notificationCategoryName) ? t : "", null != (n = a.notifications) ? n : [])
                        }
                        return e
                    })(e.categories || []);
                d(t), m(!0)
            } catch (e) {
                h(!0), m(!1)
            } finally {
                g(!1)
            }
        }, [null == s ? void 0 : s.id, p]), b = (0, n.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: v,
            notificationSettingsContextLoading: f,
            getNotificationSettings: y,
            setNotificationSettings: d
        }), [u, v, y, f, p]);
        return (0, t.jsx)(c.Provider, {
            value: b,
            children: r
        })
    }], 354088)
}, 945451, 330159, 641831, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(533414),
        a = e.i(814975);
    let i = e => () => {
            var i;
            let {
                user: r
            } = (0, a.useAuthentication)(), s = "".concat(e, ".").concat(null != (i = null == r ? void 0 : r.id) ? i : "anonymous"), [o, l] = (0, n.useLocalStorage)(s, []);
            return {
                dismissAcks: (0, t.useCallback)(e => {
                    l(t => [...new Set([...t, ...e.map(e => {
                        var t;
                        return null != (t = e.id) ? t : ""
                    })])])
                }, [l]),
                filterAcks: (0, t.useMemo)(() => {
                    let e = new Set(o);
                    return t => t.filter(t => {
                        var n;
                        return !e.has(null != (n = t.id) ? n : "")
                    })
                }, [o])
            }
        },
        r = i("creatorTransparencyAcknowledgments.dismissed.overlay"),
        s = i("creatorTransparencyAcknowledgments.dismissed.banner");
    e.s(["useBannerAcknowledgmentsLocalStorage", 0, s, "useOverlayAcknowledgmentsLocalStorage", 0, r], 945451);
    let o = e => {
        if (!(!(e instanceof Date) || Number.isNaN(e.getTime()))) return e.toISOString()
    };
    e.s(["default", 0, (e, t) => {
        let n = o(e.createdAt),
            a = o(e.expiresAt),
            i = {};
        return e.id && (i.acknowledgmentId = e.id), n && (i.createdAt = n), a && (i.expiresAt = a), t.decisionEventId && (i.decisionEventId = t.decisionEventId), e.universeId && (i.universeId = e.universeId.toString()), i
    }], 330159), e.s(["default", 0, e => "https://".concat("roblox.com", "/safety-dashboard#/violations/").concat(encodeURIComponent(e))], 641831)
}, 911502, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(589624),
        i = e.i(79187),
        r = e.i(814975),
        s = e.i(607204),
        o = e.i(581548),
        l = e.i(881670),
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(748893),
        p = e.i(226519),
        m = e.i(976457),
        f = e.i(668539),
        g = e.i(345886),
        v = e.i(623983),
        h = e.i(697973),
        y = e.i(990729),
        b = e.i(156071),
        w = e.i(790806),
        A = e.i(759283),
        E = e.i(384340);
    let S = (0, h.makeStyles)()(() => ({
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
        C = (0, i.withTranslation)(e => {
            let {
                open: a,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, E.default)(), {
                classes: {
                    dialogTitle: h,
                    dialogContent: C,
                    dialogSubActions: I
                }
            } = S(), {
                enqueue: T,
                close: x
            } = (0, y.useSnackbar)(), R = (0, n.useCallback)(e => {
                T({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: A.toastDurationTime,
                    autoHide: !0,
                    onClose: x
                })
            }, [T, x]), [P, k] = (0, n.useState)(), [U, N] = (0, n.useState)(), [_, L] = (0, n.useState)(), [O, V] = (0, n.useState)(), B = (0, n.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await w.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    L(e.name), V(!1)
                } catch (e) {
                    V(!0)
                }
            }, [l]), G = (0, n.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await b.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    k(null == e ? void 0 : e.name)
                } catch (e) {
                    R(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, R, c]);
            (0, n.useEffect)(() => {
                B(), G()
            }, [G, B]);
            let F = (0, n.useCallback)(() => {
                    r(void 0)
                }, [r]),
                D = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        N(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            R(c("Error.DecliningInvitation")), N(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]),
                q = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        N(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            R(c("Error.AcceptingInvitation")), N(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                children: [(0, t.jsx)(f.DialogContent, {
                    className: C,
                    children: (0, t.jsxs)(g.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(g.Grid, {
                            container: !0,
                            children: (0, t.jsx)(v.Typography, {
                                variant: "h4",
                                className: h,
                                children: c("Label.JoinOrganization", {
                                    organizationName: null != P ? P : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(g.Grid, {
                            container: !0,
                            children: (0, t.jsx)(v.Typography, {
                                variant: "body1",
                                children: O ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != _ ? _ : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    children: (0, t.jsxs)(g.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: F,
                            disabled: U,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(g.Grid, {
                            className: I,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: D,
                                disabled: U,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: q,
                                loading: U,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        I = (0, h.makeStyles)()(() => ({
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
                invitation: s,
                accepted: o
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: h
                }
            } = I(), [y, b] = (0, n.useState)(), [A, E] = (0, n.useState)(), S = (0, n.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await w.default.getUserById(Number.parseInt(s.senderUserId, 10));
                    b(e.name), E(!1)
                } catch (e) {
                    E(!0)
                }
            }, [s]);
            (0, n.useEffect)(() => {
                S()
            }, [S]);
            let C = (0, n.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                onClose: r,
                children: [(0, t.jsx)(f.DialogContent, {
                    className: u,
                    children: (0, t.jsxs)(g.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(v.Typography, {
                            variant: "h4",
                            className: c,
                            children: l(o ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(v.Typography, {
                            variant: "body1",
                            children: o ? (0, t.jsx)(t.Fragment, {
                                children: A ? l("Message.InvitationAcceptedWithoutUsername") : l("Message.InvitationAccepted", {
                                    username: null != y ? y : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: A ? l("Message.InvitationDeclinedWithoutUsername") : l("Message.InvitationDeclined", {
                                    username: null != y ? y : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    className: h,
                    children: (0, t.jsx)(g.Grid, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.Button, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: C,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]);
    var x = e.i(582977),
        R = e.i(672401);
    let P = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, a.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: m
        } = (0, c.default)(), [f, g] = (0, n.useState)(), [v, h] = (0, n.useState)(), [y, b] = (0, n.useState)(), [w, A] = (0, n.useState)(!1), [E, S] = (0, n.useState)(!1), [I, P] = (0, n.useState)(), [k, U] = (0, n.useState)(!1), N = null == d ? void 0 : d.id, _ = (0, n.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : m
        }, [p, m]), L = l.query[x.InviteQueryKey], O = l.isReady, V = (0, n.useCallback)(() => {
            a.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), B = (0, n.useCallback)(async e => {
            if (!N) return void b(null);
            try {
                let t = await s.default.userClient.getUserInvitationByOrganization(e, N.toString());
                b(t)
            } catch (e) {
                b(null), V()
            }
        }, [N, V]), G = (0, n.useCallback)(async e => {
            if (!N) return void h(null);
            try {
                let t = await s.default.userClient.getUserPermissions(e, N.toString());
                h(t)
            } catch (e) {
                h(null)
            }
        }, [N]), F = (0, n.useCallback)(async () => {
            if (O) {
                S(!0);
                try {
                    if ("string" == typeof L) return void await B(L);
                    if (!_) return void g(null);
                    if (b(null), _) {
                        let e = await s.default.organizationClient.getOrganization(_.toString());
                        g(e), await G(e.id)
                    } else g(void 0);
                    A(!1)
                } catch (e) {
                    g(null), h(null), b(null)
                } finally {
                    S(!1)
                }
            }
        }, [_, B, G, L, O]), D = (0, n.useCallback)(() => {
            A(!0), F()
        }, [F]), q = (0, n.useCallback)(async () => {
            (null == f ? void 0 : f.id) && await G(null == f ? void 0 : f.id)
        }, [G, null == f ? void 0 : f.id]), M = (0, n.useMemo)(() => ({
            organization: f,
            permissions: v,
            refreshOrganization: D,
            refreshPermission: q,
            isOrganizationRefreshRequired: w,
            isOrganizationLoading: E
        }), [f, v, D, q, w, E]);
        return (0, n.useEffect)(() => {
            F()
        }, [F]), (0, t.jsx)(R.default.Provider, {
            value: M,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(C, {
                        open: y.invitationStatusType === o.InvitationStatusType.Open && void 0 === I,
                        onClose: e => {
                            !0 === e ? (P(!0), U(!0)) : !1 === e ? (P(!1), U(!0)) : (V(), b(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(T, {
                        open: k,
                        onClose: () => {
                            U(!1), !0 === I && D(), V()
                        },
                        invitation: y,
                        accepted: !0 === I
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, P], 911502)
}, 748411, e => {
    "use strict";
    var t = e.i(157310),
        n = e.i(773057);
    e.s(["useUniverseDetailsQuery", 0, e => (0, t.useQuery)({
        queryKey: ["universeDetails", e],
        queryFn: () => {
            if (void 0 === e || !Number.isFinite(e)) throw Error("universeId is required");
            return n.default.getUniverseDetails(e)
        },
        enabled: void 0 !== e && Number.isFinite(e),
        staleTime: 3e5,
        refetchOnMount: !1
    })])
}, 758835, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(589624);
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
}, 839165, e => {
    "use strict";
    var t = e.i(677753);
    class n extends t.BaseAPI {
        get(e) {
            return this.request({
                headers: {},
                method: "GET",
                path: e,
                schemaPath: e
            }).then(e => new t.JSONApiResponse(e).value())
        }
        post(e, n) {
            return this.request({
                body: n,
                headers: n ? {
                    "Content-Type": "application/json"
                } : {},
                method: "POST",
                path: e,
                schemaPath: e
            }).then(e => new t.JSONApiResponse(e).value())
        }
        postWithoutResponse(e, n) {
            return this.request({
                body: n,
                headers: n ? {
                    "Content-Type": "application/json"
                } : {},
                method: "POST",
                path: e,
                schemaPath: e
            }).then(e => new t.VoidApiResponse(e).value())
        }
    }
    let a = new n(new t.Configuration({
        basePath: "",
        credentials: "include",
        robloxSiteDomain: "roblox.com"
    }));
    e.s(["authenticatedHttpGet", 0, e => a.get(e), "authenticatedHttpPost", 0, (e, t) => a.post(e, t), "authenticatedHttpPostWithoutResponse", 0, (e, t) => a.postWithoutResponse(e, t)])
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
}, 407881, 616931, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(589624),
        i = e.i(142330);
    let r = {
            [i.AgreementType.ChildrenPrivacyPolicy]: "Label.ChildrenPrivacyPolicy",
            [i.AgreementType.ConsentFlow]: "Label.ConsentFlow",
            [i.AgreementType.LuobuThirdPartyDataUse]: "Label.LuobuThirdPartyDataUse",
            [i.AgreementType.PersonalInformationPolicy]: "Label.PersonalInformationPolicy",
            [i.AgreementType.PrivacyPolicy]: "Label.PrivacyPolicy",
            [i.AgreementType.RefundTerms]: "Label.RefundTerms",
            [i.AgreementType.RiderTerms]: "Label.RiderTerms",
            [i.AgreementType.TermsOfService]: "Label.TermsOfService"
        },
        s = ["/v1-studio-login"];
    e.s(["agreementsTranslationMap", 0, r, "dontShowAgreementPaths", 0, s, "maxUpdateRetryCount", 0, 3], 616931);
    let o = (0, n.createContext)({
        isPending: !1,
        completeCheck: () => {}
    });
    e.s(["default", 0, e => {
        let {
            children: i
        } = e, {
            pathname: r
        } = (0, a.useRouter)(), [l, c] = (0, n.useState)(!0), u = (0, n.useCallback)(() => c(!1), []), d = s.some(e => r.startsWith(e)), p = (0, n.useMemo)(() => ({
            isPending: l && !d,
            completeCheck: u
        }), [l, d, u]);
        return (0, t.jsx)(o.Provider, {
            value: p,
            children: i
        })
    }, "useUserAgreementCheck", 0, () => (0, n.useContext)(o)], 407881)
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
        hi_in: t.Locale.Hindi,
        nl_nl: t.Locale.Dutch
    };
    class i extends t.CdnTranslationResourceProvider {
        async loadRuntimeLocaleInfo() {
            let {
                generalExperience: e
            } = await n.default.getUserLocalizationLocusSupportedLocales(), i = null == e ? void 0 : e.locale;
            if (void 0 === i) return this.defaultLocaleInfo;
            if (i in a) {
                let e = a[i];
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
        s = e.i(811683);
    let o = t.Locale.English,
        l = t.NativeName.English,
        c = o === t.Locale.SimplifiedChinese ? s.default : r.default;
    e.s(["defaultLocale", 0, o, "defaultMetadataJson", 0, c, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 142330, e => {
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

    function a(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function a() {
            this.constructor = e
        }
        n(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
    }

    function i(e, t, n, a) {
        return new(n || (n = Promise))(function(i, r) {
            function s(e) {
                try {
                    l(a.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
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
                })).then(s, o)
            }
            l((a = a.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var n, a, i, r = {
                label: 0,
                sent: function() {
                    if (1 & i[0]) throw i[1];
                    return i[1]
                },
                trys: [],
                ops: []
            },
            s = Object.create(("function" == typeof Iterator ? Iterator : Object).prototype);
        return s.next = o(0), s.throw = o(1), s.return = o(2), "function" == typeof Symbol && (s[Symbol.iterator] = function() {
            return this
        }), s;

        function o(o) {
            return function(l) {
                var c = [o, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (r = 0)), r;) try {
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

    function s(e) {
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

    function o(e) {
        var n;
        return null == (n = e) ? n : {
            id: n.id,
            agreementType: n.agreementType,
            clientType: n.clientType,
            regulationType: n.regulationType,
            displayUrl: n.displayUrl,
            agreementBodyText: (0, t.exists)(n, "agreementBodyText") ? n.agreementBodyText : void 0
        }
    }

    function l(e) {
        if (void 0 !== e) return null === e ? null : {
            agreementId: e.agreementId
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            acceptances: e.acceptances.map(l)
        }
    }

    function u(e) {
        var n;
        return null == (n = e) ? n : {
            errorCode: (0, t.exists)(n, "errorCode") ? n.errorCode : void 0,
            message: (0, t.exists)(n, "message") ? n.message : void 0,
            agreementId: n.agreementId
        }
    }

    function d(e, n) {
        return null == e ? e : {
            results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(u) : void 0
        }
    }
    var p = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.acceptanceDeleteRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var a, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
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
                                }, n)];
                            case 1:
                                return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return null == e ? e : {
                                        errorCode: (0, t.exists)(e, "errorCode") ? e.errorCode : void 0,
                                        message: (0, t.exists)(e, "message") ? e.message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.acceptanceDelete = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(n) {
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
            }, n.prototype.acceptanceGetByUserIdRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var a, i, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceGetByUserId.");
                                return a = {}, i = {}, [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, n)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(s) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, n.prototype.acceptanceGetByUserId = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(n) {
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
            }, n.prototype.acceptanceInsertRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var a, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return a = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "POST",
                                    headers: i,
                                    query: a,
                                    body: c(e.insertAcceptancesRequest)
                                }, n)];
                            case 1:
                                return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, n.prototype.acceptanceInsert = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(n) {
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
            }, n.prototype.acceptanceInsertByUserIdRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var a, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceInsertByUserId.");
                                return a = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "POST",
                                    headers: i,
                                    query: a,
                                    body: c(e.insertAcceptancesRequest)
                                }, n)];
                            case 1:
                                return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, n.prototype.acceptanceInsertByUserId = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(n) {
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
            }, n
        }(t.BaseAPI),
        m = function(e) {
            function n() {
                return null !== e && e.apply(this, arguments) || this
            }
            return a(n, e), n.prototype.agreementResolutionGetByContextRaw = function(e, n) {
                return i(this, void 0, void 0, function() {
                    var a, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.clientType || void 0 === e.clientType) throw new t.RequiredError("clientType", "Required parameter requestParameters.clientType was null or undefined when calling agreementResolutionGetByContext.");
                                return a = {}, i = {}, [4, this.request({
                                    path: "/v1/agreements-resolution/{clientType}".replace("{".concat("clientType", "}"), encodeURIComponent(String(e.clientType))),
                                    schemaPath: "/v1/agreements-resolution/{clientType}",
                                    method: "GET",
                                    headers: i,
                                    query: a
                                }, n)];
                            case 1:
                                return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return e.map(o)
                                })]
                        }
                    })
                })
            }, n.prototype.agreementResolutionGetByContext = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(n) {
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
            }, n
        }(t.BaseAPI);
    e.s(["AcceptanceApi", 0, p, "AgreementResolutionApi", 0, m, "AgreementType", 0, {
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
    }, "RegulationType", 0, {
        Global: "Global",
        Luobu: "Luobu",
        Europe: "Europe",
        SouthKorea: "SouthKorea"
    }])
}, 842051, e => {
    "use strict";
    var t = e.i(75584),
        n = e.i(41466),
        a = e.i(408832),
        i = e.i(607895),
        r = e.i(225032),
        s = e.i(197649),
        o = e.i(416340);
    let l = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        c = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        u = {
            Info: "stroke-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-emphasis",
            Error: "stroke-system-alert"
        },
        d = {
            Info: "rgb(from var(--color-system-neutral) r g b / 0.1)",
            Warning: "rgb(from var(--color-system-warning) r g b / 0.16)",
            Success: "rgb(from var(--color-system-success) r g b / 0.1)",
            Error: "rgb(from var(--color-system-alert) r g b / 0.16)"
        },
        p = e => {
            let {
                label: t,
                href: a,
                linkTarget: i,
                onAction: r,
                variant: s
            } = e;
            return i ? o.default.createElement(n.Button, {
                asChild: !0,
                size: "Small",
                variant: s,
                onClick: r
            }, o.default.cloneElement(i, {}, t)) : a ? o.default.createElement(n.Button, {
                as: "a",
                href: a,
                size: "Small",
                variant: s,
                onClick: r
            }, t) : o.default.createElement(n.Button, {
                size: "Small",
                variant: s,
                onClick: r
            }, t)
        },
        m = e => {
            let {
                label: t,
                href: n,
                linkTarget: a,
                onAction: r
            } = e;
            return a ? o.default.createElement(i.Link, {
                asChild: !0,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, o.default.cloneElement(a, {}, t)) : n ? o.default.createElement(i.Link, {
                href: n,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t) : o.default.createElement(i.Link, {
                as: "button",
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, t)
        },
        f = (0, o.forwardRef)((e, n) => {
            let {
                children: i,
                variant: f = "System",
                severity: g = "Info",
                primaryActionLabel: v,
                primaryActionHref: h,
                primaryActionLinkTarget: y,
                onPrimaryAction: b,
                secondaryActionLabel: w,
                secondaryActionHref: A,
                secondaryActionLinkTarget: E,
                onSecondaryAction: S,
                hasCloseAffordance: C = !0,
                closeLabel: I = "Dismiss alert",
                onDismiss: T,
                className: x,
                style: R,
                ...P
            } = e, k = (0, a.default)("foundation-web-alert-message-"), U = !!v, N = !!w, _ = !!(C && T), L = "Feedback" === f && (U || N || _), O = "Warning" === g || "Error" === g ? "alert" : "status", V = null;
            U && (V = N ? o.default.createElement(p, {
                label: v || "",
                href: h,
                linkTarget: y,
                onAction: b,
                variant: "Standard"
            }) : o.default.createElement(m, {
                label: v || "",
                href: h,
                linkTarget: y,
                onAction: b
            }));
            let B = N ? o.default.createElement(p, {
                label: w || "",
                href: A,
                linkTarget: E,
                onAction: S,
                variant: "Utility"
            }) : null;
            return o.default.createElement("div", {
                ref: n,
                role: L ? "region" : O,
                "aria-labelledby": L ? k : void 0,
                className: (0, s.default)("foundation-web-alert relative width-full stroke-standard", "System" === f ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", u[g], x),
                ...P
            }, o.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, s.default)("absolute inset-[0] pointer-events-none", "Feedback" === f && "radius-medium"),
                style: {
                    backgroundColor: d[g]
                }
            }), o.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, o.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, o.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== g && o.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), o.default.createElement(t.Icon, {
                "aria-hidden": "true",
                name: l[g],
                size: "Medium",
                className: "relative",
                style: {
                    color: c[g]
                }
            }))), o.default.createElement("div", {
                className: (0, s.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", N ? "flex-col" : "wrap")
            }, o.default.createElement("div", {
                id: L ? k : void 0,
                role: L ? O : void 0,
                className: (0, s.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", N ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, i), (V || B) && o.default.createElement("div", {
                className: (0, s.default)("flex items-center gap-small wrap shrink-0", !N && "padding-y-[var(--size-150)]")
            }, V, B)), _ && o.default.createElement(r.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": I,
                onClick: T
            })))
        });
    e.s(["Alert", 0, f])
}, 607895, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340),
        a = e.i(23342);
    let i = new Set(["_self", "_parent", "_top"]),
        r = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        s = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        o = (0, n.forwardRef)((e, o) => {
            var l, c, u;
            let {
                children: d,
                className: p,
                size: m,
                color: f = "Emphasis",
                variant: g = "Standalone",
                underline: v = "hover",
                isExternal: h,
                asChild: y,
                ...b
            } = e, w = (c = null != (l = b.as) ? l : "a", u = "button" === b.as ? void 0 : b.target, void 0 !== h ? h : "button" !== c && void 0 !== u && !i.has(u)), A = (0, t.default)("foundation-web-link", "button" === b.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || w) && "inline-flex items-center gap-xsmall", void 0 !== m && r[m], s[f], "always" === v ? "underline" : "no-underline", "hover" === v && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", p), E = w ? n.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (y) {
                let {
                    as: e,
                    ...t
                } = b, i = n.default.Children.only(d);
                return n.default.isValidElement(i) ? n.default.createElement(a.Slot, {
                    ref: o,
                    ...t,
                    className: A
                }, n.default.cloneElement(i, {}, n.default.createElement(n.default.Fragment, null, i.props.children, E))) : null
            }
            if ("button" === b.as) {
                let {
                    as: e,
                    type: t,
                    ...a
                } = b;
                return n.default.createElement("button", {
                    ref: o,
                    type: null != t ? t : "button",
                    ...a,
                    className: A
                }, d, E)
            }
            let {
                as: S,
                ...C
            } = b;
            return n.default.createElement("a", {
                ref: o,
                ...C,
                className: A
            }, d, E)
        });
    o.displayName = "Link", e.s(["Link", 0, o])
}, 818170, e => {
    "use strict";
    var t = e.i(197649),
        n = e.i(416340);
    let a = "text-label-medium",
        i = n.default.forwardRef((e, i) => {
            let {
                className: r,
                variant: s = "Determinate",
                value: o = 0,
                minValue: l,
                maxValue: c,
                valuesLocation: u = "None",
                ariaLabel: d,
                ...p
            } = e, m = "Determinate" === s, f = Math.min(100, Math.max(0, o)), g = m && void 0 !== l && "None" !== u, v = m && void 0 !== c && "None" !== u, h = "Sides" === u, y = n.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", h ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: h ? {
                    flexBasis: 0
                } : void 0
            }, m ? n.default.createElement("div", {
                className: "absolute top-0 left-0 height-100 radius-circle transition-all duration-300 ease-out",
                style: {
                    width: "".concat(f, "%"),
                    backgroundColor: "var(--fui-future-alpha-color-system-progress)"
                }
            }) : n.default.createElement("div", {
                className: "foundation-web-progress-bar-indeterminate absolute top-0 height-100 radius-circle"
            })), b = g && n.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", a),
                "aria-hidden": "true"
            }, l), w = v && n.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", a),
                "aria-hidden": "true"
            }, c), A = (g || v) && n.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, g ? b : n.default.createElement("span", null), v ? w : n.default.createElement("span", null));
            return n.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": m ? 0 : void 0,
                "aria-valuemax": m ? 100 : void 0,
                "aria-valuenow": m ? f : void 0,
                ...p
            }, h ? n.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, b, y, w) : n.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === u && A, y, "Bottom" === u && A))
        });
    i.displayName = "ProgressBar", e.s(["ProgressBar", 0, i])
}, 967457, e => {
    "use strict";
    var t = e.i(990729);
    e.s(["SnackbarProvider", () => t.default])
}, 200400, 483939, e => {
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
        n = new Set(["voice"]),
        a = (e, t) => "".concat(e).concat("/v1/not-approved", "?abuseVector=").concat(encodeURIComponent(t)),
        i = e => "".concat(e).concat("/v1/dismiss-intervention");
    e.s(["getAppealsPortalUrl", 0, e => new URL("/report-appeals", e).toString(), "getDismissInterventionUrl", 0, i, "getModerationDetailUrl", 0, a, "getRegistryEntry", 0, function(e) {
        if (Object.hasOwn(t, e)) return t[e]
    }, "getSafetyDashboardAppealsUrl", 0, e => new URL("/safety-dashboard", e).toString(), "isOverrideBackedAbuseVector", 0, function(e) {
        return n.has(e)
    }], 483939);
    var r = e.i(416340),
        s = e.i(221628),
        o = (0, r.createContext)(void 0);
    e.s(["UniversalFeatureRestrictionsProvider", 0, e => {
        let {
            Surface: t,
            children: n
        } = e, [{
            request: a,
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
        return (0, s.jsxs)(o.Provider, {
            value: d,
            children: [n, a && (0, s.jsx)(t, {
                request: a,
                open: i,
                onDismiss: u
            })]
        })
    }, "createUniversalFeatureRestrictionsApi", 0, function(e) {
        let {
            httpGet: t,
            httpPost: n,
            userModerationApiUrl: r
        } = e;
        return {
            fetchModerationDetail: e => t(a(r, e)),
            dismissIntervention: e => n(i(r), {
                intervention_id: e
            })
        }
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 200400)
}, 822092, e => {
    "use strict";
    let t;
    e.s(["c", 0, e => {
        t = e.unifiedLogger
    }, "g", 0, () => t])
}, 929036, e => {
    "use strict";
    var t = "u" > typeof globalThis ? globalThis : window;
    e.s(["a", 0, function(e) {
        return e && e.__esModule && Object.prototype.hasOwnProperty.call(e, "default") ? e.default : e
    }, "c", 0, t, "g", 0, function(e) {
        if (Object.prototype.hasOwnProperty.call(e, "__esModule")) return e;
        var t = e.default;
        if ("function" == typeof t) {
            var n = function e() {
                var n = !1;
                try {
                    n = this instanceof e
                } catch (e) {}
                return n ? Reflect.construct(t, arguments, this.constructor) : t.apply(this, arguments)
            };
            n.prototype = t.prototype
        } else n = {};
        return Object.defineProperty(n, "__esModule", {
            value: !0
        }), Object.keys(e).forEach(function(t) {
            var a = Object.getOwnPropertyDescriptor(e, t);
            Object.defineProperty(n, t, a.get ? a : {
                enumerable: !0,
                get: function() {
                    return e[t]
                }
            })
        }), n
    }])
}]);

//# debugId=59da0c36-6b00-3fd7-969a-14841a669f2f
//# sourceMappingURL=3y41fyx9p2et2.js.map