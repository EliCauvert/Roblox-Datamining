;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "c70c2586-dd5a-e9d3-0676-3582b589096c")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 239328, e => {
    "use strict";
    var t = e.i(157700);
    let a = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "freeAvatarModuleStorePageLink",
            defaultValue: "#"
        }),
        n = (0, t.defineFlag)({
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
            name: "enableCreatorShowcases",
            defaultValue: !1
        }),
        s = (0, t.defineFlag)({
            namespace: "avatar-marketplace",
            name: "isAutoPublishPreferencesEnabled",
            defaultValue: !1
        });
    e.s(["enableCreatorShowcases", 0, o, "enableTaxonomyBasedCreatorDashboard", 0, r, "enableUgcFolders", 0, i, "freeAvatarModuleDocsPageLink", 0, n, "freeAvatarModuleStorePageLink", 0, a, "isAutoPublishPreferencesEnabled", 0, s])
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
        });
    e.s(["enableIpPlatformLicenseRecommendations", 0, n, "isExperiencePreviewEnabled", 0, a, "isIgnoreMatchEnabled", 0, s, "isImageAttachmentEnabledInLicenseApplication", 0, r, "isIpLicensingEarningsEnabled", 0, i, "isShowcaseExperiencesEnabled", 0, o])
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
        o = (0, t.defineFlag)({
            namespace: "creator-creations",
            name: "isMomentsFeedIdEnabled",
            defaultValue: !1
        });
    e.s(["isBadgeDefaultIconEnabled", 0, a, "isMomentsFeedIdEnabled", 0, o, "isMomentsSitetestUrlParsingEnabled", 0, i, "isMomentsUploadEnabled", 0, n, "isMomentsUploadLanguageSelectEnabled", 0, r])
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
}, 82899, e => {
    "use strict";
    let t = (0, e.i(157700).defineFlag)({
        namespace: "leaderboards",
        name: "isLeaderboardConfigsEnabled",
        defaultValue: !1
    });
    e.s(["isLeaderboardConfigsEnabled", 0, t])
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
        });
    e.s(["isProductArchiveEnabled", 0, o, "mockHardCodedPrices", 0, i, "mockManagedPricingEvents", 0, n, "mockManagedPricingProductWrites", 0, r, "mockManagedPricingSummary", 0, a])
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
        }, f = async () => {
            localStorage.setItem(d, JSON.stringify({
                dismissedAt: new Date().toISOString()
            }))
        }, m = (0, a.createContext)({
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
        } = (0, o.useSettings)(), [p, y] = (0, a.useState)(!0), [b, C] = (0, a.useState)("doNotShow"), {
            isFetched: S,
            user: w
        } = (0, n.useRobloxAuthentication)(), {
            unifiedLogger: I
        } = (0, r.useUnifiedLoggerProvider)(), {
            isHighPriority: E,
            isEnabled: A
        } = (0, a.useMemo)(() => {
            let e = h(c),
                t = h(u),
                a = h(d),
                n = new Date,
                i = l && e <= n && n < t;
            return {
                isHighPriority: a <= n,
                isEnabled: i
            }
        }, [l, u, c, d]), P = (0, a.useCallback)(async () => {
            await f(), y(!0)
        }, [y]);
        (0, a.useEffect)(() => {
            A && S && (null == w ? void 0 : w.id) && (async () => {
                let e = !1;
                try {
                    e = await g()
                } catch (e) {
                    I.logErrorEvent({
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
                    I.logErrorEvent({
                        eventName: i.default.AgeVerificationUpsellBannerError,
                        parameters: {
                            branch: "getEligibility",
                            error: e instanceof Error ? e.message : String(e)
                        }
                    })
                }
                C(t)
            })().catch(e => {
                I.logErrorEvent({
                    eventName: i.default.AgeVerificationUpsellBannerError,
                    parameters: {
                        branch: "runAsync",
                        error: e instanceof Error ? e.message : String(e)
                    }
                })
            })
        }, [A, S, w, I]);
        let x = (0, a.useMemo)(() => {
            let e = A && "doNotShow" !== b;
            return {
                isBannerVisible: e && !p,
                isBannerEligible: e,
                isHighPriority: E,
                variant: "doNotShow" !== b ? b : "ageVerification",
                dismissBanner: P
            }
        }, [A, b, p, E, P]);
        return (0, t.jsx)(m.Provider, {
            value: x,
            children: s
        })
    }, "useAgeVerificationUpsellContext", 0, () => (0, a.useContext)(m)], 906791)
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

    function g(e, t) {
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
                                    return g(e)
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
                                    return g(e)
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
        m = function(e) {
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
    e.s(["AcceptanceApi", 0, f, "AgreementResolutionApi", 0, m, "AgreementType", 0, {
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
            this.agreementResolutionApi = new m(e), this.acceptanceApi = new f(e)
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
        } = (0, n.useAuthentication)(), [u, d] = (0, a.useState)([]), [p, g] = (0, a.useState)(!1), [f, m] = (0, a.useState)(!0), [h, v] = (0, a.useState)(!1), y = (0, a.useCallback)(async () => {
            if (!p && (null == o ? void 0 : o.id) != null) try {
                v(!1), m(!0);
                let e = await i.creatorSettingsClient.getCreatorSettings(o.id.toString()),
                    t = (e => {
                        s(e);
                        for (let t = 0; t < e.length; t += 1) l(e[t].notificationCategoryName || "", e[t].notifications || []);
                        return e
                    })(e.categories || []);
                d(t), g(!0)
            } catch (e) {
                v(!0), g(!1)
            } finally {
                m(!1)
            }
        }, [null == o ? void 0 : o.id, p]), b = (0, a.useMemo)(() => ({
            notificationSettings: u,
            notificationsSettingsContextStored: p,
            notificationSettingsFailedToLoad: h,
            notificationSettingsContextLoading: f,
            getNotificationSettings: y,
            setNotificationSettings: d
        }), [u, h, y, f, p]);
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
        g = e.i(35298),
        f = e.i(777004),
        m = e.i(169722),
        h = e.i(199834),
        v = e.i(706442),
        y = e.i(196945),
        b = e.i(156071),
        C = e.i(790806),
        S = e.i(759283),
        w = e.i(384340);
    let I = (0, v.makeStyles)()(() => ({
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
                open: n,
                onClose: r,
                invitation: l
            } = e, {
                translate: c
            } = (0, i.useTranslation)(), {
                organization: u
            } = (0, w.default)(), {
                classes: {
                    dialogTitle: v,
                    dialogContent: E,
                    dialogSubActions: A
                }
            } = I(), {
                enqueue: P,
                close: x
            } = (0, y.useSnackbar)(), R = (0, a.useCallback)(e => {
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
            }, [P, x]), [O, U] = (0, a.useState)(), [T, k] = (0, a.useState)(), [L, N] = (0, a.useState)(), [z, F] = (0, a.useState)(), D = (0, a.useCallback)(async () => {
                if (null == l ? void 0 : l.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(l.senderUserId, 10));
                    N(e.name), F(!1)
                } catch (e) {
                    F(!0)
                }
            }, [l]), M = (0, a.useCallback)(async () => {
                if ((null == u ? void 0 : u.id) && (null == u ? void 0 : u.groupId)) try {
                    let e = await b.default.getGroupInfo(Number.parseInt(u.groupId, 10));
                    U(null == e ? void 0 : e.name)
                } catch (e) {
                    R(c("Error.GroupInformation"))
                }
            }, [null == u ? void 0 : u.groupId, null == u ? void 0 : u.id, R, c]);
            (0, a.useEffect)(() => {
                D(), M()
            }, [M, D]);
            let G = (0, a.useCallback)(() => {
                    r(void 0)
                }, [r]),
                V = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        k(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Declined
                            }), r(!1)
                        } catch (e) {
                            R(c("Error.DecliningInvitation")), k(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]),
                j = (0, a.useCallback)(async () => {
                    if ((null == l ? void 0 : l.organizationId) && (null == l ? void 0 : l.id)) {
                        k(!0);
                        try {
                            await o.default.invitationClient.acceptOrDeclineInvitation(l.organizationId, l.id, {
                                status: s.InvitationStatusType.Accepted
                            }), r(!0)
                        } catch (e) {
                            R(c("Error.AcceptingInvitation")), k(!1)
                        }
                    }
                }, [l.id, l.organizationId, r, R, c]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                children: [(0, t.jsx)(f.DialogContent, {
                    className: E,
                    children: (0, t.jsxs)(m.Grid, {
                        container: !0,
                        wrap: "wrap",
                        alignItems: "flex-start",
                        children: [(0, t.jsx)(m.Grid, {
                            container: !0,
                            children: (0, t.jsx)(h.Typography, {
                                variant: "h4",
                                className: v,
                                children: c("Label.JoinOrganization", {
                                    organizationName: null != O ? O : c("Label.Group")
                                })
                            })
                        }), (0, t.jsx)(m.Grid, {
                            container: !0,
                            children: (0, t.jsx)(h.Typography, {
                                variant: "body1",
                                children: z ? c("Message.JoinOrganizationWithoutUsername") : c("Message.JoinOrganization", {
                                    username: null != L ? L : ""
                                })
                            })
                        })]
                    })
                }), (0, t.jsx)(g.DialogActions, {
                    children: (0, t.jsxs)(m.Grid, {
                        container: !0,
                        justifyContent: "space-between",
                        children: [(0, t.jsx)(d.Button, {
                            variant: "outlined",
                            color: "primary",
                            size: "small",
                            onClick: G,
                            disabled: T,
                            children: c("Action.NotNow")
                        }), (0, t.jsxs)(m.Grid, {
                            className: A,
                            children: [(0, t.jsx)(d.Button, {
                                variant: "outlined",
                                color: "primary",
                                size: "small",
                                onClick: V,
                                disabled: T,
                                children: c("Action.Decline")
                            }), (0, t.jsx)(d.Button, {
                                variant: "contained",
                                color: "primaryBrand",
                                size: "small",
                                onClick: j,
                                loading: T,
                                children: c("Action.Accept")
                            })]
                        })]
                    })
                })]
            })
        }, [l.TranslationNamespace.Organization]),
        A = (0, v.makeStyles)()(() => ({
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
                    dialogTitle: c,
                    dialogContent: u,
                    dialogActions: v
                }
            } = A(), [y, b] = (0, a.useState)(), [S, w] = (0, a.useState)(), I = (0, a.useCallback)(async () => {
                if (null == o ? void 0 : o.senderUserId) try {
                    let e = await C.default.getUserById(Number.parseInt(o.senderUserId, 10));
                    b(e.name), w(!1)
                } catch (e) {
                    w(!0)
                }
            }, [o]);
            (0, a.useEffect)(() => {
                I()
            }, [I]);
            let E = (0, a.useCallback)(() => {
                r()
            }, [r]);
            return (0, t.jsxs)(p.Dialog, {
                maxWidth: "Medium",
                open: n,
                onClose: r,
                children: [(0, t.jsx)(f.DialogContent, {
                    className: u,
                    children: (0, t.jsxs)(m.Grid, {
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
                }), (0, t.jsx)(g.DialogActions, {
                    className: v,
                    children: (0, t.jsx)(m.Grid, {
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
        R = e.i(672401);
    let O = (0, i.withTranslation)(e => {
        let {
            children: i
        } = e, l = (0, n.useRouter)(), {
            user: d
        } = (0, r.useAuthentication)(), p = (0, u.useCurrentGroup)(), {
            currentItemGroupId: g
        } = (0, c.default)(), [f, m] = (0, a.useState)(), [h, v] = (0, a.useState)(), [y, b] = (0, a.useState)(), [C, S] = (0, a.useState)(!1), [w, I] = (0, a.useState)(!1), [A, O] = (0, a.useState)(), [U, T] = (0, a.useState)(!1), k = null == d ? void 0 : d.id, L = (0, a.useMemo)(() => {
            var e;
            return null != (e = null == p ? void 0 : p.id) ? e : g
        }, [p, g]), N = l.query[x.InviteQueryKey], z = l.isReady, F = (0, a.useCallback)(() => {
            n.default.push("https://create.".concat("roblox.com", "/dashboard/creations"))
        }, []), D = (0, a.useCallback)(async e => {
            if (!k) return void b(null);
            try {
                let t = await o.default.userClient.getUserInvitationByOrganization(e, k.toString());
                b(t)
            } catch (e) {
                b(null), F()
            }
        }, [k, F]), M = (0, a.useCallback)(async e => {
            if (!k) return void v(null);
            try {
                let t = await o.default.userClient.getUserPermissions(e, k.toString());
                v(t)
            } catch (e) {
                v(null)
            }
        }, [k]), G = (0, a.useCallback)(async () => {
            if (z) {
                I(!0);
                try {
                    if ("string" == typeof N) return void await D(N);
                    if (!L) return void m(null);
                    if (b(null), L) {
                        let e = await o.default.organizationClient.getOrganization(L.toString());
                        m(e), await M(e.id)
                    } else m(void 0);
                    S(!1)
                } catch (e) {
                    m(null), v(null), b(null)
                } finally {
                    I(!1)
                }
            }
        }, [L, D, M, N, z]), V = (0, a.useCallback)(() => {
            S(!0), G()
        }, [G]), j = (0, a.useCallback)(async () => {
            (null == f ? void 0 : f.id) && await M(null == f ? void 0 : f.id)
        }, [M, null == f ? void 0 : f.id]), B = (0, a.useMemo)(() => ({
            organization: f,
            permissions: h,
            refreshOrganization: V,
            refreshPermission: j,
            isOrganizationRefreshRequired: C,
            isOrganizationLoading: w
        }), [f, h, V, j, C, w]);
        return (0, a.useEffect)(() => {
            G()
        }, [G]), (0, t.jsx)(R.default.Provider, {
            value: B,
            children: (0, t.jsxs)(t.Fragment, {
                children: [i, y && (0, t.jsxs)(t.Fragment, {
                    children: [(0, t.jsx)(E, {
                        open: y.invitationStatusType === s.InvitationStatusType.Open && void 0 === A,
                        onClose: e => {
                            !0 === e ? (O(!0), T(!0)) : !1 === e ? (O(!1), T(!0)) : (F(), b(null))
                        },
                        invitation: y
                    }), (0, t.jsx)(P, {
                        open: U,
                        onClose: () => {
                            T(!1), !0 === A && V(), F()
                        },
                        invitation: y,
                        accepted: !0 === A
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
        } = d(), [u, g] = (0, i.useLocalStorage)("creatorHubGroups.".concat(null == o ? void 0 : o.id), null), [f, m] = (0, i.useLocalStorage)("creatorHubGroup.".concat(null == o ? void 0 : o.id), null), [h, v] = (0, i.useLocalStorage)("creatorHubGroupData.".concat(null == o ? void 0 : o.id), {}), y = (0, a.useCallback)(e => {
            m(e);
            let t = null === e ? "user" : e;
            v(e => {
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
        }, [m, v]), b = (0, a.useMemo)(() => {
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
            (null == o ? void 0 : o.id) && (null == s ? void 0 : s.groups) && !l && g(null == s ? void 0 : s.groups)
        }, [null == s ? void 0 : s.groups, b, l, g, null == o ? void 0 : o.id]);
        let S = (0, a.useMemo)(() => ({
            groups: b,
            currentGroup: C,
            groupData: h,
            isFetched: !l && !!(null == o ? void 0 : o.id),
            refreshGroups: c,
            setCurrentGroup: y
        }), [C, h, b, l, c, y, null == o ? void 0 : o.id]);
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
    class i extends t.TranslationResourceProviderBase {
        async loadRuntimeLocaleInfo() {
            let {
                generalExperience: e
            } = await a.default.getUserLocalizationLocusSupportedLocales(), i = null == e ? void 0 : e.locale;
            if (void 0 === i) return this.defaultLocaleInfo;
            if (i in n) {
                let e = n[i],
                    a = (0, t.toLocaleNativeName)(e);
                return {
                    locale: e,
                    nativeName: a
                }
            }
            return console.warn("Unexpected locale ".concat(i, " received, fallback to default locale")), this.defaultLocaleInfo
        }
        async fetchTranslationResource(e, a) {
            let n = (0, t.toRobloxLocaleCode)(a),
                i = "https://translations-cdn.".concat("roblox.com", "/10/latest/").concat(n, "/").concat(e, ".json");
            return Object.fromEntries(Object.entries(await fetch(i).then(e => e.json())).map(e => {
                var t;
                let [a, n] = e;
                return [a, null != (t = null == n ? void 0 : n.localizedString) ? t : null]
            }))
        }
        async loadLocalOverrides(e, t) {
            try {
                let a = await fetch("/locales/".concat(t, "/").concat(e, ".json"));
                if (!a.ok) return {};
                let n = await a.json();
                if (0 === Object.keys(n).length) return {};
                return n
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
}, 222563, e => {
    "use strict";
    var t = e.i(443967);
    e.i(511952);
    var a = e.i(422711),
        n = e.i(197649),
        i = e.i(416340),
        r = e.i(840934);
    e.i(149285);
    var o = e.i(221628),
        s = e.i(46079),
        l = e.i(610160),
        c = e.i(183906);
    (0, a.s)(".data-\\[state\\=unchecked\\]\\:stroke-contrast-alpha[data-state=unchecked]{border-color:var(--color-stroke-contrast-alpha)}");
    var u = i.forwardRef((e, t) => {
        let {
            children: a,
            ...n
        } = e, r = i.Children.toArray(a), s = r.find(g);
        if (s) {
            let e = s.props.children,
                a = r.map(t => t === s ? i.Children.count(e) > 1 ? i.Children.only(null) : i.isValidElement(e) ? e.props.children : null : t);
            return (0, o.jsx)(d, {
                ...n,
                ref: t,
                children: i.isValidElement(e) ? i.cloneElement(e, void 0, a) : null
            })
        }
        return (0, o.jsx)(d, {
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
            var o, s;
            let e, l = (e = null == (o = Object.getOwnPropertyDescriptor(a.props, "ref")) ? void 0 : o.get) && "isReactWarning" in e && e.isReactWarning ? a.ref : (e = null == (s = Object.getOwnPropertyDescriptor(a, "ref")) ? void 0 : s.get) && "isReactWarning" in e && e.isReactWarning ? a.props.ref : a.props.ref || a.ref,
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
        return (0, o.jsx)(o.Fragment, {
            children: t
        })
    };

    function g(e) {
        return i.isValidElement(e) && e.type === p
    }
    var f = ["a", "button", "div", "form", "h2", "h3", "img", "input", "label", "li", "nav", "ol", "p", "span", "svg", "ul"].reduce((e, t) => {
            let a = i.forwardRef((e, a) => {
                let {
                    asChild: n,
                    ...i
                } = e, r = n ? u : t;
                return "u" > typeof window && (window[Symbol.for("radix-ui")] = !0), (0, o.jsx)(r, {
                    ...i,
                    ref: a
                })
            });
            return a.displayName = "Primitive.".concat(t), {
                ...e,
                [t]: a
            }
        }, {}),
        m = "Checkbox",
        [h, v] = (0, r.a)(m),
        [y, b] = h(m),
        C = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                name: n,
                checked: s,
                defaultChecked: l,
                required: c,
                disabled: u,
                value: d = "on",
                onCheckedChange: p,
                form: g,
                ...m
            } = e, [h, v] = i.useState(null), b = (0, r.u)(t, e => v(e)), C = i.useRef(!1), S = !h || g || !!h.closest("form"), [w = !1, P] = (0, r.b)({
                prop: s,
                defaultProp: l,
                onChange: p
            }), x = i.useRef(w);
            return i.useEffect(() => {
                let e = null == h ? void 0 : h.form;
                if (e) {
                    let t = () => P(x.current);
                    return e.addEventListener("reset", t), () => e.removeEventListener("reset", t)
                }
            }, [h, P]), (0, o.jsxs)(y, {
                scope: a,
                state: w,
                disabled: u,
                children: [(0, o.jsx)(f.button, {
                    type: "button",
                    role: "checkbox",
                    "aria-checked": E(w) ? "mixed" : w,
                    "aria-required": c,
                    "data-state": A(w),
                    "data-disabled": u ? "" : void 0,
                    disabled: u,
                    value: d,
                    ...m,
                    ref: b,
                    onKeyDown: (0, r.d)(e.onKeyDown, e => {
                        "Enter" === e.key && e.preventDefault()
                    }),
                    onClick: (0, r.d)(e.onClick, e => {
                        P(e => !!E(e) || !e), S && (C.current = e.isPropagationStopped(), C.current || e.stopPropagation())
                    })
                }), S && (0, o.jsx)(I, {
                    control: h,
                    bubbles: !C.current,
                    name: n,
                    value: d,
                    checked: w,
                    required: c,
                    disabled: u,
                    form: g,
                    style: {
                        transform: "translateX(-100%)"
                    },
                    defaultChecked: !E(l) && l
                })]
            })
        });
    C.displayName = m;
    var S = "CheckboxIndicator",
        w = i.forwardRef((e, t) => {
            let {
                __scopeCheckbox: a,
                forceMount: n,
                ...i
            } = e, s = b(S, a);
            return (0, o.jsx)(r.P, {
                present: n || E(s.state) || !0 === s.state,
                children: (0, o.jsx)(f.span, {
                    "data-state": A(s.state),
                    "data-disabled": s.disabled ? "" : void 0,
                    ...i,
                    ref: t,
                    style: {
                        pointerEvents: "none",
                        ...e.style
                    }
                })
            })
        });
    w.displayName = S;
    var I = e => {
        let t, {
                control: a,
                checked: n,
                bubbles: s = !0,
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
                    bubbles: s
                });
                e.indeterminate = E(n), t.call(e, !E(n) && n), e.dispatchEvent(a)
            }
        }, [d, n, s]);
        let g = i.useRef(!E(n) && n);
        return (0, o.jsx)("input", {
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

    function E(e) {
        return "indeterminate" === e
    }

    function A(e) {
        return E(e) ? "indeterminate" : e ? "checked" : "unchecked"
    }
    let P = {
            XSmall: "size-400",
            Small: "size-500",
            Medium: "size-600",
            Large: "size-600"
        },
        x = {
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
            isChecked: o,
            isDisabled: u,
            size: d,
            hint: p,
            placement: g,
            onCheckedChange: f,
            id: m
        } = e, h = (0, t._)(e, ["label", "className", "isChecked", "isDisabled", "size", "hint", "placement", "onCheckedChange", "id"]);
        let v = (0, l.default)(),
            y = m || v,
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
            className: (0, n.default)(x[d])
        }, i.default.createElement(C, Object.assign({
            "data-slot": "checkbox",
            className: (0, n.default)(P[d], s.interactable, !u && "cursor-pointer", "flex items-center justify-center radius-small padding-none content-default", "data-[state=unchecked]:bg-none data-[state=unchecked]:stroke-standard data-[state=unchecked]:stroke-contrast-alpha", "data-[state=indeterminate]:bg-system-contrast data-[state=indeterminate]:stroke-none", "data-[state=checked]:bg-system-contrast data-[state=checked]:stroke-none"),
            id: y,
            checked: o,
            disabled: u,
            onCheckedChange: f,
            "aria-label": a
        }, h), i.default.createElement(s.StateLayer, null), i.default.createElement(w, {
            "data-slot": "checkbox-indicator",
            className: (0, n.default)(P[d], "content-[var(--inverse-content-emphasis)] icon", "data-[state=indeterminate]:icon-filled-minus", "data-[state=checked]:icon-filled-check")
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
        o = n.default.forwardRef((e, i) => {
            var {
                className: o,
                variant: s = "Determinate",
                value: l = 0,
                minValue: c,
                maxValue: u,
                valuesLocation: d = "None",
                ariaLabel: p
            } = e, g = (0, t._)(e, ["className", "variant", "value", "minValue", "maxValue", "valuesLocation", "ariaLabel"]);
            let f = "Determinate" === s,
                m = Math.min(100, Math.max(0, l)),
                h = f && void 0 !== c && "None" !== d,
                v = f && void 0 !== u && "None" !== d,
                y = "Sides" === d,
                b = n.default.createElement("div", {
                    className: (0, a.default)("relative height-100 radius-circle bg-shift-200", y ? "grow-1 shrink-1 min-width-0" : "block width-full"),
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
                })),
                C = h && n.default.createElement("span", {
                    className: (0, a.default)("content-emphasis flex-shrink-0", r),
                    "aria-hidden": "true"
                }, c),
                S = v && n.default.createElement("span", {
                    className: (0, a.default)("content-emphasis flex-shrink-0", r),
                    "aria-hidden": "true"
                }, u),
                w = (h || v) && n.default.createElement("div", {
                    className: "flex justify-between width-full gap-xsmall"
                }, h ? C : n.default.createElement("span", null), v ? S : n.default.createElement("span", null));
            return n.default.createElement("div", Object.assign({
                ref: i,
                className: (0, a.default)("block width-full", o),
                role: "progressbar",
                "aria-label": p,
                "aria-valuemin": f ? 0 : void 0,
                "aria-valuemax": f ? 100 : void 0,
                "aria-valuenow": f ? m : void 0
            }, g), y ? n.default.createElement("div", {
                className: "flex items-center gap-small width-full"
            }, C, b, S) : n.default.createElement("div", {
                className: "flex flex-col gap-small width-full"
            }, "Top" === d && w, b, "Bottom" === d && w))
        });
    o.displayName = "ProgressBar", e.s(["ProgressBar", 0, o])
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
            g = p[0],
            f = p[1],
            m = (0, a.useState)([]),
            h = m[0],
            v = m[1],
            y = (0, a.useCallback)(function(e, a) {
                void 0 === e && (e = {}), void 0 === a && (a = function() {
                    return !0
                }), v(function(n) {
                    return (0, t.b)((0, t.b)([], n, !0), [{
                        props: e,
                        shouldClose: a
                    }], !1)
                })
            }, [v]),
            b = (0, a.useCallback)(function() {
                f(!1)
            }, [f]);
        (0, a.useEffect)(function() {
            h.length > 0 && f(!0)
        }, [h.length]);
        var C = (0, a.useMemo)(function() {
            return {
                ref: d,
                enqueue: y,
                close: b
            }
        }, [b, y]);
        return a.default.createElement(a.default.Fragment, null, a.default.createElement(i.Provider, {
            value: C
        }, c), a.default.createElement(n.S, (0, t._)({}, (null == (r = h[0]) ? void 0 : r.props) || {}, u, {
            TransitionProps: (0, t._)((0, t._)({}, (null == (s = null == (o = h[0]) ? void 0 : o.props) ? void 0 : s.TransitionProps) || {}), {
                onExited: function(e) {
                    var a, n, i, r;
                    v(function(e) {
                        var a = e.slice(1);
                        return (0, t.b)([], a, !0)
                    }), (null == (n = null == (a = h[0]) ? void 0 : a.props.TransitionProps) ? void 0 : n.onExited) && (null == (r = null == (i = h[0]) ? void 0 : i.props.TransitionProps) || r.onExited(e))
                }
            }),
            onClose: function(e, t) {
                var a, n, i;
                (null == (a = h[0]) ? void 0 : a.shouldClose(t)) && f(!1), (null == (n = h[0]) ? void 0 : n.props.onClose) && (null == (i = h[0]) || i.props.onClose(e, t))
            },
            open: g
        }), null == (l = h[0]) ? void 0 : l.props.children))
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
    }, "translationConfig", 0, ["Feature.NotApproved", "Feature.AppealsPortal", "Feature.InExperienceIntervention", "Feature.UniversalFeatureRestrictions"]], 720808)
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
        } = e, d = null != (o = null == c ? void 0 : c.tags) ? o : n, p = null == c ? void 0 : c.rosId, g = (0, t.useMemo)(() => ({
            tags: d,
            rosId: p,
            path: u
        }), [d, p, u]), f = (0, t.useRef)(g), m = (0, t.useRef)(g);
        (0, t.useLayoutEffect)(() => {
            m.current = g, void 0 === f.current.path && void 0 !== g.path && (f.current = {
                ...f.current,
                path: g.path
            })
        }, [g]), (0, t.useLayoutEffect)(() => {
            let e = e => {
                var t;
                let a, n = (a = null == (t = e.parameters) ? void 0 : t.metricName, "webvitals" === e.eventType && void 0 !== a && r.has(a)) ? f.current : m.current;
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
        let h = (0, t.useMemo)(() => ({
            unifiedLogger: l,
            pageContext: g
        }), [l, g]);
        return t.default.createElement(a.Provider, {
            value: h
        }, s)
    }, "useUnifiedLoggerProvider", 0, function() {
        let e = (0, t.useContext)(a);
        if (null === e) throw Error("useUnifiedLoggerProvider must be used within a UnifiedLoggerProvider");
        return e
    }])
}]);

//# debugId=c70c2586-dd5a-e9d3-0676-3582b589096c
//# sourceMappingURL=2m872mobz08xx.js.map