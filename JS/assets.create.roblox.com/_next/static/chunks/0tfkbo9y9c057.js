;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "13b6f21a-be66-1cd9-fd2e-fd997a8c6588")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 272593, 650502, e => {
    "use strict";
    var t = e.i(677753),
        a = e.i(215955);

    function i(e) {
        return "https://".concat(e, ".").concat("roblox.com")
    }

    function n(e) {
        return "".concat("https://apis.roblox.com", "/").concat(e)
    }
    e.s(["getBEDEV1ServiceBasePath", 0, i, "getBEDEV2ServiceBasePath", 0, n], 650502), e.s(["createClientConfiguration", 0, function(e, r, s) {
        var o, c;
        let l = "bedev1" === r ? i(e) : n(e),
            d = null == (o = null == s ? void 0 : s.enableMrRouter) || o;
        return new t.Configuration({
            robloxSiteDomain: "roblox.com",
            basePath: l,
            credentials: null != (c = null == s ? void 0 : s.credentials) ? c : "include",
            unifiedLogger: a.default,
            enableMrRouter: d,
            ...(null == s ? void 0 : s.middleware) && {
                middleware: s.middleware
            },
            ...(null == s ? void 0 : s.enableBoundAuthToken) !== void 0 && {
                enableBoundAuthToken: s.enableBoundAuthToken
            },
            ...(null == s ? void 0 : s.boundAuthTokenLoadTimeout) !== void 0 && {
                boundAuthTokenLoadTimeout: s.boundAuthTokenLoadTimeout
            },
            ...(null == s ? void 0 : s.boundAuthTokenDataTimeout) !== void 0 && {
                boundAuthTokenDataTimeout: s.boundAuthTokenDataTimeout
            }
        })
    }], 272593)
}, 889311, e => {
    "use strict";
    var t, a = ((t = a || {}).DownloadStudio = "downloadStudio", t.ExportKpiChart = "exportKpiChart", t.ViewComputeTab = "viewComputeTab", t.DateRangeChanged = "dateRangeChanged", t.DataDivisionChanged = "dataDivisionChanged", t.PageBreakdownsToggled = "pageBreakdownsToggled", t.PageVersionAnnotationsToggled = "pageVersionAnnotationsToggled", t.PageFiltersChanged = "pageFiltersChanged", t.ChartTooltipViewed = "chartTooltipViewed", t.PageTabSelected = "pageTabSelected", t.RbxClientRequest = "rbxClientRequest", t.StudioStartAttempt = "studioStartAttempt", t.StudioStartSuccess = "studioStartSuccess", t.ViewTranslatorPortal = "viewTranslatorPortal", t.ViewLocalization = "viewLocalization", t.SelectAddSupportedLanguage = "selectAddSupportedLanguage", t.ManageSupportedLanguage = "manageSupportedLanguage", t.LearnMoreAutomaticQuota = "learnMoreAutomaticQuota", t.ShareLinkTranslators = "shareLinkTranslators", t.SelectInviteTranslators = "selectInviteTranslators", t.InviteTranslatorsModel = "inviteTranslatorsModel", t.DownloadContributorReport = "downloadContributorReport", t.AutomaticTextCaptureToggled = "automaticTextCaptureToggled", t.UseTranslatedContentToggled = "useTranslatedContentToggled", t.ClearAutoCapturedTable = "clearAutoCapturedTable", t.OpenSwitchOffAutomaticTranslationConfirmDialogue = "openSwitchOffAutomaticTranslationConfirmDialogue", t.SwitchOffAutomaticTranslation = "switchOffAutomaticTranslation", t.SwitchOnAutomaticTranslation = "switchOnAutomaticTranslation", t.UpdateUniverseInformation = "updateUniverseInformation", t.SelectAddTranslationEntry = "selectAddTranslationEntry", t.AddTranslationEntry = "addTranslationEntry", t.SearchTranslationEntryList = "searchTranslationEntryList", t.FilterTranslationEntryList = "filterTranslationEntryList", t.FilterTranslationProductList = "filterTranslationProductList", t.UpdateGameProductTranslation = "updateGameProductTranslation", t.UpdateGameProductIcon = "updateGameProductIcon", t.UpdateUniverseIconAndThumbnail = "updateUniverseIconAndThumbnail", t.ViewNotifications = "viewNotifications", t.NotificationStringListLoaded = "notificationStringListLoaded", t.GetNotificationStringsList = "getNotificationStringsList", t.GetNotificationStringsListSuccess = "getNotificationStringsListSuccess", t.GetNotificationStringsListFailure = "getNotificationStringsListFailure", t.GetNotificationString = "getNotificationString", t.GetNotificationStringSuccess = "getNotificationStringSuccess", t.GetNotificationStringFailure = "getNotificationStringFailure", t.ArchiveNotificationContent = "archiveNotificationContent", t.ArchiveNotificationContentSuccess = "archiveNotificationContentSuccess", t.ArchiveNotificationContentFailure = "archiveNotificationContentFailure", t.CopyNotificationContentAssetId = "copyNotificationContentAssetId", t.CreateNotificationContent = "createNotificationContent", t.CreateNotificationContentSuccess = "createNotificationContentSuccess", t.CreateNotificationContentFailure = "createNotificationContentFailure", t.InitiateCreateNotificationContent = "initiateCreateNotificationContent", t.InitiateEditNotificationContent = "initiateEditNotificationContent", t.EditNotificationStringLoaded = "editNotificationStringLoaded", t.EditNotificationContent = "editNotificationContent", t.EditNotificationContentSuccess = "editNotificationContentSuccess", t.EditNotificationContentFailure = "editNotificationContentFailure", t.ViewNotificationCampaignAnalytics = "viewNotificationCampaignAnalytics", t.AssetCreationAttempt = "assetCreationAttempt", t.AssetCreationFailure = "assetCreationFailure", t.EventCreationExposure = "exposedToEventCreation", t.EventCreationInitiated = "initiateEventCreation", t.EventCreationDiscarded = "discardUnsavedEventChanges", t.EventCreationSaveDraft = "saveEventAsDraft", t.EventCreationDeleteDraft = "deleteEventDraft", t.EventCreationPublish = "publishEvent", t.EventCreationLinkCopied = "virtualEventLinkCopied", t.NotificationsSettingsCategoryLoad = "notificationSettingsCategoryLoad", t.NotificationsSettingsLeftNavClick = "notificationSettingsLeftNavClick", t.NotificationsSettingsCategoryCancelClick = "notificationsSettingsCategoryCancelClick", t.DocumentationLanguageChanged = "documentationLanguageChanged", t.ClickMarketplaceOnboardingCountry = "clickMarketplaceOnboardingCountry", t.ImpressionCreatorOpportunityTable = "impressionCreatorOpportunityTable", t.ClickCreatorOpportunityTable = "clickCreatorOpportunityTable", t.ClickShareLinkPromoApplyNow = "clickShareLinkPromoApplyNow", t.RightsManagerSearchClick = "rightsManagerSearchClick", t.RightsManagerSearchResultClick = "rightsManagerSearchResultClick", t.RightsManagerSearchResultSubmitted = "rightsManagerSearchResultSubmitted", t.RightsManagerSearchResultsLoad = "rightsManagerSearchResultsLoad", t.RightsManagerSearchResultsEnd = "rightsManagerSearchResultsEnd", t.DownloadPlayerFeedbackCommentsClick = "downloadPlayerFeedbackCommentsClick", t.PageNotFound = "pageNotFound", t.PageNotFoundReturnButtonClick = "pageNotFoundReturnButtonClick", t.PlayerFeedbackSummaryClick = "playerFeedbackSummaryClick", t.AgeVerificationUpsellBanner = "ageVerificationUpsellBanner", t.AgeVerificationUpsellBannerClick = "ageVerificationUpsellBannerClick", t.AgeVerificationUpsellBannerError = "ageVerificationUpsellBannerError", t.BetaTaxonomyToggle = "betaTaxonomyToggle", t.AssetPrivacyOptOutSurveySubmitted = "assetPrivacyOptOutSurveySubmitted", t.TalentHubV2JobCardClick = "talentHubV2JobCardClick", t.UnratedExperienceBanner = "unratedExperienceBanner", t.UnratedExperienceBannerClick = "unratedExperienceBannerClick", t.ActivationEligibilityBanner = "activationEligibilityBanner", t.ActivationEligibilityBannerClick = "activationEligibilityBannerClick", t.UnifiedAlertImpression = "unifiedAlertImpression", t.UnifiedAlertClick = "unifiedAlertClick", t.TalentHubV2FilterChange = "talentHubV2FilterChange", t.TalentHubV2ApplyClick = "talentHubV2ApplyClick", t.TalentHubV2StudioCardClick = "talentHubV2StudioCardClick", t.TalentHubV2ProfileSave = "talentHubV2ProfileSave", t.TalentHubV2InboxRowClick = "talentHubV2InboxRowClick", t.TalentHubV2JobsPageView = "talentHubV2JobsPageView", t.TalentHubV2StudiosPageView = "talentHubV2StudiosPageView", t.TalentHubV2StudioProfilePageView = "talentHubV2StudioProfilePageView", t.TalentHubV2TalentProfilePageView = "talentHubV2TalentProfilePageView", t.TalentHubV2InboxPageView = "talentHubV2InboxPageView", t.TalentHubV2PostJobPageView = "talentHubV2PostJobPageView", t.TalentHubV2JobPostSubmit = "talentHubV2JobPostSubmit", t.TalentHubV2JobEditSubmit = "talentHubV2JobEditSubmit", t.CreatorStoreCustomThumbnailUpload = "creatorStoreCustomThumbnailUpload", t.StatusBadgeClick = "statusBadgeClick", t.StatusBadgeImpression = "statusBadgeImpression", t.StatusBadgeTooltipOpen = "statusBadgeTooltipOpen", t.PublishEligibilityBannerImpression = "publishEligibilityBannerImpression", t.PublishEligibilityBannerClick = "publishEligibilityBannerClick", t.AudienceReachGrowthOpportunitiesBannerImpression = "audienceReachGrowthOpportunitiesBannerImpression", t.AudienceReachGrowthOpportunitiesBannerClick = "audienceReachGrowthOpportunitiesBannerClick", t.TalentHubV2ApplicationSubmit = "talentHubV2ApplicationSubmit", t.TalentHubV2ProfileCreate = "talentHubV2ProfileCreate", t.TalentHubV2ApplicantStatusChange = "talentHubV2ApplicantStatusChange", t.TalentHubV2JobClose = "talentHubV2JobClose", t.TalentHubV2CreateStudioSubmit = "talentHubV2CreateStudioSubmit", t.TalentHubV2CreateStudioSuccess = "talentHubV2CreateStudioSuccess", t.TalentHubV2CreateStudioError = "talentHubV2CreateStudioError", t.TalentHubV2InteractionClick = "talentHubV2InteractionClick", t.ImpactedExperiencesBanner = "impactedExperiencesBanner", t.ImpactedExperiencesBannerClick = "impactedExperiencesBannerClick", t.ImpactedExperiencesFilterClick = "impactedExperiencesFilterClick", t.ImpactedExperienceCardCollaborateClick = "impactedExperienceCardCollaborateClick", t.ImpactedExperiencesLoadMoreClick = "impactedExperiencesLoadMoreClick", t.ImpactedBannerScoutStart = "impactedBannerScoutStart", t.ImpactedBannerScoutFound = "impactedBannerScoutFound", t.ImpactedBannerScoutGaveUp = "impactedBannerScoutGaveUp", t.EstablishTrustDialog = "establishTrustDialog", t.EstablishTrustDialogClick = "establishTrustDialogClick", t.SafetyCollaboratorsImpression = "safetyCollaboratorsImpression", t.SafetyCollaboratorsClick = "safetyCollaboratorsClick", t.SafetyCollaboratorsError = "safetyCollaboratorsError", t.MomentsCreationsAttempt = "momentsCreationsAttempt", t.MomentsCreationsSuccess = "momentsCreationsSuccess", t.MomentsCreationsError = "momentsCreationsError", t.RoadmapDetailFeedbackSubmit = "roadmapDetailFeedbackSubmit", t.RoadmapPageView = "roadmapPageView", t.RoadmapItemClick = "roadmapItemClick", t.RoadmapFilterApplied = "roadmapFilterApplied", t.RoadmapFeedbackOpen = "roadmapFeedbackOpen", t.RoadmapFeedbackClose = "roadmapFeedbackClose", t.RoadmapItemImpression = "roadmapItemImpression", t.RoadmapItemLikeToggle = "roadmapItemLikeToggle", t.CreatorInventoryPageView = "creatorInventoryPageView", t.CreatorInventoryItemImpression = "creatorInventoryItemImpression", t.CreatorInventoryItemClick = "creatorInventoryItemClick", t.CreatorInventorySearch = "creatorInventorySearch", t.CreatorInventoryFilter = "creatorInventoryFilter", t.CreatorInventoryAssetTypeChange = "creatorInventoryAssetTypeChange", t.CreatorInventoryViewChange = "creatorInventoryViewChange", t.CreatorInventoryPagination = "creatorInventoryPagination", t.CreatorInventoryMenuOpen = "creatorInventoryMenuOpen", t.CreatorInventoryMenuAction = "creatorInventoryMenuAction", t.CreatorInventoryRetry = "creatorInventoryRetry", t);
    e.s(["default", 0, a])
}, 215955, 512229, e => {
    "use strict";
    var t = e.i(710675),
        a = e.i(721281),
        i = e.i(252842),
        n = e.i(95656),
        r = e.i(889311);
    let s = "https://ecsv2.".concat("roblox.com"),
        o = "".concat(s, "/CreatorDashboard"),
        c = ["loadPage", r.default.AssetPrivacyOptOutSurveySubmitted],
        l = new class {
            setUnifiedLoggerClient(e) {
                this.unifiedLoggerClient = e
            }
            shouldDoubleWriteToUnifiedLogger(e) {
                return !(!this.unifiedLoggerClient || c.includes(e.eventType))
            }
            sendEventToUnifiedLogger(e) {
                if (!this.unifiedLoggerClient) return;
                let t = {},
                    a = e.additionalProperties || {};
                Object.keys(a).forEach(e => {
                    let i = a[e];
                    null != i && (t[e] = i.toString())
                });
                let i = {
                    eventName: e.eventType,
                    parameters: t
                };
                "load" === e.context ? this.unifiedLoggerClient.logImpressionEvent(i) : "hover" === e.context ? this.unifiedLoggerClient.logHoverEvent(i) : "click" === e.context && this.unifiedLoggerClient.logClickEvent(i)
            }
            sendEvent(e) {
                let t = (0, i.getCookieValueByKey)("GuestData"),
                    a = null == t ? void 0 : t.split("=")[1],
                    n = {
                        target: "CreatorDashboard",
                        localTime: new Date,
                        eventType: e.eventType,
                        context: e.context,
                        guestId: a,
                        additionalProperties: e.additionalProperties
                    };
                return this.shouldDoubleWriteToUnifiedLogger(n) && this.sendEventToUnifiedLogger(n), this.tracker.sendEventViaImg(n)
            }
            constructor() {
                (0, a._)(this, "tracker", void 0), (0, a._)(this, "unifiedLoggerClient", void 0);
                const e = new n.Configuration({
                    baseUrl: o
                });
                this.tracker = new n.Tracker(e)
            }
        };
    e.s(["default", 0, l, "eventStreamBaseUrl", 0, s], 512229);
    let d = /experiences\/.+\/access\/*$/,
        g = /experiences\/.+\/(associated-items\?activeTab=Pass|passes)\/?/,
        u = /experiences\/.+\/permissions\/*$/,
        p = /store\/.+\/permissions\/*$/,
        h = /events\/.+\/configure\/*$/,
        m = /experiences\/.+\/feedback\/*$/,
        v = /explore\/licenses\/.+\/*$/,
        b = /explore\/licenses\/.+\/.+\/request$/,
        C = /license-manager\/agreements\/.+\/*$/,
        y = /license-manager\/license-listings\/.+\/*$/,
        f = /license-manager\/creator-agreements\/.+\/*$/,
        S = /ip\/ip-library\/.+\/*$/,
        T = new t.UnifiedLogger({
            eventBaseUrl: s,
            product: "CreatorDashboard",
            sessionProductGroup: "CreatorHub"
        }),
        w = /experiences\/\d+\/(analytics|monetization)\/([^/]+)\/*$/,
        E = [{
            regex: /analytics\/*$/,
            matchGroups: [],
            tags: ["analytics", "analytics/home"]
        }, {
            regex: /experiences\/\d+\/overview\/*$/,
            matchGroups: [],
            tags: ["analytics", "analytics/overview", "analytics/overview/experience-overview"]
        }, {
            regex: w,
            matchGroups: ["analytics", "retention"],
            tags: ["analytics", "analytics/overview", "analytics/overview/retention"]
        }, {
            regex: w,
            matchGroups: ["analytics", "engagement"],
            tags: ["analytics", "analytics/overview", "analytics/overview/engagement"]
        }, {
            regex: w,
            matchGroups: ["analytics", "acquisition"],
            tags: ["analytics", "analytics/overview", "analytics/overview/acquisition"]
        }, {
            regex: w,
            matchGroups: ["analytics", "audience"],
            tags: ["analytics", "analytics/overview", "analytics/overview/audience"]
        }, {
            regex: w,
            matchGroups: ["analytics", "economy"],
            tags: ["analytics", "analytics/overview", "analytics/overview/economy"]
        }, {
            regex: w,
            matchGroups: ["analytics", "funnels"],
            tags: ["analytics", "analytics/overview", "analytics/overview/funnels"]
        }, {
            regex: w,
            matchGroups: ["monetization", "overview"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/overview"]
        }, {
            regex: w,
            matchGroups: ["monetization", "developer-products"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/developer-products"]
        }, {
            regex: w,
            matchGroups: ["monetization", "passes"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/passes"]
        }, {
            regex: w,
            matchGroups: ["monetization", "avatar-items"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/avatar-items"]
        }, {
            regex: w,
            matchGroups: ["monetization", "immersive-ads"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/immersive-ads"]
        }, {
            regex: w,
            matchGroups: ["monetization", "subscriptions"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/subscriptions"]
        }, {
            regex: w,
            matchGroups: ["monetization", "engagement-payouts"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/engagement-payouts"]
        }, {
            regex: w,
            matchGroups: ["analytics", "performance"],
            tags: ["analytics", "analytics/monitoring", "analytics/monitoring/performance"]
        }, {
            regex: w,
            matchGroups: ["analytics", "errors"],
            tags: ["analytics", "analytics/monitoring", "analytics/monitoring/errors"]
        }, {
            regex: w,
            matchGroups: ["analytics", "memory-stores"],
            tags: ["analytics", "analytics/monitoring", "analytics/monitoring/memory-stores"]
        }],
        I = [{
            regex: /group\/members\/*$/,
            tags: ["collaboration", "collaboration/members"]
        }, {
            regex: /group\/roles\/*$/,
            tags: ["collaboration", "collaboration/roles"]
        }, {
            regex: /group\/profile\/*$/,
            tags: ["collaboration", "collaboration/profile"]
        }, {
            regex: /group\/payouts\/*$/,
            tags: ["collaboration", "collaboration/payouts"]
        }, {
            regex: /group\/activity-history\/*$/,
            tags: ["collaboration", "collaboration/activity-history"]
        }],
        k = e => {
            let t = e.getURL(),
                a = t ? new URL(t).pathname : "",
                i = E.find(e => {
                    let t = a.match(e.regex);
                    return t && e.matchGroups.every((e, a) => e === t[a + 1])
                });
            i && i.tags.forEach(t => e.addTag(t));
            let n = I.find(e => a.match(e.regex));
            n && n.tags.forEach(t => e.addTag(t)), a.endsWith("settings/webhooks") ? e.addTag("settings/webhooks") : a.endsWith("settings/preferences") ? e.addTag("settings/preferences") : a.endsWith("roadmap") ? e.addTag("roadmap") : a.endsWith("landing") ? e.addTag("landing") : "/" === a ? e.addTag("homepage") : a.endsWith("creator") ? e.addTag("developerLanding") : d.test(a) ? e.addTag("experiences/access") : (null == t ? void 0 : t.match(g)) ? e.addTag("gamepass") : a.endsWith("activity-history") && !n ? e.addTag("activity-feed") : u.test(a) ? e.addTag("experiences/permissions") : p.test(a) ? e.addTag("asset/permissions") : a.endsWith("events/create") ? e.addTag("events/create") : h.test(a) ? e.addTag("events/configure") : m.test(a) ? e.addTag("player-feedback") : a.endsWith("rights-manager") || a.endsWith("rights-manager/register") ? e.addTag("rights-manager/register") : a.endsWith("rights-manager/removal-requests") ? e.addTag("rights-manager/removal-requests") : a.endsWith("rights-manager/matches") ? e.addTag("rights-manager/matches") : a.endsWith("license-manager/licenses") ? e.addTag("license-manager/licenses") : a.endsWith("license-manager/matches") ? e.addTag("license-manager/matches") : a.endsWith("license-manager/ip-library") ? e.addTag("license-manager/ip-library") : a.endsWith("license-manager/creator-agreements") ? e.addTag("license-manager/creator-agreements") : y.test(a) ? e.addTag("license-manager/license-listings/view-listing") : C.test(a) ? e.addTag("license-manager/agreements/view-agreement") : f.test(a) ? e.addTag("license-manager/creator-agreements/view-agreement") : a.endsWith("license-manager/ip-library/create") ? e.addTag("license-manager/ip-library/create") : S.test(a) ? e.addTag("license-manager/ip-library/view-family") : a.endsWith("explore/licenses") ? e.addTag("explore/licenses") : v.test(a) ? e.addTag("explore/licenses/view-listing") : b.test(a) && e.addTag("explore/licenses/request")
        };
    T.events.on("pageload", e => {
        k(e)
    }), T.events.on("webvitals", e => {
        k(e)
    }), T.events.on("apivitals", e => {
        k(e)
    }), T.events.on("session", e => {
        let t = e.getURL(),
            a = t ? new URL(t).pathname : "";
        a.endsWith("roadmap") ? e.addTag("roadmap") : a.endsWith("landing") ? e.addTag("landing") : "/" === a ? e.addTag("homepage") : a.endsWith("creator") && e.addTag("developerLanding")
    }), e.s(["default", 0, T], 215955)
}, 79559, e => {
    "use strict";
    var t = e.i(273589),
        a = e.i(962560),
        i = e.i(416340),
        n = e.i(42569),
        r = e.i(696180),
        s = e.i(221628),
        o = e.i(232625),
        c = e.i(963320);

    function l(e) {
        return (0, t.g)("MuiIconButton", e)
    }
    e.i(485511);
    var d = (0, r.g)("MuiIconButton", ["root", "disabled", "colorInherit", "colorPrimary", "colorSecondary", "colorError", "colorInfo", "colorSuccess", "colorWarning", "edgeStart", "edgeEnd", "sizeSmall", "sizeMedium", "sizeLarge"]);
    let g = ["edge", "children", "className", "color", "disabled", "disableFocusRipple", "size"],
        u = (0, n.s)(o.B, {
            name: "MuiIconButton",
            slot: "Root",
            overridesResolver: (e, a) => {
                let {
                    ownerState: i
                } = e;
                return [a.root, "default" !== i.color && a["color".concat((0, t.a)(i.color))], i.edge && a["edge".concat((0, t.a)(i.edge))], a["size".concat((0, t.a)(i.size))]]
            }
        })(e => {
            let {
                theme: i,
                ownerState: n
            } = e;
            return (0, a._)({
                textAlign: "center",
                flex: "0 0 auto",
                fontSize: i.typography.pxToRem(24),
                padding: 8,
                borderRadius: "50%",
                overflow: "visible",
                color: (i.vars || i).palette.action.active,
                transition: i.transitions.create("background-color", {
                    duration: i.transitions.duration.shortest
                })
            }, !n.disableRipple && {
                "&:hover": {
                    backgroundColor: i.vars ? "rgba(".concat(i.vars.palette.action.activeChannel, " / ").concat(i.vars.palette.action.hoverOpacity, ")") : (0, t.b)(i.palette.action.active, i.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "start" === n.edge && {
                marginLeft: "small" === n.size ? -3 : -12
            }, "end" === n.edge && {
                marginRight: "small" === n.size ? -3 : -12
            })
        }, e => {
            var i;
            let {
                theme: n,
                ownerState: r
            } = e, s = null == (i = (n.vars || n).palette) ? void 0 : i[r.color];
            return (0, a._)({}, "inherit" === r.color && {
                color: "inherit"
            }, "inherit" !== r.color && "default" !== r.color && (0, a._)({
                color: null == s ? void 0 : s.main
            }, !r.disableRipple && {
                "&:hover": (0, a._)({}, s && {
                    backgroundColor: n.vars ? "rgba(".concat(s.mainChannel, " / ").concat(n.vars.palette.action.hoverOpacity, ")") : (0, t.b)(s.main, n.palette.action.hoverOpacity)
                }, {
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                })
            }), "small" === r.size && {
                padding: 5,
                fontSize: n.typography.pxToRem(18)
            }, "large" === r.size && {
                padding: 12,
                fontSize: n.typography.pxToRem(28)
            }, {
                ["&.".concat(d.disabled)]: {
                    backgroundColor: "transparent",
                    color: (n.vars || n).palette.action.disabled
                }
            })
        }),
        p = i.forwardRef(function(e, i) {
            let r = (0, c.u)({
                    props: e,
                    name: "MuiIconButton"
                }),
                {
                    edge: o = !1,
                    children: d,
                    className: p,
                    color: h = "default",
                    disabled: m = !1,
                    disableFocusRipple: v = !1,
                    size: b = "medium"
                } = r,
                C = (0, t._)(r, g),
                y = (0, a._)({}, r, {
                    edge: o,
                    color: h,
                    disabled: m,
                    disableFocusRipple: v,
                    size: b
                }),
                f = (e => {
                    let {
                        classes: a,
                        disabled: i,
                        color: r,
                        edge: s,
                        size: o
                    } = e, c = {
                        root: ["root", i && "disabled", "default" !== r && "color".concat((0, t.a)(r)), s && "edge".concat((0, t.a)(s)), "size".concat((0, t.a)(o))]
                    };
                    return (0, n.a)(c, l, a)
                })(y);
            return (0, s.jsx)(u, (0, a._)({
                className: (0, n.c)(f.root, p),
                centerRipple: !0,
                focusRipple: !v,
                disabled: m,
                ref: i
            }, C, {
                ownerState: y,
                children: d
            }))
        });
    e.s(["I", 0, p, "i", 0, d])
}, 95656, e => {
    "use strict";
    var t = e.i(721281);
    class a {
        constructor(e = {
            baseUrl: ""
        }) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }
    e.s(["Configuration", 0, a, "Tracker", 0, class {
        sendEvent(e) {
            let {
                localTime: t,
                target: a,
                eventType: i,
                context: n,
                additionalProperties: r,
                currentUrl: s,
                guestId: o,
                sessionId: c
            } = e, l = t.toISOString(), d = new URL("".concat(this.baseUrl, "/pe"));
            return d.searchParams.append("t", a), d.searchParams.append("evt", i), d.searchParams.append("ctx", n), d.searchParams.append("lt", l), d.searchParams.append("url", s || window.location.href), void 0 !== o && d.searchParams.append("gid", o), void 0 !== c && d.searchParams.append("sid", c), void 0 !== r && Object.keys(r).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = r[e]) ? t : "").toString())
            }), fetch(d.href, {
                credentials: "same-origin"
            })
        }
        sendEventViaImg(e, t) {
            let {
                localTime: a,
                target: i,
                eventType: n,
                context: r,
                additionalProperties: s,
                currentUrl: o,
                guestId: c,
                sessionId: l
            } = e, d = a.toISOString(), g = new URL("".concat(this.baseUrl, "/e.png"));
            g.searchParams.append("t", i), g.searchParams.append("evt", n), g.searchParams.append("ctx", r), g.searchParams.append("lt", d), g.searchParams.append("url", o || window.location.href), void 0 !== c && g.searchParams.append("gid", c), void 0 !== l && g.searchParams.append("sid", l), void 0 !== s && Object.keys(s).forEach(e => {
                var t;
                g.searchParams.append(e, (null != (t = s[e]) ? t : "").toString())
            });
            let u = new Image;
            return u.src = g.href, u.onload = () => {
                void 0 !== t && t(!0)
            }, u.onerror = () => {
                void 0 !== t && t(!1)
            }, u
        }
        constructor(e = new a) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }])
}, 710675, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(252842);
    class i {
        setURL(e) {
            this.url = e
        }
        getURL() {
            return this.url
        }
        toLogEventObject() {
            var e, t;
            return {
                product: this.product,
                eventType: this.eventType,
                url: this.url,
                eventName: this.eventName,
                parameters: this.parameters ? JSON.stringify(this.parameters) : void 0,
                source: null != (e = this.source) ? e : void 0,
                sessionId: null != (t = this.sessionId) ? t : void 0
            }
        }
        constructor({
            product: e,
            url: a,
            eventName: i,
            parameters: n,
            source: r,
            sessionId: s
        }) {
            (0, t._)(this, "eventType", "base"), (0, t._)(this, "product", void 0), (0, t._)(this, "url", void 0), (0, t._)(this, "parameters", void 0), (0, t._)(this, "eventName", void 0), (0, t._)(this, "source", void 0), (0, t._)(this, "sessionId", void 0), this.product = e, this.url = a, this.eventName = i, this.parameters = n, this.source = r, this.sessionId = s
        }
    }
    class n extends i {
        toLogEventObject() {
            return {
                ...super.toLogEventObject(),
                tags: this.tags && this.tags.length > 0 ? this.tags.toString() : void 0
            }
        }
        addTag(e) {
            this.tags.push(e)
        }
        constructor({
            product: e,
            url: a,
            eventName: i,
            parameters: n,
            source: r,
            tags: s,
            sessionId: o
        }) {
            super({
                product: e,
                url: a,
                eventName: i,
                parameters: n,
                source: r,
                sessionId: o
            }), (0, t._)(this, "tags", []), this.tags = s || []
        }
    }
    class r extends n {
        toLogEventObject() {
            return {
                ...super.toLogEventObject(),
                referralUrl: this.referralUrl
            }
        }
        setReferralUrl(e) {
            this.referralUrl = e
        }
        constructor({
            product: e,
            url: a,
            eventName: i = "pageload",
            parameters: n,
            source: r,
            tags: s,
            sessionId: o,
            referralUrl: c
        }) {
            super({
                product: e,
                url: a,
                eventName: i,
                parameters: n,
                source: r,
                tags: s,
                sessionId: o
            }), (0, t._)(this, "referralUrl", void 0), (0, t._)(this, "eventType", "pageload"), this.referralUrl = c
        }
    }
    class s extends n {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "click")
        }
    }
    class o extends n {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "hover")
        }
    }
    class c extends n {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "imp")
        }
    }
    class l extends n {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "webvitals")
        }
    }
    class d extends n {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "apivitals")
        }
    }
    class g extends n {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "error")
        }
    }
    class u extends n {
        constructor({
            product: e,
            url: a,
            eventName: i,
            parameters: n,
            source: r,
            sessionId: s
        }) {
            super({
                product: e,
                url: a,
                eventName: i,
                parameters: n,
                source: r,
                sessionId: s
            }), (0, t._)(this, "eventType", "session")
        }
    }
    class p extends n {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "formvitals")
        }
    }
    class h {
        constructor(e = {
            baseUrl: ""
        }) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }
    class m {
        sendEvent(e) {
            let {
                localTime: t,
                target: a,
                eventType: i,
                context: n,
                additionalProperties: r,
                currentUrl: s,
                guestId: o,
                sessionId: c
            } = e, l = t.toISOString(), d = new URL("".concat(this.baseUrl, "/pe"));
            return d.searchParams.append("t", a), d.searchParams.append("evt", i), d.searchParams.append("ctx", n), d.searchParams.append("lt", l), d.searchParams.append("url", s || window.location.href), void 0 !== o && d.searchParams.append("gid", o), void 0 !== c && d.searchParams.append("sid", c), void 0 !== r && Object.keys(r).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = r[e]) ? t : "").toString())
            }), fetch(d.href, {
                credentials: "same-origin"
            })
        }
        sendEventViaImg(e, t) {
            let {
                localTime: a,
                target: i,
                eventType: n,
                context: r,
                additionalProperties: s,
                currentUrl: o,
                guestId: c,
                sessionId: l
            } = e, d = a.toISOString(), g = new URL("".concat(this.baseUrl, "/e.png"));
            g.searchParams.append("t", i), g.searchParams.append("evt", n), g.searchParams.append("ctx", r), g.searchParams.append("lt", d), g.searchParams.append("url", o || window.location.href), void 0 !== c && g.searchParams.append("gid", c), void 0 !== l && g.searchParams.append("sid", l), void 0 !== s && Object.keys(s).forEach(e => {
                var t;
                g.searchParams.append(e, (null != (t = s[e]) ? t : "").toString())
            });
            let u = new Image;
            return u.src = g.href, u.onload = () => {
                void 0 !== t && t(!0)
            }, u.onerror = () => {
                void 0 !== t && t(!1)
            }, u
        }
        constructor(e = new h) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }
    let v = "CreatorWeb";
    class b {
        logEvent(e) {
            let {
                url: t,
                ...a
            } = e.toLogEventObject(), {
                viewportWidth: i,
                viewportHeight: n
            } = {
                viewportWidth: window.innerWidth,
                viewportHeight: window.innerHeight
            }, r = {};
            Object.keys(a).forEach(e => {
                let t = a[e];
                null != t && (r[e] = t.toString())
            }), this.eventStreamTracker.sendEventViaImg({
                target: v,
                eventType: v,
                localTime: new Date,
                context: String(e.eventType),
                currentUrl: String(t),
                additionalProperties: {
                    ...r,
                    loggerVersion: "1.5.1",
                    viewportWidth: i,
                    viewportHeight: n
                }
            })
        }
        constructor({
            eventBaseUrl: e
        }) {
            (0, t._)(this, "eventStreamTracker", void 0), this.eventStreamTracker = new m(new h({
                baseUrl: "".concat(e, "/").concat(v)
            }))
        }
    }
    let C = "CreatorDashboard";
    class y {
        log(e) {
            let {
                eventType: t,
                context: i,
                properties: n,
                sessionId: r,
                currentUrl: s
            } = e, o, c = function(e) {
                let t = {};
                for (let [a, i] of Object.entries(e)) void 0 !== i && (t[a] = i);
                return t
            }(n), l = null == (o = (0, a.getCookieValueByKey)("GuestData")) ? void 0 : o.split("=")[1], d = {
                target: C,
                eventType: t,
                context: i,
                currentUrl: s,
                localTime: new Date,
                ...void 0 !== r ? {
                    sessionId: r
                } : {},
                ...void 0 !== l ? {
                    guestId: l
                } : {},
                additionalProperties: c
            };
            this.eventStreamTracker.sendEventViaImg(d)
        }
        constructor({
            eventBaseUrl: e
        }) {
            (0, t._)(this, "eventStreamTracker", void 0), this.eventStreamTracker = new m(new h({
                baseUrl: "".concat(e, "/").concat(C)
            }))
        }
    }
    class f {
        logEvent(e) {
            let t = e.toLogEventObject();
            console.table([{
                localTime: new Date,
                ...t
            }])
        }
    }

    function S(e) {
        return window.location.href.replace(/#.*$/, "")
    }
    class T {
        static parseCookieValue() {
            let e = (0, a.getCookieValueByKey)("UnifiedLoggerSession");
            return e ? decodeURIComponent(e).split("&").reduce((e, t) => {
                let [a, i] = t.split("=");
                return e[a] = JSON.parse(i), e
            }, {}) : {}
        }
        initCacheFromCookies() {
            let e = T.parseCookieValue();
            if (void 0 !== e[this.productName]) return {
                ...e[this.productName],
                timestamp: Date.now()
            }
        }
        getOrCreateSessionId() {
            try {
                let e = Date.now();
                if (this.isSessionCached(e)) {
                    if (this.isSessionActive(e)) return this.cache.lastActivity = e, this.cache.sessionId;
                    return this.refreshSessionIdIfNeeded(e)
                }
                if (this.cache = this.initCacheFromCookies(), !this.isSessionActive(e)) return this.refreshSessionId(e);
                return this.cache.lastActivity = e, this.updateCookie(), this.cache.sessionId
            } catch (e) {
                return console.error("fail to get session_id"), ""
            }
        }
        isSessionActive(e) {
            return !!this.cache && e - this.cache.lastActivity < this.inactiveSessionExpireTime
        }
        isSessionCached(e) {
            return !!this.cache && e - this.cache.timestamp < this.cacheExpiryTime
        }
        refreshSessionId(e) {
            let t = a.uuidService.generateRandomUuid(),
                i = Date.now();
            return this.cache = {
                sessionId: t,
                lastActivity: i,
                timestamp: e
            }, this.onSessionRefresh(t), this.updateCookie(), t
        }
        refreshSessionIdIfNeeded(e) {
            let t = this.initCacheFromCookies();
            if (!t) return this.refreshSessionId(e);
            let {
                sessionId: a,
                lastActivity: i
            } = t;
            return e - i > this.inactiveSessionExpireTime ? this.refreshSessionId(e) : (this.cache = {
                sessionId: a,
                lastActivity: e,
                timestamp: e
            }, this.updateCookie(), a)
        }
        updateCookie() {
            if (!this.cache) return;
            let e = T.parseCookieValue();
            e[this.productName] = this.cache, (0, a.setCookie)("UnifiedLoggerSession", Object.entries(e).map(e => {
                let [t, {
                    sessionId: a,
                    lastActivity: i
                }] = e;
                return "".concat(t, "=").concat(JSON.stringify({
                    sessionId: a,
                    lastActivity: i
                }))
            }).join("&"), {
                domain: function() {
                    let {
                        hostname: e
                    } = window.location, t = (e || "").split(".");
                    return 4 === t.length && t.every(e => parseInt(e, 10) >= 0) || t.length <= 2 ? e : t[t.length - 1].length + t[t.length - 2].length <= 5 && t.length >= 3 ? t.length > 3 ? ".".concat(t.slice(1).join(".")) : t.join(".") : ".".concat(t.slice(1).join("."))
                }(),
                path: "/",
                "max-age": 86400
            })
        }
        constructor({
            productName: e,
            cacheExpiryTime: a = 5e3,
            inactiveSessionExpireTime: i = 18e5,
            onSessionRefresh: n = () => {}
        }) {
            (0, t._)(this, "productName", void 0), (0, t._)(this, "cache", void 0), (0, t._)(this, "cacheExpiryTime", void 0), (0, t._)(this, "inactiveSessionExpireTime", void 0), (0, t._)(this, "onSessionRefresh", void 0), this.productName = e, this.cacheExpiryTime = a, this.inactiveSessionExpireTime = i, this.onSessionRefresh = n
        }
    }
    e.s(["UnifiedLogger", 0, class {
        getEventLoggers() {
            return this.eventLoggers
        }
        trackPageLoad() {
            if (!this.isAutoCollectEnabled) {
                let e;
                this.isAutoCollectEnabled = !0, window.history.pushState = (e = window.history.pushState, function() {
                    for (var t, a = arguments.length, i = Array(a), n = 0; n < a; n++) i[n] = arguments[n];
                    let r, s = e.apply(this, i),
                        o = (t = "pushState", "function" == typeof Event ? r = new Event(t) : (r = document.createEvent("Event")).initEvent(t, !0, !0), r);
                    return window.dispatchEvent(o), s
                }), window.addEventListener("pushState", () => {
                    setTimeout(() => {
                        this.logPageLoadEvent()
                    })
                }), window.addEventListener("popstate", () => {
                    setTimeout(() => {
                        this.logPageLoadEvent()
                    })
                }), this.logPageLoadEvent()
            }
        }
        logEventToLogger(e) {
            this.eventLoggers.forEach(t => {
                t.logEvent(e)
            })
        }
        logEvent(e) {
            switch (e.eventType) {
                case "pageload":
                    this.logPageLoadEvent();
                    break;
                case "click":
                    this.logClickEvent({
                        eventName: e.eventName,
                        parameters: e.parameters,
                        tags: e.tags
                    });
                    break;
                case "impression":
                    this.logImpressionEvent({
                        eventName: e.eventName,
                        parameters: e.parameters,
                        tags: e.tags
                    });
                    break;
                case "hover":
                    this.logHoverEvent({
                        eventName: e.eventName,
                        parameters: e.parameters,
                        tags: e.tags
                    });
                    break;
                case "webvitals":
                    this.logWebVitalsEvent({
                        eventName: e.eventName,
                        parameters: e.parameters,
                        tags: e.tags
                    });
                    break;
                case "apivitals":
                    this.logApiVitalsEvent({
                        eventName: e.eventName,
                        parameters: e.parameters,
                        tags: e.tags
                    });
                    break;
                case "session":
                    this.logSessionEvent({
                        eventName: e.eventName,
                        sessionId: e.sessionId,
                        parameters: e.parameters,
                        tags: e.tags
                    })
            }
        }
        logPageLoadEvent() {
            var e;
            let t = S();
            if (t === this.lastPageLoadUrl) return;
            let a = this.sessionService.getOrCreateSessionId(),
                i = new r({
                    product: this.product,
                    url: t,
                    sessionId: a,
                    referralUrl: null != (e = this.referrer) ? e : document.referrer,
                    parameters: {
                        browserLocale: navigator.language
                    }
                });
            this.events.emit("pageload", i), this.logEventToLogger(i), this.referrer = t, this.lastPageLoadUrl = t
        }
        logClickEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: i
            } = e, n = S(), r = this.sessionService.getOrCreateSessionId(), o = new s({
                product: this.product,
                url: n,
                sessionId: r,
                eventName: t,
                parameters: a,
                tags: i
            });
            this.events.emit("click", o), this.logEventToLogger(o)
        }
        logImpressionEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: i
            } = e, n = S(), r = this.sessionService.getOrCreateSessionId(), s = new c({
                product: this.product,
                url: n,
                sessionId: r,
                eventName: t,
                parameters: a,
                tags: i
            });
            this.events.emit("impression", s), this.logEventToLogger(s)
        }
        logHoverEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: i
            } = e, n = S(), r = this.sessionService.getOrCreateSessionId(), s = new o({
                product: this.product,
                url: n,
                sessionId: r,
                eventName: t,
                parameters: a,
                tags: i
            });
            this.events.emit("hover", s), this.logEventToLogger(s)
        }
        logWebVitalsEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: i
            } = e, n = S(), r = this.sessionService.getOrCreateSessionId(), s = new l({
                product: this.product,
                url: n,
                sessionId: r,
                eventName: t,
                parameters: a,
                tags: i
            });
            this.events.emit("webvitals", s), this.logEventToLogger(s)
        }
        logApiVitalsEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: i
            } = e, n = S(), r = this.sessionService.getOrCreateSessionId(), s = new d({
                product: this.product,
                url: n,
                sessionId: r,
                eventName: t,
                parameters: a,
                tags: i
            });
            this.events.emit("webvitals", s), this.logEventToLogger(s)
        }
        logFormVitalsEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: i
            } = e, n = S(), r = this.sessionService.getOrCreateSessionId(), s = new p({
                product: this.product,
                url: n,
                sessionId: r,
                eventName: t,
                parameters: a,
                tags: i
            });
            this.events.emit("formvitals", s), this.logEventToLogger(s)
        }
        logErrorEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: i
            } = e, n = S(), r = this.sessionService.getOrCreateSessionId(), s = new g({
                product: this.product,
                url: n,
                sessionId: r,
                eventName: t,
                parameters: a,
                tags: i
            });
            this.events.emit("error", s), this.logEventToLogger(s)
        }
        logHostRoutedEvent(e) {
            let {
                eventType: t,
                context: a,
                properties: i,
                hostProperties: n = {}
            } = e, r = S(), s = this.sessionService.getOrCreateSessionId();
            this.hostRoutedEventStreamLogger.log({
                eventType: t,
                context: a,
                properties: {
                    ...n,
                    ...i
                },
                sessionId: s,
                currentUrl: r
            })
        }
        logSessionEvent(e) {
            let {
                eventName: t,
                sessionId: a,
                parameters: i,
                tags: n
            } = e, r = S(), s = new u({
                product: this.product,
                url: r,
                eventName: t,
                sessionId: a,
                parameters: i,
                tags: n
            });
            this.events.emit("session", s), this.logEventToLogger(s)
        }
        onPageLoadEvent(e) {
            this.events.on("pageload", e)
        }
        constructor({
            eventBaseUrl: e,
            product: a,
            debugMode: i,
            eventLogger: n,
            sessionProductGroup: r,
            disableSession: s = !1
        }) {
            (0, t._)(this, "eventLoggers", []), (0, t._)(this, "debugMode", !1), (0, t._)(this, "product", void 0), (0, t._)(this, "sessionProductGroup", void 0), (0, t._)(this, "sessionService", void 0), (0, t._)(this, "hostRoutedEventStreamLogger", void 0), (0, t._)(this, "disableSession", void 0), (0, t._)(this, "lastPageLoadUrl", void 0), (0, t._)(this, "referrer", void 0), (0, t._)(this, "isAutoCollectEnabled", !1), (0, t._)(this, "events", function() {
                let e = new Map;
                return {
                    on(t, a) {
                        e.has(t) ? e.get(t).push(a) : e.set(t, [a])
                    },
                    off(t, a) {
                        e.has(t) && e.set(t, (e.get(t) || []).filter(e => e !== a))
                    },
                    emit(t, a) {
                        for (var i = arguments.length, n = Array(i > 2 ? i - 2 : 0), r = 2; r < i; r++) n[r - 2] = arguments[r];
                        (e.get(t) || []).forEach(e => {
                            e(a, ...n)
                        })
                    }
                }
            }()), (0, t._)(this, "onSessionRefresh", e => {
                this.logSessionEvent({
                    eventName: "sessionStart",
                    sessionId: e
                })
            }), this.eventLoggers.push(null != n ? n : new b({
                eventBaseUrl: e
            })), this.debugMode = !!i, this.product = a, this.sessionProductGroup = null != r ? r : a, this.debugMode && this.eventLoggers.push(new f), this.hostRoutedEventStreamLogger = new y({
                eventBaseUrl: e
            }), this.disableSession = s, this.sessionService = this.disableSession ? {
                getOrCreateSessionId: () => {}
            } : new T({
                productName: this.sessionProductGroup,
                onSessionRefresh: this.onSessionRefresh
            })
        }
    }])
}]);

//# debugId=13b6f21a-be66-1cd9-fd2e-fd997a8c6588
//# sourceMappingURL=2upels_xqcl-q.js.map