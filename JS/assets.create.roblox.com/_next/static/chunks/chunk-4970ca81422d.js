;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "f97a9aca-3bea-3c47-c09b-a2674695f553")
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
        }),
        u = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableTimedOptionsSunsetBanner",
            defaultValue: !1
        });
    e.s(["enableAvatarCreationTokenCategories", 0, i, "enableBulkMakeupTokenCreation", 0, r, "enableCoreContentGatedBanner", 0, l, "enableCreatorShowcases", 0, a, "enableTaxonomyBasedCreatorDashboard", 0, n, "enableTimedOptionsSunsetBanner", 0, u, "isAutoPublishPreferencesEnabled", 0, s, "showTaxonomyOnAvatarItemAnalyticsTab", 0, o])
}, 245299, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "collaborative-tools",
        name: "enableEnvironments",
        defaultValue: !1
    });
    e.s(["enableEnvironments", 0, t])
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
            name: "isPublishBeforeExposeEnabled",
            defaultValue: !1
        });
    e.s(["isAssetAccessRequestsEnabled", 0, a, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, n, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, i, "isPublishBeforeExposeEnabled", 0, o])
}, 165136, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isUnifiedMatchesEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isExperiencePreviewEnabled",
            defaultValue: !0
        }),
        i = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "enableIpPlatformLicenseRecommendations",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isImageAttachmentEnabledInLicenseApplication",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isShowcaseExperiencesEnabled",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIgnoreMatchEnabled",
            defaultValue: !0
        }),
        l = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "maxCollectibleItemDetailsRequestCount",
            defaultValue: 30
        }),
        u = (0, t.defineFlag)({
            namespace: "content-licensing",
            name: "isIphEarningsTotalAcrossLicenseTypesEnabled",
            defaultValue: !1
        });
    e.s(["enableIpPlatformLicenseRecommendations", 0, i, "isExperiencePreviewEnabled", 0, a, "isIgnoreMatchEnabled", 0, o, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isIphEarningsTotalAcrossLicenseTypesEnabled", 0, u, "isShowcaseExperiencesEnabled", 0, s, "isUnifiedMatchesEnabled", 0, n, "maxCollectibleItemDetailsRequestCount", 0, l])
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
}, 779433, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "content-suitability",
            name: "questionnaireV2Allowlist",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "content-suitability",
            name: "questionnaireV2Q1Release",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "content-suitability",
            name: "enableProposedIarcQuestionnaire",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "content-suitability",
            name: "enableStudioQuestionnaireV2",
            defaultValue: !1
        });
    e.s(["enableProposedIarcQuestionnaire", 0, i, "enableStudioQuestionnaireV2", 0, r, "questionnaireV2Allowlist", 0, n, "questionnaireV2Q1Release", 0, a])
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
        u = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsModeratedTabEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, n, "isMomentsFeedIdEnabled", 0, o, "isMomentsModeratedTabEnabled", 0, u, "isMomentsShareLinkEnabled", 0, l, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, a, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, r])
}, 846130, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupport",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportTicketTranslation",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        r = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportArchive",
            defaultValue: !1
        }),
        o = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCategoryChange",
            defaultValue: !1
        }),
        l = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportSpamManagement",
            defaultValue: !1
        }),
        u = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enableEarlyTestersUserOwnedGame",
            defaultValue: !1
        });
    e.s(["enableEarlyTestersUserOwnedGame", 0, u, "enablePlayerHostedEvents", 0, i, "enablePlayerSupport", 0, n, "enablePlayerSupportArchive", 0, s, "enablePlayerSupportCategoryChange", 0, o, "enablePlayerSupportCreatorTicketReroute", 0, r, "enablePlayerSupportSpamManagement", 0, l, "enablePlayerSupportTicketTranslation", 0, a])
}, 787617, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-platform",
            name: "isCreationsNavigationReorderEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-platform",
            name: "tryOnWebButtonEnabled",
            defaultValue: !1
        });
    e.s(["isCreationsNavigationReorderEnabled", 0, n, "tryOnWebButtonEnabled", 0, a])
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
}, 481186, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "extended-services",
        name: "isQueueServiceAnalyticsEnabled",
        defaultValue: !1
    });
    e.s(["isQueueServiceAnalyticsEnabled", 0, t])
}, 242002, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "game-discovery-serving",
            name: "isAcquisitionThumbnailUpsellEnabled",
            defaultValue: !0
        }),
        a = (0, t.defineFlag)({
            namespace: "game-discovery-serving",
            name: "isHomeAcquisitionSignalsLayoutRefreshEnabled",
            defaultValue: !1
        });
    e.s(["isAcquisitionThumbnailUpsellEnabled", 0, n, "isHomeAcquisitionSignalsLayoutRefreshEnabled", 0, a])
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
    e.s(["enableImageTranslationEnrollment", 0, i, "enableImageTranslationListingTab", 0, r, "enableSharedTranslationListComponents", 0, s, "imageLocalizationSettingsEnabled", 0, n, "imageTranslationAllowlist", 0, a])
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
            name: "isProductArchiveEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "monetization",
            name: "mockShopItemsExternalEligibility",
            defaultValue: !1
        });
    e.s(["isProductArchiveEnabled", 0, r, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, a, "mockManagedPricingSummary", 0, n, "mockShopItemsExternalEligibility", 0, s])
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
        u = async () => {
            localStorage.removeItem(l)
        }, c = async () => {
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
                return u(), !1
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
        }), f = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, m = async () => await (0, s.getAgeVerificationUpsellFeatureAccess)() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: s
        } = e, [l, u] = (0, n.useState)(!0), [h, g] = (0, n.useState)("doNotShow"), {
            isFetched: y,
            user: b
        } = (0, a.useRobloxAuthentication)(), {
            unifiedLogger: w
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: S,
            isEnabled: A
        } = (0, n.useMemo)(() => {
            let e = f(o.AGE_VERIFICATION_UPSELL_BANNER_START_DATE),
                t = f(o.AGE_VERIFICATION_UPSELL_BANNER_END_DATE),
                n = f(o.AGE_VERIFICATION_UPSELL_BANNER_HIGH_PRIORITY_DATE),
                a = new Date;
            return {
                isHighPriority: n <= a,
                isEnabled: e <= a && a < t
            }
        }, []), E = (0, n.useCallback)(async () => {
            await d(), u(!0)
        }, [u]);
        (0, n.useEffect)(() => {
            A && y && (null == b ? void 0 : b.id) && (async () => {
                let e = !1;
                try {
                    e = await c()
                } catch (e) {
                    w.logErrorEvent({
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
        let C = (0, n.useMemo)(() => {
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
            value: C,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, n.useContext)(p)], 906791)
}, 968439, e => {
    "use strict";
    var t, n = e.i(721281),
        a = e.i(975937),
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
        u = new a.DiscoveryApi(o);
    e.s(["ApplicationAuthorizationsClient", 0, {
        authorizationApi: l,
        discoveryApi: u
    }, "EApplicationErrorResponseFields", () => r, "default", 0, s])
}, 6923, e => {
    "use strict";
    var t = e.i(448567);
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
        n = e.i(601362),
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
                var u = [o, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (r = 0)), r;) try {
                    if (n = 1, a && (i = 2 & u[0] ? a.return : u[0] ? a.throw || ((i = a.return) && i.call(a), 0) : a.next) && !(i = i.call(a, u[1])).done) return i;
                    switch (a = 0, i && (u = [2 & u[0], i.value]), u[0]) {
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
                            r.label++, a = u[1], u = [0];
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
                    u = [6, e], a = 0
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

    function u(e) {
        var t;
        return null == (t = e) ? t : {
            createdAt: (0, n.exists)(t, "created_at") ? new Date(t.created_at) : void 0,
            id: (0, n.exists)(t, "id") ? t.id : void 0,
            policy: (0, n.exists)(t, "policy") ? t.policy : void 0,
            policyLabelKey: (0, n.exists)(t, "policy_label_key") ? t.policy_label_key : void 0
        }
    }
    var c = function(e) {
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
                                        items: (0, n.exists)(e, "items") ? e.items.map(u) : void 0
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
        d = n,
        p = e.i(272593);
    class f extends d.BaseAPI {
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
        async getUniverseViolation(e, t) {
            let n = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t)),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}",
                method: "GET",
                headers: {}
            });
            return new d.JSONApiResponse(n, e => ({
                ...u(e),
                appealBy: void 0 === e.appeal_by ? void 0 : new Date(e.appeal_by),
                canAppeal: e.can_appeal,
                appeals: e.appeals.map(e => ({
                    state: e.state,
                    createdAt: new Date(e.created_at),
                    decidedAt: void 0 === e.decided_at ? void 0 : new Date(e.decided_at),
                    submitterUserId: e.submitter_user_id,
                    message: e.message
                })),
                moderatorNote: e.moderator_note
            })).value()
        }
        async createUniverseViolationAppeal(e, t, n) {
            let a = await this.request({
                path: "/v1/universes/".concat(e, "/violations/").concat(encodeURIComponent(t), "/appeals"),
                schemaPath: "/v1/universes/{universe_id}/violations/{violation_id}/appeals",
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: {
                    message: n
                }
            });
            return new d.JSONApiResponse(a, e => ({
                state: e.state,
                createdAt: new Date(e.created_at),
                message: e.message
            })).value()
        }
        constructor() {
            const e = (0, p.createClientConfiguration)("creator-transparency-service", "bedev2");
            super(e), (0, t._)(this, "api", void 0), this.api = new c(e)
        }
    }
    let m = new f;
    e.s(["default", 0, m], 28850)
}, 66424, 546578, e => {
    "use strict";
    var t = e.i(146383),
        n = e.i(721281),
        a = e.i(601362);
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

    function u(e) {
        let {
            inquiryId: t,
            sessionToken: n
        } = e;
        if (!t || !n) throw TypeError("InitializeSanctionsScreeningEmbedding returned an unexpected payload");
        return {
            inquiryId: t,
            sessionToken: n
        }
    }
    e.s(["C", 0, i, "a", 0, u, "g", 0, function(e) {
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
    }, "w", 0, l], 546578);
    var c = e.i(272593);
    let d = new t.CreatorWalletsAPIApi((0, c.createClientConfiguration)("creator-wallets", "bedev2"));

    function p(e) {
        if (void 0 === e) return;
        if (!/^[1-9]\d*$/.test(e)) throw TypeError("Creator Wallet group id must be a positive integer");
        let t = Number(e);
        if (!Number.isSafeInteger(t)) throw TypeError("Creator Wallet group id must be a safe integer");
        return t
    }
    e.s(["default", 0, {
        getOnboardingState(e, t) {
            let n = p(e);
            return l(void 0 === n ? d.v1SelfOnboardingStateGet({}, t) : d.v1GroupCreatorWalletIdGroupIdOnboardingStateGet({
                creatorWalletIdGroupId: n
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
        acknowledgeOnboardingStatus(e, t) {
            let n = p(t);
            return l(void 0 === n ? d.v1SelfOnboardingStatusacknowledgePost({
                acknowledgeOnboardingStatusRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingStatusacknowledgePost({
                creatorWalletIdGroupId: n,
                acknowledgeOnboardingStatusRequest: e
            }))
        },
        getSanctionsScreening: e => l(d.v1SelfOnboardingSanctionsScreeningGet({}, e)),
        startSanctionsScreening: () => l(d.v1SelfOnboardingSanctionsScreeningstartPost({
            startSanctionsScreeningRequest: {}
        })),
        initializeSanctionsScreeningEmbedding: async () => u(await l(d.v1SelfOnboardingSanctionsScreeningEmbeddinginitializePost({
            initializeSanctionsScreeningEmbeddingRequest: {}
        }))),
        getWalletBalance(e, t) {
            let n = p(e);
            return l(void 0 === n ? d.v1SelfWalletBalanceGet({}, t) : d.v1GroupCreatorWalletIdGroupIdWalletBalanceGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        getWalletEarningsEstimate(e, t) {
            let n = p(e);
            return l(void 0 === n ? d.v1SelfWalletEarningsEstimateGet({}, t) : d.v1GroupCreatorWalletIdGroupIdWalletEarningsEstimateGet({
                creatorWalletIdGroupId: n
            }, t))
        },
        listBeneficiaries(e, t, n) {
            let a = p(e),
                i = (null == n ? void 0 : n.includeArchived) ? {
                    includeArchived: !0
                } : {};
            return l(void 0 === a ? d.v1SelfWalletBeneficiariesGet(i, t) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesGet({
                creatorWalletIdGroupId: a,
                ...i
            }, t))
        },
        initializeKycEmbedding(e, t) {
            let n = p(t);
            return l(void 0 === n ? d.v1SelfOnboardingKycEmbeddinginitializePost({
                initializeKycEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingKycEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeKycEmbeddingRequest: e
            }))
        },
        initializeKycRfiEmbedding(e, t) {
            let n = p(t);
            return l(void 0 === n ? d.v1SelfOnboardingKycRfiEmbeddinginitializePost({
                initializeKycRfiEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdOnboardingKycRfiEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeKycRfiEmbeddingRequest: e
            }))
        },
        async initializeBeneficiaryEmbedding(e, t) {
            let n = p(t);
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
            }(await l(void 0 === n ? d.v1SelfWalletBeneficiaryEmbeddinginitializePost({
                initializeBeneficiaryEmbeddingRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiaryEmbeddinginitializePost({
                creatorWalletIdGroupId: n,
                initializeBeneficiaryEmbeddingRequest: e
            })))
        },
        async saveBeneficiary(e, t) {
            let n = p(t);
            return function(e) {
                let {
                    beneficiary: t
                } = e;
                if (!t || "string" != typeof t.beneficiaryId) throw TypeError("SaveBeneficiary returned an unexpected payload");
                return t
            }(await l(void 0 === n ? d.v1SelfWalletBeneficiariesPost({
                saveBeneficiaryRequest: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesPost({
                creatorWalletIdGroupId: n,
                saveBeneficiaryRequest: e
            })))
        },
        archiveBeneficiary(e, t) {
            let n = p(t);
            return l(void 0 === n ? d.v1SelfWalletBeneficiariesBeneficiaryIdDelete({
                beneficiaryId: e
            }) : d.v1GroupCreatorWalletIdGroupIdWalletBeneficiariesBeneficiaryIdDelete({
                creatorWalletIdGroupId: n,
                beneficiaryId: e
            }))
        },
        initiateWithdrawal(e, t) {
            let n = p(t);
            return l(d.v1WalletWithdrawalsPost({
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
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(242319),
        a = e.i(272593);
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
            (0, t._)(this, "localeApi", void 0), this.localeApi = new n.LocaleApi((0, a.createClientConfiguration)("locale", "bedev1"))
        }
    };
    e.s(["default", 0, i])
}, 607204, e => {
    "use strict";
    var t = e.i(865404),
        n = e.i(272593),
        a = e.i(127403);
    let i = (0, n.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new a.default]
        }),
        r = new t.OrganizationApi(i),
        s = new t.InvitationApi(i),
        o = new t.RoleApi(i),
        l = new t.UserApi(i),
        u = new t.GroupUniversePayoutApi(i);
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
            getInvitationsByOrganizationId: async (e, t, n) => s.v1OrganizationsOrganizationIdInvitationsGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: n
            }),
            getInvitation: async (e, t) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdGet({
                organizationId: e,
                invitationId: t
            }),
            acceptOrDeclineInvitation: async (e, t, n) => s.v1OrganizationsOrganizationIdInvitationsInvitationIdPatch({
                organizationId: e,
                invitationId: t,
                updateInvitationRequestModel: n
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
            getRoleMetadata: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataGet({
                organizationId: e,
                roleId: t,
                isDefault: n
            }),
            updateRoleMetadata: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesRoleIdMetadataPatch({
                organizationId: e,
                roleId: t,
                createOrUpdateRoleRequestModel: n
            }),
            updateRolePosition: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesRoleIdPositionPatch({
                organizationId: e,
                roleId: t,
                updateRolePositionRequestModel: n
            }),
            getRolesByOrganization: async (e, t, n) => o.v1OrganizationsOrganizationIdRolesGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: n
            }),
            deleteRole: async (e, t) => o.v1OrganizationsOrganizationIdRolesRoleIdDelete({
                organizationId: e,
                roleId: t
            }),
            getInvitationsWithRole: async (e, t, n, a) => o.v1OrganizationsOrganizationIdRolesRoleIdInvitationsGet({
                organizationId: e,
                roleId: t,
                pageToken: n,
                maxPageSize: a
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
            getUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => u.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let n = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return u.v1OrganizationsOrganizationIdPayoutsLatestGet(n)
            },
            getSuggestedPayouts: async e => u.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
                organizationId: e
            })
        }
    }])
}, 196990, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(882143),
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
        n = e.i(86328),
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
}, 127403, e => {
    "use strict";
    e.s(["default", 0, class {
        post(e) {
            let {
                fetch: t,
                url: n,
                init: a,
                response: i
            } = e, r = new URL(n);
            return "POST" !== a.method && "PATCH" !== a.method || "true" === r.searchParams.get("isSecure") || 403 !== i.status ? Promise.resolve(i) : (r.searchParams.set("isSecure", "true"), t(r.toString(), a))
        }
    }])
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
        u = (0, n.createContext)({
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
            user: s
        } = (0, a.useAuthentication)(), [c, d] = (0, n.useState)([]), [p, f] = (0, n.useState)(!1), [m, h] = (0, n.useState)(!0), [g, y] = (0, n.useState)(!1), b = (0, n.useCallback)(async () => {
            if (!p && (null == s ? void 0 : s.id) != null) try {
                y(!1), h(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(s.id.toString()),
                    t = (e => {
                        for (let a of (o(e), e)) {
                            var t, n;
                            l(null != (t = a.notificationCategoryName) ? t : "", null != (n = a.notifications) ? n : [])
                        }
                        return e
                    })(e.categories || []);
                d(t), f(!0)
            } catch (e) {
                y(!0), f(!1)
            } finally {
                h(!1)
            }
        }, [null == s ? void 0 : s.id, p]), w = (0, n.useMemo)(() => ({
            notificationSettings: c,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: g,
            notificationSettingsContextLoading: m,
            getNotificationSettings: b,
            setNotificationSettings: d
        }), [c, g, b, m, p]);
        return (0, t.jsx)(u.Provider, {
            value: w,
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
}, 719338, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let n = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        refreshOrganization: () => ({}),
        isOrganizationLoading: !1
    });
    n.displayName = "Organization", e.s(["default", 0, n], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(n)
    }], 719338)
}, 911502, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(589624),
        i = e.i(79187),
        r = e.i(814975),
        s = e.i(607204),
        o = e.i(865404),
        l = e.i(881670),
        u = e.i(509049),
        c = e.i(745873),
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
    let C = (0, y.makeStyles)()(() => ({
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
                translate: u
            } = (0, i.useTranslation)(), {
                organization: c
            } = (0, E.default)(), {
                classes: {
                    dialogTitle: y,
                    dialogContent: I,
                    dialogSubActions: T
                }
            } = C(), {
                enqueue: P,
                close: R
            } = (0, b.useSnackbar)(), _ = (0, n.useCallback)(e => {
                P({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: A.toastDurationTime,
                    autoHide: !0,
                    onClose: R
                })
            }, [P, R]), [x, O] = (0, n.useState)(), [k, U] = (0, n.useState)(), [L, N] = (0, n.useState)(), [G, F] = (0, n.useState)(), M = (0, n.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await S.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    N(e.name), F(!1)
                } catch (e) {
                    F(!0)
                }
            }, [l]), D = (0, n.useCallback)(async () => {
                if ((null == c ? void 0 : c.id) && (null == c ? void 0 : c.groupId)) try {
                    let e = await w.default.getGroupInfo(Number.parseInt(c.groupId, 10));
                    O(null == e ? void 0 : e.name)
                } catch (e) {
                    _(u("Error.GroupInformation"))
                }
            }, [null == c ? void 0 : c.groupId, null == c ? void 0 : c.id, _, u]);
            (0, n.useEffect)(() => {
                M(), D()
            }, [D, M]);
            let V = (0, n.useCallback)(() => {
                    r(void 0)
                }, [r]),
                q = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        U(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            _(u("Error.DecliningInvitation")), U(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, _, u]),
                B = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        U(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            _(u("Error.AcceptingInvitation")), U(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, _, u]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                children: [(0, t.jsx)(m.DialogContent, {
                    className: I,
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(h.Grid, {
                            container: !0,
                            children: (0, t.jsx)(g.Typography, {
                                variant: "h4",
                                className: y,
                                children: u("Label.JoinOrganization", {
                                    organizationName: null != x ? x : u("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(h.Grid, {
                            container: !0,
                            children: (0, t.jsx)(g.Typography, {
                                variant: "body1",
                                children: G ? u("Message.JoinOrganizationWithoutUsername") : u("Message.JoinOrganization", {
                                    username: null != L ? L : ""
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
                            onClick: V,
                            disabled: k,
                            children: u("Action.NotNow")
                        }), (0, t.jsxs)(h.Grid, {
                            className: T,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: q,
                                disabled: k,
                                children: u("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: B,
                                loading: k,
                                children: u("Action.Accept")
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
        P = (0, i.withTranslation)(e => {
            let {
                open: a,
                onClose: r,
                invitation: s,
                accepted: o
            } = e, {
                translate: l
            } = (0, i.useTranslation)(), {
                classes: {
                    dialogTitle: u,
                    dialogContent: c,
                    dialogActions: y
                }
            } = T(), [b, w] = (0, n.useState)(), [A, E] = (0, n.useState)(), C = (0, n.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await S.default.getUserById(Number.parseInt(s.senderUserId, 10));
                    w(e.name), E(!1)
                } catch (e) {
                    E(!0)
                }
            }, [s]);
            (0, n.useEffect)(() => {
                C()
            }, [C]);
            let I = (0, n.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                onClose: r,
                children: [(0, t.jsx)(m.DialogContent, {
                    className: c,
                    children: (0, t.jsxs)(h.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(g.Typography, {
                            variant: "h4",
                            className: u,
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
                            onClick: I,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]);
    var R = e.i(582977),
        _ = e.i(672401);
    let x = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, a.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, c.useCurrentGroup)(), {
            currentItemGroupId: f
        } = (0, u.default)(), [m, h] = (0, n.useState)(), [g, y] = (0, n.useState)(), [b, w] = (0, n.useState)(!1), [S, A] = (0, n.useState)(!1), [E, C] = (0, n.useState)(), [T, x] = (0, n.useState)(!1), O = null == d ? void 0 : d.id, k = (0, n.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : f
        }, [p, f]), U = l.query[R.InviteQueryKey], L = l.isReady, N = (0, n.useCallback)(() => {
            a.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), G = (0, n.useCallback)(async e => {
            if (!O) return void y(null);
            try {
                let t = await s.default.userClient.getUserInvitationByOrganization(e, O.toString());
                y(t)
            } catch (e) {
                y(null), N()
            }
        }, [O, N]), F = (0, n.useCallback)(async () => {
            if (L) {
                A(!0);
                try {
                    if ("string" == typeof U) return void await G(U);
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
        }, [k, G, U, L]), M = (0, n.useCallback)(() => {
            w(!0), F()
        }, [F]), D = (0, n.useMemo)(() => ({
            organization: m,
            refreshOrganization: M,
            isOrganizationRefreshRequired: b,
            isOrganizationLoading: S
        }), [m, M, b, S]);
        return (0, n.useEffect)(() => {
            F()
        }, [F]), (0, t.jsx)(_.default.Provider, {
            value: D,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, g && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(I, {
                        open: g.invitationStatusType === o.InvitationStatusType.Open && void 0 === E,
                        onClose: e => {
                            !0 === e ? (C(!0), x(!0)) : !1 === e ? (C(!1), x(!0)) : (N(), y(null))
                        },
                        invitation: g
                    }), (0, t.jsx)(P, {
                        open: T,
                        onClose: () => {
                            x(!1), !0 === E && M(), N()
                        },
                        invitation: g,
                        accepted: !0 === E
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, x], 911502)
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
}, 927868, e => {
    "use strict";
    e.s(["getEnumKeyByValue", 0, (e, t) => {
        let n = Object.entries(e).find(e => {
            let [, n] = e;
            return n === t
        });
        return n ? n[0] : null
    }, "isValidArrayEnumValue", 0, (e, t) => e.includes(t), "isValidEnumValue", 0, (e, t) => Object.values(e).includes(t)])
}, 839165, e => {
    "use strict";
    var t = e.i(601362);
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
}, 745873, 67262, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(458451),
        i = e.i(533414),
        r = e.i(157310),
        s = e.i(128513),
        o = e.i(602635),
        l = e.i(814975);
    let u = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        c = new s.UserScreenApi(u),
        d = new s.GroupsApi(u),
        p = {
            groupsApi: d,
            userScreenApi: c,
            creatorHomeContentApi: new s.CreatorHomeContentApi(u),
            signalsApi: new s.SignalsApi(u)
        };
    e.s(["CreatorHomeClient", 0, p], 67262);
    let f = function() {
        let {
            user: e
        } = (0, l.useAuthentication)();
        return (0, r.useQuery)({
            queryKey: o.getGroupsQueryKey,
            enabled: !!e,
            queryFn: () => {
                let e;
                return e = {
                    surface: s.GroupListSurface.CreatorHub
                }, p.groupsApi.groupsListGroups(e)
            }
        })
    };
    var m = e.i(809576);
    let h = (0, n.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: r
        } = e, {
            user: s
        } = (0, a.useRobloxAuthentication)(), o = (0, m.useGroupPermissionFetchers)(), {
            data: l,
            isLoading: u,
            refetch: c
        } = f(), [d, p] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == s ? void 0 : s.id), null), [g, y] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == s ? void 0 : s.id), null), [b, w] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == s ? void 0 : s.id), {}), S = (0, n.useCallback)(e => {
            y(e);
            let t = null != e ? e : "user";
            w(e => {
                let n = {
                    lastSelected: Date.now(),
                    priority: 1
                };
                if (e[t]) {
                    let {
                        priority: a,
                        lastSelected: i
                    } = e[t];
                    "number" != typeof a || Number.isNaN(a) || "number" != typeof i || Number.isNaN(i) || (n.priority = a * (1 + Math.log10(1 + 10 / Math.max(Date.now() - i, 864e5))))
                }
                return {
                    ...e,
                    [t]: n
                }
            })
        }, [y, w]), A = (0, n.useMemo)(() => {
            if (null == l ? void 0 : l.groups) return null == l ? void 0 : l.groups;
            if (null === d) return [];
            try {
                let e = "string" == typeof d ? JSON.parse(d) : d;
                return Array.isArray(e) && e.every(e => "object" == typeof e && null !== e && "id" in e && "number" == typeof e.id && "name" in e && "string" == typeof e.name && "roleSetName" in e && "string" == typeof e.roleSetName) ? e : []
            } catch (e) {
                return []
            }
        }, [d, null == l ? void 0 : l.groups]), E = (0, n.useMemo)(() => {
            var e;
            return g && null != (e = A.find(e => {
                let {
                    id: t
                } = e;
                return t === g
            })) ? e : null
        }, [g, A]), C = null == E ? void 0 : E.id, I = null == s ? void 0 : s.id, {
            data: T,
            error: P,
            isPending: R,
            refetch: _
        } = (0, m.useGroupResolvedPermissionsQuery)(C, I), {
            data: x,
            isPending: O,
            refetch: k
        } = (0, m.useGroupOwnershipQuery)(C, I), U = (0, n.useCallback)(() => null == C || null == I ? Promise.resolve() : Promise.all([_(), k()]), [k, _, C, I]);
        (0, n.useEffect)(() => {
            (null == s ? void 0 : s.id) && (null == l ? void 0 : l.groups) && !u && p(null == l ? void 0 : l.groups)
        }, [null == l ? void 0 : l.groups, A, u, p, null == s ? void 0 : s.id]);
        let L = (0, n.useMemo)(() => {
            var e;
            return {
                groups: A,
                currentGroup: E,
                groupData: b,
                isFetched: !u && !!I,
                refreshGroups: c,
                setCurrentGroup: S,
                ...o,
                permissions: T,
                isOwner: null != I && (null == x || null == (e = x.owner) ? void 0 : e.userId) === I,
                isPermissionsLoading: null != E && (R || O),
                permissionsError: P,
                refreshPermissions: U
            }
        }, [E, b, A, u, O, R, x, o, T, P, c, U, S, I]);
        return (0, t.jsx)(h.Provider, {
            value: L,
            children: r
        })
    }, "useCurrentGroup", 0, () => {
        let e = (0, n.useContext)(h);
        if (null === e) throw Error("useCurrentGroup must be used within a GroupsProvider");
        return e.currentGroup
    }, "useGroups", 0, () => {
        let e = (0, n.useContext)(h);
        if (null === e) throw Error("useGroups must be used within a GroupsProvider");
        return e
    }], 745873)
}, 809576, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(711367),
        a = e.i(157310),
        i = e.i(795621),
        r = e.i(458451),
        s = e.i(536745),
        o = e.i(272593);
    let l = new s.PermissionsV2Api((0, o.createClientConfiguration)("groups", "bedev1"));
    async function u(e, t, n) {
        var a;
        return null != (a = (await l.v2GroupsGroupIdEntityTypeEntityIdPermissionsResolvedGet({
            groupId: e,
            entityType: t,
            entityId: n
        })).permissions) ? a : {}
    }
    async function c(e) {
        return u(e, "groups", String(e))
    }
    async function d(e) {
        let t, n = [];
        do {
            var a, i;
            let r = await l.v2GroupsGroupIdEntityTypePermissionsResolvedGet({
                groupId: e,
                entityType: "roles",
                cursor: t
            });
            n.push(...null != (a = r.data) ? a : []), t = null != (i = r.nextPageCursor) ? i : void 0
        } while (t) return n
    }
    var p = e.i(156071);
    let f = new s.PermissionsV2Api((0, o.createClientConfiguration)("groups", "bedev1"));
    async function m(e) {
        var t;
        return null != (t = (await f.v2EntityTypeEntityIdPermissionsResolvedGet({
            entityType: "universes",
            entityId: String(e)
        })).permissions) ? t : {}
    }
    var h = e.i(759283);
    let g = (e, t) => ["groups", e, t, "resolved-permissions"],
        y = (e, t) => ["groups", e, t, "roles", "resolved-permissions"],
        b = (e, t) => ["universe-resolved-permissions", t, void 0 === e ? e : String(e)];
    e.s(["useGroupOwnershipQuery", 0, function(e, t) {
        return (0, a.useQuery)({
            queryKey: ["groups", e, t, "owner"],
            queryFn: e && t ? () => p.default.getGroupInfo(e) : n.skipToken
        })
    }, "useGroupPermissionFetchers", 0, function() {
        let {
            user: e
        } = (0, r.useRobloxAuthentication)(), n = (0, i.useQueryClient)(), a = null == e ? void 0 : e.id, s = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: b(e, a),
            queryFn: () => m(e),
            staleTime: 6e4
        }), [n, a]), o = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: g(e, a),
            queryFn: () => c(e),
            staleTime: 6e4
        }), [n, a]), l = (0, t.useCallback)(e => n.fetchQuery({
            queryKey: y(e, a),
            queryFn: () => d(e),
            staleTime: 6e4
        }), [n, a]);
        return (0, t.useMemo)(() => ({
            fetchGroupPermissions: o,
            fetchRolePermissions: l,
            fetchUniversePermissions: s
        }), [o, l, s])
    }, "useGroupResolvedPermissionsQuery", 0, function(e, t) {
        return (0, a.useQuery)({
            queryKey: g(e, t),
            queryFn: e && t ? () => c(e) : n.skipToken,
            staleTime: 6e4
        })
    }, "useGroupRolesResolvedPermissions", 0, function(e) {
        let {
            user: t
        } = (0, r.useRobloxAuthentication)(), i = null == t ? void 0 : t.id;
        return (0, a.useQuery)({
            queryKey: y(e, i),
            queryFn: e && i ? () => d(e) : n.skipToken,
            staleTime: 6e4
        })
    }, "useUniversePermissions", 0, function(e) {
        let {
            user: t
        } = (0, r.useRobloxAuthentication)(), i = null == t ? void 0 : t.id;
        return (0, a.useQuery)({
            queryKey: b(e, i),
            queryFn: void 0 !== e && e !== h.uninitializedUniverseId ? () => m(e) : n.skipToken,
            staleTime: 6e4
        })
    }], 809576)
}, 407881, 616931, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(589624),
        i = e.i(882143);
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
        } = (0, a.useRouter)(), [l, u] = (0, n.useState)(!0), c = (0, n.useCallback)(() => u(!1), []), d = s.some(e => r.startsWith(e)), p = (0, n.useMemo)(() => ({
            isPending: l && !d,
            completeCheck: c
        }), [l, d, c]);
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
        u = o === t.Locale.SimplifiedChinese ? s.default : r.default;
    e.s(["defaultLocale", 0, o, "defaultMetadataJson", 0, u, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 882143, e => {
    "use strict";
    var t = e.i(601362),
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
                var u = [o, l];
                if (n) throw TypeError("Generator is already executing.");
                for (; s && (s = 0, u[0] && (r = 0)), r;) try {
                    if (n = 1, a && (i = 2 & u[0] ? a.return : u[0] ? a.throw || ((i = a.return) && i.call(a), 0) : a.next) && !(i = i.call(a, u[1])).done) return i;
                    switch (a = 0, i && (u = [2 & u[0], i.value]), u[0]) {
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
                            r.label++, a = u[1], u = [0];
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
                    u = [6, e], a = 0
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

    function u(e) {
        if (void 0 !== e) return null === e ? null : {
            acceptances: e.acceptances.map(l)
        }
    }

    function c(e) {
        var n;
        return null == (n = e) ? n : {
            errorCode: (0, t.exists)(n, "errorCode") ? n.errorCode : void 0,
            message: (0, t.exists)(n, "message") ? n.message : void 0,
            agreementId: n.agreementId
        }
    }

    function d(e, n) {
        return null == e ? e : {
            results: (0, t.exists)(e, "results") ? null === e.results ? null : e.results.map(c) : void 0
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
                                    body: u(e.insertAcceptancesRequest)
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
                                    body: u(e.insertAcceptancesRequest)
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
        f = function(e) {
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
}, 826246, e => {
    "use strict";
    var t = e.i(880343),
        n = e.i(968892),
        a = e.i(944821),
        i = e.i(24286),
        r = e.i(247268),
        s = e.i(197649),
        o = e.i(416340);
    let l = {
            Info: "icon-filled-circle-i",
            Warning: "icon-filled-triangle-exclamation",
            Success: "icon-filled-circle-check",
            Error: "icon-filled-circle-x"
        },
        u = {
            Info: "var(--color-system-emphasis)",
            Warning: "var(--color-system-warning)",
            Success: "var(--color-extended-green-700, var(--color-system-success))",
            Error: "var(--color-action-alert-foreground)"
        },
        c = {
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
        f = e => {
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
        m = (0, o.forwardRef)((e, n) => {
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
                onSecondaryAction: C,
                hasCloseAffordance: I = !0,
                closeLabel: T = "Dismiss alert",
                onDismiss: P,
                className: R,
                style: _,
                ...x
            } = e, O = (0, a.default)("foundation-web-alert-message-"), k = !!g, U = !!S, L = !!(I && P), N = "Feedback" === m && (k || U || L), G = "Warning" === h || "Error" === h ? "alert" : "status", F = null;
            k && (F = U ? o.default.createElement(p, {
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
            let M = U ? o.default.createElement(p, {
                label: S || "",
                href: A,
                linkTarget: E,
                onAction: C,
                variant: "Utility"
            }) : null;
            return o.default.createElement("div", {
                ref: n,
                role: N ? "region" : G,
                "aria-labelledby": N ? O : void 0,
                className: (0, s.default)("foundation-web-alert relative width-full stroke-standard", "System" === m ? "[border-left-width:0] [border-right-width:0]" : "radius-medium", c[h], R),
                ...x
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
                    color: u[h]
                }
            }))), o.default.createElement("div", {
                className: (0, s.default)("flex grow-1 basis-0 min-width-0 items-start gap-x-medium gap-y-small", U ? "flex-col" : "wrap")
            }, o.default.createElement("div", {
                id: N ? O : void 0,
                role: N ? G : void 0,
                className: (0, s.default)("flex items-center padding-top-[var(--size-150)] text-body-medium text-wrap content-emphasis [overflow-wrap:anywhere]", U ? "width-full min-width-0" : "grow-1 basis-0 min-width-[min(200px,100%)]")
            }, i), (F || M) && o.default.createElement("div", {
                className: (0, s.default)("flex items-center gap-small wrap shrink-0", !U && "padding-y-[var(--size-150)]")
            }, F, M)), L && o.default.createElement(r.CloseAffordance, {
                variant: "Utility",
                size: "Medium",
                isCircular: !0,
                className: "content-emphasis shrink-0 padding-[var(--size-150)]",
                "aria-label": T,
                onClick: P
            })))
        });
    e.s(["Alert", 0, m])
}, 615051, e => {
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
                maxValue: u,
                valuesLocation: c = "None",
                ariaLabel: d,
                ...p
            } = e, f = "Determinate" === s, m = Math.min(100, Math.max(0, o)), h = f && void 0 !== l && "None" !== c, g = f && void 0 !== u && "None" !== c, y = "Sides" === c, b = n.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", y ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: y ? {
                    flexBasis: 0
                } : void 0
            }, f ? n.default.createElement("div", {
                className: "absolute top-0 left-0 height-100 radius-circle transition-all duration-300 ease-out",
                style: {
                    width: "".concat(m, "%"),
                    backgroundColor: "var(--fui-future-alpha-color-system-progress)"
                }
            }) : n.default.createElement("div", {
                className: "foundation-web-progress-bar-indeterminate absolute top-0 height-100 radius-circle"
            })), w = h && n.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", a),
                "aria-hidden": "true"
            }, l), S = g && n.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", a),
                "aria-hidden": "true"
            }, u), A = (h || g) && n.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, h ? w : n.default.createElement("span", null), g ? S : n.default.createElement("span", null));
            return n.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": f ? 0 : void 0,
                "aria-valuemax": f ? 100 : void 0,
                "aria-valuenow": f ? m : void 0,
                ...p
            }, y ? n.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, w, b, S) : n.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === c && A, b, "Bottom" === c && A))
        });
    i.displayName = "ProgressBar", e.s(["ProgressBar", 0, i])
}, 725260, e => {
    "use strict";
    var t = e.i(169336),
        n = e.i(477763),
        a = e.i(416340),
        i = e.i(226319),
        r = e.i(928277),
        s = e.i(221628),
        o = e.i(636042),
        l = e.i(442632);

    function u(e) {
        return (0, t.g)("MuiDialogContentText", e)
    }(0, r.g)("MuiDialogContentText", ["root"]);
    let c = ["children", "className"],
        d = (0, i.s)(o.T, {
            shouldForwardProp: e => (0, i.r)(e) || "classes" === e,
            name: "MuiDialogContentText",
            slot: "Root",
            overridesResolver: (e, t) => t.root
        })({}),
        p = a.forwardRef(function(e, a) {
            let r = (0, l.u)({
                    props: e,
                    name: "MuiDialogContentText"
                }),
                {
                    className: o
                } = r,
                p = (0, t._)(r, c),
                f = (e => {
                    let {
                        classes: t
                    } = e, a = (0, i.a)({
                        root: ["root"]
                    }, u, t);
                    return (0, n._)({}, t, a)
                })(p);
            return (0, s.jsx)(d, (0, n._)({
                component: "p",
                variant: "body1",
                color: "text.secondary",
                ref: a,
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
        n = e.i(416340),
        a = e.i(669925);
    e.i(221628), e.i(149285);
    var i = (0, n.createContext)({
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
            o = (0, n.useRef)(null),
            l = (0, n.useState)({
                props: {},
                children: void 0
            }),
            u = l[0],
            c = l[1],
            d = (0, n.useState)(!1),
            p = d[0],
            f = d[1],
            m = (0, n.useCallback)(function() {
                f(!0)
            }, [f]),
            h = (0, n.useCallback)(function() {
                f(!1)
            }, [f]),
            g = (0, n.useCallback)(function(e, t) {
                void 0 === t && (t = {}), c({
                    props: t,
                    children: e
                })
            }, [c]),
            y = (0, n.useMemo)(function() {
                return {
                    ref: o,
                    open: m,
                    close: h,
                    configure: g
                }
            }, [h, g, m]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(i.Provider, {
            value: y
        }, r), n.default.createElement(a.default, (0, t._)({}, u.props, s, {
            "aria-labelledby": u.props.id,
            "aria-describedby": "dialog-content-text-describe-id",
            open: p,
            onClose: h,
            ref: o
        }), u.children))
    }, "useDialog", 0, function() {
        var e = (0, n.useContext)(i);
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
        n = e.i(460773),
        a = e.i(856082),
        i = e.i(199169),
        r = e.i(287982),
        s = e.i(725260);
    e.i(221628), e.s(["DialogTemplate", 0, function(e) {
        var o = e.id;
        e.variant;
        var l = e.title,
            u = e.color,
            c = e.loading,
            d = void 0 !== c && c,
            p = e.content,
            f = e.confirmText,
            m = e.cancelText,
            h = e.onCancel,
            g = e.onConfirm;
        return t.default.createElement("div", null, t.default.createElement(n.default, {
            id: o
        }, l), t.default.createElement(a.default, null, t.default.createElement(s.D, {
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
            color: void 0 === u ? "primaryBrand" : u,
            onClick: g
        }, f)))
    }], 613268)
}, 459703, e => {
    "use strict";
    var t = e.i(30941),
        n = e.i(416340),
        a = e.i(787159);
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
        var r, s, o, l, u = e.children,
            c = (0, t.a)(e, ["children"]),
            d = (0, n.useRef)(null),
            p = (0, n.useState)(!1),
            f = p[0],
            m = p[1],
            h = (0, n.useState)([]),
            g = h[0],
            y = h[1],
            b = (0, n.useCallback)(function(e, n) {
                void 0 === e && (e = {}), void 0 === n && (n = function() {
                    return !0
                }), y(function(a) {
                    return (0, t.b)((0, t.b)([], a, !0), [{
                        props: e,
                        shouldClose: n
                    }], !1)
                })
            }, [y]),
            w = (0, n.useCallback)(function() {
                m(!1)
            }, [m]);
        (0, n.useEffect)(function() {
            g.length > 0 && m(!0)
        }, [g.length]);
        var S = (0, n.useMemo)(function() {
            return {
                ref: d,
                enqueue: b,
                close: w
            }
        }, [w, b]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(i.Provider, {
            value: S
        }, u), n.default.createElement(a.S, (0, t._)({}, (null == (r = g[0]) ? void 0 : r.props) || {}, c, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (s = g[0]) ? void 0 : s.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var n, a, i, r;
                    y(function(e) {
                        var n = e.slice(1);
                        return (0, t.b)([], n, !0)
                    }), (null == (a = null == (n = g[0]) ? void 0 : n.props.TransitionProps) ? void 0 : a.onExited) && (null == (r = null == (i = g[0]) ? void 0 : i.props.TransitionProps) || r.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var n, a, i;
                (null == (n = g[0]) ? void 0 : n.shouldClose(t)) && m(!1), (null == (a = g[0]) ? void 0 : a.props.onClose) && (null == (i = g[0]) || i.props.onClose(e, t))
            },
            open: f
        }), null == (l = g[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, n.useContext)(i);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 952661, e => {
    "use strict";
    var t = e.i(459703);
    e.s(["SnackbarProvider", () => t.default])
}, 325240, 681791, e => {
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
    }], 681791);
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
        return (0, s.jsxs)(o.Provider, {
            value: d,
            children: [n, a && (0, s.jsx)(t, {
                request: a,
                open: i,
                onDismiss: c
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
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 325240)
}, 387125, e => {
    "use strict";
    var t, n, a, i, r, s, o, l, u, c, d, p, f = e.i(711300),
        m = e.i(634203),
        h = e.i(35877),
        g = e.i(747304);

    function y(e, t) {
        var n = (0, g._)(e, t, "update");
        if (n.set) {
            if (!n.get) throw TypeError("attempted to read set only private field");
            return "__destrWrapper" in n || (n.__destrWrapper = {
                set value(v) {
                    n.set.call(e, v)
                },
                get value() {
                    return n.get.call(e)
                }
            }), n.__destrWrapper
        }
        if (!n.writable) throw TypeError("attempted to set read only private field");
        return n
    }
    var b = e.i(711367),
        w = e.i(772278),
        S = e.i(665564),
        A = e.i(211089),
        E = (t = new WeakMap, class extends A.Subscribable {
            build(e, t, n) {
                var a;
                let i = t.queryKey,
                    r = null != (a = t.queryHash) ? a : (0, b.hashQueryKeyByOptions)(i, t),
                    s = this.get(r);
                return s || (s = new w.Query({
                    client: e,
                    queryKey: i,
                    queryHash: r,
                    options: e.defaultQueryOptions(t),
                    state: n,
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
                let n = (0, f._)(this, t).get(e.queryHash);
                n && (e.destroy(), n === e && (0, f._)(this, t).delete(e.queryHash), this.notify({
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
        C = e.i(436175),
        I = A,
        T = (n = new WeakMap, a = new WeakMap, i = new WeakMap, class extends I.Subscribable {
            build(e, t, n) {
                let a = new C.Mutation({
                    client: e,
                    mutationCache: this,
                    mutationId: ++y(this, i).value,
                    options: e.defaultMutationOptions(t),
                    state: n
                });
                return this.add(a), a
            }
            add(e) {
                (0, f._)(this, n).add(e);
                let t = P(e);
                if ("string" == typeof t) {
                    let n = (0, f._)(this, a).get(t);
                    n ? n.push(e) : (0, f._)(this, a).set(t, [e])
                }
                this.notify({
                    type: "added",
                    mutation: e
                })
            }
            remove(e) {
                if ((0, f._)(this, n).delete(e)) {
                    let t = P(e);
                    if ("string" == typeof t) {
                        let n = (0, f._)(this, a).get(t);
                        if (n)
                            if (n.length > 1) {
                                let t = n.indexOf(e); - 1 !== t && n.splice(t, 1)
                            } else n[0] === e && (0, f._)(this, a).delete(t)
                    }
                }
                this.notify({
                    type: "removed",
                    mutation: e
                })
            }
            canRun(e) {
                let t = P(e);
                if ("string" != typeof t) return !0;
                {
                    let n = (0, f._)(this, a).get(t),
                        i = null == n ? void 0 : n.find(e => "pending" === e.state.status);
                    return !i || i === e
                }
            }
            runNext(e) {
                let t = P(e);
                if ("string" != typeof t) return Promise.resolve();
                {
                    var n, i;
                    let r = null == (i = (0, f._)(this, a).get(t)) ? void 0 : i.find(t => t !== e && t.state.isPaused);
                    return null != (n = null == r ? void 0 : r.continue()) ? n : Promise.resolve()
                }
            }
            clear() {
                S.notifyManager.batch(() => {
                    (0, f._)(this, n).forEach(e => {
                        this.notify({
                            type: "removed",
                            mutation: e
                        })
                    }), (0, f._)(this, n).clear(), (0, f._)(this, a).clear()
                })
            }
            getAll() {
                return Array.from((0, f._)(this, n))
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
                super(), (0, m._)(this, n, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, a, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, i, {
                    writable: !0,
                    value: void 0
                }), this.config = e, (0, h._)(this, n, new Set), (0, h._)(this, a, new Map), (0, h._)(this, i, 0)
            }
        });

    function P(e) {
        var t;
        return null == (t = e.options.scope) ? void 0 : t.id
    }
    var R = e.i(549772),
        _ = e.i(841246),
        x = e.i(117437),
        O = (r = new WeakMap, s = new WeakMap, o = new WeakMap, l = new WeakMap, u = new WeakMap, c = new WeakMap, d = new WeakMap, p = new WeakMap, class {
            mount() {
                y(this, c).value++, 1 === (0, f._)(this, c) && ((0, h._)(this, d, R.focusManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onFocus())
                })), (0, h._)(this, p, _.onlineManager.subscribe(async e => {
                    e && (await this.resumePausedMutations(), (0, f._)(this, r).onOnline())
                })))
            }
            unmount() {
                var e, t;
                y(this, c).value--, 0 === (0, f._)(this, c) && (null == (e = (0, f._)(this, d)) || e.call(this), (0, h._)(this, d, void 0), null == (t = (0, f._)(this, p)) || t.call(this), (0, h._)(this, p, void 0))
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
                let n = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, f._)(this, r).get(n.queryHash)) ? void 0 : t.state.data
            }
            ensureQueryData(e) {
                let t = this.defaultQueryOptions(e),
                    n = (0, f._)(this, r).build(this, t),
                    a = n.state.data;
                return void 0 === a ? this.fetchQuery(e) : (e.revalidateIfStale && n.isStaleByTime((0, b.resolveStaleTime)(t.staleTime, n)) && this.prefetchQuery(t), Promise.resolve(a))
            }
            getQueriesData(e) {
                return (0, f._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: t,
                        state: n
                    } = e;
                    return [t, n.data]
                })
            }
            setQueryData(e, t, n) {
                let a = this.defaultQueryOptions({
                        queryKey: e
                    }),
                    i = (0, f._)(this, r).get(a.queryHash),
                    s = null == i ? void 0 : i.state.data,
                    o = (0, b.functionalUpdate)(t, s);
                if (void 0 !== o) return (0, f._)(this, r).build(this, a).setData(o, {
                    ...n,
                    manual: !0
                })
            }
            setQueriesData(e, t, n) {
                return S.notifyManager.batch(() => (0, f._)(this, r).findAll(e).map(e => {
                    let {
                        queryKey: a
                    } = e;
                    return [a, this.setQueryData(a, t, n)]
                }))
            }
            getQueryState(e) {
                var t;
                let n = this.defaultQueryOptions({
                    queryKey: e
                });
                return null == (t = (0, f._)(this, r).get(n.queryHash)) ? void 0 : t.state
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
                let n = (0, f._)(this, r);
                return S.notifyManager.batch(() => (n.findAll(e).forEach(e => {
                    e.reset()
                }), this.refetchQueries({
                    type: "active",
                    ...e
                }, t)))
            }
            cancelQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    n = {
                        revert: !0,
                        ...t
                    };
                return Promise.all(S.notifyManager.batch(() => (0, f._)(this, r).findAll(e).map(e => e.cancel(n)))).then(b.noop).catch(b.noop)
            }
            invalidateQueries(e) {
                let t = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {};
                return S.notifyManager.batch(() => {
                    var n, a;
                    return ((0, f._)(this, r).findAll(e).forEach(e => {
                        e.invalidate()
                    }), (null == e ? void 0 : e.refetchType) === "none") ? Promise.resolve() : this.refetchQueries({
                        ...e,
                        type: null != (n = null != (a = null == e ? void 0 : e.refetchType) ? a : null == e ? void 0 : e.type) ? n : "active"
                    }, t)
                })
            }
            refetchQueries(e) {
                var t;
                let n = arguments.length > 1 && void 0 !== arguments[1] ? arguments[1] : {},
                    a = {
                        ...n,
                        cancelRefetch: null == (t = n.cancelRefetch) || t
                    };
                return Promise.all(S.notifyManager.batch(() => (0, f._)(this, r).findAll(e).filter(e => !e.isDisabled() && !e.isStatic()).map(e => {
                    let t = e.fetch(void 0, a);
                    return a.throwOnError || (t = t.catch(b.noop)), "paused" === e.state.fetchStatus ? Promise.resolve() : t
                }))).then(b.noop)
            }
            fetchQuery(e) {
                let t = this.defaultQueryOptions(e);
                void 0 === t.retry && (t.retry = !1);
                let n = (0, f._)(this, r).build(this, t);
                return n.isStaleByTime((0, b.resolveStaleTime)(t.staleTime, n)) ? n.fetch(t) : Promise.resolve(n.state.data)
            }
            prefetchQuery(e) {
                return this.fetchQuery(e).then(b.noop).catch(b.noop)
            }
            fetchInfiniteQuery(e) {
                return e.behavior = (0, x.infiniteQueryBehavior)(e.pages), this.fetchQuery(e)
            }
            prefetchInfiniteQuery(e) {
                return this.fetchInfiniteQuery(e).then(b.noop).catch(b.noop)
            }
            ensureInfiniteQueryData(e) {
                return e.behavior = (0, x.infiniteQueryBehavior)(e.pages), this.ensureQueryData(e)
            }
            resumePausedMutations() {
                return _.onlineManager.isOnline() ? (0, f._)(this, s).resumePausedMutations() : Promise.resolve()
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
                    n = {};
                return t.forEach(t => {
                    (0, b.partialMatchKey)(e, t.queryKey) && Object.assign(n, t.defaultOptions)
                }), n
            }
            setMutationDefaults(e, t) {
                (0, f._)(this, u).set((0, b.hashKey)(e), {
                    mutationKey: e,
                    defaultOptions: t
                })
            }
            getMutationDefaults(e) {
                let t = [...(0, f._)(this, u).values()],
                    n = {};
                return t.forEach(t => {
                    (0, b.partialMatchKey)(e, t.mutationKey) && Object.assign(n, t.defaultOptions)
                }), n
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
                }), (0, m._)(this, u, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, c, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, d, {
                    writable: !0,
                    value: void 0
                }), (0, m._)(this, p, {
                    writable: !0,
                    value: void 0
                }), (0, h._)(this, r, e.queryCache || new E), (0, h._)(this, s, e.mutationCache || new T), (0, h._)(this, o, e.defaultOptions || {}), (0, h._)(this, l, new Map), (0, h._)(this, u, new Map), (0, h._)(this, c, 0)
            }
        });
    e.s(["QueryClient", 0, O], 387125)
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
}, 725924, e => {
    "use strict";
    let t, n;
    var a, i, r = e.i(416340);
    let s = "u" > typeof Intl,
        o = !s || void 0 === Intl.Locale,
        l = !s || void 0 === Intl.RelativeTimeFormat,
        u = !s || void 0 === Intl.PluralRules,
        c = !s || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (a = o || l || u || c || d, i = function() {
            return Promise.all([(o ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, u ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, c ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, n = a ? i().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, a] = (0, r.useState)(!n || t);
            return (0, r.useEffect)(() => {
                n && !e && n.then(() => a(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, p], 725924)
}, 823062, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(230644);
    let a = (0, t.createContext)(null),
        i = [],
        r = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        s = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);

    function o() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }
    let l = () => null;
    e.s(["UnifiedLoggerProvider", 0, e => {
        var o;
        let {
            children: l,
            unifiedLogger: u,
            pageLoggerConfig: c,
            path: d,
            url: p,
            isReady: f = !0
        } = e, m = null != (o = null == c ? void 0 : c.tags) ? o : i, h = null == c ? void 0 : c.rosId, g = (0, t.useMemo)(() => ({
            tags: m,
            rosId: h,
            path: d,
            url: p,
            isReady: f
        }), [m, h, d, p, f]), y = (0, t.useRef)(g), b = (0, t.useRef)(g);
        (0, t.useLayoutEffect)(() => {
            b.current = g, void 0 === y.current.path && void 0 !== g.path && (y.current = {
                ...y.current,
                path: g.path
            })
        }, [g]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a;
                if (e instanceof n.W && void 0 !== e.pageContext) return;
                let i = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && s.has(a)) ? y.current : b.current;
                void 0 !== i.path && (e.parameters = {
                    ...e.parameters,
                    path: i.path
                }), i.tags.forEach(t => e.addTag(t)), void 0 !== i.rosId && e.addTag("owner: ".concat(i.rosId))
            };
            return r.forEach(t => {
                u.events.on(t, e)
            }), () => {
                r.forEach(t => {
                    u.events.off(t, e)
                })
            }
        }, [u]);
        let w = (0, t.useMemo)(() => ({
            unifiedLogger: u,
            pageContext: g
        }), [u, g]);
        return t.default.createElement(a.Provider, {
            value: w
        }, l)
    }, "useOptionalUnifiedLoggerProvider", 0, function() {
        return (0, t.useContext)(a)
    }, "usePageSettled", 0, e => {
        let {
            unifiedLogger: n,
            pageContext: a
        } = o(), {
            path: i,
            url: r,
            isReady: s
        } = a, u = n.pageSettledTracker, c = (0, t.useSyncExternalStore)(u.subscribe, u.getSnapshot, l);
        (0, t.useEffect)(() => {
            if (!c || c.isNavigating || !s || !i || !r || !e || c.url.split(/[?#]/)[0] !== r.split(/[?#]/)[0]) return;
            let t = new URL(i, window.location.origin).pathname,
                a = requestAnimationFrame(() => {
                    a = requestAnimationFrame(() => {
                        n.logPageSettledEvent({
                            navigationId: c.id,
                            page: t,
                            outcome: e
                        })
                    })
                });
            return () => cancelAnimationFrame(a)
        }, [c, s, r, i, e, n])
    }, "useUnifiedLoggerProvider", 0, o])
}]);

//# debugId=f97a9aca-3bea-3c47-c09b-a2674695f553
//# sourceMappingURL=32lo9sh46u28l.js.map