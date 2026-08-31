;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "caf5e9bb-fd58-92cc-e0c8-79d324e44902")
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
        }),
        o = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "enableGetItemCollectibleDetails",
            defaultValue: !1
        });
    e.s(["enableCreatorShowcases", 0, i, "enableGetItemCollectibleDetails", 0, o, "enableTaxonomyBasedCreatorDashboard", 0, n, "enableUgcFolders", 0, a, "isAutoPublishPreferencesEnabled", 0, r])
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
        });
    e.s(["enablePlayerHostedEvents", 0, n, "enablePlayerSupport", 0, a, "enablePlayerSupportCreatorTicketReroute", 0, i])
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
    let t = (0, e.i(157700).defineFlag)({
        namespace: "game-discovery-serving",
        name: "isHomeAcquisitionSignalsEnabled",
        defaultValue: !0
    });
    e.s(["isHomeAcquisitionSignalsEnabled", 0, t])
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
        });
    e.s(["isAdsPageRedesignEnabled", 0, a, "isManagedRewardedTabEnabled", 0, n])
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
        });
    e.s(["isProductArchiveEnabled", 0, o, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, n, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, a, "mockShopItemsExternalEligibility", 0, s])
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
        }), v = e => {
            let t = new Date(e);
            return new Date(t.getUTCFullYear(), t.getUTCMonth(), t.getUTCDate())
        }, h = async () => await u() ? "ageVerification" : "doNotShow";
    e.s(["AgeVerificationUpsellProvider", 0, e => {
        let {
            children: s
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: l,
                ageVerificationUpsellBannerEndDate: c,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, o.useSettings)(), [d, p] = (0, a.useState)(!0), [y, b] = (0, a.useState)("doNotShow"), {
            isFetched: C,
            user: S
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: w
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: E,
            isEnabled: I
        } = (0, a.useMemo)(() => {
            let e = v(l),
                t = v(c),
                a = v(u),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, [c, l, u]), x = (0, a.useCallback)(async () => {
            await f(), p(!0)
        }, [p]);
        (0, a.useEffect)(() => {
            I && C && (null == S ? void 0 : S.id) && (async () => {
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
                p(e);
                let t = "doNotShow";
                try {
                    t = await h()
                } catch (e) {
                    w.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                b(t)
            })().catch(e => {
                w.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [I, C, S, w]);
        let A = (0, a.useMemo)(() => {
            let e = I && "doNotShow" !== y;
            return {
                isBannerVisible: e && !d,
                isBannerEligible: e,
                isHighPriority: E,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: x
            }
        }, [I, y, d, E, x]);
        return (0, t.jsx)(g.Provider, {
            value: A,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(g)], 906791)
}, 968439, e => {
    "use strict";
    var t, a = e.i(721281),
        n = e.i(703440),
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
    }, "RegulationType", 0, s], 47033);
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
            this.agreementResolutionApi = new g(e), this.acceptanceApi = new f(e)
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
        } = (0, n.useAuthentication)(), [u, d] = (0, a.useState)([]), [p, m] = (0, a.useState)(!1), [f, g] = (0, a.useState)(!0), [v, h] = (0, a.useState)(!1), y = (0, a.useCallback)(async () => {
            if (!p && (null == o ? void 0 : o.id) != null) try {
                h(!1), g(!0);
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
                g(!1)
            }
        }, [null == o ? void 0 : o.id, p]), b = (0, a.useMemo)(() => ({
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
        s = e.i(581548),
        l = e.i(881670),
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(872204),
        p = e.i(291037),
        m = e.i(35298),
        f = e.i(777004),
        g = e.i(169722),
        v = e.i(199834),
        h = e.i(706442),
        y = e.i(196945),
        b = e.i(156071),
        C = e.i(790806),
        S = e.i(759283),
        w = e.i(384340);
    let E = (0, h.makeStyles)()(() => ({
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
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, w.default)(), {
                classes: {
                    dialogTitle: h,
                    dialogContent: I,
                    dialogSubActions: x
                }
            } = E(), {
                enqueue: A,
                close: P
            } = (0, y.useSnackbar)(), R = (0, a.useCallback)(e => {
                A({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: S.toastDurationTime,
                    autoHide: !0,
                    onClose: P
                })
            }, [A, P]), [O, T] = (0, a.useState)(), [N, U] = (0, a.useState)(), [k, L] = (0, a.useState)(), [z, F] = (0, a.useState)(), D = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    L(e.name), F(!1)
                } catch (e) {
                    F(!0)
                }
            }, [l]), M = (0, a.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await b.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    T(null == e ? void 0 : e.name)
                } catch (e) {
                    R(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, R, c]);
            (0, a.useEffect)(() => {
                D(), M()
            }, [M, D]);
            let j = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                G = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        U(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            R(c("Error.DecliningInvitation")), U(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]),
                V = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        U(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            R(c("Error.AcceptingInvitation")), U(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(f.DialogContent, {
                    className: I,
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
                                    organizationName: null != O ? O : c("Label.Group")
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
                }), (0, t.jsx)(m.DialogActions, {
                    children: (0, t.jsxs)(g.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: j,
                            disabled: N,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(g.Grid, {
                            className: x,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: G,
                                disabled: N,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: V,
                                loading: N,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        x = (0, h.makeStyles)()(() => ({
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
        A = (0, i.withTranslation)(e => {
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
                    dialogActions: h
                }
            } = x(), [y, b] = (0, a.useState)(), [S, w] = (0, a.useState)(), E = (0, a.useCallback)(async () => {
                if (null == o ? void 0 : o.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(o.senderUserId, 10));
                    b(e.name), w(!1)
                } catch (e) {
                    w(!0)
                }
            }, [o]);
            (0, a.useEffect)(() => {
                E()
            }, [E]);
            let I = (0, a.useCallback)(() => {
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
                        children: [(0, t.jsx)(v.Typography, {
                            variant: "h4",
                            className: c,
                            children: l(s ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(v.Typography, {
                            variant: "body1",
                            children: s ? (0, t.jsx)(t.Fragment, {
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
                }), (0, t.jsx)(m.DialogActions, {
                    className: h,
                    children: (0, t.jsx)(g.Grid, {
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
        R = e.i(672401);
    let O = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: m
        } = (0, c.default)(), [f, g] = (0, a.useState)(), [v, h] = (0, a.useState)(), [y, b] = (0, a.useState)(), [C, S] = (0, a.useState)(!1), [w, E] = (0, a.useState)(!1), [x, O] = (0, a.useState)(), [T, N] = (0, a.useState)(!1), U = null == d ? void 0 : d.id, k = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : m
        }, [p, m]), L = l.query[P.InviteQueryKey], z = l.isReady, F = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), D = (0, a.useCallback)(async e => {
            if (!U) return void b(null);
            try {
                let t = await o.default.userClient.getUserInvitationByOrganization(e, U.toString());
                b(t)
            } catch (e) {
                b(null), F()
            }
        }, [U, F]), M = (0, a.useCallback)(async e => {
            if (!U) return void h(null);
            try {
                let t = await o.default.userClient.getUserPermissions(e, U.toString());
                h(t)
            } catch (e) {
                h(null)
            }
        }, [U]), j = (0, a.useCallback)(async () => {
            if (z) {
                E(!0);
                try {
                    if ("string" == typeof L) return void await D(L);
                    if (!k) return void g(null);
                    if (b(null), k) {
                        let e = await o.default.organizationClient.getOrganization(k.toString());
                        g(e), await M(e.id)
                    } else g(void 0);
                    S(!1)
                } catch (e) {
                    g(null), h(null), b(null)
                } finally {
                    E(!1)
                }
            }
        }, [k, D, M, L, z]), G = (0, a.useCallback)(() => {
            S(!0), j()
        }, [j]), V = (0, a.useCallback)(async () => {
            (null == f ? void 0 : f.id) && await M(null == f ? void 0 : f.id)
        }, [M, null == f ? void 0 : f.id]), B = (0, a.useMemo)(() => ({
            organization: f,
            permissions: v,
            refreshOrganization: G,
            refreshPermission: V,
            isOrganizationRefreshRequired: C,
            isOrganizationLoading: w
        }), [f, v, G, V, C, w]);
        return (0, a.useEffect)(() => {
            j()
        }, [j]), (0, t.jsx)(R.default.Provider, {
            value: B,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(I, {
                        open: y.invitationStatusType === s.InvitationStatusType.Open && void 0 === x,
                        onClose: e => {
                            !0 === e ? (O(!0), N(!0)) : !1 === e ? (O(!1), N(!0)) : (F(), b(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(A, {
                        open: T,
                        onClose: () => {
                            N(!1), !0 === x && G(), F()
                        },
                        invitation: y,
                        accepted: !0 === x
                    })]
                })]
            })
        })
    }, [l.TranslationNamespace.Organization]);
    e.s(["default", 0, O], 911502)
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
    let c = (0, e.i(272593).createClientConfiguration)("creator-home-api", "bedev2"),
        u = new o.GroupsApi(c),
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
            data: s,
            isLoading: l,
            refetch: c
        } = d(), [u, m] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [f, g] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [v, h] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), y = (0, a.useCallback)(e => {
            g(e);
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
        }, [g, h]), b = (0, a.useMemo)(() => {
            if (null == s ? void 0 : s.groups) return null == s ? void 0 : s.groups;
            if (null === u) return [];
            try {
                return "string" == typeof u ? JSON.parse(u) : u
            } catch (e) {
                return []
            }
        }, [u, null == s ? void 0 : s.groups]), C = (0, a.useMemo)(() => {
            var e;
            return f && null != (e = b.find(e => {
                let {
                    id: t
                } = e;
                return t === f
            })) ? e : null
        }, [f, b]);
        (0, a.useEffect)(() => {
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !l && m(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, b, l, m, null == o ? void 0 : o.id]);
        let S = (0, a.useMemo)(() => ({
            groups: b,
            currentGroup: C,
            groupData: v,
            isFetched: !l && !!(null == o ? void 0 : o.id),
            refreshGroups: c,
            setCurrentGroup: y
        }), [C, v, b, l, c, y, null == o ? void 0 : o.id]);
        return (0, t.jsx)(p.Provider, {
            value: S,
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
    let s = t.Locale.English,
        l = t.NativeName.English,
        c = s === t.Locale.SimplifiedChinese ? o.default : r.default;
    e.s(["defaultLocale", 0, s, "defaultMetadataJson", 0, c, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 734463, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(19655),
        n = e.i(78892),
        i = e.i(608652),
        r = e.i(598943),
        o = e.i(793808),
        s = e.i(44265),
        l = e.i(40266),
        c = e.i(524887),
        u = e.i(763960),
        d = e.i(226972),
        p = e.i(594278),
        m = e.i(699704),
        f = e.i(428156),
        g = e.i(3300),
        v = e.i(813593),
        h = e.i(221628),
        y = "Popover",
        [b, C] = (0, i.createContextScope)(y, [c.createPopperScope]),
        S = (0, c.createPopperScope)(),
        [w, E] = b(y),
        I = e => {
            let {
                __scopePopover: a,
                children: n,
                open: i,
                defaultOpen: r,
                onOpenChange: o,
                modal: s = !1
            } = e, u = S(a), d = t.useRef(null), [p, m] = t.useState(!1), [g = !1, v] = (0, f.useControllableState)({
                prop: i,
                defaultProp: r,
                onChange: o
            });
            return (0, h.jsx)(c.Root, {
                ...u,
                children: (0, h.jsx)(w, {
                    scope: a,
                    contentId: (0, l.useId)(),
                    triggerRef: d,
                    open: g,
                    onOpenChange: v,
                    onOpenToggle: t.useCallback(() => v(e => !e), [v]),
                    hasCustomAnchor: p,
                    onCustomAnchorAdd: t.useCallback(() => m(!0), []),
                    onCustomAnchorRemove: t.useCallback(() => m(!1), []),
                    modal: s,
                    children: n
                })
            })
        };
    I.displayName = y;
    var x = "PopoverAnchor",
        A = t.forwardRef((e, a) => {
            let {
                __scopePopover: n,
                ...i
            } = e, r = E(x, n), o = S(n), {
                onCustomAnchorAdd: s,
                onCustomAnchorRemove: l
            } = r;
            return t.useEffect(() => (s(), () => l()), [s, l]), (0, h.jsx)(c.Anchor, {
                ...o,
                ...i,
                ref: a
            })
        });
    A.displayName = x;
    var P = "PopoverTrigger",
        R = t.forwardRef((e, t) => {
            let {
                __scopePopover: i,
                ...r
            } = e, o = E(P, i), s = S(i), l = (0, n.useComposedRefs)(t, o.triggerRef), u = (0, h.jsx)(p.Primitive.button, {
                type: "button",
                "aria-haspopup": "dialog",
                "aria-expanded": o.open,
                "aria-controls": o.contentId,
                "data-state": B(o.open),
                ...r,
                ref: l,
                onClick: (0, a.composeEventHandlers)(e.onClick, o.onOpenToggle)
            });
            return o.hasCustomAnchor ? u : (0, h.jsx)(c.Anchor, {
                asChild: !0,
                ...s,
                children: u
            })
        });
    R.displayName = P;
    var O = "PopoverPortal",
        [T, N] = b(O, {
            forceMount: void 0
        }),
        U = e => {
            let {
                __scopePopover: t,
                forceMount: a,
                children: n,
                container: i
            } = e, r = E(O, t);
            return (0, h.jsx)(T, {
                scope: t,
                forceMount: a,
                children: (0, h.jsx)(d.Presence, {
                    present: a || r.open,
                    children: (0, h.jsx)(u.Portal, {
                        asChild: !0,
                        container: i,
                        children: n
                    })
                })
            })
        };
    U.displayName = O;
    var k = "PopoverContent",
        L = t.forwardRef((e, t) => {
            let a = N(k, e.__scopePopover),
                {
                    forceMount: n = a.forceMount,
                    ...i
                } = e,
                r = E(k, e.__scopePopover);
            return (0, h.jsx)(d.Presence, {
                present: n || r.open,
                children: r.modal ? (0, h.jsx)(F, {
                    ...i,
                    ref: t
                }) : (0, h.jsx)(D, {
                    ...i,
                    ref: t
                })
            })
        });
    L.displayName = k;
    var z = (0, m.createSlot)("PopoverContent.RemoveScroll"),
        F = t.forwardRef((e, i) => {
            let r = E(k, e.__scopePopover),
                o = t.useRef(null),
                s = (0, n.useComposedRefs)(i, o),
                l = t.useRef(!1);
            return t.useEffect(() => {
                let e = o.current;
                if (e) return (0, g.hideOthers)(e)
            }, []), (0, h.jsx)(v.RemoveScroll, {
                as: z,
                allowPinchZoom: !0,
                children: (0, h.jsx)(M, {
                    ...e,
                    ref: s,
                    trapFocus: r.open,
                    disableOutsidePointerEvents: !0,
                    onCloseAutoFocus: (0, a.composeEventHandlers)(e.onCloseAutoFocus, e => {
                        var t;
                        e.preventDefault(), l.current || null == (t = r.triggerRef.current) || t.focus()
                    }),
                    onPointerDownOutside: (0, a.composeEventHandlers)(e.onPointerDownOutside, e => {
                        let t = e.detail.originalEvent,
                            a = 0 === t.button && !0 === t.ctrlKey;
                        l.current = 2 === t.button || a
                    }, {
                        checkForDefaultPrevented: !1
                    }),
                    onFocusOutside: (0, a.composeEventHandlers)(e.onFocusOutside, e => e.preventDefault(), {
                        checkForDefaultPrevented: !1
                    })
                })
            })
        }),
        D = t.forwardRef((e, a) => {
            let n = E(k, e.__scopePopover),
                i = t.useRef(!1),
                r = t.useRef(!1);
            return (0, h.jsx)(M, {
                ...e,
                ref: a,
                trapFocus: !1,
                disableOutsidePointerEvents: !1,
                onCloseAutoFocus: t => {
                    var a, o;
                    null == (a = e.onCloseAutoFocus) || a.call(e, t), t.defaultPrevented || (i.current || null == (o = n.triggerRef.current) || o.focus(), t.preventDefault()), i.current = !1, r.current = !1
                },
                onInteractOutside: t => {
                    var a, o;
                    null == (a = e.onInteractOutside) || a.call(e, t), t.defaultPrevented || (i.current = !0, "pointerdown" === t.detail.originalEvent.type && (r.current = !0));
                    let s = t.target;
                    (null == (o = n.triggerRef.current) ? void 0 : o.contains(s)) && t.preventDefault(), "focusin" === t.detail.originalEvent.type && r.current && t.preventDefault()
                }
            })
        }),
        M = t.forwardRef((e, t) => {
            let {
                __scopePopover: a,
                trapFocus: n,
                onOpenAutoFocus: i,
                onCloseAutoFocus: l,
                disableOutsidePointerEvents: u,
                onEscapeKeyDown: d,
                onPointerDownOutside: p,
                onFocusOutside: m,
                onInteractOutside: f,
                ...g
            } = e, v = E(k, a), y = S(a);
            return (0, o.useFocusGuards)(), (0, h.jsx)(s.FocusScope, {
                asChild: !0,
                loop: !0,
                trapped: n,
                onMountAutoFocus: i,
                onUnmountAutoFocus: l,
                children: (0, h.jsx)(r.DismissableLayer, {
                    asChild: !0,
                    disableOutsidePointerEvents: u,
                    onInteractOutside: f,
                    onEscapeKeyDown: d,
                    onPointerDownOutside: p,
                    onFocusOutside: m,
                    onDismiss: () => v.onOpenChange(!1),
                    children: (0, h.jsx)(c.Content, {
                        "data-state": B(v.open),
                        role: "dialog",
                        id: v.contentId,
                        ...y,
                        ...g,
                        ref: t,
                        style: {
                            ...g.style,
                            "--radix-popover-content-transform-origin": "var(--radix-popper-transform-origin)",
                            "--radix-popover-content-available-width": "var(--radix-popper-available-width)",
                            "--radix-popover-content-available-height": "var(--radix-popper-available-height)",
                            "--radix-popover-trigger-width": "var(--radix-popper-anchor-width)",
                            "--radix-popover-trigger-height": "var(--radix-popper-anchor-height)"
                        }
                    })
                })
            })
        }),
        j = "PopoverClose",
        G = t.forwardRef((e, t) => {
            let {
                __scopePopover: n,
                ...i
            } = e, r = E(j, n);
            return (0, h.jsx)(p.Primitive.button, {
                type: "button",
                ...i,
                ref: t,
                onClick: (0, a.composeEventHandlers)(e.onClick, () => r.onOpenChange(!1))
            })
        });
    G.displayName = j;
    var V = t.forwardRef((e, t) => {
        let {
            __scopePopover: a,
            ...n
        } = e, i = S(a);
        return (0, h.jsx)(c.Arrow, {
            ...i,
            ...n,
            ref: t
        })
    });

    function B(e) {
        return e ? "open" : "closed"
    }
    V.displayName = "PopoverArrow", e.s(["Anchor", 0, A, "Arrow", 0, V, "Close", 0, G, "Content", 0, L, "Portal", 0, U, "Root", 0, I, "Trigger", 0, R])
}, 169525, e => {
    "use strict";
    var t = e.i(416340),
        a = e.i(78892),
        n = e.i(723570),
        i = e => {
            var i, o, s;
            let l, c, {
                    present: u,
                    children: d
                } = e,
                p = function(e) {
                    var a, i;
                    let [o, s] = t.useState(), l = t.useRef(null), c = t.useRef(e), u = t.useRef("none"), [d, p] = (a = e ? "mounted" : "unmounted", i = {
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
                        u.current = "mounted" === d ? e : "none"
                    }, [d]), (0, n.useLayoutEffect)(() => {
                        let t = l.current,
                            a = c.current;
                        if (a !== e) {
                            let n = u.current,
                                i = r(t);
                            e ? p("MOUNT") : "none" === i || (null == t ? void 0 : t.display) === "none" ? p("UNMOUNT") : a && n !== i ? p("ANIMATION_OUT") : p("UNMOUNT"), c.current = e
                        }
                    }, [e, p]), (0, n.useLayoutEffect)(() => {
                        if (o) {
                            var e;
                            let t, a = null != (e = o.ownerDocument.defaultView) ? e : window,
                                n = e => {
                                    let n = r(l.current).includes(CSS.escape(e.animationName));
                                    if (e.target === o && n && (p("ANIMATION_END"), !c.current)) {
                                        let e = o.style.animationFillMode;
                                        o.style.animationFillMode = "forwards", t = a.setTimeout(() => {
                                            "forwards" === o.style.animationFillMode && (o.style.animationFillMode = e)
                                        })
                                    }
                                },
                                i = e => {
                                    e.target === o && (u.current = r(l.current))
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
                }(u),
                m = "function" == typeof d ? d({
                    present: p.isPresent
                }) : t.Children.only(d),
                f = (0, a.useComposedRefs)(p.ref, (c = (l = null == (o = Object.getOwnPropertyDescriptor((i = m).props, "ref")) ? void 0 : o.get) && "isReactWarning" in l && l.isReactWarning) ? i.ref : (c = (l = null == (s = Object.getOwnPropertyDescriptor(i, "ref")) ? void 0 : s.get) && "isReactWarning" in l && l.isReactWarning) ? i.props.ref : i.props.ref || i.ref);
            return "function" == typeof d || p.isPresent ? t.cloneElement(m, {
                ref: f
            }) : null
        };

    function r(e) {
        return (null == e ? void 0 : e.animationName) || "none"
    }
    i.displayName = "Presence", e.s(["Presence", 0, i])
}, 685245, e => {
    "use strict";
    var t = e.i(253923),
        a = e.i(454778),
        n = e.i(197649),
        i = e.i(416340),
        r = e.i(78892),
        o = e.i(608652),
        s = e.i(174617),
        l = e.i(199786),
        c = e.i(300792),
        u = e.i(692166),
        d = e.i(169525),
        p = e.i(600317),
        m = e.i(221628),
        f = "Checkbox",
        [g, v] = (0, o.createContextScope)(f),
        [h, y] = g(f);

    function b(e) {
        let {
            __scopeCheckbox: t,
            checked: a,
            children: n,
            defaultChecked: r,
            disabled: o,
            form: s,
            name: c,
            onCheckedChange: u,
            required: d,
            value: p = "on",
            internal_do_not_use_render: g
        } = e, [v, y] = (0, l.useControllableState)({
            prop: a,
            defaultProp: null != r && r,
            onChange: u,
            caller: f
        }), [b, C] = i.useState(null), [S, w] = i.useState(null), E = i.useRef(!1), I = !b || !!s || !!b.closest("form"), x = {
            checked: v,
            disabled: o,
            setChecked: y,
            control: b,
            setControl: C,
            name: c,
            form: s,
            value: p,
            hasConsumerStoppedPropagationRef: E,
            required: d,
            defaultChecked: !P(r) && r,
            isFormControl: I,
            bubbleInput: S,
            setBubbleInput: w
        };
        return (0, m.jsx)(h, {
            scope: t,
            ...x,
            children: "function" == typeof g ? g(x) : n
        })
    }
    var C = "CheckboxTrigger",
        S = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                onKeyDown: n,
                onClick: o,
                ...l
            } = e, {
                control: c,
                value: u,
                disabled: d,
                checked: f,
                required: g,
                setControl: v,
                setChecked: h,
                hasConsumerStoppedPropagationRef: b,
                isFormControl: S,
                bubbleInput: w
            } = y(C, a), E = (0, r.useComposedRefs)(t, v), I = i.useRef(f);
            return i.useEffect(() => {
                let e = null == c ? void 0 : c.form;
                if (e) {
                    let t = () => h(I.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [c, h]), (0, m.jsx)(p.Primitive.button, {
                type: "button",
                role: "checkbox",
                "aria-checked": P(f) ? "mixed" : f,
                "aria-required": g,
                "data-state": R(f),
                "data-disabled": d ? "" : void 0,
                disabled: d,
                value: u,
                ...l,
                ref: E,
                onKeyDown: (0, s.composeEventHandlers)(n, e => {
                    "Enter" === e.key && e.preventDefault()
                }),
                onClick: (0, s.composeEventHandlers)(o, e => {
                    h(e => !!P(e) || !e), w && S && (b.current = e.isPropagationStopped(), b.current || e.stopPropagation())
                })
            })
        });
    S.displayName = C;
    var w = i.forwardRef((e, t) => {
        let {
            __scopeCheckbox: a,
            name: n,
            checked: i,
            defaultChecked: r,
            required: o,
            disabled: s,
            value: l,
            onCheckedChange: c,
            form: u,
            ...d
        } = e;
        return (0, m.jsx)(b, {
            __scopeCheckbox: a,
            checked: i,
            defaultChecked: r,
            disabled: s,
            required: o,
            onCheckedChange: c,
            name: n,
            form: u,
            value: l,
            internal_do_not_use_render: e => {
                let {
                    isFormControl: n
                } = e;
                return (0, m.jsxs)(m.Fragment, {
                    children: [(0, m.jsx)(S, {
                        ...d,
                        ref: t,
                        __scopeCheckbox: a
                    }), n && (0, m.jsx)(A, {
                        __scopeCheckbox: a
                    })]
                })
            }
        })
    });
    w.displayName = f;
    var E = "CheckboxIndicator",
        I = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...i
            } = e, r = y(E, a);
            return (0, m.jsx)(d.Presence, {
                present: n || P(r.checked) || !0 === r.checked,
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
    I.displayName = E;
    var x = "CheckboxBubbleInput",
        A = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                ...n
            } = e, {
                control: o,
                hasConsumerStoppedPropagationRef: s,
                checked: l,
                defaultChecked: d,
                required: f,
                disabled: g,
                name: v,
                value: h,
                form: b,
                bubbleInput: C,
                setBubbleInput: S
            } = y(x, a), w = (0, r.useComposedRefs)(t, S), E = (0, c.usePrevious)(l), I = (0, u.useSize)(o);
            i.useEffect(() => {
                if (!C) return;
                let e = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set,
                    t = !s.current;
                if (E !== l && e) {
                    let a = new Event("click", {
                        bubbles: t
                    });
                    C.indeterminate = P(l), e.call(C, !P(l) && l), C.dispatchEvent(a)
                }
            }, [C, E, l, s]);
            let A = i.useRef(!P(l) && l);
            return (0, m.jsx)(p.Primitive.input, {
                type: "checkbox",
                "aria-hidden": !0,
                defaultChecked: null != d ? d : A.current,
                required: f,
                disabled: g,
                name: v,
                value: h,
                form: b,
                ...n,
                tabIndex: -1,
                ref: w,
                style: {
                    ...n.style,
                    ...I,
                    position: "absolute",
                    pointerEvents: "none",
                    opacity: 0,
                    margin: 0,
                    transform: "translateX(-100%)"
                }
            })
        });

    function P(e) {
        return "indeterminate" === e
    }

    function R(e) {
        return P(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    A.displayName = x;
    let O = {
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
        N = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        U = {
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
            size: c,
            hint: u,
            placement: d,
            onCheckedChange: p,
            id: m,
            ...f
        } = e, g = (0, a.default)(), v = m || g, h = r && i.default.createElement("label", {
            htmlFor: v,
            className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !l && "cursor-pointer")
        }, i.default.createElement("span", {
            className: (0, n.default)(N[c], U[c], "content-emphasis")
        }, r), u && i.default.createElement("span", {
            className: "text-body-medium content-default"
        }, u));
        return i.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", l && "opacity-[0.5]", !l && "cursor-pointer", o)
        }, "End" === d && h, i.default.createElement("div", {
            className: (0, n.default)(T[c])
        }, i.default.createElement(w, {
            "data-slot": "checkbox",
            className: (0, n.default)(O[c], t.interactable, !l && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: v,
            checked: s,
            disabled: l,
            onCheckedChange: p,
            "aria-label": r,
            ...f
        }, i.default.createElement(t.StateLayer, null), i.default.createElement(I, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(O[c], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === d && h)
    }], 685245)
}, 256539, e => {
    "use strict";
    var t = e.i(197649),
        a = e.i(416340);
    let n = (0, a.forwardRef)((e, n) => {
        let {
            className: i,
            style: r,
            orientation: o = "horizontal",
            variant: s = "Standard",
            ...l
        } = e, c = "vertical" === o, u = {};
        return c || "Inset" !== s ? c || "InsetLeft" !== s ? c || "InsetRight" !== s || (u = {
            marginRight: "var(--padding-xlarge)"
        }) : u = {
            marginLeft: "var(--padding-xlarge)"
        } : u = {
            marginLeft: "var(--padding-xlarge)",
            marginRight: "var(--padding-xlarge)"
        }, a.default.createElement("div", {
            ref: n,
            ...l,
            role: "separator",
            "data-orientation": o,
            "aria-orientation": o,
            style: {
                borderRightWidth: 0,
                borderBottomWidth: 0,
                boxSizing: "border-box",
                borderStyle: "solid",
                ...c ? {
                    height: "100%",
                    width: 0,
                    borderLeftWidth: "var(--stroke-standard)",
                    borderTopWidth: 0
                } : "Thick" === s ? {
                    height: "var(--size-250)",
                    borderTop: "var(--stroke-standard)",
                    borderLeftWidth: 0,
                    background: "var(--color-common-heavydivider, rgba(0, 0, 0, 0.50))"
                } : {
                    height: 0,
                    borderTopWidth: "var(--stroke-standard)",
                    borderLeftWidth: 0
                },
                ...u,
                ...r
            },
            className: (0, t.default)("stroke-default self-stretch", i)
        })
    });
    n.displayName = "Divider", e.s(["Divider", 0, n])
}, 708064, e => {
    "use strict";
    var t = e.i(253923),
        a = e.i(106077),
        n = e.i(197649),
        i = e.i(416340),
        r = e.i(23342);
    let o = {
            Large: "size-1200",
            Medium: "size-1000",
            Small: "size-800",
            XSmall: "size-600"
        },
        s = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-700"
        },
        l = {
            Large: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Medium: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            Small: {
                circular: "radius-circle",
                square: "radius-medium"
            },
            XSmall: {
                circular: "radius-circle",
                square: "radius-small"
            }
        },
        c = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-alert",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        u = {
            Emphasis: "bg-action-standard",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-action-link",
            OverMedia: "bg-over-media-0"
        },
        d = {
            Emphasis: "bg-action-emphasis",
            Standard: "bg-action-standard",
            Alert: "bg-action-standard",
            Utility: "bg-shift-300",
            OverMedia: "bg-over-media-0"
        },
        p = {
            Default: {
                Emphasis: "content-action-emphasis",
                Standard: "content-action-standard",
                Alert: "content-action-alert",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-emphasis",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-alert",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        m = {
            Default: {
                Emphasis: "content-action-standard",
                Standard: "content-action-standard",
                Alert: "content-action-standard",
                Utility: "content-emphasis",
                OverMedia: "content-emphasis"
            },
            Inverse: {
                Emphasis: "content-inverse-action-standard",
                Standard: "content-inverse-action-standard",
                Alert: "content-inverse-action-standard",
                Utility: "content-inverse-emphasis",
                OverMedia: "content-inverse-emphasis"
            }
        },
        f = (0, i.forwardRef)((e, f) => {
            let g, {
                className: v,
                icon: h,
                ariaLabel: y,
                isDisabled: b = !1,
                isCircular: C = !1,
                isSelected: S = !1,
                size: w = "Large",
                variant: E = "Emphasis",
                iconColor: I = "Default",
                asChild: x,
                children: A,
                ...P
            } = e;
            g = b ? u[E] : S ? d[E] : c[E];
            let R = (0, n.default)("foundation-web-icon-button", b ? a.disabledOpacity : [t.interactable, "cursor-pointer"], "relative flex items-center justify-center padding-none stroke-none select-none", o[w], l[w][C ? "circular" : "square"], g, v),
                O = i.default.createElement(i.default.Fragment, null, i.default.createElement(t.StateLayer, null), i.default.createElement("span", {
                    className: (0, n.default)("icon", h, s[w], b ? m[I][E] : p[I][E])
                }));
            if (x) {
                let {
                    as: e,
                    ...t
                } = P, a = i.default.Children.only(A);
                return i.default.createElement(r.Slot, {
                    ref: f,
                    ...t,
                    className: R,
                    "aria-label": y,
                    "aria-disabled": b || void 0
                }, i.default.cloneElement(a, {}, O))
            }
            if ("a" === P.as) {
                let {
                    as: e,
                    href: t,
                    ...a
                } = P;
                return i.default.createElement("a", {
                    ref: f,
                    ...a,
                    "aria-label": y,
                    "aria-disabled": b,
                    href: b ? void 0 : t,
                    className: R
                }, O)
            }
            let {
                as: T,
                ...N
            } = P;
            return i.default.createElement("button", {
                ref: f,
                type: "button",
                ...N,
                "aria-label": y,
                disabled: b,
                className: R
            }, O)
        });
    e.s(["IconButton", 0, f])
}, 252082, e => {
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
}, 599721, e => {
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
            } = e, m = "Determinate" === o, f = Math.min(100, Math.max(0, s)), g = m && void 0 !== l && "None" !== u, v = m && void 0 !== c && "None" !== u, h = "Sides" === u, y = a.default.createElement("div", {
                className: (0, t.default)("relative height-100 radius-circle bg-shift-200", h ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                style: h ? {
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
            })), b = g && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, l), C = v && a.default.createElement("span", {
                className: (0, t.default)("content-emphasis flex-shrink-0", n),
                "aria-hidden": "true"
            }, c), S = (g || v) && a.default.createElement("div", {
                className: "flex justify-between width-full gap-xsmall"
            }, g ? b : a.default.createElement("span", null), v ? C : a.default.createElement("span", null));
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("block width-full", r),
                role: "progressbar",
                "aria-label": d,
                "aria-valuemin": m ? 0 : void 0,
                "aria-valuemax": m ? 100 : void 0,
                "aria-valuenow": m ? f : void 0,
                ...p
            }, h ? a.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, b, y, C) : a.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === u && S, y, "Bottom" === u && S))
        });
    i.displayName = "ProgressBar", e.s(["ProgressBar", 0, i])
}, 377282, e => {
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
                textClass: f,
                valueContainerSize: g
            } = n[o], v = (p - m) / 2, h = 2 * Math.PI * v, y = p / 2, b = Math.min(100, Math.max(0, l)), C = c && void 0 !== g ? g : p, S = "Determinate" === s;
            return a.default.createElement("div", {
                ref: i,
                className: (0, t.default)("foundation-web-progress-circle inline-flex items-center justify-center", r),
                role: "progressbar",
                "aria-label": u,
                "aria-valuemin": S ? 0 : void 0,
                "aria-valuemax": S ? 100 : void 0,
                "aria-valuenow": S ? b : void 0,
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
                cx: y,
                cy: y,
                r: v,
                fill: "none",
                strokeWidth: m,
                style: {
                    stroke: "var(--color-shift-200)"
                }
            }), a.default.createElement("circle", {
                cx: y,
                cy: y,
                r: v,
                fill: "none",
                strokeWidth: m,
                strokeDasharray: S ? h : "".concat(.75 * h, " ").concat(.25 * h),
                strokeDashoffset: S ? h * (1 - b / 100) : 0,
                strokeLinecap: "round",
                className: (0, t.default)(!S && "foundation-web-progress-circle-indeterminate"),
                style: S ? {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transform: "rotate(-90deg)",
                    transformOrigin: "50% 50%",
                    transition: "stroke-dashoffset 0.3s ease-out"
                } : {
                    stroke: "var(--fui-future-alpha-color-system-progress)",
                    transformOrigin: "50% 50%"
                }
            })), S && c && "Large" === o && a.default.createElement("div", {
                className: (0, t.default)("absolute content-emphasis flex items-center justify-center", f),
                "aria-hidden": "true"
            }, a.default.createElement("span", null, Math.round(b)), a.default.createElement("span", null, "%")))
        });
    i.displayName = "ProgressCircle", e.s(["ProgressCircle", 0, i])
}, 959819, e => {
    "use strict";
    var t = e.i(605836),
        a = e.i(608972),
        n = e.i(356407),
        i = e.i(197649),
        r = e.i(416340);
    let o = (0, r.forwardRef)((e, o) => {
        let {
            title: s,
            icon: l,
            actionLabel: c,
            onAction: u,
            actions: d,
            onClose: p,
            closeIconAriaLabel: m = "Dismiss snackbar",
            shouldAutoDismiss: f,
            autoDismissDurationMs: g,
            className: v,
            ...h
        } = e, [y, b] = (0, r.useState)("enter"), C = (0, r.useRef)(void 0), S = (0, r.useRef)(void 0), w = (0, r.useRef)(void 0), E = (0, r.useRef)(null), I = null != d ? d : c && u && r.default.createElement(a.Button, {
            size: "Small",
            variant: "Utility",
            className: "content-inverse-emphasis",
            onClick: u,
            ref: E
        }, c), x = !!I, A = s.length > 80, P = null == f || f, R = 4e3;
        x && (R = A ? 1e4 : 7e3);
        let O = null != g ? g : R,
            T = (0, r.useCallback)(() => {
                "exit" !== y && (b("exit"), void 0 !== S.current && (window.clearTimeout(S.current), S.current = void 0), w.current = window.setTimeout(() => {
                    null == p || p()
                }, 150))
            }, [p, y]);
        (0, r.useEffect)(() => (C.current = window.requestAnimationFrame(() => {
            b("idle")
        }), () => {
            void 0 !== C.current && window.cancelAnimationFrame(C.current)
        }), []), (0, r.useEffect)(() => {
            void 0 !== S.current && (window.clearTimeout(S.current), S.current = void 0), P && "exit" !== y && (S.current = window.setTimeout(() => {
                T()
            }, O))
        }, [O, P, y, T]), (0, r.useEffect)(() => {
            var e;
            x && (null == (e = E.current) || e.focus())
        }, [x]), (0, r.useEffect)(() => () => {
            void 0 !== S.current && window.clearTimeout(S.current), void 0 !== w.current && window.clearTimeout(w.current), void 0 !== C.current && window.cancelAnimationFrame(C.current)
        }, []);
        let N = {
                position: "fixed",
                left: "50%",
                bottom: "max(var(--padding-xxlarge, 32px), env(safe-area-inset-bottom))",
                transform: "translate(-50%, ".concat("idle" === y ? "0" : "120%", ")"),
                zIndex: "var(--foundation-portal-zindex, 9999)"
            },
            U = h.style ? {
                ...N,
                ...h.style
            } : N;
        return r.default.createElement("div", {
            ref: o,
            role: "status",
            "aria-live": "polite",
            className: (0, i.default)("flex items-center gap-xxlarge radius-medium shadow-transient-low bg-inverse-surface-0 padding-x-medium padding-y-medium stroke-standard shrink-0", "max-width-[480px] min-height-[48px]", "min-width-[min(100%-max(2_*_var(--margin-small),env(safe-area-inset-left)+env(safe-area-inset-right)),393px)]", "foundation-web-portal-zindex pointer-events-auto", "exit" === y ? "ease-standard-in" : "ease-standard-out", v),
            style: {
                ...U,
                transitionDuration: "".concat("exit" === y ? 150 : 200, "ms"),
                transitionProperty: "transform"
            },
            ...h
        }, r.default.createElement("div", {
            className: "flex items-center gap-medium grow-1 basis-0 min-h-[40px]"
        }, l && r.default.createElement(t.Icon, {
            name: l,
            size: "Small",
            className: "shrink-0 content-inverse-emphasis"
        }), r.default.createElement("div", {
            className: "grow-1 basis-0 text-caption-large content-inverse-emphasis text-truncate-end"
        }, s)), r.default.createElement("div", {
            className: "flex items-center justify-end gap-small shrink-0"
        }, I, p && r.default.createElement(n.CloseAffordance, {
            variant: "Utility",
            size: "Small",
            isCircular: !0,
            className: "content-inverse-emphasis",
            "aria-label": m,
            onClick: T
        })))
    });
    e.s(["Snackbar", 0, o])
}, 196945, e => {
    "use strict";
    var t = e.i(865800),
        a = e.i(416340),
        n = e.i(323356);
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
        var r, o, s, l, c = e.children,
            u = (0, t.a)(e, ["children"]),
            d = (0, a.useRef)(null),
            p = (0, a.useState)(!1),
            m = p[0],
            f = p[1],
            g = (0, a.useState)([]),
            v = g[0],
            h = g[1],
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
                f(!1)
            }, [f]);
        (0, a.useEffect)(function() {
            v.length > 0 && f(!0)
        }, [v.length]);
        var C = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: C
        }, c), a.default.createElement(n.S, (0, t._)({}, (null == (r = v[0]) ? void 0 : r.props) || {}, u, {
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
                (null == (a = v[0]) ? void 0 : a.shouldClose(t)) && f(!1), (null == (n = v[0]) ? void 0 : n.props.onClose) && (null == (i = v[0]) || i.props.onClose(e, t))
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
}, 766324, e => {
    "use strict";
    var t = e.i(196945);
    e.s(["SnackbarProvider", () => t.default])
}, 921500, 298013, e => {
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
    }], 298013);
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
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 921500)
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
        s = !o || void 0 === Intl.Locale,
        l = !o || void 0 === Intl.RelativeTimeFormat,
        c = !o || void 0 === Intl.PluralRules,
        u = !o || void 0 === Intl.DisplayNames,
        d = "function" != typeof window.ResizeObserver,
        p = (n = s || l || c || u || d, i = function() {
            return Promise.all([(s ? e.A(361318).then(function(e) {
                return e.p
            }) : Promise.resolve()).then(() => Promise.all([l ? e.A(950511).then(function(e) {
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
            children: s,
            unifiedLogger: l,
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
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=caf5e9bb-fd58-92cc-e0c8-79d324e44902
//# sourceMappingURL=2u-w_08cg-0cy.js.map