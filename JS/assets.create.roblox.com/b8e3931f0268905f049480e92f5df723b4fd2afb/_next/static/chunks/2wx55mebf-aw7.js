;
! function() {
    try {
        var e = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof global ? global : "undefined" != typeof window ? window : "undefined" != typeof self ? self : {},
            n = (new e.Error).stack;
        n && ((e._debugIds || (e._debugIds = {}))[n] = "42503e2a-5edb-a991-7a0e-49756653ed95")
    } catch (e) {}
}();
(globalThis.TURBOPACK || (globalThis.TURBOPACK = [])).push(["object" == typeof document ? document.currentScript : void 0, 889311, e => {
    "use strict";
    var t, i = ((t = i || {}).DownloadStudio = "downloadStudio", t.ExportKpiChart = "exportKpiChart", t.ViewComputeTab = "viewComputeTab", t.DateRangeChanged = "dateRangeChanged", t.DataDivisionChanged = "dataDivisionChanged", t.PageBreakdownsToggled = "pageBreakdownsToggled", t.PageVersionAnnotationsToggled = "pageVersionAnnotationsToggled", t.PageFiltersChanged = "pageFiltersChanged", t.ChartTooltipViewed = "chartTooltipViewed", t.PageTabSelected = "pageTabSelected", t.RbxClientRequest = "rbxClientRequest", t.StudioStartAttempt = "studioStartAttempt", t.StudioStartSuccess = "studioStartSuccess", t.ViewTranslatorPortal = "viewTranslatorPortal", t.ViewLocalization = "viewLocalization", t.SelectAddSupportedLanguage = "selectAddSupportedLanguage", t.ManageSupportedLanguage = "manageSupportedLanguage", t.LearnMoreAutomaticQuota = "learnMoreAutomaticQuota", t.ShareLinkTranslators = "shareLinkTranslators", t.SelectInviteTranslators = "selectInviteTranslators", t.InviteTranslatorsModel = "inviteTranslatorsModel", t.DownloadContributorReport = "downloadContributorReport", t.AutomaticTextCaptureToggled = "automaticTextCaptureToggled", t.UseTranslatedContentToggled = "useTranslatedContentToggled", t.ClearAutoCapturedTable = "clearAutoCapturedTable", t.OpenSwitchOffAutomaticTranslationConfirmDialogue = "openSwitchOffAutomaticTranslationConfirmDialogue", t.SwitchOffAutomaticTranslation = "switchOffAutomaticTranslation", t.SwitchOnAutomaticTranslation = "switchOnAutomaticTranslation", t.UpdateUniverseInformation = "updateUniverseInformation", t.SelectAddTranslationEntry = "selectAddTranslationEntry", t.AddTranslationEntry = "addTranslationEntry", t.SearchTranslationEntryList = "searchTranslationEntryList", t.FilterTranslationEntryList = "filterTranslationEntryList", t.FilterTranslationProductList = "filterTranslationProductList", t.UpdateGameProductTranslation = "updateGameProductTranslation", t.UpdateGameProductIcon = "updateGameProductIcon", t.UpdateUniverseIconAndThumbnail = "updateUniverseIconAndThumbnail", t.ViewNotifications = "viewNotifications", t.NotificationStringListLoaded = "notificationStringListLoaded", t.GetNotificationStringsList = "getNotificationStringsList", t.GetNotificationStringsListSuccess = "getNotificationStringsListSuccess", t.GetNotificationStringsListFailure = "getNotificationStringsListFailure", t.GetNotificationString = "getNotificationString", t.GetNotificationStringSuccess = "getNotificationStringSuccess", t.GetNotificationStringFailure = "getNotificationStringFailure", t.ArchiveNotificationContent = "archiveNotificationContent", t.ArchiveNotificationContentSuccess = "archiveNotificationContentSuccess", t.ArchiveNotificationContentFailure = "archiveNotificationContentFailure", t.CopyNotificationContentAssetId = "copyNotificationContentAssetId", t.CreateNotificationContent = "createNotificationContent", t.CreateNotificationContentSuccess = "createNotificationContentSuccess", t.CreateNotificationContentFailure = "createNotificationContentFailure", t.InitiateCreateNotificationContent = "initiateCreateNotificationContent", t.InitiateEditNotificationContent = "initiateEditNotificationContent", t.EditNotificationStringLoaded = "editNotificationStringLoaded", t.EditNotificationContent = "editNotificationContent", t.EditNotificationContentSuccess = "editNotificationContentSuccess", t.EditNotificationContentFailure = "editNotificationContentFailure", t.ViewNotificationCampaignAnalytics = "viewNotificationCampaignAnalytics", t.AssetCreationAttempt = "assetCreationAttempt", t.AssetCreationFailure = "assetCreationFailure", t.EventCreationExposure = "exposedToEventCreation", t.EventCreationInitiated = "initiateEventCreation", t.EventCreationDiscarded = "discardUnsavedEventChanges", t.EventCreationSaveDraft = "saveEventAsDraft", t.EventCreationDeleteDraft = "deleteEventDraft", t.EventCreationPublish = "publishEvent", t.EventCreationLinkCopied = "virtualEventLinkCopied", t.NotificationsSettingsCategoryLoad = "notificationSettingsCategoryLoad", t.NotificationsSettingsLeftNavClick = "notificationSettingsLeftNavClick", t.NotificationsSettingsCategoryCancelClick = "notificationsSettingsCategoryCancelClick", t.DocumentationLanguageChanged = "documentationLanguageChanged", t.ClickMarketplaceOnboardingCountry = "clickMarketplaceOnboardingCountry", t.ImpressionCreatorOpportunityTable = "impressionCreatorOpportunityTable", t.ClickCreatorOpportunityTable = "clickCreatorOpportunityTable", t.ClickShareLinkPromoApplyNow = "clickShareLinkPromoApplyNow", t.RightsManagerSearchClick = "rightsManagerSearchClick", t.RightsManagerSearchResultClick = "rightsManagerSearchResultClick", t.RightsManagerSearchResultSubmitted = "rightsManagerSearchResultSubmitted", t.RightsManagerSearchResultsLoad = "rightsManagerSearchResultsLoad", t.RightsManagerSearchResultsEnd = "rightsManagerSearchResultsEnd", t.DownloadPlayerFeedbackCommentsClick = "downloadPlayerFeedbackCommentsClick", t.PageNotFound = "pageNotFound", t.PageNotFoundReturnButtonClick = "pageNotFoundReturnButtonClick", t.PlayerFeedbackSummaryClick = "playerFeedbackSummaryClick", t.AgeVerificationUpsellBanner = "ageVerificationUpsellBanner", t.AgeVerificationUpsellBannerClick = "ageVerificationUpsellBannerClick", t.AgeVerificationUpsellBannerError = "ageVerificationUpsellBannerError", t.BetaTaxonomyToggle = "betaTaxonomyToggle", t.AssetPrivacyOptOutSurveySubmitted = "assetPrivacyOptOutSurveySubmitted", t.TalentHubV2JobCardClick = "talentHubV2JobCardClick", t.UnratedExperienceBanner = "unratedExperienceBanner", t.UnratedExperienceBannerClick = "unratedExperienceBannerClick", t.ActivationEligibilityBanner = "activationEligibilityBanner", t.ActivationEligibilityBannerClick = "activationEligibilityBannerClick", t.UnifiedAlertImpression = "unifiedAlertImpression", t.UnifiedAlertClick = "unifiedAlertClick", t.TalentHubV2FilterChange = "talentHubV2FilterChange", t.TalentHubV2ApplyClick = "talentHubV2ApplyClick", t.TalentHubV2StudioCardClick = "talentHubV2StudioCardClick", t.TalentHubV2ProfileSave = "talentHubV2ProfileSave", t.TalentHubV2InboxRowClick = "talentHubV2InboxRowClick", t.TalentHubV2JobsPageView = "talentHubV2JobsPageView", t.TalentHubV2StudiosPageView = "talentHubV2StudiosPageView", t.TalentHubV2StudioProfilePageView = "talentHubV2StudioProfilePageView", t.TalentHubV2TalentProfilePageView = "talentHubV2TalentProfilePageView", t.TalentHubV2InboxPageView = "talentHubV2InboxPageView", t.TalentHubV2PostJobPageView = "talentHubV2PostJobPageView", t.TalentHubV2JobPostSubmit = "talentHubV2JobPostSubmit", t.TalentHubV2JobEditSubmit = "talentHubV2JobEditSubmit", t.CreatorStoreCustomThumbnailUpload = "creatorStoreCustomThumbnailUpload", t.StatusBadgeClick = "statusBadgeClick", t.StatusBadgeImpression = "statusBadgeImpression", t.StatusBadgeTooltipOpen = "statusBadgeTooltipOpen", t.PublishEligibilityBannerImpression = "publishEligibilityBannerImpression", t.PublishEligibilityBannerClick = "publishEligibilityBannerClick", t.AudienceReachGrowthOpportunitiesBannerImpression = "audienceReachGrowthOpportunitiesBannerImpression", t.AudienceReachGrowthOpportunitiesBannerClick = "audienceReachGrowthOpportunitiesBannerClick", t.TalentHubV2ApplicationSubmit = "talentHubV2ApplicationSubmit", t.TalentHubV2ProfileCreate = "talentHubV2ProfileCreate", t.TalentHubV2ApplicantStatusChange = "talentHubV2ApplicantStatusChange", t.TalentHubV2JobClose = "talentHubV2JobClose", t.TalentHubV2CreateStudioSubmit = "talentHubV2CreateStudioSubmit", t.TalentHubV2CreateStudioSuccess = "talentHubV2CreateStudioSuccess", t.TalentHubV2CreateStudioError = "talentHubV2CreateStudioError", t.TalentHubV2InteractionClick = "talentHubV2InteractionClick", t.ImpactedExperiencesBanner = "impactedExperiencesBanner", t.ImpactedExperiencesBannerClick = "impactedExperiencesBannerClick", t.ImpactedExperiencesFilterClick = "impactedExperiencesFilterClick", t.ImpactedExperienceCardCollaborateClick = "impactedExperienceCardCollaborateClick", t.ImpactedExperiencesLoadMoreClick = "impactedExperiencesLoadMoreClick", t.ImpactedBannerScoutStart = "impactedBannerScoutStart", t.ImpactedBannerScoutFound = "impactedBannerScoutFound", t.ImpactedBannerScoutGaveUp = "impactedBannerScoutGaveUp", t.EstablishTrustDialog = "establishTrustDialog", t.EstablishTrustDialogClick = "establishTrustDialogClick", t.SafetyCollaboratorsImpression = "safetyCollaboratorsImpression", t.SafetyCollaboratorsClick = "safetyCollaboratorsClick", t.SafetyCollaboratorsError = "safetyCollaboratorsError", t.MomentsCreationsAttempt = "momentsCreationsAttempt", t.MomentsCreationsSuccess = "momentsCreationsSuccess", t.MomentsCreationsError = "momentsCreationsError", t.RoadmapDetailFeedbackSubmit = "roadmapDetailFeedbackSubmit", t.RoadmapPageView = "roadmapPageView", t.RoadmapItemClick = "roadmapItemClick", t.RoadmapFilterApplied = "roadmapFilterApplied", t.RoadmapFeedbackOpen = "roadmapFeedbackOpen", t.RoadmapFeedbackClose = "roadmapFeedbackClose", t.RoadmapItemImpression = "roadmapItemImpression", t.RoadmapItemLikeToggle = "roadmapItemLikeToggle", t);
    e.s(["default", 0, i])
}, 215955, 512229, e => {
    "use strict";
    var t = e.i(710675),
        i = e.i(721281),
        a = e.i(252842),
        r = e.i(95656),
        n = e.i(889311);
    let s = "https://ecsv2.".concat("roblox.com"),
        o = "".concat(s, "/CreatorDashboard"),
        l = ["loadPage", n.default.AssetPrivacyOptOutSurveySubmitted],
        c = new class {
            setUnifiedLoggerClient(e) {
                this.unifiedLoggerClient = e
            }
            shouldDoubleWriteToUnifiedLogger(e) {
                return !(!this.unifiedLoggerClient || l.includes(e.eventType))
            }
            sendEventToUnifiedLogger(e) {
                if (!this.unifiedLoggerClient) return;
                let t = {},
                    i = e.additionalProperties || {};
                Object.keys(i).forEach(e => {
                    let a = i[e];
                    null != a && (t[e] = a.toString())
                });
                let a = {
                    eventName: e.eventType,
                    parameters: t
                };
                "load" === e.context ? this.unifiedLoggerClient.logImpressionEvent(a) : "hover" === e.context ? this.unifiedLoggerClient.logHoverEvent(a) : "click" === e.context && this.unifiedLoggerClient.logClickEvent(a)
            }
            sendEvent(e) {
                let t = (0, a.getCookieValueByKey)("GuestData"),
                    i = null == t ? void 0 : t.split("=")[1],
                    r = {
                        target: "CreatorDashboard",
                        localTime: new Date,
                        eventType: e.eventType,
                        context: e.context,
                        guestId: i,
                        additionalProperties: e.additionalProperties
                    };
                return this.shouldDoubleWriteToUnifiedLogger(r) && this.sendEventToUnifiedLogger(r), this.tracker.sendEventViaImg(r)
            }
            constructor() {
                (0, i._)(this, "tracker", void 0), (0, i._)(this, "unifiedLoggerClient", void 0);
                const e = new r.Configuration({
                    baseUrl: o
                });
                this.tracker = new r.Tracker(e)
            }
        };
    e.s(["default", 0, c, "eventStreamBaseUrl", 0, s], 512229);
    let d = /experiences\/.+\/access\/*$/,
        g = /experiences\/.+\/(associated-items\?activeTab=Pass|passes)\/?/,
        u = /experiences\/.+\/permissions\/*$/,
        p = /store\/.+\/permissions\/*$/,
        h = /events\/.+\/configure\/*$/,
        m = /experiences\/.+\/feedback\/*$/,
        v = /explore\/licenses\/.+\/*$/,
        f = /explore\/licenses\/.+\/.+\/request$/,
        b = /license-manager\/agreements\/.+\/*$/,
        C = /license-manager\/license-listings\/.+\/*$/,
        S = /license-manager\/creator-agreements\/.+\/*$/,
        y = /ip\/ip-library\/.+\/*$/,
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
        x = [{
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
        I = e => {
            let t = e.getURL(),
                i = t ? new URL(t).pathname : "",
                a = E.find(e => {
                    let t = i.match(e.regex);
                    return t && e.matchGroups.every((e, i) => e === t[i + 1])
                });
            a && a.tags.forEach(t => e.addTag(t));
            let r = x.find(e => i.match(e.regex));
            r && r.tags.forEach(t => e.addTag(t)), i.endsWith("settings/webhooks") ? e.addTag("settings/webhooks") : i.endsWith("settings/preferences") ? e.addTag("settings/preferences") : i.endsWith("roadmap") ? e.addTag("roadmap") : i.endsWith("landing") ? e.addTag("landing") : "/" === i ? e.addTag("homepage") : i.endsWith("creator") ? e.addTag("developerLanding") : d.test(i) ? e.addTag("experiences/access") : (null == t ? void 0 : t.match(g)) ? e.addTag("gamepass") : i.endsWith("activity-history") && !r ? e.addTag("activity-feed") : u.test(i) ? e.addTag("experiences/permissions") : p.test(i) ? e.addTag("asset/permissions") : i.endsWith("events/create") ? e.addTag("events/create") : h.test(i) ? e.addTag("events/configure") : m.test(i) ? e.addTag("player-feedback") : i.endsWith("rights-manager") || i.endsWith("rights-manager/register") ? e.addTag("rights-manager/register") : i.endsWith("rights-manager/removal-requests") ? e.addTag("rights-manager/removal-requests") : i.endsWith("rights-manager/matches") ? e.addTag("rights-manager/matches") : i.endsWith("license-manager/licenses") ? e.addTag("license-manager/licenses") : i.endsWith("license-manager/matches") ? e.addTag("license-manager/matches") : i.endsWith("license-manager/ip-library") ? e.addTag("license-manager/ip-library") : i.endsWith("license-manager/creator-agreements") ? e.addTag("license-manager/creator-agreements") : C.test(i) ? e.addTag("license-manager/license-listings/view-listing") : b.test(i) ? e.addTag("license-manager/agreements/view-agreement") : S.test(i) ? e.addTag("license-manager/creator-agreements/view-agreement") : i.endsWith("license-manager/ip-library/create") ? e.addTag("license-manager/ip-library/create") : y.test(i) ? e.addTag("license-manager/ip-library/view-family") : i.endsWith("explore/licenses") ? e.addTag("explore/licenses") : v.test(i) ? e.addTag("explore/licenses/view-listing") : f.test(i) && e.addTag("explore/licenses/request")
        };
    T.events.on("pageload", e => {
        I(e)
    }), T.events.on("webvitals", e => {
        I(e)
    }), T.events.on("apivitals", e => {
        I(e)
    }), T.events.on("session", e => {
        let t = e.getURL(),
            i = t ? new URL(t).pathname : "";
        i.endsWith("roadmap") ? e.addTag("roadmap") : i.endsWith("landing") ? e.addTag("landing") : "/" === i ? e.addTag("homepage") : i.endsWith("creator") && e.addTag("developerLanding")
    }), e.s(["default", 0, T], 215955)
}, 954284, e => {
    "use strict";
    var t = e.i(962560),
        i = e.i(273589),
        a = e.i(416340),
        r = e.i(652199),
        n = e.i(67736),
        s = e.i(221628),
        o = e.i(163482),
        l = e.i(208958),
        c = e.i(453209);
    e.i(537500);
    let d = ["addEndListener", "appear", "children", "easing", "in", "onEnter", "onEntered", "onEntering", "onExit", "onExited", "onExiting", "style", "timeout", "TransitionComponent"];

    function g(e) {
        return "scale(".concat(e, ", ").concat(e ** 2, ")")
    }
    let u = {
            entering: {
                opacity: 1,
                transform: g(1)
            },
            entered: {
                opacity: 1,
                transform: "none"
            }
        },
        p = "u" > typeof navigator && /^((?!chrome|android).)*(safari|mobile)/i.test(navigator.userAgent) && /(os |version\/)15(.|_)4/i.test(navigator.userAgent),
        h = a.forwardRef(function(e, h) {
            let {
                addEndListener: m,
                appear: v = !0,
                children: f,
                easing: b,
                in: C,
                onEnter: S,
                onEntered: y,
                onEntering: T,
                onExit: w,
                onExited: E,
                onExiting: x,
                style: I,
                timeout: k = "auto",
                TransitionComponent: L = n.T
            } = e, N = (0, i._)(e, d), P = (0, o.u)(), A = a.useRef(), V = (0, r.u)(), U = a.useRef(null), R = (0, l.u)(U, (0, c.g)(f), h), _ = e => t => {
                if (e) {
                    let i = U.current;
                    void 0 === t ? e(i) : e(i, t)
                }
            }, O = _(T), B = _((e, t) => {
                let i;
                (0, n.r)(e);
                let {
                    duration: a,
                    delay: r,
                    easing: s
                } = (0, n.g)({
                    style: I,
                    timeout: k,
                    easing: b
                }, {
                    mode: "enter"
                });
                "auto" === k ? A.current = i = V.transitions.getAutoHeightDuration(e.clientHeight) : i = a, e.style.transition = [V.transitions.create("opacity", {
                    duration: i,
                    delay: r
                }), V.transitions.create("transform", {
                    duration: p ? i : .666 * i,
                    delay: r,
                    easing: s
                })].join(","), S && S(e, t)
            }), H = _(y), D = _(x), z = _(e => {
                let t, {
                    duration: i,
                    delay: a,
                    easing: r
                } = (0, n.g)({
                    style: I,
                    timeout: k,
                    easing: b
                }, {
                    mode: "exit"
                });
                "auto" === k ? A.current = t = V.transitions.getAutoHeightDuration(e.clientHeight) : t = i, e.style.transition = [V.transitions.create("opacity", {
                    duration: t,
                    delay: a
                }), V.transitions.create("transform", {
                    duration: p ? t : .666 * t,
                    delay: p ? a : a || .333 * t,
                    easing: r
                })].join(","), e.style.opacity = 0, e.style.transform = g(.75), w && w(e)
            }), F = _(E);
            return (0, s.jsx)(L, (0, t._)({
                appear: v,
                in: C,
                nodeRef: U,
                onEnter: B,
                onEntered: H,
                onEntering: O,
                onExit: z,
                onExited: F,
                onExiting: D,
                addEndListener: e => {
                    "auto" === k && P.start(A.current || 0, e), m && m(U.current, e)
                },
                timeout: "auto" === k ? null : k
            }, N, {
                children: (e, i) => a.cloneElement(f, (0, t._)({
                    style: (0, t._)({
                        opacity: 0,
                        transform: g(.75),
                        visibility: "exited" !== e || C ? void 0 : "hidden"
                    }, u[e], I, f.props.style),
                    ref: R
                }, i))
            }))
        });
    h.muiSupportAuto = !0, e.s(["G", 0, h])
}, 79559, e => {
    "use strict";
    var t = e.i(273589),
        i = e.i(962560),
        a = e.i(416340),
        r = e.i(42569),
        n = e.i(696180),
        s = e.i(221628),
        o = e.i(232625),
        l = e.i(963320);

    function c(e) {
        return (0, t.g)("MuiIconButton", e)
    }
    e.i(485511);
    var d = (0, n.g)("MuiIconButton", ["root", "disabled", "colorInherit", "colorPrimary", "colorSecondary", "colorError", "colorInfo", "colorSuccess", "colorWarning", "edgeStart", "edgeEnd", "sizeSmall", "sizeMedium", "sizeLarge"]);
    let g = ["edge", "children", "className", "color", "disabled", "disableFocusRipple", "size"],
        u = (0, r.s)(o.B, {
            name: "MuiIconButton",
            slot: "Root",
            overridesResolver: (e, i) => {
                let {
                    ownerState: a
                } = e;
                return [i.root, "default" !== a.color && i["color".concat((0, t.a)(a.color))], a.edge && i["edge".concat((0, t.a)(a.edge))], i["size".concat((0, t.a)(a.size))]]
            }
        })(e => {
            let {
                theme: a,
                ownerState: r
            } = e;
            return (0, i._)({
                textAlign: "center",
                flex: "0 0 auto",
                fontSize: a.typography.pxToRem(24),
                padding: 8,
                borderRadius: "50%",
                overflow: "visible",
                color: (a.vars || a).palette.action.active,
                transition: a.transitions.create("background-color", {
                    duration: a.transitions.duration.shortest
                })
            }, !r.disableRipple && {
                "&:hover": {
                    backgroundColor: a.vars ? "rgba(".concat(a.vars.palette.action.activeChannel, " / ").concat(a.vars.palette.action.hoverOpacity, ")") : (0, t.b)(a.palette.action.active, a.palette.action.hoverOpacity),
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                }
            }, "start" === r.edge && {
                marginLeft: "small" === r.size ? -3 : -12
            }, "end" === r.edge && {
                marginRight: "small" === r.size ? -3 : -12
            })
        }, e => {
            var a;
            let {
                theme: r,
                ownerState: n
            } = e, s = null == (a = (r.vars || r).palette) ? void 0 : a[n.color];
            return (0, i._)({}, "inherit" === n.color && {
                color: "inherit"
            }, "inherit" !== n.color && "default" !== n.color && (0, i._)({
                color: null == s ? void 0 : s.main
            }, !n.disableRipple && {
                "&:hover": (0, i._)({}, s && {
                    backgroundColor: r.vars ? "rgba(".concat(s.mainChannel, " / ").concat(r.vars.palette.action.hoverOpacity, ")") : (0, t.b)(s.main, r.palette.action.hoverOpacity)
                }, {
                    "@media (hover: none)": {
                        backgroundColor: "transparent"
                    }
                })
            }), "small" === n.size && {
                padding: 5,
                fontSize: r.typography.pxToRem(18)
            }, "large" === n.size && {
                padding: 12,
                fontSize: r.typography.pxToRem(28)
            }, {
                ["&.".concat(d.disabled)]: {
                    backgroundColor: "transparent",
                    color: (r.vars || r).palette.action.disabled
                }
            })
        }),
        p = a.forwardRef(function(e, a) {
            let n = (0, l.u)({
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
                    size: f = "medium"
                } = n,
                b = (0, t._)(n, g),
                C = (0, i._)({}, n, {
                    edge: o,
                    color: h,
                    disabled: m,
                    disableFocusRipple: v,
                    size: f
                }),
                S = (e => {
                    let {
                        classes: i,
                        disabled: a,
                        color: n,
                        edge: s,
                        size: o
                    } = e, l = {
                        root: ["root", a && "disabled", "default" !== n && "color".concat((0, t.a)(n)), s && "edge".concat((0, t.a)(s)), "size".concat((0, t.a)(o))]
                    };
                    return (0, r.a)(l, c, i)
                })(C);
            return (0, s.jsx)(u, (0, i._)({
                className: (0, r.c)(S.root, p),
                centerRipple: !0,
                focusRipple: !v,
                disabled: m,
                ref: a
            }, b, {
                ownerState: C,
                children: d
            }))
        });
    e.s(["I", 0, p, "i", 0, d])
}, 39128, 527209, e => {
    "use strict";
    var t = e.i(865800),
        i = e.i(416340),
        a = e.i(614515),
        r = e.i(993807),
        n = e.i(273589),
        s = e.i(962560),
        o = e.i(42569),
        l = e.i(167294),
        c = e.i(221628),
        d = e.i(963320);
    let g = ["absolute", "children", "className", "component", "flexItem", "light", "orientation", "role", "textAlign", "variant"],
        u = (0, o.s)("div", {
            name: "MuiDivider",
            slot: "Root",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.root, i.absolute && t.absolute, t[i.variant], i.light && t.light, "vertical" === i.orientation && t.vertical, i.flexItem && t.flexItem, i.children && t.withChildren, i.children && "vertical" === i.orientation && t.withChildrenVertical, "right" === i.textAlign && "vertical" !== i.orientation && t.textAlignRight, "left" === i.textAlign && "vertical" !== i.orientation && t.textAlignLeft]
            }
        })(e => {
            let {
                theme: t,
                ownerState: i
            } = e;
            return (0, s._)({
                margin: 0,
                flexShrink: 0,
                borderWidth: 0,
                borderStyle: "solid",
                borderColor: (t.vars || t).palette.divider,
                borderBottomWidth: "thin"
            }, i.absolute && {
                position: "absolute",
                bottom: 0,
                left: 0,
                width: "100%"
            }, i.light && {
                borderColor: t.vars ? "rgba(".concat(t.vars.palette.dividerChannel, " / 0.08)") : (0, n.b)(t.palette.divider, .08)
            }, "inset" === i.variant && {
                marginLeft: 72
            }, "middle" === i.variant && "horizontal" === i.orientation && {
                marginLeft: t.spacing(2),
                marginRight: t.spacing(2)
            }, "middle" === i.variant && "vertical" === i.orientation && {
                marginTop: t.spacing(1),
                marginBottom: t.spacing(1)
            }, "vertical" === i.orientation && {
                height: "100%",
                borderBottomWidth: 0,
                borderRightWidth: "thin"
            }, i.flexItem && {
                alignSelf: "stretch",
                height: "auto"
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return (0, s._)({}, t.children && {
                display: "flex",
                whiteSpace: "nowrap",
                textAlign: "center",
                border: 0,
                borderTopStyle: "solid",
                borderLeftStyle: "solid",
                "&::before, &::after": {
                    content: '""',
                    alignSelf: "center"
                }
            })
        }, e => {
            let {
                theme: t,
                ownerState: i
            } = e;
            return (0, s._)({}, i.children && "vertical" !== i.orientation && {
                "&::before, &::after": {
                    width: "100%",
                    borderTop: "thin solid ".concat((t.vars || t).palette.divider),
                    borderTopStyle: "inherit"
                }
            })
        }, e => {
            let {
                theme: t,
                ownerState: i
            } = e;
            return (0, s._)({}, i.children && "vertical" === i.orientation && {
                flexDirection: "column",
                "&::before, &::after": {
                    height: "100%",
                    borderLeft: "thin solid ".concat((t.vars || t).palette.divider),
                    borderLeftStyle: "inherit"
                }
            })
        }, e => {
            let {
                ownerState: t
            } = e;
            return (0, s._)({}, "right" === t.textAlign && "vertical" !== t.orientation && {
                "&::before": {
                    width: "90%"
                },
                "&::after": {
                    width: "10%"
                }
            }, "left" === t.textAlign && "vertical" !== t.orientation && {
                "&::before": {
                    width: "10%"
                },
                "&::after": {
                    width: "90%"
                }
            })
        }),
        p = (0, o.s)("span", {
            name: "MuiDivider",
            slot: "Wrapper",
            overridesResolver: (e, t) => {
                let {
                    ownerState: i
                } = e;
                return [t.wrapper, "vertical" === i.orientation && t.wrapperVertical]
            }
        })(e => {
            let {
                theme: t,
                ownerState: i
            } = e;
            return (0, s._)({
                display: "inline-block",
                paddingLeft: "calc(".concat(t.spacing(1), " * 1.2)"),
                paddingRight: "calc(".concat(t.spacing(1), " * 1.2)")
            }, "vertical" === i.orientation && {
                paddingTop: "calc(".concat(t.spacing(1), " * 1.2)"),
                paddingBottom: "calc(".concat(t.spacing(1), " * 1.2)")
            })
        }),
        h = i.forwardRef(function(e, t) {
            let i = (0, d.u)({
                    props: e,
                    name: "MuiDivider"
                }),
                {
                    absolute: a = !1,
                    children: r,
                    className: h,
                    component: m = r ? "div" : "hr",
                    flexItem: v = !1,
                    light: f = !1,
                    orientation: b = "horizontal",
                    role: C = "hr" !== m ? "separator" : void 0,
                    textAlign: S = "center",
                    variant: y = "fullWidth"
                } = i,
                T = (0, n._)(i, g),
                w = (0, s._)({}, i, {
                    absolute: a,
                    component: m,
                    flexItem: v,
                    light: f,
                    orientation: b,
                    role: C,
                    textAlign: S,
                    variant: y
                }),
                E = (e => {
                    let {
                        absolute: t,
                        children: i,
                        classes: a,
                        flexItem: r,
                        light: n,
                        orientation: s,
                        textAlign: c,
                        variant: d
                    } = e;
                    return (0, o.a)({
                        root: ["root", t && "absolute", d, n && "light", "vertical" === s && "vertical", r && "flexItem", i && "withChildren", i && "vertical" === s && "withChildrenVertical", "right" === c && "vertical" !== s && "textAlignRight", "left" === c && "vertical" !== s && "textAlignLeft"],
                        wrapper: ["wrapper", "vertical" === s && "wrapperVertical"]
                    }, l.g, a)
                })(w);
            return (0, c.jsx)(u, (0, s._)({
                as: m,
                className: (0, o.c)(E.root, h),
                role: C,
                ref: t,
                ownerState: w
            }, T, {
                children: r ? (0, c.jsx)(p, {
                    className: E.wrapper,
                    ownerState: w,
                    children: r
                }) : null
            }))
        });
    h.muiSkipListHighlight = !0, e.s(["D", 0, h], 527209);
    var m = (0, a.default)({
            name: "Divider"
        })(function(e, t) {
            return {
                root: {
                    borderBottomWidth: "small" === t.size ? .5 : 1
                }
            }
        }),
        v = (0, i.forwardRef)(function(e, a) {
            var n = e.classes,
                s = e.size,
                o = e.className,
                l = (0, t.a)(e, ["classes", "size", "className"]),
                c = m({
                    size: void 0 === s ? "medium" : s
                }, {
                    props: {
                        classes: (0, r.default)(n, o)
                    }
                });
            return i.default.createElement(h, (0, t._)({}, l, {
                classes: c.classes,
                ref: a
            }))
        });
    e.s(["Divider", 0, v], 39128)
}, 167294, e => {
    "use strict";
    var t = e.i(696180),
        i = e.i(273589),
        a = (0, t.g)("MuiDivider", ["root", "absolute", "fullWidth", "inset", "middle", "flexItem", "light", "vertical", "withChildren", "withChildrenVertical", "textAlignRight", "textAlignLeft", "wrapper", "wrapperVertical"]);
    e.s(["d", 0, a, "g", 0, function(e) {
        return (0, i.g)("MuiDivider", e)
    }])
}, 95656, e => {
    "use strict";
    var t = e.i(721281);
    class i {
        constructor(e = {
            baseUrl: ""
        }) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }
    e.s(["Configuration", 0, i, "Tracker", 0, class {
        sendEvent(e) {
            let {
                localTime: t,
                target: i,
                eventType: a,
                context: r,
                additionalProperties: n,
                currentUrl: s,
                guestId: o,
                sessionId: l
            } = e, c = t.toISOString(), d = new URL("".concat(this.baseUrl, "/pe"));
            return d.searchParams.append("t", i), d.searchParams.append("evt", a), d.searchParams.append("ctx", r), d.searchParams.append("lt", c), d.searchParams.append("url", s || window.location.href), void 0 !== o && d.searchParams.append("gid", o), void 0 !== l && d.searchParams.append("sid", l), void 0 !== n && Object.keys(n).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = n[e]) ? t : "").toString())
            }), fetch(d.href, {
                credentials: "same-origin"
            })
        }
        sendEventViaImg(e, t) {
            let {
                localTime: i,
                target: a,
                eventType: r,
                context: n,
                additionalProperties: s,
                currentUrl: o,
                guestId: l,
                sessionId: c
            } = e, d = i.toISOString(), g = new URL("".concat(this.baseUrl, "/e.png"));
            g.searchParams.append("t", a), g.searchParams.append("evt", r), g.searchParams.append("ctx", n), g.searchParams.append("lt", d), g.searchParams.append("url", o || window.location.href), void 0 !== l && g.searchParams.append("gid", l), void 0 !== c && g.searchParams.append("sid", c), void 0 !== s && Object.keys(s).forEach(e => {
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
        constructor(e = new i) {
            (0, t._)(this, "configuration", void 0), (0, t._)(this, "baseUrl", void 0), this.configuration = e, this.baseUrl = e.baseUrl
        }
    }])
}, 710675, e => {
    "use strict";
    var t = e.i(721281),
        i = e.i(252842);
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
            url: i,
            eventName: a,
            parameters: r,
            source: n,
            sessionId: s
        }) {
            (0, t._)(this, "eventType", "base"), (0, t._)(this, "product", void 0), (0, t._)(this, "url", void 0), (0, t._)(this, "parameters", void 0), (0, t._)(this, "eventName", void 0), (0, t._)(this, "source", void 0), (0, t._)(this, "sessionId", void 0), this.product = e, this.url = i, this.eventName = a, this.parameters = r, this.source = n, this.sessionId = s
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
            url: i,
            eventName: a,
            parameters: r,
            source: n,
            tags: s,
            sessionId: o
        }) {
            super({
                product: e,
                url: i,
                eventName: a,
                parameters: r,
                source: n,
                sessionId: o
            }), (0, t._)(this, "tags", []), this.tags = s || []
        }
    }
    class n extends r {
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
            url: i,
            eventName: a = "pageload",
            parameters: r,
            source: n,
            tags: s,
            sessionId: o,
            referralUrl: l
        }) {
            super({
                product: e,
                url: i,
                eventName: a,
                parameters: r,
                source: n,
                tags: s,
                sessionId: o
            }), (0, t._)(this, "referralUrl", void 0), (0, t._)(this, "eventType", "pageload"), this.referralUrl = l
        }
    }
    class s extends r {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "click")
        }
    }
    class o extends r {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "hover")
        }
    }
    class l extends r {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "imp")
        }
    }
    class c extends r {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "webvitals")
        }
    }
    class d extends r {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "apivitals")
        }
    }
    class g extends r {
        constructor(...e) {
            super(...e), (0, t._)(this, "eventType", "error")
        }
    }
    class u extends r {
        constructor({
            product: e,
            url: i,
            eventName: a,
            parameters: r,
            source: n,
            sessionId: s
        }) {
            super({
                product: e,
                url: i,
                eventName: a,
                parameters: r,
                source: n,
                sessionId: s
            }), (0, t._)(this, "eventType", "session")
        }
    }
    class p extends r {
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
                target: i,
                eventType: a,
                context: r,
                additionalProperties: n,
                currentUrl: s,
                guestId: o,
                sessionId: l
            } = e, c = t.toISOString(), d = new URL("".concat(this.baseUrl, "/pe"));
            return d.searchParams.append("t", i), d.searchParams.append("evt", a), d.searchParams.append("ctx", r), d.searchParams.append("lt", c), d.searchParams.append("url", s || window.location.href), void 0 !== o && d.searchParams.append("gid", o), void 0 !== l && d.searchParams.append("sid", l), void 0 !== n && Object.keys(n).forEach(e => {
                var t;
                d.searchParams.append(e, (null != (t = n[e]) ? t : "").toString())
            }), fetch(d.href, {
                credentials: "same-origin"
            })
        }
        sendEventViaImg(e, t) {
            let {
                localTime: i,
                target: a,
                eventType: r,
                context: n,
                additionalProperties: s,
                currentUrl: o,
                guestId: l,
                sessionId: c
            } = e, d = i.toISOString(), g = new URL("".concat(this.baseUrl, "/e.png"));
            g.searchParams.append("t", a), g.searchParams.append("evt", r), g.searchParams.append("ctx", n), g.searchParams.append("lt", d), g.searchParams.append("url", o || window.location.href), void 0 !== l && g.searchParams.append("gid", l), void 0 !== c && g.searchParams.append("sid", c), void 0 !== s && Object.keys(s).forEach(e => {
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
    class f {
        logEvent(e) {
            let {
                url: t,
                ...i
            } = e.toLogEventObject(), {
                viewportWidth: a,
                viewportHeight: r
            } = {
                viewportWidth: window.innerWidth,
                viewportHeight: window.innerHeight
            }, n = {};
            Object.keys(i).forEach(e => {
                let t = i[e];
                null != t && (n[e] = t.toString())
            }), this.eventStreamTracker.sendEventViaImg({
                target: v,
                eventType: v,
                localTime: new Date,
                context: String(e.eventType),
                currentUrl: String(t),
                additionalProperties: {
                    ...n,
                    loggerVersion: "1.5.1",
                    viewportWidth: a,
                    viewportHeight: r
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
    let b = "CreatorDashboard";
    class C {
        log(e) {
            let {
                eventType: t,
                context: a,
                properties: r,
                sessionId: n,
                currentUrl: s
            } = e, o, l = function(e) {
                let t = {};
                for (let [i, a] of Object.entries(e)) void 0 !== a && (t[i] = a);
                return t
            }(r), c = null == (o = (0, i.getCookieValueByKey)("GuestData")) ? void 0 : o.split("=")[1], d = {
                target: b,
                eventType: t,
                context: a,
                currentUrl: s,
                localTime: new Date,
                ...void 0 !== n ? {
                    sessionId: n
                } : {},
                ...void 0 !== c ? {
                    guestId: c
                } : {},
                additionalProperties: l
            };
            this.eventStreamTracker.sendEventViaImg(d)
        }
        constructor({
            eventBaseUrl: e
        }) {
            (0, t._)(this, "eventStreamTracker", void 0), this.eventStreamTracker = new m(new h({
                baseUrl: "".concat(e, "/").concat(b)
            }))
        }
    }
    class S {
        logEvent(e) {
            let t = e.toLogEventObject();
            console.table([{
                localTime: new Date,
                ...t
            }])
        }
    }

    function y(e) {
        return window.location.href.replace(/#.*$/, "")
    }
    class T {
        static parseCookieValue() {
            let e = (0, i.getCookieValueByKey)("UnifiedLoggerSession");
            return e ? decodeURIComponent(e).split("&").reduce((e, t) => {
                let [i, a] = t.split("=");
                return e[i] = JSON.parse(a), e
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
            let t = i.uuidService.generateRandomUuid(),
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
                sessionId: i,
                lastActivity: a
            } = t;
            return e - a > this.inactiveSessionExpireTime ? this.refreshSessionId(e) : (this.cache = {
                sessionId: i,
                lastActivity: e,
                timestamp: e
            }, this.updateCookie(), i)
        }
        updateCookie() {
            if (!this.cache) return;
            let e = T.parseCookieValue();
            e[this.productName] = this.cache, (0, i.setCookie)("UnifiedLoggerSession", Object.entries(e).map(e => {
                let [t, {
                    sessionId: i,
                    lastActivity: a
                }] = e;
                return "".concat(t, "=").concat(JSON.stringify({
                    sessionId: i,
                    lastActivity: a
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
            cacheExpiryTime: i = 5e3,
            inactiveSessionExpireTime: a = 18e5,
            onSessionRefresh: r = () => {}
        }) {
            (0, t._)(this, "productName", void 0), (0, t._)(this, "cache", void 0), (0, t._)(this, "cacheExpiryTime", void 0), (0, t._)(this, "inactiveSessionExpireTime", void 0), (0, t._)(this, "onSessionRefresh", void 0), this.productName = e, this.cacheExpiryTime = i, this.inactiveSessionExpireTime = a, this.onSessionRefresh = r
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
                    for (var t, i = arguments.length, a = Array(i), r = 0; r < i; r++) a[r] = arguments[r];
                    let n, s = e.apply(this, a),
                        o = (t = "pushState", "function" == typeof Event ? n = new Event(t) : (n = document.createEvent("Event")).initEvent(t, !0, !0), n);
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
            let t = y();
            if (t === this.lastPageLoadUrl) return;
            let i = this.sessionService.getOrCreateSessionId(),
                a = new n({
                    product: this.product,
                    url: t,
                    sessionId: i,
                    referralUrl: null != (e = this.referrer) ? e : document.referrer,
                    parameters: {
                        browserLocale: navigator.language
                    }
                });
            this.events.emit("pageload", a), this.logEventToLogger(a), this.referrer = t, this.lastPageLoadUrl = t
        }
        logClickEvent(e) {
            let {
                eventName: t,
                parameters: i,
                tags: a
            } = e, r = y(), n = this.sessionService.getOrCreateSessionId(), o = new s({
                product: this.product,
                url: r,
                sessionId: n,
                eventName: t,
                parameters: i,
                tags: a
            });
            this.events.emit("click", o), this.logEventToLogger(o)
        }
        logImpressionEvent(e) {
            let {
                eventName: t,
                parameters: i,
                tags: a
            } = e, r = y(), n = this.sessionService.getOrCreateSessionId(), s = new l({
                product: this.product,
                url: r,
                sessionId: n,
                eventName: t,
                parameters: i,
                tags: a
            });
            this.events.emit("impression", s), this.logEventToLogger(s)
        }
        logHoverEvent(e) {
            let {
                eventName: t,
                parameters: i,
                tags: a
            } = e, r = y(), n = this.sessionService.getOrCreateSessionId(), s = new o({
                product: this.product,
                url: r,
                sessionId: n,
                eventName: t,
                parameters: i,
                tags: a
            });
            this.events.emit("hover", s), this.logEventToLogger(s)
        }
        logWebVitalsEvent(e) {
            let {
                eventName: t,
                parameters: i,
                tags: a
            } = e, r = y(), n = this.sessionService.getOrCreateSessionId(), s = new c({
                product: this.product,
                url: r,
                sessionId: n,
                eventName: t,
                parameters: i,
                tags: a
            });
            this.events.emit("webvitals", s), this.logEventToLogger(s)
        }
        logApiVitalsEvent(e) {
            let {
                eventName: t,
                parameters: i,
                tags: a
            } = e, r = y(), n = this.sessionService.getOrCreateSessionId(), s = new d({
                product: this.product,
                url: r,
                sessionId: n,
                eventName: t,
                parameters: i,
                tags: a
            });
            this.events.emit("webvitals", s), this.logEventToLogger(s)
        }
        logFormVitalsEvent(e) {
            let {
                eventName: t,
                parameters: i,
                tags: a
            } = e, r = y(), n = this.sessionService.getOrCreateSessionId(), s = new p({
                product: this.product,
                url: r,
                sessionId: n,
                eventName: t,
                parameters: i,
                tags: a
            });
            this.events.emit("formvitals", s), this.logEventToLogger(s)
        }
        logErrorEvent(e) {
            let {
                eventName: t,
                parameters: i,
                tags: a
            } = e, r = y(), n = this.sessionService.getOrCreateSessionId(), s = new g({
                product: this.product,
                url: r,
                sessionId: n,
                eventName: t,
                parameters: i,
                tags: a
            });
            this.events.emit("error", s), this.logEventToLogger(s)
        }
        logHostRoutedEvent(e) {
            let {
                eventType: t,
                context: i,
                properties: a,
                hostProperties: r = {}
            } = e, n = y(), s = this.sessionService.getOrCreateSessionId();
            this.hostRoutedEventStreamLogger.log({
                eventType: t,
                context: i,
                properties: {
                    ...r,
                    ...a
                },
                sessionId: s,
                currentUrl: n
            })
        }
        logSessionEvent(e) {
            let {
                eventName: t,
                sessionId: i,
                parameters: a,
                tags: r
            } = e, n = y(), s = new u({
                product: this.product,
                url: n,
                eventName: t,
                sessionId: i,
                parameters: a,
                tags: r
            });
            this.events.emit("session", s), this.logEventToLogger(s)
        }
        onPageLoadEvent(e) {
            this.events.on("pageload", e)
        }
        constructor({
            eventBaseUrl: e,
            product: i,
            debugMode: a,
            eventLogger: r,
            sessionProductGroup: n,
            disableSession: s = !1
        }) {
            (0, t._)(this, "eventLoggers", []), (0, t._)(this, "debugMode", !1), (0, t._)(this, "product", void 0), (0, t._)(this, "sessionProductGroup", void 0), (0, t._)(this, "sessionService", void 0), (0, t._)(this, "hostRoutedEventStreamLogger", void 0), (0, t._)(this, "disableSession", void 0), (0, t._)(this, "lastPageLoadUrl", void 0), (0, t._)(this, "referrer", void 0), (0, t._)(this, "isAutoCollectEnabled", !1), (0, t._)(this, "events", function() {
                let e = new Map;
                return {
                    on(t, i) {
                        e.has(t) ? e.get(t).push(i) : e.set(t, [i])
                    },
                    off(t, i) {
                        e.has(t) && e.set(t, (e.get(t) || []).filter(e => e !== i))
                    },
                    emit(t, i) {
                        for (var a = arguments.length, r = Array(a > 2 ? a - 2 : 0), n = 2; n < a; n++) r[n - 2] = arguments[n];
                        (e.get(t) || []).forEach(e => {
                            e(i, ...r)
                        })
                    }
                }
            }()), (0, t._)(this, "onSessionRefresh", e => {
                this.logSessionEvent({
                    eventName: "sessionStart",
                    sessionId: e
                })
            }), this.eventLoggers.push(null != r ? r : new f({
                eventBaseUrl: e
            })), this.debugMode = !!a, this.product = i, this.sessionProductGroup = null != n ? n : i, this.debugMode && this.eventLoggers.push(new S), this.hostRoutedEventStreamLogger = new C({
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

//# debugId=42503e2a-5edb-a991-7a0e-49756653ed95
//# sourceMappingURL=40dqvchndp3jy.js.map