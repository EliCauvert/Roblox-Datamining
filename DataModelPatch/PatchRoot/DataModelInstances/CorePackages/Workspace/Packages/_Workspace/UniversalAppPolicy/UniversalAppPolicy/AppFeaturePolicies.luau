local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local CryoModule = require(Parent.Cryo)
local ValuesResult = CryoModule.Dictionary.values(require(Parent.UIBlox).App.Style.Constants.ThemeName)
local CrossPlayCapabilitiesModule = require(script.Parent.Enum.CrossPlayCapabilities)
local SharedFlagsModule = require(Parent.SharedFlags)
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies
local IsRunningInStudioFunction = require(Parent.AppCommonLib).isRunningInStudio
local GetFFlagUseVoiceExitBetaLanguageFunction = SharedFlagsModule.GetFFlagUseVoiceExitBetaLanguage
local GetFFlagDisableCDLQrCodeForMaquettesFunction = SharedFlagsModule.GetFFlagDisableCDLQrCodeForMaquettes
local GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction = SharedFlagsModule.GetFFlagUseEnablePremiumUserFeaturesAppPolicy
local GetFFlagLuafiedReportEntryPointsFunction = SharedFlagsModule.GetFFlagLuafiedReportEntryPoints
local GetFFlagEnableAbuseReport10ftFunction = SharedFlagsModule.GetFFlagEnableAbuseReport10ft
local GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction = SharedFlagsModule.GetFFlagUseExternalBrowserForAgeGuidelines10ft
local GetFFlagEnableGateNotificationPreferencesTabFunction = SharedFlagsModule.GetFFlagEnableGateNotificationPreferencesTab
local GetFFlagEnableSupportCenterFunction = SharedFlagsModule.GetFFlagEnableSupportCenter
local FFlagLuaAppHomeVngAppUpsell = SharedFlagsModule.FFlagLuaAppHomeVngAppUpsell
local FFlagVngAppUpsellPcLayout = SharedFlagsModule.FFlagVngAppUpsellPcLayout
local FFlagFriendRequestNicknames = SharedFlagsModule.FFlagFriendRequestNicknames
local FFlagLuaAppParentUpsellPolicy = SharedFlagsModule.FFlagLuaAppParentUpsellPolicy
local FFlagRenameParentEmailForVerificationUpsellFunction = SharedFlagsModule.FFlagRenameParentEmailForVerificationUpsell
local GetFFlagSeamlessVoiceConsentToastPolicyFunction = SharedFlagsModule.GetFFlagSeamlessVoiceConsentToastPolicy
local GetFFlagEnableMultiPageSignupFunction = SharedFlagsModule.GetFFlagEnableMultiPageSignup
local GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignupFunction = SharedFlagsModule.GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup
local FFlagEnableMicrosoftStorePaymentsPlatform = SharedFlagsModule.FFlagEnableMicrosoftStorePaymentsPlatform
local FFlagEnableMilkyWayPaymentsPlatformV2 = SharedFlagsModule.FFlagEnableMilkyWayPaymentsPlatformV2
local FFlagAppIaScrollAwayGuac = SharedFlagsModule.FFlagAppIaScrollAwayGuac
local FFlagEnableScreentimeMoreTimeOption = SharedFlagsModule.FFlagEnableScreentimeMoreTimeOption
local FFlagEnableFriendsRenamingForAll = SharedFlagsModule.FFlagEnableFriendsRenamingForAll
local GetFFlagExpChatGuacChatDisabledReasonFunction = SharedFlagsModule.GetFFlagExpChatGuacChatDisabledReason
local FFlagGuacCanRenderTransferOnProfile = SharedFlagsModule.FFlagGuacCanRenderTransferOnProfile
local FFlagAuthSecExclusions = SharedFlagsModule.FFlagAuthSecExclusions
local FFlagEnableFaceIDTextOnAddAuthMethodPage = SharedFlagsModule.FFlagEnableFaceIDTextOnAddAuthMethodPage
local FFlagEnableMorePageExitButtonSupport = SharedFlagsModule.FFlagEnableMorePageExitButtonSupport
local FFlagEnableMorePageDirectionalLayoutRolloutFix = SharedFlagsModule.FFlagEnableMorePageDirectionalLayoutRolloutFix
local FFlagEnableUnifiedProductPurchaseFlow = SharedFlagsModule.FFlagEnableUnifiedProductPurchaseFlow
local FFlagAEGIS2UseGuacToShowEnabledMessage = SharedFlagsModule.FFlagAEGIS2UseGuacToShowEnabledMessage
local FFlagAEGIS2UseGuacToShowFAEUpsell = SharedFlagsModule.FFlagAEGIS2UseGuacToShowFAEUpsell
local FFlagMacMenuBarContentUpdates = SharedFlagsModule.GetFFlagMacMenuBarContentUpdates()
local LuaAppEnableRecommendedCarouselForDesktop = game:DefineFastFlag("LuaAppEnableRecommendedCarouselForDesktop", false)
local DisableWebViewSupportInStudio = game:DefineFastFlag("DisableWebViewSupportInStudio", false)
local FFlagUsesCancelSearchAppPolicy = SharedFlagsModule.FFlagUsesCancelSearchAppPolicy
local DebugUseLegacyCrossPlayApi = game:DefineFastFlag("DebugUseLegacyCrossPlayApi", false)
local DebugOverrideCrossPlaySettingsKey = game:DefineFastString("DebugOverrideCrossPlaySettingsKey", "")
local DebugOverrideCrossPlayQueryParam = game:DefineFastString("DebugOverrideCrossPlayQueryParam", "")
local DebugCrossPlaySystemUi = game:DefineFastFlag("DebugCrossPlaySystemUi", false)
local DebugOverrideCrossPlayUri = game:DefineFastString("DebugOverrideCrossPlayUri", "")
local GuacAppPolicyDisableSignupCheckbox = game:DefineFastFlag("GuacAppPolicyDisableSignupCheckbox", false)
local FlyoutDisablePremiumEntrypoint1 = game:DefineFastFlag("FlyoutDisablePremiumEntrypoint1", false)
local GuacDisableBlackbirdEntrypoints = game:DefineFastFlag("GuacDisableBlackbirdEntrypoints", false)
local FlyoutEnableGiftcardsWithRedeem = game:DefineFastFlag("FlyoutEnableGiftcardsWithRedeem", false)
local DebugForceShowIllegalContentReportingUI = game:DefineFastFlag("DebugForceShowIllegalContentReportingUI", false)
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagExpChatUseGuacForFOMOUpsell = SharedFlagsModule.FFlagExpChatUseGuacForFOMOUpsell
local FFlagExpChatUseGuacForCrossAgeChat = SharedFlagsModule.FFlagExpChatUseGuacForCrossAgeChat
local FFlagEnableAndroidTvAppPolicies = SharedFlagsModule.FFlagEnableAndroidTvAppPolicies
local FFlagSduiAppPolicyBindings = SharedFlagsModule.FFlagSduiAppPolicyBindings
local FFlagGuacStickyShortcutBarEnabled = SharedFlagsModule.FFlagGuacStickyShortcutBarEnabled
local FFlagEnableCoreContentAccountType = SharedFlagsModule.FFlagEnableCoreContentAccountType
local FFlagEnableCoreContentBadge = SharedFlagsModule.FFlagEnableCoreContentBadge
local FFlagEnableCoreContentThemeUseGuacForTokenOverrides = SharedFlagsModule.FFlagEnableCoreContentThemeUseGuacForTokenOverrides
local FFlagEnableFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableFlyoutUncheckedBadge
local FFlagEnableNonFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableNonFlyoutUncheckedBadge
local GetFFlagEnableAccountSwitcherUncheckedBadgeFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherUncheckedBadge
local FFlagAddTopBarPoliciesToUniversalPolicies = SharedFlagsModule.FFlagAddTopBarPoliciesToUniversalPolicies
local FFlagDefaultKidsToDarkTheme = SharedFlagsModule.FFlagDefaultKidsToDarkTheme
local FFlagLuaAppSupportDisablePlayableWhenLoading = SharedFlagsModule.FFlagLuaAppSupportDisablePlayableWhenLoading
local FFlagAppChatRenameGuacPolicyEnabled = SharedFlagsModule.FFlagAppChatRenameGuacPolicyEnabled
game:DefineFastFlag("BehaviorCollectionControlEnabled", false)
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false)
local GetFFlagNotificationsComplianceShouldRestrictStreamFunction = SharedFlagsModule.GetFFlagNotificationsComplianceShouldRestrictStream

return function(p1)
	-- upvalues: IsVRAppBuildFunction (copy), LuaAppEnableRecommendedCarouselForDesktop (copy), IsSubjectToDesktopPoliciesFunction (copy), FFlagAppIaScrollAwayGuac (copy), FFlagEnableLeftNavOnConsole (copy), GuiService (copy), IsRunningInStudioFunction (copy), DisableWebViewSupportInStudio (copy), GetFFlagLuafiedReportEntryPointsFunction (copy), GetFFlagEnableAbuseReport10ftFunction (copy), GetFFlagUseVoiceExitBetaLanguageFunction (copy), GetFFlagSeamlessVoiceConsentToastPolicyFunction (copy), GetFFlagExpChatGuacChatDisabledReasonFunction (copy), FFlagAEGIS2UseGuacToShowEnabledMessage (copy), FFlagAEGIS2UseGuacToShowFAEUpsell (copy), FFlagExpChatUseGuacForFOMOUpsell (copy), FFlagExpChatUseGuacForCrossAgeChat (copy), FFlagAppChatRenameGuacPolicyEnabled (copy), GetFFlagDisableCDLQrCodeForMaquettesFunction (copy), CryoModule (copy), ValuesResult (copy), DebugUseLegacyCrossPlayApi (copy), DebugCrossPlaySystemUi (copy), DebugOverrideCrossPlayUri (copy), CrossPlayCapabilitiesModule (copy), DebugOverrideCrossPlaySettingsKey (copy), DebugOverrideCrossPlayQueryParam (copy), GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction (copy), GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction (copy), FFlagGuacCanRenderTransferOnProfile (copy), GetFFlagEnableGateNotificationPreferencesTabFunction (copy), UserInputService (copy), FFlagLuaAppHomeVngAppUpsell (copy), FFlagVngAppUpsellPcLayout (copy), FFlagFriendRequestNicknames (copy), FFlagLuaAppParentUpsellPolicy (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), GetFFlagNotificationsComplianceShouldRestrictStreamFunction (copy), DebugForceShowIllegalContentReportingUI (copy), FFlagRenameParentEmailForVerificationUpsellFunction (copy), FFlagEnableAndroidTvAppPolicies (copy), GetFFlagEnableMultiPageSignupFunction (copy), GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignupFunction (copy), FFlagEnableMicrosoftStorePaymentsPlatform (copy), FFlagEnableFriendsRenamingForAll (copy), FFlagEnableMilkyWayPaymentsPlatformV2 (copy), FFlagEnableScreentimeMoreTimeOption (copy), FlyoutDisablePremiumEntrypoint1 (copy), GuacDisableBlackbirdEntrypoints (copy), FlyoutEnableGiftcardsWithRedeem (copy), GuacAppPolicyDisableSignupCheckbox (copy), FFlagEnableFaceIDTextOnAddAuthMethodPage (copy), FFlagAuthSecExclusions (copy), FFlagEnableMorePageExitButtonSupport (copy), FFlagEnableMorePageDirectionalLayoutRolloutFix (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), GetFFlagEnableSupportCenterFunction (copy), FFlagSduiAppPolicyBindings (copy), FFlagGuacStickyShortcutBarEnabled (copy), FFlagEnableCoreContentAccountType (copy), FFlagEnableCoreContentBadge (copy), FFlagEnableCoreContentThemeUseGuacForTokenOverrides (copy), FFlagEnableFlyoutUncheckedBadge (copy), FFlagEnableNonFlyoutUncheckedBadge (copy), GetFFlagEnableAccountSwitcherUncheckedBadgeFunction (copy), FFlagAddTopBarPoliciesToUniversalPolicies (copy), FFlagDefaultKidsToDarkTheme (copy), FFlagMacMenuBarContentUpdates (copy), FFlagUsesCancelSearchAppPolicy (copy)
	local function _(p2, p3)
		-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
		return if p1[p2] == nil then if IsVRAppBuildFunction() then p3 else not p3 else p1[p2]
	end
	
	return {
		getFriendFinder = function()
			-- upvalues: p1 (copy)
			return p1.FriendFinder or false
		end,
		getGameDetailsMorePage = function()
			-- upvalues: p1 (copy)
			return p1.GameDetailsMorePage or false
		end,
		getGameDetailsSubtitle = function()
			-- upvalues: p1 (copy)
			return p1.GameDetailsSubtitle or false
		end,
		getShowGlobalCounters = function()
			-- upvalues: p1 (copy)
			return p1.GameDetailsShowGlobalCounters or false
		end,
		getGameDetailsPlayWithFriends = function()
			-- upvalues: p1 (copy)
			return p1.GameDetailsPlayWithFriends or false
		end,
		getGameInfoList = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoList or false
		end,
		getGamePlaysAndRatings = function()
			-- upvalues: p1 (copy)
			return p1.GamePlaysAndRatings or false
		end,
		getNotifications = function()
			-- upvalues: p1 (copy)
			return p1.Notifications or false
		end,
		getRecommendedGames = function()
			-- upvalues: LuaAppEnableRecommendedCarouselForDesktop (upval), p1 (copy), IsSubjectToDesktopPoliciesFunction (upval)
			return if LuaAppEnableRecommendedCarouselForDesktop then p1.RecommendedGames or false else not IsSubjectToDesktopPoliciesFunction() and (p1.RecommendedGames or false)
		end,
		getSearchBar = function()
			-- upvalues: p1 (copy)
			return p1.SearchBar or false
		end,
		getMorePageContent = function()
			-- upvalues: p1 (copy)
			return p1.MorePageContent
		end,
		getAboutPageType = function()
			-- upvalues: p1 (copy)
			return p1.AboutPageType or "CJVAbout"
		end,
		getSettingsPageType = function()
			-- upvalues: p1 (copy)
			return p1.SettingsPageType or "Settings"
		end,
		getSocialLinks = function()
			-- upvalues: p1 (copy)
			return p1.SocialLinks or false
		end,
		getSocialGroupLinks = function()
			-- upvalues: p1 (copy)
			return p1.SocialGroupLinks or false
		end,
		getCommunityLinksEnabled = function()
			-- upvalues: p1 (copy)
			return p1.CommunityLinksEnabled or false
		end,
		getGameInfoShowBadges = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowBadges or false
		end,
		getGameInfoShowCreated = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowCreated or false
		end,
		getGameInfoShowGamepasses = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowGamepasses or false
		end,
		getGameInfoShowGenre = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowGenre or false
		end,
		getGameInfoShowSubgenre = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowSubgenre or false
		end,
		getGameInfoShowMaxPlayers = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowMaxPlayers or false
		end,
		getGameInfoShowServers = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowServers or false
		end,
		getGameInfoShowUpdated = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowUpdated or false
		end,
		getGameInfoShowAgeRecommendation = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowAgeRecommendation == nil or p1.GameInfoShowAgeRecommendation
		end,
		getGameInfoShowVoiceAndChatFeatures = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoShowVoiceAndChatFeatures == nil or p1.GameInfoShowVoiceAndChatFeatures
		end,
		getSiteMessageBanner = function()
			-- upvalues: p1 (copy)
			return p1.SiteMessageBanner or false
		end,
		getAlertRateLimit = function()
			-- upvalues: p1 (copy)
			return p1.AlertRateLimit or 300
		end,
		getSearchAutoComplete = function()
			-- upvalues: p1 (copy)
			return p1.SearchAutoComplete or false
		end,
		getShowStudioCTA = function()
			-- upvalues: p1 (copy)
			return p1.ShowStudioCTA or false
		end,
		getAppIaScrollAwayEnabled = if FFlagAppIaScrollAwayGuac then function()
			-- upvalues: p1 (copy)
			return p1.AppIaScrollAwayEnabled or false
		end else nil,
		getUseOmniRecommendation = function()
			-- upvalues: p1 (copy)
			return p1.UseOmniRecommendation == nil or p1.UseOmniRecommendation
		end,
		getUseWidthBasedFormFactorRule = function()
			-- upvalues: p1 (copy)
			return p1.UseWidthBasedFormFactorRule or false
		end,
		getShowYouTubeAgeAlert = function()
			-- upvalues: p1 (copy)
			return p1.ShowYouTubeAgeAlert == nil or p1.ShowYouTubeAgeAlert
		end,
		getShowVideoThumbnails = function()
			-- upvalues: p1 (copy)
			return p1.ShowVideoThumbnails or false
		end,
		getHomeIcon = function()
			-- upvalues: p1 (copy)
			return p1.HomeIcon or "LuaApp/icons/ic-roblox-close"
		end,
		getGameInfoListShowRNVDeveloper = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoListShowRNVDeveloper or false
		end,
		getGameInfoListDeveloper = function()
			-- upvalues: p1 (copy)
			return p1.GameInfoListDeveloper or false
		end,
		getShowDisplayName = function()
			-- upvalues: p1 (copy)
			return p1.ShowDisplayName == nil or p1.ShowDisplayName
		end,
		getShowAlias = function()
			-- upvalues: p1 (copy)
			return p1.ShowUserAlias == nil or p1.ShowUserAlias
		end,
		getCatalogReportingDisabled = function()
			-- upvalues: p1 (copy)
			return p1.CatalogReportingDisabled or false
		end,
		getGameReportingDisabled = function()
			-- upvalues: p1 (copy)
			return p1.GameReportingDisabled or false
		end,
		getGamesPageCreationCenterTitle = function()
			-- upvalues: p1 (copy)
			return p1.GamesPageCreationCenterTitle or false
		end,
		shouldUseExternalBrowserForDisclaimerLinks = function()
			-- upvalues: p1 (copy)
			return p1.UseExternalBrowserForDisclaimerLinks or false
		end,
		shouldUseExternalBrowserForMorePageItem = function()
			-- upvalues: p1 (copy)
			return p1.UseExternalBrowserForMoreLinks or false
		end,
		getCatalogShow3dView = function()
			-- upvalues: p1 (copy)
			return p1.CatalogShow3dView or false
		end,
		getItemDetailsFullView = function()
			-- upvalues: p1 (copy)
			return p1.ItemDetailsFullView or false
		end,
		getCatalogCommunityCreations = function()
			-- upvalues: p1 (copy)
			return p1.CatalogCommunityCreations or false
		end,
		getCatalogPremiumCategory = function()
			-- upvalues: p1 (copy)
			return p1.CatalogPremiumCategory or false
		end,
		getShowCatalogPremiumContent = function()
			-- upvalues: p1 (copy)
			return p1.CatalogPremiumContent or false
		end,
		getRobloxCreatedItemsCreatedByLuobu = function()
			-- upvalues: p1 (copy)
			return p1.RobloxCreatedItemsCreatedByLuobu == nil or p1.RobloxCreatedItemsCreatedByLuobu
		end,
		getHomePageFriendSection = function()
			-- upvalues: p1 (copy)
			return p1.HomePageFriendSection or false
		end,
		getHomePageProfileLink = function()
			-- upvalues: p1 (copy)
			return p1.HomePageProfileLink or false
		end,
		getPurchasePromptIncludingWarning = function()
			-- upvalues: p1 (copy)
			return p1.PurchasePromptIncludingWarning == nil or p1.PurchasePromptIncludingWarning
		end,
		getCheckUserAgreementsUpdatedOnLogin = function()
			-- upvalues: p1 (copy)
			return p1.CheckUserAgreementsUpdatedOnLogin == nil or p1.CheckUserAgreementsUpdatedOnLogin
		end,
		getAddUserAgreementIdsToSignupRequest = function()
			-- upvalues: p1 (copy)
			return p1.AddUserAgreementIdsToSignupRequest or false
		end,
		RequireExplicitVoiceConsent = function()
			-- upvalues: p1 (copy)
			return p1.RequireExplicitVoiceConsent or false
		end,
		getRequireExplicitAvatarVideoConsent = function()
			-- upvalues: p1 (copy)
			return p1.RequireExplicitAvatarVideoConsent or false
		end,
		getShowVoiceUpsellV2 = function()
			-- upvalues: p1 (copy)
			return p1.ShowVoiceUpsellV2 or false
		end,
		getShouldShowGroupsTile = function()
			-- upvalues: p1 (copy)
			return p1.ShouldShowGroupsTile or false
		end,
		useLuobuAuthentication = function()
			-- upvalues: p1 (copy)
			return p1.UseLuobuAuthentication or false
		end,
		useWechatQQAuthentication = function()
			-- upvalues: p1 (copy)
			return p1.UseWechatQQAuthentication or false
		end,
		useMSDKWebAuthentication = function()
			-- upvalues: p1 (copy)
			return p1.UseMSDKWebAuthentication or false
		end,
		getQrFriendingEnabled = function()
			-- upvalues: p1 (copy)
			return p1.QrFriendingEnabled or false
		end,
		getShouldShowCameraPermissionInAgreementsPrompt = function()
			-- upvalues: p1 (copy)
			return p1.ShouldShowCameraPermissionInAgreementsPrompt or false
		end,
		getExperienceInviteShareLinkEnabled = function()
			-- upvalues: p1 (copy)
			return p1.ExperienceInviteShareLinkEnabled or false
		end,
		getCsatSurveyRestrictTextInput = function()
			-- upvalues: p1 (copy)
			return p1.CsatSurveyRestrictTextInput or false
		end,
		useGridPageLayout = function()
			-- upvalues: IsVRAppBuildFunction (upval), p1 (copy), IsSubjectToDesktopPoliciesFunction (upval)
			return if IsVRAppBuildFunction() then if p1.UseGridPageLayout == nil then if IsVRAppBuildFunction() then true else false else p1.UseGridPageLayout elseif p1.UseGridPageLayout == nil then IsSubjectToDesktopPoliciesFunction() else p1.UseGridPageLayout
		end,
		usePhoneSearchDiscoverEntry = function()
			-- upvalues: p1 (copy), IsSubjectToDesktopPoliciesFunction (upval)
			return if p1.UsePhoneSearchDiscoverEntry == nil then not IsSubjectToDesktopPoliciesFunction() else p1.UsePhoneSearchDiscoverEntry
		end,
		getShouldSystemBarUsuallyBePresent = function()
			-- upvalues: IsVRAppBuildFunction (upval), p1 (copy), FFlagEnableLeftNavOnConsole (upval), GuiService (upval)
			return if IsVRAppBuildFunction() then if p1.ShouldSystemBarUsuallyBePresentForVR == nil then if IsVRAppBuildFunction() then true else false else p1.ShouldSystemBarUsuallyBePresentForVR elseif FFlagEnableLeftNavOnConsole and GuiService:IsTenFootInterface() then true else p1.ShouldSystemBarUsuallyBePresent or false
		end,
		getContactImporterEnabled = function()
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
			return not IsSubjectToDesktopPoliciesFunction() and (p1.ContactImporterEnabled or false)
		end,
		getShouldShowSettingsPermissionsAdditionalInstructions = function()
			-- upvalues: p1 (copy)
			return p1.shouldShowSettingsPermissionsAdditionalInstructions or false
		end,
		getUseVRFTUXPanel = function()
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.UseVRFTUXPanel == nil then if IsVRAppBuildFunction() then true else false else p1.UseVRFTUXPanel
		end,
		getWebViewSupport = function()
			-- upvalues: IsRunningInStudioFunction (upval), DisableWebViewSupportInStudio (upval), p1 (copy), IsVRAppBuildFunction (upval)
			return if IsRunningInStudioFunction() then not DisableWebViewSupportInStudio elseif p1.EnableWebViewSupport == nil then not IsVRAppBuildFunction() else p1.EnableWebViewSupport
		end,
		getUseLuafiedReportFlow = function()
			-- upvalues: IsVRAppBuildFunction (upval), GetFFlagLuafiedReportEntryPointsFunction (upval), p1 (copy), GetFFlagEnableAbuseReport10ftFunction (upval)
			return if IsVRAppBuildFunction() and GetFFlagLuafiedReportEntryPointsFunction() then if p1.UseLuafiedReportFlow == nil then if IsVRAppBuildFunction() then true else false else p1.UseLuafiedReportFlow elseif GetFFlagEnableAbuseReport10ftFunction() then p1.UseLuafiedReportFlow or false else nil
		end,
		getThrottleFramerate = function()
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.ThrottleFramerate == nil then not IsVRAppBuildFunction() else p1.ThrottleFramerate
		end,
		getUseRoundedCorners = function()
			-- upvalues: IsVRAppBuildFunction (upval), p1 (copy)
			return if IsVRAppBuildFunction() then if p1.UseRoundedCorners == nil then if IsVRAppBuildFunction() then true else false else p1.UseRoundedCorners else false
		end,
		getGameInfoShowChatFeatures = function()
			-- upvalues: GetFFlagUseVoiceExitBetaLanguageFunction (upval), p1 (copy)
			return GetFFlagUseVoiceExitBetaLanguageFunction() and p1.GameInfoShowChatFeatures or false
		end,
		getDisplayCheckboxInVoiceConsent = function()
			-- upvalues: GetFFlagSeamlessVoiceConsentToastPolicyFunction (upval), p1 (copy)
			return GetFFlagSeamlessVoiceConsentToastPolicyFunction() and p1.DisplayCheckboxInVoiceConsent or false
		end,
		getExperienceChatAvailability = function()
			-- upvalues: GetFFlagExpChatGuacChatDisabledReasonFunction (upval), p1 (copy)
			return GetFFlagExpChatGuacChatDisabledReasonFunction() and p1.ExperienceChatAvailability or "unknown"
		end,
		getInCommsRegionBubble = function()
			-- upvalues: FFlagAEGIS2UseGuacToShowEnabledMessage (upval), p1 (copy)
			return FFlagAEGIS2UseGuacToShowEnabledMessage and p1.InCommsRegionBubble or false
		end,
		getShowInExpFAEUpsell = function()
			-- upvalues: FFlagAEGIS2UseGuacToShowFAEUpsell (upval), p1 (copy)
			return FFlagAEGIS2UseGuacToShowFAEUpsell and p1.ShowInExpFAEUpsell or false
		end,
		getShowFOMOUpsell = function()
			-- upvalues: FFlagExpChatUseGuacForFOMOUpsell (upval), p1 (copy)
			return FFlagExpChatUseGuacForFOMOUpsell and p1.ShowFOMOUpsell or false
		end,
		getShowCrossAgeChat = function()
			-- upvalues: FFlagExpChatUseGuacForCrossAgeChat (upval), p1 (copy)
			return FFlagExpChatUseGuacForCrossAgeChat and p1.ShowCrossAgeExpChat or false
		end,
		getCanSeeChatTerminology = function()
			-- upvalues: FFlagAppChatRenameGuacPolicyEnabled (upval), p1 (copy)
			return FFlagAppChatRenameGuacPolicyEnabled and p1.canSeeChatTerminology or false
		end,
		getAllowCameraMovements = function()
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.AllowCameraMovements == nil then not IsVRAppBuildFunction() else p1.AllowCameraMovements
		end,
		getShouldSkipAvatarLandingPage = function()
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.ShouldSkipAvatarLandingPage == nil then if IsVRAppBuildFunction() then true else false else p1.ShouldSkipAvatarLandingPage
		end,
		getShowPassesOnExperienceDetails = function()
			-- upvalues: p1 (copy)
			return p1.ShowPassesOnExperienceDetails or false
		end,
		getDisableCDLQrCodeForMaquettes = function()
			-- upvalues: GetFFlagDisableCDLQrCodeForMaquettesFunction (upval), p1 (copy)
			return if GetFFlagDisableCDLQrCodeForMaquettesFunction() then p1.DisableCDLQrCodeForMaquettes else false
		end,
		getDisableIAPEntryPoint = function()
			-- upvalues: p1 (copy)
			return p1.DisableIAPEntryPoint or false
		end,
		getEnforceAgeRestrictedLogin = function()
			-- upvalues: p1 (copy)
			return p1.EnforceAgeRestrictedLogin or false
		end,
		getUrlAuthRoutes = function()
			-- upvalues: p1 (copy)
			local Routes = p1.Routes or {}
			
			return if Routes then Routes.auth or {} else {}
		end,
		getShowDisconnectButton = function()
			-- upvalues: p1 (copy)
			return p1.ShowDisconnectButton or false
		end,
		getUseSingleSignOn = function()
			-- upvalues: IsRunningInStudioFunction (upval), p1 (copy)
			return not IsRunningInStudioFunction() and (p1.UseSingleSignOn or false)
		end,
		getGridCarouselSeeAllTilesEnabled = function()
			-- upvalues: p1 (copy)
			return p1.UseGridCarouselSeeAllTiles or false
		end,
		getSearchWithoutNavigatingEnabled = function()
			-- upvalues: FFlagEnableLeftNavOnConsole (upval), GuiService (upval), p1 (copy)
			return (not FFlagEnableLeftNavOnConsole or not GuiService:IsTenFootInterface()) and (p1.SingleSearchPageNoNavigation or false)
		end,
		getGameListCategoryScrollListEnabled = function()
			-- upvalues: p1 (copy)
			return p1.GetGamesListCategoryTabs or false
		end,
		getForceTheme = function()
			-- upvalues: CryoModule (upval), ValuesResult (upval), p1 (copy)
			local MapResult = CryoModule.List.map(ValuesResult, function(Text: string): string
				return Text:lower()
			end)
			
			return if p1.ForceTheme and CryoModule.List.find(MapResult, p1.ForceTheme:lower()) then p1.ForceTheme else nil
		end,
		enableExperienceDetailsPanel = function()
			-- upvalues: p1 (copy)
			return p1.EnableExperienceDetailsPanel or false
		end,
		getDisableRegularLogin = function(): boolean
			-- upvalues: p1 (copy)
			return not p1.EnableWebViewSupport and (not p1.EnableRegularLoginWithoutWebViewSupport or false)
		end,
		getAllowPlatformAccountSwitching = function()
			-- upvalues: p1 (copy)
			return p1.AllowPlatformAccountSwitching or false
		end,
		useLegacyCrossPlayApi = function()
			-- upvalues: DebugUseLegacyCrossPlayApi (upval), p1 (copy)
			return DebugUseLegacyCrossPlayApi or (p1.useLegacyCrossPlayApi or false)
		end,
		useCrossPlaySystemUi = function()
			-- upvalues: DebugCrossPlaySystemUi (upval), p1 (copy)
			return DebugCrossPlaySystemUi or (p1.useCrossPlaySystemUi or false)
		end,
		getCrossPlayUri = function()
			-- upvalues: DebugOverrideCrossPlayUri (upval), p1 (copy)
			return if DebugOverrideCrossPlayUri == "" then p1.crossPlayUri or "" else DebugOverrideCrossPlayUri
		end,
		getCrossPlayCapabilities = function()
			-- upvalues: CryoModule (upval), p1 (copy), CrossPlayCapabilitiesModule (upval)
			return CryoModule.List.foldLeft(p1.crossPlayCapabilities or {}, function(p2, p3)
				-- upvalues: CryoModule (upval), CrossPlayCapabilitiesModule (upval)
				return if CryoModule.List.find(p2, p3) then p2 else CryoModule.List.join(p2, { CrossPlayCapabilitiesModule[p3] })
			end, {})
		end,
		getCrossPlaySettingsKey = function()
			-- upvalues: DebugOverrideCrossPlaySettingsKey (upval), p1 (copy)
			return if DebugOverrideCrossPlaySettingsKey == "" then p1.crossPlaySettingsKey or "" else DebugOverrideCrossPlaySettingsKey
		end,
		getCrossPlayQueryParam = function()
			-- upvalues: DebugOverrideCrossPlayQueryParam (upval), p1 (copy)
			return if DebugOverrideCrossPlayQueryParam == "" then p1.crossPlayQueryParam or "" else DebugOverrideCrossPlayQueryParam
		end,
		getPromotionalEmailsCheckboxEnabled = function()
			-- upvalues: p1 (copy)
			return game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") and p1.PromotionalEmailsCheckboxEnabled or false
		end,
		getPromotionalEmailsOptInByDefault = function()
			-- upvalues: p1 (copy)
			return game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") and p1.PromotionalEmailsOptInByDefault or false
		end,
		getSupportsOverscan = function()
			-- upvalues: p1 (copy)
			return p1.SupportsOverscan or false
		end,
		getPlatformDisplayName = function()
			-- upvalues: p1 (copy)
			return p1.platformDisplayName or ""
		end,
		getPlatformAccountName = function()
			-- upvalues: p1 (copy)
			return p1.platformAccountName or nil
		end,
		getSupportsProfileSwitching = function()
			-- upvalues: p1 (copy)
			return p1.supportsProfileSwitching or false
		end,
		getMountAllOmniFeedItems = function()
			-- upvalues: p1 (copy)
			return p1.mountAllOmniFeedItems or false
		end,
		getFriendCodeQrCodeScannerEnabled = function()
			-- upvalues: p1 (copy)
			return p1.FriendCodeQrCodeScannerEnabled or false
		end,
		getInviteFriendsDisabled = function()
			-- upvalues: p1 (copy)
			return p1.InviteFriendsDisabled or false
		end,
		getRealNamesInDisplayNamesEnabled = function()
			-- upvalues: p1 (copy)
			return p1.RealNamesInDisplayNamesEnabled or false
		end,
		getProfileShareLinkEnabled = function()
			-- upvalues: p1 (copy)
			return p1.ProfileShareLinkEnabled
		end,
		getProfileCopyLinkEnabled = function()
			-- upvalues: p1 (copy)
			return p1.ProfileCopyLinkEnabled
		end,
		getEnablePremiumUserFeatures = function()
			-- upvalues: GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction (upval), p1 (copy)
			return if GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction() then p1.EnablePremiumUserFeatures or false else nil
		end,
		getEnableDualLogin = function()
			-- upvalues: p1 (copy)
			return p1.enableDualLogin or false
		end,
		getUseExternalBrowserForAgeGuidelines = function()
			-- upvalues: GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction (upval), p1 (copy)
			return if GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction() then p1.UseExternalBrowserForAgeGuidelines or false else nil
		end,
		getEnableHomePageAgeBlock = function()
			-- upvalues: p1 (copy)
			return p1.EnableHomePageAgeBlock or false
		end,
		getEnableUAppAccessBlock = function()
			-- upvalues: p1 (copy)
			return p1.EnableUAppAccessBlock or false
		end,
		getUAppBlockPageTextMapKey = function()
			-- upvalues: p1 (copy)
			return p1.UAppBlockPageTextMapKey or nil
		end,
		getUAppBlockPageShouldDisableLogOut = function()
			-- upvalues: p1 (copy)
			return p1.UAppBlockPageShouldDisableLogOut or nil
		end,
		getContactsToastEnabled = function()
			-- upvalues: p1 (copy)
			return p1.ContactsToastEnabled or false
		end,
		getEnableProfileQrCode = function()
			-- upvalues: p1 (copy)
			return p1.EnableProfileQrCode or false
		end,
		getCanRenderTransferOnProfile = function()
			-- upvalues: FFlagGuacCanRenderTransferOnProfile (upval), p1 (copy)
			return FFlagGuacCanRenderTransferOnProfile and p1.CanRenderTransferOnProfile or false
		end,
		getShowVNGLoginWithExistingAccountQuickLoginButton = function()
			-- upvalues: p1 (copy)
			return p1.ShowVNGLoginWithExistingAccountQuickLoginButton or false
		end,
		getShowVNGAge12Badge = function()
			-- upvalues: p1 (copy)
			return p1.ShowVNGAge12Badge or false
		end,
		getShowBrazilContentRatingLogo = function()
			-- upvalues: p1 (copy)
			return p1.ShowBrazilContentRatingLogo or false
		end,
		getUseVNGUserAgreementPopup = function()
			-- upvalues: p1 (copy)
			return p1.UseVNGUserAgreementPopup or false
		end,
		getRedirectBuyRobuxToVNG = function()
			-- upvalues: p1 (copy)
			return p1.RedirectBuyRobuxToVNG or false
		end,
		getShowVNGTosForRobuxUpsell = function()
			-- upvalues: p1 (copy)
			return p1.ShowVNGTosForRobuxUpsell or false
		end,
		getBlockVNGU12SignUpOnClientSide = function()
			-- upvalues: p1 (copy)
			return p1.BlockVNGU12SignUpOnClientSide or false
		end,
		getUseAgeInput = function()
			-- upvalues: p1 (copy)
			return p1.UseAgeInput or false
		end,
		getLoginUsernameOnly = function()
			-- upvalues: p1 (copy)
			return p1.LoginUsernameOnly or false
		end,
		getDisableEmailOTPLogin = function()
			-- upvalues: p1 (copy)
			return p1.DisableEmailOTPLogin or false
		end,
		getDisableLoginForgotButton = function()
			-- upvalues: p1 (copy)
			return p1.DisableLoginForgotButton or false
		end,
		getDisableLogOutEmailUpsell = function()
			-- upvalues: p1 (copy)
			return p1.DisableLogOutEmailUpsell or false
		end,
		getVerifiedSignupCountry = function()
			-- upvalues: p1 (copy)
			return p1.verifiedSignupCountry or false
		end,
		getParentalConsentAgreementId = function()
			-- upvalues: p1 (copy)
			return p1.parentalConsentAgreementId or ""
		end,
		getIsStrictComplianceEnabled = function()
			-- upvalues: p1 (copy)
			return p1.isStrictComplianceEnabled or false
		end,
		getUseKoreaKISAUserAgreementPopup = function()
			-- upvalues: p1 (copy)
			return p1.useKoreaKISAUserAgreementPopup or false
		end,
		getEnableNotificationPreferencesPage = function()
			-- upvalues: GetFFlagEnableGateNotificationPreferencesTabFunction (upval), p1 (copy)
			return if GetFFlagEnableGateNotificationPreferencesTabFunction() then p1.EnableNotificationPreferencesPage or false else nil
		end,
		getVNGFormRequired = function()
			-- upvalues: p1 (copy)
			return p1.VNGFormRequired or false
		end,
		getUpsellVoiceForPhoneVerification = function()
			-- upvalues: p1 (copy)
			return p1.UpsellVoiceForPhoneVerification or false
		end,
		getIsLinkedVRModeAvailable = function(): boolean
			-- upvalues: UserInputService (upval)
			local Platform = UserInputService:GetPlatform()
			
			return Platform == Enum.Platform.Windows or Platform == Enum.Platform.UWP
		end,
		getShouldShowPhoneUpsell = function()
			-- upvalues: p1 (copy)
			return p1.ShouldShowPhoneUpsell or false
		end,
		getTermsOfUseLink = function()
			-- upvalues: p1 (copy)
			return p1.TermsOfUseLink or ""
		end,
		getPrivacyPolicyLink = function()
			-- upvalues: p1 (copy)
			return p1.PrivacyPolicyLink or ""
		end,
		getVngAppUpsell = function()
			-- upvalues: FFlagLuaAppHomeVngAppUpsell (upval), p1 (copy)
			return FFlagLuaAppHomeVngAppUpsell and p1.VngAppUpsell or false
		end,
		getVngAppUpsellPcLayout = if FFlagVngAppUpsellPcLayout then function()
			-- upvalues: p1 (copy)
			return p1.VngAppUpsellPcLayout or false
		end else nil,
		getShouldHideContactImporterUpsell = function()
			-- upvalues: p1 (copy)
			return p1.ShouldHideContactImporterUpsell or false
		end,
		getContactImporterEncouraged = function()
			-- upvalues: p1 (copy)
			return p1.contactImporterEncouraged or false
		end,
		getFriendRequestNicknamesEnabled = function()
			-- upvalues: FFlagFriendRequestNicknames (upval), p1 (copy)
			return FFlagFriendRequestNicknames and p1.FriendRequestNicknamesEnabled or false
		end,
		getShouldShowVpcPlayButtonUpsells = if FFlagLuaAppParentUpsellPolicy then function()
			-- upvalues: p1 (copy)
			return p1.shouldShowVpcPlayButtonUpsells or false
		end else nil,
		getDisablePlayableWhenLoading = if FFlagLuaAppSupportDisablePlayableWhenLoading then function()
			-- upvalues: p1 (copy)
			return p1.DisablePlayableWhenLoading or false
		end else nil,
		getRenamePaymentsToSpendingTab = function()
			-- upvalues: p1 (copy)
			return p1.renamePaymentsToSpendingTab or false
		end,
		getNotificationsCanReceiveStream = function()
			-- upvalues: GetFFlagNotificationsComplianceShouldRestrictStreamFunction (upval), p1 (copy)
			return if GetFFlagNotificationsComplianceShouldRestrictStreamFunction() then p1.notificationsCanAccessStream or false else nil
		end,
		getNotificationsCanReceivePush = function()
			-- upvalues: p1 (copy)
			return p1.notificationsCanAccessPush or false
		end,
		getPushNotificationsUpsell = function()
			-- upvalues: p1 (copy)
			return p1.ShouldShowPushNotificationsUpsell or false
		end,
		getNotificationsCanReceiveExperience = function()
			-- upvalues: p1 (copy)
			return p1.notificationsCanAccessExperience == nil or p1.notificationsCanAccessExperience
		end,
		getDisableResellingCollectiblesForCompliance = function()
			-- upvalues: p1 (copy)
			return p1.DisableResellingCollectiblesForCompliance or false
		end,
		getShowIllegalContentReportingUI = function()
			-- upvalues: DebugForceShowIllegalContentReportingUI (upval), p1 (copy)
			return DebugForceShowIllegalContentReportingUI or (p1.ShowIllegalContentReportingUI or false)
		end,
		getEligibleForContentPostFeed = function()
			-- upvalues: p1 (copy)
			return p1.EligibleForContentPostFeed or false
		end,
		getEligibleForExternalContentSharing = function()
			-- upvalues: p1 (copy)
			return p1.EligibleForExternalContentSharing or false
		end,
		getEnableContinuousLoad = function()
			-- upvalues: p1 (copy)
			return p1.EnableContinuousLoad or false
		end,
		getEnableAggregateLikesFavoritesCount = function()
			-- upvalues: p1 (copy)
			return p1.EnableAggregateLikesFavoritesCount or false
		end,
		getShowUpdatedCameraPath = function()
			-- upvalues: p1 (copy)
			return p1.showUpdatedCameraPath or false
		end,
		getRenameParentEmailForVerificationUpsell = function()
			-- upvalues: FFlagRenameParentEmailForVerificationUpsellFunction (upval), p1 (copy)
			return FFlagRenameParentEmailForVerificationUpsellFunction() and p1.renameParentEmailForVerificationUpsell or false
		end,
		getKeystrokeCollectionEnabled = function()
			-- upvalues: p1 (copy)
			return game:GetFastFlag("BehaviorCollectionControlEnabled") and p1.EnableKeystrokeCollection or false
		end,
		getCanUsePlatformChat = function()
			-- upvalues: p1 (copy)
			return p1.CanUsePlatformChat or false
		end,
		getCanSeeChatTab = function()
			-- upvalues: p1 (copy)
			return p1.CanSeeChatTab or false
		end,
		getHidesGamesTab = function()
			-- upvalues: FFlagEnableAndroidTvAppPolicies (upval), p1 (copy)
			return FFlagEnableAndroidTvAppPolicies and p1.HidesGamesTab or false
		end,
		getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function()
			-- upvalues: GetFFlagEnableMultiPageSignupFunction (upval), p1 (copy)
			return not GetFFlagEnableMultiPageSignupFunction() or (p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil or p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup)
		end,
		getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function()
			-- upvalues: GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignupFunction (upval), GetFFlagEnableMultiPageSignupFunction (upval), p1 (copy)
			local FIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup = GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignupFunction()
			
			return if GetFFlagEnableMultiPageSignupFunction() then if p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then FIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup else p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages else FIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup
		end,
		getRobuxUpsellFlowMobile = function()
			-- upvalues: p1 (copy)
			return p1.useMobileRobuxUpsellFlow or false
		end,
		getUsePaymentPlatformMicrosoftStore = function()
			-- upvalues: FFlagEnableMicrosoftStorePaymentsPlatform (upval), p1 (copy)
			return FFlagEnableMicrosoftStorePaymentsPlatform and p1.usePaymentPlatformMicrosoftStore or false
		end,
		getMicSettingsDirectionsLocaleKey = function()
			-- upvalues: p1 (copy)
			return p1.micSettingsDirectionsLocaleKey or nil
		end,
		getMicSettingsDeeplinkDirectionsLocaleKey = function()
			-- upvalues: p1 (copy)
			return p1.micSettingsDeeplinkDirectionsLocaleKey or nil
		end,
		getRequiresAppRestartOnMicAccessChange = function()
			-- upvalues: p1 (copy)
			return p1.requiresAppRestartOnMicAccessChange or false
		end,
		getRenameFriendsToConnections = function()
			-- upvalues: FFlagEnableFriendsRenamingForAll (upval), p1 (copy)
			return if FFlagEnableFriendsRenamingForAll then true else p1.renameFriendsToConnections or false
		end,
		getShareSheetEnabled = function()
			-- upvalues: p1 (copy)
			return p1.shareSheetEnabled or false
		end,
		getCanAccessTrustedContacts = function()
			-- upvalues: p1 (copy)
			return p1.canAccessTrustedContacts or false
		end,
		getExperienceDetailsNoticeType = function()
			-- upvalues: p1 (copy)
			return p1.experienceDetailsNoticeType or nil
		end,
		getRequiresOSAFriendingEducation = function()
			-- upvalues: p1 (copy)
			return p1.requiresOSAFriendingEducation or false
		end,
		getSocialGraphSyncEnabled = function()
			-- upvalues: p1 (copy)
			return p1.SocialGraphSyncEnabled or false
		end,
		getAccountDisambiguationDisabled = function()
			-- upvalues: p1 (copy)
			return p1.AccountDisambiguationDisabled or false
		end,
		getHasWebViewSupportForFAE = function()
			-- upvalues: p1 (copy)
			return p1.hasWebViewSupportForFAE or false
		end,
		getLinkedAuthEndpointsEnabled = function()
			-- upvalues: p1 (copy)
			return p1.LinkedAuthEndpointsEnabled or false
		end,
		getLinkingPlatform = function()
			-- upvalues: p1 (copy)
			return p1.LinkingPlatform or nil
		end,
		getUsePaymentPlatformMilkyWayStore = function()
			-- upvalues: FFlagEnableMilkyWayPaymentsPlatformV2 (upval), p1 (copy)
			return FFlagEnableMilkyWayPaymentsPlatformV2 and p1.usePaymentPlatformMilkyWayStore or false
		end,
		getScreentimeMoreTimeOptionEnabled = function()
			-- upvalues: FFlagEnableScreentimeMoreTimeOption (upval), p1 (copy)
			return FFlagEnableScreentimeMoreTimeOption and p1.ScreentimeMoreTimeOptionEnabled or false
		end,
		getDisablePremiumEntrypoint = function()
			-- upvalues: FlyoutDisablePremiumEntrypoint1 (upval), p1 (copy)
			return FlyoutDisablePremiumEntrypoint1 and (p1.DisablePremiumEntrypoint or p1.DisablePremiumEntryPoint) or false
		end,
		getDisableBlackbirdEntrypoints = function()
			-- upvalues: GuacDisableBlackbirdEntrypoints (upval), p1 (copy)
			return GuacDisableBlackbirdEntrypoints and p1.DisableBlackbirdEntrypoints or false
		end,
		getEnableGiftcardsWithRedeem = function()
			-- upvalues: FlyoutEnableGiftcardsWithRedeem (upval), p1 (copy)
			return FlyoutEnableGiftcardsWithRedeem and p1.EnableGiftcardsWithRedeem or false
		end,
		getGiftCardSourceRefOverride = function()
			-- upvalues: p1 (copy)
			return p1.GiftCardSourceRefOverride or ""
		end,
		getSignupCheckboxDisabled = function()
			-- upvalues: GuacAppPolicyDisableSignupCheckbox (upval), p1 (copy)
			return GuacAppPolicyDisableSignupCheckbox and p1.DisableSignupCheckbox or false
		end,
		getShouldShowFaceIDText = function()
			-- upvalues: FFlagEnableFaceIDTextOnAddAuthMethodPage (upval), p1 (copy)
			return FFlagEnableFaceIDTextOnAddAuthMethodPage and p1.ShouldShowFaceIDText or false
		end,
		getExcludeCrossDeviceSignIn = function()
			-- upvalues: FFlagAuthSecExclusions (upval), p1 (copy)
			return FFlagAuthSecExclusions and p1.ExcludeCrossDeviceSignIn or false
		end,
		getExcludePasskeyLogin = function()
			-- upvalues: FFlagAuthSecExclusions (upval), p1 (copy)
			return FFlagAuthSecExclusions and p1.ExcludePasskeyLogin or false
		end,
		getExcludeUsernamePasswordSignIn = function()
			-- upvalues: FFlagAuthSecExclusions (upval), p1 (copy)
			return FFlagAuthSecExclusions and p1.ExcludeUsernamePasswordSignIn or false
		end,
		getExcludeEmailPasswordSignIn = function()
			-- upvalues: FFlagAuthSecExclusions (upval), p1 (copy)
			return FFlagAuthSecExclusions and p1.ExcludeEmailPasswordSignIn or false
		end,
		getExcludePhoneNumberPasswordSignIn = function()
			-- upvalues: FFlagAuthSecExclusions (upval), p1 (copy)
			return FFlagAuthSecExclusions and p1.ExcludePhoneNumberPasswordSignIn or false
		end,
		getExcludeAccountSwitcher = function()
			-- upvalues: FFlagAuthSecExclusions (upval), p1 (copy)
			return FFlagAuthSecExclusions and p1.ExcludeAccountSwitcher or false
		end,
		getAccountSwitcherEnabled = function()
			-- upvalues: p1 (copy)
			return p1.AccountSwitcherEnabled or false
		end,
		getExcludeUsernameUpdateModeration = function()
			-- upvalues: FFlagAuthSecExclusions (upval), p1 (copy)
			return FFlagAuthSecExclusions and p1.ExcludeUsernameUpdateModeration or false
		end,
		getMorePageExitButtonEnabled = if FFlagEnableMorePageExitButtonSupport then function()
			-- upvalues: p1 (copy)
			return p1.MorePageExitButtonEnabled or false
		end else nil,
		getMoreGridDirectionalLayoutPreferred = if FFlagEnableMorePageDirectionalLayoutRolloutFix then function()
			-- upvalues: p1 (copy)
			return p1.MoreGridDirectionalLayoutPreferred or false
		end else nil,
		getShouldUseDMCCALegalDisclosureInApp = function()
			-- upvalues: FFlagEnableUnifiedProductPurchaseFlow (upval), p1 (copy)
			return FFlagEnableUnifiedProductPurchaseFlow and p1.ShouldUseDMCCALegalDisclosureInApp or false
		end,
		getCanAccessParty = function()
			-- upvalues: p1 (copy)
			return p1.CanAccessParty == nil or p1.CanAccessParty
		end,
		getRedeemTileEnabled = function()
			-- upvalues: p1 (copy)
			return p1.RedeemTileEnabled or false
		end,
		getDisplayMomentsMoreTabTile = function()
			-- upvalues: p1 (copy)
			return p1.DisplayMomentsMoreTabTile or false
		end,
		getSupportCenterEnabled = if GetFFlagEnableSupportCenterFunction() then function()
			-- upvalues: p1 (copy)
			return p1.SupportCenterEnabled or false
		end else nil,
		getShouldUseVibrationInsteadOfHaptics = function()
			-- upvalues: p1 (copy)
			return p1.ShouldUseVibrationInsteadOfHaptics or false
		end,
		getRawPolicy = if FFlagSduiAppPolicyBindings then function()
			-- upvalues: p1 (copy)
			return p1
		end else nil,
		getStickyShortcutBarEnabled = if FFlagGuacStickyShortcutBarEnabled then function()
			-- upvalues: p1 (copy)
			return p1.StickyShortcutBarEnabled or false
		end else nil,
		getAccountType = if FFlagEnableCoreContentAccountType then function()
			-- upvalues: p1 (copy)
			return p1.AccountType
		end else nil,
		getCoreContentBadgeText = if FFlagEnableCoreContentBadge then function()
			-- upvalues: p1 (copy)
			return p1.CoreContentBadgeText
		end else nil,
		getCoreContentTheme = if FFlagEnableCoreContentThemeUseGuacForTokenOverrides then function()
			-- upvalues: p1 (copy)
			return p1.CoreContentTheme
		end else nil,
		getShowUncheckedBadge = if FFlagEnableFlyoutUncheckedBadge or FFlagEnableNonFlyoutUncheckedBadge then function()
			-- upvalues: p1 (copy)
			return p1.ShowUncheckedBadge
		end else nil,
		getShowUncheckedBadgeForAccountSwitcher = function()
			-- upvalues: GetFFlagEnableAccountSwitcherUncheckedBadgeFunction (upval), p1 (copy)
			return if GetFFlagEnableAccountSwitcherUncheckedBadgeFunction() then p1.ShowUncheckedBadge else false
		end,
		getShowBadgeOver12 = if FFlagAddTopBarPoliciesToUniversalPolicies then function()
			-- upvalues: p1 (copy)
			return p1.ShowBadgeOver12 or false
		end else nil,
		getDefaultTheme = if FFlagDefaultKidsToDarkTheme then function()
			-- upvalues: p1 (copy)
			return p1.DefaultTheme
		end else nil,
		getDevicePreferencesPersistentPresenceVariant = if FFlagMacMenuBarContentUpdates then function()
			-- upvalues: p1 (copy)
			return p1.DevicePreferencesPersistentPresenceVariant
		end else nil,
		getCancelSearchOnLostFocus = if FFlagUsesCancelSearchAppPolicy then function()
			-- upvalues: p1 (copy)
			return p1.CancelSearchOnLostFocus == nil or p1.CancelSearchOnLostFocus
		end else nil
	}
end