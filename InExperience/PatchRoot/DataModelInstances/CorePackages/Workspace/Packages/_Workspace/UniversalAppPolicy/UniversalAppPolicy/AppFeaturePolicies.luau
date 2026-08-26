local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local cryoModule = require(parent.Cryo)
local var1 = cryoModule.Dictionary.values(require(parent.Foundation).Enums.ColorMode)
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

return function(p1)
	-- upvalues: isVRAppBuild (ref), luaAppEnableRecommendedCarouselForDesktop (ref), isSubjectToDesktopPolicies (ref), useOriginalPlatformChatPolicy (ref), fFlagAppChatOnConsoles (ref), fFlagAppIaScrollAwayGuac (ref), fFlagEnableLeftNavOnConsole (ref), guiService (ref), isRunningInStudio (ref), disableWebViewSupportInStudio (ref), getFFlagLuafiedReportEntryPoints (ref), getFFlagEnableAbuseReport10ft (ref), getFFlagUseVoiceExitBetaLanguage (ref), getFFlagSeamlessVoiceConsentToastPolicy (ref), getFFlagExpChatGuacChatDisabledReason (ref), fFlagAEGIS2UseGuacToShowEnabledMessage (ref), fFlagAEGIS2UseGuacToShowFAEUpsell (ref), fFlagExpChatUseGuacForFOMOUpsell (ref), fFlagExpChatUseGuacForCrossAgeChat (ref), getFFlagDisableCDLQrCodeForMaquettes (ref), cryoModule (ref), var1 (ref), debugUseLegacyCrossPlayApi (ref), debugCrossPlaySystemUi (ref), debugOverrideCrossPlayUri (ref), crossPlayCapabilitiesModule (ref), debugOverrideCrossPlaySettingsKey (ref), debugOverrideCrossPlayQueryParam (ref), getFFlagUseEnablePremiumUserFeaturesAppPolicy (ref), getFFlagUseExternalBrowserForAgeGuidelines10ft (ref), fFlagGuacCanRenderTransferOnProfile (ref), getFFlagEnableGateNotificationPreferencesTab (ref), userInputService (ref), fFlagLuaAppHomeVngAppUpsell (ref), fFlagVngAppUpsellPcLayout (ref), fFlagFriendRequestNicknames (ref), fFlagLuaAppParentUpsellPolicy (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), getFFlagNotificationsComplianceShouldRestrictStream (ref), debugForceShowIllegalContentReportingUI (ref), fFlagRenameParentEmailForVerificationUpsell (ref), fFlagFriendsChatOsaSystemMessage (ref), fFlagFriendsChatEnableConversationConsent (ref), fFlagEnableAndroidTvAppPolicies (ref), getFFlagEnableMultiPageSignup (ref), getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (ref), fFlagEnableMicrosoftStorePaymentsPlatform (ref), fFlagEnableFriendsRenamingForAll (ref), fFlagEnableMilkyWayPaymentsPlatformV2 (ref), fFlagEnableScreentimeMoreTimeOption (ref), flyoutDisablePremiumEntrypoint1 (ref), guacDisableBlackbirdEntrypoints (ref), flyoutEnableGiftcardsWithRedeem (ref), guacAppPolicyDisableSignupCheckbox (ref), fFlagEnableFaceIDTextOnAddAuthMethodPage (ref), fFlagEnableMorePageExitButtonSupport (ref), fFlagEnableMorePageDirectionalLayoutRolloutFix (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagMomentsAutoplayAmpPolicy (ref), getFFlagEnableSupportCenter (ref), fFlagSduiAppPolicyBindings (ref), fFlagGuacStickyShortcutBarEnabled (ref), fFlagEnableCoreContentAccountType (ref), fFlagEnableCoreContentBadge (ref), fFlagEnableFlyoutUncheckedBadge (ref), fFlagEnableNonFlyoutUncheckedBadge (ref), getFFlagEnableAccountSwitcherUncheckedBadge (ref), fFlagShowGameAgeRating (ref), fFlagDefaultKidsToDarkTheme (ref), fFlagMacMenuBarContentUpdates (ref), fFlagUsesCancelSearchAppPolicy (ref), fFlagAppNavMyStatsTab (ref), fFlagFullscreenElementsIgnoreSafeArea (ref)
	local function _(p2, p3)
		-- upvalues: p1 (ref), isVRAppBuild (copy)
		return if p1[p2] == nil then if isVRAppBuild() then p3 else not p3 else p1[p2]
	end
	
	return {
		getFriendFinder = function()
			-- upvalues: p1 (ref)
			return p1.FriendFinder or false
		end,
		getGameDetailsMorePage = function()
			-- upvalues: p1 (ref)
			return p1.GameDetailsMorePage or false
		end,
		getGameDetailsSubtitle = function()
			-- upvalues: p1 (ref)
			return p1.GameDetailsSubtitle or false
		end,
		getShowGlobalCounters = function()
			-- upvalues: p1 (ref)
			return p1.GameDetailsShowGlobalCounters or false
		end,
		getGameDetailsPlayWithFriends = function()
			-- upvalues: p1 (ref)
			return p1.GameDetailsPlayWithFriends or false
		end,
		getGameInfoList = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoList or false
		end,
		getGamePlaysAndRatings = function()
			-- upvalues: p1 (ref)
			return p1.GamePlaysAndRatings or false
		end,
		getNotifications = function()
			-- upvalues: p1 (ref)
			return p1.Notifications or false
		end,
		getRecommendedGames = function()
			-- upvalues: luaAppEnableRecommendedCarouselForDesktop (copy), p1 (ref), isSubjectToDesktopPolicies (copy)
			return if luaAppEnableRecommendedCarouselForDesktop then p1.RecommendedGames or false elseif isSubjectToDesktopPolicies() then false else p1.RecommendedGames or false
		end,
		getSearchBar = function()
			-- upvalues: p1 (ref)
			return p1.SearchBar or false
		end,
		getMorePageContent = function()
			-- upvalues: useOriginalPlatformChatPolicy (copy), p1 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p1.MorePageContent elseif fFlagAppChatOnConsoles then p1.MorePageContent2 else p1.MorePageContent
		end,
		getAboutPageType = function()
			-- upvalues: p1 (ref)
			return p1.AboutPageType or "CJVAbout"
		end,
		getSettingsPageType = function()
			-- upvalues: p1 (ref)
			return p1.SettingsPageType or "Settings"
		end,
		getSocialLinks = function()
			-- upvalues: p1 (ref)
			return p1.SocialLinks or false
		end,
		getSocialGroupLinks = function()
			-- upvalues: p1 (ref)
			return p1.SocialGroupLinks or false
		end,
		getCommunityLinksEnabled = function()
			-- upvalues: p1 (ref)
			return p1.CommunityLinksEnabled or false
		end,
		getGameInfoShowBadges = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowBadges or false
		end,
		getGameInfoShowCreated = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowCreated or false
		end,
		getGameInfoShowGamepasses = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowGamepasses or false
		end,
		getGameInfoShowGenre = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowGenre or false
		end,
		getGameInfoShowSubgenre = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowSubgenre or false
		end,
		getGameInfoShowMaxPlayers = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowMaxPlayers or false
		end,
		getGameInfoShowServers = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowServers or false
		end,
		getGameInfoShowUpdated = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowUpdated or false
		end,
		getGameInfoShowAgeRecommendation = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowAgeRecommendation == nil or p1.GameInfoShowAgeRecommendation
		end,
		getGameInfoShowVoiceAndChatFeatures = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoShowVoiceAndChatFeatures == nil or p1.GameInfoShowVoiceAndChatFeatures
		end,
		getSiteMessageBanner = function()
			-- upvalues: p1 (ref)
			return p1.SiteMessageBanner or false
		end,
		getAlertRateLimit = function()
			-- upvalues: p1 (ref)
			return p1.AlertRateLimit or 300
		end,
		getSearchAutoComplete = function()
			-- upvalues: p1 (ref)
			return p1.SearchAutoComplete or false
		end,
		getShowStudioCTA = function()
			-- upvalues: p1 (ref)
			return p1.ShowStudioCTA or false
		end,
		getAppIaScrollAwayEnabled = if fFlagAppIaScrollAwayGuac then function()
			-- upvalues: p1 (ref)
			return p1.AppIaScrollAwayEnabled or false
		end else nil,
		getUseOmniRecommendation = function()
			-- upvalues: p1 (ref)
			return p1.UseOmniRecommendation == nil or p1.UseOmniRecommendation
		end,
		getUseWidthBasedFormFactorRule = function()
			-- upvalues: p1 (ref)
			return p1.UseWidthBasedFormFactorRule or false
		end,
		getShowYouTubeAgeAlert = function()
			-- upvalues: p1 (ref)
			return p1.ShowYouTubeAgeAlert == nil or p1.ShowYouTubeAgeAlert
		end,
		getShowVideoThumbnails = function()
			-- upvalues: p1 (ref)
			return p1.ShowVideoThumbnails or false
		end,
		getHomeIcon = function()
			-- upvalues: p1 (ref)
			return p1.HomeIcon or "LuaApp/icons/ic-roblox-close"
		end,
		getGameInfoListShowRNVDeveloper = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoListShowRNVDeveloper or false
		end,
		getGameInfoListDeveloper = function()
			-- upvalues: p1 (ref)
			return p1.GameInfoListDeveloper or false
		end,
		getShowDisplayName = function()
			-- upvalues: p1 (ref)
			return p1.ShowDisplayName == nil or p1.ShowDisplayName
		end,
		getShowAlias = function()
			-- upvalues: p1 (ref)
			return p1.ShowUserAlias == nil or p1.ShowUserAlias
		end,
		getCatalogReportingDisabled = function()
			-- upvalues: p1 (ref)
			return p1.CatalogReportingDisabled or false
		end,
		getGameReportingDisabled = function()
			-- upvalues: p1 (ref)
			return p1.GameReportingDisabled or false
		end,
		getGamesPageCreationCenterTitle = function()
			-- upvalues: p1 (ref)
			return p1.GamesPageCreationCenterTitle or false
		end,
		shouldUseExternalBrowserForDisclaimerLinks = function()
			-- upvalues: p1 (ref)
			return p1.UseExternalBrowserForDisclaimerLinks or false
		end,
		shouldUseExternalBrowserForMorePageItem = function()
			-- upvalues: p1 (ref)
			return p1.UseExternalBrowserForMoreLinks or false
		end,
		getCatalogShow3dView = function()
			-- upvalues: p1 (ref)
			return p1.CatalogShow3dView or false
		end,
		getItemDetailsFullView = function()
			-- upvalues: p1 (ref)
			return p1.ItemDetailsFullView or false
		end,
		getCatalogCommunityCreations = function()
			-- upvalues: p1 (ref)
			return p1.CatalogCommunityCreations or false
		end,
		getCatalogPremiumCategory = function()
			-- upvalues: p1 (ref)
			return p1.CatalogPremiumCategory or false
		end,
		getShowCatalogPremiumContent = function()
			-- upvalues: p1 (ref)
			return p1.CatalogPremiumContent or false
		end,
		getRobloxCreatedItemsCreatedByLuobu = function()
			-- upvalues: p1 (ref)
			return p1.RobloxCreatedItemsCreatedByLuobu == nil or p1.RobloxCreatedItemsCreatedByLuobu
		end,
		getHomePageFriendSection = function()
			-- upvalues: p1 (ref)
			return p1.HomePageFriendSection or false
		end,
		getHomePageProfileLink = function()
			-- upvalues: p1 (ref)
			return p1.HomePageProfileLink or false
		end,
		getPurchasePromptIncludingWarning = function()
			-- upvalues: p1 (ref)
			return p1.PurchasePromptIncludingWarning == nil or p1.PurchasePromptIncludingWarning
		end,
		getCheckUserAgreementsUpdatedOnLogin = function()
			-- upvalues: p1 (ref)
			return p1.CheckUserAgreementsUpdatedOnLogin == nil or p1.CheckUserAgreementsUpdatedOnLogin
		end,
		getAddUserAgreementIdsToSignupRequest = function()
			-- upvalues: p1 (ref)
			return p1.AddUserAgreementIdsToSignupRequest or false
		end,
		RequireExplicitVoiceConsent = function()
			-- upvalues: p1 (ref)
			return p1.RequireExplicitVoiceConsent or false
		end,
		getRequireExplicitAvatarVideoConsent = function()
			-- upvalues: p1 (ref)
			return p1.RequireExplicitAvatarVideoConsent or false
		end,
		getShowVoiceUpsellV2 = function()
			-- upvalues: p1 (ref)
			return p1.ShowVoiceUpsellV2 or false
		end,
		getShouldShowGroupsTile = function()
			-- upvalues: p1 (ref)
			return p1.ShouldShowGroupsTile or false
		end,
		useLuobuAuthentication = function()
			-- upvalues: p1 (ref)
			return p1.UseLuobuAuthentication or false
		end,
		useWechatQQAuthentication = function()
			-- upvalues: p1 (ref)
			return p1.UseWechatQQAuthentication or false
		end,
		useMSDKWebAuthentication = function()
			-- upvalues: p1 (ref)
			return p1.UseMSDKWebAuthentication or false
		end,
		getQrFriendingEnabled = function()
			-- upvalues: p1 (ref)
			return p1.QrFriendingEnabled or false
		end,
		getShouldShowCameraPermissionInAgreementsPrompt = function()
			-- upvalues: p1 (ref)
			return p1.ShouldShowCameraPermissionInAgreementsPrompt or false
		end,
		getExperienceInviteShareLinkEnabled = function()
			-- upvalues: p1 (ref)
			return p1.ExperienceInviteShareLinkEnabled or false
		end,
		getCsatSurveyRestrictTextInput = function()
			-- upvalues: p1 (ref)
			return p1.CsatSurveyRestrictTextInput or false
		end,
		useGridPageLayout = function()
			-- upvalues: isVRAppBuild (copy), p1 (ref), isSubjectToDesktopPolicies (copy)
			return if isVRAppBuild() then if p1.UseGridPageLayout == nil then isVRAppBuild() else p1.UseGridPageLayout elseif p1.UseGridPageLayout == nil then isSubjectToDesktopPolicies() else p1.UseGridPageLayout
		end,
		usePhoneSearchDiscoverEntry = function()
			-- upvalues: p1 (ref), isSubjectToDesktopPolicies (copy)
			return if p1.UsePhoneSearchDiscoverEntry == nil then not isSubjectToDesktopPolicies() else p1.UsePhoneSearchDiscoverEntry
		end,
		getShouldSystemBarUsuallyBePresent = function()
			-- upvalues: isVRAppBuild (copy), p1 (ref), fFlagEnableLeftNavOnConsole (copy), guiService (copy)
			return if isVRAppBuild() then if p1.ShouldSystemBarUsuallyBePresentForVR == nil then isVRAppBuild() else p1.ShouldSystemBarUsuallyBePresentForVR elseif fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then true else p1.ShouldSystemBarUsuallyBePresent or false
		end,
		getContactImporterEnabled = function()
			-- upvalues: isSubjectToDesktopPolicies (copy), p1 (ref)
			return if isSubjectToDesktopPolicies() then false else p1.ContactImporterEnabled or false
		end,
		getShouldShowSettingsPermissionsAdditionalInstructions = function()
			-- upvalues: p1 (ref)
			return p1.shouldShowSettingsPermissionsAdditionalInstructions or false
		end,
		getUseVRFTUXPanel = function()
			-- upvalues: p1 (ref), isVRAppBuild (copy)
			return if p1.UseVRFTUXPanel == nil then isVRAppBuild() else p1.UseVRFTUXPanel
		end,
		getWebViewSupport = function()
			-- upvalues: isRunningInStudio (copy), disableWebViewSupportInStudio (copy), p1 (ref), isVRAppBuild (copy)
			return if isRunningInStudio() then disableWebViewSupportInStudio elseif p1.EnableWebViewSupport == nil then isVRAppBuild() else p1.EnableWebViewSupport
		end,
		getUseLuafiedReportFlow = function()
			-- upvalues: isVRAppBuild (copy), getFFlagLuafiedReportEntryPoints (copy), p1 (ref), getFFlagEnableAbuseReport10ft (copy)
			return if isVRAppBuild() and getFFlagLuafiedReportEntryPoints() then if p1.UseLuafiedReportFlow == nil then isVRAppBuild() else p1.UseLuafiedReportFlow elseif getFFlagEnableAbuseReport10ft() then p1.UseLuafiedReportFlow or false else nil
		end,
		getThrottleFramerate = function()
			-- upvalues: p1 (ref), isVRAppBuild (copy)
			return if p1.ThrottleFramerate == nil then isVRAppBuild() else p1.ThrottleFramerate
		end,
		getUseRoundedCorners = function()
			-- upvalues: isVRAppBuild (copy), p1 (ref)
			return if isVRAppBuild() then if p1.UseRoundedCorners == nil then isVRAppBuild() else p1.UseRoundedCorners else false
		end,
		getGameInfoShowChatFeatures = function()
			-- upvalues: getFFlagUseVoiceExitBetaLanguage (copy), p1 (ref)
			return if getFFlagUseVoiceExitBetaLanguage() then p1.GameInfoShowChatFeatures or false else false
		end,
		getDisplayCheckboxInVoiceConsent = function()
			-- upvalues: getFFlagSeamlessVoiceConsentToastPolicy (copy), p1 (ref)
			return if getFFlagSeamlessVoiceConsentToastPolicy() then p1.DisplayCheckboxInVoiceConsent or false else false
		end,
		getExperienceChatAvailability = function()
			-- upvalues: getFFlagExpChatGuacChatDisabledReason (copy), p1 (ref)
			return if getFFlagExpChatGuacChatDisabledReason() then p1.ExperienceChatAvailability or "unknown" else "unknown"
		end,
		getInCommsRegionBubble = function()
			-- upvalues: fFlagAEGIS2UseGuacToShowEnabledMessage (copy), p1 (ref)
			return if fFlagAEGIS2UseGuacToShowEnabledMessage then p1.InCommsRegionBubble or false else false
		end,
		getShowInExpFAEUpsell = function()
			-- upvalues: fFlagAEGIS2UseGuacToShowFAEUpsell (copy), p1 (ref)
			return if fFlagAEGIS2UseGuacToShowFAEUpsell then p1.ShowInExpFAEUpsell or false else false
		end,
		getUseAmpV2WizardForVpc = function()
			-- upvalues: p1 (ref)
			return p1.UseAmpV2WizardForVpc or false
		end,
		getShowFOMOUpsell = function()
			-- upvalues: fFlagExpChatUseGuacForFOMOUpsell (copy), p1 (ref)
			return if fFlagExpChatUseGuacForFOMOUpsell then p1.ShowFOMOUpsell or false else false
		end,
		getShowCrossAgeChat = function()
			-- upvalues: fFlagExpChatUseGuacForCrossAgeChat (copy), p1 (ref)
			return if fFlagExpChatUseGuacForCrossAgeChat then p1.ShowCrossAgeExpChat or false else false
		end,
		getCanSeeChatTerminology = function()
			-- upvalues: p1 (ref)
			return p1.canSeeChatTerminology or false
		end,
		getAllowCameraMovements = function()
			-- upvalues: p1 (ref), isVRAppBuild (copy)
			return if p1.AllowCameraMovements == nil then isVRAppBuild() else p1.AllowCameraMovements
		end,
		getShouldSkipAvatarLandingPage = function()
			-- upvalues: p1 (ref), isVRAppBuild (copy)
			return if p1.ShouldSkipAvatarLandingPage == nil then isVRAppBuild() else p1.ShouldSkipAvatarLandingPage
		end,
		getShowPassesOnExperienceDetails = function()
			-- upvalues: p1 (ref)
			return p1.ShowPassesOnExperienceDetails or false
		end,
		getDisableCDLQrCodeForMaquettes = function()
			-- upvalues: getFFlagDisableCDLQrCodeForMaquettes (copy), p1 (ref)
			return if getFFlagDisableCDLQrCodeForMaquettes() then p1.DisableCDLQrCodeForMaquettes else false
		end,
		getDisableIAPEntryPoint = function()
			-- upvalues: p1 (ref)
			return p1.DisableIAPEntryPoint or false
		end,
		getEnforceAgeRestrictedLogin = function()
			-- upvalues: p1 (ref)
			return p1.EnforceAgeRestrictedLogin or false
		end,
		getUrlAuthRoutes = function()
			-- upvalues: p1 (ref)
			local routes = p1.Routes or {}
			
			return if routes then routes.auth or {} else {}
		end,
		getShowDisconnectButton = function()
			-- upvalues: p1 (ref)
			return p1.ShowDisconnectButton or false
		end,
		getUseSingleSignOn = function()
			-- upvalues: isRunningInStudio (copy), p1 (ref)
			return if isRunningInStudio() then false else p1.UseSingleSignOn or false
		end,
		getGridCarouselSeeAllTilesEnabled = function()
			-- upvalues: p1 (ref)
			return p1.UseGridCarouselSeeAllTiles or false
		end,
		getSearchWithoutNavigatingEnabled = function()
			-- upvalues: fFlagEnableLeftNavOnConsole (copy), guiService (copy), p1 (ref)
			return if fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then false else p1.SingleSearchPageNoNavigation or false
		end,
		getGameListCategoryScrollListEnabled = function()
			-- upvalues: p1 (ref)
			return p1.GetGamesListCategoryTabs or false
		end,
		getForceTheme = function()
			-- upvalues: cryoModule (copy), var1 (copy), p1 (ref)
			return if p1.ForceTheme and cryoModule.List.find(cryoModule.List.map(var1, function(p2)
				return p2:lower()
			end), p1.ForceTheme:lower()) then p1.ForceTheme else nil
		end,
		enableExperienceDetailsPanel = function()
			-- upvalues: p1 (ref)
			return p1.EnableExperienceDetailsPanel or false
		end,
		getDisableRegularLogin = function()
			-- upvalues: p1 (ref)
			return not p1.EnableWebViewSupport and not p1.EnableRegularLoginWithoutWebViewSupport
		end,
		getAllowPlatformAccountSwitching = function()
			-- upvalues: p1 (ref)
			return p1.AllowPlatformAccountSwitching or false
		end,
		useLegacyCrossPlayApi = function()
			-- upvalues: debugUseLegacyCrossPlayApi (copy), p1 (ref)
			return debugUseLegacyCrossPlayApi or (p1.useLegacyCrossPlayApi or false)
		end,
		useCrossPlaySystemUi = function()
			-- upvalues: debugCrossPlaySystemUi (copy), p1 (ref)
			return debugCrossPlaySystemUi or (p1.useCrossPlaySystemUi or false)
		end,
		getCrossPlayUri = function()
			-- upvalues: debugOverrideCrossPlayUri (copy), p1 (ref)
			return if debugOverrideCrossPlayUri == "" then p1.crossPlayUri or "" else debugOverrideCrossPlayUri
		end,
		getCrossPlayCapabilities = function()
			-- upvalues: cryoModule (copy), p1 (ref), crossPlayCapabilitiesModule (copy)
			return cryoModule.List.foldLeft(p1.crossPlayCapabilities or {}, function(p2, p3)
				-- upvalues: cryoModule (copy), crossPlayCapabilitiesModule (copy)
				return if cryoModule.List.find(p2, p3) then p2 else cryoModule.List.join(p2, { crossPlayCapabilitiesModule[p3] })
			end, {})
		end,
		getCrossPlaySettingsKey = function()
			-- upvalues: debugOverrideCrossPlaySettingsKey (copy), p1 (ref)
			return if debugOverrideCrossPlaySettingsKey == "" then p1.crossPlaySettingsKey or "" else debugOverrideCrossPlaySettingsKey
		end,
		getCrossPlayQueryParam = function()
			-- upvalues: debugOverrideCrossPlayQueryParam (copy), p1 (ref)
			return if debugOverrideCrossPlayQueryParam == "" then p1.crossPlayQueryParam or "" else debugOverrideCrossPlayQueryParam
		end,
		getPromotionalEmailsCheckboxEnabled = function()
			-- upvalues: p1 (ref)
			return if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then p1.PromotionalEmailsCheckboxEnabled or false else false
		end,
		getPromotionalEmailsOptInByDefault = function()
			-- upvalues: p1 (ref)
			return if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then p1.PromotionalEmailsOptInByDefault or false else false
		end,
		getSupportsOverscan = function()
			-- upvalues: p1 (ref)
			return p1.SupportsOverscan or false
		end,
		getUseConsoleGameJoinCard = function()
			-- upvalues: p1 (ref)
			return p1.UseConsoleGameJoinCard or false
		end,
		getPlatformDisplayName = function()
			-- upvalues: p1 (ref)
			return p1.platformDisplayName or ""
		end,
		getPlatformAccountName = function()
			-- upvalues: p1 (ref)
			return p1.platformAccountName or nil
		end,
		getSupportsProfileSwitching = function()
			-- upvalues: p1 (ref)
			return p1.supportsProfileSwitching or false
		end,
		getMountAllOmniFeedItems = function()
			-- upvalues: p1 (ref)
			return p1.mountAllOmniFeedItems or false
		end,
		getFriendCodeQrCodeScannerEnabled = function()
			-- upvalues: p1 (ref)
			return p1.FriendCodeQrCodeScannerEnabled or false
		end,
		getInviteFriendsDisabled = function()
			-- upvalues: p1 (ref)
			return p1.InviteFriendsDisabled or false
		end,
		getRealNamesInDisplayNamesEnabled = function()
			-- upvalues: p1 (ref)
			return p1.RealNamesInDisplayNamesEnabled or false
		end,
		getProfileShareLinkEnabled = function()
			-- upvalues: p1 (ref)
			return p1.ProfileShareLinkEnabled
		end,
		getProfileCopyLinkEnabled = function()
			-- upvalues: p1 (ref)
			return p1.ProfileCopyLinkEnabled
		end,
		getEnablePremiumUserFeatures = function()
			-- upvalues: getFFlagUseEnablePremiumUserFeaturesAppPolicy (copy), p1 (ref)
			return if getFFlagUseEnablePremiumUserFeaturesAppPolicy() then p1.EnablePremiumUserFeatures or false else nil
		end,
		getEnableDualLogin = function()
			-- upvalues: p1 (ref)
			return p1.enableDualLogin or false
		end,
		getUseExternalBrowserForAgeGuidelines = function()
			-- upvalues: getFFlagUseExternalBrowserForAgeGuidelines10ft (copy), p1 (ref)
			return if getFFlagUseExternalBrowserForAgeGuidelines10ft() then p1.UseExternalBrowserForAgeGuidelines or false else nil
		end,
		getEnableHomePageAgeBlock = function()
			-- upvalues: p1 (ref)
			return p1.EnableHomePageAgeBlock or false
		end,
		getEnableUAppAccessBlock = function()
			-- upvalues: p1 (ref)
			return p1.EnableUAppAccessBlock or false
		end,
		getUAppBlockPageTextMapKey = function()
			-- upvalues: p1 (ref)
			return p1.UAppBlockPageTextMapKey or nil
		end,
		getUAppBlockPageShouldDisableLogOut = function()
			-- upvalues: p1 (ref)
			return p1.UAppBlockPageShouldDisableLogOut or nil
		end,
		getContactsToastEnabled = function()
			-- upvalues: p1 (ref)
			return p1.ContactsToastEnabled or false
		end,
		getEnableProfileQrCode = function()
			-- upvalues: p1 (ref)
			return p1.EnableProfileQrCode or false
		end,
		getCanRenderTransferOnProfile = function()
			-- upvalues: fFlagGuacCanRenderTransferOnProfile (copy), p1 (ref)
			return if fFlagGuacCanRenderTransferOnProfile then p1.CanRenderTransferOnProfile or false else false
		end,
		getShowVNGLoginWithExistingAccountQuickLoginButton = function()
			-- upvalues: p1 (ref)
			return p1.ShowVNGLoginWithExistingAccountQuickLoginButton or false
		end,
		getUseCrossDeviceLoginByDefault = function()
			-- upvalues: p1 (ref)
			return p1.UseCrossDeviceLoginByDefault or false
		end,
		getShowVNGAge12Badge = function()
			-- upvalues: p1 (ref)
			return p1.ShowVNGAge12Badge or false
		end,
		getShowBrazilContentRatingLogo = function()
			-- upvalues: p1 (ref)
			return p1.ShowBrazilContentRatingLogo or false
		end,
		getUseVNGUserAgreementPopup = function()
			-- upvalues: p1 (ref)
			return p1.UseVNGUserAgreementPopup or false
		end,
		getRedirectBuyRobuxToVNG = function()
			-- upvalues: p1 (ref)
			return p1.RedirectBuyRobuxToVNG or false
		end,
		getShowVNGTosForRobuxUpsell = function()
			-- upvalues: p1 (ref)
			return p1.ShowVNGTosForRobuxUpsell or false
		end,
		getBlockVNGU12SignUpOnClientSide = function()
			-- upvalues: p1 (ref)
			return p1.BlockVNGU12SignUpOnClientSide or false
		end,
		getUseAgeInput = function()
			-- upvalues: p1 (ref)
			return p1.UseAgeInput or false
		end,
		getLoginUsernameOnly = function()
			-- upvalues: p1 (ref)
			return p1.LoginUsernameOnly or false
		end,
		getDisableEmailOTPLogin = function()
			-- upvalues: p1 (ref)
			return p1.DisableEmailOTPLogin or false
		end,
		getDisableLoginForgotButton = function()
			-- upvalues: p1 (ref)
			return p1.DisableLoginForgotButton or false
		end,
		getDisableLogOutEmailUpsell = function()
			-- upvalues: p1 (ref)
			return p1.DisableLogOutEmailUpsell or false
		end,
		getVerifiedSignupCountry = function()
			-- upvalues: p1 (ref)
			return p1.verifiedSignupCountry or false
		end,
		getParentalConsentAgreementId = function()
			-- upvalues: p1 (ref)
			return p1.parentalConsentAgreementId or ""
		end,
		getIsStrictComplianceEnabled = function()
			-- upvalues: p1 (ref)
			return p1.isStrictComplianceEnabled or false
		end,
		getUseKoreaKISAUserAgreementPopup = function()
			-- upvalues: p1 (ref)
			return p1.useKoreaKISAUserAgreementPopup or false
		end,
		getEnableNotificationPreferencesPage = function()
			-- upvalues: getFFlagEnableGateNotificationPreferencesTab (copy), p1 (ref)
			return if getFFlagEnableGateNotificationPreferencesTab() then p1.EnableNotificationPreferencesPage or false else nil
		end,
		getVNGFormRequired = function()
			-- upvalues: p1 (ref)
			return p1.VNGFormRequired or false
		end,
		getUpsellVoiceForPhoneVerification = function()
			-- upvalues: p1 (ref)
			return p1.UpsellVoiceForPhoneVerification or false
		end,
		getIsLinkedVRModeAvailable = function()
			-- upvalues: userInputService (copy)
			local platform = userInputService:GetPlatform()
			
			return if platform ~= Enum.Platform.Windows then platform == Enum.Platform.UWP else true
		end,
		getShouldShowPhoneUpsell = function()
			-- upvalues: p1 (ref)
			return p1.ShouldShowPhoneUpsell or false
		end,
		getTermsOfUseLink = function()
			-- upvalues: p1 (ref)
			return p1.TermsOfUseLink or ""
		end,
		getPrivacyPolicyLink = function()
			-- upvalues: p1 (ref)
			return p1.PrivacyPolicyLink or ""
		end,
		getVngAppUpsell = function()
			-- upvalues: fFlagLuaAppHomeVngAppUpsell (copy), p1 (ref)
			return if fFlagLuaAppHomeVngAppUpsell then p1.VngAppUpsell or false else false
		end,
		getVngAppUpsellPcLayout = if fFlagVngAppUpsellPcLayout then function()
			-- upvalues: p1 (ref)
			return p1.VngAppUpsellPcLayout or false
		end else nil,
		getShouldHideContactImporterUpsell = function()
			-- upvalues: p1 (ref)
			return p1.ShouldHideContactImporterUpsell or false
		end,
		getContactImporterEncouraged = function()
			-- upvalues: p1 (ref)
			return p1.contactImporterEncouraged or false
		end,
		getFriendRequestNicknamesEnabled = function()
			-- upvalues: fFlagFriendRequestNicknames (copy), p1 (ref)
			return if fFlagFriendRequestNicknames then p1.FriendRequestNicknamesEnabled or false else false
		end,
		getShouldShowVpcPlayButtonUpsells = if fFlagLuaAppParentUpsellPolicy then function()
			-- upvalues: p1 (ref)
			return p1.shouldShowVpcPlayButtonUpsells or false
		end else nil,
		getDisablePlayableWhenLoading = if fFlagLuaAppSupportDisablePlayableWhenLoading then function()
			-- upvalues: p1 (ref)
			return p1.DisablePlayableWhenLoading or false
		end else nil,
		getRenamePaymentsToSpendingTab = function()
			-- upvalues: p1 (ref)
			return p1.renamePaymentsToSpendingTab or false
		end,
		getNotificationsCanReceiveStream = function()
			-- upvalues: getFFlagNotificationsComplianceShouldRestrictStream (copy), p1 (ref)
			return if getFFlagNotificationsComplianceShouldRestrictStream() then p1.notificationsCanAccessStream or false else nil
		end,
		getNotificationsCanReceivePush = function()
			-- upvalues: p1 (ref)
			return p1.notificationsCanAccessPush or false
		end,
		getPushNotificationsUpsell = function()
			-- upvalues: p1 (ref)
			return p1.ShouldShowPushNotificationsUpsell or false
		end,
		getNotificationsCanReceiveExperience = function()
			-- upvalues: p1 (ref)
			return p1.notificationsCanAccessExperience == nil or p1.notificationsCanAccessExperience
		end,
		getDisableResellingCollectiblesForCompliance = function()
			-- upvalues: p1 (ref)
			return p1.DisableResellingCollectiblesForCompliance or false
		end,
		getShowIllegalContentReportingUI = function()
			-- upvalues: debugForceShowIllegalContentReportingUI (copy), p1 (ref)
			return debugForceShowIllegalContentReportingUI or (p1.ShowIllegalContentReportingUI or false)
		end,
		getEligibleForContentPostFeed = function()
			-- upvalues: p1 (ref)
			return p1.EligibleForContentPostFeed or false
		end,
		getEligibleForExternalContentSharing = function()
			-- upvalues: p1 (ref)
			return p1.EligibleForExternalContentSharing or false
		end,
		getEnableContinuousLoad = function()
			-- upvalues: p1 (ref)
			return p1.EnableContinuousLoad or false
		end,
		getEnableAggregateLikesFavoritesCount = function()
			-- upvalues: p1 (ref)
			return p1.EnableAggregateLikesFavoritesCount or false
		end,
		getShowUpdatedCameraPath = function()
			-- upvalues: p1 (ref)
			return p1.showUpdatedCameraPath or false
		end,
		getRenameParentEmailForVerificationUpsell = function()
			-- upvalues: fFlagRenameParentEmailForVerificationUpsell (copy), p1 (ref)
			return if fFlagRenameParentEmailForVerificationUpsell() then p1.renameParentEmailForVerificationUpsell or false else false
		end,
		getKeystrokeCollectionEnabled = function()
			-- upvalues: p1 (ref)
			return if game:GetFastFlag("BehaviorCollectionControlEnabled") then p1.EnableKeystrokeCollection or false else false
		end,
		getCanUsePlatformChat = function()
			-- upvalues: useOriginalPlatformChatPolicy (copy), p1 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p1.CanUsePlatformChat or false elseif fFlagAppChatOnConsoles then p1.CanUsePlatformChat2 or false else p1.CanUsePlatformChat or false
		end,
		getCanSeeChatTab = function()
			-- upvalues: useOriginalPlatformChatPolicy (copy), p1 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p1.CanSeeChatTab or false elseif fFlagAppChatOnConsoles then p1.CanSeeChatTab2 or false else p1.CanSeeChatTab or false
		end,
		getCanSeeFriendsTab = function()
			-- upvalues: fFlagFriendsChatOsaSystemMessage (copy), fFlagFriendsChatEnableConversationConsent (copy), p1 (ref)
			local t = {
				VR = false,
				Console = false,
				Gamepad = false,
				ContextCard = fFlagFriendsChatOsaSystemMessage,
				ConversationConsent = fFlagFriendsChatEnableConversationConsent
			}
			
			for i, v in p1.FriendsTabRequiredCapabilities or {} do
				if not t[v] then
					return false
				end
			end
			return true
		end,
		getHidesGamesTab = function()
			-- upvalues: fFlagEnableAndroidTvAppPolicies (copy), p1 (ref)
			return if fFlagEnableAndroidTvAppPolicies then p1.HidesGamesTab or false else false
		end,
		getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function()
			-- upvalues: getFFlagEnableMultiPageSignup (copy), p1 (ref)
			return if getFFlagEnableMultiPageSignup() then p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil or p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup else true
		end,
		getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function()
			-- upvalues: getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (copy), getFFlagEnableMultiPageSignup (copy), p1 (ref)
			local var2 = getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup()
			
			return if getFFlagEnableMultiPageSignup() then if p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then var2 else p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages else var2
		end,
		getRobuxUpsellFlowMobile = function()
			-- upvalues: p1 (ref)
			return p1.useMobileRobuxUpsellFlow or false
		end,
		getUsePaymentPlatformMicrosoftStore = function()
			-- upvalues: fFlagEnableMicrosoftStorePaymentsPlatform (copy), p1 (ref)
			return if fFlagEnableMicrosoftStorePaymentsPlatform then p1.usePaymentPlatformMicrosoftStore or false else false
		end,
		getMicSettingsDirectionsLocaleKey = function()
			-- upvalues: p1 (ref)
			return p1.micSettingsDirectionsLocaleKey or nil
		end,
		getMicSettingsDeeplinkDirectionsLocaleKey = function()
			-- upvalues: p1 (ref)
			return p1.micSettingsDeeplinkDirectionsLocaleKey or nil
		end,
		getRequiresAppRestartOnMicAccessChange = function()
			-- upvalues: p1 (ref)
			return p1.requiresAppRestartOnMicAccessChange or false
		end,
		getRenameFriendsToConnections = function()
			-- upvalues: fFlagEnableFriendsRenamingForAll (copy), p1 (ref)
			return if fFlagEnableFriendsRenamingForAll then true else p1.renameFriendsToConnections or false
		end,
		getShareSheetEnabled = function()
			-- upvalues: p1 (ref)
			return p1.shareSheetEnabled or false
		end,
		getCanAccessTrustedContacts = function()
			-- upvalues: p1 (ref)
			return p1.canAccessTrustedContacts or false
		end,
		getExperienceDetailsNoticeType = function()
			-- upvalues: p1 (ref)
			return p1.experienceDetailsNoticeType or nil
		end,
		getRequiresOSAFriendingEducation = function()
			-- upvalues: p1 (ref)
			return p1.requiresOSAFriendingEducation or false
		end,
		getSocialGraphSyncEnabled = function()
			-- upvalues: p1 (ref)
			return p1.SocialGraphSyncEnabled or false
		end,
		getAccountDisambiguationDisabled = function()
			-- upvalues: p1 (ref)
			return p1.AccountDisambiguationDisabled or false
		end,
		getHasWebViewSupportForFAE = function()
			-- upvalues: p1 (ref)
			return p1.hasWebViewSupportForFAE or false
		end,
		getLinkedAuthEndpointsEnabled = function()
			-- upvalues: p1 (ref)
			return p1.LinkedAuthEndpointsEnabled or false
		end,
		getLinkingPlatform = function()
			-- upvalues: p1 (ref)
			return p1.LinkingPlatform or nil
		end,
		getUsePaymentPlatformMilkyWayStore = function()
			-- upvalues: fFlagEnableMilkyWayPaymentsPlatformV2 (copy), p1 (ref)
			return if fFlagEnableMilkyWayPaymentsPlatformV2 then p1.usePaymentPlatformMilkyWayStore or false else false
		end,
		getScreentimeMoreTimeOptionEnabled = function()
			-- upvalues: fFlagEnableScreentimeMoreTimeOption (copy), p1 (ref)
			return if fFlagEnableScreentimeMoreTimeOption then p1.ScreentimeMoreTimeOptionEnabled or false else false
		end,
		getDisablePremiumEntrypoint = function()
			-- upvalues: flyoutDisablePremiumEntrypoint1 (copy), p1 (ref)
			return if flyoutDisablePremiumEntrypoint1 then p1.DisablePremiumEntrypoint or (p1.DisablePremiumEntryPoint or false) else false
		end,
		getDisableBlackbirdEntrypoints = function()
			-- upvalues: guacDisableBlackbirdEntrypoints (copy), p1 (ref)
			return if guacDisableBlackbirdEntrypoints then p1.DisableBlackbirdEntrypoints or false else false
		end,
		getEnableGiftcardsWithRedeem = function()
			-- upvalues: flyoutEnableGiftcardsWithRedeem (copy), p1 (ref)
			return if flyoutEnableGiftcardsWithRedeem then p1.EnableGiftcardsWithRedeem or false else false
		end,
		getGiftCardSourceRefOverride = function()
			-- upvalues: p1 (ref)
			return p1.GiftCardSourceRefOverride or ""
		end,
		getSignupCheckboxDisabled = function()
			-- upvalues: guacAppPolicyDisableSignupCheckbox (copy), p1 (ref)
			return if guacAppPolicyDisableSignupCheckbox then p1.DisableSignupCheckbox or false else false
		end,
		getShouldShowFaceIDText = function()
			-- upvalues: fFlagEnableFaceIDTextOnAddAuthMethodPage (copy), p1 (ref)
			return if fFlagEnableFaceIDTextOnAddAuthMethodPage then p1.ShouldShowFaceIDText or false else false
		end,
		getExcludeCrossDeviceSignIn = function()
			-- upvalues: p1 (ref)
			return p1.ExcludeCrossDeviceSignIn or false
		end,
		getExcludePasskeyLogin = function()
			-- upvalues: p1 (ref)
			return p1.ExcludePasskeyLogin or false
		end,
		getExcludeUsernamePasswordSignIn = function()
			-- upvalues: p1 (ref)
			return p1.ExcludeUsernamePasswordSignIn or false
		end,
		getExcludeEmailPasswordSignIn = function()
			-- upvalues: p1 (ref)
			return p1.ExcludeEmailPasswordSignIn or false
		end,
		getExcludePhoneNumberPasswordSignIn = function()
			-- upvalues: p1 (ref)
			return p1.ExcludePhoneNumberPasswordSignIn or false
		end,
		getExcludeAccountSwitcher = function()
			-- upvalues: p1 (ref)
			return p1.ExcludeAccountSwitcher or false
		end,
		getAccountSwitcherEnabled = function()
			-- upvalues: p1 (ref)
			return p1.AccountSwitcherEnabled or false
		end,
		getAccountPickerEnabled = function()
			-- upvalues: p1 (ref)
			return p1.AccountPickerEnabled or false
		end,
		getExcludeUsernameUpdateModeration = function()
			-- upvalues: p1 (ref)
			return p1.ExcludeUsernameUpdateModeration or false
		end,
		getMorePageExitButtonEnabled = if fFlagEnableMorePageExitButtonSupport then function()
			-- upvalues: p1 (ref)
			return p1.MorePageExitButtonEnabled or false
		end else nil,
		getMoreGridDirectionalLayoutPreferred = if fFlagEnableMorePageDirectionalLayoutRolloutFix then function()
			-- upvalues: p1 (ref)
			return p1.MoreGridDirectionalLayoutPreferred or false
		end else nil,
		getShouldUseDMCCALegalDisclosureInApp = function()
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), p1 (ref)
			return if fFlagEnableUnifiedProductPurchaseFlow then p1.ShouldUseDMCCALegalDisclosureInApp or false else false
		end,
		getCanAccessParty = function()
			-- upvalues: p1 (ref)
			return p1.CanAccessParty == nil or p1.CanAccessParty
		end,
		getRedeemTileEnabled = function()
			-- upvalues: p1 (ref)
			return p1.RedeemTileEnabled or false
		end,
		getDisplayMomentsMoreTabTile = function()
			-- upvalues: p1 (ref)
			return p1.DisplayMomentsMoreTabTile or false
		end,
		getMomentsCanAutoPlay = if fFlagMomentsAutoplayAmpPolicy then function()
			-- upvalues: p1 (ref)
			return p1.MomentsAutoPlayEnabled == nil or p1.MomentsAutoPlayEnabled
		end else nil,
		getMomentsInfiniteScrollEnabled = function()
			-- upvalues: p1 (ref)
			return p1.MomentsInfiniteScrollEnabled == nil or p1.MomentsInfiniteScrollEnabled
		end,
		getSupportCenterEnabled = if getFFlagEnableSupportCenter() then function()
			-- upvalues: p1 (ref)
			return p1.SupportCenterEnabled or false
		end else nil,
		getShouldUseVibrationInsteadOfHaptics = function()
			-- upvalues: p1 (ref)
			return p1.ShouldUseVibrationInsteadOfHaptics or false
		end,
		getRawPolicy = if fFlagSduiAppPolicyBindings then function()
			-- upvalues: p1 (ref)
			return p1
		end else nil,
		getStickyShortcutBarEnabled = if fFlagGuacStickyShortcutBarEnabled then function()
			-- upvalues: p1 (ref)
			return p1.StickyShortcutBarEnabled or false
		end else nil,
		getAccountType = if fFlagEnableCoreContentAccountType then function()
			-- upvalues: p1 (ref)
			return p1.AccountType
		end else nil,
		getCoreContentBadgeText = if fFlagEnableCoreContentBadge then function()
			-- upvalues: p1 (ref)
			return p1.CoreContentBadgeText
		end else nil,
		getShowUncheckedBadge = if fFlagEnableFlyoutUncheckedBadge or fFlagEnableNonFlyoutUncheckedBadge then function()
			-- upvalues: p1 (ref)
			return p1.ShowUncheckedBadge
		end else nil,
		getShowUncheckedBadgeForAccountSwitcher = function()
			-- upvalues: getFFlagEnableAccountSwitcherUncheckedBadge (copy), p1 (ref)
			return if getFFlagEnableAccountSwitcherUncheckedBadge() then p1.ShowUncheckedBadge else false
		end,
		getShowGameAgeRating = if fFlagShowGameAgeRating then function()
			-- upvalues: p1 (ref)
			return p1.ShowGameAgeRating or false
		end else nil,
		getShowBadgeOver12 = if not fFlagShowGameAgeRating then function()
			-- upvalues: p1 (ref)
			return p1.ShowBadgeOver12 or false
		end else nil,
		getDefaultTheme = if fFlagDefaultKidsToDarkTheme then function()
			-- upvalues: p1 (ref)
			return p1.DefaultTheme
		end else nil,
		getDevicePreferencesPersistentPresenceVariant = if fFlagMacMenuBarContentUpdates then function()
			-- upvalues: p1 (ref)
			return p1.DevicePreferencesPersistentPresenceVariant
		end else nil,
		getCancelSearchOnLostFocus = if fFlagUsesCancelSearchAppPolicy then function()
			-- upvalues: p1 (ref)
			return p1.CancelSearchOnLostFocus == nil or p1.CancelSearchOnLostFocus
		end else nil,
		getCanViewBuild = if fFlagAppNavMyStatsTab then function()
			-- upvalues: p1 (ref)
			return p1.CanViewBuild or false
		end else nil,
		getCanUseBuild = if fFlagAppNavMyStatsTab then function()
			-- upvalues: p1 (ref)
			return p1.CanUseBuild or false
		end else nil,
		getShouldFullscreenElementsIgnoreSafeArea = if fFlagFullscreenElementsIgnoreSafeArea then function()
			-- upvalues: p1 (ref)
			return p1.ShouldFullscreenElementsIgnoreSafeArea or false
		end else nil
	}
end