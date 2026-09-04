;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2ba9621d-1cf2-6bd3-f1df-5faf02baa6d5")
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
            name: "enableUGCFolders",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
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
    e.s(["enableCreatorShowcases", 0, i, "enableTaxonomyBasedCreatorDashboard", 0, a, "enableUgcFolders", 0, n, "isAutoPublishPreferencesEnabled", 0, r])
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
        });
    e.s(["isAssetAccessRequestsEnabled", 0, a, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, n, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, o])
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
    e.s(["enableIpPlatformLicenseRecommendations", 0, a, "isAvatarItemLicensingEnabled", 0, l, "isExperiencePreviewEnabled", 0, n, "isIgnoreMatchEnabled", 0, o, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isInGameSalesLicensingEnabled", 0, c, "isIpLicensingEarningsEnabled", 0, i, "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled", 0, u, "isShowcaseExperiencesEnabled", 0, s])
}, 428993, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "isRevenueShareAgreementsEnabled",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "creator-business",
            name: "enableVirtualTransactionsTab",
            defaultValue: !0
        });
    e.s(["enableVirtualTransactionsTab", 0, a, "isRevenueShareAgreementsEnabled", 0, n])
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
        });
    e.s(["isBadgeDefaultIconEnabled", 0, n, "isMomentsFeedIdEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, a, "isMomentsUploadLanguageSelectEnabled", 0, s, "isTextDocumentEnabled", 0, r])
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
            name: "enablePlayerHostedEvents",
            defaultValue: !1
        }),
        i = (0, t.defineFlag)({
            namespace: "creator-gameops",
            name: "enablePlayerSupportCreatorTicketReroute",
            defaultValue: !1
        });
    e.s(["enablePlayerHostedEvents", 0, a, "enablePlayerSupport", 0, n, "enablePlayerSupportCreatorTicketReroute", 0, i])
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
    let n = (0, t.defineFlag)({
            namespace: "devex",
            name: "shouldUseWatermarkFiatCalculation",
            defaultValue: !1
        }),
        a = (0, t.defineFlag)({
            namespace: "devex",
            name: "isTaxDocumentationEnabled",
            defaultValue: !1
        });
    e.s(["isTaxDocumentationEnabled", 0, a, "shouldUseWatermarkFiatCalculation", 0, n])
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
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-discovery-serving",
        name: "isHomeAcquisitionSignalsEnabled",
        defaultValue: !0
    });
    e.s(["isHomeAcquisitionSignalsEnabled", 0, t])
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
        });
    e.s(["isAdsPageRedesignEnabled", 0, n, "isManagedRewardedTabEnabled", 0, a])
}, 82899, 494192, e => {
    "use strict";
    var t = e.i(157700);
    let n = (0, t.defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !0
    });
    e.s(["isLeaderboardConfigsEnabled", 0, n], 82899);
    let a = (0, t.defineFlag)({
        namespace: "preset-chat",
        name: "presetChatEnabled",
        defaultValue: !1
    });
    e.s(["presetChatEnabled", 0, a], 494192)
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
        });
    e.s(["isProductArchiveEnabled", 0, s, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, a, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, n, "mockShopItemsExternalEligibility", 0, o])
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
        s = e.i(486736);
    let o = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
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
        }, u = async () => await c("".concat(o, "/v1/upsell-feature-access?nameSpace=").concat(l, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", d = "CreatorHub.AgeVerificationBannerSettings", p = async () => {
            localStorage.removeItem(d)
        }, f = async () => {
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
        }, m = async () => {
            localStorage.setItem(d, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, g = (0, n.createContext)({
            isBannerVisible: !1,
            isBannerEligible: !1,
            isHighPriority: !1,
            dismissBanner: () => Promise.reject(Error("dismissBanner not implemented")),
            variant: "ageVerification"
        }), v = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, h = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: o
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: l,
                ageVerificationUpsellBannerEndDate: c,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, s.useSettings)(), [d, p] = (0, n.useState)(!0), [y, b] = (0, n.useState)("doNotShow"), {
            isFetched: C,
            user: S
        } = (0, a.useRobloxAuthentication)(), {
            unifiedLogger: I
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: w,
            isEnabled: E
        } = (0, n.useMemo)(() => {
            let e = v(l),
                t = v(c),
                n = v(u),
                a = new Date;
            return {
                isHighPriority: n <= a,
                isEnabled: e <= a && a < t
            }
        }, [c, l, u]), A = (0, n.useCallback)(async () => {
            await m(), p(!0)
        }, [p]);
        (0, n.useEffect)(() => {
            E && C && (null == S ? void 0 : S.id) && (async () => {
                let e = !1;
                try {
                    e = await f()
                } catch (e) {
                    I.logErrorEvent({
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
                    t = await h()
                } catch (e) {
                    I.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                b(t)
            })().catch(e => {
                I.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [E, C, S, I]);
        let P = (0, n.useMemo)(() => {
            let e = E && "doNotShow" !== y;
            return {
                isBannerVisible: e && !d,
                isBannerEligible: e,
                isHighPriority: w,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: A
            }
        }, [E, y, d, w, A]);
        return (0, t.jsx)(g.Provider, {
            value: P,
            children: o
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, n.useContext)(g)], 906791)
}, 968439, e => {
    "use strict";
    var t, n = e.i(721281),
        a = e.i(703440),
        i = e.i(272593),
        r = ((t = {}).PrivacyPolicyUri = "privacyPolicyUri", t.TermsOfServiceUri = "termsOfServiceUri", t.Summary = "summary", t.Name = "name", t);
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
}, 998683, e => {
    "use strict";
    var t = e.i(721281),
        n = e.i(502585),
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
    var t = e.i(581548),
        n = e.i(272593),
        a = e.i(127403);
    let i = (0, n.createClientConfiguration)("orgs", "bedev2", {
            middleware: [new a.default]
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
            getUsersWithRole: async (e, t, n, a, i) => o.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: n,
                maxPageSize: a,
                isDefault: i
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
            getUsersByOrganization: async (e, t, n) => l.v1OrganizationsOrganizationIdUsersGet({
                organizationId: e,
                pageToken: t,
                maxPageSize: n
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
                    raw: n
                } = await l.v1OrganizationsOrganizationIdUsersUserIdPermissionsGetRaw({
                    organizationId: e,
                    userId: t
                });
                return await n.json()
            },
            getUserRoles: async (e, t, n, a) => l.v1OrganizationsOrganizationIdUsersUserIdRolesGet({
                organizationId: e,
                userId: t,
                pageToken: n,
                maxPageSize: a
            }),
            addUserToOrganization: async (e, t) => l.v1OrganizationsOrganizationIdUsersUserIdPost({
                organizationId: e,
                userId: t
            }),
            addUserToRole: async (e, t, n) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdPost({
                organizationId: e,
                userId: t,
                roleId: n
            }),
            removeUserFromRole: async (e, t, n) => l.v1OrganizationsOrganizationIdUsersUserIdRolesRoleIdDelete({
                organizationId: e,
                userId: t,
                roleId: n
            })
        },
        groupUniversePayoutClient: {
            getUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdGet(e),
            updateUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniverseIdPatch(e),
            findUniversePayouts: async e => c.v1OrganizationsOrganizationIdPayoutsUniversesGet(e),
            getLatestOneTimePayoutForUsers: async (e, t) => {
                let n = {
                    organizationId: e,
                    userIds: t.map(String)
                };
                return c.v1OrganizationsOrganizationIdPayoutsLatestGet(n)
            },
            getSuggestedPayouts: async e => c.v1OrganizationsOrganizationIdPayoutsSuggestedGet({
                organizationId: e
            })
        }
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
    "function" == typeof SuppressedError && SuppressedError;
    var o = {
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

    function f(e, t) {
        return null == e ? e : {
            results: (0, n.exists)(e, "results") ? null === e.results ? null : e.results.map(p) : void 0
        }
    }
    var m = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.acceptanceDeleteRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
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
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        results: (0, n.exists)(e, "results") ? null === e.results ? null : e.results.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceGetByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsert = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(n) {
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
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return f(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
        g = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.agreementResolutionGetByContextRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var a, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new n.JSONApiResponse(r, function(e) {
                                    return e.map(c)
                                })]
                        }
                    })
                })
            }, t.prototype.agreementResolutionGetByContext = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(n) {
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
    e.s(["AcceptanceApi", 0, m, "AgreementResolutionApi", 0, g, "AgreementType", 0, {
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
    }, "RegulationType", 0, o], 47033);
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
            })).filter(e => e.regulationType !== o.Luobu)
        }
        getUserAgreements(e) {
            return this.agreementResolutionApi.agreementResolutionGetByContext(e)
        }
        constructor() {
            (0, t._)(this, "agreementResolutionApi", void 0), (0, t._)(this, "acceptanceApi", void 0);
            const e = (0, v.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new g(e), this.acceptanceApi = new m(e)
        }
    };
    e.s(["userAgreementsClient", 0, h], 196990)
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
        } = (0, a.useAuthentication)(), [u, d] = (0, n.useState)([]), [p, f] = (0, n.useState)(!1), [m, g] = (0, n.useState)(!0), [v, h] = (0, n.useState)(!1), y = (0, n.useCallback)(async () => {
            if (!p && (null == s ? void 0 : s.id) != null) try {
                h(!1), g(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(s.id.toString()),
                    t = (e => {
                        o(e);
                        for (let t = 0; t < e.length; t += 1) l(e[t].notificationCategoryName || "", e[t].notifications || []);
                        return e
                    })(e.categories || []);
                d(t), f(!0)
            } catch (e) {
                h(!0), f(!1)
            } finally {
                g(!1)
            }
        }, [null == s ? void 0 : s.id, p]), b = (0, n.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: v,
            notificationSettingsContextLoading: m,
            getNotificationSettings: y,
            setNotificationSettings: d
        }), [u, v, y, m, p]);
        return (0, t.jsx)(c.Provider, {
            value: b,
            children: r
        })
    }], 354088)
}, 384340, 672401, e => {
    "use strict";
    var t = e.i(416340);
    let n = (0, t.createContext)({
        isOrganizationRefreshRequired: !1,
        organization: void 0,
        permissions: void 0,
        refreshOrganization: () => ({}),
        refreshPermission: () => Promise.resolve(),
        isOrganizationLoading: !1
    });
    n.displayName = "Organization", e.s(["default", 0, n], 672401), e.s(["default", 0, function() {
        return (0, t.useContext)(n)
    }], 384340)
}, 911502, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(237401),
        i = e.i(79187),
        r = e.i(814975),
        s = e.i(607204),
        o = e.i(581548),
        l = e.i(881670),
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(872204),
        p = e.i(291037),
        f = e.i(35298),
        m = e.i(777004),
        g = e.i(169722),
        v = e.i(199834),
        h = e.i(706442),
        y = e.i(196945),
        b = e.i(156071),
        C = e.i(790806),
        S = e.i(759283),
        I = e.i(384340);
    let w = (0, h.makeStyles)()(() => ({
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
        E = (0, i.withTranslation)(e => {
            let {
                open: a,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, I.default)(), {
                classes: {
                    dialogTitle: h,
                    dialogContent: E,
                    dialogSubActions: A
                }
            } = w(), {
                enqueue: P,
                close: x
            } = (0, y.useSnackbar)(), O = (0, n.useCallback)(e => {
                P({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: S.toastDurationTime,
                    autoHide: !0,
                    onClose: x
                })
            }, [P, x]), [R, T] = (0, n.useState)(), [U, N] = (0, n.useState)(), [k, L] = (0, n.useState)(), [z, D] = (0, n.useState)(), F = (0, n.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    L(e.name), D(!1)
                } catch (e) {
                    D(!0)
                }
            }, [l]), M = (0, n.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await b.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    T(null == e ? void 0 : e.name)
                } catch (e) {
                    O(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, O, c]);
            (0, n.useEffect)(() => {
                F(), M()
            }, [M, F]);
            let G = (0, n.useCallback)(() => {
                    r(void 0)
                }, [r]),
                V = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        N(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            O(c("Error.DecliningInvitation")), N(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, O, c]),
                j = (0, n.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        N(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            O(c("Error.AcceptingInvitation")), N(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, O, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                children: [(0, t.jsx)(m.DialogContent, {
                    className: E,
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
                                    organizationName: null != R ? R : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(g.Grid, {
                            container: !0,
                            children: (0, t.jsx)(v.Typography, {
                                variant: "body1",
                                children: z ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != k ? k : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(f.DialogActions, {
                    children: (0, t.jsxs)(g.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: G,
                            disabled: U,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(g.Grid, {
                            className: A,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: V,
                                disabled: U,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: j,
                                loading: U,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        A = (0, h.makeStyles)()(() => ({
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
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: h
                }
            } = A(), [y, b] = (0, n.useState)(), [S, I] = (0, n.useState)(), w = (0, n.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(s.senderUserId, 10));
                    b(e.name), I(!1)
                } catch (e) {
                    I(!0)
                }
            }, [s]);
            (0, n.useEffect)(() => {
                w()
            }, [w]);
            let E = (0, n.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: a,
                onClose: r,
                children: [(0, t.jsx)(m.DialogContent, {
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
                                children: S ? l("Message.InvitationAcceptedWithoutUsername") : l("Message.InvitationAccepted", {
                                    username: null != y ? y : ""
                                })
                            }) : (0, t.jsx)(t.Fragment, {
                                children: S ? l("Message.InvitationDeclinedWithoutUsername") : l("Message.InvitationDeclined", {
                                    username: null != y ? y : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(f.DialogActions, {
                    className: h,
                    children: (0, t.jsx)(g.Grid, {
                        container: !0,
                        justifyContent: "flex-end",
                        children: (0, t.jsx)(d.Button, {
                            variant: "contained",
                            color: "primaryBrand",
                            size: "small",
                            onClick: E,
                            children: l("Action.Close")
                        })
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]);
    var x = e.i(582977),
        O = e.i(672401);
    let R = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, a.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: f
        } = (0, c.default)(), [m, g] = (0, n.useState)(), [v, h] = (0, n.useState)(), [y, b] = (0, n.useState)(), [C, S] = (0, n.useState)(!1), [I, w] = (0, n.useState)(!1), [A, R] = (0, n.useState)(), [T, U] = (0, n.useState)(!1), N = null == d ? void 0 : d.id, k = (0, n.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : f
        }, [p, f]), L = l.query[x.InviteQueryKey], z = l.isReady, D = (0, n.useCallback)(() => {
            a.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), F = (0, n.useCallback)(async e => {
            if (!N) return void b(null);
            try {
                let t = await s.default.userClient.getUserInvitationByOrganization(e, N.toString());
                b(t)
            } catch (e) {
                b(null), D()
            }
        }, [N, D]), M = (0, n.useCallback)(async e => {
            if (!N) return void h(null);
            try {
                let t = await s.default.userClient.getUserPermissions(e, N.toString());
                h(t)
            } catch (e) {
                h(null)
            }
        }, [N]), G = (0, n.useCallback)(async () => {
            if (z) {
                w(!0);
                try {
                    if ("string" == typeof L) return void await F(L);
                    if (!k) return void g(null);
                    if (b(null), k) {
                        let e = await s.default.organizationClient.getOrganization(k.toString());
                        g(e), await M(e.id)
                    } else g(void 0);
                    S(!1)
                } catch (e) {
                    g(null), h(null), b(null)
                } finally {
                    w(!1)
                }
            }
        }, [k, F, M, L, z]), V = (0, n.useCallback)(() => {
            S(!0), G()
        }, [G]), j = (0, n.useCallback)(async () => {
            (null == m ? void 0 : m.id) && await M(null == m ? void 0 : m.id)
        }, [M, null == m ? void 0 : m.id]), B = (0, n.useMemo)(() => ({
            organization: m,
            permissions: v,
            refreshOrganization: V,
            refreshPermission: j,
            isOrganizationRefreshRequired: C,
            isOrganizationLoading: I
        }), [m, v, V, j, C, I]);
        return (0, n.useEffect)(() => {
            G()
        }, [G]), (0, t.jsx)(O.default.Provider, {
            value: B,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(E, {
                        open: y.invitationStatusType === o.InvitationStatusType.Open && void 0 === A,
                        onClose: e => {
                            !0 === e ? (R(!0), U(!0)) : !1 === e ? (R(!1), U(!0)) : (D(), b(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(P, {
                        open: T,
                        onClose: () => {
                            U(!1), !0 === A && V(), D()
                        },
                        invitation: y,
                        accepted: !0 === A
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, R], 911502)
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
}, 745873, e => {
    "use strict";
    var t = e.i(221628),
        n = e.i(416340),
        a = e.i(458451),
        i = e.i(533414),
        r = e.i(157310),
        s = e.i(279149),
        o = e.i(602635),
        l = e.i(814975);
    let c = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        u = new s.GroupsApi(c),
        d = function() {
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
                    }, u.groupsListGroups(e)
                }
            })
        },
        p = (0, n.createContext)(null);
    e.s(["GroupsProvider", 0, e => {
        let {
            children: r
        } = e, {
            user: s
        } = (0, a.useRobloxAuthentication)(), {
            data: o,
            isLoading: l,
            refetch: c
        } = d(), [u, f] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == s ? void 0 : s.id), null), [m, g] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == s ? void 0 : s.id), null), [v, h] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == s ? void 0 : s.id), {}), y = (0, n.useCallback)(e => {
            g(e);
            let t = null === e ? "user" : e;
            h(e => {
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
        }, [g, h]), b = (0, n.useMemo)(() => {
            if (null == o ? void 0 : o.groups) return null == o ? void 0 : o.groups;
            if (null === u) return [];
            try {
                return "string" == typeof u ? JSON.parse(u) : u
            } catch (e) {
                return []
            }
        }, [u, null == o ? void 0 : o.groups]), C = (0, n.useMemo)(() => {
            var e;
            return m && null != (e = b.find(e => {
                let {
                    id: t
                } = e;
                return t === m
            })) ? e : null
        }, [m, b]);
        (0, n.useEffect)(() => {
            (null == s ? void 0 : s.id) && (null == o ? void 0 : o.groups) && !l && f(null == o ? void 0 : o.groups)
        }, [null == o ? void 0 : o.groups, b, l, f, null == s ? void 0 : s.id]);
        let S = (0, n.useMemo)(() => ({
            groups: b,
            currentGroup: C,
            groupData: v,
            isFetched: !l && !!(null == s ? void 0 : s.id),
            refreshGroups: c,
            setCurrentGroup: y
        }), [C, v, b, l, c, y, null == s ? void 0 : s.id]);
        return (0, t.jsx)(p.Provider, {
            value: S,
            children: r
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
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(78892),
        a = e.i(723570),
        i = e => {
            var i, s, o;
            let l, c, {
                    present: u,
                    children: d
                } = e,
                p = function(e) {
                    var n, i;
                    let [s, o] = t.useState(), l = t.useRef(null), c = t.useRef(e), u = t.useRef("none"), [d, p] = (n = e ? "mounted" : "unmounted", i = {
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
                        let n = i[e][t];
                        return null != n ? n : e
                    }, n));
                    return t.useEffect(() => {
                        let e = r(l.current);
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), (0, a.useLayoutEffect)(() => {
                        let t = l.current,
                            n = c.current;
                        if (n !== e) {
                            let a = u.current,
                                i = r(t);
                            e ? p("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? p("UNMOUNT") : n && a !== i ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = e
                        }
                    }, [e, p]), (0, a.useLayoutEffect)(() => {
                        if (s) {
                            var e;
                            let t, n = null != (e = s.ownerDocument.defaultView) ? e : window,
                                a = e => {
                                    let a = r(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === s && a && (p("ANIMATION_END"), !c.current)) {
                                        let e = s.style.animationFillMode;
                                        s.style.animationFillMode = "forwards", t = n.setTimeout(() => {
                                            "forwards" === s.style.animationFillMode && (s.style.animationFillMode = e)
                                        })
                                    }
                                },
                                i = e => {
                                    e.target === s && (u.current = r(l.current))
                                };
                            return s.addEventListener("animationstart", i), s.addEventListener("animationcancel", a), s.addEventListener("animationend", a), () => {
                                n.clearTimeout(t), s.removeEventListener("animationstart", i), s.removeEventListener("animationcancel", a), s.removeEventListener("animationend", a)
                            }
                        }
                        p("ANIMATION_END")
                    }, [s, p]), {
                        isPresent: ["mounted", "unmountSuspended"].includes(d),
                        ref: t.useCallback(e => {
                            l.current = e ? getComputedStyle(e) : null, o(e)
                        }, [])
                    }
                }(u),
                f = "function" == typeof d ? d({
                    present: p.isPresent
                }) : t.Children.only(d),
                m = (0, n.useComposedRefs)(p.ref, (c = (l = null == (s = Object.getOwnPropertyDescriptor((i = f).props, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (o = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref);
            return "function" == typeof d || p.isPresent ? t.cloneElement(f, {
                ref: m
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    i.displayName = "Presence", e.s(["Presence", 0, i])
}, 919448, e => {
    "use strict";
    var t = e.i(472536),
        n = e.i(579325),
        a = e.i(197649),
        i = e.i(416340),
        r = e.i(78892),
        s = e.i(608652),
        o = e.i(174617),
        l = e.i(199786),
        c = e.i(300792),
        u = e.i(692166),
        d = e.i(169525),
        p = e.i(600317),
        f = e.i(221628),
        m = "Checkbox",
        [g, v] = (0, s.createContextScope)(m),
        [h, y] = g(m);

    function b(e) {
        let {
            __scopeCheckbox: t,
            checked: n,
            children: a,
            defaultChecked: r,
            disabled: s,
            form: o,
            name: c,
            onCheckedChange: u,
            required: d,
            value: p = "on",
            internal_do_not_use_render: g
        } = e, [v, y] = (0, l.useControllableState)({
            prop: n,
            defaultProp: null != r && r,
            onChange: u,
            caller: m
        }), [b, C] = i.useState(null), [S, I] = i.useState(null), w = i.useRef(!1), E = !b || !!o || !!b.closest("form"), A = {
            checked: v,
            disabled: s,
            setChecked: y,
            control: b,
            setControl: C,
            name: c,
            form: o,
            value: p,
            hasConsumerStoppedPropagationRef: w,
            required: d,
            defaultChecked: !x(r) && r,
            isFormControl: E,
            bubbleInput: S,
            setBubbleInput: I
        };
        return (0, f.jsx)(h, {
            scope: t,
            ...A,
            children: "function" == typeof g ? g(A) : a
        })
    }
    var C = "CheckboxTrigger",
        S = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: n,
                onKeyDown: a,
                onClick: s,
                ...l
            } = e, {
                control: c,
                value: u,
                disabled: d,
                checked: m,
                required: g,
                setControl: v,
                setChecked: h,
                hasConsumerStoppedPropagationRef: b,
                isFormControl: S,
                bubbleInput: I
            } = y(C, n), w = (0, r.useComposedRefs)(t, v), E = i.useRef(m);
            return i.useEffect(() => {
                let e = null == c ? void 0 : c.form;
                if (e) {
                    let t = () => h(E.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [c, h]), (0, f.jsx)(p.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": x(m) ? "mixed" : m,
                "aria-required": g,
                "data-state": O(m),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: u,
                ...l,
                ref: w,
                onKeyDown: (0, o.composeEventHandlers)(a, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, o.composeEventHandlers)(s, e => {
                    h(e => !!x(e) || !e), I && S && (b.current = e.isPropagationStopped(), b.current || e.stopPropagation())
                })
            })
        });
    S.displayName = C;
    var I = i.forwardRef((e, t) => {
        let {
            __scopeCheckbox: n,
            name: a,
            checked: i,
            defaultChecked: r,
            required: s,
            disabled: o,
            value: l,
            onCheckedChange: c,
            form: u,
            ...d
        } = e;
        return (0, f.jsx)(b, {
            __scopeCheckbox: n,
            checked: i,
            defaultChecked: r,
            disabled: o,
            required: s,
            onCheckedChange: c,
            name: a,
            form: u,
            value: l,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: a
                } = e;
                return (0, f.jsxs)(f.Fragment, {
                    children: [(0, f.jsx)(S, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: n
                    }), a && (0, f.jsx)(P, {
                        __scopeCheckbox: n
                    })]
                })
            }
        })
    });
    I.displayName = m;
    var w = "CheckboxIndicator",
        E = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: n,
                forceMount: a,
                ...i
            } = e, r = y(w, n);
            return (0, f.jsx)(d.Presence, {
                present: a || x(r.checked) || !0 === r.checked,
                children: (0, f.jsx)(p.Primitive.span, {
                    "data-state": O(r.checked),
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
    E.displayName = w;
    var A = "CheckboxBubbleInput",
        P = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: n,
                ...a
            } = e, {
                control: s,
                hasConsumerStoppedPropagationRef: o,
                checked: l,
                defaultChecked: d,
                required: m,
                disabled: g,
                name: v,
                value: h,
                form: b,
                bubbleInput: C,
                setBubbleInput: S
            } = y(A, n), I = (0, r.useComposedRefs)(t, S), w = (0, c.usePrevious)(l), E = (0, u.useSize)(s);
            i.useEffect(() => {
                if (!C) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !o.current;
                if (w !== l && e) {
                    let n = new Event("click", {
                        bubbles: t
                    });
                    C.indeterminate = x(l), e.call(C, !x(l) && l), C.dispatchEvent(n)
                }
            }, [C, w, l, o]);
            let P = i.useRef(!x(l) && l);
            return (0, f.jsx)(p.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != d ? d : P.current,
                required: m,
                disabled: g,
                name: v,
                value: h,
                form: b,
                ...a,
                tabIndex: -1,
                ref: I,
                style: {
                    ...a.style,
                    ...E,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function x(e) {
        return "indeterminate" === e
    }

    function O(e) {
        return x(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    P.displayName = A;
    let R = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        T = {
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
            className: s,
            isChecked: o,
            isDisabled: l,
            size: c,
            hint: u,
            placement: d,
            onCheckedChange: p,
            id: f,
            ...m
        } = e, g = (0, n.default)(), v = f || g, h = r && i.default.createElement("label", {
            htmlFor: v,
            className: (0, a.default)("flex flex-col grow-1 gap-xsmall", !l && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, a.default)(U[c], N[c], "content-emphasis")
        }, r), u && i.default.createElement("span", {
            className: "text-body-medium content-default"
        }, u));
        return i.default.createElement("div", {
            className: (0, a.default)("foundation-web-checkbox flex gap-medium", l && "opacity-[0.5]", !l && "cursor-pointer", s)
        }, "End" === d && h, i.default.createElement("div", {
            className: (0, a.default)(T[c])
        }, i.default.createElement(I, {
            "data-slot": "checkbox",
            className: (0, a.default)(R[c], t.interactable, !l && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: o,
            disabled: l,
            onCheckedChange: p,
            "aria-label": r,
            ...m
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(E, {
            "data-slot": "checkbox-indicator",
            className: (0, a.default)(R[c], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === d && h)
    }], 919448)
}, 262695, e => {
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
            } = e, f = "Determinate" === s, m = Math.min(100, Math.max(0, o)), g = f && void 0 !== l && "None" !== u, v = f && void 0 !== c && "None" !== u, h = "Sides" === u, y = n.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", h ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: h ? {
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
            })), b = g && n.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", a),
                "aria-hidden": "true"
            }, l), C = v && n.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", a),
                "aria-hidden": "true"
            }, c), S = (g || v) && n.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, g ? b : n.default.createElement("span", null), v ? C : n.default.createElement("span", null));
            return n.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": f ? 0 : void 0,
                "aria-valuemax": f ? 100 : void 0,
                "aria-valuenow": f ? m : void 0,
                ...p
            }, h ? n.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, b, y, C) : n.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === u && S, y, "Bottom" === u && S))
        });
    i.displayName = "ProgressBar", e.s(["ProgressBar", 0, i])
}, 908578, e => {
    "use strict";
    var t = e.i(273589),
        n = e.i(962560),
        a = e.i(416340),
        i = e.i(42569),
        r = e.i(696180),
        s = e.i(221628),
        o = e.i(972455),
        l = e.i(963320);

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
        p = a.forwardRef(function(e, a) {
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
                    } = e, a = (0, i.a)({
                        root: ["root"]
                    }, c, t);
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
}, 591598, e => {
    "use strict";
    var t = e.i(865800),
        n = e.i(416340),
        a = e.i(430686);
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
            c = l[0],
            u = l[1],
            d = (0, n.useState)(!1),
            p = d[0],
            f = d[1],
            m = (0, n.useCallback)(function() {
                f(!0)
            }, [f]),
            g = (0, n.useCallback)(function() {
                f(!1)
            }, [f]),
            v = (0, n.useCallback)(function(e, t) {
                void 0 === t && (t = {}), u({
                    props: t,
                    children: e
                })
            }, [u]),
            h = (0, n.useMemo)(function() {
                return {
                    ref: o,
                    open: m,
                    close: g,
                    configure: v
                }
            }, [g, v, m]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(i.Provider, {
            value: h
        }, r), n.default.createElement(a.default, (0, t._)({}, c.props, s, {
            "aria-labelledby": c.props.id,
            "aria-describedby": "dialog-content-text-describe-id",
            open: p,
            onClose: g,
            ref: o
        }), c.children))
    }, "useDialog", 0, function() {
        var e = (0, n.useContext)(i);
        return {
            ref: e.ref,
            open: e.open,
            close: e.close,
            configure: e.configure
        }
    }])
}, 649319, e => {
    "use strict";
    var t = e.i(416340),
        n = e.i(682671),
        a = e.i(341782),
        i = e.i(711489),
        r = e.i(891123),
        s = e.i(908578);
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
            g = e.onCancel,
            v = e.onConfirm;
        return t.default.createElement("div", null, t.default.createElement(n.default, {
            id: o
        }, l), t.default.createElement(a.default, null, t.default.createElement(s.D, {
            id: "dialog-content-text-describe-id"
        }, p)), t.default.createElement(i.default, null, t.default.createElement(r.default, {
            size: "large",
            variant: "outlined",
            "aria-label": m,
            color: "secondary",
            onClick: g,
            disabled: d
        }, m), t.default.createElement(r.default, {
            size: "large",
            variant: "contained",
            loading: d,
            "aria-label": f,
            color: void 0 === c ? "primaryBrand" : c,
            onClick: v
        }, f)))
    }], 649319)
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        n = e.i(416340),
        a = e.i(323356);
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
        var r, s, o, l, c = e.children,
            u = (0, t.a)(e, ["children"]),
            d = (0, n.useRef)(null),
            p = (0, n.useState)(!1),
            f = p[0],
            m = p[1],
            g = (0, n.useState)([]),
            v = g[0],
            h = g[1],
            y = (0, n.useCallback)(function(e, n) {
                void 0 === e && (e = {}), void 0 === n && (n = function() {
                    return !0
                }), h(function(a) {
                    return (0, t.b)((0, t.b)([], a, !0), [{
                        props: e,
                        shouldClose: n
                    }], !1)
                })
            }, [h]),
            b = (0, n.useCallback)(function() {
                m(!1)
            }, [m]);
        (0, n.useEffect)(function() {
            v.length > 0 && m(!0)
        }, [v.length]);
        var C = (0, n.useMemo)(function() {
            return {
                ref: d,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return n.default.createElement(n.default.Fragment, null, n.default.createElement(i.Provider, {
            value: C
        }, c), n.default.createElement(a.S, (0, t._)({}, (null == (r = v[0]) ? void 0 : r.props) || {}, u, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (o = null == (s = v[0]) ? void 0 : s.props) ? void 0 : o.TransitionProps) || {}), {
                onExited: function(e) {
                    var n, a, i, r;
                    h(function(e) {
                        var n = e.slice(1);
                        return (0, t.b)([], n, !0)
                    }), (null == (a = null == (n = v[0]) ? void 0 : n.props.TransitionProps) ? void 0 : a.onExited) && (null == (r = null == (i = v[0]) ? void 0 : i.props.TransitionProps) || r.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var n, a, i;
                (null == (n = v[0]) ? void 0 : n.shouldClose(t)) && m(!1), (null == (a = v[0]) ? void 0 : a.props.onClose) && (null == (i = v[0]) || i.props.onClose(e, t))
            },
            open: f
        }), null == (l = v[0]) ? void 0 : l.props.children))
    }, "useSnackbar", 0, function() {
        var e = (0, n.useContext)(i);
        return {
            ref: e.ref,
            enqueue: e.enqueue,
            close: e.close
        }
    }])
}, 766324, e => {
    "use strict";
    var t = e.i(196945);
    e.s(["SnackbarProvider", () => t.default])
}, 82511, 52605, e => {
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
    }], 52605);
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
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 82511)
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
}, 550742, e => {
    "use strict";
    let t, n;
    var a, i, r = e.i(416340);
    let s = "u" > typeof Intl,
        o = !s || void 0 === Intl.Locale,
        l = !s || void 0 === Intl.RelativeTimeFormat,
        c = !s || void 0 === Intl.PluralRules,
        u = !s || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (a = o || l || c || u || d, i = function() {
            return Promise.all([(o ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
                return e.p
            }).then(() => e.A(874521)) : null, c ? e.A(684498).then(function(e) {
                return e.p
            }).then(() => e.A(104943)) : null, u ? e.A(951862).then(() => e.A(890267)) : null])), d ? e.A(956827) : null])
        }, t = !1, n = a ? i().catch(() => {}).then(() => {
            t = !0
        }) : null, function() {
            let [e, a] = (0, r.useState)(!n || t);
            return (0, r.useEffect)(() => {
                n && !e && n.then(() => a(!0))
            }, [e]), e
        });
    e.s(["usePolyfills", 0, p], 550742)
}, 823062, e => {
    "use strict";
    var t = e.i(416340);
    let n = (0, t.createContext)(null),
        a = [],
        i = ["pageload", "click", "impression", "hover", "webvitals", "apivitals", "formvitals", "error", "session"],
        r = new Set(["TTFB", "FCP", "LCP", "FID", "CLS", "INP"]);
    e.s(["UnifiedLoggerProvider", 0, e => {
        var s;
        let {
            children: o,
            unifiedLogger: l,
            pageLoggerConfig: c,
            path: u
        } = e, d = null != (s = null == c ? void 0 : c.tags) ? s : a, p = null == c ? void 0 : c.rosId, f = (0, t.useMemo)(() => ({
            tags: d,
            rosId: p,
            path: u
        }), [d, p, u]), m = (0, t.useRef)(f), g = (0, t.useRef)(f);
        (0, t.useLayoutEffect)(() => {
            g.current = f, void 0 === m.current.path && void 0 !== f.path && (m.current = {
                ...m.current,
                path: f.path
            })
        }, [f]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let n, a = (n = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== n && r.has(n)) ? m.current : g.current;
                void 0 !== a.path && (e.parameters = {
                    ...e.parameters,
                    path: a.path
                }), a.tags.forEach(t => e.addTag(t)), void 0 !== a.rosId && e.addTag("owner: ".concat(a.rosId))
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
            pageContext: f
        }), [l, f]);
        return t.default.createElement(n.Provider, {
            value: v
        }, o)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(n);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=2ba9621d-1cf2-6bd3-f1df-5faf02baa6d5
//# sourceMappingURL=10si5r2em2d7u.js.map