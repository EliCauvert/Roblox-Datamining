;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "4d3269d3-3ee0-e552-8cbd-b0d43eb76b30")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTaxonomyBasedCreatorDashboard",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
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
    e.s(["enableAvatarCreationTokenCategories", 0, i, "enableBulkMakeupTokenCreation", 0, r, "enableCoreContentGatedBanner", 0, l, "enableCreatorShowcases", 0, n, "enableTaxonomyBasedCreatorDashboard", 0, a, "isAutoPublishPreferencesEnabled", 0, s, "showTaxonomyOnAvatarItemAnalyticsTab", 0, o])
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
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, o, "isPublishBeforeExposeEnabled", 0, l])
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
    e.s(["enableIpPlatformLicenseRecommendations", 0, n, "isAvatarItemLicensingEnabled", 0, o, "isExperiencePreviewEnabled", 0, a, "isIgnoreMatchEnabled", 0, s, "isImageAttachmentEnabledInLicenseApplication", 0, i, "isInGameSalesLicensingEnabled", 0, l, "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled", 0, u, "isShowcaseExperiencesEnabled", 0, r, "maxCollectibleItemDetailsRequestCount", 0, c])
}, 942100, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-publishing",
            name: "isPromotionalTextEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "content-publishing",
            name: "isExperienceNameCharacterValidationEnabled",
            defaultValue: !1
        });
    e.s(["isExperienceNameCharacterValidationEnabled", 0, n, "isPromotionalTextEnabled", 0, a])
}, 779433, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !1
        });
    e.s(["questionnaireV2Allowlist", 0, a, "questionnaireV2Q1Release", 0, n])
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
        }),
        u = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, o, "isMomentsModeratedTabEnabled", 0, u, "isMomentsPostCreationEnabled", 0, c, "isMomentsShareLinkEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, r])
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
    let a = (0, t.defineFlag)({
            namespace: "creator-services-insights",
            name: "isCsmExtendedMetricsEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-services-insights",
            name: "isServerLogStructuredStackTracesEnabled",
            defaultValue: !1
        });
    e.s(["isCsmExtendedMetricsEnabled", 0, a, "isServerLogStructuredStackTracesEnabled", 0, n])
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
            defaultValue: !0
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
    e.s(["isAdsPageRedesignEnabled", 0, a, "isInGameTemplatePlacementEnabled", 0, i, "isManagedRewardedTabEnabled", 0, n, "isRewardItemAnalyticsEnabled", 0, o, "managedRewardedCtrBenchmarkHigh", 0, s, "managedRewardedCtrBenchmarkLow", 0, r])
}, 199972, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "localization",
            name: "imageLocalizationSettingsEnabled",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "localization",
            name: "imageTranslationAllowlist",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "localization",
            name: "enableImageTranslationEnrollment",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "localization",
            name: "enableImageTranslationListingTab",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "localization",
            name: "enableSharedTranslationListComponents",
            defaultValue: !1
        });
    e.s(["enableImageTranslationEnrollment", 0, i, "enableImageTranslationListingTab", 0, r, "enableSharedTranslationListComponents", 0, s, "imageLocalizationSettingsEnabled", 0, a, "imageTranslationAllowlist", 0, n])
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
            name: "isProductArchiveEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1
        });
    e.s(["isProductArchiveEnabled", 0, r, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, n, "mockManagedPricingSummary", 0, a, "mockShopItemsExternalEligibility", 0, s])
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
    let a = (0, t.defineFlag)({
            namespace: "talent-hub",
            name: "enableTalentHubV2",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "talent-hub",
            name: "enableTalentHubV2M2",
            defaultValue: !1
        });
    e.s(["enableTalentHubV2", 0, a, "enableTalentHubV2M2", 0, n])
}, 814984, e => {
    "use strict";
    let t = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        a = encodeURIComponent("studio/CollaborationSettings"),
        n = async function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : 0,
                a = await fetch(e, {
                    credentials: "include"
                }),
                i = a.status % 100 * 100;
            if (!a.ok && 500 === i && t < 2) return await new Promise(e => {
                setTimeout(e, 2 ** (t + 1) * 500)
            }), n(e, t + 1);
            if (500 === i && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let r = await a.json();
            if ("object" != typeof r || null === r || !("access" in r)) throw Error('"access" not found in response');
            return r.access
        }, i = async () => await n("".concat(t, "/v1/upsell-feature-access?nameSpace=").concat(a, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted";
    e.s(["getAgeVerificationUpsellFeatureAccess", 0, i])
}, 904969, e => {
    "use strict";
    e.s(["AGE_VERIFICATION_UPSELL_BANNER_END_DATE", 0, "2030-01-01T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE", 0, "2026-01-21T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_BANNER_START_DATE", 0, "2025-12-03T00:00:00.000Z", "AGE_VERIFICATION_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "AGE_VERIFICATION_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693", "ESTABLISH_TRUST_UPSELL_GET_STARTED_URL", 0, "https://www.roblox.com/my/account?creatorCollaboration", "ESTABLISH_TRUST_UPSELL_VIEW_DETAILS_URL", 0, "https://devforum.roblox.com/t/age-check-notifications-in-studio-and-creator-hub/4117693"])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
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
                return c(), !1
            }
            let a = new Date;
            return e.getFullYear() === a.getFullYear() && e.getMonth() === a.getMonth() && e.getDate() === a.getDate()
        }, d = async () => {
            localStorage.setItem(l, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, p = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), f = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, m = async () => await (0, s.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: s
        } = e, [l, c] = (0, a.useState)(!0), [h, g] = (0, a.useState)("doNotShow"), {
            isFetched: y,
            user: b
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: w
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: S,
            isEnabled: A
        } = (0, a.useMemo)(() => {
            let e = f(o.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = f(o.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                a = f(o.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, []), E = (0, a.useCallback)(async () => {
            await d(), c(!0)
        }, [c]);
        (0, a.useEffect)(() => {
            A && y && (null == b ? void 0 : b.id) && (async () => {
                let e = !1;
                try {
                    e = await u()
                } catch (e) {
                    w.logErrorEvent({
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
                    t = await m()
                } catch (e) {
                    w.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                g(t)
            })().catch(e => {
                w.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [A, y, b, w]);
        let I = (0, a.useMemo)(() => {
            let e = A && "doNotShow" !== h;
            return {
                isBannerVisible: e && !l,
                isBannerEligible: e,
                isHighPriority: S,
                variant: "doNotShow" !== h ? h : "ageVerification",
                dismissBanner: E
            }
        }, [A, h, l, S, E]);
        return (0, t.jsx)(p.Provider, {
            value: I,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(p)], 906791)
}, 968439, e => {
    "use strict";
    var t, a = e.i(721281),
        n = e.i(280162),
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
                (0, a._)(this, "applicationApi", void 0), (0, a._)(this, "scopeApi", void 0);
                const e = (0, i.createClientConfiguration)("oauth", "bedev2");
                this.applicationApi = new n.ApplicationApi(e), this.scopeApi = new n.ScopeApi(e)
            }
        },
        o = (0, i.createClientConfiguration)("oauth", "bedev2"),
        l = new n.AuthorizationApi(o),
        c = new n.DiscoveryApi(o);
    e.s(["ApplicationAuthorizationsClient", 0, {
        authorizationApi: l,
        discoveryApi: c
    }, "EApplicationErrorResponseFields", () => r, "default", 0, s])
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
}, 28850, e => {
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
        },
        i = function() {
            return (i = Object.assign || function(e) {
                for (var t, a = 1, n = arguments.length; a < n; a++)
                    for (var i in t = arguments[a]) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                return e
            }).apply(this, arguments)
        };

    function r(e, t, a, n) {
        return new(a || (a = Promise))(function(i, r) {
            function s(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
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
                })).then(s, o)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function s(e, t) {
        var a, n, i, r = {
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
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (r = 0)), r;) try {
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

    function o(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.exists)(t, "created_at") ? new Date(t.created_at) : void 0,
            expiresAt: (0, a.exists)(t, "expires_at") ? new Date(t.expires_at) : void 0,
            id: (0, a.exists)(t, "id") ? t.id : void 0,
            universeId: (0, a.exists)(t, "universe_id") ? t.universe_id : void 0,
            values: (0, a.exists)(t, "values") ? function(e) {
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
            visible: (0, a.exists)(t, "visible") ? t.visible : void 0
        }
    }
    "function" == typeof SuppressedError && SuppressedError;

    function l(e, t) {
        return null == e ? e : {
            items: (0, a.exists)(e, "items") ? e.items.map(o) : void 0,
            nextCursor: (0, a.exists)(e, "next_cursor") ? e.next_cursor : void 0
        }
    }

    function c(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, a.exists)(t, "created_at") ? new Date(t.created_at) : void 0,
            id: (0, a.exists)(t, "id") ? t.id : void 0,
            policy: (0, a.exists)(t, "policy") ? t.policy : void 0,
            policyLabelKey: (0, a.exists)(t, "policy_label_key") ? t.policy_label_key : void 0
        }
    }
    var u = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return function(e, t) {
                if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

                function a() {
                    this.constructor = e
                }
                n(e, t), e.prototype = null === t ? Object.create(t) : (a.prototype = t.prototype, new a)
            }(t, e), t.prototype.creatorTransparencyServiceGetCreatorAcknowledgmentRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.id || void 0 === e.id) throw new a.RequiredError("id", "Required parameter requestParameters.id was null or undefined when calling creatorTransparencyServiceGetCreatorAcknowledgment.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments/{id}".replace("{".concat("id", "}"), encodeURIComponent(String(e.id))),
                                    schemaPath: "/v1/creator-acknowledgments/{id}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return o(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetCreatorAcknowledgment = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetCreatorAcknowledgmentRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestrictionRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.contentId || void 0 === e.contentId) throw new a.RequiredError("contentId", "Required parameter requestParameters.contentId was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                if (null === e.contentType || void 0 === e.contentType) throw new a.RequiredError("contentType", "Required parameter requestParameters.contentType was null or undefined when calling creatorTransparencyServiceGetRestriction.");
                                return n = {}, void 0 !== e.contentId && (n.content_id = e.contentId), void 0 !== e.contentType && (n.content_type = e.contentType), i = {}, [4, this.request({
                                    path: "/v1/restriction",
                                    schemaPath: "/v1/restriction",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        isRestricted: (0, a.exists)(e, "is_restricted") ? e.is_restricted : void 0,
                                        restrictionMessage: (0, a.exists)(e, "restriction_message") ? e.restriction_message : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceGetRestriction = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceGetRestrictionRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgmentsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                return n = {}, void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.limit && (n.limit = e.limit), i = {}, [4, this.request({
                                    path: "/v1/creator-acknowledgments",
                                    schemaPath: "/v1/creator-acknowledgments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListCreatorAcknowledgments = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseCreatorAcknowledgments.");
                                return n = {}, void 0 !== e.cursor && (n.cursor = e.cursor), void 0 !== e.limit && (n.limit = e.limit), i = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/creator-acknowledgments".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/creator-acknowledgments",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return l(e)
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseCreatorAcknowledgments = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseCreatorAcknowledgmentsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolationsRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
                            case 0:
                                if (null === e.universeId || void 0 === e.universeId) throw new a.RequiredError("universeId", "Required parameter requestParameters.universeId was null or undefined when calling creatorTransparencyServiceListUniverseViolations.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/universes/{universe_id}/violations".replace("{".concat("universe_id", "}"), encodeURIComponent(String(e.universeId))),
                                    schemaPath: "/v1/universes/{universe_id}/violations",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, t)];
                            case 1:
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        items: (0, a.exists)(e, "items") ? e.items.map(c) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.creatorTransparencyServiceListUniverseViolations = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
                        switch (a.label) {
                            case 0:
                                return [4, this.creatorTransparencyServiceListUniverseViolationsRaw(e, t)];
                            case 1:
                                return [4, a.sent().value()];
                            case 2:
                                return [2, a.sent()]
                        }
                    })
                })
            }, t
        }(a.BaseAPI),
        d = a,
        p = e.i(272593);
    class f extends d.BaseAPI {
        async getRestriction(e, t, a) {
            return this.api.creatorTransparencyServiceGetRestriction({
                contentId: e,
                contentType: t
            }, a)
        }
        async listCreatorAcknowledgments(e, t, a) {
            return this.api.creatorTransparencyServiceListCreatorAcknowledgments({
                cursor: e,
                limit: t
            }, a)
        }
        async listUniverseCreatorAcknowledgments(e, t, a, n) {
            return this.api.creatorTransparencyServiceListUniverseCreatorAcknowledgments({
                universeId: e,
                cursor: t,
                limit: a
            }, n)
        }
        async listUniverseViolations(e, t) {
            return this.api.creatorTransparencyServiceListUniverseViolations({
                universeId: e
            }, t)
        }
        async getUniverseViolation(e, t) {
            let a = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t)),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}",
                method: "GET",
                headers: {}
            });
            return new d.JSONApiResponse(a, e => ({
                ...c(e),
                appealBy: void 0 === e.appeal_by ? void 0 : new Date(e.appeal_by),
                canAppeal: e.can_appeal,
                appeals: e.appeals.map(e => ({
                    state: e.state,
                    createdAt: new Date(e.created_at),
                    decidedAt: void 0 === e.decided_at ? void 0 : new Date(e.decided_at),
                    submitterUserId: e.submitter_user_id,
                    message: e.message
                }))
            })).value()
        }
        async createUniverseViolationAppeal(e, t, a) {
            let n = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t), "/appeals"),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}/appeals",
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: {
                    message: a
                }
            });
            return new d.JSONApiResponse(n, e => ({
                state: e.state,
                createdAt: new Date(e.created_at),
                message: e.message
            })).value()
        }
        constructor() {
            const e = (0, p.createClientConfiguration)("creator-transparency-service", "bedev2");
            super(e), (0, t._)(this, "api", void 0), this.api = new u(e)
        }
    }
    let m = new f;
    e.s(["default", 0, m], 28850)
}, 66424, 992598, e => {
    "use strict";
    var t = e.i(895279),
        a = e.i(721281),
        n = e.i(677753);
    class i extends Error {
        constructor(e, t, n) {
            super("Creator Wallets API error: ".concat(e, " ").concat(t)), (0, a._)(this, "status", void 0), (0, a._)(this, "statusText", void 0), (0, a._)(this, "body", void 0), this.name = "CreatorWalletsApiError", this.status = e, this.statusText = t, this.body = n
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
            if (e instanceof n.ResponseError || e instanceof Error && "ResponseError" === e.name && "response" in e && e.response instanceof Response) {
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

    function c(e) {
        let {
            inquiryId: t,
            sessionToken: a
        } = e;
        if (!t || !a) throw TypeError("InitializeSanctionsScreeningEmbedding returned an unexpected payload");
        return {
            inquiryId: t,
            sessionToken: a
        }
    }
    e.s(["C", 0, i, "a", 0, c, "g", 0, function(e) {
        if (!(e instanceof i) || !s(e.body)) return null;
        let {
            details: t
        } = e.body;
        if (!Array.isArray(t)) return null;
        for (let e of t) {
            if (!s(e) || !Array.isArray(e.unmetPrerequisites)) continue;
            let t = e["@type"];
            if ("string" == typeof t && !t.endsWith(".KycPrerequisitesNotMet")) continue;
            let a = e.unmetPrerequisites.filter(o);
            if (a.length > 0) return a
        }
        return null
    }, "m", 0, function(e) {
        var t, a;
        return e && (void 0 !== e.units || void 0 !== e.attos) ? (null != (t = e.units) ? t : 0) + (null != (a = e.attos) ? a : 0) / 1e18 : null
    }, "w", 0, l], 992598);
    var u = e.i(272593);
    let d = new t.CreatorWalletsAPIApi((0, u.createClientConfiguration)("creator-wallets", "bedev2"));

    function p(e) {
        if (void 0 === e) return;
        if (!/^[1-9]\d*$/.test(e)) throw TypeError("Creator Wallet group id must be a positive integer");
        let t = Number(e);
        if (!Number.isSafeInteger(t)) throw TypeError("Creator Wallet group id must be a safe integer");
        return t
    }
    e.s(["default", 0, {
        getOnboardingState(e, t) {
            let a = p(e);
            return l(void 0 === a ? d.v1SelfOnboardingStateGet({}, t) : d.v1GroupCreatorWalletIdGroupIdOnboardingStateGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        getOnboardingRequirements: e => l(d.v1SelfOnboardingRequirementsGet({}, e)),
        selectOnboardingAccountType: e => l(d.v1SelfOnboardingAccountTypeselectPost({
            selectOnboardingAccountTypeRequest: e
        })),
        acceptOnboardingTerms: e => l(d.v1SelfOnboardingTermsacceptPost({
            acceptOnboardingTermsRequest: e
        })),
        deleteOnboardingDraft: () => l(d.v1SelfOnboardingDraftDelete({})),
        getSanctionsScreening: e => l(d.v1SelfOnboardingSanctionsScreeningGet({}, e)),
        startSanctionsScreening: () => l(d.v1SelfOnboardingSanctionsScreeningstartPost({
            startSanctionsScreeningRequest: {}
        })),
        initializeSanctionsScreeningEmbedding: async () => c(await l(d.v1SelfOnboardingSanctionsScreeningEmbeddinginitializePost({
            initializeSanctionsScreeningEmbeddingRequest: {}
        }))),
        getWalletBalance(e, t) {
            let a = p(e);
            return l(void 0 === a ? d.v1SelfWalletBalanceGet({}, t) : d.v1GroupCreatorWalletIdGroupIdWalletBalanceGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        getWalletEarningsEstimate(e, t) {
            let a = p(e);
            return l(void 0 === a ? d.v1SelfWalletEarningsEstimateGet({}, t) : d.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        listBeneficiaries(e, t, a) {
            let n = p(e),
                i = (null == a ? void 0 : a.includeArchived) ? {
                    includeArchived: !0
                } : {};
            return l(void 0 === n ? d.v1SelfWalletBeneficiariesGet(i, t) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet({
                creatorWalletIdGroupId: n,
                ...i
            }, t))
        },
        initializeKycEmbedding(e, t) {
            let a = p(t);
            return l(void 0 === a ? d.v1SelfOnboardingKycEmbeddinginitializePost({
                initializeKycEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeKycEmbeddingRequest: e
            }))
        },
        initializeKycRfiEmbedding(e, t) {
            let a = p(t);
            return l(void 0 === a ? d.v1SelfOnboardingKycRfiEmbeddinginitializePost({
                initializeKycRfiEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeKycRfiEmbeddingRequest: e
            }))
        },
        async initializeBeneficiaryEmbedding(e, t) {
            let a = p(t);
            return function(e) {
                let {
                    clientId: t,
                    authCode: a
                } = e;
                if ("string" != typeof t || "string" != typeof a) throw TypeError("InitializeBeneficiaryEmbedding returned an unexpected payload");
                return {
                    clientId: t,
                    authCode: a
                }
            }(await l(void 0 === a ? d.v1SelfWalletBeneficiaryEmbeddinginitializePost({
                initializeBeneficiaryEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeBeneficiaryEmbeddingRequest: e
            })))
        },
        async saveBeneficiary(e, t) {
            let a = p(t);
            return function(e) {
                let {
                    beneficiary: t
                } = e;
                if (!t || "string" != typeof t.beneficiaryId) throw TypeError("SaveBeneficiary returned an unexpected payload");
                return t
            }(await l(void 0 === a ? d.v1SelfWalletBeneficiariesPost({
                saveBeneficiaryRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost({
                creatorWalletIdGroupId: a,
                saveBeneficiaryRequest: e
            })))
        },
        archiveBeneficiary(e, t) {
            let a = p(t);
            return l(void 0 === a ? d.v1SelfWalletBeneficiariesBeneficiaryIdDelete({
                beneficiaryId: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete({
                creatorWalletIdGroupId: a,
                beneficiaryId: e
            }))
        },
        initiateWithdrawal(e, t) {
            let a = p(t);
            return l(d.v1WalletWithdrawalsPost({
                initiateWithdrawalRequest: {
                    ...e,
                    creatorWalletId: void 0 === a ? e.creatorWalletId : {
                        ...e.creatorWalletId,
                        groupId: a
                    }
                }
            }))
        }
    }], 66424)
}, 607204, e => {
    "use strict";
    var t = e.i(581548),
        a = e.i(272593),
        n = e.i(127403);
    let i = (0, a.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new n.default]
        }),
        r = new t.OrganizationApi(i),
        s = new t.InvitationApi(i),
        o = new t.RoleApi(i),
        l = new t.UserApi(i),
        c = new t.GroupUniversePayoutApi(i);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => r.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, a) => s.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getInvitation: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, a) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: a
            }),
            deleteInvitationById: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
                organizationId: e,
                invitationId: t
            })
        },
        roleClient: {
            createRole: async (e, t) => o.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: a
            }),
            updateRoleMetadata: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: a
            }),
            updateRolePosition: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: a
            }),
            getRolesByOrganization: async (e, t, a) => o.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            deleteRole: async (e, t) => o.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, a, n) => o.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n
            })
        },
        userClient: {
            getUserInvitationByOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return c.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
            },
            getSuggestedPayouts: async e => c.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
                organizationId: e
            })
        }
    }])
}, 196990, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(142330),
        n = e.i(272593);
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
            })).filter(e => e.regulationType !== a.RegulationType.Luobu)
        }
        getUserAgreements(e) {
            return this.agreementResolutionApi.agreementResolutionGetByContext(e)
        }
        constructor() {
            (0, t._)(this, "agreementResolutionApi", void 0), (0, t._)(this, "acceptanceApi", void 0);
            const e = (0, n.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new a.AgreementResolutionApi(e), this.acceptanceApi = new a.AcceptanceApi(e)
        }
    };
    e.s(["userAgreementsClient", 0, i])
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
}, 127403, e => {
    "use strict";
    e.s(["default", 0, class {
        post(e) {
            let {
                fetch: t,
                url: a,
                init: n,
                response: i
            } = e, r = new URL(a);
            return "POST" !== n.method && "PATCH" !== n.method || "true" === r.searchParams.get("isSecure") || 403 !== i.status ? Promise.resolve(i) : (r.searchParams.set("isSecure", "true"), t(r.toString(), n))
        }
    }])
}, 950492, e => {
    "use strict";
    let t = async e => {
        let t, {
                api: a,
                getItems: n,
                getPageToken: i
            } = e,
            r = [];
        do {
            let e = await a(t);
            r = r.concat(n(e)), t = i(e)
        } while (t) return r
    };
    e.s(["default", 0, t])
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
        s = (e, t, a) => null == e && null == t || e === t ? 0 : null == e ? 1 : null == t ? -1 : null != a && (a.includes(e) || a.includes(t)) ? a.includes(e) && a.includes(t) ? a.indexOf(e) - a.indexOf(t) : a.includes(e) ? -1 : 1 : e.localeCompare(t),
        o = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : r,
                a = Object.keys(t);
            return e.sort((e, t) => s(e.notificationCategoryName, t.notificationCategoryName, a))
        },
        l = function(e, t) {
            let a = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : r,
                n = a[e];
            return t.sort((e, t) => s(e.notificationType, t.notificationType, n))
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
            user: s
        } = (0, n.useAuthentication)(), [u, d] = (0, a.useState)([]), [p, f] = (0, a.useState)(!1), [m, h] = (0, a.useState)(!0), [g, y] = (0, a.useState)(!1), b = (0, a.useCallback)(async () => {
            if (!p && (null == s ? void 0 : s.id) != null) try {
                y(!1), h(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(s.id.toString()),
                    t = (e => {
                        for (let n of (o(e), e)) {
                            var t, a;
                            l(null != (t = n.notificationCategoryName) ? t : "", null != (a = n.notifications) ? a : [])
                        }
                        return e
                    })(e.categories || []);
                d(t), f(!0)
            } catch (e) {
                y(!0), f(!1)
            } finally {
                h(!1)
            }
        }, [null == s ? void 0 : s.id, p]), w = (0, a.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: g,
            notificationSettingsContextLoading: m,
            getNotificationSettings: b,
            setNotificationSettings: d
        }), [u, g, b, m, p]);
        return (0, t.jsx)(c.Provider, {
            value: w,
            children: r
        })
    }], 354088)
}, 945451, 330159, 641831, 787617, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(533414),
        n = e.i(814975);
    let i = e => () => {
            var i;
            let {
                user: r
            } = (0, n.useAuthentication)(), s = "".concat(e, ".").concat(null != (i = null == r ? void 0 : r.id) ? i : "anonymous"), [o, l] = (0, a.useLocalStorage)(s, []);
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
                        var a;
                        return !e.has(null != (a = t.id) ? a : "")
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
        let a = o(e.createdAt),
            n = o(e.expiresAt),
            i = {};
        return e.id && (i.acknowledgmentId = e.id), a && (i.createdAt = a), n && (i.expiresAt = n), t.decisionEventId && (i.decisionEventId = t.decisionEventId), e.universeId && (i.universeId = e.universeId.toString()), i
    }], 330159), e.s(["default", 0, e => "https://".concat("roblox.com", "/safety-dashboard#/violations/").concat(encodeURIComponent(e))], 641831);
    let l = (0, e.i(157700).defineFlag)({
        namespace: "creator-platform",
        name: "tryOnWebButtonEnabled",
        defaultValue: !1
    });
    e.s(["tryOnWebButtonEnabled", 0, l], 787617)
}, 719338, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        refreshOrganization: () => ({}),
        isOrganizationLoading: !1
    });
    a.displayName = "Organization", e.s(["default", 0, a], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 719338)
}, 911502, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(589624),
        i = e.i(79187),
        r = e.i(814975),
        s = e.i(607204),
        o = e.i(581548),
        l = e.i(881670),
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(848427),
        p = e.i(547710),
        f = e.i(750213),
        m = e.i(319266),
        h = e.i(537683),
        g = e.i(611043),
        y = e.i(695763),
        b = e.i(459703),
        w = e.i(156071),
        S = e.i(790806),
        A = e.i(759283),
        E = e.i(719338);
    let I = (0, y.makeStyles)()(() => ({
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
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, E.default)(), {
                classes: {
                    dialogTitle: y,
                    dialogContent: C,
                    dialogSubActions: T
                }
            } = I(), {
                enqueue: R,
                close: _
            } = (0, b.useSnackbar)(), P = (0, a.useCallback)(e => {
                R({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: A.toastDurationTime,
                    autoHide: !0,
                    onClose: _
                })
            }, [R, _]), [O, x] = (0, a.useState)(), [k, U] = (0, a.useState)(), [M, N] = (0, a.useState)(), [D, L] = (0, a.useState)(), B = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await S.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    N(e.name), L(!1)
                } catch (e) {
                    L(!0)
                }
            }, [l]), G = (0, a.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await w.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    x(null == e ? void 0 : e.name)
                } catch (e) {
                    P(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, P, c]);
            (0, a.useEffect)(() => {
                B(), G()
            }, [G, B]);
            let z = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                V = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        U(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            P(c("Error.DecliningInvitation")), U(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, P, c]),
                q = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        U(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            P(c("Error.AcceptingInvitation")), U(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, P, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(m.DialogContent, {
                    className: C,
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(h.Grid, {
                            container: !0,
                            children: (0, t.jsx)(g.Typography, {
                                variant: "h4",
                                className: y,
                                children: c("Label.JoinOrganization", {
                                    organizationName: null != O ? O : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(h.Grid, {
                            container: !0,
                            children: (0, t.jsx)(g.Typography, {
                                variant: "body1",
                                children: D ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != M ? M : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(f.DialogActions, {
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: z,
                            disabled: k,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(h.Grid, {
                            className: T,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: V,
                                disabled: k,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: q,
                                loading: k,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        T = (0, y.makeStyles)()(() => ({
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
                invitation: s,
                accepted: o
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: y
                }
            } = T(), [b, w] = (0, a.useState)(), [A, E] = (0, a.useState)(), I = (0, a.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await S.default.getUserById(Number.parseInt(s.senderUserId, 10));
                    w(e.name), E(!1)
                } catch (e) {
                    E(!0)
                }
            }, [s]);
            (0, a.useEffect)(() => {
                I()
            }, [I]);
            let C = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(m.DialogContent, {
                    className: u,
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(g.Typography, {
                            variant: "h4",
                            className: c,
                            children: l(o ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(g.Typography, {
                            variant: "body1",
                            children: o ? (0, t.jsx)(t.Fragment, {
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
                }), (0, t.jsx)(f.DialogActions, {
                    className: y,
                    children: (0, t.jsx)(h.Grid, {
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
    var _ = e.i(582977),
        P = e.i(672401);
    let O = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: f
        } = (0, c.default)(), [m, h] = (0, a.useState)(), [g, y] = (0, a.useState)(), [b, w] = (0, a.useState)(!1), [S, A] = (0, a.useState)(!1), [E, I] = (0, a.useState)(), [T, O] = (0, a.useState)(!1), x = null == d ? void 0 : d.id, k = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : f
        }, [p, f]), U = l.query[_.InviteQueryKey], M = l.isReady, N = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), D = (0, a.useCallback)(async e => {
            if (!x) return void y(null);
            try {
                let t = await s.default.userClient.getUserInvitationByOrganization(e, x.toString());
                y(t)
            } catch (e) {
                y(null), N()
            }
        }, [x, N]), L = (0, a.useCallback)(async () => {
            if (M) {
                A(!0);
                try {
                    if ("string" == typeof U) return void await D(U);
                    if (!k) return void h(null);
                    if (y(null), k) {
                        let e = await s.default.organizationClient.getOrganization(k.toString());
                        h(e)
                    } else h(void 0);
                    w(!1)
                } catch (e) {
                    h(null), y(null)
                } finally {
                    A(!1)
                }
            }
        }, [k, D, U, M]), B = (0, a.useCallback)(() => {
            w(!0), L()
        }, [L]), G = (0, a.useMemo)(() => ({
            organization: m,
            refreshOrganization: B,
            isOrganizationRefreshRequired: b,
            isOrganizationLoading: S
        }), [m, B, b, S]);
        return (0, a.useEffect)(() => {
            L()
        }, [L]), (0, t.jsx)(P.default.Provider, {
            value: G,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, g && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(C, {
                        open: g.invitationStatusType === o.InvitationStatusType.Open && void 0 === E,
                        onClose: e => {
                            !0 === e ? (I(!0), O(!0)) : !1 === e ? (I(!1), O(!0)) : (N(), y(null))
                        },
                        invitation: g
                    }), (0, t.jsx)(R, {
                        open: T,
                        onClose: () => {
                            O(!1), !0 === E && B(), N()
                        },
                        invitation: g,
                        accepted: !0 === E
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, O], 911502)
}, 748411, e => {
    "use strict";
    var t = e.i(157310),
        a = e.i(773057);
    e.s(["useUniverseDetailsQuery", 0, e => (0, t.useQuery)({
        queryKey: ["universeDetails", e],
        queryFn: () => {
            if (void 0 === e || !Number.isFinite(e)) throw Error("universeId is required");
            return a.default.getUniverseDetails(e)
        },
        enabled: void 0 !== e && Number.isFinite(e),
        staleTime: 3e5,
        refetchOnMount: !1
    })])
}, 758835, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(589624);
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
}, 407881, 616931, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(589624),
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
    let o = (0, a.createContext)({
        isPending: !1,
        completeCheck: () => {}
    });
    e.s(["default", 0, e => {
        let {
            children: i
        } = e, {
            pathname: r
        } = (0, n.useRouter)(), [l, c] = (0, a.useState)(!0), u = (0, a.useCallback)(() => c(!1), []), d = s.some(e => r.startsWith(e)), p = (0, a.useMemo)(() => ({
            isPending: l && !d,
            completeCheck: u
        }), [l, d, u]);
        return (0, t.jsx)(o.Provider, {
            value: p,
            children: i
        })
    }, "useUserAgreementCheck", 0, () => (0, a.useContext)(o)], 407881)
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
        hi_in: t.Locale.Hindi,
        nl_nl: t.Locale.Dutch
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
        s = e.i(811683);
    let o = t.Locale.English,
        l = t.NativeName.English,
        c = o === t.Locale.SimplifiedChinese ? s.default : r.default;
    e.s(["defaultLocale", 0, o, "defaultMetadataJson", 0, c, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 142330, e => {
    "use strict";
    var t = e.i(677753),
        a = function(e, t) {
            return (a = Object.setPrototypeOf || ({
                __proto__: []
            }) instanceof Array && function(e, t) {
                e.__proto__ = t
            } || function(e, t) {
                for (var a in t) Object.prototype.hasOwnProperty.call(t, a) && (e[a] = t[a])
            })(e, t)
        };

    function n(e, t) {
        if ("function" != typeof t && null !== t) throw TypeError("Class extends value " + String(t) + " is not a constructor or null");

        function n() {
            this.constructor = e
        }
        a(e, t), e.prototype = null === t ? Object.create(t) : (n.prototype = t.prototype, new n)
    }

    function i(e, t, a, n) {
        return new(a || (a = Promise))(function(i, r) {
            function s(e) {
                try {
                    l(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function o(e) {
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
                })).then(s, o)
            }
            l((n = n.apply(e, t || [])).next())
        })
    }

    function r(e, t) {
        var a, n, i, r = {
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
                if (a) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, c[0] && (r = 0)), r;) try {
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

    function s(e) {
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

    function o(e) {
        var a;
        return null == (a = e) ? a : {
            id: a.id,
            agreementType: a.agreementType,
            clientType: a.clientType,
            regulationType: a.regulationType,
            displayUrl: a.displayUrl,
            agreementBodyText: (0, t.exists)(a, "agreementBodyText") ? a.agreementBodyText : void 0
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
        var a;
        return null == (a = e) ? a : {
            errorCode: (0, t.exists)(a, "errorCode") ? a.errorCode : void 0,
            message: (0, t.exists)(a, "message") ? a.message : void 0,
            agreementId: a.agreementId
        }
    }

    function d(e, a) {
        return null == e ? e : {
            results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(u) : void 0
        }
    }
    var p = function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(a, e), a.prototype.acceptanceDeleteRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
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
                                }, a)];
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
            }, a.prototype.acceptanceDelete = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(a) {
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
            }, a.prototype.acceptanceGetByUserIdRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, o;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceGetByUserId.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, a)];
                            case 1:
                                return o = r.sent(), [2, new t.JSONApiResponse(o, function(e) {
                                    return null == e ? e : {
                                        results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(s) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, a.prototype.acceptanceGetByUserId = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(a) {
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
            }, a.prototype.acceptanceInsertRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances",
                                    schemaPath: "/v1/acceptances",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: c(e.insertAcceptancesRequest)
                                }, a)];
                            case 1:
                                return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, a.prototype.acceptanceInsert = function() {
                return i(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), r(this, function(a) {
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
            }, a.prototype.acceptanceInsertByUserIdRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.userId || void 0 === e.userId) throw new t.RequiredError("userId", "Required parameter requestParameters.userId was null or undefined when calling acceptanceInsertByUserId.");
                                return n = {}, (i = {})["Content-Type"] = "application/json-patch+json", [4, this.request({
                                    path: "/v1/acceptances/{userId}".replace("{".concat("userId", "}"), encodeURIComponent(String(e.userId))),
                                    schemaPath: "/v1/acceptances/{userId}",
                                    method: "POST",
                                    headers: i,
                                    query: n,
                                    body: c(e.insertAcceptancesRequest)
                                }, a)];
                            case 1:
                                return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return d(e)
                                })]
                        }
                    })
                })
            }, a.prototype.acceptanceInsertByUserId = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(a) {
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
            }, a
        }(t.BaseAPI),
        f = function(e) {
            function a() {
                return null !== e && e.apply(this, arguments) || this
            }
            return n(a, e), a.prototype.agreementResolutionGetByContextRaw = function(e, a) {
                return i(this, void 0, void 0, function() {
                    var n, i, s;
                    return r(this, function(r) {
                        switch (r.label) {
                            case 0:
                                if (null === e.clientType || void 0 === e.clientType) throw new t.RequiredError("clientType", "Required parameter requestParameters.clientType was null or undefined when calling agreementResolutionGetByContext.");
                                return n = {}, i = {}, [4, this.request({
                                    path: "/v1/agreements-resolution/{clientType}".replace("{".concat("clientType", "}"), encodeURIComponent(String(e.clientType))),
                                    schemaPath: "/v1/agreements-resolution/{clientType}",
                                    method: "GET",
                                    headers: i,
                                    query: n
                                }, a)];
                            case 1:
                                return s = r.sent(), [2, new t.JSONApiResponse(s, function(e) {
                                    return e.map(o)
                                })]
                        }
                    })
                })
            }, a.prototype.agreementResolutionGetByContext = function(e, t) {
                return i(this, void 0, void 0, function() {
                    return r(this, function(a) {
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
            }, a
        }(t.BaseAPI);
    e.s(["AcceptanceApi", 0, p, "AgreementResolutionApi", 0, f, "AgreementType", 0, {
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
}, 711950, e => {
    "use strict";
    var t = e.i(562991),
        a = e.i(278862),
        n = e.i(641659),
        i = e.i(927072),
        r = e.i(805476),
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
                href: n,
                linkTarget: i,
                onAction: r,
                variant: s
            } = e;
            return i ? o.default.createElement(a.Button, {
                asChild: !0,
                size: "Small",
                variant: s,
                onClick: r
            }, o.default.cloneElement(i, {}, t)) : n ? o.default.createElement(a.Button, {
                as: "a",
                href: n,
                size: "Small",
                variant: s,
                onClick: r
            }, t) : o.default.createElement(a.Button, {
                size: "Small",
                variant: s,
                onClick: r
            }, t)
        },
        f = e => {
            let {
                label: t,
                href: a,
                linkTarget: n,
                onAction: r
            } = e;
            return n ? o.default.createElement(i.Link, {
                asChild: !0,
                onClick: r,
                size: "Medium",
                variant: "Standalone",
                underline: "always"
            }, o.default.cloneElement(n, {}, t)) : a ? o.default.createElement(i.Link, {
                href: a,
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
        m = (0, o.forwardRef)((e, a) => {
            let {
                children: i,
                variant: m = "System",
                severity: h = "Info",
                primaryActionLabel: g,
                primaryActionHref: y,
                primaryActionLinkTarget: b,
                onPrimaryAction: w,
                secondaryActionLabel: S,
                secondaryActionHref: A,
                secondaryActionLinkTarget: E,
                onSecondaryAction: I,
                hasCloseAffordance: C = !0,
                closeLabel: T = "Dismiss alert",
                onDismiss: R,
                className: _,
                style: P,
                ...O
            } = e, x = (0, n.default)("foundation-web-alert-message-"), k = !!g, U = !!S, M = !!(C && R), N = "Feedback" === m && (k || U || M), D = "Warning" === h || "Error" === h ? "alert" : "status", L = null;
            k && (L = U ? o.default.createElement(p, {
                label: g || "",
                href: y,
                linkTarget: b,
                onAction: w,
                variant: "Standard"
            }) : o.default.createElement(f, {
                label: g || "",
                href: y,
                linkTarget: b,
                onAction: w
            }));
            let B = U ? o.default.createElement(p, {
                label: S || "",
                href: A,
                linkTarget: E,
                onAction: I,
                variant: "Utility"
            }) : null;
            return o.default.createElement("div", {
                ref: a,
                role: N ? "region" : D,
                "aria-labelledby": N ? x : void 0,
                className: (0, s.default)("foundation-web-alert relative width-full stroke-standard", "System" === m ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", u[h], _),
                ...O
            }, o.default.createElement("div", {
                "aria-hidden": "true",
                className: (0, s.default)("absolute inset-[0] pointer-events-none", "Feedback" === m && "radius-medium"),
                style: {
                    backgroundColor: d[h]
                }
            }), o.default.createElement("div", {
                className: "relative flex items-start gap-x-medium padding-x-large padding-y-small min-width-0"
            }, o.default.createElement("div", {
                className: "flex items-start padding-y-xsmall self-stretch shrink-0"
            }, o.default.createElement("div", {
                className: "relative flex items-start padding-y-xxsmall"
            }, "Warning" !== h && o.default.createElement("span", {
                "aria-hidden": "true",
                className: "absolute width-[10px] height-[14px] top-[5px]",
                style: {
                    left: "50%",
                    transform: "translateX(-50%)",
                    backgroundColor: "var(--dark-mode-content-emphasis)"
                }
            }), o.default.createElement(t.Icon, {
                "aria-hidden": "true",
                name: l[h],
                size: "Medium",
                className: "relative",
                style: {
                    color: c[h]
                }
            }))), o.default.createElement("div", {
                className: (0, s.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", U ? "flex-col" : "wrap")
            }, o.default.createElement("div", {
                id: N ? x : void 0,
                role: N ? D : void 0,
                className: (0, s.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", U ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, i), (L || B) && o.default.createElement("div", {
                className: (0, s.default)("flex items-center gap-small wrap shrink-0", !U && "padding-y-[var(--size-150)]")
            }, L, B)), M && o.default.createElement(r.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": T,
                onClick: R
            })))
        });
    e.s(["Alert", 0, m])
}, 128690, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = "text-label-medium",
        i = a.default.forwardRef((e, i) => {
            let {
                className: r,
                variant: s = "Determinate",
                value: o = 0,
                minValue: l,
                maxValue: c,
                valuesLocation: u = "None",
                ariaLabel: d,
                ...p
            } = e, f = "Determinate" === s, m = Math.min(100, Math.max(0, o)), h = f && void 0 !== l && "None" !== u, g = f && void 0 !== c && "None" !== u, y = "Sides" === u, b = a.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", y ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: y ? {
                    flexBasis: 0
                } : void 0
            }, f ? a.default.createElement("div", {
                className: "absolute top-0 left-0 height-100 radius-circle transition-all duration-300 ease-out",
                style: {
                    width: "".concat(m, "%"),
                    backgroundColor: "var(--fui-future-alpha-color-system-progress)"
                }
            }) : a.default.createElement("div", {
                className: "foundation-web-progress-bar-indeterminate absolute top-0 height-100 radius-circle"
            })), w = h && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, l), S = g && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, c), A = (h || g) && a.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, h ? w : a.default.createElement("span", null), g ? S : a.default.createElement("span", null));
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": f ? 0 : void 0,
                "aria-valuemax": f ? 100 : void 0,
                "aria-valuenow": f ? m : void 0,
                ...p
            }, y ? a.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, w, b, S) : a.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === u && A, b, "Bottom" === u && A))
        });
    i.displayName = "ProgressBar", e.s(["ProgressBar", 0, i])
}, 725260, e => {
    "use strict";
    var t = e.i(169336),
        a = e.i(477763),
        n = e.i(416340),
        i = e.i(226319),
        r = e.i(928277),
        s = e.i(221628),
        o = e.i(636042),
        l = e.i(442632);

    function c(e) {
        return (0, t.g)("MuiDialogContentText", e)
    }(0, r.g)("MuiDialogContentText", ["root"]);
    let u = ["children", "className"],
        d = (0, i.s)(o.T, {
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
                    className: o
                } = r,
                p = (0, t._)(r, u),
                f = (e => {
                    let {
                        classes: t
                    } = e, n = (0, i.a)({
                        root: ["root"]
                    }, c, t);
                    return (0, a._)({}, t, n)
                })(p);
            return (0, s.jsx)(d, (0, a._)({
                component: "p",
                variant: "body1",
                color: "text.secondary",
                ref: n,
                ownerState: p,
                className: (0, i.c)(f.root, o)
            }, r, {
                classes: f
            }))
        });
    e.s(["D", 0, p])
}, 100419, e => {
    "use strict";
    var t = e.i(30941),
        a = e.i(416340),
        n = e.i(669925);
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
            s = (0, t.a)(e, ["children"]),
            o = (0, a.useRef)(null),
            l = (0, a.useState)({
                props: {},
                children: void 0
            }),
            c = l[0],
            u = l[1],
            d = (0, a.useState)(!1),
            p = d[0],
            f = d[1],
            m = (0, a.useCallback)(function() {
                f(!0)
            }, [f]),
            h = (0, a.useCallback)(function() {
                f(!1)
            }, [f]),
            g = (0, a.useCallback)(function(e, t) {
                void 0 === t && (t = {}), u({
                    props: t,
                    children: e
                })
            }, [u]),
            y = (0, a.useMemo)(function() {
                return {
                    ref: o,
                    open: m,
                    close: h,
                    configure: g
                }
            }, [h, g, m]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: y
        }, r), a.default.createElement(n.default, (0, t._)({}, c.props, s, {
            "aria-labelledby": c.props.id,
            "aria-describedby": "dialog-content-text-describe-id",
            open: p,
            onClose: h,
            ref: o
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
}, 343601, e => {
    "use strict";
    var t = e.i(100419);
    e.s(["DialogProvider", () => t.default])
}, 613268, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(460773),
        n = e.i(856082),
        i = e.i(199169),
        r = e.i(287982),
        s = e.i(725260);
    e.i(221628), e.s(["DialogTemplate", 0, function(e) {
        var o = e.id;
        e.variant;
        var l = e.title,
            c = e.color,
            u = e.loading,
            d = void 0 !== u && u,
            p = e.content,
            f = e.confirmText,
            m = e.cancelText,
            h = e.onCancel,
            g = e.onConfirm;
        return t.default.createElement("div", null, t.default.createElement(a.default, {
            id: o
        }, l), t.default.createElement(n.default, null, t.default.createElement(s.D, {
            id: "dialog-content-text-describe-id"
        }, p)), t.default.createElement(i.default, null, t.default.createElement(r.default, {
            size: "large",
            variant: "outlined",
            "aria-label": m,
            color: "secondary",
            onClick: h,
            disabled: d
        }, m), t.default.createElement(r.default, {
            size: "large",
            variant: "contained",
            loading: d,
            "aria-label": f,
            color: void 0 === c ? "primaryBrand" : c,
            onClick: g
        }, f)))
    }], 613268)
}, 952661, e => {
    "use strict";
    var t = e.i(459703);
    e.s(["SnackbarProvider", () => t.default])
}, 733968, 243038, e => {
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
    }], 243038);
    var r = e.i(416340),
        s = e.i(221628),
        o = (0, r.createContext)(void 0);
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
        return (0, s.jsxs)(o.Provider, {
            value: d,
            children: [a, n && (0, s.jsx)(t, {
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
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 733968)
}, 387125, e => {
    "use strict";
    var t, a, n, i, r, s, o, l, c, u, d, p, f = e.i(711300),
        m = e.i(634203),
        h = e.i(35877),
        g = e.i(747304);

    function y(e, t) {
        var a = (0, g._)(e, t, "update");
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
        w = e.i(772278),
        S = e.i(665564),
        A = e.i(211089),
        E = (t = new WeakMap, class extends A.Subscribable {
            build(e, t, a) {
                var n;
                let i = t.queryKey,
                    r = null != (n = t.queryHash) ? n : (0, b.hashQueryKeyByOptions)(i, t),
                    s = this.get(r);
                return s || (s = new w.Query({
                    client: e,
                    queryKey: i,
                    queryHash: r,
                    options: e.defaultQueryOptions(t),
                    state: a,
                    defaultOptions: e.getQueryDefaults(i)
                }), this.add(s)), s
            }
            add(e) {
                (0, f._)(this, t).has(e.queryHash) || ((0, f._)(this, t).set(e.queryHash, e), this.notify({
                    type: "added",
                    query: e
                }))
            }
            remove(e) {
                let a = (0, f._)(this, t).get(e.queryHash);
                a && (e.destroy(), a === e && (0, f._)(this, t).delete(e.queryHash), this.notify({
                    type: "removed",
                    query: e
                }))
            }
            clear() {
                S.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        this.remove(e)
                    })
                })
            }
            get(e) {
                return (0, f._)(this, t).get(e)
            }
            getAll() {
                return [...(0, f._)(this, t).values()]
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
                S.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            onFocus() {
                S.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onFocus()
                    })
                })
            }
            onOnline() {
                S.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onOnline()
                    })
                })
            }
            constructor(e = {}) {
                super(), (0, m._)(this, t, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, h._)(this, t, new Map)
            }
        }),
        I = e.i(436175),
        C = A,
        T = (a = new WeakMap, n = new WeakMap, i = new WeakMap, class extends C.Subscribable {
            build(e, t, a) {
                let n = new I.Mutation({
                    client: e,
                    mutationCache: this,
                    mutationId: ++y(this, i).value,
                    options: e.defaultMutationOptions(t),
                    state: a
                });
                return this.add(n), n
            }
            add(e) {
                (0, f._)(this, a).add(e);
                let t = R(e);
                if ("string" == typeof t) {
                    let a = (0, f._)(this, n).get(t);
                    a ? a.push(e) : (0, f._)(this, n).set(t, [e])
                }
                this.notify({
                    type: "added",
                    mutation: e
                })
            }
            remove(e) {
                if ((0, f._)(this, a).delete(e)) {
                    let t = R(e);
                    if ("string" == typeof t) {
                        let a = (0, f._)(this, n).get(t);
                        if (a)
                            if (a.length > 1) {
                                let t = a.indexOf(e); - 1 !== t && a.splice(t, 1)
                            } else a[0] === e && (0, f._)(this, n).delete(t)
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
                    let a = (0, f._)(this, n).get(t),
                        i = null == a ? void 0 : a.find(e => "pending" === e.state.status);
                    return !i || i === e
                }
            }
            runNext(e) {
                let t = R(e);
                if ("string" != typeof t) return Promise.resolve();
                {
                    var a, i;
                    let r = null == (i = (0, f._)(this, n).get(t)) ? void 0 : i.find(t => t !== e && t.state.isPaused);
                    return null != (a = null == r ? void 0 : r.continue()) ? a : Promise.resolve()
                }
            }
            clear() {
                S.notifyManager.batch(() => {
                    (0, f._)(this, a).forEach(e => {
                        this.notify({
                            type: "removed",
                            mutation: e
                        })
                    }), (0, f._)(this, a).clear(), (0, f._)(this, n).clear()
                })
            }
            getAll() {
                return Array.from((0, f._)(this, a))
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
                S.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            resumePausedMutations() {
                let e = this.getAll().filter(e => e.state.isPaused);
                return S.notifyManager.batch(() => Promise.all(e.map(e => e.continue().catch(b.noop))))
            }
            constructor(e = {}) {
                super(), (0, m._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, i, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, h._)(this, a, new Set), (0, h._)(this, n, new Map), (0, h._)(this, i, 0)
            }
        });

    function R(e) {
        var t;
        return null == (t = e.options.scope) ? void 0 : t.id
    }
    var _ = e.i(549772),
        P = e.i(841246),
        O = e.i(117437),
        x = (r = new WeakMap, s = new WeakMap, o = new WeakMap, l = new WeakMap, c = new WeakMap, u = new WeakMap, d = new WeakMap, p = new WeakMap, class {
            mount() {
                y(this, u).value++, 1 === (0, f._)(this, u) && ((0, h._)(this, d, _.focusManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onFocus())
                })), (0, h._)(this, p, P.onlineManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, u).value--, 0 === (0, f._)(this, u) && (null == (e = (0, f._)(this, d)) || e.call(this), (0, h._)(this, d, void 0), null == (t = (0, f._)(this, p)) || t.call(this), (0, h._)(this, p, void 0))
            }
            isFetching(e) {
                return (0, f._)(this, r).findAll({
                    ...e,
                    fetchStatus: "fetching"
                }).length
            }
            isMutating(e) {
                return (0, f._)(this, s).findAll({
                    ...e,
                    status: "pending"
                }).length
            }
            getQueryData(e) {
                var t;
                let a = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, f._)(this, r).get(a.queryHash)) ? void 0 : t.state.data
            }
            ensureQueryData(e) {
                let t = this.defaultQueryOptions(e),
                    a = (0, f._)(this, r).build(this, t),
                    n = a.state.data;
                return void 0 === n ? this.fetchQuery(e) : (e.revalidateIfStale && a.isStaleByTime((0, b.resolveStaleTime)(t.staleTime, a)) && this.prefetchQuery(t), Promise.resolve(n))
            }
            getQueriesData(e) {
                return (0, f._)(this, r).findAll(e).map(e => {
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
                    i = (0, f._)(this, r).get(n.queryHash),
                    s = null == i ? void 0 : i.state.data,
                    o = (0, b.functionalUpdate)(t, s);
                if (void 0 !== o) return (0, f._)(this, r).build(this, n).setData(o, {
                    ...a,
                    manual: !0
                })
            }
            setQueriesData(e, t, a) {
                return S.notifyManager.batch(() => (0, f._)(this, r).findAll(e).map(e => {
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
                return null == (t = (0, f._)(this, r).get(a.queryHash)) ? void 0 : t.state
            }
            removeQueries(e) {
                let t = (0, f._)(this, r);
                S.notifyManager.batch(() => {
                    t.findAll(e).forEach(e => {
                        t.remove(e)
                    })
                })
            }
            resetQueries(e, t) {
                let a = (0, f._)(this, r);
                return S.notifyManager.batch(() => (a.findAll(e).forEach(e => {
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
                return Promise.all(S.notifyManager.batch(() => (0, f._)(this, r).findAll(e).map(e => e.cancel(a)))).then(b.noop).catch(b.noop)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return S.notifyManager.batch(() => {
                    var a, n;
                    return ((0, f._)(this, r).findAll(e).forEach(e => {
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
                return Promise.all(S.notifyManager.batch(() => (0, f._)(this, r).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
                    let t = e.fetch(void 0, n);
                    return n.throwOnError || (t = t.catch(b.noop)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(b.noop)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let a = (0, f._)(this, r).build(this, t);
                return a.isStaleByTime((0, b.resolveStaleTime)(t.staleTime, a)) ? a.fetch(t) : Promise.resolve(a.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(b.noop).catch(b.noop)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, O.infiniteQueryBehavior)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(b.noop).catch(b.noop)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, O.infiniteQueryBehavior)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return P.onlineManager.isOnline() ? (0, f._)(this, s).resumePausedMutations() : Promise.resolve()
            }
            getQueryCache() {
                return (0, f._)(this, r)
            }
            getMutationCache() {
                return (0, f._)(this, s)
            }
            getDefaultOptions() {
                return (0, f._)(this, o)
            }
            setDefaultOptions(e) {
                (0, h._)(this, o, e)
            }
            setQueryDefaults(e, t) {
                (0, f._)(this, l).set((0, b.hashKey)(e), {
                    queryKey: e,
                    defaultOptions: t
                })
            }
            getQueryDefaults(e) {
                let t = [...(0, f._)(this, l).values()],
                    a = {};
                return t.forEach(t => {
                    (0, b.partialMatchKey)(e, t.queryKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            setMutationDefaults(e, t) {
                (0, f._)(this, c).set((0, b.hashKey)(e), {
                    mutationKey: e,
                    defaultOptions: t
                })
            }
            getMutationDefaults(e) {
                let t = [...(0, f._)(this, c).values()],
                    a = {};
                return t.forEach(t => {
                    (0, b.partialMatchKey)(e, t.mutationKey) && Object.assign(a, t.defaultOptions)
                }), a
            }
            defaultQueryOptions(e) {
                if (e._defaulted) return e;
                let t = {
                    ...(0, f._)(this, o).queries,
                    ...this.getQueryDefaults(e.queryKey),
                    ...e,
                    _defaulted: !0
                };
                return t.queryHash || (t.queryHash = (0, b.hashQueryKeyByOptions)(t.queryKey, t)), void 0 === t.refetchOnReconnect && (t.refetchOnReconnect = "always" !== t.networkMode), void 0 === t.throwOnError && (t.throwOnError = !!t.suspense), !t.networkMode && t.persister && (t.networkMode = "offlineFirst"), t.queryFn === b.skipToken && (t.enabled = !1), t
            }
            defaultMutationOptions(e) {
                return (null == e ? void 0 : e._defaulted) ? e : {
                    ...(0, f._)(this, o).mutations,
                    ...(null == e ? void 0 : e.mutationKey) && this.getMutationDefaults(e.mutationKey),
                    ...e,
                    _defaulted: !0
                }
            }
            clear() {
                (0, f._)(this, r).clear(), (0, f._)(this, s).clear()
            }
            constructor(e = {}) {
                (0, m._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, r, e.queryCache || new E), (0, h._)(this, s, e.mutationCache || new T), (0, h._)(this, o, e.defaultOptions || {}), (0, h._)(this, l, new Map), (0, h._)(this, c, new Map), (0, h._)(this, u, 0)
            }
        });
    e.s(["QueryClient", 0, x], 387125)
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

//# debugId=4d3269d3-3ee0-e552-8cbd-b0d43eb76b30
//# sourceMappingURL=0w62xzr-f8z7k.js.map