;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c91b1bfd-09bc-bc3a-90ae-c250f25c2a56")
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
        o = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "showTaxonomyOnAvatarItemAnalyticsTab",
            defaultValue: !1
        });
    e.s(["enableAvatarCreationTokenCategories", 0, i, "enableBulkMakeupTokenCreation", 0, r, "enableCreatorShowcases", 0, n, "enableTaxonomyBasedCreatorDashboard", 0, a, "isAutoPublishPreferencesEnabled", 0, o, "showTaxonomyOnAvatarItemAnalyticsTab", 0, s])
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
        }),
        l = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, o, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, s, "isPublishBeforeExposeEnabled", 0, l])
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
        u = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isInGameSalesLicensingEnabled",
            defaultValue: !1
        }),
        c = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30
        }),
        d = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled",
            defaultValue: !1
        });
    e.s(["enableIpPlatformLicenseRecommendations", 0, n, "isAvatarItemLicensingEnabled", 0, l, "isExperiencePreviewEnabled", 0, a, "isIgnoreMatchEnabled", 0, s, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isInGameSalesLicensingEnabled", 0, u, "isIpLicensingEarningsEnabled", 0, i, "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled", 0, d, "isShowcaseExperiencesEnabled", 0, o, "maxCollectibleItemDetailsRequestCount", 0, c])
}, 942100, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "content-publishing",
        name: "isPromotionalTextEnabled",
        defaultValue: !1
    });
    e.s(["isPromotionalTextEnabled", 0, t])
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
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsPostCreationEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, s, "isMomentsPostCreationEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, o, "isTextDocumentEnabled", 0, r])
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        n = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableReachStatusBadge",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["enableEarlyTestersUserOwnedGame", 0, l, "enablePlayerHostedEvents", 0, n, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, o, "enablePlayerSupportCategoryChange", 0, s, "enablePlayerSupportCreatorTicketReroute", 0, i, "enableReachStatusBadge", 0, r])
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
}, 82899, 494192, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["isLeaderboardConfigsEnabled", 0, a], 82899);
    let n = (0, t.defineFlag)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["presetChatEnabled", 0, n], 494192)
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
        });
    e.s(["imageLocalizationSettingsEnabled", 0, a, "imageTranslationAllowlist", 0, n])
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
            if (!a.ok && 500 === i && t < 2) return await new Promise(e => setTimeout(e, 2 ** (t + 1) * 500)), n(e, t + 1);
            if (500 === i && 2 === t) throw Error("Failed to get feature access after 3 attempts");
            let r = await a.json();
            if (!("access" in r)) throw Error('"access" not found in response');
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
        o = e.i(814984),
        s = e.i(904969);
    let l = "CreatorHub.AgeVerificationBannerSettings",
        u = async () => {
            localStorage.removeItem(l)
        }, c = async () => {
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
                return u(), !1
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
        }), m = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, g = async () => await (0, o.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: o
        } = e, [l, u] = (0, a.useState)(!0), [f, v] = (0, a.useState)("doNotShow"), {
            isFetched: h,
            user: y
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: b
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: E,
            isEnabled: I
        } = (0, a.useMemo)(() => {
            let e = m(s.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = m(s.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                a = m(s.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, []), C = (0, a.useCallback)(async () => {
            await d(), u(!0)
        }, [u]);
        (0, a.useEffect)(() => {
            I && h && (null == y ? void 0 : y.id) && (async () => {
                let e = !1;
                try {
                    e = await c()
                } catch (e) {
                    b.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "isDismissedToday",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                u(e);
                let t = "doNotShow";
                try {
                    t = await g()
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
        }, [I, h, y, b]);
        let S = (0, a.useMemo)(() => {
            let e = I && "doNotShow" !== f;
            return {
                isBannerVisible: e && !l,
                isBannerEligible: e,
                isHighPriority: E,
                variant: "doNotShow" !== f ? f : "ageVerification",
                dismissBanner: C
            }
        }, [I, f, l, E, C]);
        return (0, t.jsx)(p.Provider, {
            value: S,
            children: o
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(p)], 906791)
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
        u = new n.DiscoveryApi(s);
    e.s(["ApplicationAuthorizationsClient", 0, {
        authorizationApi: l,
        discoveryApi: u
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
}, 66424, 917870, e => {
    "use strict";
    var t = e.i(137521),
        a = e.i(721281),
        n = e.i(677753);
    class i extends Error {
        constructor(e, t, n) {
            super("Creator Wallets API error: ".concat(e, " ").concat(t)), (0, a._)(this, "status", void 0), (0, a._)(this, "statusText", void 0), (0, a._)(this, "body", void 0), this.name = "CreatorWalletsApiError", this.status = e, this.statusText = t, this.body = n
        }
    }
    async function r(e) {
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
    e.s(["C", 0, i, "m", 0, function(e) {
        var t, a;
        return e && (void 0 !== e.units || void 0 !== e.attos) ? (null != (t = e.units) ? t : 0) + (null != (a = e.attos) ? a : 0) / 1e18 : null
    }, "w", 0, r], 917870);
    var o = e.i(272593);
    let s = new t.CreatorWalletsAPIApi((0, o.createClientConfiguration)("creator-wallets", "bedev2"));

    function l(e) {
        if (void 0 === e) return;
        if (!/^[1-9]\d*$/.test(e)) throw TypeError("Creator Wallet group id must be a positive integer");
        let t = Number(e);
        if (!Number.isSafeInteger(t)) throw TypeError("Creator Wallet group id must be a safe integer");
        return t
    }
    e.s(["default", 0, {
        getOnboardingState(e, t) {
            let a = l(e);
            return r(void 0 === a ? s.v1SelfOnboardingStateGet({}, t) : s.v1GroupCreatorWalletIdGroupIdOnboardingStateGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        getWalletBalance(e, t) {
            let a = l(e);
            return r(void 0 === a ? s.v1SelfWalletBalanceGet({}, t) : s.v1GroupCreatorWalletIdGroupIdWalletBalanceGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        getWalletEarningsEstimate(e, t) {
            let a = l(e);
            return r(void 0 === a ? s.v1SelfWalletEarningsEstimateGet({}, t) : s.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet({
                creatorWalletIdGroupId: a
            }, t))
        },
        listBeneficiaries(e, t, a) {
            let n = l(e),
                i = (null == a ? void 0 : a.includeArchived) ? {
                    includeArchived: !0
                } : {};
            return r(void 0 === n ? s.v1SelfWalletBeneficiariesGet(i, t) : s.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet({
                creatorWalletIdGroupId: n,
                ...i
            }, t))
        },
        initializeKycEmbedding(e, t) {
            let a = l(t);
            return r(void 0 === a ? s.v1SelfOnboardingKycEmbeddinginitializePost({
                initializeKycEmbeddingRequest: e
            }) : s.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeKycEmbeddingRequest: e
            }))
        },
        initializeKycRfiEmbedding(e, t) {
            let a = l(t);
            return r(void 0 === a ? s.v1SelfOnboardingKycRfiEmbeddinginitializePost({
                initializeKycRfiEmbeddingRequest: e
            }) : s.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeKycRfiEmbeddingRequest: e
            }))
        },
        async initializeBeneficiaryEmbedding(e, t) {
            let a = l(t);
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
            }(await r(void 0 === a ? s.v1SelfWalletBeneficiaryEmbeddinginitializePost({
                initializeBeneficiaryEmbeddingRequest: e
            }) : s.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost({
                creatorWalletIdGroupId: a,
                initializeBeneficiaryEmbeddingRequest: e
            })))
        },
        async saveBeneficiary(e, t) {
            let a = l(t);
            return function(e) {
                let {
                    beneficiary: t
                } = e;
                if (!t || "string" != typeof t.beneficiaryId) throw TypeError("SaveBeneficiary returned an unexpected payload");
                return t
            }(await r(void 0 === a ? s.v1SelfWalletBeneficiariesPost({
                saveBeneficiaryRequest: e
            }) : s.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost({
                creatorWalletIdGroupId: a,
                saveBeneficiaryRequest: e
            })))
        },
        archiveBeneficiary(e, t) {
            let a = l(t);
            return r(void 0 === a ? s.v1SelfWalletBeneficiariesBeneficiaryIdDelete({
                beneficiaryId: e
            }) : s.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete({
                creatorWalletIdGroupId: a,
                beneficiaryId: e
            }))
        },
        initiateWithdrawal(e, t) {
            let a = l(t);
            return r(s.v1WalletWithdrawalsPost({
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
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(502585),
        n = e.i(272593);
    let i = new class {
        async getLocale(e) {
            return this.localeApi.v1LocalesGet(e)
        }
        async getUserLocalizationLocusSupportedLocales() {
            return this.localeApi.v1LocalesUserLocalizationLocusSupportedLocalesGet()
        }
        async getSupportedLocalesForCreators(e) {
            return this.localeApi.v1LocalesSupportedLocalesForCreatorsGet(e)
        }
        async getSupportedLocalesForFeature(e) {
            return this.localeApi.v1LocalesSupportedLocalesForFeatureGet(e)
        }
        constructor() {
            (0, t._)(this, "localeApi", void 0), this.localeApi = new a.LocaleApi((0, n.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, i])
}, 607204, e => {
    "use strict";
    var t = e.i(581548),
        a = e.i(272593),
        n = e.i(127403);
    let i = (0, a.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new n.default]
        }),
        r = new t.OrganizationApi(i),
        o = new t.InvitationApi(i),
        s = new t.RoleApi(i),
        l = new t.UserApi(i),
        u = new t.GroupUniversePayoutApi(i);
    e.s(["default", 0, {
        organizationClient: {
            getOrganization: async e => r.v1OrganizationsGet({
                groupId: e
            })
        },
        invitationClient: {
            createInvitation: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsPost({
                organizationId: e,
                createInvitationRequestModel: t
            }),
            getInvitationsByOrganizationId: async (e, t, a) => o.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getInvitation: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, a) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: a
            }),
            deleteInvitationById: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdDelete({
                organizationId: e,
                invitationId: t
            }),
            getRoleIdsByInvitationId: async (e, t) => o.v1OrganizationsOrganizationIdInvitationsInvitationIdRoleIdsGet({
                organizationId: e,
                invitationId: t
            })
        },
        roleClient: {
            createRole: async (e, t) => s.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: a
            }),
            updateRoleMetadata: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: a
            }),
            updateRolePosition: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: a
            }),
            getRolesByOrganization: async (e, t, a) => s.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getUsersWithRole: async (e, t, a, n, i) => s.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n,
                isDefault: i
            }),
            deleteRole: async (e, t) => s.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, a, n) => s.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n
            })
        },
        userClient: {
            getUsersByOrganization: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            removeUserFromOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdDelete({
                organizationId: e,
                userId: t
            }),
            getUserInvitationByOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            getUserPermissions: async (e, t) => {
                let {
                    raw: a
                } = await l.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await a.json()
            },
            getUserRoles: async (e, t, a, n) => l.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: a,
                maxPageSize: n
            }),
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: a
            }),
            removeUserFromRole: async (e, t, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: a
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let a = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return u.v1OrganizationsOrganizationIdPayoutsLatestGet(a)
            },
            getSuggestedPayouts: async e => u.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
                organizationId: e
            })
        }
    }])
}, 196990, 142330, e => {
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
                var u = [s, l];
                if (a) throw TypeError("Generator is already executing.");
                for (; o && (o = 0, u[0] && (r = 0)), r;) try {
                    if (a = 1, n && (i = 2 & u[0] ? n.return : u[0] ? n.throw || ((i = n.return) && i.call(n), 0) : n.next) && !(i = i.call(n, u[1])).done) return i;
                    switch (n = 0, i && (u = [2 & u[0], i.value]), u[0]) {
                        case 0:
                        case 1:
                            i = u;
                            break;
                        case 4:
                            return r.label++, {
                                value: u[1],
                                done: !1
                            };
                        case 5:
                            r.label++, n = u[1], u = [0];
                            continue;
                        case 7:
                            u = r.ops.pop(), r.trys.pop();
                            continue;
                        default:
                            if (!(i = (i = r.trys).length > 0 && i[i.length - 1]) && (6 === u[0] || 2 === u[0])) {
                                r = 0;
                                continue
                            }
                            if (3 === u[0] && (!i || u[1] > i[0] && u[1] < i[3])) {
                                r.label = u[1];
                                break
                            }
                            if (6 === u[0] && r.label < i[1]) {
                                r.label = i[1], i = u;
                                break
                            }
                            if (i && r.label < i[2]) {
                                r.label = i[2], r.ops.push(u);
                                break
                            }
                            i[2] && r.ops.pop(), r.trys.pop();
                            continue
                    }
                    u = t.call(e, r)
                } catch (e) {
                    u = [6, e], n = 0
                } finally {
                    a = i = 0
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

    function u(e) {
        var t;
        return null == (t = e) ? t : {
            id: t.id,
            agreementType: t.agreementType,
            clientType: t.clientType,
            regulationType: t.regulationType,
            displayUrl: t.displayUrl,
            agreementBodyText: (0, a.exists)(t, "agreementBodyText") ? t.agreementBodyText : void 0
        }
    }

    function c(e) {
        if (void 0 !== e) return null === e ? null : {
            agreementId: e.agreementId
        }
    }

    function d(e) {
        if (void 0 !== e) return null === e ? null : {
            acceptances: e.acceptances.map(c)
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
        f = function(e) {
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
                                    return e.map(u)
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
    }, "RegulationType", 0, s], 142330);
    var v = e.i(272593);
    let h = new class {
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
            const e = (0, v.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new f(e), this.acceptanceApi = new g(e)
        }
    };
    e.s(["userAgreementsClient", 0, h], 196990)
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
        u = (0, a.createContext)({
            notificationSettings: [],
            notificationsSettingsContextStored: !1,
            notificationSettingsFailedToLoad: !1,
            notificationSettingsContextLoading: !0,
            getNotificationSettings: () => {},
            setNotificationSettings: () => {}
        });
    e.s(["CreatorNotificationsSettingsContext", 0, u, "default", 0, e => {
        let {
            children: r
        } = e, {
            user: o
        } = (0, n.useAuthentication)(), [c, d] = (0, a.useState)([]), [p, m] = (0, a.useState)(!1), [g, f] = (0, a.useState)(!0), [v, h] = (0, a.useState)(!1), y = (0, a.useCallback)(async () => {
            if (!p && (null == o ? void 0 : o.id) != null) try {
                h(!1), f(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(o.id.toString()),
                    t = (e => {
                        s(e);
                        for (let t = 0; t < e.length; t += 1) l(e[t].notificationCategoryName || "", e[t].notifications || []);
                        return e
                    })(e.categories || []);
                d(t), m(!0)
            } catch (e) {
                h(!0), m(!1)
            } finally {
                f(!1)
            }
        }, [null == o ? void 0 : o.id, p]), b = (0, a.useMemo)(() => ({
            notificationSettings: c,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: v,
            notificationSettingsContextLoading: g,
            getNotificationSettings: y,
            setNotificationSettings: d
        }), [c, v, y, g, p]);
        return (0, t.jsx)(u.Provider, {
            value: b,
            children: r
        })
    }], 354088)
}, 384340, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        permissions: void 0,
        refreshOrganization: () => ({}),
        refreshPermission: () => Promise.resolve(),
        isOrganizationLoading: !1
    });
    a.displayName = "Organization", e.s(["default", 0, a], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(a)
    }], 384340)
}, 911502, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(589624),
        i = e.i(79187),
        r = e.i(814975),
        o = e.i(607204),
        s = e.i(581548),
        l = e.i(881670),
        u = e.i(509049),
        c = e.i(745873),
        d = e.i(748893),
        p = e.i(226519),
        m = e.i(976457),
        g = e.i(668539),
        f = e.i(345886),
        v = e.i(623983),
        h = e.i(697973),
        y = e.i(990729),
        b = e.i(156071),
        E = e.i(790806),
        I = e.i(759283),
        C = e.i(384340);
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
        A = (0, i.withTranslation)(e => {
            let {
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: u
            } = (0, i.useTranslation)(), {
                organization: c
            } = (0, C.default)(), {
                classes: {
                    dialogTitle: h,
                    dialogContent: A,
                    dialogSubActions: w
                }
            } = S(), {
                enqueue: P,
                close: T
            } = (0, y.useSnackbar)(), R = (0, a.useCallback)(e => {
                P({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: I.toastDurationTime,
                    autoHide: !0,
                    onClose: T
                })
            }, [P, T]), [x, O] = (0, a.useState)(), [U, N] = (0, a.useState)(), [L, k] = (0, a.useState)(), [F, z] = (0, a.useState)(), G = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await E.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    k(e.name), z(!1)
                } catch (e) {
                    z(!0)
                }
            }, [l]), V = (0, a.useCallback)(async () => {
                if ((null == c ? void 0 : c.id) && (null == c ? void 0 : c.groupId)) try {
                    let e = await b.default.getGroupInfo(Number.parseInt(c.groupId, 10));
                    O(null == e ? void 0 : e.name)
                } catch (e) {
                    R(u("Error.GroupInformation"))
                }
            }, [null == c ? void 0 : c.groupId, null == c ? void 0 : c.id, R, u]);
            (0, a.useEffect)(() => {
                G(), V()
            }, [V, G]);
            let B = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                D = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        N(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            R(u("Error.DecliningInvitation")), N(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, u]),
                _ = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        N(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            R(u("Error.AcceptingInvitation")), N(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, u]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(g.DialogContent, {
                    className: A,
                    children: (0, t.jsxs)(f.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(f.Grid, {
                            container: !0,
                            children: (0, t.jsx)(v.Typography, {
                                variant: "h4",
                                className: h,
                                children: u("Label.JoinOrganization", {
                                    organizationName: null != x ? x : u("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(f.Grid, {
                            container: !0,
                            children: (0, t.jsx)(v.Typography, {
                                variant: "body1",
                                children: F ? u("Message.JoinOrganizationWithoutUsername") : u("Message.JoinOrganization", {
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
                            disabled: U,
                            children: u("Action.NotNow")
                        }), (0, t.jsxs)(f.Grid, {
                            className: w,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: D,
                                disabled: U,
                                children: u("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: _,
                                loading: U,
                                children: u("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        w = (0, h.makeStyles)()(() => ({
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
        P = (0, i.withTranslation)(e => {
            let {
                open: n,
                onClose: r,
                invitation: o,
                accepted: s
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    dialogTitle: u,
                    dialogContent: c,
                    dialogActions: h
                }
            } = w(), [y, b] = (0, a.useState)(), [I, C] = (0, a.useState)(), S = (0, a.useCallback)(async () => {
                if (null == o ? void 0 : o.senderUserId) try {
                    let e = await E.default.getUserById(Number.parseInt(o.senderUserId, 10));
                    b(e.name), C(!1)
                } catch (e) {
                    C(!0)
                }
            }, [o]);
            (0, a.useEffect)(() => {
                S()
            }, [S]);
            let A = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(g.DialogContent, {
                    className: c,
                    children: (0, t.jsxs)(f.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(v.Typography, {
                            variant: "h4",
                            className: u,
                            children: l(s ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(v.Typography, {
                            variant: "body1",
                            children: s ? (0, t.jsx)(t.Fragment, {
                                children: I ? l("Message.InvitationAcceptedWithoutUsername") : l("Message.InvitationAccepted", {
                                    username: null != y ? y : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: I ? l("Message.InvitationDeclinedWithoutUsername") : l("Message.InvitationDeclined", {
                                    username: null != y ? y : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    className: h,
                    children: (0, t.jsx)(f.Grid, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.Button, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: A,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]);
    var T = e.i(582977),
        R = e.i(672401);
    let x = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, c.useCurrentGroup)(), {
            currentItemGroupId: m
        } = (0, u.default)(), [g, f] = (0, a.useState)(), [v, h] = (0, a.useState)(), [y, b] = (0, a.useState)(), [E, I] = (0, a.useState)(!1), [C, S] = (0, a.useState)(!1), [w, x] = (0, a.useState)(), [O, U] = (0, a.useState)(!1), N = null == d ? void 0 : d.id, L = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : m
        }, [p, m]), k = l.query[T.InviteQueryKey], F = l.isReady, z = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), G = (0, a.useCallback)(async e => {
            if (!N) return void b(null);
            try {
                let t = await o.default.userClient.getUserInvitationByOrganization(e, N.toString());
                b(t)
            } catch (e) {
                b(null), z()
            }
        }, [N, z]), V = (0, a.useCallback)(async e => {
            if (!N) return void h(null);
            try {
                let t = await o.default.userClient.getUserPermissions(e, N.toString());
                h(t)
            } catch (e) {
                h(null)
            }
        }, [N]), B = (0, a.useCallback)(async () => {
            if (F) {
                S(!0);
                try {
                    if ("string" == typeof k) return void await G(k);
                    if (!L) return void f(null);
                    if (b(null), L) {
                        let e = await o.default.organizationClient.getOrganization(L.toString());
                        f(e), await V(e.id)
                    } else f(void 0);
                    I(!1)
                } catch (e) {
                    f(null), h(null), b(null)
                } finally {
                    S(!1)
                }
            }
        }, [L, G, V, k, F]), D = (0, a.useCallback)(() => {
            I(!0), B()
        }, [B]), _ = (0, a.useCallback)(async () => {
            (null == g ? void 0 : g.id) && await V(null == g ? void 0 : g.id)
        }, [V, null == g ? void 0 : g.id]), M = (0, a.useMemo)(() => ({
            organization: g,
            permissions: v,
            refreshOrganization: D,
            refreshPermission: _,
            isOrganizationRefreshRequired: E,
            isOrganizationLoading: C
        }), [g, v, D, _, E, C]);
        return (0, a.useEffect)(() => {
            B()
        }, [B]), (0, t.jsx)(R.default.Provider, {
            value: M,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(A, {
                        open: y.invitationStatusType === s.InvitationStatusType.Open && void 0 === w,
                        onClose: e => {
                            !0 === e ? (x(!0), U(!0)) : !1 === e ? (x(!1), U(!0)) : (z(), b(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(P, {
                        open: O,
                        onClose: () => {
                            U(!1), !0 === w && D(), z()
                        },
                        invitation: y,
                        accepted: !0 === w
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, x], 911502)
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
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let a = Object.entries(e).find(e => {
            let [, a] = e;
            return a === t
        });
        return a ? a[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
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
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        i = e.i(533414),
        r = e.i(157310),
        o = e.i(279149),
        s = e.i(602635),
        l = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        c = new o.GroupsApi(u),
        d = function() {
            let {
                user: e
            } = (0, l.useAuthentication)();
            return (0, r.useQuery)({
                queryKey: s.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: o.GroupListSurface.CreatorHub
                    }, c.groupsListGroups(e)
                }
            })
        },
        p = (0, a.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: r
        } = e, {
            user: o
        } = (0, n.useRobloxAuthentication)(), {
            data: s,
            isLoading: l,
            refetch: u
        } = d(), [c, m] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [g, f] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [v, h] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), y = (0, a.useCallback)(e => {
            f(e);
            let t = null === e ? "user" : e;
            h(e => {
                let a = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: n,
                        lastSelected: i
                    } = e[t];
                    "number" != typeof n || Number.isNaN(n) || "number" != typeof i || Number.isNaN(i) || (a.priority = n * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...e,
                    [t]: a
                }
            })
        }, [f, h]), b = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === c) return [];
            try {
                return "string" == typeof c ? JSON.parse(c) : c
            } catch (e) {
                return []
            }
        }, [c, null == s ? void 0 : s.groups]), E = (0, a.useMemo)(() => {
            var e;
            return g && null != (e = b.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, b]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !l && m(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, b, l, m, null == o ? void 0 : o.id]);
        let I = (0, a.useMemo)(() => ({
            groups: b,
            currentGroup: E,
            groupData: v,
            isFetched: !l && !!(null == o ? void 0 : o.id),
            refreshGroups: u,
            setCurrentGroup: y
        }), [E, v, b, l, u, y, null == o ? void 0 : o.id]);
        return (0, t.jsx)(p.Provider, {
            value: I,
            children: r
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
        o = e.i(811683);
    let s = t.Locale.English,
        l = t.NativeName.English,
        u = s === t.Locale.SimplifiedChinese ? o.default : r.default;
    e.s(["defaultLocale", 0, s, "defaultMetadataJson", 0, u, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(723570),
        i = e => {
            var i, o, s;
            let l, u, {
                    present: c,
                    children: d
                } = e,
                p = function(e) {
                    var a, i;
                    let [o, s] = t.useState(), l = t.useRef(null), u = t.useRef(e), c = t.useRef("none"), [d, p] = (a = e ? "mounted" : "unmounted", i = {
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
                        let a = i[e][t];
                        return null != a ? a : e
                    }, a));
                    return t.useEffect(() => {
                        let e = r(l.current);
                        c.current = "mounted" === d ? e : "none"
                    }, [d]), (0, n.useLayoutEffect)(() => {
                        let t = l.current,
                            a = u.current;
                        if (a !== e) {
                            let n = c.current,
                                i = r(t);
                            e ? p("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? p("UNMOUNT") : a && n !== i ? p("ANIMATION_OUT") : p("UNMOUNT"), u.current = e
                        }
                    }, [e, p]), (0, n.useLayoutEffect)(() => {
                        if (o) {
                            var e;
                            let t, a = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = r(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === o && n && (p("ANIMATION_END"), !u.current)) {
                                        let e = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                        })
                                    }
                                },
                                i = e => {
                                    e.target === o && (c.current = r(l.current))
                                };
                            return o.addEventListener("animationstart", i), o.addEventListener("animationcancel", n), o.addEventListener("animationend", n), () => {
                                a.clearTimeout(t), o.removeEventListener("animationstart", i), o.removeEventListener("animationcancel", n), o.removeEventListener("animationend", n)
                            }
                        }
                        p("ANIMATION_END")
                    }, [o, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            l.current = e ? getComputedStyle(e) : null, s(e)
                        }, [])
                    }
                }(c),
                m = "function" == typeof d ? d({
                    present: p.isPresent
                }) : t.Children.only(d),
                g = (0, a.useComposedRefs)(p.ref, (u = (l = null == (o = Object.getOwnPropertyDescriptor((i = m).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (u = (l = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref);
            return "function" == typeof d || p.isPresent ? t.cloneElement(m, {
                ref: g
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    i.displayName = "Presence", e.s(["Presence", 0, i])
}, 904451, e => {
    "use strict";
    var t = e.i(140625),
        a = e.i(408832),
        n = e.i(197649),
        i = e.i(416340),
        r = e.i(78892),
        o = e.i(608652),
        s = e.i(174617),
        l = e.i(199786),
        u = e.i(300792),
        c = e.i(692166),
        d = e.i(169525),
        p = e.i(600317),
        m = e.i(221628),
        g = "Checkbox",
        [f, v] = (0, o.createContextScope)(g),
        [h, y] = f(g);

    function b(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: r,
            disabled: o,
            form: s,
            name: u,
            onCheckedChange: c,
            required: d,
            value: p = "on",
            internal_do_not_use_render: f
        } = e, [v, y] = (0, l.useControllableState)({
            prop: a,
            defaultProp: null != r && r,
            onChange: c,
            caller: g
        }), [b, E] = i.useState(null), [I, C] = i.useState(null), S = i.useRef(!1), A = !b || !!s || !!b.closest("form"), w = {
            checked: v,
            disabled: o,
            setChecked: y,
            control: b,
            setControl: E,
            name: u,
            form: s,
            value: p,
            hasConsumerStoppedPropagationRef: S,
            required: d,
            defaultChecked: !T(r) && r,
            isFormControl: A,
            bubbleInput: I,
            setBubbleInput: C
        };
        return (0, m.jsx)(h, {
            scope: t,
            ...w,
            children: "function" == typeof f ? f(w) : n
        })
    }
    var E = "CheckboxTrigger",
        I = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: o,
                ...l
            } = e, {
                control: u,
                value: c,
                disabled: d,
                checked: g,
                required: f,
                setControl: v,
                setChecked: h,
                hasConsumerStoppedPropagationRef: b,
                isFormControl: I,
                bubbleInput: C
            } = y(E, a), S = (0, r.useComposedRefs)(t, v), A = i.useRef(g);
            return i.useEffect(() => {
                let e = null == u ? void 0 : u.form;
                if (e) {
                    let t = () => h(A.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [u, h]), (0, m.jsx)(p.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": T(g) ? "mixed" : g,
                "aria-required": f,
                "data-state": R(g),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: c,
                ...l,
                ref: S,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(o, e => {
                    h(e => !!T(e) || !e), C && I && (b.current = e.isPropagationStopped(), b.current || e.stopPropagation())
                })
            })
        });
    I.displayName = E;
    var C = i.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: i,
            defaultChecked: r,
            required: o,
            disabled: s,
            value: l,
            onCheckedChange: u,
            form: c,
            ...d
        } = e;
        return (0, m.jsx)(b, {
            __scopeCheckbox: a,
            checked: i,
            defaultChecked: r,
            disabled: s,
            required: o,
            onCheckedChange: u,
            name: n,
            form: c,
            value: l,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, m.jsxs)(m.Fragment, {
                    children: [(0, m.jsx)(I, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, m.jsx)(P, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    C.displayName = g;
    var S = "CheckboxIndicator",
        A = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...i
            } = e, r = y(S, a);
            return (0, m.jsx)(d.Presence, {
                present: n || T(r.checked) || !0 === r.checked,
                children: (0, m.jsx)(p.Primitive.span, {
                    "data-state": R(r.checked),
                    "data-disabled": r.disabled ? "" : void 0,
                    ...i,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    A.displayName = S;
    var w = "CheckboxBubbleInput",
        P = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: s,
                checked: l,
                defaultChecked: d,
                required: g,
                disabled: f,
                name: v,
                value: h,
                form: b,
                bubbleInput: E,
                setBubbleInput: I
            } = y(w, a), C = (0, r.useComposedRefs)(t, I), S = (0, u.usePrevious)(l), A = (0, c.useSize)(o);
            i.useEffect(() => {
                if (!E) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (S !== l && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    E.indeterminate = T(l), e.call(E, !T(l) && l), E.dispatchEvent(a)
                }
            }, [E, S, l, s]);
            let P = i.useRef(!T(l) && l);
            return (0, m.jsx)(p.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != d ? d : P.current,
                required: g,
                disabled: f,
                name: v,
                value: h,
                form: b,
                ...n,
                tabIndex: -1,
                ref: C,
                style: {
                    ...n.style,
                    ...A,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function T(e) {
        return "indeterminate" === e
    }

    function R(e) {
        return T(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    P.displayName = w;
    let x = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        O = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        U = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        N = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        let {
            label: r,
            className: o,
            isChecked: s,
            isDisabled: l,
            size: u,
            hint: c,
            placement: d,
            onCheckedChange: p,
            id: m,
            ...g
        } = e, f = (0, a.default)(), v = m || f, h = r && i.default.createElement("label", {
            htmlFor: v,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !l && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, n.default)(U[u], N[u], "content-emphasis")
        }, r), c && i.default.createElement("span", {
            className: "text-body-medium content-default"
        }, c));
        return i.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", l && "opacity-[0.5]", !l && "cursor-pointer", o)
        }, "End" === d && h, i.default.createElement("div", {
            className: (0, n.default)(O[u])
        }, i.default.createElement(C, {
            "data-slot": "checkbox",
            className: (0, n.default)(x[u], t.interactable, !l && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: s,
            disabled: l,
            onCheckedChange: p,
            "aria-label": r,
            ...g
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(A, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(x[u], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === d && h)
    }], 904451)
}, 818170, e => {
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
                maxValue: u,
                valuesLocation: c = "None",
                ariaLabel: d,
                ...p
            } = e, m = "Determinate" === o, g = Math.min(100, Math.max(0, s)), f = m && void 0 !== l && "None" !== c, v = m && void 0 !== u && "None" !== c, h = "Sides" === c, y = a.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", h ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: h ? {
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
            })), b = f && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, l), E = v && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, u), I = (f || v) && a.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, f ? b : a.default.createElement("span", null), v ? E : a.default.createElement("span", null));
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": m ? 0 : void 0,
                "aria-valuemax": m ? 100 : void 0,
                "aria-valuenow": m ? g : void 0,
                ...p
            }, h ? a.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, b, y, E) : a.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === c && I, y, "Bottom" === c && I))
        });
    i.displayName = "ProgressBar", e.s(["ProgressBar", 0, i])
}, 990729, e => {
    "use strict";
    var t = e.i(194250),
        a = e.i(416340),
        n = e.i(863762);
    e.i(221628), e.i(149285);
    var i = (0, a.createContext)({
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
        var r, o, s, l, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, a.useRef)(null),
            p = (0, a.useState)(!1),
            m = p[0],
            g = p[1],
            f = (0, a.useState)([]),
            v = f[0],
            h = f[1],
            y = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), h(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [h]),
            b = (0, a.useCallback)(function() {
                g(!1)
            }, [g]);
        (0, a.useEffect)(function() {
            v.length > 0 && g(!0)
        }, [v.length]);
        var E = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: E
        }, u), a.default.createElement(n.S, (0, t._)({}, (null == (r = v[0]) ? void 0 : r.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (o = v[0]) ? void 0 : o.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, i, r;
                    h(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = v[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (r = null == (i = v[0]) ? void 0 : i.props.TransitionProps) || r.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, i;
                (null == (a = v[0]) ? void 0 : a.shouldClose(t)) && g(!1), (null == (n = v[0]) ? void 0 : n.props.onClose) && (null == (i = v[0]) || i.props.onClose(e, t))
            },
            open: m
        }), null == (l = v[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, a.useContext)(i);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
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
        a = new Set(["voice"]),
        n = (e, t) => "".concat(e).concat("/v1/not-approved", "?abuseVector=").concat(encodeURIComponent(t)),
        i = e => "".concat(e).concat("/v1/dismiss-intervention");
    e.s(["getAppealsPortalUrl", 0, e => new URL("/report-appeals", e).toString(), "getDismissInterventionUrl", 0, i, "getModerationDetailUrl", 0, n, "getRegistryEntry", 0, function(e) {
        if (Object.hasOwn(t, e)) return t[e]
    }, "getSafetyDashboardAppealsUrl", 0, e => new URL("/safety-dashboard", e).toString(), "isOverrideBackedAbuseVector", 0, function(e) {
        return a.has(e)
    }], 483939);
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
        }), u = (0, r.useCallback)(e => {
            l({
                request: e,
                open: !0
            })
        }, []), c = (0, r.useCallback)(() => {
            l(e => ({
                ...e,
                open: !1
            }))
        }, []), d = (0, r.useMemo)(() => ({
            showFeatureRestriction: u,
            closeFeatureRestriction: c
        }), [u, c]);
        return (0, o.jsxs)(s.Provider, {
            value: d,
            children: [a, n && (0, o.jsx)(t, {
                request: n,
                open: i,
                onDismiss: c
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
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 200400)
}, 117437, e => {
    "use strict";
    var t = e.i(711367);

    function a(e, t) {
        let {
            pages: a,
            pageParams: n
        } = t, i = a.length - 1;
        return a.length > 0 ? e.getNextPageParam(a[i], a, n[i], n) : void 0
    }

    function n(e, t) {
        var a;
        let {
            pages: n,
            pageParams: i
        } = t;
        return n.length > 0 ? null == (a = e.getPreviousPageParam) ? void 0 : a.call(e, n[0], n, i[0], i) : void 0
    }
    e.s(["hasNextPage", 0, function(e, t) {
        return !!t && null != a(e, t)
    }, "hasPreviousPage", 0, function(e, t) {
        return !!t && !!e.getPreviousPageParam && null != n(e, t)
    }, "infiniteQueryBehavior", 0, function(e) {
        return {
            onFetch: (i, r) => {
                var o, s, l, u, c;
                let d = i.options,
                    p = null == (l = i.fetchOptions) || null == (s = l.meta) || null == (o = s.fetchMore) ? void 0 : o.direction,
                    m = (null == (u = i.state.data) ? void 0 : u.pages) || [],
                    g = (null == (c = i.state.data) ? void 0 : c.pageParams) || [],
                    f = {
                        pages: [],
                        pageParams: []
                    },
                    v = 0,
                    h = async () => {
                        let r = !1,
                            o = (0, t.ensureQueryFn)(i.options, i.fetchOptions),
                            s = async (e, a, n) => {
                                let s;
                                if (r) return Promise.reject();
                                if (null == a && e.pages.length) return Promise.resolve(e);
                                let l = (Object.defineProperty(s = {
                                        client: i.client,
                                        queryKey: i.queryKey,
                                        pageParam: a,
                                        direction: n ? "backward" : "forward",
                                        meta: i.options.meta
                                    }, "signal", {
                                        enumerable: !0,
                                        get: () => (i.signal.aborted ? r = !0 : i.signal.addEventListener("abort", () => {
                                            r = !0
                                        }), i.signal)
                                    }), s),
                                    u = await o(l),
                                    {
                                        maxPages: c
                                    } = i.options,
                                    d = n ? t.addToStart : t.addToEnd;
                                return {
                                    pages: d(e.pages, u, c),
                                    pageParams: d(e.pageParams, a, c)
                                }
                            };
                        if (p && m.length) {
                            let e = "backward" === p,
                                t = {
                                    pages: m,
                                    pageParams: g
                                },
                                i = (e ? n : a)(d, t);
                            f = await s(t, i, e)
                        } else {
                            let t = null != e ? e : m.length;
                            do {
                                var l;
                                let e = 0 === v ? null != (l = g[0]) ? l : d.initialPageParam : a(d, f);
                                if (v > 0 && null == e) break;
                                f = await s(f, e), v++
                            } while (v < t)
                        }
                        return f
                    };
                i.options.persister ? i.fetchFn = () => {
                    var e, t;
                    return null == (e = (t = i.options).persister) ? void 0 : e.call(t, h, {
                        client: i.client,
                        queryKey: i.queryKey,
                        meta: i.options.meta,
                        signal: i.signal
                    }, r)
                } : i.fetchFn = h
            }
        }
    }])
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
}, 725924, e => {
    "use strict";
    let t, a;
    var n, i, r = e.i(416340);
    let o = "u" > typeof Intl,
        s = !o || void 0 === Intl.Locale,
        l = !o || void 0 === Intl.RelativeTimeFormat,
        u = !o || void 0 === Intl.PluralRules,
        c = !o || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (n = s || l || u || c || d, i = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, a = n ? i().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, n] = (0, r.useState)(!a || t);
            return (0, r.useEffect)(() => {
                a && !e && a.then(() => n(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, p], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let a = (0, t.createContext)(null),
        n = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        r = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var o;
        let {
            children: s,
            unifiedLogger: l,
            pageLoggerConfig: u,
            path: c
        } = e, d = null != (o = null == u ? void 0 : u.tags) ? o : n, p = null == u ? void 0 : u.rosId, m = (0, t.useMemo)(() => ({
            tags: d,
            rosId: p,
            path: c
        }), [d, p, c]), g = (0, t.useRef)(m), f = (0, t.useRef)(m);
        (0, t.useLayoutEffect)(() => {
            f.current = m, void 0 === g.current.path && void 0 !== m.path && (g.current = {
                ...g.current,
                path: m.path
            })
        }, [m]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && r.has(a)) ? g.current : f.current;
                void 0 !== n.path && (e.parameters = {
                    ...e.parameters,
                    path: n.path
                }), n.tags.forEach(t => e.addTag(t)), void 0 !== n.rosId && e.addTag("owner: ".concat(n.rosId))
            };
            return i.forEach(t => {
                l.events.on(t, e)
            }), () => {
                i.forEach(t => {
                    l.events.off(t, e)
                })
            }
        }, [l]);
        let v = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: m
        }), [l, m]);
        return t.default.createElement(a.Provider, {
            value: v
        }, s)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=c91b1bfd-09bc-bc3a-90ae-c250f25c2a56
//# sourceMappingURL=416igw-x-4hx0.js.map