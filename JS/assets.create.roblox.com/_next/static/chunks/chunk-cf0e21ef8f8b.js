;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "2eb4c854-f268-ff41-f407-242d34b3a999")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 239328, e => {
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
    e.s(["isAssetAccessRequestsEnabled", 0, n, "isAssetDependenciesViewerEnabled", 0, r, "isAssetPrivacyOptOutSurveyEnabled", 0, a, "isCreatorStoreVideoMultipartUploadEnabled", 0, s, "isModelCustomThumbnailUploadEnabled", 0, i, "isPricingEligibilityV2Enabled", 0, o])
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
    e.s(["enableIpPlatformLicenseRecommendations", 0, n, "isAvatarItemLicensingEnabled", 0, l, "isExperiencePreviewEnabled", 0, a, "isIgnoreMatchEnabled", 0, o, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isInGameSalesLicensingEnabled", 0, c, "isIpLicensingEarningsEnabled", 0, i, "isIphInGameSalesAvatarMarketplaceSalesLicenseCreationEnabled", 0, u, "isShowcaseExperiencesEnabled", 0, s])
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
            name: "isMomentsUploadLanguageSelectEnabled",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, s, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, r])
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
            name: "enableExpeditedReview",
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
        });
    e.s(["enableExpeditedReview", 0, n, "enablePlayerHostedEvents", 0, i, "enablePlayerSupport", 0, a, "enablePlayerSupportCreatorTicketReroute", 0, r])
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
    let t = (0, e.i(157700).defineFlag)({
        namespace: "immersive-ads",
        name: "isAdsPageRedesignEnabled",
        defaultValue: !1
    });
    e.s(["isAdsPageRedesignEnabled", 0, t])
}, 82899, 494192, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !1
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
        s = (0, t.defineFlag)({
            namespace: "monetization",
            name: "isProductArchiveEnabled",
            defaultValue: !1
        });
    e.s(["isProductArchiveEnabled", 0, s, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, n, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, a])
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
        s = e.i(486736);
    let o = (0, e.i(650502).getBEDEV2ServiceBasePath)("access-management"),
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
        }, u = async () => await c("".concat(o, "/v1/upsell-feature-access?nameSpace=").concat(l, "&featureName=").concat("ShouldShowCreatorHubBanner")) === "Granted", d = "CreatorHub.AgeVerificationBannerSettings", p = async () => {
            localStorage.removeItem(d)
        }, g = async () => {
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
        }, m = async () => {
            localStorage.setItem(d, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, f = (0, a.createContext)({
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
            children: o
        } = e, {
            settings: {
                ageVerificationUpsellBannerStartDate: l,
                ageVerificationUpsellBannerEndDate: c,
                ageVerificationUpsellBannerHighPriorityDate: u
            }
        } = (0, s.useSettings)(), [d, p] = (0, a.useState)(!0), [y, b] = (0, a.useState)("doNotShow"), {
            isFetched: C,
            user: I
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: S
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: w,
            isEnabled: A
        } = (0, a.useMemo)(() => {
            let e = h(l),
                t = h(c),
                a = h(u),
                n = new Date;
            return {
                isHighPriority: a <= n,
                isEnabled: e <= n && n < t
            }
        }, [c, l, u]), E = (0, a.useCallback)(async () => {
            await m(), p(!0)
        }, [p]);
        (0, a.useEffect)(() => {
            A && C && (null == I ? void 0 : I.id) && (async () => {
                let e = !1;
                try {
                    e = await g()
                } catch (e) {
                    S.logErrorEvent({
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
                    t = await v()
                } catch (e) {
                    S.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                b(t)
            })().catch(e => {
                S.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [A, C, I, S]);
        let x = (0, a.useMemo)(() => {
            let e = A && "doNotShow" !== y;
            return {
                isBannerVisible: e && !d,
                isBannerEligible: e,
                isHighPriority: w,
                variant: "doNotShow" !== y ? y : "ageVerification",
                dismissBanner: E
            }
        }, [A, y, d, w, E]);
        return (0, t.jsx)(f.Provider, {
            value: x,
            children: o
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(f)], 906791)
}, 968439, e => {
    "use strict";
    var t, a = e.i(721281),
        n = e.i(703440),
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
            getUsersWithRole: async (e, t, a, n, i) => o.v1OrganizationsOrganizationIdRolesRoleIdUsersGet({
                organizationId: e,
                roleId: t,
                pageToken: a,
                maxPageSize: n,
                isDefault: i
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
    "function" == typeof SuppressedError && SuppressedError;
    var o = {
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

    function g(e, t) {
        return null == e ? e : {
            results: (0, a.exists)(e, "results") ? null === e.results ? null : e.results.map(p) : void 0
        }
    }
    var m = function(e) {
            function t() {
                return null !== e && e.apply(this, arguments) || this
            }
            return i(t, e), t.prototype.acceptanceDeleteRaw = function(e, t) {
                return r(this, void 0, void 0, function() {
                    var n, i, r;
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
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
                    return void 0 === e && (e = {}), s(this, function(a) {
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
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return null == e ? e : {
                                        results: (0, a.exists)(e, "results") ? null === e.results ? null : e.results.map(l) : void 0
                                    }
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceGetByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
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
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsert = function() {
                return r(this, arguments, void 0, function(e, t) {
                    return void 0 === e && (e = {}), s(this, function(a) {
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
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return g(e)
                                })]
                        }
                    })
                })
            }, t.prototype.acceptanceInsertByUserId = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
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
                    return s(this, function(s) {
                        switch (s.label) {
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
                                return r = s.sent(), [2, new a.JSONApiResponse(r, function(e) {
                                    return e.map(c)
                                })]
                        }
                    })
                })
            }, t.prototype.agreementResolutionGetByContext = function(e, t) {
                return r(this, void 0, void 0, function() {
                    return s(this, function(a) {
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
    e.s(["AcceptanceApi", 0, m, "AgreementResolutionApi", 0, f, "AgreementType", 0, {
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
            })).filter(e => e.regulationType !== o.Luobu)
        }
        getUserAgreements(e) {
            return this.agreementResolutionApi.agreementResolutionGetByContext(e)
        }
        constructor() {
            (0, t._)(this, "agreementResolutionApi", void 0), (0, t._)(this, "acceptanceApi", void 0);
            const e = (0, h.createClientConfiguration)("user-agreements", "bedev2");
            this.agreementResolutionApi = new f(e), this.acceptanceApi = new m(e)
        }
    };
    e.s(["userAgreementsClient", 0, v], 196990)
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
        } = (0, n.useAuthentication)(), [u, d] = (0, a.useState)([]), [p, g] = (0, a.useState)(!1), [m, f] = (0, a.useState)(!0), [h, v] = (0, a.useState)(!1), y = (0, a.useCallback)(async () => {
            if (!p && (null == s ? void 0 : s.id) != null) try {
                v(!1), f(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(s.id.toString()),
                    t = (e => {
                        o(e);
                        for (let t = 0; t < e.length; t += 1) l(e[t].notificationCategoryName || "", e[t].notifications || []);
                        return e
                    })(e.categories || []);
                d(t), g(!0)
            } catch (e) {
                v(!0), g(!1)
            } finally {
                f(!1)
            }
        }, [null == s ? void 0 : s.id, p]), b = (0, a.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: h,
            notificationSettingsContextLoading: m,
            getNotificationSettings: y,
            setNotificationSettings: d
        }), [u, h, y, m, p]);
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
        s = e.i(607204),
        o = e.i(581548),
        l = e.i(881670),
        c = e.i(509049),
        u = e.i(745873),
        d = e.i(872204),
        p = e.i(291037),
        g = e.i(35298),
        m = e.i(777004),
        f = e.i(169722),
        h = e.i(199834),
        v = e.i(706442),
        y = e.i(196945),
        b = e.i(156071),
        C = e.i(790806),
        I = e.i(759283),
        S = e.i(384340);
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
        A = (0, i.withTranslation)(e => {
            let {
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, S.default)(), {
                classes: {
                    dialogTitle: v,
                    dialogContent: A,
                    dialogSubActions: E
                }
            } = w(), {
                enqueue: x,
                close: P
            } = (0, y.useSnackbar)(), R = (0, a.useCallback)(e => {
                x({
                    message: e,
                    anchorOrigin: {
                        vertical: "bottom",
                        horizontal: "center"
                    },
                    autoHideDuration: I.toastDurationTime,
                    autoHide: !0,
                    onClose: P
                })
            }, [x, P]), [O, U] = (0, a.useState)(), [T, k] = (0, a.useState)(), [z, N] = (0, a.useState)(), [L, F] = (0, a.useState)(), D = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    N(e.name), F(!1)
                } catch (e) {
                    F(!0)
                }
            }, [l]), V = (0, a.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await b.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    U(null == e ? void 0 : e.name)
                } catch (e) {
                    R(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, R, c]);
            (0, a.useEffect)(() => {
                D(), V()
            }, [V, D]);
            let M = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                j = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        k(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            R(c("Error.DecliningInvitation")), k(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]),
                G = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        k(!0);
                        try {
                            await s.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: o.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            R(c("Error.AcceptingInvitation")), k(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(m.DialogContent, {
                    className: A,
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
                                    organizationName: null != O ? O : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(f.Grid, {
                            container: !0,
                            children: (0, t.jsx)(h.Typography, {
                                variant: "body1",
                                children: L ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != z ? z : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(g.DialogActions, {
                    children: (0, t.jsxs)(f.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: M,
                            disabled: T,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(f.Grid, {
                            className: E,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: j,
                                disabled: T,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: G,
                                loading: T,
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
        x = (0, i.withTranslation)(e => {
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
                    dialogActions: v
                }
            } = E(), [y, b] = (0, a.useState)(), [I, S] = (0, a.useState)(), w = (0, a.useCallback)(async () => {
                if (null == s ? void 0 : s.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(s.senderUserId, 10));
                    b(e.name), S(!1)
                } catch (e) {
                    S(!0)
                }
            }, [s]);
            (0, a.useEffect)(() => {
                w()
            }, [w]);
            let A = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(m.DialogContent, {
                    className: u,
                    children: (0, t.jsxs)(f.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(h.Typography, {
                            variant: "h4",
                            className: c,
                            children: l(o ? "Label.InvitationAccepted" : "Label.InvitationDeclined")
                        }), (0, t.jsx)(h.Typography, {
                            variant: "body1",
                            children: o ? (0, t.jsx)(t.Fragment, {
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
                }), (0, t.jsx)(g.DialogActions, {
                    className: v,
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
    var P = e.i(582977),
        R = e.i(672401);
    let O = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: g
        } = (0, c.default)(), [m, f] = (0, a.useState)(), [h, v] = (0, a.useState)(), [y, b] = (0, a.useState)(), [C, I] = (0, a.useState)(!1), [S, w] = (0, a.useState)(!1), [E, O] = (0, a.useState)(), [U, T] = (0, a.useState)(!1), k = null == d ? void 0 : d.id, z = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : g
        }, [p, g]), N = l.query[P.InviteQueryKey], L = l.isReady, F = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), D = (0, a.useCallback)(async e => {
            if (!k) return void b(null);
            try {
                let t = await s.default.userClient.getUserInvitationByOrganization(e, k.toString());
                b(t)
            } catch (e) {
                b(null), F()
            }
        }, [k, F]), V = (0, a.useCallback)(async e => {
            if (!k) return void v(null);
            try {
                let t = await s.default.userClient.getUserPermissions(e, k.toString());
                v(t)
            } catch (e) {
                v(null)
            }
        }, [k]), M = (0, a.useCallback)(async () => {
            if (L) {
                w(!0);
                try {
                    if ("string" == typeof N) return void await D(N);
                    if (!z) return void f(null);
                    if (b(null), z) {
                        let e = await s.default.organizationClient.getOrganization(z.toString());
                        f(e), await V(e.id)
                    } else f(void 0);
                    I(!1)
                } catch (e) {
                    f(null), v(null), b(null)
                } finally {
                    w(!1)
                }
            }
        }, [z, D, V, N, L]), j = (0, a.useCallback)(() => {
            I(!0), M()
        }, [M]), G = (0, a.useCallback)(async () => {
            (null == m ? void 0 : m.id) && await V(null == m ? void 0 : m.id)
        }, [V, null == m ? void 0 : m.id]), B = (0, a.useMemo)(() => ({
            organization: m,
            permissions: h,
            refreshOrganization: j,
            refreshPermission: G,
            isOrganizationRefreshRequired: C,
            isOrganizationLoading: S
        }), [m, h, j, G, C, S]);
        return (0, a.useEffect)(() => {
            M()
        }, [M]), (0, t.jsx)(R.default.Provider, {
            value: B,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(A, {
                        open: y.invitationStatusType === o.InvitationStatusType.Open && void 0 === E,
                        onClose: e => {
                            !0 === e ? (O(!0), T(!0)) : !1 === e ? (O(!1), T(!0)) : (F(), b(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(x, {
                        open: U,
                        onClose: () => {
                            T(!1), !0 === E && j(), F()
                        },
                        invitation: y,
                        accepted: !0 === E
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
        s = e.i(811683);
    let o = t.Locale.English,
        l = t.NativeName.English,
        c = o === t.Locale.SimplifiedChinese ? s.default : r.default;
    e.s(["defaultLocale", 0, o, "defaultMetadataJson", 0, c, "defaultNativeName", 0, l, "fallbackLocale", 0, void 0], 272749)
}, 222563, e => {
    "use strict";
    var t = e.i(443967);
    e.i(511952);
    var a = e.i(422711),
        n = e.i(197649),
        i = e.i(416340),
        r = e.i(840934);
    e.i(149285);
    var s = e.i(221628),
        o = e.i(46079),
        l = e.i(610160),
        c = e.i(183906);
    (0, a.s)(".data-\\[state\\=unchecked\\]\\:stroke-contrast-alpha[data-state=unchecked]{border-color:var(--color-stroke-contrast-alpha)}");
    var u = i.forwardRef((e, t) => {
        let {
            children: a,
            ...n
        } = e, r = i.Children.toArray(a), o = r.find(g);
        if (o) {
            let e = o.props.children,
                a = r.map(t => t === o ? i.Children.count(e) > 1 ? i.Children.only(null) : i.isValidElement(e) ? e.props.children : null : t);
            return (0, s.jsx)(d, {
                ...n,
                ref: t,
                children: i.isValidElement(e) ? i.cloneElement(e, void 0, a) : null
            })
        }
        return (0, s.jsx)(d, {
            ...n,
            ref: t,
            children: a
        })
    });
    u.displayName = "Slot";
    var d = i.forwardRef((e, t) => {
        let {
            children: a,
            ...n
        } = e;
        if (i.isValidElement(a)) {
            var s, o;
            let e, l = (e = null == (s = Object.getOwnPropertyDescriptor(a.props, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning ? a.ref : (e = null == (o = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? a.props.ref : a.props.ref || a.ref,
                c = function(e, t) {
                    let a = {
                        ...t
                    };
                    for (let n in t) {
                        let i = e[n],
                            r = t[n];
                        /^on[A-Z]/.test(n) ? i && r ? a[n] = function() {
                            for (var e = arguments.length, t = Array(e), a = 0; a < e; a++) t[a] = arguments[a];
                            r(...t), i(...t)
                        } : i && (a[n] = i) : "style" === n ? a[n] = {
                            ...i,
                            ...r
                        } : "className" === n && (a[n] = [i, r].filter(Boolean).join(" "))
                    }
                    return {
                        ...e,
                        ...a
                    }
                }(n, a.props);
            return a.type !== i.Fragment && (c.ref = t ? (0, r.c)(t, l) : l), i.cloneElement(a, c)
        }
        return i.Children.count(a) > 1 ? i.Children.only(null) : null
    });
    d.displayName = "SlotClone";
    var p = e => {
        let {
            children: t
        } = e;
        return (0, s.jsx)(s.Fragment, {
            children: t
        })
    };

    function g(e) {
        return i.isValidElement(e) && e.type === p
    }
    var m = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            let a = i.forwardRef((e, a) => {
                let {
                    asChild: n,
                    ...i
                } = e, r = n ? u : t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, s.jsx)(r, {
                    ...i,
                    ref: a
                })
            });
            return a.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: a
            }
        }, {}),
        f = "Checkbox",
        [h, v] = (0, r.a)(f),
        [y, b] = h(f),
        C = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                name: n,
                checked: o,
                defaultChecked: l,
                required: c,
                disabled: u,
                value: d = "on",
                onCheckedChange: p,
                form: g,
                ...f
            } = e, [h, v] = i.useState(null), b = (0, r.u)(t, e => v(e)), C = i.useRef(!1), I = !h || g || !!h.closest("form"), [S = !1, x] = (0, r.b)({
                prop: o,
                defaultProp: l,
                onChange: p
            }), P = i.useRef(S);
            return i.useEffect(() => {
                let e = null == h ? void 0 : h.form;
                if (e) {
                    let t = () => x(P.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [h, x]), (0, s.jsxs)(y, {
                scope: a,
                state: S,
                disabled: u,
                children: [(0, s.jsx)(m.button, {
                    type: "button",
                    role: "checkbox",
                    "aria-checked": A(S) ? "mixed" : S,
                    "aria-required": c,
                    "data-state": E(S),
                    "data-disabled": u ? "" : void 0,
                    disabled: u,
                    value: d,
                    ...f,
                    ref: b,
                    onKeyDown: (0, r.d)(e.onKeyDown, e => {
                        "Enter" === e.key && e.preventDefault()
                    }),
                    onClick: (0, r.d)(e.onClick, e => {
                        x(e => !!A(e) || !e), I && (C.current = e.isPropagationStopped(), C.current || e.stopPropagation())
                    })
                }), I && (0, s.jsx)(w, {
                    control: h,
                    bubbles: !C.current,
                    name: n,
                    value: d,
                    checked: S,
                    required: c,
                    disabled: u,
                    form: g,
                    style: {
                        transform: "translateX(-100%)"
                    },
                    defaultChecked: !A(l) && l
                })]
            })
        });
    C.displayName = f;
    var I = "CheckboxIndicator",
        S = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...i
            } = e, o = b(I, a);
            return (0, s.jsx)(r.P, {
                present: n || A(o.state) || !0 === o.state,
                children: (0, s.jsx)(m.span, {
                    "data-state": E(o.state),
                    "data-disabled": o.disabled ? "" : void 0,
                    ...i,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    S.displayName = I;
    var w = e => {
        let t, {
                control: a,
                checked: n,
                bubbles: o = !0,
                defaultChecked: l,
                ...c
            } = e,
            u = i.useRef(null),
            d = (t = i.useRef({
                value: n,
                previous: n
            }), i.useMemo(() => (t.current.value !== n && (t.current.previous = t.current.value, t.current.value = n), t.current.previous), [n])),
            p = (0, r.e)(a);
        i.useEffect(() => {
            let e = u.current,
                t = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, "checked").set;
            if (d !== n && t) {
                let a = new Event("click", {
                    bubbles: o
                });
                e.indeterminate = A(n), t.call(e, !A(n) && n), e.dispatchEvent(a)
            }
        }, [d, n, o]);
        let g = i.useRef(!A(n) && n);
        return (0, s.jsx)("input", {
            type: "checkbox",
            "aria-hidden": !0,
            defaultChecked: null != l ? l : g.current,
            ...c,
            tabIndex: -1,
            ref: u,
            style: {
                ...e.style,
                ...p,
                position: "absolute",
                pointerEvents: "none",
                opacity: 0,
                margin: 0
            }
        })
    };

    function A(e) {
        return "indeterminate" === e
    }

    function E(e) {
        return A(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    let x = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        P = {
            XSmall: "",
            Small: "",
            Medium: "",
            Large: "padding-y-xxsmall"
        },
        R = {
            XSmall: "text-body-small",
            Small: "text-body-small",
            Medium: "text-body-medium",
            Large: "text-body-large"
        },
        O = {
            XSmall: "",
            Small: "padding-top-xxsmall",
            Medium: "padding-top-xxsmall",
            Large: "padding-top-xxsmall"
        };
    e.s(["Checkbox", 0, e => {
        var {
            label: a,
            className: r,
            isChecked: s,
            isDisabled: u,
            size: d,
            hint: p,
            placement: g,
            onCheckedChange: m,
            id: f
        } = e, h = (0, t._)(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]);
        let v = (0, l.default)(),
            y = f || v,
            b = a && i.default.createElement("label", {
                htmlFor: y,
                className: (0, n.default)("flex flex-col grow-1 gap-xsmall", !u && "cursor-pointer")
            }, i.default.createElement("span", {
                className: (0, n.default)(R[d], O[d], "content-emphasis")
            }, a), p && i.default.createElement("span", {
                className: "text-body-medium content-default"
            }, p));
        return i.default.createElement("div", {
            className: (0, n.default)("foundation-web-checkbox flex gap-medium", u && c.disabledOpacity, !u && "cursor-pointer", r)
        }, "End" === g && b, i.default.createElement("div", {
            className: (0, n.default)(P[d])
        }, i.default.createElement(C, Object.assign({
            "data-slot": "checkbox",
            className: (0, n.default)(x[d], o.interactable, !u && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: y,
            checked: s,
            disabled: u,
            onCheckedChange: m,
            "aria-label": a
        }, h), i.default.createElement(o.StateLayer, null), i.default.createElement(S, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(x[d], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
        }))), "Start" === g && b)
    }])
}, 642729, e => {
    "use strict";
    var t = e.i(443967),
        a = e.i(197649),
        n = e.i(416340),
        i = e.i(422711);
    e.i(511952), (0, i.s)("@keyframes progress-bar-slide{0%{left:0;width:0}28.57%{left:0;width:40%}71.43%{left:60%;width:40%}to{left:100%;width:0}}.foundation-web-progress-bar-indeterminate{animation:progress-bar-slide 2s linear infinite;background-color:var(--fui-future-alpha-color-system-progress);will-change:left,width}");
    let r = "text-label-medium",
        s = n.default.forwardRef((e, i) => {
            var {
                className: s,
                variant: o = "Determinate",
                value: l = 0,
                minValue: c,
                maxValue: u,
                valuesLocation: d = "None",
                ariaLabel: p
            } = e, g = (0, t._)(e, ["className", "variant", "value", "minValue", "maxValue", "valuesLocation", "ariaLabel"]);
            let m = "Determinate" === o,
                f = Math.min(100, Math.max(0, l)),
                h = m && void 0 !== c && "None" !== d,
                v = m && void 0 !== u && "None" !== d,
                y = "Sides" === d,
                b = n.default.createElement("div", {
                    className: (0, a.default)("relative height-100 radius-circle bg-shift-200", y ? "grow-1 shrink-1 min-width-0" : "block width-full"),
                    style: y ? {
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
                })),
                C = h && n.default.createElement("span", {
                    className: (0, a.default)("content-emphasis flex-shrink-0", r),
                    "aria-hidden": "true"
                }, c),
                I = v && n.default.createElement("span", {
                    className: (0, a.default)("content-emphasis flex-shrink-0", r),
                    "aria-hidden": "true"
                }, u),
                S = (h || v) && n.default.createElement("div", {
                    className: "flex justify-between width-full gap-xsmall"
                }, h ? C : n.default.createElement("span", null), v ? I : n.default.createElement("span", null));
            return n.default.createElement("div", Object.assign({
                ref: i,
                className: (0, a.default)("block width-full", s),
                role: "progressbar",
                "aria-label": p,
                "aria-valuemin": m ? 0 : void 0,
                "aria-valuemax": m ? 100 : void 0,
                "aria-valuenow": m ? f : void 0
            }, g), y ? n.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, C, b, I) : n.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === d && S, b, "Bottom" === d && S))
        });
    s.displayName = "ProgressBar", e.s(["ProgressBar", 0, s])
}, 766324, e => {
    "use strict";
    var t = e.i(196945);
    e.s(["SnackbarProvider", () => t.default])
}, 720808, 28064, e => {
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
    }], 28064);
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
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 720808)
}]);

//# debugId=2eb4c854-f268-ff41-f407-242d34b3a999
//# sourceMappingURL=4211cz2xhk_p0.js.map