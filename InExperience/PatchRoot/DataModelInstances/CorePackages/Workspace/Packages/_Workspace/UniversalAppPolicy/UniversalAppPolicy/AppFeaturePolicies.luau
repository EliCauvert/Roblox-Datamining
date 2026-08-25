local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local cryoModule = require(parent.Cryo)
local var3 = cryoModule.Dictionary.values(require(parent.Foundation).Enums.ColorMode)
local crossPlayCapabilitiesModule = require(script.Parent.Enum.CrossPlayCapabilities)
local sharedFlagsModule = require(parent.SharedFlags)
local isSubjectToDesktopPolicies = sharedFlagsModule.isSubjectToDesktopPolicies
local isRunningInStudio = require(parent.AppCommonLib).isRunningInStudio
local getFFlagUseVoiceExitBetaLanguage = sharedFlagsModule.GetFFlagUseVoiceExitBetaLanguage
local getFFlagDisableCDLQrCodeForMaquettes = sharedFlagsModule.GetFFlagDisableCDLQrCodeForMaquettes
local getFFlagUseEnablePremiumUserFeaturesAppPolicy = sharedFlagsModule.GetFFlagUseEnablePremiumUserFeaturesAppPolicy
local getFFlagLuafiedReportEntryPoints = sharedFlagsModule.GetFFlagLuafiedReportEntryPoints
local getFFlagEnableAbuseReport10ft = sharedFlagsModule.GetFFlagEnableAbuseReport10ft
local getFFlagUseExternalBrowserForAgeGuidelines10ft = sharedFlagsModule.GetFFlagUseExternalBrowserForAgeGuidelines10ft
local getFFlagEnableGateNotificationPreferencesTab = sharedFlagsModule.GetFFlagEnableGateNotificationPreferencesTab
local getFFlagEnableSupportCenter = sharedFlagsModule.GetFFlagEnableSupportCenter
local fFlagLuaAppHomeVngAppUpsell = sharedFlagsModule.FFlagLuaAppHomeVngAppUpsell
local fFlagVngAppUpsellPcLayout = sharedFlagsModule.FFlagVngAppUpsellPcLayout
local fFlagFriendRequestNicknames = sharedFlagsModule.FFlagFriendRequestNicknames
local fFlagLuaAppParentUpsellPolicy = sharedFlagsModule.FFlagLuaAppParentUpsellPolicy
local fFlagRenameParentEmailForVerificationUpsell = sharedFlagsModule.FFlagRenameParentEmailForVerificationUpsell
local getFFlagSeamlessVoiceConsentToastPolicy = sharedFlagsModule.GetFFlagSeamlessVoiceConsentToastPolicy
local getFFlagEnableMultiPageSignup = sharedFlagsModule.GetFFlagEnableMultiPageSignup
local getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup = sharedFlagsModule.GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup
local fFlagEnableMicrosoftStorePaymentsPlatform = sharedFlagsModule.FFlagEnableMicrosoftStorePaymentsPlatform
local fFlagEnableMilkyWayPaymentsPlatformV2 = sharedFlagsModule.FFlagEnableMilkyWayPaymentsPlatformV2
local fFlagAppIaScrollAwayGuac = sharedFlagsModule.FFlagAppIaScrollAwayGuac
local fFlagEnableScreentimeMoreTimeOption = sharedFlagsModule.FFlagEnableScreentimeMoreTimeOption
local fFlagEnableFriendsRenamingForAll = sharedFlagsModule.FFlagEnableFriendsRenamingForAll
local getFFlagExpChatGuacChatDisabledReason = sharedFlagsModule.GetFFlagExpChatGuacChatDisabledReason
local fFlagGuacCanRenderTransferOnProfile = sharedFlagsModule.FFlagGuacCanRenderTransferOnProfile
local fFlagEnableFaceIDTextOnAddAuthMethodPage = sharedFlagsModule.FFlagEnableFaceIDTextOnAddAuthMethodPage
local fFlagEnableMorePageExitButtonSupport = sharedFlagsModule.FFlagEnableMorePageExitButtonSupport
local fFlagEnableMorePageDirectionalLayoutRolloutFix = sharedFlagsModule.FFlagEnableMorePageDirectionalLayoutRolloutFix
local fFlagEnableUnifiedProductPurchaseFlow = sharedFlagsModule.FFlagEnableUnifiedProductPurchaseFlow
local fFlagAEGIS2UseGuacToShowEnabledMessage = sharedFlagsModule.FFlagAEGIS2UseGuacToShowEnabledMessage
local fFlagAEGIS2UseGuacToShowFAEUpsell = sharedFlagsModule.FFlagAEGIS2UseGuacToShowFAEUpsell
local fFlagMacMenuBarContentUpdates = sharedFlagsModule.GetFFlagMacMenuBarContentUpdates()
local luaAppEnableRecommendedCarouselForDesktop = game:DefineFastFlag("LuaAppEnableRecommendedCarouselForDesktop", false)
local disableWebViewSupportInStudio = game:DefineFastFlag("DisableWebViewSupportInStudio", false)
local fFlagUsesCancelSearchAppPolicy = sharedFlagsModule.FFlagUsesCancelSearchAppPolicy
local debugUseLegacyCrossPlayApi = game:DefineFastFlag("DebugUseLegacyCrossPlayApi", false)
local debugOverrideCrossPlaySettingsKey = game:DefineFastString("DebugOverrideCrossPlaySettingsKey", "")
local debugOverrideCrossPlayQueryParam = game:DefineFastString("DebugOverrideCrossPlayQueryParam", "")
local debugCrossPlaySystemUi = game:DefineFastFlag("DebugCrossPlaySystemUi", false)
local debugOverrideCrossPlayUri = game:DefineFastString("DebugOverrideCrossPlayUri", "")
local guacAppPolicyDisableSignupCheckbox = game:DefineFastFlag("GuacAppPolicyDisableSignupCheckbox", false)
local flyoutDisablePremiumEntrypoint1 = game:DefineFastFlag("FlyoutDisablePremiumEntrypoint1", false)
local guacDisableBlackbirdEntrypoints = game:DefineFastFlag("GuacDisableBlackbirdEntrypoints", false)
local flyoutEnableGiftcardsWithRedeem = game:DefineFastFlag("FlyoutEnableGiftcardsWithRedeem", false)
local debugForceShowIllegalContentReportingUI = game:DefineFastFlag("DebugForceShowIllegalContentReportingUI", false)
local fFlagEnableLeftNavOnConsole = sharedFlagsModule.FFlagEnableLeftNavOnConsole
local fFlagExpChatUseGuacForFOMOUpsell = sharedFlagsModule.FFlagExpChatUseGuacForFOMOUpsell
local fFlagExpChatUseGuacForCrossAgeChat = sharedFlagsModule.FFlagExpChatUseGuacForCrossAgeChat
local fFlagEnableAndroidTvAppPolicies = sharedFlagsModule.FFlagEnableAndroidTvAppPolicies
local fFlagSduiAppPolicyBindings = sharedFlagsModule.FFlagSduiAppPolicyBindings
local fFlagGuacStickyShortcutBarEnabled = sharedFlagsModule.FFlagGuacStickyShortcutBarEnabled
local fFlagEnableCoreContentAccountType = sharedFlagsModule.FFlagEnableCoreContentAccountType
local fFlagEnableCoreContentBadge = sharedFlagsModule.FFlagEnableCoreContentBadge
local fFlagEnableFlyoutUncheckedBadge = sharedFlagsModule.FFlagEnableFlyoutUncheckedBadge
local fFlagEnableNonFlyoutUncheckedBadge = sharedFlagsModule.FFlagEnableNonFlyoutUncheckedBadge
local getFFlagEnableAccountSwitcherUncheckedBadge = sharedFlagsModule.GetFFlagEnableAccountSwitcherUncheckedBadge
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating
local fFlagDefaultKidsToDarkTheme = sharedFlagsModule.FFlagDefaultKidsToDarkTheme
local fFlagLuaAppSupportDisablePlayableWhenLoading = sharedFlagsModule.FFlagLuaAppSupportDisablePlayableWhenLoading
local fFlagAppNavMyStatsTab = sharedFlagsModule.FFlagAppNavMyStatsTab
local fFlagAppChatOnConsoles = sharedFlagsModule.FFlagAppChatOnConsoles
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local useOriginalPlatformChatPolicy = game:DefineFastFlag("UseOriginalPlatformChatPolicy", false)
local fFlagFullscreenElementsIgnoreSafeArea = sharedFlagsModule.FFlagFullscreenElementsIgnoreSafeArea
local fFlagFriendsChatEnableConversationConsent = sharedFlagsModule.FFlagFriendsChatEnableConversationConsent
local fFlagFriendsChatOsaSystemMessage = sharedFlagsModule.FFlagFriendsChatOsaSystemMessage
game:DefineFastFlag("BehaviorCollectionControlEnabled", false)
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false)
local getFFlagNotificationsComplianceShouldRestrictStream = sharedFlagsModule.GetFFlagNotificationsComplianceShouldRestrictStream

return function(p0)
	-- upvalues: isVRAppBuild (ref), luaAppEnableRecommendedCarouselForDesktop (ref), isSubjectToDesktopPolicies (ref), useOriginalPlatformChatPolicy (ref), fFlagAppChatOnConsoles (ref), fFlagAppIaScrollAwayGuac (ref), fFlagEnableLeftNavOnConsole (ref), guiService (ref), isRunningInStudio (ref), disableWebViewSupportInStudio (ref), getFFlagLuafiedReportEntryPoints (ref), getFFlagEnableAbuseReport10ft (ref), getFFlagUseVoiceExitBetaLanguage (ref), getFFlagSeamlessVoiceConsentToastPolicy (ref), getFFlagExpChatGuacChatDisabledReason (ref), fFlagAEGIS2UseGuacToShowEnabledMessage (ref), fFlagAEGIS2UseGuacToShowFAEUpsell (ref), fFlagExpChatUseGuacForFOMOUpsell (ref), fFlagExpChatUseGuacForCrossAgeChat (ref), getFFlagDisableCDLQrCodeForMaquettes (ref), cryoModule (ref), var3 (ref), debugUseLegacyCrossPlayApi (ref), debugCrossPlaySystemUi (ref), debugOverrideCrossPlayUri (ref), crossPlayCapabilitiesModule (ref), debugOverrideCrossPlaySettingsKey (ref), debugOverrideCrossPlayQueryParam (ref), getFFlagUseEnablePremiumUserFeaturesAppPolicy (ref), getFFlagUseExternalBrowserForAgeGuidelines10ft (ref), fFlagGuacCanRenderTransferOnProfile (ref), getFFlagEnableGateNotificationPreferencesTab (ref), userInputService (ref), fFlagLuaAppHomeVngAppUpsell (ref), fFlagVngAppUpsellPcLayout (ref), fFlagFriendRequestNicknames (ref), fFlagLuaAppParentUpsellPolicy (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), getFFlagNotificationsComplianceShouldRestrictStream (ref), debugForceShowIllegalContentReportingUI (ref), fFlagRenameParentEmailForVerificationUpsell (ref), fFlagFriendsChatOsaSystemMessage (ref), fFlagFriendsChatEnableConversationConsent (ref), fFlagEnableAndroidTvAppPolicies (ref), getFFlagEnableMultiPageSignup (ref), getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (ref), fFlagEnableMicrosoftStorePaymentsPlatform (ref), fFlagEnableFriendsRenamingForAll (ref), fFlagEnableMilkyWayPaymentsPlatformV2 (ref), fFlagEnableScreentimeMoreTimeOption (ref), flyoutDisablePremiumEntrypoint1 (ref), guacDisableBlackbirdEntrypoints (ref), flyoutEnableGiftcardsWithRedeem (ref), guacAppPolicyDisableSignupCheckbox (ref), fFlagEnableFaceIDTextOnAddAuthMethodPage (ref), fFlagEnableMorePageExitButtonSupport (ref), fFlagEnableMorePageDirectionalLayoutRolloutFix (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagMomentsAutoplayAmpPolicy (ref), getFFlagEnableSupportCenter (ref), fFlagSduiAppPolicyBindings (ref), fFlagGuacStickyShortcutBarEnabled (ref), fFlagEnableCoreContentAccountType (ref), fFlagEnableCoreContentBadge (ref), fFlagEnableFlyoutUncheckedBadge (ref), fFlagEnableNonFlyoutUncheckedBadge (ref), getFFlagEnableAccountSwitcherUncheckedBadge (ref), fFlagShowGameAgeRating (ref), fFlagDefaultKidsToDarkTheme (ref), fFlagMacMenuBarContentUpdates (ref), fFlagUsesCancelSearchAppPolicy (ref), fFlagAppNavMyStatsTab (ref), fFlagFullscreenElementsIgnoreSafeArea (ref)
	local function _(p1, p2)
		-- upvalues: p0 (ref), isVRAppBuild (copy)
		return if p0[p1] == nil then if isVRAppBuild() then p2 else not p2 else p0[p1]
	end
	
	return {
		getFriendFinder = function()
			-- upvalues: p0 (ref)
			return p0.FriendFinder or false
		end,
		getGameDetailsMorePage = function()
			-- upvalues: p0 (ref)
			return p0.GameDetailsMorePage or false
		end,
		getGameDetailsSubtitle = function()
			-- upvalues: p0 (ref)
			return p0.GameDetailsSubtitle or false
		end,
		getShowGlobalCounters = function()
			-- upvalues: p0 (ref)
			return p0.GameDetailsShowGlobalCounters or false
		end,
		getGameDetailsPlayWithFriends = function()
			-- upvalues: p0 (ref)
			return p0.GameDetailsPlayWithFriends or false
		end,
		getGameInfoList = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoList or false
		end,
		getGamePlaysAndRatings = function()
			-- upvalues: p0 (ref)
			return p0.GamePlaysAndRatings or false
		end,
		getNotifications = function()
			-- upvalues: p0 (ref)
			return p0.Notifications or false
		end,
		getRecommendedGames = function()
			-- upvalues: luaAppEnableRecommendedCarouselForDesktop (copy), p0 (ref), isSubjectToDesktopPolicies (copy)
			return if luaAppEnableRecommendedCarouselForDesktop then p0.RecommendedGames or false elseif isSubjectToDesktopPolicies() then false else p0.RecommendedGames or false
		end,
		getSearchBar = function()
			-- upvalues: p0 (ref)
			return p0.SearchBar or false
		end,
		getMorePageContent = function()
			-- upvalues: useOriginalPlatformChatPolicy (copy), p0 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p0.MorePageContent elseif fFlagAppChatOnConsoles then p0.MorePageContent2 else p0.MorePageContent
		end,
		getAboutPageType = function()
			-- upvalues: p0 (ref)
			return p0.AboutPageType or "CJVAbout"
		end,
		getSettingsPageType = function()
			-- upvalues: p0 (ref)
			return p0.SettingsPageType or "Settings"
		end,
		getSocialLinks = function()
			-- upvalues: p0 (ref)
			return p0.SocialLinks or false
		end,
		getSocialGroupLinks = function()
			-- upvalues: p0 (ref)
			return p0.SocialGroupLinks or false
		end,
		getCommunityLinksEnabled = function()
			-- upvalues: p0 (ref)
			return p0.CommunityLinksEnabled or false
		end,
		getGameInfoShowBadges = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowBadges or false
		end,
		getGameInfoShowCreated = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowCreated or false
		end,
		getGameInfoShowGamepasses = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowGamepasses or false
		end,
		getGameInfoShowGenre = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowGenre or false
		end,
		getGameInfoShowSubgenre = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowSubgenre or false
		end,
		getGameInfoShowMaxPlayers = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowMaxPlayers or false
		end,
		getGameInfoShowServers = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowServers or false
		end,
		getGameInfoShowUpdated = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowUpdated or false
		end,
		getGameInfoShowAgeRecommendation = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowAgeRecommendation == nil or p0.GameInfoShowAgeRecommendation
		end,
		getGameInfoShowVoiceAndChatFeatures = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoShowVoiceAndChatFeatures == nil or p0.GameInfoShowVoiceAndChatFeatures
		end,
		getSiteMessageBanner = function()
			-- upvalues: p0 (ref)
			return p0.SiteMessageBanner or false
		end,
		getAlertRateLimit = function()
			-- upvalues: p0 (ref)
			return p0.AlertRateLimit or 300
		end,
		getSearchAutoComplete = function()
			-- upvalues: p0 (ref)
			return p0.SearchAutoComplete or false
		end,
		getShowStudioCTA = function()
			-- upvalues: p0 (ref)
			return p0.ShowStudioCTA or false
		end,
		getAppIaScrollAwayEnabled = if fFlagAppIaScrollAwayGuac then function()
			-- upvalues: p0 (ref)
			return p0.AppIaScrollAwayEnabled or false
		end else nil,
		getUseOmniRecommendation = function()
			-- upvalues: p0 (ref)
			return p0.UseOmniRecommendation == nil or p0.UseOmniRecommendation
		end,
		getUseWidthBasedFormFactorRule = function()
			-- upvalues: p0 (ref)
			return p0.UseWidthBasedFormFactorRule or false
		end,
		getShowYouTubeAgeAlert = function()
			-- upvalues: p0 (ref)
			return p0.ShowYouTubeAgeAlert == nil or p0.ShowYouTubeAgeAlert
		end,
		getShowVideoThumbnails = function()
			-- upvalues: p0 (ref)
			return p0.ShowVideoThumbnails or false
		end,
		getHomeIcon = function()
			-- upvalues: p0 (ref)
			return p0.HomeIcon or "LuaApp/icons/ic-roblox-close"
		end,
		getGameInfoListShowRNVDeveloper = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoListShowRNVDeveloper or false
		end,
		getGameInfoListDeveloper = function()
			-- upvalues: p0 (ref)
			return p0.GameInfoListDeveloper or false
		end,
		getShowDisplayName = function()
			-- upvalues: p0 (ref)
			return p0.ShowDisplayName == nil or p0.ShowDisplayName
		end,
		getShowAlias = function()
			-- upvalues: p0 (ref)
			return p0.ShowUserAlias == nil or p0.ShowUserAlias
		end,
		getCatalogReportingDisabled = function()
			-- upvalues: p0 (ref)
			return p0.CatalogReportingDisabled or false
		end,
		getGameReportingDisabled = function()
			-- upvalues: p0 (ref)
			return p0.GameReportingDisabled or false
		end,
		getGamesPageCreationCenterTitle = function()
			-- upvalues: p0 (ref)
			return p0.GamesPageCreationCenterTitle or false
		end,
		shouldUseExternalBrowserForDisclaimerLinks = function()
			-- upvalues: p0 (ref)
			return p0.UseExternalBrowserForDisclaimerLinks or false
		end,
		shouldUseExternalBrowserForMorePageItem = function()
			-- upvalues: p0 (ref)
			return p0.UseExternalBrowserForMoreLinks or false
		end,
		getCatalogShow3dView = function()
			-- upvalues: p0 (ref)
			return p0.CatalogShow3dView or false
		end,
		getItemDetailsFullView = function()
			-- upvalues: p0 (ref)
			return p0.ItemDetailsFullView or false
		end,
		getCatalogCommunityCreations = function()
			-- upvalues: p0 (ref)
			return p0.CatalogCommunityCreations or false
		end,
		getCatalogPremiumCategory = function()
			-- upvalues: p0 (ref)
			return p0.CatalogPremiumCategory or false
		end,
		getShowCatalogPremiumContent = function()
			-- upvalues: p0 (ref)
			return p0.CatalogPremiumContent or false
		end,
		getRobloxCreatedItemsCreatedByLuobu = function()
			-- upvalues: p0 (ref)
			return p0.RobloxCreatedItemsCreatedByLuobu == nil or p0.RobloxCreatedItemsCreatedByLuobu
		end,
		getHomePageFriendSection = function()
			-- upvalues: p0 (ref)
			return p0.HomePageFriendSection or false
		end,
		getHomePageProfileLink = function()
			-- upvalues: p0 (ref)
			return p0.HomePageProfileLink or false
		end,
		getPurchasePromptIncludingWarning = function()
			-- upvalues: p0 (ref)
			return p0.PurchasePromptIncludingWarning == nil or p0.PurchasePromptIncludingWarning
		end,
		getCheckUserAgreementsUpdatedOnLogin = function()
			-- upvalues: p0 (ref)
			return p0.CheckUserAgreementsUpdatedOnLogin == nil or p0.CheckUserAgreementsUpdatedOnLogin
		end,
		getAddUserAgreementIdsToSignupRequest = function()
			-- upvalues: p0 (ref)
			return p0.AddUserAgreementIdsToSignupRequest or false
		end,
		RequireExplicitVoiceConsent = function()
			-- upvalues: p0 (ref)
			return p0.RequireExplicitVoiceConsent or false
		end,
		getRequireExplicitAvatarVideoConsent = function()
			-- upvalues: p0 (ref)
			return p0.RequireExplicitAvatarVideoConsent or false
		end,
		getShowVoiceUpsellV2 = function()
			-- upvalues: p0 (ref)
			return p0.ShowVoiceUpsellV2 or false
		end,
		getShouldShowGroupsTile = function()
			-- upvalues: p0 (ref)
			return p0.ShouldShowGroupsTile or false
		end,
		useLuobuAuthentication = function()
			-- upvalues: p0 (ref)
			return p0.UseLuobuAuthentication or false
		end,
		useWechatQQAuthentication = function()
			-- upvalues: p0 (ref)
			return p0.UseWechatQQAuthentication or false
		end,
		useMSDKWebAuthentication = function()
			-- upvalues: p0 (ref)
			return p0.UseMSDKWebAuthentication or false
		end,
		getQrFriendingEnabled = function()
			-- upvalues: p0 (ref)
			return p0.QrFriendingEnabled or false
		end,
		getShouldShowCameraPermissionInAgreementsPrompt = function()
			-- upvalues: p0 (ref)
			return p0.ShouldShowCameraPermissionInAgreementsPrompt or false
		end,
		getExperienceInviteShareLinkEnabled = function()
			-- upvalues: p0 (ref)
			return p0.ExperienceInviteShareLinkEnabled or false
		end,
		getCsatSurveyRestrictTextInput = function()
			-- upvalues: p0 (ref)
			return p0.CsatSurveyRestrictTextInput or false
		end,
		useGridPageLayout = function()
			-- upvalues: isVRAppBuild (copy), p0 (ref), isSubjectToDesktopPolicies (copy)
			return if isVRAppBuild() then if p0.UseGridPageLayout == nil then isVRAppBuild() else p0.UseGridPageLayout elseif p0.UseGridPageLayout == nil then isSubjectToDesktopPolicies() else p0.UseGridPageLayout
		end,
		usePhoneSearchDiscoverEntry = function()
			-- upvalues: p0 (ref), isSubjectToDesktopPolicies (copy)
			return if p0.UsePhoneSearchDiscoverEntry == nil then not isSubjectToDesktopPolicies() else p0.UsePhoneSearchDiscoverEntry
		end,
		getShouldSystemBarUsuallyBePresent = function()
			-- upvalues: isVRAppBuild (copy), p0 (ref), fFlagEnableLeftNavOnConsole (copy), guiService (copy)
			return if isVRAppBuild() then if p0.ShouldSystemBarUsuallyBePresentForVR == nil then isVRAppBuild() else p0.ShouldSystemBarUsuallyBePresentForVR elseif fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then true else p0.ShouldSystemBarUsuallyBePresent or false
		end,
		getContactImporterEnabled = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), p0 (ref)
			return if isSubjectToDesktopPolicies() then false else p0.ContactImporterEnabled or false
		end,
		getShouldShowSettingsPermissionsAdditionalInstructions = function()
			-- upvalues: p0 (ref)
			return p0.shouldShowSettingsPermissionsAdditionalInstructions or false
		end,
		getUseVRFTUXPanel = function()
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.UseVRFTUXPanel == nil then isVRAppBuild() else p0.UseVRFTUXPanel
		end,
		getWebViewSupport = function()
			-- upvalues: isRunningInStudio (copy), disableWebViewSupportInStudio (copy), p0 (ref), isVRAppBuild (copy)
			return if isRunningInStudio() then disableWebViewSupportInStudio elseif p0.EnableWebViewSupport == nil then isVRAppBuild() else p0.EnableWebViewSupport
		end,
		getUseLuafiedReportFlow = function()
			-- upvalues: isVRAppBuild (copy), getFFlagLuafiedReportEntryPoints (copy), p0 (ref), getFFlagEnableAbuseReport10ft (copy)
			return if isVRAppBuild() and getFFlagLuafiedReportEntryPoints() then if p0.UseLuafiedReportFlow == nil then isVRAppBuild() else p0.UseLuafiedReportFlow elseif getFFlagEnableAbuseReport10ft() then p0.UseLuafiedReportFlow or false else nil
		end,
		getThrottleFramerate = function()
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.ThrottleFramerate == nil then isVRAppBuild() else p0.ThrottleFramerate
		end,
		getUseRoundedCorners = function()
			-- upvalues: isVRAppBuild (copy), p0 (ref)
			return if isVRAppBuild() then if p0.UseRoundedCorners == nil then isVRAppBuild() else p0.UseRoundedCorners else false
		end,
		getGameInfoShowChatFeatures = function()
			-- upvalues: getFFlagUseVoiceExitBetaLanguage (copy), p0 (ref)
			return if getFFlagUseVoiceExitBetaLanguage() then p0.GameInfoShowChatFeatures or false else false
		end,
		getDisplayCheckboxInVoiceConsent = function()
			-- upvalues: getFFlagSeamlessVoiceConsentToastPolicy (copy), p0 (ref)
			return if getFFlagSeamlessVoiceConsentToastPolicy() then p0.DisplayCheckboxInVoiceConsent or false else false
		end,
		getExperienceChatAvailability = function()
			-- upvalues: getFFlagExpChatGuacChatDisabledReason (copy), p0 (ref)
			return if getFFlagExpChatGuacChatDisabledReason() then p0.ExperienceChatAvailability or "unknown" else "unknown"
		end,
		getInCommsRegionBubble = function()
			-- upvalues: fFlagAEGIS2UseGuacToShowEnabledMessage (copy), p0 (ref)
			return if fFlagAEGIS2UseGuacToShowEnabledMessage then p0.InCommsRegionBubble or false else false
		end,
		getShowInExpFAEUpsell = function()
			-- upvalues: fFlagAEGIS2UseGuacToShowFAEUpsell (copy), p0 (ref)
			return if fFlagAEGIS2UseGuacToShowFAEUpsell then p0.ShowInExpFAEUpsell or false else false
		end,
		getUseAmpV2WizardForVpc = function()
			-- upvalues: p0 (ref)
			return p0.UseAmpV2WizardForVpc or false
		end,
		getShowFOMOUpsell = function()
			-- upvalues: fFlagExpChatUseGuacForFOMOUpsell (copy), p0 (ref)
			return if fFlagExpChatUseGuacForFOMOUpsell then p0.ShowFOMOUpsell or false else false
		end,
		getShowCrossAgeChat = function()
			-- upvalues: fFlagExpChatUseGuacForCrossAgeChat (copy), p0 (ref)
			return if fFlagExpChatUseGuacForCrossAgeChat then p0.ShowCrossAgeExpChat or false else false
		end,
		getCanSeeChatTerminology = function()
			-- upvalues: p0 (ref)
			return p0.canSeeChatTerminology or false
		end,
		getAllowCameraMovements = function()
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.AllowCameraMovements == nil then isVRAppBuild() else p0.AllowCameraMovements
		end,
		getShouldSkipAvatarLandingPage = function()
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.ShouldSkipAvatarLandingPage == nil then isVRAppBuild() else p0.ShouldSkipAvatarLandingPage
		end,
		getShowPassesOnExperienceDetails = function()
			-- upvalues: p0 (ref)
			return p0.ShowPassesOnExperienceDetails or false
		end,
		getDisableCDLQrCodeForMaquettes = function()
			-- upvalues: getFFlagDisableCDLQrCodeForMaquettes (copy), p0 (ref)
			return if getFFlagDisableCDLQrCodeForMaquettes() then p0.DisableCDLQrCodeForMaquettes else false
		end,
		getDisableIAPEntryPoint = function()
			-- upvalues: p0 (ref)
			return p0.DisableIAPEntryPoint or false
		end,
		getEnforceAgeRestrictedLogin = function()
			-- upvalues: p0 (ref)
			return p0.EnforceAgeRestrictedLogin or false
		end,
		getUrlAuthRoutes = function()
			-- upvalues: p0 (ref)
			local routes = p0.Routes or {}
			
			return if routes then routes.auth or {} else {}
		end,
		getShowDisconnectButton = function()
			-- upvalues: p0 (ref)
			return p0.ShowDisconnectButton or false
		end,
		getUseSingleSignOn = function()
			-- upvalues: isRunningInStudio (copy), p0 (ref)
			return if isRunningInStudio() then false else p0.UseSingleSignOn or false
		end,
		getGridCarouselSeeAllTilesEnabled = function()
			-- upvalues: p0 (ref)
			return p0.UseGridCarouselSeeAllTiles or false
		end,
		getSearchWithoutNavigatingEnabled = function()
			-- upvalues: fFlagEnableLeftNavOnConsole (copy), guiService (copy), p0 (ref)
			return if fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then false else p0.SingleSearchPageNoNavigation or false
		end,
		getGameListCategoryScrollListEnabled = function()
			-- upvalues: p0 (ref)
			return p0.GetGamesListCategoryTabs or false
		end,
		getForceTheme = function()
			-- upvalues: cryoModule (copy), var3 (copy), p0 (ref)
			return if p0.ForceTheme and cryoModule.List.find(cryoModule.List.map(var3, function(p3)
				return p3:lower()
			end), p0.ForceTheme:lower()) then p0.ForceTheme else nil
		end,
		enableExperienceDetailsPanel = function()
			-- upvalues: p0 (ref)
			return p0.EnableExperienceDetailsPanel or false
		end,
		getDisableRegularLogin = function()
			-- upvalues: p0 (ref)
			return not p0.EnableWebViewSupport and not p0.EnableRegularLoginWithoutWebViewSupport
		end,
		getAllowPlatformAccountSwitching = function()
			-- upvalues: p0 (ref)
			return p0.AllowPlatformAccountSwitching or false
		end,
		useLegacyCrossPlayApi = function()
			-- upvalues: debugUseLegacyCrossPlayApi (copy), p0 (ref)
			return debugUseLegacyCrossPlayApi or (p0.useLegacyCrossPlayApi or false)
		end,
		useCrossPlaySystemUi = function()
			-- upvalues: debugCrossPlaySystemUi (copy), p0 (ref)
			return debugCrossPlaySystemUi or (p0.useCrossPlaySystemUi or false)
		end,
		getCrossPlayUri = function()
			-- upvalues: debugOverrideCrossPlayUri (copy), p0 (ref)
			return if debugOverrideCrossPlayUri == "" then p0.crossPlayUri or "" else debugOverrideCrossPlayUri
		end,
		getCrossPlayCapabilities = function()
			-- upvalues: cryoModule (copy), p0 (ref), crossPlayCapabilitiesModule (copy)
			return cryoModule.List.foldLeft(p0.crossPlayCapabilities or {}, function(p4, p5)
				-- upvalues: cryoModule (copy), crossPlayCapabilitiesModule (copy)
				return if cryoModule.List.find(p4, p5) then p4 else cryoModule.List.join(p4, { crossPlayCapabilitiesModule[p5] })
			end, {})
		end,
		getCrossPlaySettingsKey = function()
			-- upvalues: debugOverrideCrossPlaySettingsKey (copy), p0 (ref)
			return if debugOverrideCrossPlaySettingsKey == "" then p0.crossPlaySettingsKey or "" else debugOverrideCrossPlaySettingsKey
		end,
		getCrossPlayQueryParam = function()
			-- upvalues: debugOverrideCrossPlayQueryParam (copy), p0 (ref)
			return if debugOverrideCrossPlayQueryParam == "" then p0.crossPlayQueryParam or "" else debugOverrideCrossPlayQueryParam
		end,
		getPromotionalEmailsCheckboxEnabled = function()
			-- upvalues: p0 (ref)
			return if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then p0.PromotionalEmailsCheckboxEnabled or false else false
		end,
		getPromotionalEmailsOptInByDefault = function()
			-- upvalues: p0 (ref)
			return if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then p0.PromotionalEmailsOptInByDefault or false else false
		end,
		getSupportsOverscan = function()
			-- upvalues: p0 (ref)
			return p0.SupportsOverscan or false
		end,
		getUseConsoleGameJoinCard = function()
			-- upvalues: p0 (ref)
			return p0.UseConsoleGameJoinCard or false
		end,
		getPlatformDisplayName = function()
			-- upvalues: p0 (ref)
			return p0.platformDisplayName or ""
		end,
		getPlatformAccountName = function()
			-- upvalues: p0 (ref)
			return p0.platformAccountName or nil
		end,
		getSupportsProfileSwitching = function()
			-- upvalues: p0 (ref)
			return p0.supportsProfileSwitching or false
		end,
		getMountAllOmniFeedItems = function()
			-- upvalues: p0 (ref)
			return p0.mountAllOmniFeedItems or false
		end,
		getFriendCodeQrCodeScannerEnabled = function()
			-- upvalues: p0 (ref)
			return p0.FriendCodeQrCodeScannerEnabled or false
		end,
		getInviteFriendsDisabled = function()
			-- upvalues: p0 (ref)
			return p0.InviteFriendsDisabled or false
		end,
		getRealNamesInDisplayNamesEnabled = function()
			-- upvalues: p0 (ref)
			return p0.RealNamesInDisplayNamesEnabled or false
		end,
		getProfileShareLinkEnabled = function()
			-- upvalues: p0 (ref)
			return p0.ProfileShareLinkEnabled
		end,
		getProfileCopyLinkEnabled = function()
			-- upvalues: p0 (ref)
			return p0.ProfileCopyLinkEnabled
		end,
		getEnablePremiumUserFeatures = function()
			-- upvalues: getFFlagUseEnablePremiumUserFeaturesAppPolicy (copy), p0 (ref)
			return if getFFlagUseEnablePremiumUserFeaturesAppPolicy() then p0.EnablePremiumUserFeatures or false else nil
		end,
		getEnableDualLogin = function()
			-- upvalues: p0 (ref)
			return p0.enableDualLogin or false
		end,
		getUseExternalBrowserForAgeGuidelines = function()
			-- upvalues: getFFlagUseExternalBrowserForAgeGuidelines10ft (copy), p0 (ref)
			return if getFFlagUseExternalBrowserForAgeGuidelines10ft() then p0.UseExternalBrowserForAgeGuidelines or false else nil
		end,
		getEnableHomePageAgeBlock = function()
			-- upvalues: p0 (ref)
			return p0.EnableHomePageAgeBlock or false
		end,
		getEnableUAppAccessBlock = function()
			-- upvalues: p0 (ref)
			return p0.EnableUAppAccessBlock or false
		end,
		getUAppBlockPageTextMapKey = function()
			-- upvalues: p0 (ref)
			return p0.UAppBlockPageTextMapKey or nil
		end,
		getUAppBlockPageShouldDisableLogOut = function()
			-- upvalues: p0 (ref)
			return p0.UAppBlockPageShouldDisableLogOut or nil
		end,
		getContactsToastEnabled = function()
			-- upvalues: p0 (ref)
			return p0.ContactsToastEnabled or false
		end,
		getEnableProfileQrCode = function()
			-- upvalues: p0 (ref)
			return p0.EnableProfileQrCode or false
		end,
		getCanRenderTransferOnProfile = function()
			-- upvalues: fFlagGuacCanRenderTransferOnProfile (copy), p0 (ref)
			return if fFlagGuacCanRenderTransferOnProfile then p0.CanRenderTransferOnProfile or false else false
		end,
		getShowVNGLoginWithExistingAccountQuickLoginButton = function()
			-- upvalues: p0 (ref)
			return p0.ShowVNGLoginWithExistingAccountQuickLoginButton or false
		end,
		getUseCrossDeviceLoginByDefault = function()
			-- upvalues: p0 (ref)
			return p0.UseCrossDeviceLoginByDefault or false
		end,
		getShowVNGAge12Badge = function()
			-- upvalues: p0 (ref)
			return p0.ShowVNGAge12Badge or false
		end,
		getShowBrazilContentRatingLogo = function()
			-- upvalues: p0 (ref)
			return p0.ShowBrazilContentRatingLogo or false
		end,
		getUseVNGUserAgreementPopup = function()
			-- upvalues: p0 (ref)
			return p0.UseVNGUserAgreementPopup or false
		end,
		getRedirectBuyRobuxToVNG = function()
			-- upvalues: p0 (ref)
			return p0.RedirectBuyRobuxToVNG or false
		end,
		getShowVNGTosForRobuxUpsell = function()
			-- upvalues: p0 (ref)
			return p0.ShowVNGTosForRobuxUpsell or false
		end,
		getBlockVNGU12SignUpOnClientSide = function()
			-- upvalues: p0 (ref)
			return p0.BlockVNGU12SignUpOnClientSide or false
		end,
		getUseAgeInput = function()
			-- upvalues: p0 (ref)
			return p0.UseAgeInput or false
		end,
		getLoginUsernameOnly = function()
			-- upvalues: p0 (ref)
			return p0.LoginUsernameOnly or false
		end,
		getDisableEmailOTPLogin = function()
			-- upvalues: p0 (ref)
			return p0.DisableEmailOTPLogin or false
		end,
		getDisableLoginForgotButton = function()
			-- upvalues: p0 (ref)
			return p0.DisableLoginForgotButton or false
		end,
		getDisableLogOutEmailUpsell = function()
			-- upvalues: p0 (ref)
			return p0.DisableLogOutEmailUpsell or false
		end,
		getVerifiedSignupCountry = function()
			-- upvalues: p0 (ref)
			return p0.verifiedSignupCountry or false
		end,
		getParentalConsentAgreementId = function()
			-- upvalues: p0 (ref)
			return p0.parentalConsentAgreementId or ""
		end,
		getIsStrictComplianceEnabled = function()
			-- upvalues: p0 (ref)
			return p0.isStrictComplianceEnabled or false
		end,
		getUseKoreaKISAUserAgreementPopup = function()
			-- upvalues: p0 (ref)
			return p0.useKoreaKISAUserAgreementPopup or false
		end,
		getEnableNotificationPreferencesPage = function()
			-- upvalues: getFFlagEnableGateNotificationPreferencesTab (copy), p0 (ref)
			return if getFFlagEnableGateNotificationPreferencesTab() then p0.EnableNotificationPreferencesPage or false else nil
		end,
		getVNGFormRequired = function()
			-- upvalues: p0 (ref)
			return p0.VNGFormRequired or false
		end,
		getUpsellVoiceForPhoneVerification = function()
			-- upvalues: p0 (ref)
			return p0.UpsellVoiceForPhoneVerification or false
		end,
		getIsLinkedVRModeAvailable = function()
			-- upvalues: userInputService (copy)
			local platform = userInputService:GetPlatform()
			
			return if platform ~= Enum.Platform.Windows then platform == Enum.Platform.UWP else true
		end,
		getShouldShowPhoneUpsell = function()
			-- upvalues: p0 (ref)
			return p0.ShouldShowPhoneUpsell or false
		end,
		getTermsOfUseLink = function()
			-- upvalues: p0 (ref)
			return p0.TermsOfUseLink or ""
		end,
		getPrivacyPolicyLink = function()
			-- upvalues: p0 (ref)
			return p0.PrivacyPolicyLink or ""
		end,
		getVngAppUpsell = function()
			-- upvalues: fFlagLuaAppHomeVngAppUpsell (copy), p0 (ref)
			return if fFlagLuaAppHomeVngAppUpsell then p0.VngAppUpsell or false else false
		end,
		getVngAppUpsellPcLayout = if fFlagVngAppUpsellPcLayout then function()
			-- upvalues: p0 (ref)
			return p0.VngAppUpsellPcLayout or false
		end else nil,
		getShouldHideContactImporterUpsell = function()
			-- upvalues: p0 (ref)
			return p0.ShouldHideContactImporterUpsell or false
		end,
		getContactImporterEncouraged = function()
			-- upvalues: p0 (ref)
			return p0.contactImporterEncouraged or false
		end,
		getFriendRequestNicknamesEnabled = function()
			-- upvalues: fFlagFriendRequestNicknames (copy), p0 (ref)
			return if fFlagFriendRequestNicknames then p0.FriendRequestNicknamesEnabled or false else false
		end,
		getShouldShowVpcPlayButtonUpsells = if fFlagLuaAppParentUpsellPolicy then function()
			-- upvalues: p0 (ref)
			return p0.shouldShowVpcPlayButtonUpsells or false
		end else nil,
		getDisablePlayableWhenLoading = if fFlagLuaAppSupportDisablePlayableWhenLoading then function()
			-- upvalues: p0 (ref)
			return p0.DisablePlayableWhenLoading or false
		end else nil,
		getRenamePaymentsToSpendingTab = function()
			-- upvalues: p0 (ref)
			return p0.renamePaymentsToSpendingTab or false
		end,
		getNotificationsCanReceiveStream = function()
			-- upvalues: getFFlagNotificationsComplianceShouldRestrictStream (copy), p0 (ref)
			return if getFFlagNotificationsComplianceShouldRestrictStream() then p0.notificationsCanAccessStream or false else nil
		end,
		getNotificationsCanReceivePush = function()
			-- upvalues: p0 (ref)
			return p0.notificationsCanAccessPush or false
		end,
		getPushNotificationsUpsell = function()
			-- upvalues: p0 (ref)
			return p0.ShouldShowPushNotificationsUpsell or false
		end,
		getNotificationsCanReceiveExperience = function()
			-- upvalues: p0 (ref)
			return p0.notificationsCanAccessExperience == nil or p0.notificationsCanAccessExperience
		end,
		getDisableResellingCollectiblesForCompliance = function()
			-- upvalues: p0 (ref)
			return p0.DisableResellingCollectiblesForCompliance or false
		end,
		getShowIllegalContentReportingUI = function()
			-- upvalues: debugForceShowIllegalContentReportingUI (copy), p0 (ref)
			return debugForceShowIllegalContentReportingUI or (p0.ShowIllegalContentReportingUI or false)
		end,
		getEligibleForContentPostFeed = function()
			-- upvalues: p0 (ref)
			return p0.EligibleForContentPostFeed or false
		end,
		getEligibleForExternalContentSharing = function()
			-- upvalues: p0 (ref)
			return p0.EligibleForExternalContentSharing or false
		end,
		getEnableContinuousLoad = function()
			-- upvalues: p0 (ref)
			return p0.EnableContinuousLoad or false
		end,
		getEnableAggregateLikesFavoritesCount = function()
			-- upvalues: p0 (ref)
			return p0.EnableAggregateLikesFavoritesCount or false
		end,
		getShowUpdatedCameraPath = function()
			-- upvalues: p0 (ref)
			return p0.showUpdatedCameraPath or false
		end,
		getRenameParentEmailForVerificationUpsell = function()
			-- upvalues: fFlagRenameParentEmailForVerificationUpsell (copy), p0 (ref)
			return if fFlagRenameParentEmailForVerificationUpsell() then p0.renameParentEmailForVerificationUpsell or false else false
		end,
		getKeystrokeCollectionEnabled = function()
			-- upvalues: p0 (ref)
			return if game:GetFastFlag("BehaviorCollectionControlEnabled") then p0.EnableKeystrokeCollection or false else false
		end,
		getCanUsePlatformChat = function()
			-- upvalues: useOriginalPlatformChatPolicy (copy), p0 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p0.CanUsePlatformChat or false elseif fFlagAppChatOnConsoles then p0.CanUsePlatformChat2 or false else p0.CanUsePlatformChat or false
		end,
		getCanSeeChatTab = function()
			-- upvalues: useOriginalPlatformChatPolicy (copy), p0 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p0.CanSeeChatTab or false elseif fFlagAppChatOnConsoles then p0.CanSeeChatTab2 or false else p0.CanSeeChatTab or false
		end,
		getCanSeeFriendsTab = function()
			-- upvalues: fFlagFriendsChatOsaSystemMessage (copy), fFlagFriendsChatEnableConversationConsent (copy), p0 (ref)
			local t = {
				VR = false,
				Console = false,
				Gamepad = false,
				ContextCard = fFlagFriendsChatOsaSystemMessage,
				ConversationConsent = fFlagFriendsChatEnableConversationConsent
			}
			
			for i, v in p0.FriendsTabRequiredCapabilities or {} do
				if not t[v] then
					return false
				end
			end
			return true
		end,
		getHidesGamesTab = function()
			-- upvalues: fFlagEnableAndroidTvAppPolicies (copy), p0 (ref)
			return if fFlagEnableAndroidTvAppPolicies then p0.HidesGamesTab or false else false
		end,
		getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function()
			-- upvalues: getFFlagEnableMultiPageSignup (copy), p0 (ref)
			return if getFFlagEnableMultiPageSignup() then p0.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil or p0.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup else true
		end,
		getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function()
			-- upvalues: getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (copy), getFFlagEnableMultiPageSignup (copy), p0 (ref)
			local var23 = getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup()
			
			return if getFFlagEnableMultiPageSignup() then if p0.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then var23 else p0.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages else var23
		end,
		getRobuxUpsellFlowMobile = function()
			-- upvalues: p0 (ref)
			return p0.useMobileRobuxUpsellFlow or false
		end,
		getUsePaymentPlatformMicrosoftStore = function()
			-- upvalues: fFlagEnableMicrosoftStorePaymentsPlatform (copy), p0 (ref)
			return if fFlagEnableMicrosoftStorePaymentsPlatform then p0.usePaymentPlatformMicrosoftStore or false else false
		end,
		getMicSettingsDirectionsLocaleKey = function()
			-- upvalues: p0 (ref)
			return p0.micSettingsDirectionsLocaleKey or nil
		end,
		getMicSettingsDeeplinkDirectionsLocaleKey = function()
			-- upvalues: p0 (ref)
			return p0.micSettingsDeeplinkDirectionsLocaleKey or nil
		end,
		getRequiresAppRestartOnMicAccessChange = function()
			-- upvalues: p0 (ref)
			return p0.requiresAppRestartOnMicAccessChange or false
		end,
		getRenameFriendsToConnections = function()
			-- upvalues: fFlagEnableFriendsRenamingForAll (copy), p0 (ref)
			return if fFlagEnableFriendsRenamingForAll then true else p0.renameFriendsToConnections or false
		end,
		getShareSheetEnabled = function()
			-- upvalues: p0 (ref)
			return p0.shareSheetEnabled or false
		end,
		getCanAccessTrustedContacts = function()
			-- upvalues: p0 (ref)
			return p0.canAccessTrustedContacts or false
		end,
		getExperienceDetailsNoticeType = function()
			-- upvalues: p0 (ref)
			return p0.experienceDetailsNoticeType or nil
		end,
		getRequiresOSAFriendingEducation = function()
			-- upvalues: p0 (ref)
			return p0.requiresOSAFriendingEducation or false
		end,
		getSocialGraphSyncEnabled = function()
			-- upvalues: p0 (ref)
			return p0.SocialGraphSyncEnabled or false
		end,
		getAccountDisambiguationDisabled = function()
			-- upvalues: p0 (ref)
			return p0.AccountDisambiguationDisabled or false
		end,
		getHasWebViewSupportForFAE = function()
			-- upvalues: p0 (ref)
			return p0.hasWebViewSupportForFAE or false
		end,
		getLinkedAuthEndpointsEnabled = function()
			-- upvalues: p0 (ref)
			return p0.LinkedAuthEndpointsEnabled or false
		end,
		getLinkingPlatform = function()
			-- upvalues: p0 (ref)
			return p0.LinkingPlatform or nil
		end,
		getUsePaymentPlatformMilkyWayStore = function()
			-- upvalues: fFlagEnableMilkyWayPaymentsPlatformV2 (copy), p0 (ref)
			return if fFlagEnableMilkyWayPaymentsPlatformV2 then p0.usePaymentPlatformMilkyWayStore or false else false
		end,
		getScreentimeMoreTimeOptionEnabled = function()
			-- upvalues: fFlagEnableScreentimeMoreTimeOption (copy), p0 (ref)
			return if fFlagEnableScreentimeMoreTimeOption then p0.ScreentimeMoreTimeOptionEnabled or false else false
		end,
		getDisablePremiumEntrypoint = function()
			-- upvalues: flyoutDisablePremiumEntrypoint1 (copy), p0 (ref)
			return if flyoutDisablePremiumEntrypoint1 then p0.DisablePremiumEntrypoint or (p0.DisablePremiumEntryPoint or false) else false
		end,
		getDisableBlackbirdEntrypoints = function()
			-- upvalues: guacDisableBlackbirdEntrypoints (copy), p0 (ref)
			return if guacDisableBlackbirdEntrypoints then p0.DisableBlackbirdEntrypoints or false else false
		end,
		getEnableGiftcardsWithRedeem = function()
			-- upvalues: flyoutEnableGiftcardsWithRedeem (copy), p0 (ref)
			return if flyoutEnableGiftcardsWithRedeem then p0.EnableGiftcardsWithRedeem or false else false
		end,
		getGiftCardSourceRefOverride = function()
			-- upvalues: p0 (ref)
			return p0.GiftCardSourceRefOverride or ""
		end,
		getSignupCheckboxDisabled = function()
			-- upvalues: guacAppPolicyDisableSignupCheckbox (copy), p0 (ref)
			return if guacAppPolicyDisableSignupCheckbox then p0.DisableSignupCheckbox or false else false
		end,
		getShouldShowFaceIDText = function()
			-- upvalues: fFlagEnableFaceIDTextOnAddAuthMethodPage (copy), p0 (ref)
			return if fFlagEnableFaceIDTextOnAddAuthMethodPage then p0.ShouldShowFaceIDText or false else false
		end,
		getExcludeCrossDeviceSignIn = function()
			-- upvalues: p0 (ref)
			return p0.ExcludeCrossDeviceSignIn or false
		end,
		getExcludePasskeyLogin = function()
			-- upvalues: p0 (ref)
			return p0.ExcludePasskeyLogin or false
		end,
		getExcludeUsernamePasswordSignIn = function()
			-- upvalues: p0 (ref)
			return p0.ExcludeUsernamePasswordSignIn or false
		end,
		getExcludeEmailPasswordSignIn = function()
			-- upvalues: p0 (ref)
			return p0.ExcludeEmailPasswordSignIn or false
		end,
		getExcludePhoneNumberPasswordSignIn = function()
			-- upvalues: p0 (ref)
			return p0.ExcludePhoneNumberPasswordSignIn or false
		end,
		getExcludeAccountSwitcher = function()
			-- upvalues: p0 (ref)
			return p0.ExcludeAccountSwitcher or false
		end,
		getAccountSwitcherEnabled = function()
			-- upvalues: p0 (ref)
			return p0.AccountSwitcherEnabled or false
		end,
		getAccountPickerEnabled = function()
			-- upvalues: p0 (ref)
			return p0.AccountPickerEnabled or false
		end,
		getExcludeUsernameUpdateModeration = function()
			-- upvalues: p0 (ref)
			return p0.ExcludeUsernameUpdateModeration or false
		end,
		getMorePageExitButtonEnabled = if fFlagEnableMorePageExitButtonSupport then function()
			-- upvalues: p0 (ref)
			return p0.MorePageExitButtonEnabled or false
		end else nil,
		getMoreGridDirectionalLayoutPreferred = if fFlagEnableMorePageDirectionalLayoutRolloutFix then function()
			-- upvalues: p0 (ref)
			return p0.MoreGridDirectionalLayoutPreferred or false
		end else nil,
		getShouldUseDMCCALegalDisclosureInApp = function()
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), p0 (ref)
			return if fFlagEnableUnifiedProductPurchaseFlow then p0.ShouldUseDMCCALegalDisclosureInApp or false else false
		end,
		getCanAccessParty = function()
			-- upvalues: p0 (ref)
			return p0.CanAccessParty == nil or p0.CanAccessParty
		end,
		getRedeemTileEnabled = function()
			-- upvalues: p0 (ref)
			return p0.RedeemTileEnabled or false
		end,
		getDisplayMomentsMoreTabTile = function()
			-- upvalues: p0 (ref)
			return p0.DisplayMomentsMoreTabTile or false
		end,
		getMomentsCanAutoPlay = if fFlagMomentsAutoplayAmpPolicy then function()
			-- upvalues: p0 (ref)
			return p0.MomentsAutoPlayEnabled == nil or p0.MomentsAutoPlayEnabled
		end else nil,
		getMomentsInfiniteScrollEnabled = function()
			-- upvalues: p0 (ref)
			return p0.MomentsInfiniteScrollEnabled == nil or p0.MomentsInfiniteScrollEnabled
		end,
		getSupportCenterEnabled = if getFFlagEnableSupportCenter() then function()
			-- upvalues: p0 (ref)
			return p0.SupportCenterEnabled or false
		end else nil,
		getShouldUseVibrationInsteadOfHaptics = function()
			-- upvalues: p0 (ref)
			return p0.ShouldUseVibrationInsteadOfHaptics or false
		end,
		getRawPolicy = if fFlagSduiAppPolicyBindings then function()
			-- upvalues: p0 (ref)
			return p0
		end else nil,
		getStickyShortcutBarEnabled = if fFlagGuacStickyShortcutBarEnabled then function()
			-- upvalues: p0 (ref)
			return p0.StickyShortcutBarEnabled or false
		end else nil,
		getAccountType = if fFlagEnableCoreContentAccountType then function()
			-- upvalues: p0 (ref)
			return p0.AccountType
		end else nil,
		getCoreContentBadgeText = if fFlagEnableCoreContentBadge then function()
			-- upvalues: p0 (ref)
			return p0.CoreContentBadgeText
		end else nil,
		getShowUncheckedBadge = if fFlagEnableFlyoutUncheckedBadge or fFlagEnableNonFlyoutUncheckedBadge then function()
			-- upvalues: p0 (ref)
			return p0.ShowUncheckedBadge
		end else nil,
		getShowUncheckedBadgeForAccountSwitcher = function()
			-- upvalues: getFFlagEnableAccountSwitcherUncheckedBadge (copy), p0 (ref)
			return if getFFlagEnableAccountSwitcherUncheckedBadge() then p0.ShowUncheckedBadge else false
		end,
		getShowGameAgeRating = if fFlagShowGameAgeRating then function()
			-- upvalues: p0 (ref)
			return p0.ShowGameAgeRating or false
		end else nil,
		getShowBadgeOver12 = if not fFlagShowGameAgeRating then function()
			-- upvalues: p0 (ref)
			return p0.ShowBadgeOver12 or false
		end else nil,
		getDefaultTheme = if fFlagDefaultKidsToDarkTheme then function()
			-- upvalues: p0 (ref)
			return p0.DefaultTheme
		end else nil,
		getDevicePreferencesPersistentPresenceVariant = if fFlagMacMenuBarContentUpdates then function()
			-- upvalues: p0 (ref)
			return p0.DevicePreferencesPersistentPresenceVariant
		end else nil,
		getCancelSearchOnLostFocus = if fFlagUsesCancelSearchAppPolicy then function()
			-- upvalues: p0 (ref)
			return p0.CancelSearchOnLostFocus == nil or p0.CancelSearchOnLostFocus
		end else nil,
		getCanViewBuild = if fFlagAppNavMyStatsTab then function()
			-- upvalues: p0 (ref)
			return p0.CanViewBuild or false
		end else nil,
		getCanUseBuild = if fFlagAppNavMyStatsTab then function()
			-- upvalues: p0 (ref)
			return p0.CanUseBuild or false
		end else nil,
		getShouldFullscreenElementsIgnoreSafeArea = if fFlagFullscreenElementsIgnoreSafeArea then function()
			-- upvalues: p0 (ref)
			return p0.ShouldFullscreenElementsIgnoreSafeArea or false
		end else nil
	}
end