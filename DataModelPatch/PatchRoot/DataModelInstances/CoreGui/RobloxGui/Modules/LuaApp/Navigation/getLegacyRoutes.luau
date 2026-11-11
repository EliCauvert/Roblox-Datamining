local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.Navigation)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local CreateLazyComponentFunction = require(CorePackages.Workspace.Packages.RoactUtils).Components.createLazyComponent
local TenFootUiCommonModule = require(CorePackages.Workspace.Packages.TenFootUiCommon)
local ScreenKind = TenFootUiCommonModule.TenFootUiRNTypes.ScreenKind
local GlobalNavDisplayOption = TenFootUiCommonModule.TenFootUiRNTypes.GlobalNavDisplayOption
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local WrapAppPageForRoactNavigationModule = require(Modules.LuaApp.Navigation.wrapAppPageForRoactNavigation)
local WrapPageInScreenGuiModule = require(Modules.LuaApp.Navigation.wrapPageInScreenGui)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local WebViewWindowModule = require(Modules.LuaApp.Enum.WebViewWindow)
local AppPagePropertiesModule = require(Modules.LuaApp.AppPageProperties)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagShareTargetGameCleanup = SharedFlagsModule.FFlagShareTargetGameCleanup
local FFlagEnableBlackbird = SharedFlagsModule.FFlagEnableBlackbird
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusImmersiveNav = SharedFlagsModule.FFlagEnableArgusImmersiveNav
local FFlagMomentsWatchSessionalization = SharedFlagsModule.FFlagMomentsWatchSessionalization
local FFlagEnableAccountUnlockDeepLink = SharedFlagsModule.FFlagEnableAccountUnlockDeepLink
local FFlagReworkPurchaseRobuxPageModule = require(Modules.LuaApp.Flags.FFlagReworkPurchaseRobuxPage)
local GetFFlagWebViewServiceHasBackButtonVisibilityModule = require(Modules.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility)
local FFlagLuaAppEnableStratusStreamingTestOnly = SharedFlagsModule.FFlagLuaAppEnableStratusStreamingTestOnly
local LazyComponent = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.VideoServerScreen).VideoServerScreenContainer
end)
local LazyComponent1 = if FFlagAppNavMyStatsTab then CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.BuildExperience).BuildPage
end) else nil
local config = {
	SafetySupportPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.SafetySupportPage)
	end),
	DeviceSettingsPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.DeviceSettings.DeviceSettingsPage)
	end),
	AppInformation = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.AppInformationPage)
	end),
	DevSubsPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.More.DevSubsPage)
	end),
	TencentNoticeCenterPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.Luobu.Components.More.TencentNoticeCenter.TencentNoticeCenterPage)
	end),
	TencentNoticeContentPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.Luobu.Components.More.TencentNoticeCenter.TencentNoticeContentPage)
	end)
}
local config1 = {
	LoginV2MonoWrapper = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.LoginV2MonoWrapper)
	end),
	AccountRecoveryMonoWrapper = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.AccountSecurity.AccountRecoveryMonoWrapper)
	end),
	UAppBlockPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.UAppBlockPage)
	end),
	LandingPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.LandingPage)
	end),
	LuobuLandingPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.Luobu.Components.Authentication.LuobuLandingPage)
	end),
	BirthdayPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.BirthdayPage)
	end),
	LuobuSignUpPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.Luobu.Components.Authentication.LuobuSignUpPage)
	end),
	AddAuthMethodPage = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.Authentication.AddAuthMethodPage)
	end),
	PasskeyUpsellScreen = CreateLazyComponentFunction(function()
		-- upvalues: CorePackages (copy)
		return require(CorePackages.Workspace.Packages.PasskeyUpsell).Components.PasskeyUpsellScreen
	end),
	PlatformLockedPage = CreateLazyComponentFunction(function()
		-- upvalues: CorePackages (copy)
		return require(CorePackages.Workspace.Packages.PlatformRestricted).Components.PlatformLockedPage
	end),
	CaptchaPageBrowserServiceWrapper = CreateLazyComponentFunction(function()
		-- upvalues: Modules (copy)
		return require(Modules.LuaApp.Components.CaptchaPageBrowserServiceWrapper)
	end),
	NotApprovedPage = CreateLazyComponentFunction(function()
		-- upvalues: CorePackages (copy)
		return require(CorePackages.Workspace.Packages.NotApprovedPage).NotApprovedPageV2
	end)
}
local LazyComponent2 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector)
end)
local LazyComponent3 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.BlackbirdPageWrapper)
end)
local LazyComponent4 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Passes.PassesPage)
end)
local LazyComponent5 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.InviteLinkExpiredModal.api).InviteLinkExpiredModal
end)
local LazyComponent6 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ShareLinkInvalidModal.api).ShareLinkInvalidModal
end)
local LazyComponent7 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ProfileQRCodePage.api).ProfileQRCodeEntryPoint
end)
local LazyComponent8 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.SocialMessageToast.api).RootScreen
end)
local LazyComponent9 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.EditProfile.EditUsernameWrapper)
end)
local LazyComponent10 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AccountSelector).AccountSelectorPeekView
end)
local LazyComponent11 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AccountSelector).AccountSwitchingAddAccountPeekView
end)
local LazyComponent12 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.VirtualEvents).ShareEventModal
end)
local LazyComponent13 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.VerifiedBadges).AboutVerifiedBadgeModal
end)
local LazyComponent14 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.VirtualEvents.EventDetailsWrapper)
end)
local LazyComponent15 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.VirtualEvents.EventNotificationsModalWrapper)
end)
local LazyComponent16 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.YouTubePageWrapper)
end)
local LazyComponent17 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.GenericWebPageWrapper)
end)
local LazyComponent18 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.GenericNativePageWrapper)
end)
local LazyComponent19 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.ShareTargetGame.Components.ShareTargetGameEntrypoint)
end)
local LazyComponent20 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.WeChatLoginWrapper)
end)
local LazyComponent21 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativeViewUserProfileWrapper)
end)
local LazyComponent22 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativeViewProfileWrapper)
end)
local LazyComponent23 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativePageWithUrlWrapper)
end)
local LazyComponent24 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativeReportAbuseWrapper)
end)
local LazyComponent25 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.NativePurchaseRobuxPageWrapper)
end)
local LazyComponent26 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.More.AccountInfoPage)
end)
local LazyComponent27 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.ShareSheetWrapper)
end)
local LazyComponent28 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.SdkShareWrapper)
end)
local LazyComponent29 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.Luobu.Components.More.TencentHelp.TencentHelpWrapper)
end)
local LazyComponent30 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.TutorialUpsell).Components.TutorialUpsellScreen
end)
local LazyComponent31 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Authentication.VerificationUpsell.PhoneVerificationNativeWrapper)
end)
local LazyComponent32 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.SettingsNativeWrapper)
end)
local LazyComponent33 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.More.ParentVerificationPage)
end)
local LazyComponent34 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.WebView.AppWebView)
end)
local LazyComponent35 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Challenge.HybridOverlayPage)
end)
local LazyComponent36 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Challenge.HybridWebView)
end)
local LazyComponent37 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.ChallengeDialog).ChallengeDialogModalContainer
end)
local LazyComponent38 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.AvatarExperience.Common.Components.RoactNavigation.AppRouterWrapper.AvatarExperienceWrapper)
end)
local LazyComponent39 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AmpUpsell).IDVUpsellContainer
end)
local LazyComponent40 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AmpUpsell).VPCUpsellContainer
end)
local LazyComponent41 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AmpUpsell.RobloxSubscriptionUpsellScreen)
end)
local LazyComponent42 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AgeVerification.AgeVerificationModal)
end)
local LazyComponent43 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.RobuxUpsell.RobuxUpsellContainer)
end)
local LazyComponent44 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Subscription.Purchase.SubscriptionPurchaseContainer)
end)
local LazyComponent45 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.BuyRobux.BuyRobuxContainer)
end)
local LazyComponent46 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AbuseReporting.ReportContainer)
end)
local LazyComponent47 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.Games.SponsoredTooltipPeekView)
end)
local LazyComponent48 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.AppBlox).InfoPeekView
end)
local LazyComponent49 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AmpUpsell.AccountSettingsUpsellWrapper)
end)
local LazyComponent50 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AmpUpsell.AmpWizardContainerWrapper)
end)
local LazyComponent51 = CreateLazyComponentFunction(function()
	-- upvalues: Modules (copy)
	return require(Modules.LuaApp.Components.AccountUnlock.AccountUnlockDeepLinkPageWrapper)
end)
local LazyComponent52 = CreateLazyComponentFunction(function()
	-- upvalues: CorePackages (copy)
	return require(CorePackages.Workspace.Packages.PhoneUpsell).VoiceTrialUpsell
end)
local config2 = {
	GetFFlagEnableUnifiedStaticWebViews = require(Modules.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews),
	GetFFlagLuaAppUseSettingsNativeWrapper = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseSettingsNativeWrapper),
	GetFFlagLuaAppLuaBuyRobuxPage = require(Modules.LuaApp.Flags.GetFFlagLuaAppLuaBuyRobuxPage),
	GetFFlagEnableAccountSettingsUpsell = require(Modules.LuaApp.Flags.GetFFlagEnableAccountSettingsUpsell),
	GetFFlagEnableAmpUpsellWizard = require(Modules.LuaApp.Flags.GetFFlagEnableAmpUpsellWizard),
	GetFFlagEnableAmpIDVUpsellSupport = require(CorePackages.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpIDVUpsellSupport,
	GetFFlagEnableAmpSubscriptionUpsell = require(CorePackages.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpSubscriptionUpsell,
	GetFFlagLuaAppChallengeDialogContainerPageEnabled = require(CorePackages.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled,
	GetFFlagEnableTransparentNativeChallengeWrapper = require(Modules.LuaApp.Flags.GetFFlagEnableTransparentNativeChallengeWrapper)
}
local UseGameDetailsPeekViewModule = require(Modules.LuaApp.Flags.UseGameDetailsPeekView)
local FFlagEnableLuaLoginRevamp = SharedFlagsModule.FFlagEnableLuaLoginRevamp
local GetFFlagEnableLuafiedRecoveryFlow = SharedFlagsModule.GetFFlagEnableLuafiedRecoveryFlow
local GetFFlagEnableVoiceTrialUpsellCardModule = require(Modules.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard)
local GetFFlagEnableSecurityAlertDeeplinkFunction = SharedFlagsModule.GetFFlagEnableSecurityAlertDeeplink
local FFlagPasskeyUpsellEnabled = SharedFlagsModule.FFlagPasskeyUpsellEnabled
local GetFFlagEnablePlatformRestrictedEventReceiverFunction = SharedFlagsModule.GetFFlagEnablePlatformRestrictedEventReceiver
local FFlagTutorialUpsellEnabled = SharedFlagsModule.FFlagTutorialUpsellEnabled
local FFlagLuaAppSduiEventDetailsEnabled = SharedFlagsModule.FFlagLuaAppSduiEventDetailsEnabled

local function getLegacyNavigationOptions(FAEUpsell)
	-- upvalues: AppPagePropertiesModule (copy), UseGameDetailsPeekViewModule (copy), AppPage (copy), AvatarScreen (copy)
	local RenderUnderlyingPage = (AppPagePropertiesModule[FAEUpsell] or {}).renderUnderlyingPage or false
	
	return {
		transparent = RenderUnderlyingPage,
		overlayEnabled = (not UseGameDetailsPeekViewModule() or FAEUpsell ~= AppPage.GameDetail) and (FAEUpsell ~= AvatarScreen.ItemDetails and FAEUpsell ~= AppPage.SocialMessageToast and FAEUpsell ~= AppPage.AccountSelectorPeekView and FAEUpsell ~= AppPage.AccountSwitchingAddAccountPeekView and FAEUpsell ~= AppPage.AvatarExperienceWrapperTransparent and FAEUpsell ~= AppPage.SponsoredTooltipPeekView and FAEUpsell ~= AppPage.InfoPeekView and RenderUnderlyingPage)
	}
end

return function(_)
	-- upvalues: AppPage (copy), FFlagLuaAppEnableStratusStreamingTestOnly (copy), RoactModule (copy), LazyComponent (copy), WrapPageInScreenGuiModule (copy), config1 (copy), FFlagEnableLuaLoginRevamp (copy), GetFFlagEnableLuafiedRecoveryFlow (copy), FFlagAppNavMyStatsTab (copy), LazyComponent1 (ref), FlagSettingsModule (copy), LazyComponent20 (copy), LazyComponent2 (copy), FFlagShareTargetGameCleanup (copy), LazyComponent19 (copy), config (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), LazyComponent14 (copy), CryoModule (copy), LazyComponent10 (copy), LazyComponent11 (copy), LazyComponent12 (copy), LazyComponent15 (copy), LazyComponent29 (copy), LazyComponent17 (copy), config2 (copy), LazyComponent32 (copy), LazyComponent23 (copy), NotificationTypeModule (copy), LazyComponent16 (copy), LazyComponent18 (copy), LazyComponent38 (copy), LazyComponent34 (copy), UrlBuilderModule (copy), GetFFlagWebViewServiceHasBackButtonVisibilityModule (copy), FFlagEnableBlackbird (copy), LazyComponent3 (copy), LazyComponent25 (copy), WebViewWindowModule (copy), LazyComponent21 (copy), LazyComponent22 (copy), LazyComponent43 (copy), LazyComponent44 (copy), LazyComponent27 (copy), LazyComponent28 (copy), LazyComponent24 (copy), LazyComponent31 (copy), LazyComponent9 (copy), LazyComponent35 (copy), LazyComponent37 (copy), LazyComponent46 (copy), LazyComponent42 (copy), LazyComponent36 (copy), LazyComponent5 (copy), LazyComponent6 (copy), LazyComponent7 (copy), LazyComponent26 (copy), LazyComponent33 (copy), LazyComponent13 (copy), LazyComponent8 (copy), LazyComponent4 (copy), LazyComponent49 (copy), LazyComponent50 (copy), FFlagEnableAccountUnlockDeepLink (copy), LazyComponent51 (copy), LazyComponent39 (copy), LazyComponent40 (copy), LazyComponent41 (copy), FFlagPasskeyUpsellEnabled (copy), FFlagTutorialUpsellEnabled (copy), LazyComponent30 (copy), LazyComponent47 (copy), LazyComponent48 (copy), GetFFlagEnableVoiceTrialUpsellCardModule (copy), LazyComponent52 (copy), GetFFlagEnableSecurityAlertDeeplinkFunction (copy), WrapAppPageForRoactNavigationModule (copy), getLegacyNavigationOptions (copy), Modules (copy), CreateLazyComponentFunction (copy), FFlagEnableArgus (copy), FFlagMomentsWatchSessionalization (copy), FFlagEnableArgusImmersiveNav (copy), IsVRAppBuildFunction (copy), GuiService (copy), LazyComponent45 (copy), FFlagReworkPurchaseRobuxPageModule (copy), ScreenKind (copy), GlobalNavDisplayOption (copy), CorePackages (copy), GetFFlagEnablePlatformRestrictedEventReceiverFunction (copy)
	local List = {}
	
	for i, value in {
		[AppPage.None] = function()
			return nil
		end,
		[AppPage.VideoServer] = if FFlagLuaAppEnableStratusStreamingTestOnly then function()
			-- upvalues: RoactModule (upval), LazyComponent (upval)
			return RoactModule.createElement(LazyComponent)
		end else nil,
		[AppPage.UAppBlock] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config1.UAppBlockPage, AppPage.UAppBlock, p1)
		end,
		[AppPage.LoginV2] = function(p1)
			-- upvalues: FFlagEnableLuaLoginRevamp (upval), WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
			return if FFlagEnableLuaLoginRevamp then WrapPageInScreenGuiModule(config1.LoginV2MonoWrapper, AppPage.Login, p1) else nil
		end,
		[AppPage.AccountRecovery] = function(p1)
			-- upvalues: GetFFlagEnableLuafiedRecoveryFlow (upval), WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
			return if GetFFlagEnableLuafiedRecoveryFlow() then WrapPageInScreenGuiModule(config1.AccountRecoveryMonoWrapper, AppPage.AccountRecovery, p1) else nil
		end,
		[AppPage.MyStats] = if FFlagAppNavMyStatsTab then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent1 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent1, AppPage.MyStats, p1, p2)
		end else nil,
		[AppPage.LuobuSignUpPage] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config1.LuobuSignUpPage, AppPage.LuobuSignUpPage, p1)
		end,
		[AppPage.WeChatLoginWrapper] = function(p1)
			-- upvalues: FlagSettingsModule (upval), WrapPageInScreenGuiModule (upval), LazyComponent20 (upval), AppPage (upval)
			return if FlagSettingsModule.WeChatLoginEnabled() then WrapPageInScreenGuiModule(LazyComponent20, AppPage.WeChatLoginWrapper, p1) else nil
		end,
		[AppPage.GameDetail] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent2 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent2, AppPage.GameDetail, p1)
		end,
		[AppPage.ShareGameToChat] = if FFlagShareTargetGameCleanup then nil else function(p1, PlaceId)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent19 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent19, AppPage.ShareGameToChat, p1, { placeId = PlaceId })
		end,
		[AppPage.Birthday] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config1.BirthdayPage, AppPage.Birthday, p1)
		end,
		[AppPage.SafetySupport] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config.SafetySupportPage, AppPage.SafetySupport, p1)
		end,
		[AppPage.Accessibility] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config.DeviceSettingsPage, AppPage.Accessibility, p1)
		end,
		[AppPage.AppInformation] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config.AppInformation, AppPage.AppInformation, p1)
		end,
		[AppPage.DevSubs] = function(p1, SelectedGame)
			-- upvalues: WrapPageInScreenGuiModule (upval), config (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config.DevSubsPage, AppPage.DevSubs, p1, SelectedGame and { selectedGame = SelectedGame })
		end,
		[AppPage.EventDetails] = if FFlagLuaAppSduiEventDetailsEnabled then nil else function(p1, VirtualEventId, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent14 (upval), AppPage (upval), CryoModule (upval)
			return WrapPageInScreenGuiModule(LazyComponent14, AppPage.EventDetails, p1, CryoModule.Dictionary.join(p2 or {}, { virtualEventId = VirtualEventId }))
		end,
		[AppPage.AccountSelectorPeekView] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent10 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent10, AppPage.AccountSelectorPeekView, p1, p2)
		end,
		[AppPage.AccountSwitchingAddAccountPeekView] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent11 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent11, AppPage.AccountSwitchingAddAccountPeekView, p1, p2)
		end,
		[AppPage.ShareVirtualEventModal] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent12 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent12, AppPage.ShareVirtualEventModal, p1, p2)
		end,
		[AppPage.EventNotificationsModal] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent15 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent15, AppPage.EventNotificationsModal, p1, p2)
		end,
		[AppPage.TencentHelp] = function(NavigationProps, Detail, ExtraProps)
			-- upvalues: RoactModule (upval), LazyComponent29 (upval)
			return RoactModule.createElement(LazyComponent29, {
				navigationProps = NavigationProps,
				detail = Detail,
				extraProps = ExtraProps
			})
		end,
		[AppPage.TencentNoticeCenter] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config.TencentNoticeCenterPage, AppPage.TencentNoticeCenter, p1)
		end,
		[AppPage.TencentNoticeContent] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), config (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config.TencentNoticeContentPage, AppPage.TencentNoticeContent, p1, p2)
		end,
		[AppPage.GenericWebPage] = function(p1, Url, p2)
			-- upvalues: RoactModule (upval), LazyComponent17 (upval)
			return RoactModule.createElement(LazyComponent17, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				url = Url,
				title = p2.title,
				titleKey = p2.titleKey,
				searchParams = p2.searchParams,
				transitionAnimation = p2 and p2.transitionAnimation or nil,
				onClose = p2 and p2.onClose or nil
			})
		end,
		[AppPage.GenericOpaqueWebPage] = function(p1, Url, p2)
			-- upvalues: RoactModule (upval), LazyComponent17 (upval)
			return RoactModule.createElement(LazyComponent17, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				url = Url,
				title = p2.title,
				titleKey = p2.titleKey,
				searchParams = p2.searchParams,
				transitionAnimation = p2 and p2.transitionAnimation or nil,
				onClose = p2 and p2.onClose or nil
			})
		end,
		[AppPage.SettingsSubPage] = function(p1, Url, p2)
			-- upvalues: config2 (upval), RoactModule (upval), LazyComponent32 (upval), LazyComponent23 (upval), NotificationTypeModule (upval)
			return if config2.GetFFlagLuaAppUseSettingsNativeWrapper() then RoactModule.createElement(LazyComponent32, {
				url = Url,
				titleKey = p2.titleKey,
				windowCloseCallback = p2 and p2.onClose or nil,
				isVisible = p1.isVisible,
				displayOrder = p1.displayOrder
			}) else RoactModule.createElement(LazyComponent23, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				notificationType = p2.notificationType or NotificationTypeModule.OPEN_SETTINGS_WEBVIEW,
				url = Url,
				title = p2.title,
				titleKey = p2.titleKey,
				searchParams = if config2.GetFFlagEnableUnifiedStaticWebViews() then p2.searchParams else nil,
				transitionAnimation = p2 and p2.transitionAnimation or nil,
				onClose = p2 and p2.onClose or nil
			})
		end,
		[AppPage.YouTubePlayer] = function(p1, Url, p2)
			-- upvalues: RoactModule (upval), LazyComponent16 (upval)
			return RoactModule.createElement(LazyComponent16, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				url = Url,
				title = p2.title,
				transitionAnimation = p2 and p2.transitionAnimation or nil
			})
		end,
		[AppPage.ScanQrCode] = function(p1, _, p2)
			-- upvalues: RoactModule (upval), LazyComponent18 (upval), NotificationTypeModule (upval)
			return RoactModule.createElement(LazyComponent18, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				transitionAnimation = p2 and p2.transitionAnimation or nil,
				notificationType = NotificationTypeModule.SCAN_QR_CODE
			})
		end,
		[AppPage.AvatarExperienceWrapper] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent38 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent38, AppPage.AvatarExperienceWrapper, p1, p2)
		end,
		[AppPage.AvatarExperienceWrapperTransparent] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent38 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent38, AppPage.AvatarExperienceWrapperTransparent, p1, p2)
		end,
		[AppPage.BuildersClub] = function(p1, _, p2)
			-- upvalues: config2 (upval), RoactModule (upval), LazyComponent34 (upval), UrlBuilderModule (upval), GetFFlagWebViewServiceHasBackButtonVisibilityModule (upval), LazyComponent18 (upval), NotificationTypeModule (upval)
			return if config2.GetFFlagEnableUnifiedStaticWebViews() then RoactModule.createElement(LazyComponent34, {
				titleKey = "CommonUI.Features.Label.Premium",
				url = UrlBuilderModule.fromString("www:premium/membership")(),
				transitionAnimation = p2.transitionAnimation,
				hasBackButton = not GetFFlagWebViewServiceHasBackButtonVisibilityModule() and nil,
				overlayProps = {
					isVisible = p1.isVisible,
					DisplayOrder = p1.displayOrder
				}
			}) else RoactModule.createElement(LazyComponent18, {
				titleTextLocalizationKey = "CommonUI.Features.Label.Premium",
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				notificationType = NotificationTypeModule.OPEN_BUILDERS_CLUB,
				transitionAnimation = p2 and p2.transitionAnimation or nil
			})
		end,
		[AppPage.Blackbird] = if FFlagEnableBlackbird then function(p1, _, p2)
			-- upvalues: RoactModule (upval), LazyComponent3 (upval)
			return RoactModule.createElement(LazyComponent3, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				transitionAnimation = p2.transitionAnimation
			})
		end else nil,
		[AppPage.Payment] = function(p1, ProductId, p2)
			-- upvalues: RoactModule (upval), LazyComponent25 (upval), config2 (upval), UrlBuilderModule (upval)
			return RoactModule.createElement(LazyComponent25, {
				url = if config2.GetFFlagEnableUnifiedStaticWebViews() and p2 and p2.analyticId ~= nil then UrlBuilderModule.fromString("www:upgrades/paymentmethods?ap={productId}&analyticId={analyticId}")({ productId = ProductId, analyticId = p2.analyticId }) elseif config2.GetFFlagEnableUnifiedStaticWebViews() then UrlBuilderModule.fromString("www:upgrades/paymentmethods?ap={productId}")({ productId = ProductId }) else nil,
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				transitionAnimation = p2 and p2.transitionAnimation or nil
			})
		end,
		[AppPage.Notifications] = function(p1, _, p2)
			-- upvalues: config2 (upval), RoactModule (upval), LazyComponent34 (upval), UrlBuilderModule (upval), WebViewWindowModule (upval), LazyComponent18 (upval), NotificationTypeModule (upval)
			return if config2.GetFFlagEnableUnifiedStaticWebViews() then RoactModule.createElement(LazyComponent34, {
				titleKey = "Feature.AccountSettings.Heading.Tab.Notifications",
				url = UrlBuilderModule.fromString("www:notificationstream/embedded")(),
				windowType = WebViewWindowModule.Dialog,
				transitionAnimation = p2.transitionAnimation,
				searchParams = p2.searchParams,
				windowCloseCallback = p2.onClose,
				overlayProps = {
					isVisible = p1.isVisible,
					DisplayOrder = p1.displayOrder
				}
			}) else RoactModule.createElement(LazyComponent18, {
				titleTextLocalizationKey = "Feature.AccountSettings.Heading.Tab.Notifications",
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				notificationType = NotificationTypeModule.VIEW_NOTIFICATIONS,
				transitionAnimation = p2 and p2.transitionAnimation or nil,
				onClose = p2 and p2.onClose or nil
			})
		end,
		[AppPage.LogoutConfirmation] = function(p1, _, p2)
			-- upvalues: RoactModule (upval), LazyComponent18 (upval), NotificationTypeModule (upval)
			return RoactModule.createElement(LazyComponent18, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				notificationType = NotificationTypeModule.ACTION_LOG_OUT,
				transitionAnimation = p2 and p2.transitionAnimation or nil
			})
		end,
		[AppPage.AddFriends] = function(p1, _, p2)
			-- upvalues: config2 (upval), RoactModule (upval), LazyComponent34 (upval), UrlBuilderModule (upval), LazyComponent18 (upval), NotificationTypeModule (upval)
			return if config2.GetFFlagEnableUnifiedStaticWebViews() then RoactModule.createElement(LazyComponent34, {
				titleKey = "CommonUI.Features.Label.Friends",
				url = UrlBuilderModule.fromString("www:users/friends#!/friend-requests?onlyShowContents=true")(),
				transitionAnimation = p2.transitionAnimation,
				searchParams = { searchType = "Players" },
				windowCloseCallback = p2.onClose,
				overlayProps = {
					isVisible = p1.isVisible,
					DisplayOrder = p1.displayOrder
				}
			}) else RoactModule.createElement(LazyComponent18, {
				titleTextLocalizationKey = "CommonUI.Features.Label.Friends",
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				notificationType = NotificationTypeModule.UNIVERSAL_FRIENDS,
				transitionAnimation = p2 and p2.transitionAnimation or nil,
				onClose = p2 and p2.onClose or nil
			})
		end,
		[AppPage.ViewUserProfile] = function(p1, UserId, p2)
			-- upvalues: RoactModule (upval), LazyComponent21 (upval)
			return RoactModule.createElement(LazyComponent21, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				userId = UserId,
				onClose = p2 and p2.onClose or nil
			})
		end,
		[AppPage.ViewProfile] = function(p1, Url)
			-- upvalues: RoactModule (upval), LazyComponent22 (upval)
			return RoactModule.createElement(LazyComponent22, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				url = Url
			})
		end,
		[AppPage.LoginNative] = function(p1, _, p2)
			-- upvalues: RoactModule (upval), LazyComponent18 (upval), NotificationTypeModule (upval)
			return RoactModule.createElement(LazyComponent18, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				notificationType = NotificationTypeModule.ACTION_LOG_IN,
				transitionAnimation = p2 and p2.transitionAnimation or nil
			})
		end,
		[AppPage.CaptchaNative] = function(p1, _, p2)
			-- upvalues: RoactModule (upval), config1 (upval)
			local IsSignup = p2.captchaType == "signup"
			
			return if p2.captchaType == "login" or IsSignup then RoactModule.createElement(config1.CaptchaPageBrowserServiceWrapper, {
				webViewVisible = false,
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				captchaType = p2.captchaType,
				cvalueType = p2.cvalueType,
				cvalue = p2.cvalue,
				dxBlob = p2.dxBlob,
				captchaId = p2.captchaId,
				captchaCallback = p2.captchaCallback,
				backNavigationDisabledWhileLoading = p2.backNavigationDisabledWhileLoading,
				transitionAnimation = p2 and p2.transitionAnimation or nil
			}) else RoactModule.createElement(config1.CaptchaPageBrowserServiceWrapper, {
				webViewVisible = false,
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				captchaType = p2.captchaType,
				cvalueType = p2.cvalueType,
				cvalue = p2.cvalue,
				captchaCallback = p2.captchaCallback,
				backNavigationDisabledWhileLoading = p2.backNavigationDisabledWhileLoading,
				transitionAnimation = p2 and p2.transitionAnimation or nil
			})
		end,
		[AppPage.RobuxUpsell] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent43 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent43, AppPage.RobuxUpsell, p1, p2)
		end,
		[AppPage.SubscriptionPurchase] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent44 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent44, AppPage.SubscriptionPurchase, p1, p2)
		end,
		[AppPage.ShareSheet] = function(p1, _, Data)
			-- upvalues: RoactModule (upval), LazyComponent27 (upval)
			return RoactModule.createElement(LazyComponent27, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				data = Data
			})
		end,
		[AppPage.SdkShare] = function(p1, _, Data)
			-- upvalues: RoactModule (upval), LazyComponent28 (upval)
			return RoactModule.createElement(LazyComponent28, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				data = Data
			})
		end,
		[AppPage.ReportAbuse] = function(p1, Url, p2)
			-- upvalues: RoactModule (upval), LazyComponent24 (upval)
			return RoactModule.createElement(LazyComponent24, {
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				url = Url,
				onClose = p2 and p2.onClose or nil
			})
		end,
		[AppPage.PhoneVerification] = function(_, _, p1)
			-- upvalues: RoactModule (upval), LazyComponent31 (upval)
			return RoactModule.createElement(LazyComponent31, p1)
		end,
		[AppPage.EditUsername] = function(_, _, p1)
			-- upvalues: RoactModule (upval), LazyComponent9 (upval)
			return RoactModule.createElement(LazyComponent9, p1)
		end,
		[AppPage.ChallengeHybridOverlayPage] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent35 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent35, AppPage.ChallengeHybridOverlayPage, p1, p2)
		end,
		[AppPage.ChallengeDialogModalContainer] = if config2.GetFFlagLuaAppChallengeDialogContainerPageEnabled() then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent37 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent37, AppPage.ChallengeDialogModalContainer, p1, p2)
		end else nil,
		[AppPage.ReportDialog] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent46 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent46, AppPage.ReportDialog, p1)
		end,
		[AppPage.AgeVerificationRequired] = function(p1, UniverseId)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent42 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent42, AppPage.AgeVerificationRequired, p1, UniverseId and { universeId = UniverseId } or nil)
		end,
		[AppPage.ChallengeHybridWebView] = function(AppContainerNavigation, _, p1)
			-- upvalues: RoactModule (upval), LazyComponent36 (upval), CryoModule (upval)
			return RoactModule.createElement(LazyComponent36, CryoModule.Dictionary.join(p1, { appContainerNavigation = AppContainerNavigation }))
		end,
		[AppPage.InviteLinkExpiredModal] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent5 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent5, AppPage.InviteLinkExpiredModal, p1, p2)
		end,
		[AppPage.ShareLinkInvalidModal] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent6 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent6, AppPage.ShareLinkInvalidModal, p1, p2)
		end,
		[AppPage.ProfileQRCodePage] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent7 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent7, AppPage.ProfileQRCodePage, p1, p2)
		end,
		[AppPage.AccountInfo] = function(p1, Url, p2)
			-- upvalues: RoactModule (upval), LazyComponent26 (upval), CryoModule (upval)
			return RoactModule.createElement(LazyComponent26, CryoModule.Dictionary.join(p2, {
				isVisible = p1.isVisible,
				displayOrder = p1.displayOrder,
				url = Url
			}))
		end,
		[AppPage.ParentVerification] = function(_, Url)
			-- upvalues: RoactModule (upval), LazyComponent33 (upval)
			return RoactModule.createElement(LazyComponent33, { url = Url })
		end,
		[AppPage.EmailVerification] = function(_, Url)
			-- upvalues: RoactModule (upval), LazyComponent33 (upval)
			return RoactModule.createElement(LazyComponent33, { url = Url })
		end,
		[AppPage.VerifiedBadgeModal] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent13 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent13, AppPage.VerifiedBadgeModal, p1, p2)
		end,
		[AppPage.SocialMessageToast] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent8 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent8, AppPage.SocialMessageToast, p1, p2)
		end,
		[AppPage.PassesPage] = function(p1, UniverseId, p2)
			-- upvalues: CryoModule (upval), WrapPageInScreenGuiModule (upval), LazyComponent4 (upval), AppPage (upval)
			local JoinResult = { universeId = UniverseId }
			
			if p2 then
				JoinResult = CryoModule.Dictionary.join(p2, JoinResult)
			end
			return WrapPageInScreenGuiModule(LazyComponent4, AppPage.PassesPage, p1, JoinResult)
		end,
		[AppPage.AccountSettingsUpsell] = if config2.GetFFlagEnableAccountSettingsUpsell() then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent49 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent49, AppPage.AccountSettingsUpsell, p1, p2)
		end else nil,
		[AppPage.AmpWizardContainer] = if config2.GetFFlagEnableAmpUpsellWizard() then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent50 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent50, AppPage.AmpWizardContainer, p1, p2)
		end else nil,
		[AppPage.AccountUnlock] = if FFlagEnableAccountUnlockDeepLink then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent51 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent51, AppPage.AccountUnlock, p1, p2)
		end else nil,
		[AppPage.IDVUpsellContainer] = if config2.GetFFlagEnableAmpIDVUpsellSupport() then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent39 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent39, AppPage.IDVUpsellContainer, p1, p2)
		end else nil,
		[AppPage.VPCUpsellContainer] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent40 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent40, AppPage.VPCUpsellContainer, p1, p2)
		end,
		[AppPage.RobloxSubscriptionUpsell] = if config2.GetFFlagEnableAmpSubscriptionUpsell() then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent41 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent41, AppPage.RobloxSubscriptionUpsell, p1, p2)
		end else nil,
		[AppPage.AddAuthMethodPage] = function(p1)
			-- upvalues: WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config1.AddAuthMethodPage, AppPage.AddAuthMethodPage, p1)
		end,
		[AppPage.PasskeyUpsellScreen] = if FFlagPasskeyUpsellEnabled then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(config1.PasskeyUpsellScreen, AppPage.PasskeyUpsellScreen, p1, p2)
		end else nil,
		[AppPage.TutorialUpsellScreen] = if FFlagTutorialUpsellEnabled then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent30 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent30, AppPage.TutorialUpsellScreen, p1, p2)
		end else nil,
		[AppPage.SponsoredTooltipPeekView] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent47 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent47, AppPage.SponsoredTooltipPeekView, p1, p2)
		end,
		[AppPage.InfoPeekView] = function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent48 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent48, AppPage.InfoPeekView, p1, p2)
		end,
		[AppPage.VoiceTrialUpsell] = if GetFFlagEnableVoiceTrialUpsellCardModule() then function(p1, _, p2)
			-- upvalues: WrapPageInScreenGuiModule (upval), LazyComponent52 (upval), AppPage (upval)
			return WrapPageInScreenGuiModule(LazyComponent52, AppPage.VoiceTrialUpsell, p1, p2)
		end else nil,
		[AppPage.SecurityAlertInfo] = if GetFFlagEnableSecurityAlertDeeplinkFunction() then function(p1, Url, p2)
			-- upvalues: RoactModule (upval), LazyComponent23 (upval), NotificationTypeModule (upval), config2 (upval)
			return RoactModule.createElement(LazyComponent23, {
				titleKey = "Feature.SecurityFeedback.Header.NewLogin",
				isVisible = p1.isVisible,
				DisplayOrder = p1.displayOrder,
				notificationType = NotificationTypeModule.OPEN_CUSTOM_WEBVIEW,
				url = Url,
				searchParams = if config2.GetFFlagEnableUnifiedStaticWebViews() then p2.searchParams else nil,
				transitionAnimation = p2 and p2.transitionAnimation or nil,
				onClose = p2 and p2.onClose or nil
			})
		end else nil
	} do
		table.insert(List, {
			[i] = {
				screen = WrapAppPageForRoactNavigationModule(value, i),
				navigationOptions = getLegacyNavigationOptions(i)
			}
		})
	end
	table.insert(List, {
		[AppPage.AvatarExperienceRoot] = {
			getScreen = function()
				-- upvalues: Modules (upval)
				return require(Modules.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceRootContainer)
			end,
			navigationOptions = { hasSubNavigation = true }
		}
	})
	table.insert(List, {
		[AppPage.Chat] = CreateLazyComponentFunction(function()
			-- upvalues: Modules (upval)
			return require(Modules.LuaApp.Components.SocialTab.SocialTabUniversalAppWrapper.Container)
		end)
	})
	
	if FFlagEnableArgus then
		if FFlagMomentsWatchSessionalization then
			table.insert(List, {
				[AppPage.Moments] = {
					getScreen = function()
						-- upvalues: Modules (upval)
						return require(Modules.LuaApp.Components.Moments.MomentsTabEntryContainer)
					end,
					navigationOptions = { hasSubNavigation = true }
				}
			})
		else
			table.insert(List, {
				[AppPage.Moments] = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Moments.MomentsTabEntryContainer)
				end)
			})
		end
		if FFlagEnableArgusImmersiveNav then
			table.insert(List, {
				[AppPage.MomentsImmersive] = CreateLazyComponentFunction(function()
					-- upvalues: Modules (upval)
					return require(Modules.LuaApp.Components.Moments.MomentsImmersiveRouteContainer)
				end)
			})
		end
	end
	table.insert(List, {
		[AppPage.PurchaseRobux] = {
			screen = WrapAppPageForRoactNavigationModule(function(p1, AnalyticId, p2)
				-- upvalues: config2 (upval), IsVRAppBuildFunction (upval), GuiService (upval), WrapPageInScreenGuiModule (upval), LazyComponent45 (upval), AppPage (upval), FFlagReworkPurchaseRobuxPageModule (upval), UrlBuilderModule (upval), RoactModule (upval), LazyComponent25 (upval)
				if config2.GetFFlagLuaAppLuaBuyRobuxPage() and IsVRAppBuildFunction() or GuiService:IsTenFootInterface() then
					return WrapPageInScreenGuiModule(LazyComponent45, AppPage.PurchaseRobux, p1, p2)
				else
					local v1 = if FFlagReworkPurchaseRobuxPageModule then UrlBuilderModule.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId|}&product_id={productId|}")(p2) else nil
					
					return RoactModule.createElement(LazyComponent25, {
						url = if FFlagReworkPurchaseRobuxPageModule then v1 elseif config2.GetFFlagEnableUnifiedStaticWebViews() then UrlBuilderModule.fromString("www:Upgrades/Robux.aspx")() elseif AnalyticId then UrlBuilderModule.fromString("www:Upgrades/Robux.aspx?analyticId={analyticId}")({ analyticId = AnalyticId }) else nil,
						isVisible = p1.isVisible,
						DisplayOrder = p1.displayOrder,
						transitionAnimation = p2 and p2.transitionAnimation or nil
					})
				end
			end, AppPage.PurchaseRobux),
			navigationOptions = CryoModule.Dictionary.join({
				screenKind = ScreenKind.FullScreen,
				globalNavDisplayOption = GlobalNavDisplayOption.HideAll
			}, (getLegacyNavigationOptions(AppPage.PurchaseRobux)))
		}
	})
	table.insert(List, {
		[AppPage.ReportScreen] = {
			screen = CreateLazyComponentFunction(function()
				-- upvalues: CorePackages (upval)
				return require(CorePackages.Workspace.Packages.AbuseReporting).ReportScreen
			end),
			navigationOptions = {
				screenKind = ScreenKind.FullScreen,
				globalNavDisplayOption = GlobalNavDisplayOption.HideAll
			}
		}
	})
	table.insert(List, {
		[AppPage.ChallengeNativeWrapper] = {
			screen = CreateLazyComponentFunction(function()
				-- upvalues: Modules (upval)
				return require(Modules.LuaApp.Components.Challenge.NativeWrapper)
			end),
			navigationOptions = {
				transparent = if config2.GetFFlagEnableTransparentNativeChallengeWrapper() then true else nil,
				globalNavDisplayOption = GlobalNavDisplayOption.OptionGroupOnly
			}
		}
	})
	table.insert(List, {
		[AppPage.FAEUpsell] = {
			screen = CreateLazyComponentFunction(function()
				-- upvalues: CorePackages (upval)
				return require(CorePackages.Workspace.Packages.AmpUpsell).FAEUpsellContainer
			end),
			navigationOptions = getLegacyNavigationOptions(AppPage.FAEUpsell)
		}
	})
	table.insert(List, {
		[AppPage.NotApprovedPage] = {
			screen = WrapAppPageForRoactNavigationModule(function(p1, _, p2)
				-- upvalues: WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
				return WrapPageInScreenGuiModule(config1.NotApprovedPage, AppPage.NotApprovedPage, p1, p2)
			end, AppPage.NotApprovedPage),
			navigationOptions = {
				screenKind = ScreenKind.FullScreen,
				globalNavDisplayOption = GlobalNavDisplayOption.HideAll
			}
		}
	})
	
	if GetFFlagEnablePlatformRestrictedEventReceiverFunction() then
		table.insert(List, {
			[AppPage.PlatformLockedPage] = {
				screen = WrapAppPageForRoactNavigationModule(function(p1, _, p2)
					-- upvalues: WrapPageInScreenGuiModule (upval), config1 (upval), AppPage (upval)
					return WrapPageInScreenGuiModule(config1.PlatformLockedPage, AppPage.PlatformLockedPage, p1, p2)
				end, AppPage.PlatformLockedPage),
				navigationOptions = {
					screenKind = ScreenKind.FullScreen,
					globalNavDisplayOption = GlobalNavDisplayOption.HideAll
				}
			}
		})
	end
	return List
end