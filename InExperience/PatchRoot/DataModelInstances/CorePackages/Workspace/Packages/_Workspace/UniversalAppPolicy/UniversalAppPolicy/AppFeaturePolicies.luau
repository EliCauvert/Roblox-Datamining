local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local IsTenFootInterfaceFunction = require(Parent.AppCommonLib).isTenFootInterface
local CryoModule = require(Parent.Cryo)
local ValuesResult = CryoModule.Dictionary.values(require(Parent.Foundation).Enums.ColorMode)
local CrossPlayCapabilitiesModule = require(script.Parent.Enum.CrossPlayCapabilities)
local SharedFlagsModule = require(Parent.SharedFlags)
local IsSubjectToDesktopPoliciesFunction = SharedFlagsModule.isSubjectToDesktopPolicies
local IsRunningInStudioFunction = require(Parent.AppCommonLib).isRunningInStudio
local GetFFlagDisableCDLQrCodeForMaquettesFunction = SharedFlagsModule.GetFFlagDisableCDLQrCodeForMaquettes
local GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction = SharedFlagsModule.GetFFlagUseEnablePremiumUserFeaturesAppPolicy
local GetFFlagLuafiedReportEntryPointsFunction = SharedFlagsModule.GetFFlagLuafiedReportEntryPoints
local GetFFlagEnableAbuseReport10ftFunction = SharedFlagsModule.GetFFlagEnableAbuseReport10ft
local GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction = SharedFlagsModule.GetFFlagUseExternalBrowserForAgeGuidelines10ft
local GetFFlagEnableGateNotificationPreferencesTabFunction = SharedFlagsModule.GetFFlagEnableGateNotificationPreferencesTab
local GetFFlagEnableSupportCenterFunction = SharedFlagsModule.GetFFlagEnableSupportCenter
local FFlagLuaAppHomeVngAppUpsell = SharedFlagsModule.FFlagLuaAppHomeVngAppUpsell
local FFlagVngAppUpsellPcLayout = SharedFlagsModule.FFlagVngAppUpsellPcLayout
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
local FFlagEnableFaceIDTextOnAddAuthMethodPage = SharedFlagsModule.FFlagEnableFaceIDTextOnAddAuthMethodPage
local FFlagEnableMorePageExitButtonSupport = SharedFlagsModule.FFlagEnableMorePageExitButtonSupport
local FFlagEnableMorePageDirectionalLayoutRolloutFix = SharedFlagsModule.FFlagEnableMorePageDirectionalLayoutRolloutFix
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
local DebugMomentsFeatureList = game:DefineFastString("DebugMomentsFeatureList", "")
local GuacAppPolicyDisableSignupCheckbox = game:DefineFastFlag("GuacAppPolicyDisableSignupCheckbox", false)
local FlyoutDisablePremiumEntrypoint1 = game:DefineFastFlag("FlyoutDisablePremiumEntrypoint1", false)
local GuacDisableBlackbirdEntrypoints = game:DefineFastFlag("GuacDisableBlackbirdEntrypoints", false)
local FlyoutEnableGiftcardsWithRedeem = game:DefineFastFlag("FlyoutEnableGiftcardsWithRedeem", false)
local DebugForceShowIllegalContentReportingUI = game:DefineFastFlag("DebugForceShowIllegalContentReportingUI", false)
local FFlagExpChatUseGuacForFOMOUpsell = SharedFlagsModule.FFlagExpChatUseGuacForFOMOUpsell
local FFlagExpChatUseGuacForCrossAgeChat = SharedFlagsModule.FFlagExpChatUseGuacForCrossAgeChat
local FFlagEnableAndroidTvAppPolicies = SharedFlagsModule.FFlagEnableAndroidTvAppPolicies
local FFlagEnableCoreContentAccountType = SharedFlagsModule.FFlagEnableCoreContentAccountType
local FFlagEnableCoreContentBadge = SharedFlagsModule.FFlagEnableCoreContentBadge
local FFlagEnableFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableFlyoutUncheckedBadge
local FFlagEnableNonFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableNonFlyoutUncheckedBadge
local GetFFlagEnableAccountSwitcherUncheckedBadgeFunction = SharedFlagsModule.GetFFlagEnableAccountSwitcherUncheckedBadge
local FFlagShowGameAgeRating = SharedFlagsModule.FFlagShowGameAgeRating
local FFlagDefaultKidsToDarkTheme = SharedFlagsModule.FFlagDefaultKidsToDarkTheme
local FFlagLuaAppSupportDisablePlayableWhenLoading = SharedFlagsModule.FFlagLuaAppSupportDisablePlayableWhenLoading
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagAppChatOnConsoles = SharedFlagsModule.FFlagAppChatOnConsoles
local UseOriginalPlatformChatPolicy = game:DefineFastFlag("UseOriginalPlatformChatPolicy", false)
local FFlagFriendsChatEnableConversationConsent = SharedFlagsModule.FFlagFriendsChatEnableConversationConsent
local FFlagFriendsChatOsaSystemMessage = SharedFlagsModule.FFlagFriendsChatOsaSystemMessage
local FFlagFriendsChatDiscloseUpdateSecondVersion = SharedFlagsModule.FFlagFriendsChatDiscloseUpdateSecondVersion
local FFlagFriendsChatHasFriendsGate = SharedFlagsModule.FFlagFriendsChatHasFriendsGate
local FFlagAddPinExperienceTargetDestinationGUACPolicy = SharedFlagsModule.FFlagAddPinExperienceTargetDestinationGUACPolicy
local FFlagFlyoutSidePanelUseAppPolicy = SharedFlagsModule.FFlagFlyoutSidePanelUseAppPolicy
local FFlagFlyoutGateLearnPlace = SharedFlagsModule.FFlagFlyoutGateLearnPlace
game:DefineFastFlag("BehaviorCollectionControlEnabled", false)
game:DefineFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy", false)
local GetFFlagNotificationsComplianceShouldRestrictStreamFunction = SharedFlagsModule.GetFFlagNotificationsComplianceShouldRestrictStream

return function(p1) --[[ Line: 92 | Named "AppFeaturePolicies" ]]
	-- upvalues: IsVRAppBuildFunction (copy), LuaAppEnableRecommendedCarouselForDesktop (copy), IsSubjectToDesktopPoliciesFunction (copy), UseOriginalPlatformChatPolicy (copy), FFlagAppChatOnConsoles (copy), FFlagAppIaScrollAwayGuac (copy), IsTenFootInterfaceFunction (copy), IsRunningInStudioFunction (copy), DisableWebViewSupportInStudio (copy), GetFFlagLuafiedReportEntryPointsFunction (copy), GetFFlagEnableAbuseReport10ftFunction (copy), GetFFlagSeamlessVoiceConsentToastPolicyFunction (copy), GetFFlagExpChatGuacChatDisabledReasonFunction (copy), FFlagAEGIS2UseGuacToShowEnabledMessage (copy), FFlagAEGIS2UseGuacToShowFAEUpsell (copy), FFlagExpChatUseGuacForFOMOUpsell (copy), FFlagExpChatUseGuacForCrossAgeChat (copy), GetFFlagDisableCDLQrCodeForMaquettesFunction (copy), CryoModule (copy), ValuesResult (copy), DebugUseLegacyCrossPlayApi (copy), DebugCrossPlaySystemUi (copy), DebugOverrideCrossPlayUri (copy), CrossPlayCapabilitiesModule (copy), DebugOverrideCrossPlaySettingsKey (copy), DebugOverrideCrossPlayQueryParam (copy), GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction (copy), GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction (copy), FFlagGuacCanRenderTransferOnProfile (copy), GetFFlagEnableGateNotificationPreferencesTabFunction (copy), UserInputService (copy), FFlagLuaAppHomeVngAppUpsell (copy), FFlagVngAppUpsellPcLayout (copy), FFlagLuaAppParentUpsellPolicy (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), GetFFlagNotificationsComplianceShouldRestrictStreamFunction (copy), DebugForceShowIllegalContentReportingUI (copy), FFlagRenameParentEmailForVerificationUpsellFunction (copy), FFlagFriendsChatOsaSystemMessage (copy), FFlagFriendsChatDiscloseUpdateSecondVersion (copy), FFlagFriendsChatEnableConversationConsent (copy), FFlagFriendsChatHasFriendsGate (copy), FFlagEnableAndroidTvAppPolicies (copy), GetFFlagEnableMultiPageSignupFunction (copy), GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignupFunction (copy), FFlagEnableMicrosoftStorePaymentsPlatform (copy), FFlagEnableFriendsRenamingForAll (copy), FFlagEnableMilkyWayPaymentsPlatformV2 (copy), FFlagEnableScreentimeMoreTimeOption (copy), FlyoutDisablePremiumEntrypoint1 (copy), GuacDisableBlackbirdEntrypoints (copy), FlyoutEnableGiftcardsWithRedeem (copy), GuacAppPolicyDisableSignupCheckbox (copy), FFlagEnableFaceIDTextOnAddAuthMethodPage (copy), FFlagEnableMorePageExitButtonSupport (copy), FFlagEnableMorePageDirectionalLayoutRolloutFix (copy), DebugMomentsFeatureList (copy), GetFFlagEnableSupportCenterFunction (copy), FFlagEnableCoreContentAccountType (copy), FFlagEnableCoreContentBadge (copy), FFlagEnableFlyoutUncheckedBadge (copy), FFlagEnableNonFlyoutUncheckedBadge (copy), GetFFlagEnableAccountSwitcherUncheckedBadgeFunction (copy), FFlagShowGameAgeRating (copy), FFlagDefaultKidsToDarkTheme (copy), FFlagMacMenuBarContentUpdates (copy), FFlagUsesCancelSearchAppPolicy (copy), FFlagAppNavMyStatsTab (copy), FFlagAddPinExperienceTargetDestinationGUACPolicy (copy), FFlagFlyoutSidePanelUseAppPolicy (copy), FFlagFlyoutGateLearnPlace (copy)
	local function _(p2, p3) --[[ Line: 93 | Named "getVRDefaultPolicy" ]]
		-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
		return if p1[p2] == nil then if IsVRAppBuildFunction() then p3 else not p3 else p1[p2]
	end
	
	return {
		getFriendFinder = function() --[[ Line: 104 ]]
			-- upvalues: p1 (copy)
			return p1.FriendFinder or false
		end,
		getGameDetailsMorePage = function() --[[ Line: 107 ]]
			-- upvalues: p1 (copy)
			return p1.GameDetailsMorePage or false
		end,
		getGameDetailsSubtitle = function() --[[ Line: 110 ]]
			-- upvalues: p1 (copy)
			return p1.GameDetailsSubtitle or false
		end,
		getShowGlobalCounters = function() --[[ Line: 113 ]]
			-- upvalues: p1 (copy)
			return p1.GameDetailsShowGlobalCounters or false
		end,
		getGameDetailsPlayWithFriends = function() --[[ Line: 116 ]]
			-- upvalues: p1 (copy)
			return p1.GameDetailsPlayWithFriends or false
		end,
		getGameInfoList = function() --[[ Line: 119 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoList or false
		end,
		getGamePlaysAndRatings = function() --[[ Line: 122 ]]
			-- upvalues: p1 (copy)
			return p1.GamePlaysAndRatings or false
		end,
		getNotifications = function() --[[ Line: 125 ]]
			-- upvalues: p1 (copy)
			return p1.Notifications or false
		end,
		getRecommendedGames = function() --[[ Line: 128 ]]
			-- upvalues: LuaAppEnableRecommendedCarouselForDesktop (upval), p1 (copy), IsSubjectToDesktopPoliciesFunction (upval)
			return if LuaAppEnableRecommendedCarouselForDesktop then p1.RecommendedGames or false else not IsSubjectToDesktopPoliciesFunction() and (p1.RecommendedGames or false)
		end,
		getSearchBar = function() --[[ Line: 138 ]]
			-- upvalues: p1 (copy)
			return p1.SearchBar or false
		end,
		getMorePageContent = function() --[[ Line: 141 ]]
			-- upvalues: UseOriginalPlatformChatPolicy (upval), p1 (copy), FFlagAppChatOnConsoles (upval)
			return if UseOriginalPlatformChatPolicy then p1.MorePageContent elseif FFlagAppChatOnConsoles then p1.MorePageContent2 else p1.MorePageContent
		end,
		getAboutPageType = function() --[[ Line: 150 ]]
			-- upvalues: p1 (copy)
			return p1.AboutPageType or "CJVAbout"
		end,
		getSettingsPageType = function() --[[ Line: 153 ]]
			-- upvalues: p1 (copy)
			return p1.SettingsPageType or "Settings"
		end,
		getSocialLinks = function() --[[ Line: 156 ]]
			-- upvalues: p1 (copy)
			return p1.SocialLinks or false
		end,
		getSocialGroupLinks = function() --[[ Line: 159 ]]
			-- upvalues: p1 (copy)
			return p1.SocialGroupLinks or false
		end,
		getCommunityLinksEnabled = function() --[[ Line: 162 ]]
			-- upvalues: p1 (copy)
			return p1.CommunityLinksEnabled or false
		end,
		getGameInfoShowBadges = function() --[[ Line: 165 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowBadges or false
		end,
		getGameInfoShowCreated = function() --[[ Line: 168 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowCreated or false
		end,
		getGameInfoShowGamepasses = function() --[[ Line: 171 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowGamepasses or false
		end,
		getGameInfoShowGenre = function() --[[ Line: 174 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowGenre or false
		end,
		getGameInfoShowSubgenre = function() --[[ Line: 177 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowSubgenre or false
		end,
		getGameInfoShowMaxPlayers = function() --[[ Line: 180 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowMaxPlayers or false
		end,
		getGameInfoShowServers = function() --[[ Line: 183 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowServers or false
		end,
		getGameInfoShowUpdated = function() --[[ Line: 186 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowUpdated or false
		end,
		getGameInfoShowAgeRecommendation = function() --[[ Line: 189 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowAgeRecommendation == nil or p1.GameInfoShowAgeRecommendation
		end,
		getGameInfoShowVoiceAndChatFeatures = function() --[[ Line: 195 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoShowVoiceAndChatFeatures == nil or p1.GameInfoShowVoiceAndChatFeatures
		end,
		getSiteMessageBanner = function() --[[ Line: 201 ]]
			-- upvalues: p1 (copy)
			return p1.SiteMessageBanner or false
		end,
		getAlertRateLimit = function() --[[ Line: 204 ]]
			-- upvalues: p1 (copy)
			return p1.AlertRateLimit or 300
		end,
		getSearchAutoComplete = function() --[[ Line: 208 ]]
			-- upvalues: p1 (copy)
			return p1.SearchAutoComplete or false
		end,
		getShowStudioCTA = function() --[[ Line: 211 ]]
			-- upvalues: p1 (copy)
			return p1.ShowStudioCTA or false
		end,
		getAppIaScrollAwayEnabled = if FFlagAppIaScrollAwayGuac then function() --[[ Line: 215 ]]
			-- upvalues: p1 (copy)
			return p1.AppIaScrollAwayEnabled or false
		end else nil,
		getUseOmniRecommendation = function() --[[ Line: 219 ]]
			-- upvalues: p1 (copy)
			return p1.UseOmniRecommendation == nil or p1.UseOmniRecommendation
		end,
		getUseWidthBasedFormFactorRule = function() --[[ Line: 227 ]]
			-- upvalues: p1 (copy)
			return p1.UseWidthBasedFormFactorRule or false
		end,
		getShowYouTubeAgeAlert = function() --[[ Line: 230 ]]
			-- upvalues: p1 (copy)
			return p1.ShowYouTubeAgeAlert == nil or p1.ShowYouTubeAgeAlert
		end,
		getShowVideoThumbnails = function() --[[ Line: 236 ]]
			-- upvalues: p1 (copy)
			return p1.ShowVideoThumbnails or false
		end,
		getHomeIcon = function() --[[ Line: 239 ]]
			-- upvalues: p1 (copy)
			return p1.HomeIcon or "LuaApp/icons/ic-roblox-close"
		end,
		getGameInfoListShowRNVDeveloper = function() --[[ Line: 242 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoListShowRNVDeveloper or false
		end,
		getGameInfoListDeveloper = function() --[[ Line: 245 ]]
			-- upvalues: p1 (copy)
			return p1.GameInfoListDeveloper or false
		end,
		getShowDisplayName = function() --[[ Line: 248 ]]
			-- upvalues: p1 (copy)
			return p1.ShowDisplayName == nil or p1.ShowDisplayName
		end,
		getShowAlias = function() --[[ Line: 254 ]]
			-- upvalues: p1 (copy)
			return p1.ShowUserAlias == nil or p1.ShowUserAlias
		end,
		getCatalogReportingDisabled = function() --[[ Line: 260 ]]
			-- upvalues: p1 (copy)
			return p1.CatalogReportingDisabled or false
		end,
		getGameReportingDisabled = function() --[[ Line: 263 ]]
			-- upvalues: p1 (copy)
			return p1.GameReportingDisabled or false
		end,
		getGamesPageCreationCenterTitle = function() --[[ Line: 266 ]]
			-- upvalues: p1 (copy)
			return p1.GamesPageCreationCenterTitle or false
		end,
		shouldUseExternalBrowserForDisclaimerLinks = function() --[[ Line: 269 ]]
			-- upvalues: p1 (copy)
			return p1.UseExternalBrowserForDisclaimerLinks or false
		end,
		shouldUseExternalBrowserForMorePageItem = function() --[[ Line: 272 ]]
			-- upvalues: p1 (copy)
			return p1.UseExternalBrowserForMoreLinks or false
		end,
		getCatalogShow3dView = function() --[[ Line: 275 ]]
			-- upvalues: p1 (copy)
			return p1.CatalogShow3dView or false
		end,
		getItemDetailsFullView = function() --[[ Line: 278 ]]
			-- upvalues: p1 (copy)
			return p1.ItemDetailsFullView or false
		end,
		getCatalogCommunityCreations = function() --[[ Line: 281 ]]
			-- upvalues: p1 (copy)
			return p1.CatalogCommunityCreations or false
		end,
		getCatalogPremiumCategory = function() --[[ Line: 284 ]]
			-- upvalues: p1 (copy)
			return p1.CatalogPremiumCategory or false
		end,
		getShowCatalogPremiumContent = function() --[[ Line: 287 ]]
			-- upvalues: p1 (copy)
			return p1.CatalogPremiumContent or false
		end,
		getRobloxCreatedItemsCreatedByLuobu = function() --[[ Line: 290 ]]
			-- upvalues: p1 (copy)
			return p1.RobloxCreatedItemsCreatedByLuobu == nil or p1.RobloxCreatedItemsCreatedByLuobu
		end,
		getHomePageFriendSection = function() --[[ Line: 296 ]]
			-- upvalues: p1 (copy)
			return p1.HomePageFriendSection or false
		end,
		getHomePageProfileLink = function() --[[ Line: 299 ]]
			-- upvalues: p1 (copy)
			return p1.HomePageProfileLink or false
		end,
		getPurchasePromptIncludingWarning = function() --[[ Line: 302 ]]
			-- upvalues: p1 (copy)
			return p1.PurchasePromptIncludingWarning == nil or p1.PurchasePromptIncludingWarning
		end,
		getCheckUserAgreementsUpdatedOnLogin = function() --[[ Line: 308 ]]
			-- upvalues: p1 (copy)
			return p1.CheckUserAgreementsUpdatedOnLogin == nil or p1.CheckUserAgreementsUpdatedOnLogin
		end,
		getAddUserAgreementIdsToSignupRequest = function() --[[ Line: 314 ]]
			-- upvalues: p1 (copy)
			return p1.AddUserAgreementIdsToSignupRequest or false
		end,
		RequireExplicitVoiceConsent = function() --[[ Line: 317 ]]
			-- upvalues: p1 (copy)
			return p1.RequireExplicitVoiceConsent or false
		end,
		getRequireExplicitAvatarVideoConsent = function() --[[ Line: 320 ]]
			-- upvalues: p1 (copy)
			return p1.RequireExplicitAvatarVideoConsent or false
		end,
		getShowVoiceUpsellV2 = function() --[[ Line: 323 ]]
			-- upvalues: p1 (copy)
			return p1.ShowVoiceUpsellV2 or false
		end,
		getShouldShowGroupsTile = function() --[[ Line: 326 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldShowGroupsTile or false
		end,
		useLuobuAuthentication = function() --[[ Line: 329 ]]
			-- upvalues: p1 (copy)
			return p1.UseLuobuAuthentication or false
		end,
		useWechatQQAuthentication = function() --[[ Line: 332 ]]
			-- upvalues: p1 (copy)
			return p1.UseWechatQQAuthentication or false
		end,
		useMSDKWebAuthentication = function() --[[ Line: 335 ]]
			-- upvalues: p1 (copy)
			return p1.UseMSDKWebAuthentication or false
		end,
		getQrFriendingEnabled = function() --[[ Line: 338 ]]
			-- upvalues: p1 (copy)
			return p1.QrFriendingEnabled or false
		end,
		getShouldShowCameraPermissionInAgreementsPrompt = function() --[[ Line: 341 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldShowCameraPermissionInAgreementsPrompt or false
		end,
		getExperienceInviteShareLinkEnabled = function() --[[ Line: 344 ]]
			-- upvalues: p1 (copy)
			return p1.ExperienceInviteShareLinkEnabled or false
		end,
		getCsatSurveyRestrictTextInput = function() --[[ Line: 347 ]]
			-- upvalues: p1 (copy)
			return p1.CsatSurveyRestrictTextInput or false
		end,
		useGridPageLayout = function() --[[ Line: 350 ]]
			-- upvalues: IsVRAppBuildFunction (upval), p1 (copy), IsSubjectToDesktopPoliciesFunction (upval)
			return if IsVRAppBuildFunction() then if p1.UseGridPageLayout == nil then if IsVRAppBuildFunction() then true else false else p1.UseGridPageLayout elseif p1.UseGridPageLayout == nil then IsSubjectToDesktopPoliciesFunction() else p1.UseGridPageLayout
		end,
		usePhoneSearchDiscoverEntry = function() --[[ Line: 361 ]]
			-- upvalues: p1 (copy), IsSubjectToDesktopPoliciesFunction (upval)
			return if p1.UsePhoneSearchDiscoverEntry == nil then not IsSubjectToDesktopPoliciesFunction() else p1.UsePhoneSearchDiscoverEntry
		end,
		getShouldSystemBarUsuallyBePresent = function() --[[ Line: 368 ]]
			-- upvalues: IsVRAppBuildFunction (upval), p1 (copy), IsTenFootInterfaceFunction (upval)
			return if IsVRAppBuildFunction() then if p1.ShouldSystemBarUsuallyBePresentForVR == nil then if IsVRAppBuildFunction() then true else false else p1.ShouldSystemBarUsuallyBePresentForVR elseif IsTenFootInterfaceFunction() then true else p1.ShouldSystemBarUsuallyBePresent or false
		end,
		getContactImporterEnabled = function() --[[ Line: 381 ]]
			-- upvalues: IsSubjectToDesktopPoliciesFunction (upval), p1 (copy)
			return not IsSubjectToDesktopPoliciesFunction() and (p1.ContactImporterEnabled or false)
		end,
		getShouldShowSettingsPermissionsAdditionalInstructions = function() --[[ Line: 389 ]]
			-- upvalues: p1 (copy)
			return p1.shouldShowSettingsPermissionsAdditionalInstructions or false
		end,
		getUseVRFTUXPanel = function() --[[ Line: 393 ]]
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.UseVRFTUXPanel == nil then if IsVRAppBuildFunction() then true else false else p1.UseVRFTUXPanel
		end,
		getWebViewSupport = function() --[[ Line: 396 ]]
			-- upvalues: IsRunningInStudioFunction (upval), DisableWebViewSupportInStudio (upval), p1 (copy), IsVRAppBuildFunction (upval)
			return if IsRunningInStudioFunction() then not DisableWebViewSupportInStudio elseif p1.EnableWebViewSupport == nil then not IsVRAppBuildFunction() else p1.EnableWebViewSupport
		end,
		getUseLuafiedReportFlow = function() --[[ Line: 407 ]]
			-- upvalues: IsVRAppBuildFunction (upval), GetFFlagLuafiedReportEntryPointsFunction (upval), p1 (copy), GetFFlagEnableAbuseReport10ftFunction (upval)
			return if IsVRAppBuildFunction() and GetFFlagLuafiedReportEntryPointsFunction() then if p1.UseLuafiedReportFlow == nil then if IsVRAppBuildFunction() then true else false else p1.UseLuafiedReportFlow elseif GetFFlagEnableAbuseReport10ftFunction() then p1.UseLuafiedReportFlow or false else nil
		end,
		getThrottleFramerate = function() --[[ Line: 416 ]]
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.ThrottleFramerate == nil then not IsVRAppBuildFunction() else p1.ThrottleFramerate
		end,
		getUseRoundedCorners = function() --[[ Line: 419 ]]
			-- upvalues: IsVRAppBuildFunction (upval), p1 (copy)
			return if IsVRAppBuildFunction() then if p1.UseRoundedCorners == nil then if IsVRAppBuildFunction() then true else false else p1.UseRoundedCorners else false
		end,
		getGameInfoShowChatFeatures = function(): boolean --[[ Line: 426 ]]
			return false
		end,
		getDisplayCheckboxInVoiceConsent = function() --[[ Line: 429 ]]
			-- upvalues: GetFFlagSeamlessVoiceConsentToastPolicyFunction (upval), p1 (copy)
			return GetFFlagSeamlessVoiceConsentToastPolicyFunction() and p1.DisplayCheckboxInVoiceConsent or false
		end,
		getExperienceChatAvailability = function() --[[ Line: 435 ]]
			-- upvalues: GetFFlagExpChatGuacChatDisabledReasonFunction (upval), p1 (copy)
			return GetFFlagExpChatGuacChatDisabledReasonFunction() and p1.ExperienceChatAvailability or "unknown"
		end,
		getInCommsRegionBubble = function() --[[ Line: 441 ]]
			-- upvalues: FFlagAEGIS2UseGuacToShowEnabledMessage (upval), p1 (copy)
			return FFlagAEGIS2UseGuacToShowEnabledMessage and p1.InCommsRegionBubble or false
		end,
		getShowInExpFAEUpsell = function() --[[ Line: 447 ]]
			-- upvalues: FFlagAEGIS2UseGuacToShowFAEUpsell (upval), p1 (copy)
			return FFlagAEGIS2UseGuacToShowFAEUpsell and p1.ShowInExpFAEUpsell or false
		end,
		getUseAmpV2WizardForVpc = function() --[[ Line: 455 ]]
			-- upvalues: p1 (copy)
			return p1.UseAmpV2WizardForVpc or false
		end,
		getAmpV2VpcExcludedRequestTypes = function() --[[ Line: 460 ]]
			-- upvalues: p1 (copy)
			return p1.AmpV2VpcExcludedRequestTypes or {}
		end,
		getShowFOMOUpsell = function() --[[ Line: 463 ]]
			-- upvalues: FFlagExpChatUseGuacForFOMOUpsell (upval), p1 (copy)
			return FFlagExpChatUseGuacForFOMOUpsell and p1.ShowFOMOUpsell or false
		end,
		getShowCrossAgeChat = function() --[[ Line: 470 ]]
			-- upvalues: FFlagExpChatUseGuacForCrossAgeChat (upval), p1 (copy)
			return FFlagExpChatUseGuacForCrossAgeChat and p1.ShowCrossAgeExpChat or false
		end,
		getCanSeeChatTerminology = function() --[[ Line: 477 ]]
			-- upvalues: p1 (copy)
			return p1.canSeeChatTerminology or false
		end,
		getAllowCameraMovements = function() --[[ Line: 480 ]]
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.AllowCameraMovements == nil then not IsVRAppBuildFunction() else p1.AllowCameraMovements
		end,
		getShouldSkipAvatarLandingPage = function() --[[ Line: 483 ]]
			-- upvalues: p1 (copy), IsVRAppBuildFunction (upval)
			return if p1.ShouldSkipAvatarLandingPage == nil then if IsVRAppBuildFunction() then true else false else p1.ShouldSkipAvatarLandingPage
		end,
		getShowPassesOnExperienceDetails = function() --[[ Line: 486 ]]
			-- upvalues: p1 (copy)
			return p1.ShowPassesOnExperienceDetails or false
		end,
		getDisableCDLQrCodeForMaquettes = function() --[[ Line: 489 ]]
			-- upvalues: GetFFlagDisableCDLQrCodeForMaquettesFunction (upval), p1 (copy)
			return if GetFFlagDisableCDLQrCodeForMaquettesFunction() then p1.DisableCDLQrCodeForMaquettes else false
		end,
		getDisableIAPEntryPoint = function() --[[ Line: 496 ]]
			-- upvalues: p1 (copy)
			return p1.DisableIAPEntryPoint or false
		end,
		getEnforceAgeRestrictedLogin = function() --[[ Line: 499 ]]
			-- upvalues: p1 (copy)
			return p1.EnforceAgeRestrictedLogin or false
		end,
		getUrlAuthRoutes = function() --[[ Line: 502 ]]
			-- upvalues: p1 (copy)
			local Routes = p1.Routes or {}
			
			return if Routes then Routes.auth or {} else {}
		end,
		getShowDisconnectButton = function() --[[ Line: 511 ]]
			-- upvalues: p1 (copy)
			return p1.ShowDisconnectButton or false
		end,
		getUseSingleSignOn = function() --[[ Line: 514 ]]
			-- upvalues: IsRunningInStudioFunction (upval), p1 (copy)
			return not IsRunningInStudioFunction() and (p1.UseSingleSignOn or false)
		end,
		getGridCarouselSeeAllTilesEnabled = function() --[[ Line: 521 ]]
			-- upvalues: p1 (copy)
			return p1.UseGridCarouselSeeAllTiles or false
		end,
		getSearchWithoutNavigatingEnabled = function() --[[ Line: 524 ]]
			-- upvalues: IsTenFootInterfaceFunction (upval), p1 (copy)
			return not IsTenFootInterfaceFunction() and (p1.SingleSearchPageNoNavigation or false)
		end,
		getGameListCategoryScrollListEnabled = function() --[[ Line: 530 ]]
			-- upvalues: p1 (copy)
			return p1.GetGamesListCategoryTabs or false
		end,
		getForceTheme = function() --[[ Line: 533 ]]
			-- upvalues: CryoModule (upval), ValuesResult (upval), p1 (copy)
			local MapResult = CryoModule.List.map(ValuesResult, function(Text: string): string --[[ Line: 534 ]]
				return Text:lower()
			end)
			
			return if p1.ForceTheme and CryoModule.List.find(MapResult, p1.ForceTheme:lower()) then p1.ForceTheme else nil
		end,
		enableExperienceDetailsPanel = function() --[[ Line: 543 ]]
			-- upvalues: p1 (copy)
			return p1.EnableExperienceDetailsPanel or false
		end,
		getDisableRegularLogin = function(): boolean --[[ Line: 546 ]]
			-- upvalues: p1 (copy)
			return not p1.EnableWebViewSupport and (not p1.EnableRegularLoginWithoutWebViewSupport or false)
		end,
		getAllowPlatformAccountSwitching = function() --[[ Line: 549 ]]
			-- upvalues: p1 (copy)
			return p1.AllowPlatformAccountSwitching or false
		end,
		useLegacyCrossPlayApi = function() --[[ Line: 552 ]]
			-- upvalues: DebugUseLegacyCrossPlayApi (upval), p1 (copy)
			return DebugUseLegacyCrossPlayApi or (p1.useLegacyCrossPlayApi or false)
		end,
		useCrossPlaySystemUi = function() --[[ Line: 555 ]]
			-- upvalues: DebugCrossPlaySystemUi (upval), p1 (copy)
			return DebugCrossPlaySystemUi or (p1.useCrossPlaySystemUi or false)
		end,
		getCrossPlayUri = function() --[[ Line: 558 ]]
			-- upvalues: DebugOverrideCrossPlayUri (upval), p1 (copy)
			return if DebugOverrideCrossPlayUri == "" then p1.crossPlayUri or "" else DebugOverrideCrossPlayUri
		end,
		getCrossPlayCapabilities = function() --[[ Line: 565 ]]
			-- upvalues: CryoModule (upval), p1 (copy), CrossPlayCapabilitiesModule (upval)
			return CryoModule.List.foldLeft(p1.crossPlayCapabilities or {}, function(p2, p3) --[[ Line: 566 ]]
				-- upvalues: CryoModule (upval), CrossPlayCapabilitiesModule (upval)
				return if CryoModule.List.find(p2, p3) then p2 else CryoModule.List.join(p2, { CrossPlayCapabilitiesModule[p3] })
			end, {})
		end,
		getCrossPlaySettingsKey = function() --[[ Line: 576 ]]
			-- upvalues: DebugOverrideCrossPlaySettingsKey (upval), p1 (copy)
			return if DebugOverrideCrossPlaySettingsKey == "" then p1.crossPlaySettingsKey or "" else DebugOverrideCrossPlaySettingsKey
		end,
		getCrossPlayQueryParam = function() --[[ Line: 583 ]]
			-- upvalues: DebugOverrideCrossPlayQueryParam (upval), p1 (copy)
			return if DebugOverrideCrossPlayQueryParam == "" then p1.crossPlayQueryParam or "" else DebugOverrideCrossPlayQueryParam
		end,
		getPromotionalEmailsCheckboxEnabled = function() --[[ Line: 590 ]]
			-- upvalues: p1 (copy)
			return game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") and p1.PromotionalEmailsCheckboxEnabled or false
		end,
		getPromotionalEmailsOptInByDefault = function() --[[ Line: 597 ]]
			-- upvalues: p1 (copy)
			return game:GetFastFlag("LuaAppPromotionalEmailsCheckboxEnabledInAppPolicy") and p1.PromotionalEmailsOptInByDefault or false
		end,
		getSupportsOverscan = function() --[[ Line: 604 ]]
			-- upvalues: p1 (copy)
			return p1.SupportsOverscan or false
		end,
		getUseConsoleGameJoinCard = function() --[[ Line: 607 ]]
			-- upvalues: p1 (copy)
			return p1.UseConsoleGameJoinCard or false
		end,
		getPlatformDisplayName = function() --[[ Line: 610 ]]
			-- upvalues: p1 (copy)
			return p1.platformDisplayName or ""
		end,
		getPlatformAccountName = function() --[[ Line: 613 ]]
			-- upvalues: p1 (copy)
			return p1.platformAccountName or nil
		end,
		getSupportsProfileSwitching = function() --[[ Line: 616 ]]
			-- upvalues: p1 (copy)
			return p1.supportsProfileSwitching or false
		end,
		getMountAllOmniFeedItems = function() --[[ Line: 619 ]]
			-- upvalues: p1 (copy)
			return p1.mountAllOmniFeedItems or false
		end,
		getFriendCodeQrCodeScannerEnabled = function() --[[ Line: 622 ]]
			-- upvalues: p1 (copy)
			return p1.FriendCodeQrCodeScannerEnabled or false
		end,
		getInviteFriendsDisabled = function() --[[ Line: 625 ]]
			-- upvalues: p1 (copy)
			return p1.InviteFriendsDisabled or false
		end,
		getRealNamesInDisplayNamesEnabled = function() --[[ Line: 628 ]]
			-- upvalues: p1 (copy)
			return p1.RealNamesInDisplayNamesEnabled or false
		end,
		getProfileShareLinkEnabled = function() --[[ Line: 631 ]]
			-- upvalues: p1 (copy)
			return p1.ProfileShareLinkEnabled
		end,
		getProfileCopyLinkEnabled = function() --[[ Line: 634 ]]
			-- upvalues: p1 (copy)
			return p1.ProfileCopyLinkEnabled
		end,
		getEnablePremiumUserFeatures = function() --[[ Line: 637 ]]
			-- upvalues: GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction (upval), p1 (copy)
			return if GetFFlagUseEnablePremiumUserFeaturesAppPolicyFunction() then p1.EnablePremiumUserFeatures or false else nil
		end,
		getEnableDualLogin = function() --[[ Line: 643 ]]
			-- upvalues: p1 (copy)
			return p1.enableDualLogin or false
		end,
		getUseExternalBrowserForAgeGuidelines = function() --[[ Line: 647 ]]
			-- upvalues: GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction (upval), p1 (copy)
			return if GetFFlagUseExternalBrowserForAgeGuidelines10ftFunction() then p1.UseExternalBrowserForAgeGuidelines or false else nil
		end,
		getEnableHomePageAgeBlock = function() --[[ Line: 654 ]]
			-- upvalues: p1 (copy)
			return p1.EnableHomePageAgeBlock or false
		end,
		getEnableUAppAccessBlock = function() --[[ Line: 657 ]]
			-- upvalues: p1 (copy)
			return p1.EnableUAppAccessBlock or false
		end,
		getUAppBlockPageTextMapKey = function() --[[ Line: 660 ]]
			-- upvalues: p1 (copy)
			return p1.UAppBlockPageTextMapKey or nil
		end,
		getUAppBlockPageShouldDisableLogOut = function() --[[ Line: 663 ]]
			-- upvalues: p1 (copy)
			return p1.UAppBlockPageShouldDisableLogOut or nil
		end,
		getContactsToastEnabled = function() --[[ Line: 666 ]]
			-- upvalues: p1 (copy)
			return p1.ContactsToastEnabled or false
		end,
		getEnableProfileQrCode = function() --[[ Line: 669 ]]
			-- upvalues: p1 (copy)
			return p1.EnableProfileQrCode or false
		end,
		getCanRenderTransferOnProfile = function() --[[ Line: 672 ]]
			-- upvalues: FFlagGuacCanRenderTransferOnProfile (upval), p1 (copy)
			return FFlagGuacCanRenderTransferOnProfile and p1.CanRenderTransferOnProfile or false
		end,
		getShowVNGLoginWithExistingAccountQuickLoginButton = function() --[[ Line: 678 ]]
			-- upvalues: p1 (copy)
			return p1.ShowVNGLoginWithExistingAccountQuickLoginButton or false
		end,
		getUseCrossDeviceLoginByDefault = function() --[[ Line: 681 ]]
			-- upvalues: p1 (copy)
			return p1.UseCrossDeviceLoginByDefault or false
		end,
		getShowVNGAge12Badge = function() --[[ Line: 684 ]]
			-- upvalues: p1 (copy)
			return p1.ShowVNGAge12Badge or false
		end,
		getShowBrazilContentRatingLogo = function() --[[ Line: 687 ]]
			-- upvalues: p1 (copy)
			return p1.ShowBrazilContentRatingLogo or false
		end,
		getUseVNGUserAgreementPopup = function() --[[ Line: 690 ]]
			-- upvalues: p1 (copy)
			return p1.UseVNGUserAgreementPopup or false
		end,
		getRedirectBuyRobuxToVNG = function() --[[ Line: 693 ]]
			-- upvalues: p1 (copy)
			return p1.RedirectBuyRobuxToVNG or false
		end,
		getShowVNGTosForRobuxUpsell = function() --[[ Line: 696 ]]
			-- upvalues: p1 (copy)
			return p1.ShowVNGTosForRobuxUpsell or false
		end,
		getBlockVNGU12SignUpOnClientSide = function() --[[ Line: 699 ]]
			-- upvalues: p1 (copy)
			return p1.BlockVNGU12SignUpOnClientSide or false
		end,
		getUseAgeInput = function() --[[ Line: 702 ]]
			-- upvalues: p1 (copy)
			return p1.UseAgeInput or false
		end,
		getLoginUsernameOnly = function() --[[ Line: 705 ]]
			-- upvalues: p1 (copy)
			return p1.LoginUsernameOnly or false
		end,
		getDisableEmailOTPLogin = function() --[[ Line: 708 ]]
			-- upvalues: p1 (copy)
			return p1.DisableEmailOTPLogin or false
		end,
		getDisableLoginForgotButton = function() --[[ Line: 711 ]]
			-- upvalues: p1 (copy)
			return p1.DisableLoginForgotButton or false
		end,
		getDisableLogOutEmailUpsell = function() --[[ Line: 714 ]]
			-- upvalues: p1 (copy)
			return p1.DisableLogOutEmailUpsell or false
		end,
		getVerifiedSignupCountry = function() --[[ Line: 717 ]]
			-- upvalues: p1 (copy)
			return p1.verifiedSignupCountry or false
		end,
		getParentalConsentAgreementId = function() --[[ Line: 721 ]]
			-- upvalues: p1 (copy)
			return p1.parentalConsentAgreementId or ""
		end,
		getIsStrictComplianceEnabled = function() --[[ Line: 725 ]]
			-- upvalues: p1 (copy)
			return p1.isStrictComplianceEnabled or false
		end,
		getUseKoreaKISAUserAgreementPopup = function() --[[ Line: 729 ]]
			-- upvalues: p1 (copy)
			return p1.useKoreaKISAUserAgreementPopup or false
		end,
		getEnableNotificationPreferencesPage = function() --[[ Line: 733 ]]
			-- upvalues: GetFFlagEnableGateNotificationPreferencesTabFunction (upval), p1 (copy)
			return if GetFFlagEnableGateNotificationPreferencesTabFunction() then p1.EnableNotificationPreferencesPage or false else nil
		end,
		getVNGFormRequired = function() --[[ Line: 740 ]]
			-- upvalues: p1 (copy)
			return p1.VNGFormRequired or false
		end,
		getUpsellVoiceForPhoneVerification = function() --[[ Line: 743 ]]
			-- upvalues: p1 (copy)
			return p1.UpsellVoiceForPhoneVerification or false
		end,
		getIsLinkedVRModeAvailable = function(): boolean --[[ Line: 746 ]]
			-- upvalues: UserInputService (upval)
			local Platform = UserInputService:GetPlatform()
			
			return Platform == Enum.Platform.Windows or Platform == Enum.Platform.UWP
		end,
		getShouldShowPhoneUpsell = function() --[[ Line: 750 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldShowPhoneUpsell or false
		end,
		getTermsOfUseLink = function() --[[ Line: 753 ]]
			-- upvalues: p1 (copy)
			return p1.TermsOfUseLink or ""
		end,
		getPrivacyPolicyLink = function() --[[ Line: 756 ]]
			-- upvalues: p1 (copy)
			return p1.PrivacyPolicyLink or ""
		end,
		getVngAppUpsell = function() --[[ Line: 759 ]]
			-- upvalues: FFlagLuaAppHomeVngAppUpsell (upval), p1 (copy)
			return FFlagLuaAppHomeVngAppUpsell and p1.VngAppUpsell or false
		end,
		getVngAppUpsellPcLayout = if FFlagVngAppUpsellPcLayout then function() --[[ Line: 767 ]]
			-- upvalues: p1 (copy)
			return p1.VngAppUpsellPcLayout or false
		end else nil,
		getShouldHideContactImporterUpsell = function() --[[ Line: 771 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldHideContactImporterUpsell or false
		end,
		getContactImporterEncouraged = function() --[[ Line: 774 ]]
			-- upvalues: p1 (copy)
			return p1.contactImporterEncouraged or false
		end,
		getFriendRequestNicknamesEnabled = function(): boolean --[[ Line: 777 ]]
			return false
		end,
		getShouldShowVpcPlayButtonUpsells = if FFlagLuaAppParentUpsellPolicy then function() --[[ Line: 781 ]]
			-- upvalues: p1 (copy)
			return p1.shouldShowVpcPlayButtonUpsells or false
		end else nil,
		getDisablePlayableWhenLoading = if FFlagLuaAppSupportDisablePlayableWhenLoading then function() --[[ Line: 786 ]]
			-- upvalues: p1 (copy)
			return p1.DisablePlayableWhenLoading or false
		end else nil,
		getRenamePaymentsToSpendingTab = function() --[[ Line: 790 ]]
			-- upvalues: p1 (copy)
			return p1.renamePaymentsToSpendingTab or false
		end,
		getNotificationsCanReceiveStream = function() --[[ Line: 795 ]]
			-- upvalues: GetFFlagNotificationsComplianceShouldRestrictStreamFunction (upval), p1 (copy)
			return if GetFFlagNotificationsComplianceShouldRestrictStreamFunction() then p1.notificationsCanAccessStream or false else nil
		end,
		getNotificationsCanReceivePush = function() --[[ Line: 802 ]]
			-- upvalues: p1 (copy)
			return p1.notificationsCanAccessPush or false
		end,
		getPushNotificationsUpsell = function() --[[ Line: 805 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldShowPushNotificationsUpsell or false
		end,
		getNotificationsCanReceiveExperience = function() --[[ Line: 808 ]]
			-- upvalues: p1 (copy)
			return p1.notificationsCanAccessExperience == nil or p1.notificationsCanAccessExperience
		end,
		getDisableResellingCollectiblesForCompliance = function() --[[ Line: 814 ]]
			-- upvalues: p1 (copy)
			return p1.DisableResellingCollectiblesForCompliance or false
		end,
		getShowIllegalContentReportingUI = function() --[[ Line: 817 ]]
			-- upvalues: DebugForceShowIllegalContentReportingUI (upval), p1 (copy)
			return DebugForceShowIllegalContentReportingUI or (p1.ShowIllegalContentReportingUI or false)
		end,
		getEligibleForContentPostFeed = function() --[[ Line: 820 ]]
			-- upvalues: p1 (copy)
			return p1.EligibleForContentPostFeed or false
		end,
		getEligibleForExternalContentSharing = function() --[[ Line: 823 ]]
			-- upvalues: p1 (copy)
			return p1.EligibleForExternalContentSharing or false
		end,
		getEnableContinuousLoad = function() --[[ Line: 826 ]]
			-- upvalues: p1 (copy)
			return p1.EnableContinuousLoad or false
		end,
		getEnableAggregateLikesFavoritesCount = function() --[[ Line: 829 ]]
			-- upvalues: p1 (copy)
			return p1.EnableAggregateLikesFavoritesCount or false
		end,
		getShowUpdatedCameraPath = function() --[[ Line: 832 ]]
			-- upvalues: p1 (copy)
			return p1.showUpdatedCameraPath or false
		end,
		getRenameParentEmailForVerificationUpsell = function() --[[ Line: 835 ]]
			-- upvalues: FFlagRenameParentEmailForVerificationUpsellFunction (upval), p1 (copy)
			return FFlagRenameParentEmailForVerificationUpsellFunction() and p1.renameParentEmailForVerificationUpsell or false
		end,
		getKeystrokeCollectionEnabled = function() --[[ Line: 842 ]]
			-- upvalues: p1 (copy)
			return game:GetFastFlag("BehaviorCollectionControlEnabled") and p1.EnableKeystrokeCollection or false
		end,
		getCanUsePlatformChat = function() --[[ Line: 850 ]]
			-- upvalues: UseOriginalPlatformChatPolicy (upval), p1 (copy), FFlagAppChatOnConsoles (upval)
			return (if UseOriginalPlatformChatPolicy then p1.CanUsePlatformChat elseif FFlagAppChatOnConsoles then p1.CanUsePlatformChat2 else p1.CanUsePlatformChat) or false
		end,
		getCanSeeChatTab = function() --[[ Line: 860 ]]
			-- upvalues: UseOriginalPlatformChatPolicy (upval), p1 (copy), FFlagAppChatOnConsoles (upval)
			return (if UseOriginalPlatformChatPolicy then p1.CanSeeChatTab elseif FFlagAppChatOnConsoles then p1.CanSeeChatTab2 else p1.CanSeeChatTab) or false
		end,
		getCanSeeFriendsTab = function(): boolean --[[ Line: 874 ]]
			-- upvalues: FFlagFriendsChatOsaSystemMessage (upval), FFlagFriendsChatDiscloseUpdateSecondVersion (upval), FFlagFriendsChatEnableConversationConsent (upval), FFlagFriendsChatHasFriendsGate (upval), p1 (copy)
			local config = {
				VR = false,
				Console = false,
				Gamepad = false,
				ContextCard = FFlagFriendsChatOsaSystemMessage,
				ContextCardUkCopy = FFlagFriendsChatDiscloseUpdateSecondVersion and FFlagFriendsChatOsaSystemMessage,
				ConversationConsent = FFlagFriendsChatEnableConversationConsent,
				FriendCountGate = FFlagFriendsChatHasFriendsGate
			}
			local FriendsTabRequiredCapabilities = p1.FriendsTabRequiredCapabilities or {}
			for _, friendsTabRequiredCapability in FriendsTabRequiredCapabilities do
				if not config[friendsTabRequiredCapability] then
					return false
				end
			end
			return true
		end,
		getHidesGamesTab = function() --[[ Line: 896 ]]
			-- upvalues: FFlagEnableAndroidTvAppPolicies (upval), p1 (copy)
			return FFlagEnableAndroidTvAppPolicies and p1.HidesGamesTab or false
		end,
		getShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 904 ]]
			-- upvalues: GetFFlagEnableMultiPageSignupFunction (upval), p1 (copy)
			return not GetFFlagEnableMultiPageSignupFunction() or (p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup == nil or p1.ShowTermsAndPrivacyPolicyLinksForAllPagesU13Signup)
		end,
		getAgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages = function() --[[ Line: 913 ]]
			-- upvalues: GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignupFunction (upval), GetFFlagEnableMultiPageSignupFunction (upval), p1 (copy)
			local FIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup = GetFIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignupFunction()
			
			return if GetFFlagEnableMultiPageSignupFunction() then if p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages == nil then FIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup else p1.AgeCutoffForShowDisclaimerLinkForUnderageSignupsOnAllSignupPages else FIntExclusiveFallbackExclusiveUnderageCutoffForMultiPageSignup
		end,
		getRobuxUpsellFlowMobile = function() --[[ Line: 923 ]]
			-- upvalues: p1 (copy)
			return p1.useMobileRobuxUpsellFlow or false
		end,
		getUsePaymentPlatformMicrosoftStore = function() --[[ Line: 926 ]]
			-- upvalues: FFlagEnableMicrosoftStorePaymentsPlatform (upval), p1 (copy)
			return FFlagEnableMicrosoftStorePaymentsPlatform and p1.usePaymentPlatformMicrosoftStore or false
		end,
		getMicSettingsDirectionsLocaleKey = function() --[[ Line: 933 ]]
			-- upvalues: p1 (copy)
			return p1.micSettingsDirectionsLocaleKey or nil
		end,
		getMicSettingsDeeplinkDirectionsLocaleKey = function() --[[ Line: 936 ]]
			-- upvalues: p1 (copy)
			return p1.micSettingsDeeplinkDirectionsLocaleKey or nil
		end,
		getRequiresAppRestartOnMicAccessChange = function() --[[ Line: 939 ]]
			-- upvalues: p1 (copy)
			return p1.requiresAppRestartOnMicAccessChange or false
		end,
		getRenameFriendsToConnections = function() --[[ Line: 942 ]]
			-- upvalues: FFlagEnableFriendsRenamingForAll (upval), p1 (copy)
			return if FFlagEnableFriendsRenamingForAll then true else p1.renameFriendsToConnections or false
		end,
		getShareSheetEnabled = function() --[[ Line: 948 ]]
			-- upvalues: p1 (copy)
			return p1.shareSheetEnabled or false
		end,
		getCanAccessTrustedContacts = function() --[[ Line: 951 ]]
			-- upvalues: p1 (copy)
			return p1.canAccessTrustedContacts or false
		end,
		getExperienceDetailsNoticeType = function() --[[ Line: 954 ]]
			-- upvalues: p1 (copy)
			return p1.experienceDetailsNoticeType or nil
		end,
		getRequiresOSAFriendingEducation = function() --[[ Line: 957 ]]
			-- upvalues: p1 (copy)
			return p1.requiresOSAFriendingEducation or false
		end,
		getSocialGraphSyncEnabled = function() --[[ Line: 960 ]]
			-- upvalues: p1 (copy)
			return p1.SocialGraphSyncEnabled or false
		end,
		getAccountDisambiguationDisabled = function() --[[ Line: 963 ]]
			-- upvalues: p1 (copy)
			return p1.AccountDisambiguationDisabled or false
		end,
		getHasWebViewSupportForFAE = function() --[[ Line: 966 ]]
			-- upvalues: p1 (copy)
			return p1.hasWebViewSupportForFAE or false
		end,
		getLinkedAuthEndpointsEnabled = function() --[[ Line: 969 ]]
			-- upvalues: p1 (copy)
			return p1.LinkedAuthEndpointsEnabled or false
		end,
		getLinkingPlatform = function() --[[ Line: 972 ]]
			-- upvalues: p1 (copy)
			return p1.LinkingPlatform or nil
		end,
		getUsePaymentPlatformMilkyWayStore = function() --[[ Line: 975 ]]
			-- upvalues: FFlagEnableMilkyWayPaymentsPlatformV2 (upval), p1 (copy)
			return FFlagEnableMilkyWayPaymentsPlatformV2 and p1.usePaymentPlatformMilkyWayStore or false
		end,
		getScreentimeMoreTimeOptionEnabled = function() --[[ Line: 981 ]]
			-- upvalues: FFlagEnableScreentimeMoreTimeOption (upval), p1 (copy)
			return FFlagEnableScreentimeMoreTimeOption and p1.ScreentimeMoreTimeOptionEnabled or false
		end,
		getDisablePremiumEntrypoint = function() --[[ Line: 987 ]]
			-- upvalues: FlyoutDisablePremiumEntrypoint1 (upval), p1 (copy)
			return FlyoutDisablePremiumEntrypoint1 and (p1.DisablePremiumEntrypoint or p1.DisablePremiumEntryPoint) or false
		end,
		getDisableBlackbirdEntrypoints = function() --[[ Line: 993 ]]
			-- upvalues: GuacDisableBlackbirdEntrypoints (upval), p1 (copy)
			return GuacDisableBlackbirdEntrypoints and p1.DisableBlackbirdEntrypoints or false
		end,
		getEnableGiftcardsWithRedeem = function() --[[ Line: 999 ]]
			-- upvalues: FlyoutEnableGiftcardsWithRedeem (upval), p1 (copy)
			return FlyoutEnableGiftcardsWithRedeem and p1.EnableGiftcardsWithRedeem or false
		end,
		getGiftCardSourceRefOverride = function() --[[ Line: 1005 ]]
			-- upvalues: p1 (copy)
			return p1.GiftCardSourceRefOverride or ""
		end,
		getSignupCheckboxDisabled = function() --[[ Line: 1008 ]]
			-- upvalues: GuacAppPolicyDisableSignupCheckbox (upval), p1 (copy)
			return GuacAppPolicyDisableSignupCheckbox and p1.DisableSignupCheckbox or false
		end,
		getShouldShowFaceIDText = function() --[[ Line: 1014 ]]
			-- upvalues: FFlagEnableFaceIDTextOnAddAuthMethodPage (upval), p1 (copy)
			return FFlagEnableFaceIDTextOnAddAuthMethodPage and p1.ShouldShowFaceIDText or false
		end,
		getExcludeCrossDeviceSignIn = function() --[[ Line: 1021 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludeCrossDeviceSignIn or false
		end,
		getExcludePasskeyLogin = function() --[[ Line: 1024 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludePasskeyLogin or false
		end,
		getExcludeExternalIdentityLogin = function(): boolean --[[ Line: 1027 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludeExternalIdentityLogin ~= false
		end,
		getExternalIdentityAppleUsesBrowserSignIn = function() --[[ Line: 1030 ]]
			-- upvalues: p1 (copy)
			return p1.ExternalIdentityAppleUsesBrowserSignIn or false
		end,
		getExcludeExternalIdentityOtherSignInOptions = function(): boolean --[[ Line: 1033 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludeExternalIdentityOtherSignInOptions ~= false
		end,
		getExcludeUsernamePasswordSignIn = function() --[[ Line: 1037 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludeUsernamePasswordSignIn or false
		end,
		getExcludeEmailPasswordSignIn = function() --[[ Line: 1040 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludeEmailPasswordSignIn or false
		end,
		getExcludePhoneNumberPasswordSignIn = function() --[[ Line: 1043 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludePhoneNumberPasswordSignIn or false
		end,
		getExcludeAccountSwitcher = function() --[[ Line: 1046 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludeAccountSwitcher or false
		end,
		getAccountSwitcherEnabled = function() --[[ Line: 1049 ]]
			-- upvalues: p1 (copy)
			return p1.AccountSwitcherEnabled or false
		end,
		getAccountPickerEnabled = function() --[[ Line: 1052 ]]
			-- upvalues: p1 (copy)
			return p1.AccountPickerEnabled or false
		end,
		getExcludeUsernameUpdateModeration = function() --[[ Line: 1055 ]]
			-- upvalues: p1 (copy)
			return p1.ExcludeUsernameUpdateModeration or false
		end,
		getMorePageExitButtonEnabled = if FFlagEnableMorePageExitButtonSupport then function() --[[ Line: 1059 ]]
			-- upvalues: p1 (copy)
			return p1.MorePageExitButtonEnabled or false
		end else nil,
		getMoreGridDirectionalLayoutPreferred = if FFlagEnableMorePageDirectionalLayoutRolloutFix then function() --[[ Line: 1064 ]]
			-- upvalues: p1 (copy)
			return p1.MoreGridDirectionalLayoutPreferred or false
		end else nil,
		getShouldUseDMCCALegalDisclosureInApp = function() --[[ Line: 1068 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldUseDMCCALegalDisclosureInApp or false
		end,
		getCanAccessParty = function() --[[ Line: 1071 ]]
			-- upvalues: p1 (copy)
			return p1.CanAccessParty == nil or p1.CanAccessParty
		end,
		getRedeemTileEnabled = function() --[[ Line: 1077 ]]
			-- upvalues: p1 (copy)
			return p1.RedeemTileEnabled or false
		end,
		getMomentsFeatureList = function() --[[ Line: 1081 ]]
			-- upvalues: DebugMomentsFeatureList (upval), p1 (copy)
			return if DebugMomentsFeatureList and DebugMomentsFeatureList ~= "" then string.split(DebugMomentsFeatureList, ",") elseif p1.MomentsFeatureList == nil then {} else p1.MomentsFeatureList
		end,
		getSupportCenterEnabled = if GetFFlagEnableSupportCenterFunction() then function() --[[ Line: 1088 ]]
			-- upvalues: p1 (copy)
			return p1.SupportCenterEnabled or false
		end else nil,
		getShouldUseVibrationInsteadOfHaptics = function() --[[ Line: 1092 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldUseVibrationInsteadOfHaptics or false
		end,
		getRawPolicy = function() --[[ Line: 1095 ]]
			-- upvalues: p1 (copy)
			return p1
		end,
		getStickyShortcutBarEnabled = function() --[[ Line: 1098 ]]
			-- upvalues: p1 (copy)
			return p1.StickyShortcutBarEnabled or false
		end,
		getAccountType = if FFlagEnableCoreContentAccountType then function() --[[ Line: 1102 ]]
			-- upvalues: p1 (copy)
			return p1.AccountType
		end else nil,
		getCoreContentBadgeText = if FFlagEnableCoreContentBadge then function() --[[ Line: 1107 ]]
			-- upvalues: p1 (copy)
			return p1.CoreContentBadgeText
		end else nil,
		getShowUncheckedBadge = if FFlagEnableFlyoutUncheckedBadge or FFlagEnableNonFlyoutUncheckedBadge then function() --[[ Line: 1112 ]]
			-- upvalues: p1 (copy)
			return p1.ShowUncheckedBadge
		end else nil,
		getShowUncheckedBadgeForAccountSwitcher = function() --[[ Line: 1116 ]]
			-- upvalues: GetFFlagEnableAccountSwitcherUncheckedBadgeFunction (upval), p1 (copy)
			return if GetFFlagEnableAccountSwitcherUncheckedBadgeFunction() then p1.ShowUncheckedBadge else false
		end,
		getShowGameAgeRating = if FFlagShowGameAgeRating then function() --[[ Line: 1123 ]]
			-- upvalues: p1 (copy)
			return p1.ShowGameAgeRating or false
		end else nil,
		getShowBadgeOver12 = if FFlagShowGameAgeRating then nil else function() --[[ Line: 1128 ]]
			-- upvalues: p1 (copy)
			return p1.ShowBadgeOver12 or false
		end,
		getDefaultTheme = if FFlagDefaultKidsToDarkTheme then function() --[[ Line: 1133 ]]
			-- upvalues: p1 (copy)
			return p1.DefaultTheme
		end else nil,
		getDevicePreferencesPersistentPresenceVariant = if FFlagMacMenuBarContentUpdates then function() --[[ Line: 1138 ]]
			-- upvalues: p1 (copy)
			return p1.DevicePreferencesPersistentPresenceVariant
		end else nil,
		getCancelSearchOnLostFocus = if FFlagUsesCancelSearchAppPolicy then function() --[[ Line: 1143 ]]
			-- upvalues: p1 (copy)
			return p1.CancelSearchOnLostFocus == nil or p1.CancelSearchOnLostFocus
		end else nil,
		getCanViewBuild = if FFlagAppNavMyStatsTab then function() --[[ Line: 1151 ]]
			-- upvalues: p1 (copy)
			return p1.CanViewBuild or false
		end else nil,
		getCanUseBuild = if FFlagAppNavMyStatsTab then function() --[[ Line: 1156 ]]
			-- upvalues: p1 (copy)
			return p1.CanUseBuild or false
		end else nil,
		getShouldFullscreenElementsIgnoreSafeArea = function() --[[ Line: 1160 ]]
			-- upvalues: p1 (copy)
			return p1.ShouldFullscreenElementsIgnoreSafeArea or false
		end,
		getPinExperienceTargetDestination = if FFlagAddPinExperienceTargetDestinationGUACPolicy then function() --[[ Line: 1164 ]]
			-- upvalues: p1 (copy)
			return p1.PinExperienceTargetDestination or "HomeScreen"
		end else nil,
		getFlyoutSidePanelEnabled = function() --[[ Line: 1168 ]]
			-- upvalues: FFlagFlyoutSidePanelUseAppPolicy (upval), p1 (copy)
			return FFlagFlyoutSidePanelUseAppPolicy and p1.FlyoutSidePanelEnabled or false
		end,
		getLearnPlaceEnabled = function() --[[ Line: 1174 ]]
			-- upvalues: FFlagFlyoutGateLearnPlace (upval), p1 (copy)
			return not FFlagFlyoutGateLearnPlace or (p1.LearnPlaceEnabled or false)
		end
	}
end