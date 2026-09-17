;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "34637486-8355-347d-46f5-d4afe2c1926f")
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
        l = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPricingEligibilityV2Enabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "content-access-and-inventory",
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, o, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, l, "isPublishBeforeExposeEnabled", 0, s])
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
        l = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0
        }),
        s = (0, t.defineFlag)({
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
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30
        }),
        d = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled",
            defaultValue: !1
        });
    e.s(["enableIpPlatformLicenseRecommendations", 0, n, "isAvatarItemLicensingEnabled", 0, s, "isExperiencePreviewEnabled", 0, a, "isIgnoreMatchEnabled", 0, l, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isInGameSalesLicensingEnabled", 0, c, "isIpLicensingEarningsEnabled", 0, i, "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled", 0, d, "isShowcaseExperiencesEnabled", 0, o, "maxCollectibleItemDetailsRequestCount", 0, u])
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
        l = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, o, "isTextDocumentEnabled", 0, r])
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
            name: "enableAudienceReachV2",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        });
    e.s(["enableAudienceReachV2", 0, r, "enablePlayerHostedEvents", 0, n, "enablePlayerSupport", 0, a, "enablePlayerSupportArchive", 0, o, "enablePlayerSupportCreatorTicketReroute", 0, i])
}, 787617, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "creator-platform",
        name: "isUpdatedPublishingFlowEnabled",
        defaultValue: !1
    });
    e.s(["isUpdatedPublishingFlowEnabled", 0, t])
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
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["isLeaderboardConfigsEnabled", 0, t])
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
        l = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "monetization",
            name: "isExperimentEligibilityEnabled",
            defaultValue: !1
        });
    e.s(["isExperimentEligibilityEnabled", 0, s, "isProductArchiveEnabled", 0, o, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, n, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, a, "mockShopItemsExternalEligibility", 0, l])
}, 100022, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "payouts",
        name: "enablePayoutWatermarkContributions",
        defaultValue: !0
    });
    e.s(["enablePayoutWatermarkContributions", 0, t])
}, 494192, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["presetChatEnabled", 0, t])
}, 906791, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        i = e.i(889311),
        r = e.i(823062),
        o = e.i(486736);
    let l = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
        s = encodeURIComponent("studio/CollaborationSettings"),
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
        }, u = async () => await c("".concat(l, "/v1/upsell-feature-access?nameSpace=").concat(s, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", d = "CreatorHub.AgeVerificationBannerSettings", p = async () => {
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
        }, f = async () => {
            localStorage.setItem(d, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, g = (0, a.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), h = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, y = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: l
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: s,
                ageVerificationUpsellBannerEndDate: c,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, o.useSettings)(), [d, p] = (0, a.useState)(!0), [b, S] = (0, a.useState)("doNotShow"), {
            isFetched: w,
            user: x
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: C
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: E,
            isEnabled: P
        } = (0, a.useMemo)(() => {
            let e = h(s),
                t = h(c),
                a = h(u),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, [c, s, u]), A = (0, a.useCallback)(async () => {
            await f(), p(!0)
        }, [p]);
        (0, a.useEffect)(() => {
            P && w && (null == x ? void 0 : x.id) && (async () => {
                let e = !1;
                try {
                    e = await m()
                } catch (e) {
                    C.logErrorEvent({
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
                    C.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                S(t)
            })().catch(e => {
                C.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [P, w, x, C]);
        let R = (0, a.useMemo)(() => {
            let e = P && "doNotShow" !== b;
            return {
                isBannerVisible: e && !d,
                isBannerEligible: e,
                isHighPriority: E,
                variant: "doNotShow" !== b ? b : "ageVerification",
                dismissBanner: A
            }
        }, [P, b, d, E, A]);
        return (0, t.jsx)(g.Provider, {
            value: R,
            children: l
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(g)], 906791)
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
        l = (0, i.createClientConfiguration)("oauth", "bedev2"),
        s = new n.AuthorizationApi(l),
        c = new n.DiscoveryApi(l);
    e.s(["ApplicationAuthorizationsClient", 0, {
        authorizationApi: s,
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
        l = new t.RoleApi(i),
        s = new t.UserApi(i),
        c = new t.GroupUniversePayoutApi(i);
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
            createRole: async (e, t) => l.v1OrganizationsOrganizationIdRolesPost({
                organizationId: e,
                createOrUpdateRoleRequestModel: t
            }),
            getRoleMetadata: async (e, t, a) => l.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: a
            }),
            updateRoleMetadata: async (e, t, a) => l.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: a
            }),
            updateRolePosition: async (e, t, a) => l.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: a
            }),
            getRolesByOrganization: async (e, t, a) => l.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            getUsersWithRole: async (e, t, a, n, i) => l.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n,
                isDefault: i
            }),
            deleteRole: async (e, t) => l.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, a, n) => l.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n
            })
        },
        userClient: {
            getUsersByOrganization: async (e, t, a) => s.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: a
            }),
            removeUserFromOrganization: async (e, t) => s.v1OrganizationsOrganizationIdUsersUserIdDelete({
                organizationId: e,
                userId: t
            }),
            getUserInvitationByOrganization: async (e, t) => s.v1OrganizationsOrganizationIdUsersUserIdInvitationsGet({
                organizationId: e,
                userId: t
            }),
            getUserPermissions: async (e, t) => {
                let {
                    raw: a
                } = await s.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await a.json()
            },
            getUserRoles: async (e, t, a, n) => s.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: a,
                maxPageSize: n
            }),
            addUserToOrganization: async (e, t) => s.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, a) => s.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: a
            }),
            removeUserFromRole: async (e, t, a) => s.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: a
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
                    s(n.next(e))
                } catch (e) {
                    r(e)
                }
            }

            function l(e) {
                try {
                    s(n.throw(e))
                } catch (e) {
                    r(e)
                }
            }

            function s(e) {
                var t;
                e.done ? i(e.value) : ((t = e.value) instanceof a ? t : new a(function(e) {
                    e(t)
                })).then(o, l)
            }
            s((n = n.apply(e, t || [])).next())
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
        return o.next = l(0), o.throw = l(1), o.return = l(2), "function" == typeof Symbol && (o[Symbol.iterator] = function() {
            return this
        }), o;

        function l(l) {
            return function(s) {
                var c = [l, s];
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
    var l = {
        Global: "Global",
        Luobu: "Luobu",
        Europe: "Europe",
        SouthKorea: "SouthKorea"
    };

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
    var f = function(e) {
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
                                        results: (0, a.exists)(e, "results") ? null === e.results ? null : e.results.map(s) : void 0
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
        g = function(e) {
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
    e.s(["AcceptanceApi", 0, f, "AgreementResolutionApi", 0, g, "AgreementType", 0, {
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
    }, "RegulationType", 0, l], 47033);
    var h = e.i(272593);
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
            })).filter(e => e.regulationType !== l.Luobu)
        }
        getUserAgreements(e) {
            return this.agreementResolutionApi.agreementResolutionGetByContext(e)
        }
        constructor() {
            (0, t._)(this, "agreementResolutionApi", void 0), (0, t._)(this, "acceptanceApi", void 0);
            const e = (0, h.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new g(e), this.acceptanceApi = new f(e)
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
}, 718067, e => {
    "use strict";
    var t, a, n, i = ((t = {})[t.Unknown = -1] = "Unknown", t[t.Init = 0] = "Init", t[t.ArchivedExperience = 1] = "ArchivedExperience", t[t.PlayabilityChanged = 2] = "PlayabilityChanged", t[t.NotificationStringCreated = 3] = "NotificationStringCreated", t[t.NotificationStringDeleted = 4] = "NotificationStringDeleted", t[t.NotificationStringUpdated = 5] = "NotificationStringUpdated", t[t.AvatarSettingsAvatarType = 6] = "AvatarSettingsAvatarType", t[t.AvatarSettingsAnimation = 7] = "AvatarSettingsAnimation", t[t.AvatarSettingsCollision = 8] = "AvatarSettingsCollision", t[t.AvatarSettingsScaleHeight = 9] = "AvatarSettingsScaleHeight", t[t.AvatarSettingsScaleWidth = 10] = "AvatarSettingsScaleWidth", t[t.AvatarSettingsScaleHead = 11] = "AvatarSettingsScaleHead", t[t.AvatarSettingsScaleBodyType = 12] = "AvatarSettingsScaleBodyType", t[t.AvatarSettingsScaleProportions = 13] = "AvatarSettingsScaleProportions", t[t.AvatarSettingsBodyParts = 14] = "AvatarSettingsBodyParts", t[t.AvatarSettingsClothing = 15] = "AvatarSettingsClothing", t[t.ExperienceName = 16] = "ExperienceName", t[t.ExperienceDescription = 17] = "ExperienceDescription", t[t.ExperienceGenre = 18] = "ExperienceGenre", t[t.SecuritySettingsHTTPRequests = 19] = "SecuritySettingsHTTPRequests", t[t.SecuritySettingsStudioAccessToAPI = 20] = "SecuritySettingsStudioAccessToAPI", t[t.SecuritySettingsThirdPartySales = 21] = "SecuritySettingsThirdPartySales", t[t.SecuritySettingsThirdPartyTeleports = 22] = "SecuritySettingsThirdPartyTeleports", t[t.ExperienceShutDown = 23] = "ExperienceShutDown", t[t.SocialLinksAdded = 24] = "SocialLinksAdded", t[t.SocialLinksRemoved = 25] = "SocialLinksRemoved", t[t.SocialLinksUpdated = 26] = "SocialLinksUpdated", t[t.SpatialVoice = 27] = "SpatialVoice", t[t.WorldSettingsWorkSpaceGravity = 28] = "WorldSettingsWorkSpaceGravity", t[t.WorldSettingsJumpHeight = 29] = "WorldSettingsJumpHeight", t[t.WorldSettingsJumpPower = 30] = "WorldSettingsJumpPower", t[t.WorldSettingsWalkSpeed = 31] = "WorldSettingsWalkSpeed", t[t.WorldSettingsMaxSlopeAngle = 32] = "WorldSettingsMaxSlopeAngle", t[t.SentUpdate = 33] = "SentUpdate", t[t.SupportedLanguages = 34] = "SupportedLanguages", t[t.AutoTranslationExperienceInformation = 35] = "AutoTranslationExperienceInformation", t[t.AutoTranslationExperienceStringsAndProducts = 36] = "AutoTranslationExperienceStringsAndProducts", t[t.LocalizationSettingsAutomaticTextCapture = 37] = "LocalizationSettingsAutomaticTextCapture", t[t.LocalizationSettingsUserTranslatedContent = 38] = "LocalizationSettingsUserTranslatedContent", t[t.ClearUnmodifiedAutoCaptureEntries = 39] = "ClearUnmodifiedAutoCaptureEntries", t[t.AnalyticsReport = 40] = "AnalyticsReport", t[t.TranslationIconAdded = 41] = "TranslationIconAdded", t[t.TranslationIconDeleted = 42] = "TranslationIconDeleted", t[t.TranslationExperienceName = 43] = "TranslationExperienceName", t[t.TranslationExperienceDescription = 44] = "TranslationExperienceDescription", t[t.TranslationThumbnailAltText = 45] = "TranslationThumbnailAltText", t[t.TranslationThumbnailAdded = 46] = "TranslationThumbnailAdded", t[t.TranslationThumbnailDeleted = 47] = "TranslationThumbnailDeleted", t[t.TranslationThumbnailOrder = 48] = "TranslationThumbnailOrder", t[t.TranslationStringAdded = 49] = "TranslationStringAdded", t[t.TranslationStringDeleted = 50] = "TranslationStringDeleted", t[t.TranslationStringUpdated = 51] = "TranslationStringUpdated", t[t.TranslationBadgeIconDeleted = 52] = "TranslationBadgeIconDeleted", t[t.TranslationBadgeDescription = 53] = "TranslationBadgeDescription", t[t.TranslationBadgeIconAdded = 54] = "TranslationBadgeIconAdded", t[t.TranslationBadgeName = 55] = "TranslationBadgeName", t[t.TranslationDeveloperProductIconDeleted = 56] = "TranslationDeveloperProductIconDeleted", t[t.TranslationDeveloperProductDescription = 57] = "TranslationDeveloperProductDescription", t[t.TranslationDeveloperProductIconAdded = 58] = "TranslationDeveloperProductIconAdded", t[t.TranslationDeveloperProductName = 59] = "TranslationDeveloperProductName", t[t.TranslationGamePassIconDeleted = 60] = "TranslationGamePassIconDeleted", t[t.TranslationGamePassDescription = 61] = "TranslationGamePassDescription", t[t.TranslationGamePassIconAdded = 62] = "TranslationGamePassIconAdded", t[t.TranslationGamePassName = 63] = "TranslationGamePassName", t[t.UserTranslator = 64] = "UserTranslator", t[t.GroupTranslator = 65] = "GroupTranslator", t[t.ExperienceAdvertisement = 66] = "ExperienceAdvertisement", t[t.MonetizationSettingsAccessType = 67] = "MonetizationSettingsAccessType", t[t.MonetizationSettingsRequiresRobux = 68] = "MonetizationSettingsRequiresRobux", t[t.MonetizationSettingsRobuxPrice = 69] = "MonetizationSettingsRobuxPrice", t[t.MonetizationSettingsPlayableDevices = 70] = "MonetizationSettingsPlayableDevices", t[t.MonetizationSettingsAllowPrivateServers = 71] = "MonetizationSettingsAllowPrivateServers", t[t.MonetizationSettingsPrivateServerPrice = 72] = "MonetizationSettingsPrivateServerPrice", t[t.ExperienceSponsor = 73] = "ExperienceSponsor", t[t.BadgeName = 74] = "BadgeName", t[t.BadgeDescription = 75] = "BadgeDescription", t[t.BadgeIcon = 76] = "BadgeIcon", t[t.BadgeCreate = 77] = "BadgeCreate", t[t.DeveloperProductName = 78] = "DeveloperProductName", t[t.DeveloperProductDescription = 79] = "DeveloperProductDescription", t[t.DeveloperProductIcon = 80] = "DeveloperProductIcon", t[t.DeveloperProductPrice = 81] = "DeveloperProductPrice", t[t.DeveloperProductCreate = 82] = "DeveloperProductCreate", t[t.GamePassName = 83] = "GamePassName", t[t.GamePassDescription = 84] = "GamePassDescription", t[t.GamePassIcon = 85] = "GamePassIcon", t[t.GamePassPrice = 86] = "GamePassPrice", t[t.GamePassCreate = 87] = "GamePassCreate", t[t.PermissionsUserAdded = 88] = "PermissionsUserAdded", t[t.PermissionsGroupAdded = 89] = "PermissionsGroupAdded", t[t.PermissionsUserChanged = 90] = "PermissionsUserChanged", t[t.PermissionsUserRemoved = 91] = "PermissionsUserRemoved", t[t.PermissionsGroupChanged = 92] = "PermissionsGroupChanged", t[t.PermissionsGroupRemoved = 93] = "PermissionsGroupRemoved", t[t.TeamCreate = 94] = "TeamCreate", t[t.PlaceIconAutoGenerated = 95] = "PlaceIconAutoGenerated", t[t.PlaceIconChanged = 96] = "PlaceIconChanged", t[t.PlaceIconRemoved = 97] = "PlaceIconRemoved", t[t.PlaceGearGenresOnlyAllowFromExperiencesGenre = 98] = "PlaceGearGenresOnlyAllowFromExperiencesGenre", t[t.PlaceGearGenresAllowAllGearGenres = 99] = "PlaceGearGenresAllowAllGearGenres", t[t.PlaceGearTypes = 100] = "PlaceGearTypes", t[t.PlaceDownloadPermission = 101] = "PlaceDownloadPermission", t[t.PlaceGenre = 102] = "PlaceGenre", t[t.PlaceName = 103] = "PlaceName", t[t.PlaceDescription = 104] = "PlaceDescription", t[t.PlaceMaxVisitorCount = 105] = "PlaceMaxVisitorCount", t[t.PlaceSocialSlotsRobloxOptimized = 106] = "PlaceSocialSlotsRobloxOptimized", t[t.PlaceSocialSlotsDisabled = 107] = "PlaceSocialSlotsDisabled", t[t.PlaceSocialSlotsCustomize = 108] = "PlaceSocialSlotsCustomize", t[t.PlacePermissionsCreatePlaceAPI = 109] = "PlacePermissionsCreatePlaceAPI", t[t.PlacePermissionsSavePlaceAPI = 110] = "PlacePermissionsSavePlaceAPI", t[t.PlaceRevert = 111] = "PlaceRevert", t[t.PlaceShutDown = 112] = "PlaceShutDown", t[t.PlaceRestart = 113] = "PlaceRestart", t[t.PlaceThumbnailAltText = 114] = "PlaceThumbnailAltText", t[t.PlaceThumbnailAdded = 115] = "PlaceThumbnailAdded", t[t.PlaceThumbnailOrder = 116] = "PlaceThumbnailOrder", t[t.PlaceThumbnailDeleted = 117] = "PlaceThumbnailDeleted", t[t.PlaceAdded = 118] = "PlaceAdded", t[t.PlaceRemoved = 119] = "PlaceRemoved", t[t.PlacePublished = 120] = "PlacePublished", t[t.CompletedQuestionnaire = 121] = "CompletedQuestionnaire", t[t.MonetizationSettingsPrivateServerRequiresRobux = 122] = "MonetizationSettingsPrivateServerRequiresRobux", t[t.SecuritySettingsEditableMeshAndTextureAPIAccess = 123] = "SecuritySettingsEditableMeshAndTextureAPIAccess", t[t.PackagePublish = 124] = "PackagePublish", t[t.PackageManualUpdate = 125] = "PackageManualUpdate", t[t.PackageAutoUpdate = 126] = "PackageAutoUpdate", t[t.PackageAutoUpdateToggle = 127] = "PackageAutoUpdateToggle", t[t.RoleCreated = 128] = "RoleCreated", t[t.RoleDeleted = 129] = "RoleDeleted", t[t.RolePermissionsUpdated = 130] = "RolePermissionsUpdated", t[t.RoleNameUpdated = 131] = "RoleNameUpdated", t[t.MemberRemoved = 132] = "MemberRemoved", t[t.MemberInvited = 133] = "MemberInvited", t[t.InviteRevoked = 134] = "InviteRevoked", t[t.MemberJoined = 135] = "MemberJoined", t[t.RoleAssigned = 136] = "RoleAssigned", t[t.RoleUnassigned = 137] = "RoleUnassigned", t[t.GroupIconUpdated = 138] = "GroupIconUpdated", t[t.GroupNameUpdated = 139] = "GroupNameUpdated", t[t.GroupDescriptionUpdated = 140] = "GroupDescriptionUpdated", t[t.GroupSocialLinksUpdated = 141] = "GroupSocialLinksUpdated", t[t.GroupOwnerUpdated = 142] = "GroupOwnerUpdated", t[t.OneTimePayoutSent = 143] = "OneTimePayoutSent", t[t.PayoutsConfigured = 144] = "PayoutsConfigured", t[t.DraftCommit = 145] = "DraftCommit", t[t.ExperiencePermissionsUpdated = 146] = "ExperiencePermissionsUpdated", t[t.ExperienceCreated = 147] = "ExperienceCreated", t[t.AdCreated = 148] = "AdCreated", t[t.PlaceModerated = 149] = "PlaceModerated", t[t.AssetModerated = 150] = "AssetModerated", t[t.EscapeHatchSaveCopyToCloud = 151] = "EscapeHatchSaveCopyToCloud", t),
        r = ((a = {})[a.Universe = 0] = "Universe", a[a.Place = 1] = "Place", a[a.User = 2] = "User", a[a.Badge = 3] = "Badge", a[a.DeveloperProduct = 4] = "DeveloperProduct", a[a.GamePass = 5] = "GamePass", a[a.Group = 6] = "Group", a[a.Robux = 7] = "Robux", a[a.Asset = 8] = "Asset", a),
        o = ((n = {}).ExperienceConfiguration = "Experience Configuration", n.Localization = "Localization", n.Permissions = "Permissions", n.PlaceConfiguration = "Place Configuration", n.PlacePublish = "Place Publish", n.Content = "Content", n);
    let l = new Set([64, 88, 90, 91, 132, 133, 134, 135, 136, 137]);
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
    }, "usernameEvents", 0, l])
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
        l = function(e) {
            let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : r,
                a = Object.keys(t);
            return e.sort((e, t) => o(e.notificationCategoryName, t.notificationCategoryName, a))
        },
        s = function(e, t) {
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
        } = (0, n.useAuthentication)(), [u, d] = (0, a.useState)([]), [p, m] = (0, a.useState)(!1), [f, g] = (0, a.useState)(!0), [h, y] = (0, a.useState)(!1), b = (0, a.useCallback)(async () => {
            if (!p && (null == o ? void 0 : o.id) != null) try {
                y(!1), g(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(o.id.toString()),
                    t = (e => {
                        l(e);
                        for (let t = 0; t < e.length; t += 1) s(e[t].notificationCategoryName || "", e[t].notifications || []);
                        return e
                    })(e.categories || []);
                d(t), m(!0)
            } catch (e) {
                y(!0), m(!1)
            } finally {
                g(!1)
            }
        }, [null == o ? void 0 : o.id, p]), S = (0, a.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: h,
            notificationSettingsContextLoading: f,
            getNotificationSettings: b,
            setNotificationSettings: d
        }), [u, h, b, f, p]);
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
        l = e.i(718067);
    let s = new Map([
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
        f = ((n = f || {}).Members = "Members", n.Invited = "Invited", n);
    let g = {
            CreateOrDeleteRoles: [l.EventType.RoleCreated, l.EventType.RoleDeleted],
            ConfigureRolesPermissions: [l.EventType.RolePermissionsUpdated, l.EventType.ExperiencePermissionsUpdated, r.GroupAuditLogActionTypeEnum.UpdateRoleSetPermissions],
            ConfigureRolesSettings: [l.EventType.RoleNameUpdated, r.GroupAuditLogActionTypeEnum.UpdateRolesetData, r.GroupAuditLogActionTypeEnum.UpdateRoleSetPosition],
            Invitation: [l.EventType.MemberInvited, l.EventType.InviteRevoked],
            ManageMembers: [r.GroupAuditLogActionTypeEnum.JoinGroup, r.GroupAuditLogActionTypeEnum.LeaveGroup, r.GroupAuditLogActionTypeEnum.RemoveMember],
            RoleAssignment: [l.EventType.RoleAssigned, l.EventType.RoleUnassigned],
            SendOneTimePayout: [l.EventType.OneTimePayoutSent],
            GroupInformationUpdate: [r.GroupAuditLogActionTypeEnum.Rename, r.GroupAuditLogActionTypeEnum.UpdateGroupIcon],
            TransferOwnership: [r.GroupAuditLogActionTypeEnum.ChangeOwner],
            CreateExperience: [l.EventType.ExperienceCreated],
            UploadAsset: [r.GroupAuditLogActionTypeEnum.CreateGroupAsset],
            ConfigureRecurringPayouts: [l.EventType.PayoutsConfigured],
            AssetModerated: [l.EventType.AssetModerated, l.EventType.PlaceModerated],
            SpendGroupFunds: [r.GroupAuditLogActionTypeEnum.SpendGroupFunds],
            AdCreated: [r.GroupAuditLogActionTypeEnum.BuyAd]
        },
        h = new Set([l.EventType.ExperiencePermissionsUpdated, l.EventType.ExperienceCreated, l.EventType.PayoutsConfigured, l.EventType.PlaceModerated]);
    e.s(["ActivityHistoryPageSize", 0, 20, "DefaultMemberIdPlaceholder", 0, "-1", "DefaultMemberRoleId", 0, "12884901889", "GroupActivityHistoryEventTypesMapping", 0, g, "GroupActivityHistoryFilterCategoriesMapping", 0, {
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
    }, "GroupMembersMenuState", () => f, "GroupNameChangeCost", 0, 100, "GroupSocialLinkTypesPatternMap", 0, s, "GroupSocialLinkTypesToNameMap", 0, c, "InviteQueryKey", 0, "invitationGroupId", "MaximumRoles", 0, 99, "MembersPageSize", 0, 10, "MigratedGroupStatus", 0, "Migrated", "NewGroupPrice", 0, 100, "RoleColorTypeToHexMap", 0, u, "SocialLinksLimit", 0, 3, "SupportedRoleColorTypes", 0, d, "THIRTY_DAYS", 0, 2592e6, "getEndOfDay", 0, function(e) {
        return new Date(e.getFullYear(), e.getMonth(), e.getDate(), 23, 59, 59, 999)
    }, "noResultsIconPath", 0, "".concat("https://assets.create.roblox.com/c3a2fb37c3375746be217cebd9f7e9d5f968ebf0/assets", "/group/no_results.svg"), "universeEvents", 0, h])
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
        n = e.i(237401),
        i = e.i(79187),
        r = e.i(814975),
        o = e.i(607204),
        l = e.i(581548),
        s = e.i(881670),
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(872204),
        p = e.i(291037),
        m = e.i(35298),
        f = e.i(777004),
        g = e.i(169722),
        h = e.i(199834),
        y = e.i(706442),
        b = e.i(196945),
        S = e.i(156071),
        w = e.i(790806),
        x = e.i(759283),
        C = e.i(384340);
    let E = (0, y.makeStyles)()(() => ({
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
        P = (0, i.withTranslation)(e => {
            let {
                open: n,
                onClose: r,
                invitation: s
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, C.default)(), {
                classes: {
                    dialogTitle: y,
                    dialogContent: P,
                    dialogSubActions: A
                }
            } = E(), {
                enqueue: R,
                close: T
            } = (0, b.useSnackbar)(), I = (0, a.useCallback)(e => {
                R({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: x.toastDurationTime,
                    autoHide: !0,
                    onClose: T
                })
            }, [R, T]), [M, N] = (0, a.useState)(), [k, O] = (0, a.useState)(), [L, F] = (0, a.useState)(), [D, U] = (0, a.useState)(), G = (0, a.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await w.default.getUserById(Number.parseInt(s.senderUserId, 10));
                    F(e.name), U(!1)
                } catch (e) {
                    U(!0)
                }
            }, [s]), z = (0, a.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await S.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    N(null == e ? void 0 : e.name)
                } catch (e) {
                    I(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, I, c]);
            (0, a.useEffect)(() => {
                G(), z()
            }, [z, G]);
            let _ = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                B = (0, a.useCallback)(async () => {
                    if ((null == s ? void 0 : s.organizationId) && (null == s ? void 0 : s.id)) {
                        O(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(s.organizationId, s.id, {
                                status: l.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            I(c("Error.DecliningInvitation")), O(!1)
                        }
                    }
                }, [s.id, s.organizationId, r, I, c]),
                V = (0, a.useCallback)(async () => {
                    if ((null == s ? void 0 : s.organizationId) && (null == s ? void 0 : s.id)) {
                        O(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(s.organizationId, s.id, {
                                status: l.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            I(c("Error.AcceptingInvitation")), O(!1)
                        }
                    }
                }, [s.id, s.organizationId, r, I, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(f.DialogContent, {
                    className: P,
                    children: (0, t.jsxs)(g.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(g.Grid, {
                            container: !0,
                            children: (0, t.jsx)(h.Typography, {
                                variant: "h4",
                                className: y,
                                children: c("Label.JoinOrganization", {
                                    organizationName: null != M ? M : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(g.Grid, {
                            container: !0,
                            children: (0, t.jsx)(h.Typography, {
                                variant: "body1",
                                children: D ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != L ? L : ""
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
                            onClick: _,
                            disabled: k,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(g.Grid, {
                            className: A,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: B,
                                disabled: k,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: V,
                                loading: k,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [s.TranslationNamespace.Organization]),
        A = (0, y.makeStyles)()(() => ({
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
                accepted: l
            } = e, {
                translate: s
            } = (0, i.useTranslation)(), {
                classes: {
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: y
                }
            } = A(), [b, S] = (0, a.useState)(), [x, C] = (0, a.useState)(), E = (0, a.useCallback)(async () => {
                if (null == o ? void 0 : o.senderUserId) try {
                    let e = await w.default.getUserById(Number.parseInt(o.senderUserId, 10));
                    S(e.name), C(!1)
                } catch (e) {
                    C(!0)
                }
            }, [o]);
            (0, a.useEffect)(() => {
                E()
            }, [E]);
            let P = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(f.DialogContent, {
                    className: u,
                    children: (0, t.jsxs)(g.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(h.Typography, {
                            variant: "h4",
                            className: c,
                            children: s(l ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(h.Typography, {
                            variant: "body1",
                            children: l ? (0, t.jsx)(t.Fragment, {
                                children: x ? s("Message.InvitationAcceptedWithoutUsername") : s("Message.InvitationAccepted", {
                                    username: null != b ? b : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: x ? s("Message.InvitationDeclinedWithoutUsername") : s("Message.InvitationDeclined", {
                                    username: null != b ? b : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(m.DialogActions, {
                    className: y,
                    children: (0, t.jsx)(g.Grid, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.Button, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: P,
                            children: s("Action.Close")
                        })
                    })
                })]
            })
        }, [s.TranslationNamespace.Organization]);
    var T = e.i(582977),
        I = e.i(672401);
    let M = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, s = (0, n.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: m
        } = (0, c.default)(), [f, g] = (0, a.useState)(), [h, y] = (0, a.useState)(), [b, S] = (0, a.useState)(), [w, x] = (0, a.useState)(!1), [C, E] = (0, a.useState)(!1), [A, M] = (0, a.useState)(), [N, k] = (0, a.useState)(!1), O = null == d ? void 0 : d.id, L = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : m
        }, [p, m]), F = s.query[T.InviteQueryKey], D = s.isReady, U = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), G = (0, a.useCallback)(async e => {
            if (!O) return void S(null);
            try {
                let t = await o.default.userClient.getUserInvitationByOrganization(e, O.toString());
                S(t)
            } catch (e) {
                S(null), U()
            }
        }, [O, U]), z = (0, a.useCallback)(async e => {
            if (!O) return void y(null);
            try {
                let t = await o.default.userClient.getUserPermissions(e, O.toString());
                y(t)
            } catch (e) {
                y(null)
            }
        }, [O]), _ = (0, a.useCallback)(async () => {
            if (D) {
                E(!0);
                try {
                    if ("string" == typeof F) return void await G(F);
                    if (!L) return void g(null);
                    if (S(null), L) {
                        let e = await o.default.organizationClient.getOrganization(L.toString());
                        g(e), await z(e.id)
                    } else g(void 0);
                    x(!1)
                } catch (e) {
                    g(null), y(null), S(null)
                } finally {
                    E(!1)
                }
            }
        }, [L, G, z, F, D]), B = (0, a.useCallback)(() => {
            x(!0), _()
        }, [_]), V = (0, a.useCallback)(async () => {
            (null == f ? void 0 : f.id) && await z(null == f ? void 0 : f.id)
        }, [z, null == f ? void 0 : f.id]), j = (0, a.useMemo)(() => ({
            organization: f,
            permissions: h,
            refreshOrganization: B,
            refreshPermission: V,
            isOrganizationRefreshRequired: w,
            isOrganizationLoading: C
        }), [f, h, B, V, w, C]);
        return (0, a.useEffect)(() => {
            _()
        }, [_]), (0, t.jsx)(I.default.Provider, {
            value: j,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, b && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(P, {
                        open: b.invitationStatusType === l.InvitationStatusType.Open && void 0 === A,
                        onClose: e => {
                            !0 === e ? (M(!0), k(!0)) : !1 === e ? (M(!1), k(!0)) : (U(), S(null))
                        },
                        invitation: b
                    }), (0, t.jsx)(R, {
                        open: N,
                        onClose: () => {
                            k(!1), !0 === A && B(), U()
                        },
                        invitation: b,
                        accepted: !0 === A
                    })]
                })]
            })
        })
    }, [s.TranslationNamespace.Organization]);
    e.s(["default", 0, M], 911502)
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
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        a = e.i(416340),
        n = e.i(458451),
        i = e.i(533414),
        r = e.i(157310),
        o = e.i(279149),
        l = e.i(602635),
        s = e.i(814975);
    let c = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        u = new o.GroupsApi(c),
        d = function() {
            let {
                user: e
            } = (0, s.useAuthentication)();
            return (0, r.useQuery)({
                queryKey: l.getGroupsQueryKey,
                enabled: !!e,
                queryFn: () => {
                    let e;
                    return e = {
                        surface: o.GroupListSurface.CreatorHub
                    }, u.groupsListGroups(e)
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
            data: l,
            isLoading: s,
            refetch: c
        } = d(), [u, m] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [f, g] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [h, y] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), b = (0, a.useCallback)(e => {
            g(e);
            let t = null === e ? "user" : e;
            y(e => {
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
        }, [g, y]), S = (0, a.useMemo)(() => {
            if (null == l ? void 0 : l.groups) return null == l ? void 0 : l.groups;
            if (null === u) return [];
            try {
                return "string" == typeof u ? JSON.parse(u) : u
            } catch (e) {
                return []
            }
        }, [u, null == l ? void 0 : l.groups]), w = (0, a.useMemo)(() => {
            var e;
            return f && null != (e = S.find(e => {
                let {
                    id: t
                } = e;
                return t === f
            })) ? e : null
        }, [f, S]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == l ? void 0 : l.groups) && !s && m(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, S, s, m, null == o ? void 0 : o.id]);
        let x = (0, a.useMemo)(() => ({
            groups: S,
            currentGroup: w,
            groupData: h,
            isFetched: !s && !!(null == o ? void 0 : o.id),
            refreshGroups: c,
            setCurrentGroup: b
        }), [w, h, S, s, c, b, null == o ? void 0 : o.id]);
        return (0, t.jsx)(p.Provider, {
            value: x,
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
    let l = t.Locale.English,
        s = t.NativeName.English,
        c = l === t.Locale.SimplifiedChinese ? o.default : r.default;
    e.s(["defaultLocale", 0, l, "defaultMetadataJson", 0, c, "defaultNativeName", 0, s, "fallbackLocale", 0, void 0], 272749)
}, 46938, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(52746),
        n = e.i(962192),
        i = e.i(197649),
        r = e.i(416340);
    let o = {
            Info: "rgb(from var(--color-system-emphasis) r g b / ".concat(.05, ")"),
            Warning: "rgb(from var(--color-system-warning) r g b / ".concat(.05, ")"),
            Success: "rgb(from var(--color-system-success) r g b / ".concat(.05, ")"),
            Error: "rgb(from var(--color-system-alert) r g b / ".concat(.05, ")")
        },
        l = {
            Info: "stroke-system-emphasis",
            Warning: "stroke-system-warning",
            Success: "stroke-system-success",
            Error: "stroke-system-alert"
        },
        s = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        c = {
            Info: "var(--inverse-system-emphasis)",
            Warning: "var(--inverse-system-warning)",
            Success: "var(--inverse-system-success)",
            Error: "var(--inverse-system-alert)"
        },
        u = {
            Info: "bg-action-standard",
            Warning: "bg-inverse-action-standard",
            Success: "bg-inverse-action-standard",
            Error: "bg-action-standard"
        },
        d = (0, r.forwardRef)((e, d) => {
            let {
                title: p,
                description: m,
                linkLabel: f,
                linkHref: g,
                onLinkClick: h,
                showIcon: y = !0,
                infoIconOverride: b,
                layout: S = "Inline",
                variant: w = "Standard",
                severity: x = "Info",
                primaryActionLabel: C,
                onPrimaryAction: E,
                secondaryActionLabel: P,
                onSecondaryAction: A,
                actions: R,
                onDismiss: T,
                dismissIconAriaLabel: I = "Dismiss banner",
                className: M,
                style: N,
                ...k
            } = e, O = o[x], L = "Emphasis" === w ? u[x] : "", F = "Info" === x && b ? b : s[x], D = "Stacked" === S, U = !!R || !!(C && E) || !!(P && A), G = f && r.default.createElement("a", {
                className: "text-body-medium underline content-default text-wrap [overflow-wrap:anywhere]",
                href: g,
                onClick: h
            }, f), z = G && r.default.createElement("span", {
                className: "min-width-0 max-width-full"
            }, D || !m ? " · " : " · ", G), _ = null != R ? R : C && E || P && A ? r.default.createElement("div", {
                className: "flex items-center gap-small wrap"
            }, C && E && r.default.createElement(a.Button, {
                size: "Small",
                variant: "Standard",
                onClick: E,
                className: (0, i.default)("content-emphasis label-small", L)
            }, C), P && A && r.default.createElement(a.Button, {
                size: "Small",
                variant: "Utility",
                onClick: A,
                className: (0, i.default)("content-emphasis label-small")
            }, P)) : null, B = T && r.default.createElement(n.CloseAffordance, {
                variant: "Utility",
                size: "Small",
                isCircular: !0,
                className: "content-emphasis",
                "aria-label": I,
                onClick: T
            });
            return r.default.createElement("div", {
                ref: d,
                role: "Warning" === x || "Error" === x ? "alert" : "status",
                className: (0, i.default)("foundation-web-feedback-banner flex flex-col gap-small radius-medium padding-large stroke-standard", "Standard" === w ? "bg-shift-100" : void 0, "Standard" === w ? "stroke-default" : l[x], M),
                style: {
                    backgroundColor: "Emphasis" === w ? O : void 0,
                    ...N
                },
                ...k
            }, r.default.createElement("div", {
                className: (0, i.default)("flex width-full gap-medium", D ? "items-start" : "items-center wrap")
            }, r.default.createElement("div", {
                className: (0, i.default)("flex grow-1", D ? "flex-col gap-medium basis-0 min-width-0" : "items-center gap-xsmall wrap basis-0 min-width-[min(200px,100%)]")
            }, r.default.createElement("div", {
                className: (0, i.default)("flex min-width-0", D ? "gap-medium flex-col grow-1 basis-0" : "gap-xsmall items-center wrap width-full")
            }, r.default.createElement("div", {
                className: "flex items-center gap-xsmall wrap"
            }, r.default.createElement("div", {
                className: (0, i.default)("flex items-center gap-medium", D ? "min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, y && F && r.default.createElement(t.Icon, {
                name: F,
                size: "Large",
                className: "shrink-0",
                style: {
                    color: c[x]
                }
            }), r.default.createElement("span", {
                className: (0, i.default)("text-label-medium text-wrap content-emphasis [overflow-wrap:anywhere]", D ? "" : "block padding-y-xsmall min-width-0 grow-1 basis-0")
            }, p)), D && z), m && (D ? r.default.createElement("div", {
                className: (0, i.default)("text-body-medium text-wrap content-default width-full [overflow-wrap:anywhere]")
            }, m) : r.default.createElement("span", {
                className: "text-body-medium text-wrap content-default block min-width-0 max-width-full [overflow-wrap:anywhere]"
            }, m, z)), !D && !m && z), D && U && _), !D && (U || T) && r.default.createElement("div", {
                className: "flex items-center justify-end gap-small wrap shrink-0 max-width-full margin-left-auto"
            }, U && _, B), D && B && r.default.createElement("div", {
                className: "shrink-0"
            }, B)))
        });
    e.s(["FeedbackBanner", 0, d])
}, 808048, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(23342);
    let i = new Set(["_self", "_parent", "_top"]),
        r = {
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        o = {
            Standard: "content-emphasis",
            Emphasis: "content-emphasis",
            Inverse: "content-inverse-default"
        },
        l = (0, a.forwardRef)((e, l) => {
            var s, c, u;
            let {
                children: d,
                className: p,
                size: m,
                color: f = "Emphasis",
                variant: g = "Standalone",
                underline: h = "hover",
                isExternal: y,
                asChild: b,
                ...S
            } = e, w = (c = null != (s = S.as) ? s : "a", u = "button" === S.as ? void 0 : S.target, void 0 !== y ? y : "button" !== c && void 0 !== u && !i.has(u)), x = (0, t.default)("foundation-web-link", "button" === S.as && "bg-none stroke-none padding-none appearance-none [text-align:inherit]", ("Standalone" === g || w) && "inline-flex items-center gap-xsmall", void 0 !== m && r[m], o[f], "always" === h ? "underline" : "no-underline", "hover" === h && "hover:underline", "motion-safe:transition-opacity", "hover:cursor-pointer hover:[opacity:0.8]", "radius-xsmall focus-visible:[outline-style:solid] focus-visible:[outline-width:var(--stroke-standard)] focus-visible:[outline-color:var(--color-system-emphasis)]", p), C = w ? a.default.createElement("span", {
                "aria-hidden": !0,
                "data-testid": "foundation-web-icon",
                className: (0, t.default)("grow-0 shrink-0 basis-auto icon size-[1em]", "icon-regular-arrow-up-right-from-square")
            }) : null;
            if (b) {
                let {
                    as: e,
                    ...t
                } = S, i = a.default.Children.only(d);
                return a.default.isValidElement(i) ? a.default.createElement(n.Slot, {
                    ref: l,
                    ...t,
                    className: x
                }, a.default.cloneElement(i, {}, a.default.createElement(a.default.Fragment, null, i.props.children, C))) : null
            }
            if ("button" === S.as) {
                let {
                    as: e,
                    type: t,
                    ...n
                } = S;
                return a.default.createElement("button", {
                    ref: l,
                    type: null != t ? t : "button",
                    ...n,
                    className: x
                }, d, C)
            }
            let {
                as: E,
                ...P
            } = S;
            return a.default.createElement("a", {
                ref: l,
                ...P,
                className: x
            }, d, C)
        });
    l.displayName = "Link", e.s(["Link", 0, l])
}, 339338, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340),
        n = e.i(734463);
    let i = e => {
        var t, a, n, i, r, o;
        let l = null != (t = null == (n = (i = window).matchMedia) || null == (a = n.call(i, "(pointer: coarse)")) ? void 0 : a.matches) && t,
            s = null == (r = document.activeElement) ? void 0 : r.matches(":focus-visible");
        if (l && !s) return void e.preventDefault();
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
            sideOffset: l = 4,
            className: s,
            children: c,
            ariaLabel: u,
            onOpenAutoFocus: d,
            ...p
        } = e;
        return a.createElement(n.Portal, null, a.createElement(n.Content, {
            side: r,
            align: o,
            sideOffset: l,
            ...p,
            "aria-label": null != u ? u : p["aria-label"],
            onOpenAutoFocus: null != d ? d : i,
            className: (0, t.default)("foundation-web-portal-zindex", s)
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
                value: l = 0,
                minValue: s,
                maxValue: c,
                valuesLocation: u = "None",
                ariaLabel: d,
                ...p
            } = e, m = "Determinate" === o, f = Math.min(100, Math.max(0, l)), g = m && void 0 !== s && "None" !== u, h = m && void 0 !== c && "None" !== u, y = "Sides" === u, b = a.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", y ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: y ? {
                    flexBasis: 0
                } : void 0
            }, m ? a.default.createElement("div", {
                className: "absolute top-0 left-0 height-100 radius-circle transition-all duration-300 ease-out",
                style: {
                    width: "".concat(f, "%"),
                    backgroundColor: "var(--fui-future-alpha-color-system-progress)"
                }
            }) : a.default.createElement("div", {
                className: "foundation-web-progress-bar-indeterminate absolute top-0 height-100 radius-circle"
            })), S = g && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, s), w = h && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, c), x = (g || h) && a.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, g ? S : a.default.createElement("span", null), h ? w : a.default.createElement("span", null));
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": m ? 0 : void 0,
                "aria-valuemax": m ? 100 : void 0,
                "aria-valuenow": m ? f : void 0,
                ...p
            }, y ? a.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, S, b, w) : a.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === u && x, b, "Bottom" === u && x))
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
                variant: l = "Determinate",
                value: s = 0,
                showValue: c = !1,
                ariaLabel: u,
                ...d
            } = e, {
                dimension: p,
                strokeWidth: m,
                textClass: f,
                valueContainerSize: g
            } = n[o], h = (p - m) / 2, y = 2 * Math.PI * h, b = p / 2, S = Math.min(100, Math.max(0, s)), w = c && void 0 !== g ? g : p, x = "Determinate" === l;
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", r),
                role: "progressbar",
                "aria-label": u,
                "aria-valuemin": x ? 0 : void 0,
                "aria-valuemax": x ? 100 : void 0,
                "aria-valuenow": x ? S : void 0,
                style: {
                    width: w,
                    height: w
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
                r: h,
                fill: "none",
                strokeWidth: m,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: b,
                cy: b,
                r: h,
                fill: "none",
                strokeWidth: m,
                strokeDasharray: x ? y : "".concat(.75 * y, " ").concat(.25 * y),
                strokeDashoffset: x ? y * (1 - S / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!x && "foundation-web-progress-circle-indeterminate"),
                style: x ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), x && c && "Large" === o && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", f),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(S)), a.default.createElement("span", null, "%")))
        });
    i.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, i])
}, 161048, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(823981),
        n = e.i(39210),
        i = e.i(339855),
        r = e.i(197649),
        o = e.i(416340),
        l = e.i(174617),
        s = e.i(78892),
        c = e.i(608652),
        u = e.i(600317),
        d = e.i(142953),
        p = e.i(199786),
        m = e.i(974539),
        f = e.i(692166),
        g = e.i(300792),
        h = e.i(169525),
        y = e.i(221628),
        b = "Radio",
        [S, w] = (0, c.createContextScope)(b),
        [x, C] = S(b),
        E = o.forwardRef((e, t) => {
            let {
                __scopeRadio: a,
                name: n,
                checked: i = !1,
                required: r,
                disabled: c,
                value: d = "on",
                onCheck: p,
                form: m,
                ...f
            } = e, [g, h] = o.useState(null), b = (0, s.useComposedRefs)(t, e => h(e)), S = o.useRef(!1), w = !g || m || !!g.closest("form");
            return (0, y.jsxs)(x, {
                scope: a,
                checked: i,
                disabled: c,
                children: [(0, y.jsx)(u.Primitive.button, {
                    type: "button",
                    role: "radio",
                    "aria-checked": i,
                    "data-state": T(i),
                    "data-disabled": c ? "" : void 0,
                    disabled: c,
                    value: d,
                    ...f,
                    ref: b,
                    onClick: (0, l.composeEventHandlers)(e.onClick, e => {
                        i || null == p || p(), w && (S.current = e.isPropagationStopped(), S.current || e.stopPropagation())
                    })
                }), w && (0, y.jsx)(R, {
                    control: g,
                    bubbles: !S.current,
                    name: n,
                    value: d,
                    checked: i,
                    required: r,
                    disabled: c,
                    form: m,
                    style: {
                        transform: "translateX(-100%)"
                    }
                })]
            })
        });
    E.displayName = b;
    var P = "RadioIndicator",
        A = o.forwardRef((e, t) => {
            let {
                __scopeRadio: a,
                forceMount: n,
                ...i
            } = e, r = C(P, a);
            return (0, y.jsx)(h.Presence, {
                present: n || r.checked,
                children: (0, y.jsx)(u.Primitive.span, {
                    "data-state": T(r.checked),
                    "data-disabled": r.disabled ? "" : void 0,
                    ...i,
                    ref: t
                })
            })
        });
    A.displayName = P;
    var R = o.forwardRef((e, t) => {
        let {
            __scopeRadio: a,
            control: n,
            checked: i,
            bubbles: r = !0,
            ...l
        } = e, c = o.useRef(null), d = (0, s.useComposedRefs)(c, t), p = (0, g.usePrevious)(i), m = (0, f.useSize)(n);
        return o.useEffect(() => {
            let e = c.current;
            if (!e) return;
            let t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
            if (p !== i && t) {
                let a = new Event("click", {
                    bubbles: r
                });
                t.call(e, i), e.dispatchEvent(a)
            }
        }, [p, i, r]), (0, y.jsx)(u.Primitive.input, {
            type: "radio",
            "aria-hidden": !0,
            defaultChecked: i,
            ...l,
            tabIndex: -1,
            ref: d,
            style: {
                ...l.style,
                ...m,
                position: "absolute",
                pointerEvents: "none",
                opacity: 0,
                margin: 0
            }
        })
    });

    function T(e) {
        return e ? "checked" : "unchecked"
    }
    R.displayName = "RadioBubbleInput";
    var I = ["ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight"],
        M = "RadioGroup",
        [N, k] = (0, c.createContextScope)(M, [d.createRovingFocusGroupScope, w]),
        O = (0, d.createRovingFocusGroupScope)(),
        L = w(),
        [F, D] = N(M),
        U = o.forwardRef((e, t) => {
            let {
                __scopeRadioGroup: a,
                name: n,
                defaultValue: i,
                value: r,
                required: o = !1,
                disabled: l = !1,
                orientation: s,
                dir: c,
                loop: f = !0,
                onValueChange: g,
                ...h
            } = e, b = O(a), S = (0, m.useDirection)(c), [w, x] = (0, p.useControllableState)({
                prop: r,
                defaultProp: null != i ? i : null,
                onChange: g,
                caller: M
            });
            return (0, y.jsx)(F, {
                scope: a,
                name: n,
                required: o,
                disabled: l,
                value: w,
                onValueChange: x,
                children: (0, y.jsx)(d.Root, {
                    asChild: !0,
                    ...b,
                    orientation: s,
                    dir: S,
                    loop: f,
                    children: (0, y.jsx)(u.Primitive.div, {
                        role: "radiogroup",
                        "aria-required": o,
                        "aria-orientation": s,
                        "data-disabled": l ? "" : void 0,
                        dir: S,
                        ...h,
                        ref: t
                    })
                })
            })
        });
    U.displayName = M;
    var G = "RadioGroupItem",
        z = o.forwardRef((e, t) => {
            let {
                __scopeRadioGroup: a,
                disabled: n,
                ...i
            } = e, r = D(G, a), c = r.disabled || n, u = O(a), p = L(a), m = o.useRef(null), f = (0, s.useComposedRefs)(t, m), g = r.value === i.value, h = o.useRef(!1);
            return o.useEffect(() => {
                let e = e => {
                        I.includes(e.key) && (h.current = !0)
                    },
                    t = () => h.current = !1;
                return document.addEventListener("keydown", e), document.addEventListener("keyup", t), () => {
                    document.removeEventListener("keydown", e), document.removeEventListener("keyup", t)
                }
            }, []), (0, y.jsx)(d.Item, {
                asChild: !0,
                ...u,
                focusable: !c,
                active: g,
                children: (0, y.jsx)(E, {
                    disabled: c,
                    required: r.required,
                    checked: g,
                    ...p,
                    ...i,
                    name: r.name,
                    ref: f,
                    onCheck: () => r.onValueChange(i.value),
                    onKeyDown: (0, l.composeEventHandlers)(e => {
                        "Enter" === e.key && e.preventDefault()
                    }),
                    onFocus: (0, l.composeEventHandlers)(i.onFocus, () => {
                        var e;
                        h.current && (null == (e = m.current) || e.click())
                    })
                })
            })
        });
    z.displayName = G;
    var _ = o.forwardRef((e, t) => {
        let {
            __scopeRadioGroup: a,
            ...n
        } = e, i = L(a);
        return (0, y.jsx)(A, {
            ...i,
            ...n,
            ref: t
        })
    });
    _.displayName = "RadioGroupIndicator";
    let B = "Medium",
        V = "Start",
        j = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        q = {
            XSmall: "size-150",
            Small: "size-200",
            Medium: "size-250",
            Large: "size-250"
        },
        H = {
            XSmall: "gap-medium",
            Small: "gap-medium",
            Medium: "gap-medium",
            Large: "gap-large"
        },
        W = {
            XSmall: "gap-medium",
            Small: "gap-large",
            Medium: "gap-large"
        },
        Q = {
            XSmall: "gap-small",
            Small: "gap-medium",
            Medium: "gap-medium"
        },
        K = {
            XSmall: "text-title-small",
            Small: "text-title-small",
            Medium: "text-title-medium"
        },
        X = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        J = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        Y = (0, o.createContext)({
            size: B,
            placement: V
        }),
        $ = o.default.forwardRef((e, t) => {
            let {
                groupLabel: a,
                labelTooltip: l,
                size: s,
                placement: c,
                isDisabled: u,
                className: d,
                children: p,
                id: m,
                ...f
            } = e, g = (0, n.default)(), h = m || g, y = null != s ? s : B, b = null != c ? c : V, S = (0, o.useMemo)(() => ({
                size: y,
                placement: b,
                disabled: null != u && u
            }), [y, b, u]), w = a ? o.default.createElement("label", {
                htmlFor: h,
                className: (0, r.default)("foundation-web-radio-group-label", K[y], "content-default", !l && "padding-bottom-small")
            }, a) : null, x = w && l ? o.default.createElement("div", {
                className: "flex items-center gap-xsmall padding-bottom-small"
            }, w, o.default.createElement(i.LabelTooltip, l)) : w;
            return o.default.createElement(Y.Provider, {
                value: S
            }, o.default.createElement("div", {
                className: (0, r.default)("flex fill flex-col", W[y])
            }, x, o.default.createElement(U, {
                ref: t,
                id: h,
                className: (0, r.default)("foundation-web-radio-group", "flex flex-col", Q[y], d),
                ...f
            }, p)))
        });
    $.displayName = "RadioGroup";
    let Z = o.default.forwardRef((e, i) => {
        let {
            className: l,
            value: s,
            isDisabled: c,
            label: u,
            "aria-label": d,
            "aria-labelledby": p,
            hint: m,
            id: f,
            size: g,
            placement: h,
            ...y
        } = e, b = (0, o.useRef)(null), S = (0, o.useRef)(null), [w, x] = (0, o.useState)(!1), {
            size: C,
            placement: E,
            disabled: P
        } = (() => {
            let e = (0, o.useContext)(Y);
            if (!e) throw Error("Radio must be used within a RadioGroup");
            return e
        })(), A = null != g ? g : C, R = null != h ? h : E, T = (0, n.default)(), I = f || T, M = void 0 !== u && "" !== u, N = "".concat(I, "Label"), k = M ? N : p, O = !!m, L = c || P;
        return (0, o.useEffect)(() => {
            let e = new ResizeObserver(() => {
                let e = b.current,
                    t = S.current,
                    a = e => {
                        if (!e) return !1;
                        let t = parseFloat(getComputedStyle(e).lineHeight);
                        return Math.round(e.scrollHeight / t) > 1
                    };
                x(a(e) || a(t))
            });
            return b.current && e.observe(b.current), S.current && e.observe(S.current), () => e.disconnect()
        }, [O, M]), o.default.createElement("div", {
            className: (0, r.default)("flex gap-medium", {
                [a.disabledOpacity]: L,
                "cursor-pointer": !L,
                "flex-row": "Start" === R,
                "flex-row-reverse": "End" === R
            })
        }, o.default.createElement(z, {
            ref: i,
            className: (0, r.default)("foundation-web-radio", t.interactable, !L && "cursor-pointer", "padding-none shrink-0 grow-0 basis-auto flex items-center justify-center bg-none data-[state=checked]:bg-action-sub-emphasis radius-circle stroke-contrast-alpha stroke-standard", H[A], j[A], l),
            disabled: L,
            value: s,
            id: I,
            "aria-describedby": O ? "".concat(I, "Hint") : void 0,
            "aria-label": d,
            "aria-labelledby": k,
            ...y
        }, o.default.createElement(t.StateLayer, null), o.default.createElement(_, {
            className: (0, r.default)("radius-circle bg-inverse-action-sub-emphasis", q[A])
        })), o.default.createElement("div", {
            className: (0, r.default)("flex fill flex-col width-full", {
                "gap-xsmall": w,
                "gap-none": !w,
                "padding-top-xxsmall": "XSmall" !== A
            })
        }, M && o.default.createElement("label", {
            ref: b,
            id: N,
            htmlFor: I,
            "aria-describedby": O ? "".concat(I, "Hint") : void 0,
            className: (0, r.default)(X[A], "content-emphasis", !L && "cursor-pointer")
        }, u), O && o.default.createElement("div", {
            ref: S,
            id: "".concat(I, "Hint"),
            className: (0, r.default)(J[A], "content-default")
        }, m)))
    });
    Z.displayName = "Radio", e.s(["Radio", 0, Z, "RadioGroup", 0, $], 161048)
}, 110906, e => {
    "use strict";
    var t = e.i(823981),
        a = e.i(688702),
        n = e.i(197649),
        i = e.i(416340);
    let r = {
            Medium: {
                width: "30px",
                height: "30px"
            },
            Small: {
                width: "24px",
                height: "24px"
            },
            XSmall: {
                width: "24px",
                height: "24px"
            }
        },
        o = {
            inset: "16.67%"
        },
        l = {
            Medium: "gap-small",
            Small: "gap-small",
            XSmall: "gap-xsmall"
        },
        s = {
            Medium: "padding-y-medium",
            Small: "padding-y-small",
            XSmall: "padding-y-xsmall"
        },
        c = {
            Medium: "text-title-medium",
            Small: "text-title-small",
            XSmall: "text-title-small"
        },
        u = {
            Medium: "text-body-medium",
            Small: "text-body-small",
            XSmall: "text-body-small"
        },
        d = {
            Medium: "text-body-medium",
            Small: "text-body-small",
            XSmall: "text-body-small"
        },
        p = {
            Medium: "text-label-medium",
            Small: "text-label-small",
            XSmall: "text-caption-small"
        },
        m = {
            Medium: "text-body-medium",
            Small: "text-body-small",
            XSmall: "text-caption-small"
        },
        f = {
            Medium: "Medium",
            Small: "Small",
            XSmall: "Small"
        };
    e.s(["Stepper", 0, e => {
        let {
            steps: g,
            currentStepIndex: h = 0,
            size: y = "Medium",
            borderPosition: b = "Bottom",
            isCompact: S,
            showDescription: w = !0,
            className: x,
            "aria-label": C
        } = e, E = (0, i.useRef)(null), P = (0, i.useRef)([]), A = g.length, R = h >= A, T = A <= 0 || h < 0 ? 0 : h >= A ? A - 1 : h;
        if ((0, i.useLayoutEffect)(() => {
                if (0 === A || S) return;
                let e = P.current[T];
                e && e.scrollIntoView({
                    behavior: "smooth",
                    inline: "center",
                    block: "nearest",
                    container: "nearest"
                })
            }, [S, T, A]), 0 === A) return null;
        let I = g.map((e, t) => {
            let a;
            return a = e.state ? e.state : R || t < T ? "complete" : t === T ? "current" : "upcoming", {
                ...e,
                state: a
            }
        });
        if (P.current.length = A, S) {
            let e = I[T],
                t = null != C ? C : "Step ".concat(T + 1, " of ").concat(A).concat((null == e ? void 0 : e.label) ? ": ".concat(e.label) : "");
            return i.default.createElement("div", {
                key: "compact",
                className: (0, n.default)("flex items-center gap-xsmall", p[y], "content-default", x),
                role: "status",
                "aria-live": "polite",
                "aria-label": t
            }, i.default.createElement("span", {
                className: "content-default"
            }, "Step"), i.default.createElement("div", {
                className: "flex items-center gap-xxsmall content-default"
            }, i.default.createElement("span", null, T + 1), i.default.createElement("span", null, "/"), i.default.createElement("span", null, A)), w && (null == e ? void 0 : e.description) && i.default.createElement("span", {
                className: (0, n.default)(m[y], "content-muted text-truncate-end")
            }, e.description))
        }
        return i.default.createElement("div", {
            key: "full",
            ref: E,
            className: (0, n.default)("flex width-full items-stretch scroll-x no-wrap", x),
            style: {
                scrollbarWidth: "none",
                msOverflowStyle: "none"
            },
            role: "list",
            "aria-label": C
        }, I.map((e, p) => {
            var m, g;
            let h, S, w = e.state,
                x = "disabled" === w,
                C = "current" === w,
                E = ((e, t, a) => {
                    let n = "Top" === e ? "top left" : "bottom left",
                        i = "var(--stroke-standard)",
                        r = "var(--color-stroke-default)",
                        o = "linear-gradient(".concat(r, ", ").concat(r, ")");
                    if ("current" !== t) return {
                        backgroundImage: o,
                        backgroundRepeat: "no-repeat",
                        backgroundSize: "100% ".concat(i),
                        backgroundPosition: n
                    };
                    let l = "var(--fui-future-alpha-color-system-progress)";
                    return {
                        backgroundImage: "linear-gradient(".concat(l, ", ").concat(l, "), ").concat(o),
                        backgroundRepeat: "no-repeat",
                        backgroundSize: "100% ".concat("XSmall" === a ? "var(--stroke-thick)" : "var(--stroke-thicker)", ", 100% ").concat(i),
                        backgroundPosition: "".concat(n, ", ").concat(n)
                    }
                })(b, w, y),
                R = "".concat(p + 1, " of ").concat(A, ": ").concat(e.label).concat(e.description ? " - ".concat(e.description) : "").concat(x ? " (disabled)" : ""),
                T = null != (m = e.id) ? m : "".concat(p, "-").concat(e.label, "-").concat(null != (g = e.description) ? g : "step");
            return i.default.createElement("div", {
                key: T,
                ref: e => {
                    P.current[p] = e
                },
                role: "listitem",
                "aria-current": C ? "step" : void 0,
                "aria-setsize": A,
                "aria-posinset": p + 1,
                "aria-label": R,
                className: (0, n.default)("flex grow items-center", l[y], s[y], "stroke-default", {
                    [t.disabledOpacity]: x
                }),
                style: E
            }, (h = "relative shrink-0", S = "absolute radius-circle flex items-center justify-center", "complete" === w ? i.default.createElement("div", {
                className: h,
                style: r[y]
            }, i.default.createElement("div", {
                className: (0, n.default)(S, "bg-system-contrast"),
                style: o
            }, i.default.createElement(a.Icon, {
                name: "icon-filled-check",
                size: f[y],
                className: "content-inverse-emphasis"
            }))) : "current" === w ? i.default.createElement("div", {
                className: h,
                style: r[y]
            }, i.default.createElement("div", {
                className: (0, n.default)(S, "bg-none stroke-system-contrast stroke-standard"),
                style: o
            }, i.default.createElement("span", {
                className: (0, n.default)(d[y], "content-emphasis leading-none")
            }, p + 1))) : i.default.createElement("div", {
                className: h,
                style: r[y]
            }, i.default.createElement("div", {
                className: (0, n.default)(S, "bg-shift-300"),
                style: o
            }, i.default.createElement("span", {
                className: (0, n.default)(d[y], "content-default leading-none")
            }, p + 1)))), i.default.createElement("div", {
                className: "flex flex-col min-width-0 max-width-[250px] grow padding-right-medium"
            }, i.default.createElement("span", {
                className: (0, n.default)(c[y], C ? "content-emphasis" : "content-default", "text-no-wrap", "text-truncate-end")
            }, e.label), e.description && i.default.createElement("span", {
                className: (0, n.default)(u[y], C ? "content-emphasis" : "content-default", "text-no-wrap", "text-truncate-end")
            }, e.description)))
        }))
    }])
}, 646924, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(52746),
        n = e.i(962192),
        i = e.i(197649),
        r = e.i(416340);
    let o = {
            Standard: {
                Info: "bg-shift-200",
                Warning: "bg-shift-200",
                Success: "bg-shift-200",
                Error: "bg-shift-200"
            },
            Emphasis: {
                Info: "bg-system-emphasis",
                Warning: "bg-system-warning",
                Success: "bg-system-success",
                Error: "bg-system-alert"
            }
        },
        l = {
            Info: "var(--dark-mode-content-default)",
            Warning: "var(--light-mode-content-default)",
            Success: "var(--light-mode-content-default)",
            Error: "var(--dark-mode-content-default)"
        },
        s = {
            Info: "var(--light-mode-system-emphasis)",
            Warning: "var(--light-mode-system-warning)",
            Success: "var(--light-mode-system-success)",
            Error: "var(--light-mode-system-alert)"
        },
        c = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        u = {
            Info: "bg-action-standard",
            Warning: "bg-inverse-action-standard",
            Success: "bg-inverse-action-standard",
            Error: "bg-action-standard"
        },
        d = {
            Info: "var(--dark-mode-content-emphasis)",
            Warning: "var(--light-mode-content-emphasis)",
            Success: "var(--light-mode-content-emphasis)",
            Error: "var(--dark-mode-content-emphasis)"
        },
        p = (0, r.forwardRef)((e, p) => {
            let {
                title: m,
                description: f,
                showIcon: g = !0,
                infoIconOverride: h,
                variant: y = "Standard",
                severity: b = "Info",
                primaryActionLabel: S,
                onPrimaryAction: w,
                actions: x,
                onDismiss: C,
                dismissIconAriaLabel: E = "Dismiss banner",
                className: P,
                ...A
            } = e, R = o[y][b], T = d[b], I = l[b], M = s[b], N = "Emphasis" === y ? u[b] : "", k = "Emphasis" === y ? d[b] : "";
            return r.default.createElement("div", {
                ref: p,
                role: "Warning" === b || "Error" === b ? "alert" : "status",
                className: (0, i.default)("foundation-web-system-banner width-full flex items-center wrap gap-x-medium gap-y-small radius-medium stroke-none padding-y-medium padding-x-large", R, P),
                ...A
            }, r.default.createElement("div", {
                className: "flex items-center gap-medium grow-1 basis-0 min-width-[min(200px,100%)]"
            }, g && r.default.createElement(t.Icon, {
                name: "Info" === b && h ? h : c[b],
                size: "Large",
                className: (0, i.default)("shrink-0"),
                style: {
                    color: "Standard" === y ? M : k
                }
            }), r.default.createElement("div", {
                className: "flex flex-col gap-xsmall grow-1 basis-0 min-width-0"
            }, r.default.createElement("div", {
                className: (0, i.default)("text-title-medium text-wrap [overflow-wrap:anywhere]", "Standard" === y ? "content-emphasis" : ""),
                style: {
                    color: "Emphasis" === y ? T : void 0
                }
            }, m), f && r.default.createElement("div", {
                className: (0, i.default)("text-body-medium text-wrap [overflow-wrap:anywhere]", "Standard" === y ? "content-default" : ""),
                style: {
                    color: "Emphasis" === y ? I : void 0
                }
            }, f))), (S || x || C) && r.default.createElement("div", {
                className: "flex items-center justify-end gap-small wrap shrink-0 max-width-full margin-left-auto"
            }, null != x ? x : S && w && r.default.createElement(a.Button, {
                size: "Small",
                variant: "Standard",
                onClick: w,
                className: (0, i.default)(N),
                style: {
                    color: k
                }
            }, S), C && r.default.createElement(n.CloseAffordance, {
                variant: "Utility",
                size: "Small",
                isCircular: !0,
                style: {
                    color: k || void 0
                },
                "aria-label": E,
                onClick: C
            })))
        });
    e.s(["SystemBanner", 0, p])
}, 208426, e => {
    "use strict";
    var t = e.i(18046),
        a = e.i(197649),
        n = e.i(416340),
        i = e.i(174617),
        r = e.i(608652),
        o = e.i(142953),
        l = e.i(169525),
        s = e.i(600317),
        c = e.i(974539),
        u = e.i(199786),
        d = e.i(40266),
        p = e.i(221628),
        m = "Tabs",
        [f, g] = (0, r.createContextScope)(m, [o.createRovingFocusGroupScope]),
        h = (0, o.createRovingFocusGroupScope)(),
        [y, b] = f(m),
        S = n.forwardRef((e, t) => {
            let {
                __scopeTabs: a,
                value: n,
                onValueChange: i,
                defaultValue: r,
                orientation: o = "horizontal",
                dir: l,
                activationMode: f = "automatic",
                ...g
            } = e, h = (0, c.useDirection)(l), [b, S] = (0, u.useControllableState)({
                prop: n,
                onChange: i,
                defaultProp: null != r ? r : "",
                caller: m
            });
            return (0, p.jsx)(y, {
                scope: a,
                baseId: (0, d.useId)(),
                value: b,
                onValueChange: S,
                orientation: o,
                dir: h,
                activationMode: f,
                children: (0, p.jsx)(s.Primitive.div, {
                    dir: h,
                    "data-orientation": o,
                    ...g,
                    ref: t
                })
            })
        });
    S.displayName = m;
    var w = "TabsList",
        x = n.forwardRef((e, t) => {
            let {
                __scopeTabs: a,
                loop: n = !0,
                ...i
            } = e, r = b(w, a), l = h(a);
            return (0, p.jsx)(o.Root, {
                asChild: !0,
                ...l,
                orientation: r.orientation,
                dir: r.dir,
                loop: n,
                children: (0, p.jsx)(s.Primitive.div, {
                    role: "tablist",
                    "aria-orientation": r.orientation,
                    ...i,
                    ref: t
                })
            })
        });
    x.displayName = w;
    var C = "TabsTrigger",
        E = n.forwardRef((e, t) => {
            let {
                __scopeTabs: a,
                value: n,
                disabled: r = !1,
                ...l
            } = e, c = b(C, a), u = h(a), d = R(c.baseId, n), m = T(c.baseId, n), f = n === c.value;
            return (0, p.jsx)(o.Item, {
                asChild: !0,
                ...u,
                focusable: !r,
                active: f,
                children: (0, p.jsx)(s.Primitive.button, {
                    type: "button",
                    role: "tab",
                    "aria-selected": f,
                    "aria-controls": m,
                    "data-state": f ? "active" : "inactive",
                    "data-disabled": r ? "" : void 0,
                    disabled: r,
                    id: d,
                    ...l,
                    ref: t,
                    onMouseDown: (0, i.composeEventHandlers)(e.onMouseDown, e => {
                        r || 0 !== e.button || !1 !== e.ctrlKey ? e.preventDefault() : c.onValueChange(n)
                    }),
                    onKeyDown: (0, i.composeEventHandlers)(e.onKeyDown, e => {
                        [" ", "Enter"].includes(e.key) && c.onValueChange(n)
                    }),
                    onFocus: (0, i.composeEventHandlers)(e.onFocus, () => {
                        let e = "manual" !== c.activationMode;
                        f || r || !e || c.onValueChange(n)
                    })
                })
            })
        });
    E.displayName = C;
    var P = "TabsContent",
        A = n.forwardRef((e, t) => {
            let {
                __scopeTabs: a,
                value: i,
                forceMount: r,
                children: o,
                ...c
            } = e, u = b(P, a), d = R(u.baseId, i), m = T(u.baseId, i), f = i === u.value, g = n.useRef(f);
            return n.useEffect(() => {
                let e = requestAnimationFrame(() => g.current = !1);
                return () => cancelAnimationFrame(e)
            }, []), (0, p.jsx)(l.Presence, {
                present: r || f,
                children: a => {
                    let {
                        present: n
                    } = a;
                    return (0, p.jsx)(s.Primitive.div, {
                        "data-state": f ? "active" : "inactive",
                        "data-orientation": u.orientation,
                        role: "tabpanel",
                        "aria-labelledby": d,
                        hidden: !n,
                        id: m,
                        tabIndex: 0,
                        ...c,
                        ref: t,
                        style: {
                            ...e.style,
                            animationDuration: g.current ? "0s" : void 0
                        },
                        children: n && o
                    })
                }
            })
        });

    function R(e, t) {
        return "".concat(e, "-trigger-").concat(t)
    }

    function T(e, t) {
        return "".concat(e, "-content-").concat(t)
    }
    A.displayName = P;
    let I = (0, n.createContext)({
            size: "Medium",
            variant: "Contained",
            fitBehavior: "Fill"
        }),
        M = {
            XSmall: ["text-label-small", "height-700"],
            Small: ["text-label-small", "height-800"],
            Medium: ["text-label-medium", "height-1000"],
            Large: ["text-label-medium", "height-1200"]
        },
        N = {
            XSmall: "padding-x-small",
            Small: "padding-x-small",
            Medium: "padding-x-medium",
            Large: "padding-x-large"
        },
        k = {
            XSmall: {
                Inlined: "",
                Contained: "padding-top-small"
            },
            Small: {
                Inlined: "",
                Contained: "padding-top-small"
            },
            Medium: {
                Inlined: "padding-top-xsmall",
                Contained: "padding-top-medium"
            },
            Large: {
                Inlined: "padding-top-xsmall",
                Contained: "padding-top-xlarge"
            }
        },
        O = {
            XSmall: "padding-bottom-small",
            Small: "padding-bottom-small",
            Medium: "padding-bottom-medium",
            Large: "padding-bottom-xlarge"
        },
        L = (0, n.forwardRef)((e, t) => {
            let {
                children: i,
                className: r,
                size: o,
                variant: l,
                fitBehavior: s,
                ...c
            } = e, u = (0, n.useMemo)(() => ({
                size: o || "Large",
                variant: l || "Contained",
                fitBehavior: s || "Fill"
            }), [o, l, s]);
            return n.default.createElement(I.Provider, {
                value: u
            }, n.default.createElement(S, {
                ref: t,
                ...c,
                className: (0, a.default)("foundation-web-tabs", "flex flex-col", r)
            }, i))
        }),
        F = (0, n.forwardRef)((e, t) => {
            let {
                children: i,
                className: r,
                ...o
            } = e, {
                fitBehavior: l
            } = (0, n.useContext)(I), s = (0, n.useRef)(null), [c, u] = (0, n.useState)({
                width: 0,
                left: 0,
                opacity: 0
            }), d = n.default.useCallback(e => {
                s.current = e, "function" == typeof t ? t(e) : t && "current" in t && (t.current = e)
            }, [t]);
            return (0, n.useEffect)(() => {
                let e, t = () => {
                    let e = s.current;
                    if (!e) return;
                    let t = e.querySelector('[data-state="active"]');
                    if (t) {
                        let a = e.getBoundingClientRect(),
                            n = t.getBoundingClientRect();
                        u({
                            width: n.width,
                            left: n.left - a.left,
                            opacity: 1
                        })
                    }
                };
                t();
                let a = new MutationObserver(() => {
                        cancelAnimationFrame(e), e = requestAnimationFrame(t)
                    }),
                    n = "u" > typeof ResizeObserver ? new ResizeObserver(t) : null,
                    i = s.current;
                return i && (a.observe(i, {
                    subtree: !0,
                    attributes: !0,
                    attributeFilter: ["data-state"]
                }), null == n || n.observe(i)), window.addEventListener("resize", t), () => {
                    cancelAnimationFrame(e), a.disconnect(), null == n || n.disconnect(), window.removeEventListener("resize", t)
                }
            }, [i]), n.default.createElement("div", {
                className: (0, a.default)("relative scroll-x", r),
                style: {
                    scrollbarWidth: "none",
                    msOverflowStyle: "none"
                }
            }, n.default.createElement(x, {
                ref: d,
                ...o,
                className: (0, a.default)("flex items-stretch bg-none border-0 stroke-none")
            }, i), "Fit" === l && n.default.createElement("div", {
                "aria-hidden": "true",
                className: "absolute bottom-[0px] left-[0px] right-[0px] height-[var(--stroke-thick)] bg-[var(--color-stroke-muted)] [z-index:0]"
            }), n.default.createElement("div", {
                className: "absolute bottom-[0px] bg-system-contrast transition-all duration-200 ease-standard-out",
                style: {
                    height: "var(--stroke-thick)",
                    zIndex: 1,
                    width: "".concat(c.width, "px"),
                    left: "".concat(c.left, "px"),
                    opacity: c.opacity
                }
            }))
        }),
        D = (0, n.forwardRef)((e, i) => {
            let {
                children: r,
                className: o,
                isDisabled: l = !1,
                ...s
            } = e, {
                size: c,
                variant: u,
                fitBehavior: d
            } = (0, n.useContext)(I);
            return n.default.createElement(E, {
                ref: i,
                ...s,
                disabled: l,
                style: {
                    borderBottom: "var(--stroke-thick) solid var(--color-stroke-muted)",
                    borderTop: "none",
                    borderLeft: "none",
                    borderRight: "none"
                },
                className: (0, a.default)("relative flex items-center justify-center cursor-pointer bg-none shrink-0", t.interactable, M[c], "Fill" === d ? "grow-1 ".concat(N[c]) : "", k[c][u], O[c], l && "opacity-[0.5]", o)
            }, n.default.createElement(t.StateLayer, null), n.default.createElement("div", {
                className: "flex items-center justify-center height-600 relative"
            }, r))
        }),
        U = (0, n.forwardRef)((e, t) => {
            let {
                children: i,
                className: r,
                ...o
            } = e;
            return n.default.createElement(A, {
                ref: t,
                ...o,
                className: (0, a.default)("padding-top-large", "outline-none", r)
            }, i)
        });
    e.s(["Tabs", 0, L, "TabsContent", 0, U, "TabsList", 0, F, "TabsTrigger", 0, D], 208426)
}, 698786, e => {
    "use strict";
    var t = e.i(688702),
        a = e.i(197649),
        n = e.i(416340);
    let i = (0, n.createContext)(null),
        r = e => {
            let {
                icon: i,
                className: r
            } = e;
            return n.default.createElement("div", {
                className: (0, a.default)("flex flex-col items-center gap-y-xsmall shrink-0 grow-0 width-50", r)
            }, n.default.createElement("span", {
                className: "grow-1 stroke-standard stroke-default group-first/timeline-item:invisible"
            }), n.default.createElement(t.Icon, {
                name: null != i ? i : "icon-regular-diamond-simplified",
                size: "Medium",
                className: "shrink-0 content-emphasis"
            }), n.default.createElement("span", {
                className: "grow-1 stroke-standard stroke-default group-last/timeline-item:invisible"
            }))
        },
        o = (0, n.forwardRef)((e, t) => {
            let {
                title: o,
                description: l,
                link: s,
                icon: c,
                children: u,
                className: d,
                ...p
            } = e, {
                placement: m
            } = (() => {
                let e = (0, n.useContext)(i);
                if (!e) throw Error("Timeline subcomponents must be used within a Timeline component");
                return e
            })(), f = "Start" === m, g = f ? "flex-row" : "flex-row-reverse", h = !!(l || s || u);
            return n.default.createElement("li", {
                ref: t,
                className: (0, a.default)("flex flex-col relative padding-x-medium group/timeline-item", d),
                style: {
                    listStyle: "none"
                },
                ...p
            }, n.default.createElement("div", {
                className: (0, a.default)("flex gap-medium", g)
            }, n.default.createElement(r, {
                icon: c
            }), n.default.createElement("div", {
                className: (0, a.default)("fill padding-y-small", !f && "text-align-x-end")
            }, n.default.createElement("div", {
                className: (0, a.default)("flex items-center gap-none", !f && "justify-end")
            }, n.default.createElement("div", {
                className: "text-title-medium content-emphasis"
            }, o)))), h && n.default.createElement("div", {
                className: (0, a.default)("flex gap-medium", g)
            }, n.default.createElement("div", {
                className: "flex flex-col items-center shrink-0 grow-0 width-50"
            }, n.default.createElement("span", {
                className: "grow-1 stroke-standard stroke-default group-last/timeline-item:invisible"
            })), n.default.createElement("div", {
                className: (0, a.default)("fill padding-bottom-small", !f && "text-align-x-end")
            }, l && n.default.createElement("div", {
                className: "text-body-medium content-default"
            }, l), s && n.default.createElement("div", {
                className: "padding-top-xsmall"
            }, s), u && n.default.createElement("div", {
                className: "padding-top-small"
            }, u))))
        });
    o.displayName = "TimelineItem";
    let l = (0, n.forwardRef)((e, t) => {
        let {
            placement: r = "Start",
            children: o,
            className: l,
            ...s
        } = e, c = (0, n.useMemo)(() => ({
            placement: r
        }), [r]);
        return n.default.createElement(i.Provider, {
            value: c
        }, n.default.createElement("ul", {
            ref: t,
            className: (0, a.default)("flex flex-col padding-none", l),
            style: {
                listStyle: "none"
            },
            ...s
        }, o))
    });
    l.displayName = "Timeline", e.s(["Timeline", 0, l, "TimelineItem", 0, o])
}, 737420, 706386, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);

    function n(e) {
        let {
            className: n
        } = e;
        return a.default.createElement("svg", {
            xmlns: "http://www.w3.org/2000/svg",
            width: "13",
            height: "6",
            viewBox: "0 0 13 6",
            fill: "none",
            className: (0, t.default)("block", n),
            style: {
                marginTop: -1
            }
        }, a.default.createElement("path", {
            d: "M0.249999 0.666628L4.83579 5.25241C5.61683 6.03346 6.88316 6.03346 7.66421 5.25241L12.25 0.666626L0.249999 0.666628Z",
            fill: "currentColor"
        }))
    }
    e.s(["Beak", 0, n], 706386);
    var i = e.i(989665);
    e.s(["Tooltip", 0, function(e) {
        let {
            position: r,
            hasBeak: o = !0,
            title: l,
            description: s,
            ariaLabel: c,
            delayDurationMs: u = 500,
            children: d,
            open: p,
            onOpenChange: m,
            contentClassName: f
        } = e, [g, h] = r.split("-"), y = null != c ? c : "string" == typeof l && null == s ? l : void 0;
        return a.createElement(i.Provider, {
            delayDuration: u
        }, a.createElement(i.Root, {
            open: p,
            onOpenChange: m
        }, d, a.createElement(i.Portal, null, a.createElement(i.Content, {
            side: g,
            align: h,
            "aria-label": y,
            className: (0, t.default)("foundation-web-portal-zindex bg-inverse-surface-0 padding-y-xsmall padding-x-small radius-small shadow-transient-low", f),
            sideOffset: 5
        }, o && a.createElement(i.Arrow, {
            asChild: !0
        }, a.createElement(n, {
            className: "content-[var(--inverse-surface-0)]"
        })), a.createElement("div", {
            className: "flex flex-col text-truncate-split"
        }, a.createElement("div", {
            className: "text-caption-medium content-inverse-default"
        }, l), s && a.createElement("div", {
            className: "text-body-small padding-top-xsmall content-inverse-default max-width-[calc(var(--size-100)*50)]"
        }, s))))))
    }, "TooltipTrigger", 0, function(e) {
        let {
            children: t,
            asChild: n,
            className: r
        } = e;
        return a.createElement(i.Trigger, {
            asChild: n,
            className: r
        }, t)
    }], 737420)
}, 235684, e => {
    "use strict";
    var t = e.i(962560),
        a = e.i(273589),
        n = e.i(416340),
        i = e.i(42569),
        r = e.i(696180),
        o = e.i(219224),
        l = e.i(221628),
        s = e.i(640878),
        c = e.i(208958),
        u = e.i(154447),
        d = e.i(155607),
        p = e.i(301353),
        m = e.i(963320);

    function f(e) {
        return (0, a.g)("MuiFormGroup", e)
    }(0, r.g)("MuiFormGroup", ["root", "row", "error"]);
    let g = ["className", "row"],
        h = (0, i.s)("div", {
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
                    row: s = !1
                } = r,
                c = (0, a._)(r, g),
                u = (0, d.u)(),
                y = (0, p.f)({
                    props: r,
                    muiFormControl: u,
                    states: ["error"]
                }),
                b = (0, t._)({}, r, {
                    row: s,
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
                    }, f, t)
                })(b);
            return (0, l.jsx)(h, (0, t._)({
                className: (0, i.c)(S.root, o),
                ownerState: b,
                ref: n
            }, c))
        });
    var b = e.i(270673),
        S = e.i(751498),
        w = e.i(169923),
        x = e.i(738508);
    e.i(485511);
    var C = e.i(983545);

    function E(e) {
        return (0, a.g)("MuiRadioGroup", e)
    }(0, r.g)("MuiRadioGroup", ["root", "row", "error"]);
    let P = ["actions", "children", "className", "defaultValue", "name", "onChange", "value"],
        A = n.forwardRef(function(e, r) {
            let {
                actions: d,
                children: p,
                className: m,
                defaultValue: f,
                name: g,
                onChange: h,
                value: b
            } = e, S = (0, a._)(e, P), w = n.useRef(null), x = (e => {
                let {
                    classes: t,
                    row: a,
                    error: n
                } = e;
                return (0, i.a)({
                    root: ["root", a && "row", n && "error"]
                }, E, t)
            })(e), [C, A] = (0, s.u)({
                controlled: b,
                default: f,
                name: "RadioGroup"
            });
            n.useImperativeHandle(d, () => ({
                focus: () => {
                    let e = w.current.querySelector("input:not(:disabled):checked");
                    e || (e = w.current.querySelector("input:not(:disabled)")), e && e.focus()
                }
            }), []);
            let R = (0, c.u)(r, w),
                T = (0, u.u)(g),
                I = n.useMemo(() => ({
                    name: T,
                    onChange(e) {
                        A(e.target.value), h && h(e, e.target.value)
                    },
                    value: C
                }), [T, h, A, C]);
            return (0, l.jsx)(o.R.Provider, {
                value: I,
                children: (0, l.jsx)(y, (0, t._)({
                    role: "radiogroup",
                    ref: R,
                    className: (0, i.c)(x.root, m)
                }, S, {
                    children: p
                }))
            })
        });
    var R = (0, S.c)((0, l.jsx)("path", {
            d: "M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"
        }), "Star"),
        T = (0, S.c)((0, l.jsx)("path", {
            d: "M22 9.24l-7.19-.62L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21 12 17.27 18.18 21l-1.63-7.03L22 9.24zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"
        }), "StarBorder");

    function I(e) {
        return (0, a.g)("MuiRating", e)
    }
    var M = (0, r.g)("MuiRating", ["root", "sizeSmall", "sizeMedium", "sizeLarge", "readOnly", "disabled", "focusVisible", "visuallyHidden", "pristine", "label", "labelEmptyValueActive", "icon", "iconEmpty", "iconFilled", "iconHover", "iconFocus", "iconActive", "decimal"]);
    let N = ["value"],
        k = ["className", "defaultValue", "disabled", "emptyIcon", "emptyLabelText", "getLabelText", "highlightSelectedOnly", "icon", "IconContainerComponent", "max", "name", "onChange", "onChangeActive", "onMouseLeave", "onMouseMove", "precision", "readOnly", "size", "value"];

    function O(e, t) {
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
                    ["& .".concat(M.visuallyHidden)]: t.visuallyHidden
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
                ["&.".concat(M.disabled)]: {
                    opacity: (a.vars || a).palette.action.disabledOpacity,
                    pointerEvents: "none"
                },
                ["&.".concat(M.focusVisible, " .").concat(M.iconActive)]: {
                    outline: "1px solid #999"
                },
                ["& .".concat(M.visuallyHidden)]: w.v
            }, "small" === n.size && {
                fontSize: a.typography.pxToRem(18)
            }, "large" === n.size && {
                fontSize: a.typography.pxToRem(30)
            }, n.readOnly && {
                pointerEvents: "none"
            })
        }),
        F = (0, i.s)("label", {
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
        D = (0, i.s)("span", {
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
        U = (0, i.s)("span", {
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

    function G(e) {
        let n = (0, a._)(e, N);
        return (0, l.jsx)("span", (0, t._)({}, n))
    }

    function z(e) {
        let {
            classes: a,
            disabled: r,
            emptyIcon: o,
            focus: s,
            getLabelText: c,
            highlightSelectedOnly: d,
            hover: p,
            icon: m,
            IconContainerComponent: f,
            isActive: g,
            itemValue: h,
            labelProps: y,
            name: b,
            onBlur: S,
            onChange: w,
            onClick: x,
            onFocus: C,
            readOnly: E,
            ownerState: P,
            ratingValue: A,
            ratingValueRounded: R
        } = e, T = d ? h === A : h <= A, I = h <= p, M = h <= s, N = h === R, k = (0, u.u)(), O = (0, l.jsx)(D, {
            as: f,
            value: h,
            className: (0, i.c)(a.icon, T ? a.iconFilled : a.iconEmpty, I && a.iconHover, M && a.iconFocus, g && a.iconActive),
            ownerState: (0, t._)({}, P, {
                iconEmpty: !T,
                iconFilled: T,
                iconHover: I,
                iconFocus: M,
                iconActive: g
            }),
            children: o && !T ? o : m
        });
        return E ? (0, l.jsx)("span", (0, t._)({}, y, {
            children: O
        })) : (0, l.jsxs)(n.Fragment, {
            children: [(0, l.jsxs)(F, (0, t._)({
                ownerState: (0, t._)({}, P, {
                    emptyValueFocused: void 0
                }),
                htmlFor: k
            }, y, {
                children: [O, (0, l.jsx)("span", {
                    className: a.visuallyHidden,
                    children: c(h)
                })]
            })), (0, l.jsx)("input", {
                className: a.visuallyHidden,
                onFocus: C,
                onBlur: S,
                onChange: w,
                onClick: x,
                disabled: r,
                value: h,
                id: k,
                type: "radio",
                name: b,
                checked: N
            })]
        })
    }
    let _ = (0, l.jsx)(R, {
            fontSize: "inherit"
        }),
        B = (0, l.jsx)(T, {
            fontSize: "inherit"
        });

    function V(e) {
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
                disabled: f = !1,
                emptyIcon: g = B,
                emptyLabelText: h = "Empty",
                getLabelText: y = V,
                highlightSelectedOnly: S = !1,
                icon: w = _,
                IconContainerComponent: E = G,
                max: P = 5,
                name: A,
                onChange: R,
                onChangeActive: T,
                onMouseLeave: M,
                onMouseMove: N,
                precision: D = 1,
                readOnly: j = !1,
                size: q = "medium",
                value: H
            } = o,
            W = (0, a._)(o, k),
            Q = (0, u.u)(A),
            [K, X] = (0, s.u)({
                controlled: H,
                default: p,
                name: "Rating"
            }),
            J = O(K, D),
            Y = (0, b.u)(),
            [{
                hover: $,
                focus: Z
            }, ee] = n.useState({
                hover: -1,
                focus: -1
            }),
            et = J; - 1 !== $ && (et = $), -1 !== Z && (et = Z);
        let {
            isFocusVisibleRef: ea,
            onBlur: en,
            onFocus: ei,
            ref: er
        } = (0, x.u)(), [eo, el] = n.useState(!1), es = n.useRef(), ec = (0, c.u)(er, es, r), eu = e => {
            let t = "" === e.target.value ? null : parseFloat(e.target.value); - 1 !== $ && (t = $), X(t), R && R(e, t)
        }, ed = e => {
            0 === e.clientX && 0 === e.clientY || (ee({
                hover: -1,
                focus: -1
            }), X(null), R && parseFloat(e.target.value) === J && R(e, null))
        }, ep = e => {
            ei(e), !0 === ea.current && el(!0);
            let t = parseFloat(e.target.value);
            ee(e => ({
                hover: e.hover,
                focus: t
            }))
        }, em = e => {
            -1 === $ && (en(e), !1 === ea.current && el(!1), ee(e => ({
                hover: e.hover,
                focus: -1
            })))
        }, [ef, eg] = n.useState(!1), eh = (0, t._)({}, o, {
            defaultValue: p,
            disabled: f,
            emptyIcon: g,
            emptyLabelText: h,
            emptyValueFocused: ef,
            focusVisible: eo,
            getLabelText: y,
            icon: w,
            IconContainerComponent: E,
            max: P,
            precision: D,
            readOnly: j,
            size: q
        }), ev = (e => {
            let {
                classes: t,
                size: n,
                readOnly: r,
                disabled: o,
                emptyValueFocused: l,
                focusVisible: s
            } = e, c = {
                root: ["root", "size".concat((0, a.a)(n)), o && "disabled", s && "focusVisible", r && "readOnly"],
                label: ["label", "pristine"],
                labelEmptyValue: [l && "labelEmptyValueActive"],
                icon: ["icon"],
                iconEmpty: ["iconEmpty"],
                iconFilled: ["iconFilled"],
                iconHover: ["iconHover"],
                iconFocus: ["iconFocus"],
                iconActive: ["iconActive"],
                decimal: ["decimal"],
                visuallyHidden: ["visuallyHidden"]
            };
            return (0, i.a)(c, I, t)
        })(eh);
        return (0, l.jsxs)(L, (0, t._)({
            ref: ec,
            onMouseMove: e => {
                N && N(e);
                let {
                    right: t,
                    left: a,
                    width: n
                } = es.current.getBoundingClientRect(), i = O(P * (Y ? (t - e.clientX) / n : (e.clientX - a) / n) + D / 2, D);
                i = (0, C.c)(i, D, P), ee(e => e.hover === i && e.focus === i ? e : {
                    hover: i,
                    focus: i
                }), el(!1), T && $ !== i && T(e, i)
            },
            onMouseLeave: e => {
                M && M(e), ee({
                    hover: -1,
                    focus: -1
                }), T && -1 !== $ && T(e, -1)
            },
            className: (0, i.c)(ev.root, d, j && "MuiRating-readOnly"),
            ownerState: eh,
            role: j ? "img" : null,
            "aria-label": j ? y(et) : null
        }, W, {
            children: [Array.from(Array(P)).map((e, a) => {
                let n = a + 1,
                    r = {
                        classes: ev,
                        disabled: f,
                        emptyIcon: g,
                        focus: Z,
                        getLabelText: y,
                        highlightSelectedOnly: S,
                        hover: $,
                        icon: w,
                        IconContainerComponent: E,
                        name: Q,
                        onBlur: em,
                        onChange: eu,
                        onClick: ed,
                        onFocus: ep,
                        ratingValue: et,
                        ratingValueRounded: J,
                        readOnly: j,
                        ownerState: eh
                    },
                    o = n === Math.ceil(et) && (-1 !== $ || -1 !== Z);
                if (D < 1) {
                    let e = Array.from(Array(1 / D));
                    return (0, l.jsx)(U, {
                        className: (0, i.c)(ev.decimal, o && ev.iconActive),
                        ownerState: eh,
                        iconActive: o,
                        children: e.map((a, i) => {
                            let o = O(n - 1 + (i + 1) * D, D);
                            return (0, l.jsx)(z, (0, t._)({}, r, {
                                isActive: !1,
                                itemValue: o,
                                labelProps: {
                                    style: e.length - 1 === i ? {} : {
                                        width: o === et ? (i + 1) * D * 100 + "%" : "0%",
                                        overflow: "hidden",
                                        position: "absolute"
                                    }
                                }
                            }), o)
                        })
                    }, n)
                }
                return (0, l.jsx)(z, (0, t._)({}, r, {
                    isActive: o,
                    itemValue: n
                }), n)
            }), !j && !f && (0, l.jsxs)(F, {
                className: (0, i.c)(ev.label, ev.labelEmptyValue),
                ownerState: eh,
                children: [(0, l.jsx)("input", {
                    className: ev.visuallyHidden,
                    value: "",
                    id: "".concat(Q, "-empty"),
                    type: "radio",
                    name: Q,
                    checked: null == J,
                    onFocus: () => eg(!0),
                    onBlur: () => eg(!1),
                    onChange: eu
                }), (0, l.jsx)("span", {
                    className: ev.visuallyHidden,
                    children: h
                })]
            })]
        }))
    }), e.s(["RadioGroup", 0, A], 235684)
}, 908578, e => {
    "use strict";
    var t = e.i(273589),
        a = e.i(962560),
        n = e.i(416340),
        i = e.i(42569),
        r = e.i(696180),
        o = e.i(221628),
        l = e.i(972455),
        s = e.i(963320);

    function c(e) {
        return (0, t.g)("MuiDialogContentText", e)
    }(0, r.g)("MuiDialogContentText", ["root"]);
    let u = ["children", "className"],
        d = (0, i.s)(l.T, {
            shouldForwardProp: e => (0, i.r)(e) || "classes" === e,
            name: "MuiDialogContentText",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        p = n.forwardRef(function(e, n) {
            let r = (0, s.u)({
                    props: e,
                    name: "MuiDialogContentText"
                }),
                {
                    className: l
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
                className: (0, i.c)(m.root, l)
            }, r, {
                classes: m
            }))
        });
    e.s(["D", 0, p])
}, 186214, e => {
    "use strict";
    var t = e.i(908578);
    e.s(["DialogContentText", () => t.D])
}, 854705, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        n = e.i(614515),
        i = e.i(993807),
        r = e.i(696180),
        o = e.i(273589),
        l = e.i(962560),
        s = e.i(42569),
        c = e.i(576881),
        u = e.i(751498),
        d = e.i(221628),
        p = e.i(219224),
        m = e.i(963320),
        f = e.i(275966);
    e.i(197094);
    var g = (0, u.c)((0, d.jsx)("path", {
            d: "M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"
        }), "RadioButtonUnchecked"),
        h = (0, u.c)((0, d.jsx)("path", {
            d: "M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"
        }), "RadioButtonChecked");
    let y = (0, s.s)("span", {
            name: "MuiRadioButtonIcon",
            shouldForwardProp: s.r
        })({
            position: "relative",
            display: "flex"
        }),
        b = (0, s.s)(g, {
            name: "MuiRadioButtonIcon"
        })({
            transform: "scale(1)"
        }),
        S = (0, s.s)(h, {
            name: "MuiRadioButtonIcon"
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, l._)({
                left: 0,
                position: "absolute",
                transform: "scale(0)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeIn,
                    duration: t.transitions.duration.shortest
                })
            }, a.checked && {
                transform: "scale(1)",
                transition: t.transitions.create("transform", {
                    easing: t.transitions.easing.easeOut,
                    duration: t.transitions.duration.shortest
                })
            })
        });

    function w(e) {
        let {
            checked: t = !1,
            classes: a = {},
            fontSize: n
        } = e, i = (0, l._)({}, e, {
            checked: t
        });
        return (0, d.jsxs)(y, {
            className: a.root,
            ownerState: i,
            children: [(0, d.jsx)(b, {
                fontSize: n,
                className: a.background,
                ownerState: i
            }), (0, d.jsx)(S, {
                fontSize: n,
                className: a.dot,
                ownerState: i
            })]
        })
    }

    function x(e) {
        return (0, o.g)("MuiRadio", e)
    }
    var C = (0, r.g)("MuiRadio", ["root", "checked", "disabled", "colorPrimary", "colorSecondary", "sizeSmall"]);
    let E = ["checked", "checkedIcon", "color", "icon", "name", "onChange", "size", "className"],
        P = (0, s.s)(c.S, {
            shouldForwardProp: e => (0, s.r)(e) || "classes" === e,
            name: "MuiRadio",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: a
                } = e;
                return [t.root, "medium" !== a.size && t["size".concat((0, o.a)(a.size))], t["color".concat((0, o.a)(a.color))]]
            }
        })(e => {
            let {
                theme: t,
                ownerState: a
            } = e;
            return (0, l._)({
                color: (t.vars || t).palette.text.secondary
            }, !a.disableRipple && {
                "&:hover": {
                    backgroundColor: t.vars ? "rgba(".concat("default" === a.color ? t.vars.palette.action.activeChannel : t.vars.palette[a.color].mainChannel, " / ").concat(t.vars.palette.action.hoverOpacity, ")") : (0, o.b)("default" === a.color ? t.palette.action.active : t.palette[a.color].main, t.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "default" !== a.color && {
                ["&.".concat(C.checked)]: {
                    color: (t.vars || t).palette[a.color].main
                }
            }, {
                ["&.".concat(C.disabled)]: {
                    color: (t.vars || t).palette.action.disabled
                }
            })
        }),
        A = (0, d.jsx)(w, {
            checked: !0
        }),
        R = (0, d.jsx)(w, {}),
        T = a.forwardRef(function(e, t) {
            var n, i, r, c;
            let u = (0, m.u)({
                    props: e,
                    name: "MuiRadio"
                }),
                {
                    checked: g,
                    checkedIcon: h = A,
                    color: y = "primary",
                    icon: b = R,
                    name: S,
                    onChange: w,
                    size: C = "medium",
                    className: T
                } = u,
                I = (0, o._)(u, E),
                M = (0, l._)({}, u, {
                    color: y,
                    size: C
                }),
                N = (e => {
                    let {
                        classes: t,
                        color: a,
                        size: n
                    } = e, i = {
                        root: ["root", "color".concat((0, o.a)(a)), "medium" !== n && "size".concat((0, o.a)(n))]
                    };
                    return (0, l._)({}, t, (0, s.a)(i, x, t))
                })(M),
                k = a.useContext(p.R),
                O = g,
                L = (0, f.c)(w, k && k.onChange),
                F = S;
            return k && (void 0 === O && (r = k.value, O = "object" == typeof(c = u.value) && null !== c ? r === c : String(r) === String(c)), void 0 === F && (F = k.name)), (0, d.jsx)(P, (0, l._)({
                type: "radio",
                icon: a.cloneElement(b, {
                    fontSize: null != (n = R.props.fontSize) ? n : C
                }),
                checkedIcon: a.cloneElement(h, {
                    fontSize: null != (i = A.props.fontSize) ? i : C
                }),
                ownerState: M,
                classes: N,
                name: F,
                checked: O,
                onChange: L,
                ref: t,
                className: (0, s.c)(N.root, T)
            }, I))
        });
    var I = (0, n.default)({
            name: "Radio"
        })(function(e) {
            var t, a;
            return {
                root: {
                    color: e.palette.states.active
                },
                colorPrimary: ((t = {
                    color: e.palette.content.muted
                })["&.".concat(C.checked)] = {
                    color: e.palette.actionV2.primaryBrand.fill
                }, t),
                colorSecondary: {
                    color: e.palette.actionV2.primary.fill
                },
                disabled: ((a = {
                    color: e.palette.states.disabled
                })["&.".concat(C.colorPrimary, ".").concat(C.checked)] = {
                    color: e.palette.states.disabled
                }, a)
            }
        }),
        M = (0, a.forwardRef)(function(e, n) {
            var r = e.classes,
                o = e.color,
                l = e.inputProps,
                s = e["aria-label"],
                c = e.className,
                u = (0, t.a)(e, ["classes", "color", "inputProps", "aria-label", "className"]),
                d = I(void 0, {
                    props: {
                        classes: (0, i.default)(r, c)
                    }
                });
            return a.default.createElement(T, (0, t._)({}, u, {
                classes: d.classes,
                color: void 0 === o ? "primary" : o,
                ref: n,
                inputProps: (0, t._)({
                    "aria-label": s
                }, l)
            }))
        });
    e.s(["Radio", 0, M], 854705)
}, 219224, e => {
    "use strict";
    let t = e.i(416340).createContext(void 0);
    e.s(["R", 0, t])
}, 417410, 565907, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        n = e.i(614515),
        i = e.i(993807),
        r = e.i(35985),
        o = e.i(126582),
        l = e.i(544453),
        s = e.i(273589),
        c = e.i(962560),
        u = e.i(42569),
        d = e.i(200964),
        p = e.i(696180),
        m = e.i(221628),
        f = e.i(963320);

    function g(e) {
        return (0, s.g)("MuiStep", e)
    }
    e.i(26724), (0, p.g)("MuiStep", ["root", "horizontal", "vertical", "alternativeLabel", "completed"]);
    let h = ["active", "children", "className", "component", "completed", "disabled", "expanded", "index", "last"],
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
            let n = (0, f.u)({
                    props: e,
                    name: "MuiStep"
                }),
                {
                    active: i,
                    children: r,
                    className: o,
                    component: l = "div",
                    completed: p,
                    disabled: b,
                    expanded: S = !1,
                    index: w,
                    last: x
                } = n,
                C = (0, s._)(n, h),
                {
                    activeStep: E,
                    connector: P,
                    alternativeLabel: A,
                    orientation: R,
                    nonLinear: T
                } = a.useContext(d.S),
                [I = !1, M = !1, N = !1] = [i, p, b];
            E === w ? I = void 0 === i || i : !T && E > w ? M = void 0 === p || p : !T && E < w && (N = void 0 === b || b);
            let k = a.useMemo(() => ({
                    index: w,
                    last: x,
                    expanded: S,
                    icon: w + 1,
                    active: I,
                    completed: M,
                    disabled: N
                }), [w, x, S, I, M, N]),
                O = (0, c._)({}, n, {
                    active: I,
                    orientation: R,
                    alternativeLabel: A,
                    completed: M,
                    disabled: N,
                    expanded: S,
                    component: l
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
                    }, g, t)
                })(O),
                F = (0, m.jsxs)(y, (0, c._)({
                    as: l,
                    className: (0, u.c)(L.root, o),
                    ref: t,
                    ownerState: O
                }, C, {
                    children: [P && A && 0 !== w ? P : null, r]
                }));
            return (0, m.jsx)(d.a.Provider, {
                value: k,
                children: P && !A && 0 !== w ? (0, m.jsxs)(a.Fragment, {
                    children: [P, F]
                }) : F
            })
        });
    var S = (0, n.default)({
            name: "Step"
        })(function(e, a) {
            var n, i, s, c = a.alternativeLabel,
                u = a.orientation,
                d = ((n = {
                    color: e.palette.actionV2.primaryBrand.fill,
                    backgroundColor: e.palette.content.static.light,
                    borderRadius: "50%",
                    boxShadow: "inset 0 0 0 1px ".concat(e.palette.actionV2.primaryBrand.fill)
                })["& .".concat(r.s.text)] = {
                    fill: e.palette.content.static.light
                }, n),
                p = ((i = {})["& .".concat(o.s.iconContainer, ":not(.").concat(o.s.error, ")")] = ((s = {})["&.".concat(o.s.active, " .").concat(l.s.root)] = d, s["&.".concat(o.s.completed, " .").concat(l.s.root)] = d, s), i);
            return c && "vertical" === u && (p = (0, t._)((0, t._)({}, p), {
                display: "flex",
                flexDirection: "column",
                alignItems: "center"
            })), {
                root: p
            }
        }),
        w = (0, a.forwardRef)(function(e, n) {
            var r = e.classes,
                o = e.children,
                l = e.className,
                s = (0, t.a)(e, ["classes", "children", "className"]),
                c = S(e, {
                    props: {
                        classes: (0, i.default)(r, l)
                    }
                });
            return a.default.createElement(b, (0, t._)({}, s, {
                classes: c.classes,
                ref: n
            }), o)
        });
    e.s(["Step", 0, w], 417410);
    var x = e.i(174456);
    e.s(["StepLabel", () => x.c], 565907)
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
            l = (0, a.useRef)(null),
            s = (0, a.useState)({
                props: {},
                children: void 0
            }),
            c = s[0],
            u = s[1],
            d = (0, a.useState)(!1),
            p = d[0],
            m = d[1],
            f = (0, a.useCallback)(function() {
                m(!0)
            }, [m]),
            g = (0, a.useCallback)(function() {
                m(!1)
            }, [m]),
            h = (0, a.useCallback)(function(e, t) {
                void 0 === t && (t = {}), u({
                    props: t,
                    children: e
                })
            }, [u]),
            y = (0, a.useMemo)(function() {
                return {
                    ref: l,
                    open: f,
                    close: g,
                    configure: h
                }
            }, [g, h, f]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: y
        }, r), a.default.createElement(n.default, (0, t._)({}, c.props, o, {
            "aria-labelledby": c.props.id,
            "aria-describedby": "dialog-content-text-describe-id",
            open: p,
            onClose: g,
            ref: l
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
        var l = e.id;
        e.variant;
        var s = e.title,
            c = e.color,
            u = e.loading,
            d = void 0 !== u && u,
            p = e.content,
            m = e.confirmText,
            f = e.cancelText,
            g = e.onCancel,
            h = e.onConfirm;
        return t.default.createElement("div", null, t.default.createElement(a.default, {
            id: l
        }, s), t.default.createElement(n.default, null, t.default.createElement(o.D, {
            id: "dialog-content-text-describe-id"
        }, p)), t.default.createElement(i.default, null, t.default.createElement(r.default, {
            size: "large",
            variant: "outlined",
            "aria-label": f,
            color: "secondary",
            onClick: g,
            disabled: d
        }, f), t.default.createElement(r.default, {
            size: "large",
            variant: "contained",
            loading: d,
            "aria-label": m,
            color: void 0 === c ? "primaryBrand" : c,
            onClick: h
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
}, 169923, e => {
    "use strict";
    e.s(["v", 0, {
        border: 0,
        clip: "rect(0 0 0 0)",
        height: "1px",
        margin: "-1px",
        overflow: "hidden",
        padding: 0,
        position: "absolute",
        whiteSpace: "nowrap",
        width: "1px"
    }])
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
        l = (0, r.createContext)(void 0);
    e.s(["UniversalFeatureRestrictionsProvider", 0, e => {
        let {
            Surface: t,
            children: a
        } = e, [{
            request: n,
            open: i
        }, s] = (0, r.useState)({
            open: !1
        }), c = (0, r.useCallback)(e => {
            s({
                request: e,
                open: !0
            })
        }, []), u = (0, r.useCallback)(() => {
            s(e => ({
                ...e,
                open: !1
            }))
        }, []), d = (0, r.useMemo)(() => ({
            showFeatureRestriction: c,
            closeFeatureRestriction: u
        }), [c, u]);
        return (0, o.jsxs)(l.Provider, {
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
    var t, a, n, i, r, o, l, s, c, u, d, p, m = e.i(711300),
        f = e.i(634203),
        g = e.i(35877),
        h = e.i(747304);

    function y(e, t) {
        var a = (0, h._)(e, t, "update");
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
        w = e.i(665564),
        x = e.i(211089),
        C = (t = new WeakMap, class extends x.Subscribable {
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
                w.notifyManager.batch(() => {
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
                w.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            onFocus() {
                w.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onFocus()
                    })
                })
            }
            onOnline() {
                w.notifyManager.batch(() => {
                    this.getAll().forEach(e => {
                        e.onOnline()
                    })
                })
            }
            constructor(e = {}) {
                super(), (0, f._)(this, t, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, g._)(this, t, new Map)
            }
        }),
        E = e.i(436175),
        P = x,
        A = (a = new WeakMap, n = new WeakMap, i = new WeakMap, class extends P.Subscribable {
            build(e, t, a) {
                let n = new E.Mutation({
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
                w.notifyManager.batch(() => {
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
                w.notifyManager.batch(() => {
                    this.listeners.forEach(t => {
                        t(e)
                    })
                })
            }
            resumePausedMutations() {
                let e = this.getAll().filter(e => e.state.isPaused);
                return w.notifyManager.batch(() => Promise.all(e.map(e => e.continue().catch(b.noop))))
            }
            constructor(e = {}) {
                super(), (0, f._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, i, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, g._)(this, a, new Set), (0, g._)(this, n, new Map), (0, g._)(this, i, 0)
            }
        });

    function R(e) {
        var t;
        return null == (t = e.options.scope) ? void 0 : t.id
    }
    var T = e.i(549772),
        I = e.i(841246),
        M = e.i(117437),
        N = (r = new WeakMap, o = new WeakMap, l = new WeakMap, s = new WeakMap, c = new WeakMap, u = new WeakMap, d = new WeakMap, p = new WeakMap, class {
            mount() {
                y(this, u).value++, 1 === (0, m._)(this, u) && ((0, g._)(this, d, T.focusManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, m._)(this, r).onFocus())
                })), (0, g._)(this, p, I.onlineManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, m._)(this, r).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, u).value--, 0 === (0, m._)(this, u) && (null == (e = (0, m._)(this, d)) || e.call(this), (0, g._)(this, d, void 0), null == (t = (0, m._)(this, p)) || t.call(this), (0, g._)(this, p, void 0))
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
                    l = (0, b.functionalUpdate)(t, o);
                if (void 0 !== l) return (0, m._)(this, r).build(this, n).setData(l, {
                    ...a,
                    manual: !0
                })
            }
            setQueriesData(e, t, a) {
                return w.notifyManager.batch(() => (0, m._)(this, r).findAll(e).map(e => {
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
                w.notifyManager.batch(() => {
                    t.findAll(e).forEach(e => {
                        t.remove(e)
                    })
                })
            }
            resetQueries(e, t) {
                let a = (0, m._)(this, r);
                return w.notifyManager.batch(() => (a.findAll(e).forEach(e => {
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
                return Promise.all(w.notifyManager.batch(() => (0, m._)(this, r).findAll(e).map(e => e.cancel(a)))).then(b.noop).catch(b.noop)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return w.notifyManager.batch(() => {
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
                return Promise.all(w.notifyManager.batch(() => (0, m._)(this, r).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
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
                return e.behavior = (0, M.infiniteQueryBehavior)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(b.noop).catch(b.noop)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, M.infiniteQueryBehavior)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return I.onlineManager.isOnline() ? (0, m._)(this, o).resumePausedMutations() : Promise.resolve()
            }
            getQueryCache() {
                return (0, m._)(this, r)
            }
            getMutationCache() {
                return (0, m._)(this, o)
            }
            getDefaultOptions() {
                return (0, m._)(this, l)
            }
            setDefaultOptions(e) {
                (0, g._)(this, l, e)
            }
            setQueryDefaults(e, t) {
                (0, m._)(this, s).set((0, b.hashKey)(e), {
                    queryKey: e,
                    defaultOptions: t
                })
            }
            getQueryDefaults(e) {
                let t = [...(0, m._)(this, s).values()],
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
                    ...(0, m._)(this, l).queries,
                    ...this.getQueryDefaults(e.queryKey),
                    ...e,
                    _defaulted: !0
                };
                return t.queryHash || (t.queryHash = (0, b.hashQueryKeyByOptions)(t.queryKey, t)), void 0 === t.refetchOnReconnect && (t.refetchOnReconnect = "always" !== t.networkMode), void 0 === t.throwOnError && (t.throwOnError = !!t.suspense), !t.networkMode && t.persister && (t.networkMode = "offlineFirst"), t.queryFn === b.skipToken && (t.enabled = !1), t
            }
            defaultMutationOptions(e) {
                return (null == e ? void 0 : e._defaulted) ? e : {
                    ...(0, m._)(this, l).mutations,
                    ...(null == e ? void 0 : e.mutationKey) && this.getMutationDefaults(e.mutationKey),
                    ...e,
                    _defaulted: !0
                }
            }
            clear() {
                (0, m._)(this, r).clear(), (0, m._)(this, o).clear()
            }
            constructor(e = {}) {
                (0, f._)(this, r, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, o, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, l, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, s, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, f._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, g._)(this, r, e.queryCache || new C), (0, g._)(this, o, e.mutationCache || new A), (0, g._)(this, l, e.defaultOptions || {}), (0, g._)(this, s, new Map), (0, g._)(this, c, new Map), (0, g._)(this, u, 0)
            }
        });
    e.s(["QueryClient", 0, N], 387125)
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
}, 550742, e => {
    "use strict";
    let t, a;
    var n, i, r = e.i(416340);
    let o = "u" > typeof Intl,
        l = !o || void 0 === Intl.Locale,
        s = !o || void 0 === Intl.RelativeTimeFormat,
        c = !o || void 0 === Intl.PluralRules,
        u = !o || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (n = l || s || c || u || d, i = function() {
            return Promise.all([(l ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([s ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, c ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, u ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, a = n ? i().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, n] = (0, r.useState)(!a || t);
            return (0, r.useEffect)(() => {
                a && !e && a.then(() => n(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, p], 550742)
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
            children: l,
            unifiedLogger: s,
            pageLoggerConfig: c,
            path: u
        } = e, d = null != (o = null == c ? void 0 : c.tags) ? o : n, p = null == c ? void 0 : c.rosId, m = (0, t.useMemo)(() => ({
            tags: d,
            rosId: p,
            path: u
        }), [d, p, u]), f = (0, t.useRef)(m), g = (0, t.useRef)(m);
        (0, t.useLayoutEffect)(() => {
            g.current = m, void 0 === f.current.path && void 0 !== m.path && (f.current = {
                ...f.current,
                path: m.path
            })
        }, [m]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && r.has(a)) ? f.current : g.current;
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
        let h = (0, t.useMemo)(() => ({
            unifiedLogger: s,
            pageContext: m
        }), [s, m]);
        return t.default.createElement(a.Provider, {
            value: h
        }, l)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=34637486-8355-347d-46f5-d4afe2c1926f
//# sourceMappingURL=0k-91xj5o17nw.js.map