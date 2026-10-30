;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "b1a63a12-9622-d015-7b4a-e37791825874")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 889311, e => {
    "use strict";
    var t, a = ((t = a || {}).DownloadStudio = "downloadStudio", t.ExportKpiChart = "exportKpiChart", t.ViewComputeTab = "viewComputeTab", t.DateRangeChanged = "dateRangeChanged", t.DataDivisionChanged = "dataDivisionChanged", t.PageBreakdownsToggled = "pageBreakdownsToggled", t.PageVersionAnnotationsToggled = "pageVersionAnnotationsToggled", t.PageFiltersChanged = "pageFiltersChanged", t.ChartTooltipViewed = "chartTooltipViewed", t.PageTabSelected = "pageTabSelected", t.RbxClientRequest = "rbxClientRequest", t.StudioStartAttempt = "studioStartAttempt", t.StudioStartSuccess = "studioStartSuccess", t.ViewTranslatorPortal = "viewTranslatorPortal", t.ViewLocalization = "viewLocalization", t.SelectAddSupportedLanguage = "selectAddSupportedLanguage", t.ManageSupportedLanguage = "manageSupportedLanguage", t.LearnMoreAutomaticQuota = "learnMoreAutomaticQuota", t.ShareLinkTranslators = "shareLinkTranslators", t.SelectInviteTranslators = "selectInviteTranslators", t.InviteTranslatorsModel = "inviteTranslatorsModel", t.DownloadContributorReport = "downloadContributorReport", t.AutomaticTextCaptureToggled = "automaticTextCaptureToggled", t.UseTranslatedContentToggled = "useTranslatedContentToggled", t.AutomaticAssetCaptureToggled = "automaticAssetCaptureToggled", t.UseTranslatedImagesToggled = "useTranslatedImagesToggled", t.ClearAutoCapturedTable = "clearAutoCapturedTable", t.OpenSwitchOffAutomaticTranslationConfirmDialogue = "openSwitchOffAutomaticTranslationConfirmDialogue", t.SwitchOffAutomaticTranslation = "switchOffAutomaticTranslation", t.SwitchOnAutomaticTranslation = "switchOnAutomaticTranslation", t.UpdateUniverseInformation = "updateUniverseInformation", t.SelectAddTranslationEntry = "selectAddTranslationEntry", t.AddTranslationEntry = "addTranslationEntry", t.SearchTranslationEntryList = "searchTranslationEntryList", t.FilterTranslationEntryList = "filterTranslationEntryList", t.FilterTranslationProductList = "filterTranslationProductList", t.UpdateGameProductTranslation = "updateGameProductTranslation", t.UpdateGameProductIcon = "updateGameProductIcon", t.UpdateUniverseIconAndThumbnail = "updateUniverseIconAndThumbnail", t.ViewNotifications = "viewNotifications", t.NotificationStringListLoaded = "notificationStringListLoaded", t.GetNotificationStringsList = "getNotificationStringsList", t.GetNotificationStringsListSuccess = "getNotificationStringsListSuccess", t.GetNotificationStringsListFailure = "getNotificationStringsListFailure", t.GetNotificationString = "getNotificationString", t.GetNotificationStringSuccess = "getNotificationStringSuccess", t.GetNotificationStringFailure = "getNotificationStringFailure", t.ArchiveNotificationContent = "archiveNotificationContent", t.ArchiveNotificationContentSuccess = "archiveNotificationContentSuccess", t.ArchiveNotificationContentFailure = "archiveNotificationContentFailure", t.CopyNotificationContentAssetId = "copyNotificationContentAssetId", t.CreateNotificationContent = "createNotificationContent", t.CreateNotificationContentSuccess = "createNotificationContentSuccess", t.CreateNotificationContentFailure = "createNotificationContentFailure", t.InitiateCreateNotificationContent = "initiateCreateNotificationContent", t.InitiateEditNotificationContent = "initiateEditNotificationContent", t.EditNotificationStringLoaded = "editNotificationStringLoaded", t.EditNotificationContent = "editNotificationContent", t.EditNotificationContentSuccess = "editNotificationContentSuccess", t.EditNotificationContentFailure = "editNotificationContentFailure", t.ViewNotificationCampaignAnalytics = "viewNotificationCampaignAnalytics", t.AssetCreationAttempt = "assetCreationAttempt", t.AssetCreationFailure = "assetCreationFailure", t.EventCreationExposure = "exposedToEventCreation", t.EventCreationInitiated = "initiateEventCreation", t.EventCreationDiscarded = "discardUnsavedEventChanges", t.EventCreationSaveDraft = "saveEventAsDraft", t.EventCreationDeleteDraft = "deleteEventDraft", t.EventCreationPublish = "publishEvent", t.EventCreationLinkCopied = "virtualEventLinkCopied", t.NotificationsSettingsCategoryLoad = "notificationSettingsCategoryLoad", t.NotificationsSettingsLeftNavClick = "notificationSettingsLeftNavClick", t.NotificationsSettingsCategoryCancelClick = "notificationsSettingsCategoryCancelClick", t.DocumentationLanguageChanged = "documentationLanguageChanged", t.ClickMarketplaceOnboardingCountry = "clickMarketplaceOnboardingCountry", t.ImpressionCreatorOpportunityTable = "impressionCreatorOpportunityTable", t.ClickCreatorOpportunityTable = "clickCreatorOpportunityTable", t.ClickShareLinkPromoApplyNow = "clickShareLinkPromoApplyNow", t.RightsManagerSearchClick = "rightsManagerSearchClick", t.RightsManagerSearchResultClick = "rightsManagerSearchResultClick", t.RightsManagerSearchResultSubmitted = "rightsManagerSearchResultSubmitted", t.RightsManagerSearchResultsLoad = "rightsManagerSearchResultsLoad", t.RightsManagerSearchResultsEnd = "rightsManagerSearchResultsEnd", t.DownloadPlayerFeedbackCommentsClick = "downloadPlayerFeedbackCommentsClick", t.PageNotFound = "pageNotFound", t.PageNotFoundReturnButtonClick = "pageNotFoundReturnButtonClick", t.PlayerFeedbackSummaryClick = "playerFeedbackSummaryClick", t.AgeVerificationUpsellBanner = "ageVerificationUpsellBanner", t.AgeVerificationUpsellBannerClick = "ageVerificationUpsellBannerClick", t.AgeVerificationUpsellBannerError = "ageVerificationUpsellBannerError", t.BetaTaxonomyToggle = "betaTaxonomyToggle", t.AssetPrivacyOptOutSurveySubmitted = "assetPrivacyOptOutSurveySubmitted", t.TalentHubV2JobCardClick = "talentHubV2JobCardClick", t.UnratedExperienceBanner = "unratedExperienceBanner", t.UnratedExperienceBannerClick = "unratedExperienceBannerClick", t.ActivationEligibilityBanner = "activationEligibilityBanner", t.ActivationEligibilityBannerClick = "activationEligibilityBannerClick", t.UnifiedAlertImpression = "unifiedAlertImpression", t.UnifiedAlertClick = "unifiedAlertClick", t.TalentHubV2FilterChange = "talentHubV2FilterChange", t.TalentHubV2ApplyClick = "talentHubV2ApplyClick", t.TalentHubV2StudioCardClick = "talentHubV2StudioCardClick", t.TalentHubV2ProfileSave = "talentHubV2ProfileSave", t.TalentHubV2InboxRowClick = "talentHubV2InboxRowClick", t.TalentHubV2JobsPageView = "talentHubV2JobsPageView", t.TalentHubV2StudiosPageView = "talentHubV2StudiosPageView", t.TalentHubV2StudioProfilePageView = "talentHubV2StudioProfilePageView", t.TalentHubV2TalentProfilePageView = "talentHubV2TalentProfilePageView", t.TalentHubV2InboxPageView = "talentHubV2InboxPageView", t.TalentHubV2PostJobPageView = "talentHubV2PostJobPageView", t.TalentHubV2JobPostSubmit = "talentHubV2JobPostSubmit", t.TalentHubV2JobEditSubmit = "talentHubV2JobEditSubmit", t.CreatorStoreCustomThumbnailUpload = "creatorStoreCustomThumbnailUpload", t.StatusBadgeClick = "statusBadgeClick", t.StatusBadgeImpression = "statusBadgeImpression", t.StatusBadgeTooltipOpen = "statusBadgeTooltipOpen", t.PublishEligibilityBannerImpression = "publishEligibilityBannerImpression", t.PublishEligibilityBannerClick = "publishEligibilityBannerClick", t.AudienceReachGrowthOpportunitiesBannerImpression = "audienceReachGrowthOpportunitiesBannerImpression", t.AudienceReachGrowthOpportunitiesBannerClick = "audienceReachGrowthOpportunitiesBannerClick", t.TalentHubV2ApplicationSubmit = "talentHubV2ApplicationSubmit", t.TalentHubV2ProfileCreate = "talentHubV2ProfileCreate", t.TalentHubV2ApplicantStatusChange = "talentHubV2ApplicantStatusChange", t.TalentHubV2JobClose = "talentHubV2JobClose", t.TalentHubV2CreateStudioSubmit = "talentHubV2CreateStudioSubmit", t.TalentHubV2CreateStudioSuccess = "talentHubV2CreateStudioSuccess", t.TalentHubV2CreateStudioError = "talentHubV2CreateStudioError", t.TalentHubV2InteractionClick = "talentHubV2InteractionClick", t.ImpactedExperiencesBanner = "impactedExperiencesBanner", t.ImpactedExperiencesBannerClick = "impactedExperiencesBannerClick", t.ImpactedExperiencesFilterClick = "impactedExperiencesFilterClick", t.ImpactedExperienceCardCollaborateClick = "impactedExperienceCardCollaborateClick", t.ImpactedExperiencesLoadMoreClick = "impactedExperiencesLoadMoreClick", t.ImpactedBannerScoutStart = "impactedBannerScoutStart", t.ImpactedBannerScoutFound = "impactedBannerScoutFound", t.ImpactedBannerScoutGaveUp = "impactedBannerScoutGaveUp", t.EstablishTrustDialog = "establishTrustDialog", t.EstablishTrustDialogClick = "establishTrustDialogClick", t.SafetyCollaboratorsImpression = "safetyCollaboratorsImpression", t.SafetyCollaboratorsClick = "safetyCollaboratorsClick", t.SafetyCollaboratorsError = "safetyCollaboratorsError", t.MomentsCreationsAttempt = "momentsCreationsAttempt", t.MomentsCreationsSuccess = "momentsCreationsSuccess", t.MomentsCreationsError = "momentsCreationsError", t.RoadmapDetailFeedbackSubmit = "roadmapDetailFeedbackSubmit", t.RoadmapPageView = "roadmapPageView", t.RoadmapItemClick = "roadmapItemClick", t.RoadmapFilterApplied = "roadmapFilterApplied", t.RoadmapFeedbackOpen = "roadmapFeedbackOpen", t.RoadmapFeedbackClose = "roadmapFeedbackClose", t.RoadmapItemImpression = "roadmapItemImpression", t.RoadmapItemLikeToggle = "roadmapItemLikeToggle", t.CreatorInventoryPageView = "creatorInventoryPageView", t.CreatorInventoryItemImpression = "creatorInventoryItemImpression", t.CreatorInventoryItemClick = "creatorInventoryItemClick", t.CreatorInventorySearch = "creatorInventorySearch", t.CreatorInventoryFilter = "creatorInventoryFilter", t.CreatorInventoryAssetTypeChange = "creatorInventoryAssetTypeChange", t.CreatorInventoryViewChange = "creatorInventoryViewChange", t.CreatorInventoryPagination = "creatorInventoryPagination", t.CreatorInventoryMenuOpen = "creatorInventoryMenuOpen", t.CreatorInventoryMenuAction = "creatorInventoryMenuAction", t.CreatorInventoryRetry = "creatorInventoryRetry", t.CreatorInventorySort = "creatorInventorySort", t.CreatorInventoryResults = "creatorInventoryResults", t.CreatorInventoryBulkUploadAction = "creatorInventoryBulkUploadAction", t.CreatorInventoryBulkUploadBatch = "creatorInventoryBulkUploadBatch", t.CreatorInventoryBulkUploadError = "creatorInventoryBulkUploadError", t.SelectEvictionAckBannerImpression = "selectEvictionAckBannerImpression", t.SelectEvictionAckBannerDetailClick = "selectEvictionAckBannerDetailClick", t.SelectEvictionAckOverlayImpression = "selectEvictionAckOverlayImpression", t.SelectEvictionAckOverlayDetailClick = "selectEvictionAckOverlayDetailClick", t);
    e.s(["default", 0, a])
}, 215955, 512229, e => {
    "use strict";
    var t = e.i(663624),
        a = e.i(721281),
        r = e.i(252842),
        i = e.i(95656),
        o = e.i(889311);
    let n = "https://ecsv2.".concat("roblox.com"),
        s = "".concat(n, "/CreatorDashboard"),
        c = ["loadPage", o.default.AssetPrivacyOptOutSurveySubmitted],
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
                    let r = a[e];
                    null != r && (t[e] = r.toString())
                });
                let r = {
                    eventName: e.eventType,
                    parameters: t
                };
                "load" === e.context ? this.unifiedLoggerClient.logImpressionEvent(r) : "hover" === e.context ? this.unifiedLoggerClient.logHoverEvent(r) : "click" === e.context && this.unifiedLoggerClient.logClickEvent(r)
            }
            sendEvent(e) {
                let t = (0, r.getCookieValueByKey)("GuestData"),
                    a = null == t ? void 0 : t.split("=")[1],
                    i = {
                        target: "CreatorDashboard",
                        localTime: new Date,
                        eventType: e.eventType,
                        context: e.context,
                        guestId: a,
                        additionalProperties: e.additionalProperties
                    };
                return this.shouldDoubleWriteToUnifiedLogger(i) && this.sendEventToUnifiedLogger(i), this.tracker.sendEventViaImg(i)
            }
            constructor() {
                (0, a._)(this, "tracker", void 0), (0, a._)(this, "unifiedLoggerClient", void 0);
                const e = new i.Configuration({
                    baseUrl: s
                });
                this.tracker = new i.Tracker(e)
            }
        };
    e.s(["default", 0, l, "eventStreamBaseUrl", 0, n], 512229);
    let d = /experiences\/.+\/(?:access|advanced-settings)\/*$/,
        g = /experiences\/.+\/(associated-items\?activeTab=Pass|passes)\/?/,
        h = /experiences\/.+\/permissions\/*$/,
        u = /store\/.+\/permissions\/*$/,
        p = /events\/.+\/configure\/*$/,
        m = /experiences\/.+\/feedback\/*$/,
        v = /explore\/licenses\/.+\/*$/,
        C = /explore\/licenses\/.+\/.+\/request$/,
        b = /license-manager\/agreements\/.+\/*$/,
        y = /license-manager\/license-listings\/.+\/*$/,
        S = /license-manager\/creator-agreements\/.+\/*$/,
        f = /ip\/ip-library\/.+\/*$/,
        T = /experiences\/[^/]+\/chat\/*$/,
        E = new t.UnifiedLogger({
            eventBaseUrl: n,
            product: "CreatorDashboard",
            sessionProductGroup: "CreatorHub"
        }),
        I = /experiences\/\d+\/(analytics|monetization)\/([^/]+)\/*$/,
        D = [{
            regex: /analytics\/*$/,
            matchGroups: [],
            tags: ["analytics", "analytics/home"]
        }, {
            regex: /experiences\/\d+\/overview\/*$/,
            matchGroups: [],
            tags: ["analytics", "analytics/overview", "analytics/overview/experience-overview"]
        }, {
            regex: I,
            matchGroups: ["analytics", "retention"],
            tags: ["analytics", "analytics/overview", "analytics/overview/retention"]
        }, {
            regex: I,
            matchGroups: ["analytics", "engagement"],
            tags: ["analytics", "analytics/overview", "analytics/overview/engagement"]
        }, {
            regex: I,
            matchGroups: ["analytics", "acquisition"],
            tags: ["analytics", "analytics/overview", "analytics/overview/acquisition"]
        }, {
            regex: I,
            matchGroups: ["analytics", "audience"],
            tags: ["analytics", "analytics/overview", "analytics/overview/audience"]
        }, {
            regex: I,
            matchGroups: ["analytics", "economy"],
            tags: ["analytics", "analytics/overview", "analytics/overview/economy"]
        }, {
            regex: I,
            matchGroups: ["analytics", "funnels"],
            tags: ["analytics", "analytics/overview", "analytics/overview/funnels"]
        }, {
            regex: I,
            matchGroups: ["monetization", "overview"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/overview"]
        }, {
            regex: I,
            matchGroups: ["monetization", "developer-products"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/developer-products"]
        }, {
            regex: I,
            matchGroups: ["monetization", "passes"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/passes"]
        }, {
            regex: I,
            matchGroups: ["monetization", "avatar-items"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/avatar-items"]
        }, {
            regex: I,
            matchGroups: ["monetization", "immersive-ads"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/immersive-ads"]
        }, {
            regex: I,
            matchGroups: ["monetization", "subscriptions"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/subscriptions"]
        }, {
            regex: I,
            matchGroups: ["monetization", "engagement-payouts"],
            tags: ["analytics", "analytics/monetization", "analytics/monetization/engagement-payouts"]
        }, {
            regex: I,
            matchGroups: ["analytics", "performance"],
            tags: ["analytics", "analytics/monitoring", "analytics/monitoring/performance"]
        }, {
            regex: I,
            matchGroups: ["analytics", "errors"],
            tags: ["analytics", "analytics/monitoring", "analytics/monitoring/errors"]
        }, {
            regex: I,
            matchGroups: ["analytics", "memory-stores"],
            tags: ["analytics", "analytics/monitoring", "analytics/monitoring/memory-stores"]
        }],
        P = [{
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
        w = e => {
            let t = e.getURL(),
                a = t ? new URL(t).pathname : "",
                r = D.find(e => {
                    let t = a.match(e.regex);
                    return t && e.matchGroups.every((e, a) => e === t[a + 1])
                });
            r && r.tags.forEach(t => e.addTag(t));
            let i = P.find(e => a.match(e.regex));
            i && i.tags.forEach(t => e.addTag(t)), a.endsWith("settings/webhooks") ? e.addTag("settings/webhooks") : a.endsWith("settings/preferences") ? e.addTag("settings/preferences") : a.endsWith("roadmap") ? e.addTag("roadmap") : a.endsWith("landing") ? e.addTag("landing") : "/" === a ? e.addTag("homepage") : a.endsWith("creator") ? e.addTag("developerLanding") : d.test(a) ? e.addTag("experiences/access") : (null == t ? void 0 : t.match(g)) ? e.addTag("gamepass") : a.endsWith("activity-history") && !i ? e.addTag("activity-feed") : h.test(a) ? e.addTag("experiences/permissions") : u.test(a) ? e.addTag("asset/permissions") : a.endsWith("events/create") ? e.addTag("events/create") : p.test(a) ? e.addTag("events/configure") : m.test(a) ? e.addTag("player-feedback") : T.test(a) ? e.addTag("experiences/chat") : a.endsWith("rights-manager") || a.endsWith("rights-manager/register") ? e.addTag("rights-manager/register") : a.endsWith("rights-manager/removal-requests") ? e.addTag("rights-manager/removal-requests") : a.endsWith("rights-manager/matches") ? e.addTag("rights-manager/matches") : a.endsWith("license-manager/licenses") ? e.addTag("license-manager/licenses") : a.endsWith("license-manager/matches") ? e.addTag("license-manager/matches") : a.endsWith("license-manager/ip-library") ? e.addTag("license-manager/ip-library") : a.endsWith("license-manager/creator-agreements") ? e.addTag("license-manager/creator-agreements") : y.test(a) ? e.addTag("license-manager/license-listings/view-listing") : b.test(a) ? e.addTag("license-manager/agreements/view-agreement") : S.test(a) ? e.addTag("license-manager/creator-agreements/view-agreement") : a.endsWith("license-manager/ip-library/create") ? e.addTag("license-manager/ip-library/create") : f.test(a) ? e.addTag("license-manager/ip-library/view-family") : a.endsWith("explore/licenses") ? e.addTag("explore/licenses") : v.test(a) ? e.addTag("explore/licenses/view-listing") : C.test(a) && e.addTag("explore/licenses/request")
        };
    E.events.on("pageload", e => {
        w(e)
    }), E.events.on("webvitals", e => {
        w(e)
    }), E.events.on("apivitals", e => {
        w(e)
    }), E.events.on("session", e => {
        let t = e.getURL(),
            a = t ? new URL(t).pathname : "";
        a.endsWith("roadmap") ? e.addTag("roadmap") : a.endsWith("landing") ? e.addTag("landing") : "/" === a ? e.addTag("homepage") : a.endsWith("creator") && e.addTag("developerLanding")
    }), e.s(["default", 0, E], 215955)
}, 220311, e => {
    "use strict";
    var t, a = ((t = a || {}).Home = "CreatorDashboard.Home", t.RoadMap = "CreatorDashboard.RoadMap", t.Features = "CreatorDashboard.Features", t.Landing = "CreatorDashboard.Landing", t.Navigation = "CreatorDashboard.Navigation", t.Metadata = "CreatorDashboard.Metadata", t.LogIn = "CreatorDashboard.LogIn", t.SignUp = "CreatorDashboard.SignUp", t.DevEx = "CreatorDashboard.DevEx", t.Wallet = "CreatorDashboard.Wallet", t.TaxDocumentation = "CreatorDashboard.TaxDocumentation", t.Controls = "CreatorDashboard.Controls", t.Error = "CreatorDashboard.Error", t.Creations = "CreatorDashboard.Creations", t.AgreementsManager = "CreatorDashboard.AgreementsManager", t.AssetTypes = "CreatorDashboard.AssetTypes", t.DevStatsGame = "CreatorDashboard.DevStatsGame", t.DevStatsExport = "CreatorDashboard.DevStatsExport", t.DevStatsPremium = "CreatorDashboard.EngagementPayout", t.DeveloperQuestionnaire = "CreatorDashboard.DeveloperQuestionnaire", t.Analytics = "CreatorDashboard.Analytics", t.AudienceReach = "CreatorDashboard.AudienceReach", t.ExperienceDetails = "Feature.ExperienceDetails", t.ExperienceAlerts = "CreatorDashboard.ExperienceAlerts", t.ImmersiveAdsAnalytics = "CreatorDashboard.ImmersiveAdsAnalytics", t.Insights = "CreatorDashboard.Insights", t.AvatarAnalytics = "CreatorDashboard.AvatarAnalytics", t.StoreAnalytics = "CreatorDashboard.StoreAnalytics", t.ShareLinkAnalytics = "CreatorDashboard.ShareLinkAnalytics", t.ComputeTelemetry = "CreatorDashboard.ComputeTelemetry", t.GameLocalization = "CreatorDashboard.GameLocalization", t.GameLocalizationLanguages = "CreatorDashboard.GameLocalizationLanguages", t.GameLocalizationReports = "CreatorDashboard.GameLocalizationReports", t.GameLocalizationSettings = "CreatorDashboard.GameLocalizationSettings", t.GameLocalizationTranslators = "CreatorDashboard.GameLocalizationTranslators", t.GameLocalizationTableManagement = "CreatorDashboard.GameLocalizationTableManagement", t.GameTranslation = "CreatorDashboard.GameTranslation", t.GameInfoTranslation = "CreatorDashboard.GameInfoTranslation", t.GameStringTranslation = "CreatorDashboard.GameStringTranslation", t.GameImageTranslation = "CreatorDashboard.GameImageTranslation", t.GameProductTranslation = "CreatorDashboard.GameProductTranslation", t.ConfigureItem = "CreatorDashboard.ConfigureItem", t.OpenCloud = "CreatorDashboard.OpenCloud", t.OAuth = "CreatorDashboard.OAuth", t.ScopeSystem = "CreatorDashboard.ScopeSystem", t.AgreementsUpdate = "CreatorDashboard.AgreementsUpdate", t.AssetAnalytics = "CreatorDashboard.AssetAnalytics", t.UniverseConfigAndExperimentation = "CreatorDashboard.UniverseConfigAndExperimentation", t.Table = "CreatorDashboard.Table", t.TranslatorPortal = "CreatorDashboard.TranslatorPortal", t.Badges = "CreatorDashboard.Badges", t.DeveloperProducts = "CreatorDashboard.DeveloperProducts", t.SocialLinks = "CreatorDashboard.SocialLinks", t.Updates = "CreatorDashboard.Updates", t.Places = "CreatorDashboard.Places", t.PlaceThumbnails = "CreatorDashboard.PlaceThumbnails", t.GenreType = "CreatorDashboard.GenreType", t.AssetUpload = "CreatorDashboard.AssetUpload", t.AssetPermissions = "CreatorDashboard.AssetPermissions", t.Access = "CreatorDashboard.Access", t.Secrets = "CreatorDashboard.Secrets", t.PlaceAccess = "CreatorDashboard.PlaceAccess", t.Passes = "CreatorDashboard.Passes", t.ActivityFeed = "CreatorDashboard.ActivityFeed", t.VersionHistory = "CreatorDashboard.VersionHistory", t.Notifications = "CreatorDashboard.Notifications", t.DeveloperItem = "CreatorDashboard.DeveloperItem", t.Settings = "CreatorDashboard.Settings", t.SendrNotificationPreferences = "Notifications.Preferences", t.CloudServices = "CreatorDashboard.CloudServices", t.Community = "CreatorDashboard.Community", t.Preferences = "CreatorDashboard.Preferences", t.ExperienceSubscriptions = "CreatorDashboard.DeveloperSubscriptions", t.Commerce = "CreatorDashboard.Commerce", t.CreatorAccount = "CreatorDashboard.CreatorAccount", t.Advanced = "CreatorDashboard.Advanced", t.RightsPortal = "CreatorDashboard.RightsPortal", t.Transactions = "CreatorDashboard.Transactions", t.DataCollection = "CreatorDashboard.DataCollection", t.DataCollectionSettings = "CreatorDashboard.DataCollectionSettings", t.DataCollectionTerms = "CreatorDashboard.DataCollectionTerms", t.MarketplaceOnboarding = "CreatorDashboard.MarketplaceOnboarding", t.Organization = "CreatorDashboard.Organization", t.CommunicationSettings = "CreatorDashboard.CommunicationSettings", t.UnifiedNavigation = "CreatorDocumentation.Navigation", t.DeveloperLanding = "CreatorDashboard.DeveloperLanding", t.Payouts = "CreatorDashboard.Payouts", t.RevenueShareAgreements = "CreatorDashboard.RevenueShareAgreements", t.DataSharingSettingsV2 = "CreatorDashboard.DataSharingSettingsV2", t.PriceOptimization = "CreatorDashboard.PriceOptimization", t.SafetyControls = "CreatorDashboard.SafetyControls", t.AntiCheat = "CreatorDashboard.AntiCheat", t.ShareLinksManagement = "CreatorDashboard.ShareLinksManagament", t.ShareLinkPromo = "CreatorDashboard.ShareLinkPromo", t.FiatPaidAccess = "CreatorDashboard.FiatPaidAccess", t.PublicPublish = "CreatorDashboard.PublicReach", t.Genres = "Experience.Genre", t.OwnershipTransfer = "CreatorDashboard.OwnershipTransfer", t.DocsAssistant = "Feature.QNAB", t.AssetPrivacy = "CreatorDashboard.AssetPrivacy", t.AffiliateProgram = "CreatorDashboard.AffiliateProgram", t.PlayerFeedback = "CreatorDashboard.PlayerFeedback", t.RegionalPricing = "CreatorDashboard.RegionalPricing", t.AnalyticsAssistant = "CreatorDashboard.AnalyticsAssistant", t.Matchmaking = "CreatorDashboard.CustomMatchmaking", t.Licenses = "CreatorDashboard.Licenses", t.Permissions = "CreatorDashboard.Permissions", t.ReferralRewards = "CreatorDashboard.ReferralRewards", t.DynamicPriceCheck = "CreatorDashboard.DynamicPriceCheck", t.NotApproved = "Feature.NotApproved", t.Moderation = "Feature.Moderation", t.AppealsPortal = "Feature.AppealsPortal", t.DashboardModeration = "CreatorDashboard.Moderation", t.Environments = "CreatorDashboard.Environments", t.PageTitles = "CreatorDashboard.PageTitles", t.CreatorRewards = "CreatorDashboard.CreatorRewards", t.CreatorRewardsLanding = "CreatorDashboard.CreatorRewardsLanding", t.ExperienceReleases = "CreatorDashboard.ExperienceReleases", t.Variants = "CreatorDashboard.Variants", t.ServerManagement = "CreatorDashboard.ServerManagement", t.Safety = "CreatorDashboard.Safety", t.CommonUIControls = "CommonUI.Controls", t.CommonUIMessages = "CommonUI.Messages", t.Taxonomy = "CreatorDashboard.Taxonomy", t.RecommendationService = "CreatorDashboard.RecommendationService", t.DataStoresManager = "CreatorDashboard.DataStoresManager", t.AccessPolicy = "CreatorDashboard.AccessPolicy", t.Groups = "Feature.Groups", t.GroupManagement = "Feature.GroupManagement", t.Privacy = "Feature.Privacy", t.ManagedPricing = "CreatorDashboard.ManagedPricing", t.HardCodedPrices = "CreatorDashboard.HardCodedPrices", t.SocialLinksAgeVerificationUpsell = "Feature.SocialLinks", t.PurchaseError = "IAPExperience.PurchaseError", t.TalentHubV2 = "CreatorDashboard.TalentHubV2", t.Leaderboards = "CreatorDashboard.Leaderboards", t.PersonalizedShop = "CreatorDashboard.PersonalizedShop", t.PresetChat = "CreatorDashboard.PresetChat", t.Publishing = "CreatorDashboard.Publishing", t.ItemModel = "Feature.ItemModel", t.ProductTrials = "CreatorDashboard.ProductTrials", t);
    e.s(["default", 0, a])
}, 881670, e => {
    "use strict";
    var t = e.i(220311);
    e.s(["TranslationNamespace", () => t.default])
}, 819139, e => {
    "use strict";
    var t = e.i(477763),
        a = e.i(169336),
        r = e.i(416340),
        i = e.i(745984),
        o = e.i(162642),
        n = e.i(221628),
        s = e.i(249707),
        c = e.i(823079),
        l = e.i(329102);
    e.i(596779);
    let d = ["addEndListener", "appear", "children", "easing", "in", "onEnter", "onEntered", "onEntering", "onExit", "onExited", "onExiting", "style", "timeout", "TransitionComponent"];

    function g(e) {
        return "scale(".concat(e, ", ").concat(e ** 2, ")")
    }
    let h = {
            entering: {
                opacity: 1,
                transform: g(1)
            },
            entered: {
                opacity: 1,
                transform: "none"
            }
        },
        u = "u" > typeof navigator && /^((?!chrome|android).)*(safari|mobile)/i.test(navigator.userAgent) && /(os |version\/)15(.|_)4/i.test(navigator.userAgent),
        p = r.forwardRef(function(e, p) {
            let {
                addEndListener: m,
                appear: v = !0,
                children: C,
                easing: b,
                in: y,
                onEnter: S,
                onEntered: f,
                onEntering: T,
                onExit: E,
                onExited: I,
                onExiting: D,
                style: P,
                timeout: w = "auto",
                TransitionComponent: k = o.T
            } = e, A = (0, a._)(e, d), x = (0, s.u)(), L = r.useRef(), N = (0, i.u)(), U = r.useRef(null), R = (0, c.u)(U, (0, l.g)(C), p), V = e => t => {
                if (e) {
                    let a = U.current;
                    void 0 === t ? e(a) : e(a, t)
                }
            }, O = V(T), _ = V((e, t) => {
                let a;
                (0, o.r)(e);
                let {
                    duration: r,
                    delay: i,
                    easing: n
                } = (0, o.g)({
                    style: P,
                    timeout: w,
                    easing: b
                }, {
                    mode: "enter"
                });
                "auto" === w ? L.current = a = N.transitions.getAutoHeightDuration(e.clientHeight) : a = r, e.style.transition = [N.transitions.create("opacity", {
                    duration: a,
                    delay: i
                }), N.transitions.create("transform", {
                    duration: u ? a : .666 * a,
                    delay: i,
                    easing: n
                })].join(","), S && S(e, t)
            }), B = V(f), G = V(D), M = V(e => {
                let t, {
                    duration: a,
                    delay: r,
                    easing: i
                } = (0, o.g)({
                    style: P,
                    timeout: w,
                    easing: b
                }, {
                    mode: "exit"
                });
                "auto" === w ? L.current = t = N.transitions.getAutoHeightDuration(e.clientHeight) : t = a, e.style.transition = [N.transitions.create("opacity", {
                    duration: t,
                    delay: r
                }), N.transitions.create("transform", {
                    duration: u ? t : .666 * t,
                    delay: u ? r : r || .333 * t,
                    easing: i
                })].join(","), e.style.opacity = 0, e.style.transform = g(.75), E && E(e)
            }), F = V(I);
            return (0, n.jsx)(k, (0, t._)({
                appear: v,
                in: y,
                nodeRef: U,
                onEnter: _,
                onEntered: B,
                onEntering: O,
                onExit: M,
                onExited: F,
                onExiting: G,
                addEndListener: e => {
                    "auto" === w && x.start(L.current || 0, e), m && m(U.current, e)
                },
                timeout: "auto" === w ? null : w
            }, A, {
                children: (e, a) => r.cloneElement(C, (0, t._)({
                    style: (0, t._)({
                        opacity: 0,
                        transform: g(.75),
                        visibility: "exited" !== e || y ? void 0 : "hidden"
                    }, h[e], P, C.props.style),
                    ref: R
                }, a))
            }))
        });
    p.muiSupportAuto = !0, e.s(["G", 0, p])
}, 466127, e => {
    "use strict";
    var t = e.i(169336),
        a = e.i(477763),
        r = e.i(416340),
        i = e.i(226319),
        o = e.i(928277),
        n = e.i(221628),
        s = e.i(759599),
        c = e.i(442632);

    function l(e) {
        return (0, t.g)("MuiIconButton", e)
    }
    e.i(802400);
    var d = (0, o.g)("MuiIconButton", ["root", "disabled", "colorInherit", "colorPrimary", "colorSecondary", "colorError", "colorInfo", "colorSuccess", "colorWarning", "edgeStart", "edgeEnd", "sizeSmall", "sizeMedium", "sizeLarge"]);
    let g = ["edge", "children", "className", "color", "disabled", "disableFocusRipple", "size"],
        h = (0, i.s)(s.B, {
            name: "MuiIconButton",
            slot: "Root",
            overridesResolver: (e, a) => {
                let {
                    ownerState: r
                } = e;
                return [a.root, "default" !== r.color && a["color".concat((0, t.a)(r.color))], r.edge && a["edge".concat((0, t.a)(r.edge))], a["size".concat((0, t.a)(r.size))]]
            }
        })(e => {
            let {
                theme: r,
                ownerState: i
            } = e;
            return (0, a._)({
                textAlign: "center",
                flex: "0 0 auto",
                fontSize: r.typography.pxToRem(24),
                padding: 8,
                borderRadius: "50%",
                overflow: "visible",
                color: (r.vars || r).palette.action.active,
                transition: r.transitions.create("background-color", {
                    duration: r.transitions.duration.shortest
                })
            }, !i.disableRipple && {
                "&:hover": {
                    backgroundColor: r.vars ? "rgba(".concat(r.vars.palette.action.activeChannel, " / ").concat(r.vars.palette.action.hoverOpacity, ")") : (0, t.b)(r.palette.action.active, r.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "start" === i.edge && {
                marginLeft: "small" === i.size ? -3 : -12
            }, "end" === i.edge && {
                marginRight: "small" === i.size ? -3 : -12
            })
        }, e => {
            var r;
            let {
                theme: i,
                ownerState: o
            } = e, n = null == (r = (i.vars || i).palette) ? void 0 : r[o.color];
            return (0, a._)({}, "inherit" === o.color && {
                color: "inherit"
            }, "inherit" !== o.color && "default" !== o.color && (0, a._)({
                color: null == n ? void 0 : n.main
            }, !o.disableRipple && {
                "&:hover": (0, a._)({}, n && {
                    backgroundColor: i.vars ? "rgba(".concat(n.mainChannel, " / ").concat(i.vars.palette.action.hoverOpacity, ")") : (0, t.b)(n.main, i.palette.action.hoverOpacity)
                }, {
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                })
            }), "small" === o.size && {
                padding: 5,
                fontSize: i.typography.pxToRem(18)
            }, "large" === o.size && {
                padding: 12,
                fontSize: i.typography.pxToRem(28)
            }, {
                ["&.".concat(d.disabled)]: {
                    backgroundColor: "transparent",
                    color: (i.vars || i).palette.action.disabled
                }
            })
        }),
        u = r.forwardRef(function(e, r) {
            let o = (0, c.u)({
                    props: e,
                    name: "MuiIconButton"
                }),
                {
                    edge: s = !1,
                    children: d,
                    className: u,
                    color: p = "default",
                    disabled: m = !1,
                    disableFocusRipple: v = !1,
                    size: C = "medium"
                } = o,
                b = (0, t._)(o, g),
                y = (0, a._)({}, o, {
                    edge: s,
                    color: p,
                    disabled: m,
                    disableFocusRipple: v,
                    size: C
                }),
                S = (e => {
                    let {
                        classes: a,
                        disabled: r,
                        color: o,
                        edge: n,
                        size: s
                    } = e, c = {
                        root: ["root", r && "disabled", "default" !== o && "color".concat((0, t.a)(o)), n && "edge".concat((0, t.a)(n)), "size".concat((0, t.a)(s))]
                    };
                    return (0, i.a)(c, l, a)
                })(y);
            return (0, n.jsx)(h, (0, a._)({
                className: (0, i.c)(S.root, u),
                centerRipple: !0,
                focusRipple: !v,
                disabled: m,
                ref: r
            }, b, {
                ownerState: y,
                children: d
            }))
        });
    e.s(["I", 0, u, "i", 0, d])
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
                eventType: r,
                context: i,
                additionalProperties: o,
                currentUrl: n,
                guestId: s,
                sessionId: c
            } = e, l = t.toISOString(), d = new URL("".concat(this.baseUrl, "/pe"));
            return d.searchParams.append("t", a), d.searchParams.append("evt", r), d.searchParams.append("ctx", i), d.searchParams.append("lt", l), d.searchParams.append("url", n || window.location.href), void 0 !== s && d.searchParams.append("gid", s), void 0 !== c && d.searchParams.append("sid", c), void 0 !== o && Object.keys(o).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = o[e]) ? t : "").toString())
            }), fetch(d.href, {
                credentials: "same-origin"
            })
        }
        sendEventViaImg(e, t) {
            let a = this.buildEventUrl(e),
                r = new Image;
            return r.src = a.href, r.onload = () => {
                void 0 !== t && t(!0)
            }, r.onerror = () => {
                void 0 !== t && t(!1)
            }, r
        }
        async sendEventViaFetch(e, t) {
            let a = this.buildEventUrl(e),
                r = await fetch(a.href, {
                    mode: "cors",
                    credentials: "include",
                    keepalive: !0
                }).then(e => e.ok, () => !1);
            null == t || t(r)
        }
        buildEventUrl(e) {
            let {
                localTime: t,
                target: a,
                eventType: r,
                context: i,
                additionalProperties: o,
                currentUrl: n,
                guestId: s,
                sessionId: c
            } = e, l = t.toISOString(), d = new URL("".concat(this.baseUrl, "/e.png"));
            return d.searchParams.append("t", a), d.searchParams.append("evt", r), d.searchParams.append("ctx", i), d.searchParams.append("lt", l), d.searchParams.append("url", n || window.location.href), void 0 !== s && d.searchParams.append("gid", s), void 0 !== c && d.searchParams.append("sid", c), void 0 !== o && Object.keys(o).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = o[e]) ? t : "").toString())
            }), d
        }
        constructor(e = new a) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }])
}, 230644, e => {
    "use strict";
    var t = e.i(721281);
    class a {
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
            eventName: r,
            parameters: i,
            source: o,
            sessionId: n
        }) {
            (0, t._)(this, "eventType", "base"), (0, t._)(this, "product", void 0), (0, t._)(this, "url", void 0), (0, t._)(this, "parameters", void 0), (0, t._)(this, "eventName", void 0), (0, t._)(this, "source", void 0), (0, t._)(this, "sessionId", void 0), this.product = e, this.url = a, this.eventName = r, this.parameters = i, this.source = o, this.sessionId = n
        }
    }
    class r extends a {
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
            eventName: r,
            parameters: i,
            source: o,
            tags: n,
            sessionId: s
        }) {
            super({
                product: e,
                url: a,
                eventName: r,
                parameters: i,
                source: o,
                sessionId: s
            }), (0, t._)(this, "tags", []), this.tags = n || []
        }
    }
    e.s(["T", 0, r, "W", 0, class extends r {
        constructor({
            pageContext: e,
            ...a
        }) {
            var r;
            super(void 0 === e ? a : {
                ...a,
                parameters: {
                    ...a.parameters,
                    ...void 0 !== e.path ? {
                        path: e.path
                    } : {}
                },
                tags: [...null != (r = a.tags) ? r : [], ...e.tags, ...void 0 !== e.rosId ? ["owner: ".concat(e.rosId)] : []]
            }), (0, t._)(this, "eventType", "webvitals"), (0, t._)(this, "pageContext", void 0), this.pageContext = e
        }
    }])
}, 663624, e => {
    "use strict";
    var t = e.i(721281),
        a = e.i(230644),
        r = e.i(252842);
    class i extends a.T {
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
            eventName: r = "pageload",
            parameters: i,
            source: o,
            tags: n,
            sessionId: s,
            referralUrl: c
        }) {
            super({
                product: e,
                url: a,
                eventName: r,
                parameters: i,
                source: o,
                tags: n,
                sessionId: s
            }), (0, t._)(this, "referralUrl", void 0), (0, t._)(this, "eventType", "pageload"), this.referralUrl = c
        }
    }
    class o extends a.T {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "click")
        }
    }
    class n extends a.T {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "hover")
        }
    }
    class s extends a.T {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "imp")
        }
    }
    class c extends a.T {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "apivitals")
        }
    }
    class l extends a.T {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "error")
        }
    }
    class d extends a.T {
        constructor({
            product: e,
            url: a,
            eventName: r,
            parameters: i,
            source: o,
            sessionId: n
        }) {
            super({
                product: e,
                url: a,
                eventName: r,
                parameters: i,
                source: o,
                sessionId: n
            }), (0, t._)(this, "eventType", "session")
        }
    }
    class g extends a.T {
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
    class u {
        sendEvent(e) {
            let {
                localTime: t,
                target: a,
                eventType: r,
                context: i,
                additionalProperties: o,
                currentUrl: n,
                guestId: s,
                sessionId: c
            } = e, l = t.toISOString(), d = new URL("".concat(this.baseUrl, "/pe"));
            return d.searchParams.append("t", a), d.searchParams.append("evt", r), d.searchParams.append("ctx", i), d.searchParams.append("lt", l), d.searchParams.append("url", n || window.location.href), void 0 !== s && d.searchParams.append("gid", s), void 0 !== c && d.searchParams.append("sid", c), void 0 !== o && Object.keys(o).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = o[e]) ? t : "").toString())
            }), fetch(d.href, {
                credentials: "same-origin"
            })
        }
        sendEventViaImg(e, t) {
            let a = this.buildEventUrl(e),
                r = new Image;
            return r.src = a.href, r.onload = () => {
                void 0 !== t && t(!0)
            }, r.onerror = () => {
                void 0 !== t && t(!1)
            }, r
        }
        async sendEventViaFetch(e, t) {
            let a = this.buildEventUrl(e),
                r = await fetch(a.href, {
                    mode: "cors",
                    credentials: "include",
                    keepalive: !0
                }).then(e => e.ok, () => !1);
            null == t || t(r)
        }
        buildEventUrl(e) {
            let {
                localTime: t,
                target: a,
                eventType: r,
                context: i,
                additionalProperties: o,
                currentUrl: n,
                guestId: s,
                sessionId: c
            } = e, l = t.toISOString(), d = new URL("".concat(this.baseUrl, "/e.png"));
            return d.searchParams.append("t", a), d.searchParams.append("evt", r), d.searchParams.append("ctx", i), d.searchParams.append("lt", l), d.searchParams.append("url", n || window.location.href), void 0 !== s && d.searchParams.append("gid", s), void 0 !== c && d.searchParams.append("sid", c), void 0 !== o && Object.keys(o).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = o[e]) ? t : "").toString())
            }), d
        }
        constructor(e = new h) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }
    let p = "CreatorWeb";
    class m {
        logEvent(e) {
            let {
                url: t,
                ...a
            } = e.toLogEventObject(), {
                viewportWidth: r,
                viewportHeight: i
            } = {
                viewportWidth: window.innerWidth,
                viewportHeight: window.innerHeight
            }, o = {};
            Object.keys(a).forEach(e => {
                let t = a[e];
                null != t && (o[e] = t.toString())
            }), this.eventStreamTracker.sendEventViaImg({
                target: p,
                eventType: p,
                localTime: new Date,
                context: String(e.eventType),
                currentUrl: String(t),
                additionalProperties: {
                    ...o,
                    loggerVersion: "1.11.0",
                    viewportWidth: r,
                    viewportHeight: i
                }
            })
        }
        constructor({
            eventBaseUrl: e
        }) {
            (0, t._)(this, "eventStreamTracker", void 0), this.eventStreamTracker = new u(new h({
                baseUrl: "".concat(e, "/").concat(p)
            }))
        }
    }
    let v = "CreatorDashboard";
    class C {
        log(e) {
            let {
                eventType: t,
                context: a,
                properties: i,
                sessionId: o,
                currentUrl: n
            } = e, s, c = function(e) {
                let t = {};
                for (let [a, r] of Object.entries(e)) void 0 !== r && (t[a] = r);
                return t
            }(i), l = null == (s = (0, r.getCookieValueByKey)("GuestData")) ? void 0 : s.split("=")[1], d = {
                target: v,
                eventType: t,
                context: a,
                currentUrl: n,
                localTime: new Date,
                ...void 0 !== o ? {
                    sessionId: o
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
            (0, t._)(this, "eventStreamTracker", void 0), this.eventStreamTracker = new u(new h({
                baseUrl: "".concat(e, "/").concat(v)
            }))
        }
    }
    class b {
        notify() {
            this.listeners.forEach(e => e())
        }
        constructor(e = () => performance.now(), a = () => "".concat(window.location.pathname).concat(window.location.search)) {
            (0, t._)(this, "now", void 0), (0, t._)(this, "getInitialUrl", void 0), (0, t._)(this, "navigation", void 0), (0, t._)(this, "committedNavigation", void 0), (0, t._)(this, "nextId", 0), (0, t._)(this, "settledId", void 0), (0, t._)(this, "listeners", new Set), (0, t._)(this, "subscribe", e => (this.listeners.add(e), () => {
                this.listeners.delete(e)
            })), (0, t._)(this, "getSnapshot", () => (this.navigation || (this.navigation = {
                id: this.nextId++,
                url: this.getInitialUrl(),
                startedAt: 0,
                type: "initial",
                isNavigating: !1
            }, this.committedNavigation = this.navigation), this.navigation)), (0, t._)(this, "start", e => {
                this.getSnapshot(), this.navigation = {
                    id: this.nextId++,
                    url: e,
                    startedAt: this.now(),
                    type: "client",
                    isNavigating: !0
                }, this.notify()
            }), (0, t._)(this, "complete", e => {
                var t;
                (null == (t = this.navigation) ? void 0 : t.url) === e && (this.navigation = {
                    ...this.navigation,
                    isNavigating: !1
                }, this.committedNavigation = this.navigation, this.notify())
            }), (0, t._)(this, "cancel", (e, t) => {
                var a;
                (null == (a = this.navigation) ? void 0 : a.url) === t && (this.navigation = this.committedNavigation, this.notify())
            }), (0, t._)(this, "claim", e => {
                var t;
                return (null == (t = this.navigation) ? void 0 : t.id) === e && !this.navigation.isNavigating && this.settledId !== e && (this.settledId = e, !0)
            }), this.now = e, this.getInitialUrl = a
        }
    }
    class y {
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
    class f {
        static parseCookieValue() {
            let e = (0, r.getCookieValueByKey)("UnifiedLoggerSession");
            return e ? decodeURIComponent(e).split("&").reduce((e, t) => {
                let [a, r] = t.split("=");
                return e[a] = JSON.parse(r), e
            }, {}) : {}
        }
        initCacheFromCookies() {
            let e = f.parseCookieValue();
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
            let t = r.uuidService.generateRandomUuid(),
                a = Date.now();
            return this.cache = {
                sessionId: t,
                lastActivity: a,
                timestamp: e
            }, this.onSessionRefresh(t), this.updateCookie(), t
        }
        refreshSessionIdIfNeeded(e) {
            let t = this.initCacheFromCookies();
            if (!t) return this.refreshSessionId(e);
            let {
                sessionId: a,
                lastActivity: r
            } = t;
            return e - r > this.inactiveSessionExpireTime ? this.refreshSessionId(e) : (this.cache = {
                sessionId: a,
                lastActivity: e,
                timestamp: e
            }, this.updateCookie(), a)
        }
        updateCookie() {
            if (!this.cache) return;
            let e = f.parseCookieValue();
            e[this.productName] = this.cache, (0, r.setCookie)("UnifiedLoggerSession", Object.entries(e).map(e => {
                let [t, {
                    sessionId: a,
                    lastActivity: r
                }] = e;
                return "".concat(t, "=").concat(JSON.stringify({
                    sessionId: a,
                    lastActivity: r
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
            inactiveSessionExpireTime: r = 18e5,
            onSessionRefresh: i = () => {}
        }) {
            (0, t._)(this, "productName", void 0), (0, t._)(this, "cache", void 0), (0, t._)(this, "cacheExpiryTime", void 0), (0, t._)(this, "inactiveSessionExpireTime", void 0), (0, t._)(this, "onSessionRefresh", void 0), this.productName = e, this.cacheExpiryTime = a, this.inactiveSessionExpireTime = r, this.onSessionRefresh = i
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
                    for (var t, a = arguments.length, r = Array(a), i = 0; i < a; i++) r[i] = arguments[i];
                    let o, n = e.apply(this, r),
                        s = (t = "pushState", "function" == typeof Event ? o = new Event(t) : (o = document.createEvent("Event")).initEvent(t, !0, !0), o);
                    return window.dispatchEvent(s), n
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
            this.commonEventParameters && (e.parameters = {
                ...this.commonEventParameters,
                ...e.parameters
            }), this.eventLoggers.forEach(t => {
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
                        tags: e.tags,
                        pageContext: e.pageContext
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
                r = new i({
                    product: this.product,
                    url: t,
                    sessionId: a,
                    referralUrl: null != (e = this.referrer) ? e : document.referrer,
                    parameters: {
                        browserLocale: navigator.language
                    }
                });
            this.events.emit("pageload", r), this.logEventToLogger(r), this.referrer = t, this.lastPageLoadUrl = t
        }
        logClickEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: r
            } = e, i = S(), n = this.sessionService.getOrCreateSessionId(), s = new o({
                product: this.product,
                url: i,
                sessionId: n,
                eventName: t,
                parameters: a,
                tags: r
            });
            this.events.emit("click", s), this.logEventToLogger(s)
        }
        logImpressionEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: r
            } = e, i = S(), o = this.sessionService.getOrCreateSessionId(), n = new s({
                product: this.product,
                url: i,
                sessionId: o,
                eventName: t,
                parameters: a,
                tags: r
            });
            this.events.emit("impression", n), this.logEventToLogger(n)
        }
        logHoverEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: r
            } = e, i = S(), o = this.sessionService.getOrCreateSessionId(), s = new n({
                product: this.product,
                url: i,
                sessionId: o,
                eventName: t,
                parameters: a,
                tags: r
            });
            this.events.emit("hover", s), this.logEventToLogger(s)
        }
        logPageSettledEvent(e) {
            let {
                navigationId: t,
                page: a,
                outcome: r
            } = e;
            if (!this.pageSettledTracker.claim(t)) return;
            let i = this.pageSettledTracker.getSnapshot();
            this.logWebVitalsEvent({
                eventName: "pageSettled",
                parameters: {
                    page: a,
                    durationMs: String(Math.round(performance.now() - i.startedAt)),
                    outcome: r,
                    navigationType: i.type,
                    navigationId: String(t)
                }
            })
        }
        logWebVitalsEvent(e) {
            let {
                eventName: t,
                parameters: r,
                tags: i,
                pageContext: o
            } = e, n = S(), s = this.sessionService.getOrCreateSessionId(), c = new a.W({
                product: this.product,
                url: n,
                sessionId: s,
                eventName: t,
                parameters: r,
                tags: i,
                pageContext: o
            });
            this.events.emit("webvitals", c), this.logEventToLogger(c)
        }
        logApiVitalsEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: r
            } = e, i = S(), o = this.sessionService.getOrCreateSessionId(), n = new c({
                product: this.product,
                url: i,
                sessionId: o,
                eventName: t,
                parameters: a,
                tags: r
            });
            this.events.emit("apivitals", n), this.logEventToLogger(n)
        }
        logFormVitalsEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: r
            } = e, i = S(), o = this.sessionService.getOrCreateSessionId(), n = new g({
                product: this.product,
                url: i,
                sessionId: o,
                eventName: t,
                parameters: a,
                tags: r
            });
            this.events.emit("formvitals", n), this.logEventToLogger(n)
        }
        logErrorEvent(e) {
            let {
                eventName: t,
                parameters: a,
                tags: r
            } = e, i = S(), o = this.sessionService.getOrCreateSessionId(), n = new l({
                product: this.product,
                url: i,
                sessionId: o,
                eventName: t,
                parameters: a,
                tags: r
            });
            this.events.emit("error", n), this.logEventToLogger(n)
        }
        logHostRoutedEvent(e) {
            let {
                eventType: t,
                context: a,
                properties: r,
                hostProperties: i = {}
            } = e, o = S(), n = this.sessionService.getOrCreateSessionId();
            this.hostRoutedEventStreamLogger.log({
                eventType: t,
                context: a,
                properties: {
                    ...i,
                    ...this.commonEventParameters,
                    ...r
                },
                sessionId: n,
                currentUrl: o
            })
        }
        logSessionEvent(e) {
            let {
                eventName: t,
                sessionId: a,
                parameters: r,
                tags: i
            } = e, o = S(), n = new d({
                product: this.product,
                url: o,
                eventName: t,
                sessionId: a,
                parameters: r,
                tags: i
            });
            this.events.emit("session", n), this.logEventToLogger(n)
        }
        onPageLoadEvent(e) {
            this.events.on("pageload", e)
        }
        constructor({
            eventBaseUrl: e,
            product: a,
            commonEventParameters: r,
            debugMode: i,
            eventLogger: o,
            sessionProductGroup: n,
            disableSession: s = !1
        }) {
            (0, t._)(this, "eventLoggers", []), (0, t._)(this, "debugMode", !1), (0, t._)(this, "product", void 0), (0, t._)(this, "commonEventParameters", void 0), (0, t._)(this, "sessionProductGroup", void 0), (0, t._)(this, "sessionService", void 0), (0, t._)(this, "hostRoutedEventStreamLogger", void 0), (0, t._)(this, "disableSession", void 0), (0, t._)(this, "lastPageLoadUrl", void 0), (0, t._)(this, "referrer", void 0), (0, t._)(this, "isAutoCollectEnabled", !1), (0, t._)(this, "events", function() {
                let e = new Map;
                return {
                    on(t, a) {
                        e.has(t) ? e.get(t).push(a) : e.set(t, [a])
                    },
                    off(t, a) {
                        e.has(t) && e.set(t, (e.get(t) || []).filter(e => e !== a))
                    },
                    emit(t, a) {
                        for (var r = arguments.length, i = Array(r > 2 ? r - 2 : 0), o = 2; o < r; o++) i[o - 2] = arguments[o];
                        (e.get(t) || []).forEach(e => {
                            e(a, ...i)
                        })
                    }
                }
            }()), (0, t._)(this, "pageSettledTracker", new b), (0, t._)(this, "onSessionRefresh", e => {
                this.logSessionEvent({
                    eventName: "sessionStart",
                    sessionId: e
                })
            }), this.eventLoggers.push(null != o ? o : new m({
                eventBaseUrl: e
            })), this.debugMode = !!i, this.product = a, this.commonEventParameters = r, this.sessionProductGroup = null != n ? n : a, this.debugMode && this.eventLoggers.push(new y), this.hostRoutedEventStreamLogger = new C({
                eventBaseUrl: e
            }), this.disableSession = s, this.sessionService = this.disableSession ? {
                getOrCreateSessionId: () => {}
            } : new f({
                productName: this.sessionProductGroup,
                onSessionRefresh: this.onSessionRefresh
            })
        }
    }])
}]);

//# debugId=b1a63a12-9622-d015-7b4a-e37791825874
//# sourceMappingURL=15k3s3lxsnrh2.js.map