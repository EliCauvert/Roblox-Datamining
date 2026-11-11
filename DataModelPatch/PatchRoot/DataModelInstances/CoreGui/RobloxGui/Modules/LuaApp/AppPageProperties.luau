local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local AppPageModule = require(Modules.LuaApp.AppPage)
local SystemBarVisibilityModule = require(Modules.LuaApp.Enum.SystemBarVisibility)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagEnableAbuseReport10ftFunction = SharedFlagsModule.GetFFlagEnableAbuseReport10ft
local GetFFlagLuaAppChallengeDialogContainerPageEnabledFunction = require(CorePackages.Workspace.Packages.ChallengeDialog).GetFFlagLuaAppChallengeDialogContainerPageEnabled
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local LuaAppIncorrectWebViewProperty = game:DefineFastFlag("LuaAppIncorrectWebViewProperty", false)
local GetFFlagEnableNativeWrapperAppPageModule = require(Modules.LuaApp.Flags.GetFFlagEnableNativeWrapperAppPage)
local GetFFlagFixNavBarStartupDuplicateAnimModule = require(Modules.LuaApp.Flags.GetFFlagFixNavBarStartupDuplicateAnim)
local SocialNetworksInEditProfileIXP = require(CorePackages.Workspace.Packages.EditProfile.Flags).SocialNetworksInEditProfileIXP
local FFlagFriendRequestNicknames = SharedFlagsModule.FFlagFriendRequestNicknames
local GetFFlagEnableVoiceTrialUpsellCardModule = require(Modules.LuaApp.Flags.GetFFlagEnableVoiceTrialUpsellCard)
local GetFFlagLuaAppEnableTopBannerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableTopBanner
local FFlagShareTargetGameCleanup = SharedFlagsModule.FFlagShareTargetGameCleanup
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusImmersiveNav = SharedFlagsModule.FFlagEnableArgusImmersiveNav
local FFlagMomentsFeedWatchPageAttribution = SharedFlagsModule.FFlagMomentsFeedWatchPageAttribution
local FStringMomentsFeedWatchPageRouteName = SharedFlagsModule.FStringMomentsFeedWatchPageRouteName
local FFlagPasskeyUpsellEnabled = SharedFlagsModule.FFlagPasskeyUpsellEnabled
local GetFFlagEnablePlatformRestrictedEventReceiverFunction = SharedFlagsModule.GetFFlagEnablePlatformRestrictedEventReceiver
local FFlagTutorialUpsellEnabled = SharedFlagsModule.FFlagTutorialUpsellEnabled
local FFlagEnableSocialProofUserList = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableSocialProofUserList
local FFlagProfilePlatformAddTC = require(CorePackages.Workspace.Packages.SharedFlags).FFlagProfilePlatformAddTC
local FFlagTCShareLinkErrorModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCShareLinkErrorModal
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local FFlagLuaAppEnableFeatureTileAdPlayer = SharedFlagsModule.FFlagLuaAppEnableFeatureTileAdPlayer
local FFlagAppNavMyStatsTab = SharedFlagsModule.FFlagAppNavMyStatsTab
local FFlagEnableBottomNavOnMarketplace = SharedFlagsModule.FFlagEnableBottomNavOnMarketplace
local FFlagAppIaScrollAwayPinHeader = SharedFlagsModule.FFlagAppIaScrollAwayPinHeader
local FFlagAppIaScopedScrollAway = SharedFlagsModule.FFlagAppIaScopedScrollAway
local FFlagRenameAvatarToMe = SharedFlagsModule.FFlagRenameAvatarToMe
local FFlagAddVideoToCommunityProfile = SharedFlagsModule.FFlagAddVideoToCommunityProfile
local FFlagLuaAppSortDeeplinkFix = SharedFlagsModule.FFlagLuaAppSortDeeplinkFix
local FFlagLuaAppSduiEventDetailsEnabled = SharedFlagsModule.FFlagLuaAppSduiEventDetailsEnabled
local FFlagLuaAppSduiLandingPageEnabled = SharedFlagsModule.FFlagLuaAppSduiLandingPageEnabled
local WebViewHideLuaSideBar = game:DefineFastFlag("WebViewHideLuaSideBar", false)
local FFlagFixMoreSubMenuTitleFlash = SharedFlagsModule.FFlagFixMoreSubMenuTitleFlash
local FFlagEnableSocialProofVerticalUserListSheet = SharedFlagsModule.FFlagEnableSocialProofVerticalUserListSheet
local FFlagEnableSchoolEntry = SharedFlagsModule.FFlagEnableSchoolEntry
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local TCEducationModalSideBarPolicy = game:DefineFastFlag("TCEducationModalSideBarPolicy", false)
local FFlagTCModalUseFoundationOverlay = require(CorePackages.Workspace.Packages.SharedFlags).FFlagTCModalUseFoundationOverlay
local FFlagEnableBlackbird = SharedFlagsModule.FFlagEnableBlackbird
local FFlagLuaAppEnableStratusStreamingTestOnly = SharedFlagsModule.FFlagLuaAppEnableStratusStreamingTestOnly
local FFlagEnableMobileGameJoinCard = SharedFlagsModule.FFlagEnableMobileGameJoinCard
local FFlagEnableSocialTabsPage = SharedFlagsModule.FFlagEnableSocialTabsPage
local config = {
	[AppPageModule.None] = {
		nameLocalizationKey = "CommonUI.Features.Label.Nil",
		disableAppTopBanner = true
	},
	[AppPageModule.Startup] = {
		nameLocalizationKey = "CommonUI.Features.Label.Startup",
		disableAppTopBanner = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.Landing] = {
		nameLocalizationKey = "CommonUI.Features.Label.Startup",
		tabBarHidden = SystemBarVisibilityModule.Hidden,
		appShellReporterFeature = Enum.AppShellFeature.Landing
	},
	[AppPageModule.Login] = {
		nameLocalizationKey = "Authentication.Login.Heading.Login",
		tabBarHidden = SystemBarVisibilityModule.Hidden,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then true else nil
	},
	[AppPageModule.LoginV2] = {
		nameLocalizationKey = "Authentication.Login.Heading.Login",
		disableBackButton = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then true else nil
	},
	[AppPageModule.WechatQQAuth] = {
		nameLocalizationKey = "Authentication.Login.Heading.Login",
		disableBackButton = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then true else nil
	},
	[AppPageModule.AccountRecovery] = {
		nameLocalizationKey = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery",
		disableBackButton = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then true else nil
	},
	[AppPageModule.CrossDeviceLogin] = {
		nameLocalizationKey = "Authentication.CrossDevice.Heading.QuickLogin",
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.Birthday] = {
		nameLocalizationKey = "Authentication.SignUp.Label.WhensYourBirthday",
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.SinglePageSignUp] = {
		nameLocalizationKey = "Authentication.SignUp.Label.SignUp",
		tabBarHidden = SystemBarVisibilityModule.Hidden,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then true else nil
	},
	[AppPageModule.MultiPageSignup] = {
		nameLocalizationKey = "Authentication.SignUp.Label.SignUp",
		disableBackButton = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then true else nil
	},
	[AppPageModule.LuobuSignUpPage] = {
		nameLocalizationKey = "Authentication.SignUp.Label.SignUp",
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.WeChatLoginWrapper] = {
		nativeWrapper = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.Home] = {
		nameLocalizationKey = "CommonUI.Features.Label.Home",
		appShellReporterFeature = Enum.AppShellFeature.HomePage,
		tabBarHidden = SystemBarVisibilityModule.Visible,
		enableScrollAway = if FFlagAppIaScrollAway then true else nil
	},
	[AppPageModule.Games] = {
		nameLocalizationKey = require(Modules.LuaApp.FlagSettings).GetGamesTabName(),
		appShellReporterFeature = Enum.AppShellFeature.GamePage,
		tabBarHidden = SystemBarVisibilityModule.Visible,
		enableScrollAway = if FFlagAppIaScrollAway then true else nil
	},
	[AppPageModule.GameDetail] = {
		nameLocalizationKey = "CommonUI.Features.Heading.GameDetails",
		renderUnderlyingPage = true,
		blurUnderlyingPage = true,
		isPeekView = true,
		tabBarHidden = require(Modules.LuaApp.getExperienceDetailsPageNavBarVisible),
		appShellReporterFeature = Enum.AppShellFeature.GamePage
	},
	[AppPageModule.AvatarExperienceRoot] = {
		overridesAppRouterTabBarControl = true,
		disableBackButton = true,
		nameLocalizationKey = if FFlagRenameAvatarToMe then "CommonUI.Features.Label.Me" else "CommonUI.Features.Label.Avatar",
		tabBarHidden = SystemBarVisibilityModule.Visible,
		appShellReporterFeature = Enum.AppShellFeature.AvatarEditor,
		disableAppTopBanner = if GetFFlagLuaAppEnableTopBannerFunction() then true else nil,
		enableScrollAway = if FFlagEnableBottomNavOnMarketplace and FFlagAppIaScrollAway then true else nil,
		disableHeaderScrollAway = if FFlagEnableBottomNavOnMarketplace and FFlagAppIaScrollAwayPinHeader then true else nil,
		disableGlobalScrollAwayTouch = if FFlagEnableBottomNavOnMarketplace and FFlagAppIaScopedScrollAway then true else nil
	},
	[AppPageModule.Chat] = {
		nameLocalizationKey = "CommonUI.Features.Label.Chat",
		overridesAppRouterTabBarControl = true,
		appShellReporterFeature = Enum.AppShellFeature.Chat,
		enableScrollAway = if FFlagAppIaScrollAway then true else nil
	},
	[AppPageModule.ContentFeed] = {
		disableBackButton = false,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ShareGameToChat] = if FFlagShareTargetGameCleanup then nil else { tabBarHidden = SystemBarVisibilityModule.PolicyDependent },
	[AppPageModule.AvatarExperienceWrapper] = {
		overridesAppRouterTabBarControl = true,
		disableBackButton = true,
		appShellReporterFeature = Enum.AppShellFeature.AvatarEditor
	},
	[AppPageModule.AvatarExperienceWrapperTransparent] = {
		overridesAppRouterTabBarControl = true,
		renderUnderlyingPage = true,
		disableBackButton = true,
		appShellReporterFeature = Enum.AppShellFeature.AvatarEditor
	},
	[AppPageModule.FeatureTileAdPlayer] = if FFlagLuaAppEnableFeatureTileAdPlayer then {
		overridesAppRouterTabBarControl = true,
		renderUnderlyingPage = true,
		disableBackButton = true,
		disableAppTopBanner = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	} else nil,
	[AppPageModule.SearchPage] = {
		overridesAppRouterTabBarControl = false,
		tabBarHidden = SystemBarVisibilityModule.Visible,
		enableScrollAway = if FFlagAppIaScrollAway then true else nil
	},
	[AppPageModule.More] = {
		nameLocalizationKey = "CommonUI.Features.Label.More",
		tabBarHidden = SystemBarVisibilityModule.Visible,
		appShellReporterFeature = Enum.AppShellFeature.More,
		enableScrollAway = if FFlagAppIaScrollAway then true else nil
	},
	[AppPageModule.AccountInfo] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.About] = {
		nameLocalizationKey = "CommonUI.Features.Label.About",
		tabBarHidden = SystemBarVisibilityModule.Visible,
		alwaysShowBackButton = if FFlagFixMoreSubMenuTitleFlash then true else nil
	},
	[AppPageModule.SafetySupport] = {
		nameLocalizationKey = "CommonUI.Features.Label.HelpAndSafety",
		tabBarHidden = SystemBarVisibilityModule.Visible,
		alwaysShowBackButton = if FFlagFixMoreSubMenuTitleFlash then true else nil
	},
	[AppPageModule.Settings] = {
		nameLocalizationKey = "CommonUI.Features.Label.Settings",
		tabBarHidden = SystemBarVisibilityModule.Visible,
		alwaysShowBackButton = if FFlagFixMoreSubMenuTitleFlash then true else nil
	},
	[AppPageModule.Accessibility] = {
		nameLocalizationKey = "Feature.Accessibility.Heading.DevicePreferences",
		tabBarHidden = SystemBarVisibilityModule.Visible
	},
	[AppPageModule.Licensing] = {
		nameLocalizationKey = "CommonUI.Features.Label.Licensing",
		tabBarHidden = SystemBarVisibilityModule.Visible
	},
	[AppPageModule.AppInformation] = {
		nameLocalizationKey = "CommonUI.Features.Label.AppInformation",
		tabBarHidden = SystemBarVisibilityModule.Visible
	},
	[AppPageModule.DevSubs] = {
		nameLocalizationKey = "CommonUI.Features.Label.DevSubs",
		tabBarHidden = SystemBarVisibilityModule.Visible
	},
	[AppPageModule.AddFriendsPage] = {
		nameLocalizationKey = "Feature.Friends.Feature.Friends.Heading.AddFriends",
		nativeWrapper = false,
		bottomTabBarHidden = true,
		sideTabBarHidden = false,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.MyStats] = if FFlagAppNavMyStatsTab then {
		nameLocalizationKey = "CommonUI.Features.NavBar.Build",
		tabBarHidden = SystemBarVisibilityModule.Visible
	} else nil,
	[AppPageModule.ConnectionsHub] = {
		nativeWrapper = false,
		bottomTabBarHidden = true,
		sideTabBarHidden = false,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.BuildersClub] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.InviteLinkExpiredModal] = { absorbInput = true, renderUnderlyingPage = true },
	[AppPageModule.ShareLinkInvalidModal] = { absorbInput = true, renderUnderlyingPage = true },
	[AppPageModule.VerifiedBadgeModal] = { renderUnderlyingPage = true },
	[AppPageModule.ShareVirtualEventModal] = { renderUnderlyingPage = true },
	[AppPageModule.EventNotificationsModal] = { renderUnderlyingPage = true },
	[AppPageModule.EventDetails] = {
		renderUnderlyingPage = true,
		tabBarHidden = if FFlagLuaAppSduiEventDetailsEnabled then nil else SystemBarVisibilityModule.PolicyDependent,
		blurUnderlyingPage = not FFlagLuaAppSduiEventDetailsEnabled or nil
	},
	[AppPageModule.TencentHelp] = {
		nameLocalizationKey = "CommonUI.Features.Label.Help",
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.TencentNoticeCenter] = {
		nameLocalizationKey = "CommonUI.Features.Label.TencentNotice",
		tabBarHidden = SystemBarVisibilityModule.Visible
	},
	[AppPageModule.TencentNoticeContent] = {
		nameLocalizationKey = "CommonUI.Features.Label.TencentNotice",
		tabBarHidden = SystemBarVisibilityModule.Visible
	},
	[AppPageModule.GenericWebPage] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.SettingsSubPage] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.SecurityAlertInfo] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.YouTubePlayer] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.PurchaseRobux] = {
		webView = true,
		nativeWrapper = true,
		tabBarHidden = if WebViewHideLuaSideBar or FFlagEnableLeftNavOnConsole and GuiService:IsTenFootInterface() then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent,
		renderUnderlyingPage = (not FFlagEnableLeftNavOnConsole or not GuiService:IsTenFootInterface()) and not IsVRAppBuildFunction()
	},
	[AppPageModule.Payment] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.RobuxUpsell] = {
		webView = false,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.SubscriptionPurchase] = {
		webView = false,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.Notifications] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.LogoutConfirmation] = {
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.AddFriends] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ViewUserProfile] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ViewProfile] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.AccountSelectorPeekView] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.AccountSwitchingAddAccountPeekView] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.LoginNative] = {
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.CaptchaNative] = {
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.ViewFriends] = {
		webView = false,
		nativeWrapper = false,
		renderUnderlyingPage = false,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ShareSheet] = {
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.SdkShare] = {
		nativeWrapper = false,
		renderUnderlyingPage = true,
		disableBackButton = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ReportAbuse] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ScanQrCode] = {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.GenericOpaqueWebPage] = {
		nativeWrapper = true,
		renderUnderlyingPage = false,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ChallengeHybridOverlayPage] = {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ChallengeHybridWebView] = {
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.ProfilePlatform] = {
		nameLocalizationKey = "CommonUI.Features.Label.Profile",
		renderUnderlyingPage = true,
		isPeekView = true,
		disableBackButton = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.Groups] = {
		nameLocalizationKey = "CommonUI.Features.Label.Groups",
		disableBackButton = false,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.SocialUnableToJoinExperience] = {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPageModule.SocialPurchaseExperience] = {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPageModule.SocialToast] = {
		overlayEnabled = true,
		transparent = true,
		absorbInput = false,
		overlayTransparency = 1,
		renderUnderlyingPage = true,
		disableBackButton = true
	},
	[AppPageModule.EditSocialNetworks] = if SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	} else nil,
	[AppPageModule.EditSocialNetworksError] = if SocialNetworksInEditProfileIXP.GetFFlagSocialNetworksInEditProfileIXPSetupEnabled() then {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true
	} else nil,
	[AppPageModule.PhoneVerification] = {
		renderUnderlyingPage = true,
		webView = not LuaAppIncorrectWebViewProperty or nil,
		tabBarHidden = if WebViewHideLuaSideBar and not LuaAppIncorrectWebViewProperty then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.EditUsername] = {
		renderUnderlyingPage = true,
		webView = not LuaAppIncorrectWebViewProperty or nil,
		tabBarHidden = if WebViewHideLuaSideBar and not LuaAppIncorrectWebViewProperty then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ExperienceGuidelinesExplained] = {
		nameLocalizationKey = "Feature.GameDetails.Label.ContentMaturity",
		disableBackButton = false,
		renderUnderlyingPage = true
	},
	[AppPageModule.AgeVerificationRequired] = { disableBackButton = false, renderUnderlyingPage = true },
	[AppPageModule.AccountSettingsUpsell] = {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.IDVUpsellContainer] = { renderUnderlyingPage = true },
	[AppPageModule.VPCUpsellContainer] = { renderUnderlyingPage = true },
	[AppPageModule.RobloxSubscriptionUpsell] = { renderUnderlyingPage = true },
	[AppPageModule.AmpWizardContainer] = { renderUnderlyingPage = true },
	[AppPageModule.AccountUnlock] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		disableAppTopBanner = true
	},
	[AppPageModule.GamesList] = {
		enableScrollAway = if FFlagAppIaScrollAway then true else nil
	},
	[AppPageModule.SduiLandingPage] = if FFlagLuaAppSduiLandingPageEnabled then { tabBarHidden = SystemBarVisibilityModule.Visible } else nil,
	[AppPageModule.DeeplinkGamesList] = if FFlagLuaAppSortDeeplinkFix then {
		enableScrollAway = if FFlagAppIaScrollAway then true else nil
	} else nil,
	[AppPageModule.ContactImporter] = {
		bottomTabBarHidden = true,
		sideTabBarHidden = true,
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.ContactsList] = {
		bottomTabBarHidden = true,
		sideTabBarHidden = true,
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.UAppBlock] = {
		nameLocalizationKey = "CommonUI.Features.Label.Startup",
		tabBarHidden = SystemBarVisibilityModule.Hidden
	},
	[AppPageModule.PassesPage] = {
		nameLocalizationKey = "Feature.GameDetails.Label.Store",
		appShellReporterFeature = Enum.AppShellFeature.GamePage
	},
	[AppPageModule.SocialMessageToast] = { renderUnderlyingPage = true, disableBackButton = true },
	[AppPageModule.ProfileQRCodePage] = {
		absorbInput = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ParentVerification] = {
		webView = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else nil
	},
	[AppPageModule.EmailVerification] = {
		webView = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else nil
	},
	[AppPageModule.AddAuthMethodPage] = { tabBarHidden = SystemBarVisibilityModule.Hidden },
	[AppPageModule.PasskeyUpsellScreen] = if FFlagPasskeyUpsellEnabled then {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	} else nil,
	[AppPageModule.PlatformLockedPage] = if GetFFlagEnablePlatformRestrictedEventReceiverFunction() then { tabBarHidden = SystemBarVisibilityModule.Hidden } else nil,
	[AppPageModule.TutorialUpsellScreen] = if FFlagTutorialUpsellEnabled then {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	} else nil,
	[AppPageModule.SponsoredTooltipPeekView] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.InfoPeekView] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.ReportDialog] = { disableBackButton = false, renderUnderlyingPage = true },
	[AppPageModule.SetNicknameModal] = if FFlagFriendRequestNicknames then {
		overlayEnabled = true,
		transparent = true,
		absorbInput = true,
		overlayTransparency = 0.5,
		renderUnderlyingPage = true,
		disableBackButton = true,
		bottomTabBarHidden = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	} else nil,
	[AppPageModule.VoiceTrialUpsell] = if GetFFlagEnableVoiceTrialUpsellCardModule() then { renderUnderlyingPage = true, absorbInput = true } else nil,
	[AppPageModule.GameFilterMenuPeekView] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		isPeekView = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	},
	[AppPageModule.VideoFullscreen] = if FFlagAddVideoToCommunityProfile then {
		renderUnderlyingPage = true,
		disableBackButton = false,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	} else nil
}

if GetFFlagLuaAppChallengeDialogContainerPageEnabledFunction() then
	config[AppPageModule.ChallengeDialogModalContainer] = {
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	}
end
if GetFFlagEnableAbuseReport10ftFunction() then
	config[AppPageModule.ReportScreen] = {
		nameLocalizationKey = "Feature.GameDetails.Label.ReportAbuse",
		renderUnderlyingPage = false,
		tabBarHidden = SystemBarVisibilityModule.Visible
	}
end
if GetFFlagEnableNativeWrapperAppPageModule() then
	config[AppPageModule.ChallengeNativeWrapper] = {
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	}
end
if GetFFlagFixNavBarStartupDuplicateAnimModule() then
	config[AppPageModule.PlatformAccountRouter] = { tabBarHidden = SystemBarVisibilityModule.Hidden }
end
config[AppPageModule.DiscoverabilityOverlay] = {
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true,
	tabBarHidden = SystemBarVisibilityModule.Hidden
}
config[AppPageModule.FindFriendsModal] = {
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true,
	tabBarHidden = SystemBarVisibilityModule.Hidden
}
config[AppPageModule.ContactsRevokedAccessDialog] = {
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true,
	tabBarHidden = SystemBarVisibilityModule.Hidden
}
config[AppPageModule.SettingsPermissionInteractiveAlert] = {
	bottomTabBarHidden = true,
	sideTabBarHidden = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true,
	tabBarHidden = SystemBarVisibilityModule.Hidden
}
config[AppPageModule.TrustedContactsEducationModal] = {
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true,
	tabBarHidden = if TCEducationModalSideBarPolicy then nil else SystemBarVisibilityModule.Hidden,
	bottomTabBarHidden = not TCEducationModalSideBarPolicy or nil,
	sideTabBarHidden = not TCEducationModalSideBarPolicy or nil
}

if FFlagProfilePlatformAddTC then
	config[AppPageModule.TrustedContactsModal] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true,
		overlayTransparency = if FFlagTCModalUseFoundationOverlay then 1 else nil
	}
end
config[AppPageModule.TrustedFriendsVPCPrologue] = {
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}
config[AppPageModule.FAEUpsell] = {
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true
}
config[AppPageModule.FriendsRenameInfoModal] = {
	isPeekView = true,
	renderUnderlyingPage = true,
	disableBackButton = true,
	overlayEnabled = true,
	absorbInput = true,
	tabBarHidden = SystemBarVisibilityModule.PolicyDependent
}

if FFlagTCShareLinkErrorModal then
	config[AppPageModule.TrustedFriendsShareLinkErrorModal] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true,
		absorbInput = true
	}
end
if FFlagEnableSocialProofUserList then
	config[AppPageModule.FriendsOwnedUserList] = {
		renderUnderlyingPage = true,
		isPeekView = true,
		overlayEnabled = true
	}
end
if FFlagEnableSocialProofVerticalUserListSheet then
	config[AppPageModule.SocialProofVerticalUserListSheet] = {
		renderUnderlyingPage = true,
		isPeekView = true,
		overlayEnabled = true
	}
end
if FFlagEnableSchoolEntry then
	config[AppPageModule.Schools] = {
		renderUnderlyingPage = true,
		disableBackButton = true,
		overlayEnabled = true
	}
end
config[AppPageModule.MutualConnectionList] = {
	renderUnderlyingPage = true,
	isPeekView = true,
	overlayEnabled = true
}

if FFlagEnableSocialTabsPage then
	config[AppPageModule.SocialTabsPage] = {
		hasSubNavigation = true,
		nativeWrapper = false,
		renderUnderlyingPage = true,
		bottomTabBarHidden = true,
		overlayEnabled = true,
		overlayTransparency = 0.5,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	}
end
config[AppPageModule.BlockingModal] = { renderUnderlyingPage = true, overlayEnabled = true }
config[AppPageModule.AboutDetailsSheet] = {
	isPeekView = true,
	renderUnderlyingPage = true,
	overlayEnabled = true
}
config[AppPageModule.NotApprovedPage] = {
	disableBackButton = true,
	disableAppTopBanner = true,
	tabBarHidden = SystemBarVisibilityModule.Hidden
}

if FFlagEnableLeftNavOnConsole then
	config[AppPageModule.AdjustScreen] = { tabBarHidden = SystemBarVisibilityModule.Hidden }
	config[AppPageModule.ExperienceDetail] = {
		tabBarHidden = if GuiService:IsTenFootInterface() then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	}
end
if FFlagEnableBlackbird then
	config[AppPageModule.Blackbird] = {
		webView = true,
		nativeWrapper = true,
		renderUnderlyingPage = true,
		tabBarHidden = if WebViewHideLuaSideBar then SystemBarVisibilityModule.Hidden else SystemBarVisibilityModule.PolicyDependent
	}
end
if FFlagLuaAppEnableStratusStreamingTestOnly then
	config[AppPageModule.VideoServer] = {
		nameLocalizationKey = "CommonUI.Features.Label.Nil",
		disableAppTopBanner = true,
		disableBackButton = true,
		tabBarHidden = SystemBarVisibilityModule.Hidden
	}
end
if FFlagEnableMobileGameJoinCard then
	config[AppPageModule.GameJoinCard] = {
		isPeekView = true,
		renderUnderlyingPage = true,
		overlayEnabled = true,
		tabBarHidden = SystemBarVisibilityModule.PolicyDependent
	}
end
if FFlagEnableArgus then
	config[AppPageModule.Moments] = {
		nameLocalizationKey = "CommonUI.Features.Label.Moments",
		overridesAppRouterTabBarControl = true,
		appShellReporterFeature = Enum.AppShellFeature.WatchPage
	}
	
	if FFlagMomentsFeedWatchPageAttribution then
		config[FStringMomentsFeedWatchPageRouteName] = { appShellReporterFeature = Enum.AppShellFeature.WatchPage }
	end
	if FFlagEnableArgusImmersiveNav then
		config[AppPageModule.MomentsImmersive] = {
			nameLocalizationKey = "CommonUI.Features.Label.Moments",
			disableAppTopBanner = true,
			tabBarHidden = SystemBarVisibilityModule.Hidden,
			appShellReporterFeature = Enum.AppShellFeature.WatchPage
		}
	end
end
return config