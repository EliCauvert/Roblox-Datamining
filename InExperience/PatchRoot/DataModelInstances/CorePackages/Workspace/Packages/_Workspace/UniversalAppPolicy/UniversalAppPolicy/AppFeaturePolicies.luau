local userInputService = game:GetService("UserInputService")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local cryoModule = require(parent.Cryo)
local var3 = cryoModule.Dictionary.values(require(parent.UIBlox).App.Style.Constants.ThemeName)
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
local fFlagEnableCoreContentThemeUseGuacForTokenOverrides = sharedFlagsModule.FFlagEnableCoreContentThemeUseGuacForTokenOverrides
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
local friendsChatEnableConversationConsent = game:DefineFastFlag("FriendsChatEnableConversationConsent", false)
game:DefineFastFlag("BehaviorCollectionControlEnabled", false)
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false)
local getFFlagNotificationsComplianceShouldRestrictStream = sharedFlagsModule.GetFFlagNotificationsComplianceShouldRestrictStream

return function(p0) --[[ line: 93 | named "AppFeaturePolicies" ]]
	-- upvalues: isVRAppBuild (ref), luaAppEnableRecommendedCarouselForDesktop (ref), isSubjectToDesktopPolicies (ref), fFlagAppIaScrollAwayGuac (ref), fFlagEnableLeftNavOnConsole (ref), guiService (ref), isRunningInStudio (ref), disableWebViewSupportInStudio (ref), getFFlagLuafiedReportEntryPoints (ref), getFFlagEnableAbuseReport10ft (ref), getFFlagUseVoiceExitBetaLanguage (ref), getFFlagSeamlessVoiceConsentToastPolicy (ref), getFFlagExpChatGuacChatDisabledReason (ref), fFlagAEGIS2UseGuacToShowEnabledMessage (ref), fFlagAEGIS2UseGuacToShowFAEUpsell (ref), fFlagExpChatUseGuacForFOMOUpsell (ref), fFlagExpChatUseGuacForCrossAgeChat (ref), getFFlagDisableCDLQrCodeForMaquettes (ref), cryoModule (ref), var3 (ref), debugUseLegacyCrossPlayApi (ref), debugCrossPlaySystemUi (ref), debugOverrideCrossPlayUri (ref), crossPlayCapabilitiesModule (ref), debugOverrideCrossPlaySettingsKey (ref), debugOverrideCrossPlayQueryParam (ref), getFFlagUseEnablePremiumUserFeaturesAppPolicy (ref), getFFlagUseExternalBrowserForAgeGuidelines10ft (ref), fFlagGuacCanRenderTransferOnProfile (ref), getFFlagEnableGateNotificationPreferencesTab (ref), userInputService (ref), fFlagLuaAppHomeVngAppUpsell (ref), fFlagVngAppUpsellPcLayout (ref), fFlagFriendRequestNicknames (ref), fFlagLuaAppParentUpsellPolicy (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), getFFlagNotificationsComplianceShouldRestrictStream (ref), debugForceShowIllegalContentReportingUI (ref), fFlagRenameParentEmailForVerificationUpsell (ref), useOriginalPlatformChatPolicy (ref), fFlagAppChatOnConsoles (ref), friendsChatEnableConversationConsent (ref), fFlagEnableAndroidTvAppPolicies (ref), getFFlagEnableMultiPageSignup (ref), getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (ref), fFlagEnableMicrosoftStorePaymentsPlatform (ref), fFlagEnableFriendsRenamingForAll (ref), fFlagEnableMilkyWayPaymentsPlatformV2 (ref), fFlagEnableScreentimeMoreTimeOption (ref), flyoutDisablePremiumEntrypoint1 (ref), guacDisableBlackbirdEntrypoints (ref), flyoutEnableGiftcardsWithRedeem (ref), guacAppPolicyDisableSignupCheckbox (ref), fFlagEnableFaceIDTextOnAddAuthMethodPage (ref), fFlagEnableMorePageExitButtonSupport (ref), fFlagEnableMorePageDirectionalLayoutRolloutFix (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagMomentsAutoplayAmpPolicy (ref), getFFlagEnableSupportCenter (ref), fFlagSduiAppPolicyBindings (ref), fFlagGuacStickyShortcutBarEnabled (ref), fFlagEnableCoreContentAccountType (ref), fFlagEnableCoreContentBadge (ref), fFlagEnableCoreContentThemeUseGuacForTokenOverrides (ref), fFlagEnableFlyoutUncheckedBadge (ref), fFlagEnableNonFlyoutUncheckedBadge (ref), getFFlagEnableAccountSwitcherUncheckedBadge (ref), fFlagShowGameAgeRating (ref), fFlagDefaultKidsToDarkTheme (ref), fFlagMacMenuBarContentUpdates (ref), fFlagUsesCancelSearchAppPolicy (ref), fFlagAppNavMyStatsTab (ref)
	local function _(p1, p2) --[[ line: 94 | named "getVRDefaultPolicy" ]]
		-- upvalues: p0 (ref), isVRAppBuild (copy)
		return if p0[p1] == nil then if isVRAppBuild() then p2 else not p2 else p0[p1]
	end
	
	return {
		getFriendFinder = function() --[[ line: 105 ]]
			-- upvalues: p0 (ref)
			return p0.FriendFinder or false
		end,
		getGameDetailsMorePage = function() --[[ line: 108 ]]
			-- upvalues: p0 (ref)
			return p0.GameDetailsMorePage or false
		end,
		getGameDetailsSubtitle = function() --[[ line: 111 ]]
			-- upvalues: p0 (ref)
			return p0.GameDetailsSubtitle or false
		end,
		getShowGlobalCounters = function() --[[ line: 114 ]]
			-- upvalues: p0 (ref)
			return p0.GameDetailsShowGlobalCounters or false
		end,
		getGameDetailsPlayWithFriends = function() --[[ line: 117 ]]
			-- upvalues: p0 (ref)
			return p0.GameDetailsPlayWithFriends or false
		end,
		getGameInfoList = function() --[[ line: 120 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoList or false
		end,
		getGamePlaysAndRatings = function() --[[ line: 123 ]]
			-- upvalues: p0 (ref)
			return p0.GamePlaysAndRatings or false
		end,
		getNotifications = function() --[[ line: 126 ]]
			-- upvalues: p0 (ref)
			return p0.Notifications or false
		end,
		getRecommendedGames = function() --[[ line: 129 ]]
			-- upvalues: luaAppEnableRecommendedCarouselForDesktop (copy), p0 (ref), isSubjectToDesktopPolicies (copy)
			return if luaAppEnableRecommendedCarouselForDesktop then p0.RecommendedGames or false elseif isSubjectToDesktopPolicies() then false else p0.RecommendedGames or false
		end,
		getSearchBar = function() --[[ line: 139 ]]
			-- upvalues: p0 (ref)
			return p0.SearchBar or false
		end,
		getMorePageContent = function() --[[ line: 142 ]]
			-- upvalues: p0 (ref)
			return p0.MorePageContent
		end,
		getAboutPageType = function() --[[ line: 145 ]]
			-- upvalues: p0 (ref)
			return p0.AboutPageType or "CJVAbout"
		end,
		getSettingsPageType = function() --[[ line: 148 ]]
			-- upvalues: p0 (ref)
			return p0.SettingsPageType or "Settings"
		end,
		getSocialLinks = function() --[[ line: 151 ]]
			-- upvalues: p0 (ref)
			return p0.SocialLinks or false
		end,
		getSocialGroupLinks = function() --[[ line: 154 ]]
			-- upvalues: p0 (ref)
			return p0.SocialGroupLinks or false
		end,
		getCommunityLinksEnabled = function() --[[ line: 157 ]]
			-- upvalues: p0 (ref)
			return p0.CommunityLinksEnabled or false
		end,
		getGameInfoShowBadges = function() --[[ line: 160 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowBadges or false
		end,
		getGameInfoShowCreated = function() --[[ line: 163 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowCreated or false
		end,
		getGameInfoShowGamepasses = function() --[[ line: 166 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowGamepasses or false
		end,
		getGameInfoShowGenre = function() --[[ line: 169 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowGenre or false
		end,
		getGameInfoShowSubgenre = function() --[[ line: 172 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowSubgenre or false
		end,
		getGameInfoShowMaxPlayers = function() --[[ line: 175 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowMaxPlayers or false
		end,
		getGameInfoShowServers = function() --[[ line: 178 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowServers or false
		end,
		getGameInfoShowUpdated = function() --[[ line: 181 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowUpdated or false
		end,
		getGameInfoShowAgeRecommendation = function() --[[ line: 184 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowAgeRecommendation == nil or p0.GameInfoShowAgeRecommendation
		end,
		getGameInfoShowVoiceAndChatFeatures = function() --[[ line: 190 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoShowVoiceAndChatFeatures == nil or p0.GameInfoShowVoiceAndChatFeatures
		end,
		getSiteMessageBanner = function() --[[ line: 196 ]]
			-- upvalues: p0 (ref)
			return p0.SiteMessageBanner or false
		end,
		getAlertRateLimit = function() --[[ line: 199 ]]
			-- upvalues: p0 (ref)
			return p0.AlertRateLimit or 300
		end,
		getSearchAutoComplete = function() --[[ line: 203 ]]
			-- upvalues: p0 (ref)
			return p0.SearchAutoComplete or false
		end,
		getShowStudioCTA = function() --[[ line: 206 ]]
			-- upvalues: p0 (ref)
			return p0.ShowStudioCTA or false
		end,
		getAppIaScrollAwayEnabled = if fFlagAppIaScrollAwayGuac then function() --[[ line: 210 ]]
			-- upvalues: p0 (ref)
			return p0.AppIaScrollAwayEnabled or false
		end else nil,
		getUseOmniRecommendation = function() --[[ line: 214 ]]
			-- upvalues: p0 (ref)
			return p0.UseOmniRecommendation == nil or p0.UseOmniRecommendation
		end,
		getUseWidthBasedFormFactorRule = function() --[[ line: 222 ]]
			-- upvalues: p0 (ref)
			return p0.UseWidthBasedFormFactorRule or false
		end,
		getShowYouTubeAgeAlert = function() --[[ line: 225 ]]
			-- upvalues: p0 (ref)
			return p0.ShowYouTubeAgeAlert == nil or p0.ShowYouTubeAgeAlert
		end,
		getShowVideoThumbnails = function() --[[ line: 231 ]]
			-- upvalues: p0 (ref)
			return p0.ShowVideoThumbnails or false
		end,
		getHomeIcon = function() --[[ line: 234 ]]
			-- upvalues: p0 (ref)
			return p0.HomeIcon or "LuaApp/icons/ic-roblox-close"
		end,
		getGameInfoListShowRNVDeveloper = function() --[[ line: 237 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoListShowRNVDeveloper or false
		end,
		getGameInfoListDeveloper = function() --[[ line: 240 ]]
			-- upvalues: p0 (ref)
			return p0.GameInfoListDeveloper or false
		end,
		getShowDisplayName = function() --[[ line: 243 ]]
			-- upvalues: p0 (ref)
			return p0.ShowDisplayName == nil or p0.ShowDisplayName
		end,
		getShowAlias = function() --[[ line: 249 ]]
			-- upvalues: p0 (ref)
			return p0.ShowUserAlias == nil or p0.ShowUserAlias
		end,
		getCatalogReportingDisabled = function() --[[ line: 255 ]]
			-- upvalues: p0 (ref)
			return p0.CatalogReportingDisabled or false
		end,
		getGameReportingDisabled = function() --[[ line: 258 ]]
			-- upvalues: p0 (ref)
			return p0.GameReportingDisabled or false
		end,
		getGamesPageCreationCenterTitle = function() --[[ line: 261 ]]
			-- upvalues: p0 (ref)
			return p0.GamesPageCreationCenterTitle or false
		end,
		shouldUseExternalBrowserForDisclaimerLinks = function() --[[ line: 264 ]]
			-- upvalues: p0 (ref)
			return p0.UseExternalBrowserForDisclaimerLinks or false
		end,
		shouldUseExternalBrowserForMorePageItem = function() --[[ line: 267 ]]
			-- upvalues: p0 (ref)
			return p0.UseExternalBrowserForMoreLinks or false
		end,
		getCatalogShow3dView = function() --[[ line: 270 ]]
			-- upvalues: p0 (ref)
			return p0.CatalogShow3dView or false
		end,
		getItemDetailsFullView = function() --[[ line: 273 ]]
			-- upvalues: p0 (ref)
			return p0.ItemDetailsFullView or false
		end,
		getCatalogCommunityCreations = function() --[[ line: 276 ]]
			-- upvalues: p0 (ref)
			return p0.CatalogCommunityCreations or false
		end,
		getCatalogPremiumCategory = function() --[[ line: 279 ]]
			-- upvalues: p0 (ref)
			return p0.CatalogPremiumCategory or false
		end,
		getShowCatalogPremiumContent = function() --[[ line: 282 ]]
			-- upvalues: p0 (ref)
			return p0.CatalogPremiumContent or false
		end,
		getRobloxCreatedItemsCreatedByLuobu = function() --[[ line: 285 ]]
			-- upvalues: p0 (ref)
			return p0.RobloxCreatedItemsCreatedByLuobu == nil or p0.RobloxCreatedItemsCreatedByLuobu
		end,
		getHomePageFriendSection = function() --[[ line: 291 ]]
			-- upvalues: p0 (ref)
			return p0.HomePageFriendSection or false
		end,
		getHomePageProfileLink = function() --[[ line: 294 ]]
			-- upvalues: p0 (ref)
			return p0.HomePageProfileLink or false
		end,
		getPurchasePromptIncludingWarning = function() --[[ line: 297 ]]
			-- upvalues: p0 (ref)
			return p0.PurchasePromptIncludingWarning == nil or p0.PurchasePromptIncludingWarning
		end,
		getCheckUserAgreementsUpdatedOnLogin = function() --[[ line: 303 ]]
			-- upvalues: p0 (ref)
			return p0.CheckUserAgreementsUpdatedOnLogin == nil or p0.CheckUserAgreementsUpdatedOnLogin
		end,
		getAddUserAgreementIdsToSignupRequest = function() --[[ line: 309 ]]
			-- upvalues: p0 (ref)
			return p0.AddUserAgreementIdsToSignupRequest or false
		end,
		RequireExplicitVoiceConsent = function() --[[ line: 312 ]]
			-- upvalues: p0 (ref)
			return p0.RequireExplicitVoiceConsent or false
		end,
		getRequireExplicitAvatarVideoConsent = function() --[[ line: 315 ]]
			-- upvalues: p0 (ref)
			return p0.RequireExplicitAvatarVideoConsent or false
		end,
		getShowVoiceUpsellV2 = function() --[[ line: 318 ]]
			-- upvalues: p0 (ref)
			return p0.ShowVoiceUpsellV2 or false
		end,
		getShouldShowGroupsTile = function() --[[ line: 321 ]]
			-- upvalues: p0 (ref)
			return p0.ShouldShowGroupsTile or false
		end,
		useLuobuAuthentication = function() --[[ line: 324 ]]
			-- upvalues: p0 (ref)
			return p0.UseLuobuAuthentication or false
		end,
		useWechatQQAuthentication = function() --[[ line: 327 ]]
			-- upvalues: p0 (ref)
			return p0.UseWechatQQAuthentication or false
		end,
		useMSDKWebAuthentication = function() --[[ line: 330 ]]
			-- upvalues: p0 (ref)
			return p0.UseMSDKWebAuthentication or false
		end,
		getQrFriendingEnabled = function() --[[ line: 333 ]]
			-- upvalues: p0 (ref)
			return p0.QrFriendingEnabled or false
		end,
		getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ line: 336 ]]
			-- upvalues: p0 (ref)
			return p0.ShouldShowCameraPermissionInAgreementsPrompt or false
		end,
		getExperienceInviteShareLinkEnabled = function() --[[ line: 339 ]]
			-- upvalues: p0 (ref)
			return p0.ExperienceInviteShareLinkEnabled or false
		end,
		getCsatSurveyRestrictTextInput = function() --[[ line: 342 ]]
			-- upvalues: p0 (ref)
			return p0.CsatSurveyRestrictTextInput or false
		end,
		useGridPageLayout = function() --[[ line: 345 ]]
			-- upvalues: isVRAppBuild (copy), p0 (ref), isSubjectToDesktopPolicies (copy)
			return if isVRAppBuild() then if p0.UseGridPageLayout == nil then isVRAppBuild() else p0.UseGridPageLayout elseif p0.UseGridPageLayout == nil then isSubjectToDesktopPolicies() else p0.UseGridPageLayout
		end,
		usePhoneSearchDiscoverEntry = function() --[[ line: 356 ]]
			-- upvalues: p0 (ref), isSubjectToDesktopPolicies (copy)
			return if p0.UsePhoneSearchDiscoverEntry == nil then not isSubjectToDesktopPolicies() else p0.UsePhoneSearchDiscoverEntry
		end,
		getShouldSystemBarUsuallyBePresent = function() --[[ line: 363 ]]
			-- upvalues: isVRAppBuild (copy), p0 (ref), fFlagEnableLeftNavOnConsole (copy), guiService (copy)
			return if isVRAppBuild() then if p0.ShouldSystemBarUsuallyBePresentForVR == nil then isVRAppBuild() else p0.ShouldSystemBarUsuallyBePresentForVR elseif fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then true else p0.ShouldSystemBarUsuallyBePresent or false
		end,
		getContactImporterEnabled = function() --[[ line: 376 ]]
			-- upvalues: isSubjectToDesktopPolicies (copy), p0 (ref)
			return if isSubjectToDesktopPolicies() then false else p0.ContactImporterEnabled or false
		end,
		getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ line: 384 ]]
			-- upvalues: p0 (ref)
			return p0.shouldShowSettingsPermissionsAdditionalInstructions or false
		end,
		getUseVRFTUXPanel = function() --[[ line: 388 ]]
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.UseVRFTUXPanel == nil then isVRAppBuild() else p0.UseVRFTUXPanel
		end,
		getWebViewSupport = function() --[[ line: 391 ]]
			-- upvalues: isRunningInStudio (copy), disableWebViewSupportInStudio (copy), p0 (ref), isVRAppBuild (copy)
			return if isRunningInStudio() then disableWebViewSupportInStudio elseif p0.EnableWebViewSupport == nil then isVRAppBuild() else p0.EnableWebViewSupport
		end,
		getUseLuafiedReportFlow = function() --[[ line: 402 ]]
			-- upvalues: isVRAppBuild (copy), getFFlagLuafiedReportEntryPoints (copy), p0 (ref), getFFlagEnableAbuseReport10ft (copy)
			return if isVRAppBuild() and getFFlagLuafiedReportEntryPoints() then if p0.UseLuafiedReportFlow == nil then isVRAppBuild() else p0.UseLuafiedReportFlow elseif getFFlagEnableAbuseReport10ft() then p0.UseLuafiedReportFlow or false else nil
		end,
		getThrottleFramerate = function() --[[ line: 411 ]]
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.ThrottleFramerate == nil then isVRAppBuild() else p0.ThrottleFramerate
		end,
		getUseRoundedCorners = function() --[[ line: 414 ]]
			-- upvalues: isVRAppBuild (copy), p0 (ref)
			return if isVRAppBuild() then if p0.UseRoundedCorners == nil then isVRAppBuild() else p0.UseRoundedCorners else false
		end,
		getGameInfoShowChatFeatures = function() --[[ line: 421 ]]
			-- upvalues: getFFlagUseVoiceExitBetaLanguage (copy), p0 (ref)
			return if getFFlagUseVoiceExitBetaLanguage() then p0.GameInfoShowChatFeatures or false else false
		end,
		getDisplayCheckboxInVoiceConsent = function() --[[ line: 427 ]]
			-- upvalues: getFFlagSeamlessVoiceConsentToastPolicy (copy), p0 (ref)
			return if getFFlagSeamlessVoiceConsentToastPolicy() then p0.DisplayCheckboxInVoiceConsent or false else false
		end,
		getExperienceChatAvailability = function() --[[ line: 433 ]]
			-- upvalues: getFFlagExpChatGuacChatDisabledReason (copy), p0 (ref)
			return if getFFlagExpChatGuacChatDisabledReason() then p0.ExperienceChatAvailability or "unknown" else "unknown"
		end,
		getInCommsRegionBubble = function() --[[ line: 439 ]]
			-- upvalues: fFlagAEGIS2UseGuacToShowEnabledMessage (copy), p0 (ref)
			return if fFlagAEGIS2UseGuacToShowEnabledMessage then p0.InCommsRegionBubble or false else false
		end,
		getShowInExpFAEUpsell = function() --[[ line: 445 ]]
			-- upvalues: fFlagAEGIS2UseGuacToShowFAEUpsell (copy), p0 (ref)
			return if fFlagAEGIS2UseGuacToShowFAEUpsell then p0.ShowInExpFAEUpsell or false else false
		end,
		getUseAmpV2WizardForVpc = function() --[[ line: 453 ]]
			-- upvalues: p0 (ref)
			return p0.UseAmpV2WizardForVpc or false
		end,
		getShowFOMOUpsell = function() --[[ line: 456 ]]
			-- upvalues: fFlagExpChatUseGuacForFOMOUpsell (copy), p0 (ref)
			return if fFlagExpChatUseGuacForFOMOUpsell then p0.ShowFOMOUpsell or false else false
		end,
		getShowCrossAgeChat = function() --[[ line: 463 ]]
			-- upvalues: fFlagExpChatUseGuacForCrossAgeChat (copy), p0 (ref)
			return if fFlagExpChatUseGuacForCrossAgeChat then p0.ShowCrossAgeExpChat or false else false
		end,
		getCanSeeChatTerminology = function() --[[ line: 470 ]]
			-- upvalues: p0 (ref)
			return p0.canSeeChatTerminology or false
		end,
		getAllowCameraMovements = function() --[[ line: 473 ]]
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.AllowCameraMovements == nil then isVRAppBuild() else p0.AllowCameraMovements
		end,
		getShouldSkipAvatarLandingPage = function() --[[ line: 476 ]]
			-- upvalues: p0 (ref), isVRAppBuild (copy)
			return if p0.ShouldSkipAvatarLandingPage == nil then isVRAppBuild() else p0.ShouldSkipAvatarLandingPage
		end,
		getShowPassesOnExperienceDetails = function() --[[ line: 479 ]]
			-- upvalues: p0 (ref)
			return p0.ShowPassesOnExperienceDetails or false
		end,
		getDisableCDLQrCodeForMaquettes = function() --[[ line: 482 ]]
			-- upvalues: getFFlagDisableCDLQrCodeForMaquettes (copy), p0 (ref)
			return if getFFlagDisableCDLQrCodeForMaquettes() then p0.DisableCDLQrCodeForMaquettes else false
		end,
		getDisableIAPEntryPoint = function() --[[ line: 489 ]]
			-- upvalues: p0 (ref)
			return p0.DisableIAPEntryPoint or false
		end,
		getEnforceAgeRestrictedLogin = function() --[[ line: 492 ]]
			-- upvalues: p0 (ref)
			return p0.EnforceAgeRestrictedLogin or false
		end,
		getUrlAuthRoutes = function() --[[ line: 495 ]]
			-- upvalues: p0 (ref)
			local routes = p0.Routes or {}
			
			return if routes then routes.auth or {} else {}
		end,
		getShowDisconnectButton = function() --[[ line: 504 ]]
			-- upvalues: p0 (ref)
			return p0.ShowDisconnectButton or false
		end,
		getUseSingleSignOn = function() --[[ line: 507 ]]
			-- upvalues: isRunningInStudio (copy), p0 (ref)
			return if isRunningInStudio() then false else p0.UseSingleSignOn or false
		end,
		getGridCarouselSeeAllTilesEnabled = function() --[[ line: 514 ]]
			-- upvalues: p0 (ref)
			return p0.UseGridCarouselSeeAllTiles or false
		end,
		getSearchWithoutNavigatingEnabled = function() --[[ line: 517 ]]
			-- upvalues: fFlagEnableLeftNavOnConsole (copy), guiService (copy), p0 (ref)
			return if fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then false else p0.SingleSearchPageNoNavigation or false
		end,
		getGameListCategoryScrollListEnabled = function() --[[ line: 523 ]]
			-- upvalues: p0 (ref)
			return p0.GetGamesListCategoryTabs or false
		end,
		getForceTheme = function() --[[ line: 526 ]]
			-- upvalues: cryoModule (copy), var3 (copy), p0 (ref)
			return if p0.ForceTheme and cryoModule.List.find(cryoModule.List.map(var3, function(p3) --[[ line: 527 ]]
				return p3:lower()
			end), p0.ForceTheme:lower()) then p0.ForceTheme else nil
		end,
		enableExperienceDetailsPanel = function() --[[ line: 536 ]]
			-- upvalues: p0 (ref)
			return p0.EnableExperienceDetailsPanel or false
		end,
		getDisableRegularLogin = function() --[[ line: 539 ]]
			-- upvalues: p0 (ref)
			return not p0.EnableWebViewSupport and not p0.EnableRegularLoginWithoutWebViewSupport
		end,
		getAllowPlatformAccountSwitching = function() --[[ line: 542 ]]
			-- upvalues: p0 (ref)
			return p0.AllowPlatformAccountSwitching or false
		end,
		useLegacyCrossPlayApi = function() --[[ line: 545 ]]
			-- upvalues: debugUseLegacyCrossPlayApi (copy), p0 (ref)
			return debugUseLegacyCrossPlayApi or (p0.useLegacyCrossPlayApi or false)
		end,
		useCrossPlaySystemUi = function() --[[ line: 548 ]]
			-- upvalues: debugCrossPlaySystemUi (copy), p0 (ref)
			return debugCrossPlaySystemUi or (p0.useCrossPlaySystemUi or false)
		end,
		getCrossPlayUri = function() --[[ line: 551 ]]
			-- upvalues: debugOverrideCrossPlayUri (copy), p0 (ref)
			return if debugOverrideCrossPlayUri == "" then p0.crossPlayUri or "" else debugOverrideCrossPlayUri
		end,
		getCrossPlayCapabilities = function() --[[ line: 558 ]]
			-- upvalues: cryoModule (copy), p0 (ref), crossPlayCapabilitiesModule (copy)
			return cryoModule.List.foldLeft(p0.crossPlayCapabilities or {}, function(p4, p5) --[[ line: 559 ]]
				-- upvalues: cryoModule (copy), crossPlayCapabilitiesModule (copy)
				return if cryoModule.List.find(p4, p5) then p4 else cryoModule.List.join(p4, { crossPlayCapabilitiesModule[p5] })
			end, {})
		end,
		getCrossPlaySettingsKey = function() --[[ line: 569 ]]
			-- upvalues: debugOverrideCrossPlaySettingsKey (copy), p0 (ref)
			return if debugOverrideCrossPlaySettingsKey == "" then p0.crossPlaySettingsKey or "" else debugOverrideCrossPlaySettingsKey
		end,
		getCrossPlayQueryParam = function() --[[ line: 576 ]]
			-- upvalues: debugOverrideCrossPlayQueryParam (copy), p0 (ref)
			return if debugOverrideCrossPlayQueryParam == "" then p0.crossPlayQueryParam or "" else debugOverrideCrossPlayQueryParam
		end,
		getPromotionalEmailsCheckboxEnabled = function() --[[ line: 583 ]]
			-- upvalues: p0 (ref)
			return if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then p0.PromotionalEmailsCheckboxEnabled or false else false
		end,
		getPromotionalEmailsOptInByDefault = function() --[[ line: 590 ]]
			-- upvalues: p0 (ref)
			return if game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") then p0.PromotionalEmailsOptInByDefault or false else false
		end,
		getSupportsOverscan = function() --[[ line: 597 ]]
			-- upvalues: p0 (ref)
			return p0.SupportsOverscan or false
		end,
		getUseConsoleGameJoinCard = function() --[[ line: 600 ]]
			-- upvalues: p0 (ref)
			return p0.UseConsoleGameJoinCard or false
		end,
		getPlatformDisplayName = function() --[[ line: 603 ]]
			-- upvalues: p0 (ref)
			return p0.platformDisplayName or ""
		end,
		getPlatformAccountName = function() --[[ line: 606 ]]
			-- upvalues: p0 (ref)
			return p0.platformAccountName or nil
		end,
		getSupportsProfileSwitching = function() --[[ line: 609 ]]
			-- upvalues: p0 (ref)
			return p0.supportsProfileSwitching or false
		end,
		getMountAllOmniFeedItems = function() --[[ line: 612 ]]
			-- upvalues: p0 (ref)
			return p0.mountAllOmniFeedItems or false
		end,
		getFriendCodeQrCodeScannerEnabled = function() --[[ line: 615 ]]
			-- upvalues: p0 (ref)
			return p0.FriendCodeQrCodeScannerEnabled or false
		end,
		getInviteFriendsDisabled = function() --[[ line: 618 ]]
			-- upvalues: p0 (ref)
			return p0.InviteFriendsDisabled or false
		end,
		getRealNamesInDisplayNamesEnabled = function() --[[ line: 621 ]]
			-- upvalues: p0 (ref)
			return p0.RealNamesInDisplayNamesEnabled or false
		end,
		getProfileShareLinkEnabled = function() --[[ line: 624 ]]
			-- upvalues: p0 (ref)
			return p0.ProfileShareLinkEnabled
		end,
		getProfileCopyLinkEnabled = function() --[[ line: 627 ]]
			-- upvalues: p0 (ref)
			return p0.ProfileCopyLinkEnabled
		end,
		getEnablePremiumUserFeatures = function() --[[ line: 630 ]]
			-- upvalues: getFFlagUseEnablePremiumUserFeaturesAppPolicy (copy), p0 (ref)
			return if getFFlagUseEnablePremiumUserFeaturesAppPolicy() then p0.EnablePremiumUserFeatures or false else nil
		end,
		getEnableDualLogin = function() --[[ line: 636 ]]
			-- upvalues: p0 (ref)
			return p0.enableDualLogin or false
		end,
		getUseExternalBrowserForAgeGuidelines = function() --[[ line: 640 ]]
			-- upvalues: getFFlagUseExternalBrowserForAgeGuidelines10ft (copy), p0 (ref)
			return if getFFlagUseExternalBrowserForAgeGuidelines10ft() then p0.UseExternalBrowserForAgeGuidelines or false else nil
		end,
		getEnableHomePageAgeBlock = function() --[[ line: 647 ]]
			-- upvalues: p0 (ref)
			return p0.EnableHomePageAgeBlock or false
		end,
		getEnableUAppAccessBlock = function() --[[ line: 650 ]]
			-- upvalues: p0 (ref)
			return p0.EnableUAppAccessBlock or false
		end,
		getUAppBlockPageTextMapKey = function() --[[ line: 653 ]]
			-- upvalues: p0 (ref)
			return p0.UAppBlockPageTextMapKey or nil
		end,
		getUAppBlockPageShouldDisableLogOut = function() --[[ line: 656 ]]
			-- upvalues: p0 (ref)
			return p0.UAppBlockPageShouldDisableLogOut or nil
		end,
		getContactsToastEnabled = function() --[[ line: 659 ]]
			-- upvalues: p0 (ref)
			return p0.ContactsToastEnabled or false
		end,
		getEnableProfileQrCode = function() --[[ line: 662 ]]
			-- upvalues: p0 (ref)
			return p0.EnableProfileQrCode or false
		end,
		getCanRenderTransferOnProfile = function() --[[ line: 665 ]]
			-- upvalues: fFlagGuacCanRenderTransferOnProfile (copy), p0 (ref)
			return if fFlagGuacCanRenderTransferOnProfile then p0.CanRenderTransferOnProfile or false else false
		end,
		getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ line: 671 ]]
			-- upvalues: p0 (ref)
			return p0.ShowVNGLoginWithExistingAccountQuickLoginButton or false
		end,
		getUseCrossDeviceLoginByDefault = function() --[[ line: 674 ]]
			-- upvalues: p0 (ref)
			return p0.UseCrossDeviceLoginByDefault or false
		end,
		getShowVNGAge12Badge = function() --[[ line: 677 ]]
			-- upvalues: p0 (ref)
			return p0.ShowVNGAge12Badge or false
		end,
		getShowBrazilContentRatingLogo = function() --[[ line: 680 ]]
			-- upvalues: p0 (ref)
			return p0.ShowBrazilContentRatingLogo or false
		end,
		getUseVNGUserAgreementPopup = function() --[[ line: 683 ]]
			-- upvalues: p0 (ref)
			return p0.UseVNGUserAgreementPopup or false
		end,
		getRedirectBuyRobuxToVNG = function() --[[ line: 686 ]]
			-- upvalues: p0 (ref)
			return p0.RedirectBuyRobuxToVNG or false
		end,
		getShowVNGTosForRobuxUpsell = function() --[[ line: 689 ]]
			-- upvalues: p0 (ref)
			return p0.ShowVNGTosForRobuxUpsell or false
		end,
		getBlockVNGU12SignUpOnClientSide = function() --[[ line: 692 ]]
			-- upvalues: p0 (ref)
			return p0.BlockVNGU12SignUpOnClientSide or false
		end,
		getUseAgeInput = function() --[[ line: 695 ]]
			-- upvalues: p0 (ref)
			return p0.UseAgeInput or false
		end,
		getLoginUsernameOnly = function() --[[ line: 698 ]]
			-- upvalues: p0 (ref)
			return p0.LoginUsernameOnly or false
		end,
		getDisableEmailOTPLogin = function() --[[ line: 701 ]]
			-- upvalues: p0 (ref)
			return p0.DisableEmailOTPLogin or false
		end,
		getDisableLoginForgotButton = function() --[[ line: 704 ]]
			-- upvalues: p0 (ref)
			return p0.DisableLoginForgotButton or false
		end,
		getDisableLogOutEmailUpsell = function() --[[ line: 707 ]]
			-- upvalues: p0 (ref)
			return p0.DisableLogOutEmailUpsell or false
		end,
		getVerifiedSignupCountry = function() --[[ line: 710 ]]
			-- upvalues: p0 (ref)
			return p0.verifiedSignupCountry or false
		end,
		getParentalConsentAgreementId = function() --[[ line: 714 ]]
			-- upvalues: p0 (ref)
			return p0.parentalConsentAgreementId or ""
		end,
		getIsStrictComplianceEnabled = function() --[[ line: 718 ]]
			-- upvalues: p0 (ref)
			return p0.isStrictComplianceEnabled or false
		end,
		getUseKoreaKISAUserAgreementPopup = function() --[[ line: 722 ]]
			-- upvalues: p0 (ref)
			return p0.useKoreaKISAUserAgreementPopup or false
		end,
		getEnableNotificationPreferencesPage = function() --[[ line: 726 ]]
			-- upvalues: getFFlagEnableGateNotificationPreferencesTab (copy), p0 (ref)
			return if getFFlagEnableGateNotificationPreferencesTab() then p0.EnableNotificationPreferencesPage or false else nil
		end,
		getVNGFormRequired = function() --[[ line: 733 ]]
			-- upvalues: p0 (ref)
			return p0.VNGFormRequired or false
		end,
		getUpsellVoiceForPhoneVerification = function() --[[ line: 736 ]]
			-- upvalues: p0 (ref)
			return p0.UpsellVoiceForPhoneVerification or false
		end,
		getIsLinkedVRModeAvailable = function() --[[ line: 739 ]]
			-- upvalues: userInputService (copy)
			local platform = userInputService:GetPlatform()
			
			return if platform ~= Enum.Platform.Windows then platform == Enum.Platform.UWP else true
		end,
		getShouldShowPhoneUpsell = function() --[[ line: 743 ]]
			-- upvalues: p0 (ref)
			return p0.ShouldShowPhoneUpsell or false
		end,
		getTermsOfUseLink = function() --[[ line: 746 ]]
			-- upvalues: p0 (ref)
			return p0.TermsOfUseLink or ""
		end,
		getPrivacyPolicyLink = function() --[[ line: 749 ]]
			-- upvalues: p0 (ref)
			return p0.PrivacyPolicyLink or ""
		end,
		getVngAppUpsell = function() --[[ line: 752 ]]
			-- upvalues: fFlagLuaAppHomeVngAppUpsell (copy), p0 (ref)
			return if fFlagLuaAppHomeVngAppUpsell then p0.VngAppUpsell or false else false
		end,
		getVngAppUpsellPcLayout = if fFlagVngAppUpsellPcLayout then function() --[[ line: 760 ]]
			-- upvalues: p0 (ref)
			return p0.VngAppUpsellPcLayout or false
		end else nil,
		getShouldHideContactImporterUpsell = function() --[[ line: 764 ]]
			-- upvalues: p0 (ref)
			return p0.ShouldHideContactImporterUpsell or false
		end,
		getContactImporterEncouraged = function() --[[ line: 767 ]]
			-- upvalues: p0 (ref)
			return p0.contactImporterEncouraged or false
		end,
		getFriendRequestNicknamesEnabled = function() --[[ line: 770 ]]
			-- upvalues: fFlagFriendRequestNicknames (copy), p0 (ref)
			return if fFlagFriendRequestNicknames then p0.FriendRequestNicknamesEnabled or false else false
		end,
		getShouldShowVpcPlayButtonUpsells = if fFlagLuaAppParentUpsellPolicy then function() --[[ line: 778 ]]
			-- upvalues: p0 (ref)
			return p0.shouldShowVpcPlayButtonUpsells or false
		end else nil,
		getDisablePlayableWhenLoading = if fFlagLuaAppSupportDisablePlayableWhenLoading then function() --[[ line: 783 ]]
			-- upvalues: p0 (ref)
			return p0.DisablePlayableWhenLoading or false
		end else nil,
		getRenamePaymentsToSpendingTab = function() --[[ line: 787 ]]
			-- upvalues: p0 (ref)
			return p0.renamePaymentsToSpendingTab or false
		end,
		getNotificationsCanReceiveStream = function() --[[ line: 792 ]]
			-- upvalues: getFFlagNotificationsComplianceShouldRestrictStream (copy), p0 (ref)
			return if getFFlagNotificationsComplianceShouldRestrictStream() then p0.notificationsCanAccessStream or false else nil
		end,
		getNotificationsCanReceivePush = function() --[[ line: 799 ]]
			-- upvalues: p0 (ref)
			return p0.notificationsCanAccessPush or false
		end,
		getPushNotificationsUpsell = function() --[[ line: 802 ]]
			-- upvalues: p0 (ref)
			return p0.ShouldShowPushNotificationsUpsell or false
		end,
		getNotificationsCanReceiveExperience = function() --[[ line: 805 ]]
			-- upvalues: p0 (ref)
			return p0.notificationsCanAccessExperience == nil or p0.notificationsCanAccessExperience
		end,
		getDisableResellingCollectiblesForCompliance = function() --[[ line: 811 ]]
			-- upvalues: p0 (ref)
			return p0.DisableResellingCollectiblesForCompliance or false
		end,
		getShowIllegalContentReportingUI = function() --[[ line: 814 ]]
			-- upvalues: debugForceShowIllegalContentReportingUI (copy), p0 (ref)
			return debugForceShowIllegalContentReportingUI or (p0.ShowIllegalContentReportingUI or false)
		end,
		getEligibleForContentPostFeed = function() --[[ line: 817 ]]
			-- upvalues: p0 (ref)
			return p0.EligibleForContentPostFeed or false
		end,
		getEligibleForExternalContentSharing = function() --[[ line: 820 ]]
			-- upvalues: p0 (ref)
			return p0.EligibleForExternalContentSharing or false
		end,
		getEnableContinuousLoad = function() --[[ line: 823 ]]
			-- upvalues: p0 (ref)
			return p0.EnableContinuousLoad or false
		end,
		getEnableAggregateLikesFavoritesCount = function() --[[ line: 826 ]]
			-- upvalues: p0 (ref)
			return p0.EnableAggregateLikesFavoritesCount or false
		end,
		getShowUpdatedCameraPath = function() --[[ line: 829 ]]
			-- upvalues: p0 (ref)
			return p0.showUpdatedCameraPath or false
		end,
		getRenameParentEmailForVerificationUpsell = function() --[[ line: 832 ]]
			-- upvalues: fFlagRenameParentEmailForVerificationUpsell (copy), p0 (ref)
			return if fFlagRenameParentEmailForVerificationUpsell() then p0.renameParentEmailForVerificationUpsell or false else false
		end,
		getKeystrokeCollectionEnabled = function() --[[ line: 839 ]]
			-- upvalues: p0 (ref)
			return if game:GetFastFlag("BehaviorCollectionControlEnabled") then p0.EnableKeystrokeCollection or false else false
		end,
		getCanUsePlatformChat = function() --[[ line: 847 ]]
			-- upvalues: useOriginalPlatformChatPolicy (copy), p0 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p0.CanUsePlatformChat or false elseif fFlagAppChatOnConsoles then p0.CanUsePlatformChat2 or false else p0.CanUsePlatformChat or false
		end,
		getCanSeeChatTab = function() --[[ line: 857 ]]
			-- upvalues: useOriginalPlatformChatPolicy (copy), p0 (ref), fFlagAppChatOnConsoles (copy)
			return if useOriginalPlatformChatPolicy then p0.CanSeeChatTab or false elseif fFlagAppChatOnConsoles then p0.CanSeeChatTab2 or false else p0.CanSeeChatTab or false
		end,
		getCanSeeFriendsTab = function() --[[ line: 872 ]]
			-- upvalues: friendsChatEnableConversationConsent (copy), p0 (ref)
			local t = {
				ContextCard = false,
				VR = false,
				Console = false,
				Gamepad = false,
				ConversationConsent = friendsChatEnableConversationConsent
			}
			
			for i, v in p0.FriendsTabRequiredCapabilities or {} do
				if not t[v] then
					return false
				end
			end
			return true
		end,
		getHidesGamesTab = function() --[[ line: 889 ]]
			-- upvalues: fFlagEnableAndroidTvAppPolicies (copy), p0 (ref)
			return if fFlagEnableAndroidTvAppPolicies then p0.HidesGamesTab or false else false
		end,
		getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ line: 897 ]]
			-- upvalues: getFFlagEnableMultiPageSignup (copy), p0 (ref)
			return if getFFlagEnableMultiPageSignup() then p0.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil or p0.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup else true
		end,
		getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ line: 906 ]]
			-- upvalues: getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup (copy), getFFlagEnableMultiPageSignup (copy), p0 (ref)
			local var24 = getFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup()
			
			return if getFFlagEnableMultiPageSignup() then if p0.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then var24 else p0.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages else var24
		end,
		getRobuxUpsellFlowMobile = function() --[[ line: 916 ]]
			-- upvalues: p0 (ref)
			return p0.useMobileRobuxUpsellFlow or false
		end,
		getUsePaymentPlatformMicrosoftStore = function() --[[ line: 919 ]]
			-- upvalues: fFlagEnableMicrosoftStorePaymentsPlatform (copy), p0 (ref)
			return if fFlagEnableMicrosoftStorePaymentsPlatform then p0.usePaymentPlatformMicrosoftStore or false else false
		end,
		getMicSettingsDirectionsLocaleKey = function() --[[ line: 926 ]]
			-- upvalues: p0 (ref)
			return p0.micSettingsDirectionsLocaleKey or nil
		end,
		getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ line: 929 ]]
			-- upvalues: p0 (ref)
			return p0.micSettingsDeeplinkDirectionsLocaleKey or nil
		end,
		getRequiresAppRestartOnMicAccessChange = function() --[[ line: 932 ]]
			-- upvalues: p0 (ref)
			return p0.requiresAppRestartOnMicAccessChange or false
		end,
		getRenameFriendsToConnections = function() --[[ line: 935 ]]
			-- upvalues: fFlagEnableFriendsRenamingForAll (copy), p0 (ref)
			return if fFlagEnableFriendsRenamingForAll then true else p0.renameFriendsToConnections or false
		end,
		getShareSheetEnabled = function() --[[ line: 941 ]]
			-- upvalues: p0 (ref)
			return p0.shareSheetEnabled or false
		end,
		getCanAccessTrustedContacts = function() --[[ line: 944 ]]
			-- upvalues: p0 (ref)
			return p0.canAccessTrustedContacts or false
		end,
		getExperienceDetailsNoticeType = function() --[[ line: 947 ]]
			-- upvalues: p0 (ref)
			return p0.experienceDetailsNoticeType or nil
		end,
		getRequiresOSAFriendingEducation = function() --[[ line: 950 ]]
			-- upvalues: p0 (ref)
			return p0.requiresOSAFriendingEducation or false
		end,
		getSocialGraphSyncEnabled = function() --[[ line: 953 ]]
			-- upvalues: p0 (ref)
			return p0.SocialGraphSyncEnabled or false
		end,
		getAccountDisambiguationDisabled = function() --[[ line: 956 ]]
			-- upvalues: p0 (ref)
			return p0.AccountDisambiguationDisabled or false
		end,
		getHasWebViewSupportForFAE = function() --[[ line: 959 ]]
			-- upvalues: p0 (ref)
			return p0.hasWebViewSupportForFAE or false
		end,
		getLinkedAuthEndpointsEnabled = function() --[[ line: 962 ]]
			-- upvalues: p0 (ref)
			return p0.LinkedAuthEndpointsEnabled or false
		end,
		getLinkingPlatform = function() --[[ line: 965 ]]
			-- upvalues: p0 (ref)
			return p0.LinkingPlatform or nil
		end,
		getUsePaymentPlatformMilkyWayStore = function() --[[ line: 968 ]]
			-- upvalues: fFlagEnableMilkyWayPaymentsPlatformV2 (copy), p0 (ref)
			return if fFlagEnableMilkyWayPaymentsPlatformV2 then p0.usePaymentPlatformMilkyWayStore or false else false
		end,
		getScreentimeMoreTimeOptionEnabled = function() --[[ line: 974 ]]
			-- upvalues: fFlagEnableScreentimeMoreTimeOption (copy), p0 (ref)
			return if fFlagEnableScreentimeMoreTimeOption then p0.ScreentimeMoreTimeOptionEnabled or false else false
		end,
		getDisablePremiumEntrypoint = function() --[[ line: 980 ]]
			-- upvalues: flyoutDisablePremiumEntrypoint1 (copy), p0 (ref)
			return if flyoutDisablePremiumEntrypoint1 then p0.DisablePremiumEntrypoint or (p0.DisablePremiumEntryPoint or false) else false
		end,
		getDisableBlackbirdEntrypoints = function() --[[ line: 986 ]]
			-- upvalues: guacDisableBlackbirdEntrypoints (copy), p0 (ref)
			return if guacDisableBlackbirdEntrypoints then p0.DisableBlackbirdEntrypoints or false else false
		end,
		getEnableGiftcardsWithRedeem = function() --[[ line: 992 ]]
			-- upvalues: flyoutEnableGiftcardsWithRedeem (copy), p0 (ref)
			return if flyoutEnableGiftcardsWithRedeem then p0.EnableGiftcardsWithRedeem or false else false
		end,
		getGiftCardSourceRefOverride = function() --[[ line: 998 ]]
			-- upvalues: p0 (ref)
			return p0.GiftCardSourceRefOverride or ""
		end,
		getSignupCheckboxDisabled = function() --[[ line: 1001 ]]
			-- upvalues: guacAppPolicyDisableSignupCheckbox (copy), p0 (ref)
			return if guacAppPolicyDisableSignupCheckbox then p0.DisableSignupCheckbox or false else false
		end,
		getShouldShowFaceIDText = function() --[[ line: 1007 ]]
			-- upvalues: fFlagEnableFaceIDTextOnAddAuthMethodPage (copy), p0 (ref)
			return if fFlagEnableFaceIDTextOnAddAuthMethodPage then p0.ShouldShowFaceIDText or false else false
		end,
		getExcludeCrossDeviceSignIn = function() --[[ line: 1014 ]]
			-- upvalues: p0 (ref)
			return p0.ExcludeCrossDeviceSignIn or false
		end,
		getExcludePasskeyLogin = function() --[[ line: 1017 ]]
			-- upvalues: p0 (ref)
			return p0.ExcludePasskeyLogin or false
		end,
		getExcludeUsernamePasswordSignIn = function() --[[ line: 1021 ]]
			-- upvalues: p0 (ref)
			return p0.ExcludeUsernamePasswordSignIn or false
		end,
		getExcludeEmailPasswordSignIn = function() --[[ line: 1024 ]]
			-- upvalues: p0 (ref)
			return p0.ExcludeEmailPasswordSignIn or false
		end,
		getExcludePhoneNumberPasswordSignIn = function() --[[ line: 1027 ]]
			-- upvalues: p0 (ref)
			return p0.ExcludePhoneNumberPasswordSignIn or false
		end,
		getExcludeAccountSwitcher = function() --[[ line: 1030 ]]
			-- upvalues: p0 (ref)
			return p0.ExcludeAccountSwitcher or false
		end,
		getAccountSwitcherEnabled = function() --[[ line: 1033 ]]
			-- upvalues: p0 (ref)
			return p0.AccountSwitcherEnabled or false
		end,
		getAccountPickerEnabled = function() --[[ line: 1036 ]]
			-- upvalues: p0 (ref)
			return p0.AccountPickerEnabled or false
		end,
		getExcludeUsernameUpdateModeration = function() --[[ line: 1039 ]]
			-- upvalues: p0 (ref)
			return p0.ExcludeUsernameUpdateModeration or false
		end,
		getMorePageExitButtonEnabled = if fFlagEnableMorePageExitButtonSupport then function() --[[ line: 1043 ]]
			-- upvalues: p0 (ref)
			return p0.MorePageExitButtonEnabled or false
		end else nil,
		getMoreGridDirectionalLayoutPreferred = if fFlagEnableMorePageDirectionalLayoutRolloutFix then function() --[[ line: 1048 ]]
			-- upvalues: p0 (ref)
			return p0.MoreGridDirectionalLayoutPreferred or false
		end else nil,
		getShouldUseDMCCALegalDisclosureInApp = function() --[[ line: 1052 ]]
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), p0 (ref)
			return if fFlagEnableUnifiedProductPurchaseFlow then p0.ShouldUseDMCCALegalDisclosureInApp or false else false
		end,
		getCanAccessParty = function() --[[ line: 1058 ]]
			-- upvalues: p0 (ref)
			return p0.CanAccessParty == nil or p0.CanAccessParty
		end,
		getRedeemTileEnabled = function() --[[ line: 1064 ]]
			-- upvalues: p0 (ref)
			return p0.RedeemTileEnabled or false
		end,
		getDisplayMomentsMoreTabTile = function() --[[ line: 1067 ]]
			-- upvalues: p0 (ref)
			return p0.DisplayMomentsMoreTabTile or false
		end,
		getMomentsCanAutoPlay = if fFlagMomentsAutoplayAmpPolicy then function() --[[ line: 1071 ]]
			-- upvalues: p0 (ref)
			return p0.MomentsAutoPlayEnabled == nil or p0.MomentsAutoPlayEnabled
		end else nil,
		getMomentsInfiniteScrollEnabled = function() --[[ line: 1075 ]]
			-- upvalues: p0 (ref)
			return p0.MomentsInfiniteScrollEnabled == nil or p0.MomentsInfiniteScrollEnabled
		end,
		getSupportCenterEnabled = if getFFlagEnableSupportCenter() then function() --[[ line: 1079 ]]
			-- upvalues: p0 (ref)
			return p0.SupportCenterEnabled or false
		end else nil,
		getShouldUseVibrationInsteadOfHaptics = function() --[[ line: 1083 ]]
			-- upvalues: p0 (ref)
			return p0.ShouldUseVibrationInsteadOfHaptics or false
		end,
		getRawPolicy = if fFlagSduiAppPolicyBindings then function() --[[ line: 1087 ]]
			-- upvalues: p0 (ref)
			return p0
		end else nil,
		getStickyShortcutBarEnabled = if fFlagGuacStickyShortcutBarEnabled then function() --[[ line: 1092 ]]
			-- upvalues: p0 (ref)
			return p0.StickyShortcutBarEnabled or false
		end else nil,
		getAccountType = if fFlagEnableCoreContentAccountType then function() --[[ line: 1097 ]]
			-- upvalues: p0 (ref)
			return p0.AccountType
		end else nil,
		getCoreContentBadgeText = if fFlagEnableCoreContentBadge then function() --[[ line: 1102 ]]
			-- upvalues: p0 (ref)
			return p0.CoreContentBadgeText
		end else nil,
		getCoreContentTheme = if fFlagEnableCoreContentThemeUseGuacForTokenOverrides then function() --[[ line: 1107 ]]
			-- upvalues: p0 (ref)
			return p0.CoreContentTheme
		end else nil,
		getShowUncheckedBadge = if fFlagEnableFlyoutUncheckedBadge or fFlagEnableNonFlyoutUncheckedBadge then function() --[[ line: 1112 ]]
			-- upvalues: p0 (ref)
			return p0.ShowUncheckedBadge
		end else nil,
		getShowUncheckedBadgeForAccountSwitcher = function() --[[ line: 1116 ]]
			-- upvalues: getFFlagEnableAccountSwitcherUncheckedBadge (copy), p0 (ref)
			return if getFFlagEnableAccountSwitcherUncheckedBadge() then p0.ShowUncheckedBadge else false
		end,
		getShowGameAgeRating = if fFlagShowGameAgeRating then function() --[[ line: 1123 ]]
			-- upvalues: p0 (ref)
			return p0.ShowGameAgeRating or false
		end else nil,
		getShowBadgeOver12 = if not fFlagShowGameAgeRating then function() --[[ line: 1128 ]]
			-- upvalues: p0 (ref)
			return p0.ShowBadgeOver12 or false
		end else nil,
		getDefaultTheme = if fFlagDefaultKidsToDarkTheme then function() --[[ line: 1133 ]]
			-- upvalues: p0 (ref)
			return p0.DefaultTheme
		end else nil,
		getDevicePreferencesPersistentPresenceVariant = if fFlagMacMenuBarContentUpdates then function() --[[ line: 1138 ]]
			-- upvalues: p0 (ref)
			return p0.DevicePreferencesPersistentPresenceVariant
		end else nil,
		getCancelSearchOnLostFocus = if fFlagUsesCancelSearchAppPolicy then function() --[[ line: 1143 ]]
			-- upvalues: p0 (ref)
			return p0.CancelSearchOnLostFocus == nil or p0.CancelSearchOnLostFocus
		end else nil,
		getCanViewBuild = if fFlagAppNavMyStatsTab then function() --[[ line: 1151 ]]
			-- upvalues: p0 (ref)
			return p0.CanViewBuild or false
		end else nil,
		getCanUseBuild = if fFlagAppNavMyStatsTab then function() --[[ line: 1156 ]]
			-- upvalues: p0 (ref)
			return p0.CanUseBuild or false
		end else nil
	}
end