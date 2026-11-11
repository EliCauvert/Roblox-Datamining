local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AppPageModule = require(Modules.LuaApp.AppPage)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local BuildCreatorWebNavUrlModule = require(Modules.LuaApp.buildCreatorWebNavUrl)
local NumericalBadgeModule = require(Modules.LuaApp.Components.NumericalBadge)
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local VRConstants = require(CorePackages.Workspace.Packages.VrCompatibility).VRConstants
local GetFFlagCommunitiesUseVisualConfigUtilFunction = SharedFlagsModule.getFFlagCommunitiesUseVisualConfigUtil
local GetFFlagUseCommunitiesTranslationFunction = SharedFlagsModule.GetFFlagUseCommunitiesTranslation
local LuaAppsEnableParentalControlsTab = game:DefineFastFlag("LuaAppsEnableParentalControlsTab", false)
local GetFStringPlatformEventUrlFunction = SharedFlagsModule.GetFStringPlatformEventUrl
local GetFFlagEnableGUACControlTOSPPLinksModule = require(Modules.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks)
local LuobuCJVAboutUSCorpUrlOverride = game:DefineFastString("LuobuCJVAboutUSCorpUrlOverride", "https://roblox.qq.com/?webview=true0409")
local GetFFlagEnableGateNotificationPreferencesTabFunction = SharedFlagsModule.GetFFlagEnableGateNotificationPreferencesTab
local RenameSettingsTabsSentenceCase = game:DefineFastFlag("RenameSettingsTabsSentenceCase", false)
local FFlagEnableBlackbird = SharedFlagsModule.FFlagEnableBlackbird
local FFlagEnableBlackbirdOnMorePage = SharedFlagsModule.FFlagEnableBlackbirdOnMorePage
local FFlagEnableArgus = SharedFlagsModule.FFlagEnableArgus
local FFlagEnableArgusFlyoutEntry = SharedFlagsModule.FFlagEnableArgusFlyoutEntry
local FFlagArgoEnableMoments = SharedFlagsModule.FFlagArgoEnableMoments
local FFlagArgusTabImpliesFlyout = SharedFlagsModule.FFlagArgusTabImpliesFlyout
local FoundationModule = if FFlagEnableBlackbird and FFlagEnableBlackbirdOnMorePage then require(CorePackages.Packages.Foundation) else nil
local GetFStringBlackbirdUrlFunction = SharedFlagsModule.GetFStringBlackbirdUrl
local LearnPlaceURI = game:DefineFastString("LearnPlaceURI", "roblox://experiences/start?placeId=92498145666402")
local RMPlaceURI = game:DefineFastString("RMPlaceURI", "roblox://experiences/start?placeId=119524072047648")
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagEnableRobuxTransferLimitSettingsModule = require(Modules.LuaApp.Flags.FFlagEnableRobuxTransferLimitSettings)
local FFlagMorePageTermsPrivacyFooterModule = require(Modules.LuaApp.Flags.FFlagMorePageTermsPrivacyFooter)
local FFlagFlyoutTermsPrivacyFooter = if FFlagEnableFlyoutSidePanelModule then require(CorePackages.Workspace.Packages.FlyoutSidePanel).Flags.FFlagFlyoutTermsPrivacyFooter else false
local FFlagCreateConnectionsHub = SharedFlagsModule.FFlagCreateConnectionsHub
local GetFFlagEnableCommunityListExperimentationFunction = SharedFlagsModule.GetFFlagEnableCommunityListExperimentation
local FFlagConnectionsToFriendsRename = SharedFlagsModule.FFlagConnectionsToFriendsRename
local FFlagCTAChangeLogOutToSignOutModule = require(Modules.LuaApp.Flags.FFlagCTAChangeLogOutToSignOut)
local FFlagEnableSafetyDashboardModule = require(Modules.LuaApp.Flags.FFlagEnableSafetyDashboard)
local GetFFlagEnableSupportCenterFunction = SharedFlagsModule.GetFFlagEnableSupportCenter
local GetAppFeaturePoliciesFunction = require(CorePackages.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies
local CommunityListExperimentation = require(CorePackages.Workspace.Packages.Groups).Experiments.CommunityListExperimentation
local ItemType = {
	VRFTUX = "VRFTUX",
	Catalog = "Catalog",
	BuildersClub = "BuildersClub",
	DevSubs = "DevSubs",
	Trades = "Trades",
	Profile = "Profile",
	TencentNoticeCenter = "TencentNoticeCenter",
	TencentHelp = "TencentHelp",
	UserInfo = "UserInfo",
	Friends = "Friends",
	Groups = "Groups",
	Inventory = "Inventory",
	Messages = "Messages",
	CreateGames = "CreateGames",
	Blog = "Blog",
	GiftCards = "GiftCards",
	Redeem = "Redeem",
	OfficialStore = "OfficialStore",
	Settings = "Settings",
	AdjustScreen = "AdjustScreen",
	SafetySupport = "SafetySupport",
	About = "About",
	Help = "Help",
	LoginCode = "Login Code",
	ReportLogs = "Report Logs",
	LogOut = "LogOut",
	TheHunt = "TheHunt",
	About_AboutUs = "About_AboutUs",
	About_AboutUs_CJV = "About_AboutUs_CJV",
	About_Careers = "About_Careers",
	About_Parents = "About_Parents",
	About_Terms = "About_Terms",
	About_Privacy = "About_Privacy",
	About_PrivacyGuidelinesChildren = "About_PrivacyGuidelinesChildren",
	About_LuobuRiderTerms = "About_LuobuRiderTerms",
	About_LuobuThirdPartyDataUse = "About_LuobuThirdPartyDataUse",
	About_AppInformation = "About_AppInformation",
	About_AboutSection = "About_AboutSection",
	About_TermsOfService = "About_TermsOfService",
	About_LicensingSection = "About_LicensingSection",
	About_VersionSection = "About_VersionSection",
	SafetySupport_AccountStatus = "SafetySupport_AccountStatus",
	SafetySupport_ReportAppeals = "SafetySupport_ReportAppeals",
	SafetySupport_Help = "SafetySupport_Help",
	SafetySupport_SupportCenter = "SafetySupport_SupportCenter",
	Settings_AccountInfo = "Settings_AccountInfo",
	Settings_Security = "Settings_Security",
	Settings_Privacy = "Settings_Privacy",
	Settings_ParentalControls = "Settings_ParentalControls",
	Settings_Billing = "Settings_Billing",
	Settings_Subscriptions = "Settings_Subscriptions",
	Settings_Robux = "Settings_Robux",
	Settings_Notifications = "Settings_Notifications",
	Settings_Accessibility = "Settings_Accessibility",
	Settings_Tencent_Reputation = "Settings_Tencent_Reputation",
	Settings_Cross_Play = "Settings_Cross_Play",
	Settings_SwitchProfileSection = "Settings_SwitchProfileSection",
	Settings_AccountSettingsSection = "Settings_AccountSettingsSection",
	Settings_AccountSettingsInfo = "Settings_AccountSettingsInfo",
	Settings_DeviceSettingsSection = "Settings_DeviceSettingsSection"
}
local SectionType = {
	Content = "Content",
	Navigation = "Navigation",
	Action = "Action"
}
local v1 = require(CorePackages.Workspace.Packages.AppChat.getAppChatCommunitiesVisualConfig)()
local Lowered = string.lower(game:GetService("UserInputService"):GetPlatform().Name)
local GiftCardSourceRefOverride = GetAppFeaturePoliciesFunction().getGiftCardSourceRefOverride()
local config = {
	[ItemType.VRFTUX] = "CommonUI.Features.Label.VRFTUX",
	[ItemType.Catalog] = "Feature.Avatar.Action.Marketplace",
	[ItemType.BuildersClub] = "CommonUI.Features.Label.Premium",
	[ItemType.DevSubs] = "CommonUI.Features.Label.DevSubs",
	[ItemType.Trades] = "CommonUI.Features.Label.Trades",
	[ItemType.Profile] = "CommonUI.Features.Label.Profile",
	[ItemType.TencentHelp] = "CommonUI.Features.Label.Help",
	[ItemType.TencentNoticeCenter] = "CommonUI.Features.Label.TencentNotice",
	[ItemType.Friends] = if FFlagConnectionsToFriendsRename then "CommonUI.Features.Label.Friends" else "CommonUI.Features.Label.Connections",
	[ItemType.Groups] = if GetFFlagCommunitiesUseVisualConfigUtilFunction() then v1.label elseif GetFFlagUseCommunitiesTranslationFunction() then "CommonUI.Features.Label.Groups" else "CommonUI.Features.Label.sGroups",
	[ItemType.Inventory] = "CommonUI.Features.Label.Inventory",
	[ItemType.Messages] = "CommonUI.Features.Label.Messages",
	[ItemType.CreateGames] = "CommonUI.Features.Label.CreateGames",
	[ItemType.TheHunt] = "CommonUI.Features.Label.TheHunt",
	[ItemType.Blog] = "CommonUI.Features.Label.Blog",
	[ItemType.GiftCards] = "CommonUI.Features.Label.GiftCards",
	[ItemType.Redeem] = "CommonUI.Features.Label.Redeem",
	[ItemType.OfficialStore] = "CommonUI.Features.Label.OfficialStore",
	[ItemType.Settings] = "CommonUI.Features.Label.Settings",
	[ItemType.AdjustScreen] = "CommonUI.Features.Label.AdjustScreen",
	[ItemType.About] = "CommonUI.Features.Label.About",
	[ItemType.SafetySupport] = "CommonUI.Features.Label.HelpAndSafety",
	[ItemType.SafetySupport_AccountStatus] = if FFlagEnableSafetyDashboardModule then "Feature.SafetyDashboard.Heading.AccountStatus" else nil,
	[ItemType.SafetySupport_ReportAppeals] = if FFlagEnableSafetyDashboardModule then "Feature.AppealsPortal.Heading.ViolationsAndAppeals" else "Feature.AppealsPortal.Label.ReportAndAppeals",
	[ItemType.SafetySupport_SupportCenter] = if GetFFlagEnableSupportCenterFunction() then "CommonUI.Features.Label.SupportCenter" else nil,
	[ItemType.Help] = "CommonUI.Features.Label.Help",
	[ItemType.LoginCode] = "Authentication.CrossDevice.Heading.QuickLogin",
	[ItemType.LogOut] = if FFlagCTAChangeLogOutToSignOutModule then "Feature.AccountLock.Action.Signout" else "Application.Logout.Action.Logout",
	[ItemType.ReportLogs] = "CommonUI.Features.Label.ReportLogs",
	[ItemType.About_AboutUs] = "CommonUI.Features.Label.AboutUs",
	[ItemType.About_AboutUs_CJV] = "CommonUI.Features.Label.AboutUs",
	[ItemType.About_Careers] = "CommonUI.Features.Label.Careers",
	[ItemType.About_Parents] = "CommonUI.Features.Label.Parents",
	[ItemType.About_Terms] = "CommonUI.Features.Label.Terms",
	[ItemType.About_Privacy] = "CommonUI.Features.Label.Privacy",
	[ItemType.About_PrivacyGuidelinesChildren] = "CommonUI.Features.Label.PrivacyGuidelinesChildren",
	[ItemType.About_LuobuRiderTerms] = "CommonUI.Features.Label.LuobuRiderTerms",
	[ItemType.About_LuobuThirdPartyDataUse] = "CommonUI.Features.Label.LuobuThirdPartyDataUse",
	[ItemType.About_AppInformation] = "CommonUI.Features.Label.AppInformation",
	[ItemType.About_AboutSection] = "CommonUI.Features.Label.About",
	[ItemType.About_TermsOfService] = "CommonUI.Features.Label.TermsOfService",
	[ItemType.About_LicensingSection] = "CommonUI.Features.Label.Licensing",
	[ItemType.About_VersionSection] = "CommonUI.Features.Label.Version",
	[ItemType.Settings_AccountInfo] = if RenameSettingsTabsSentenceCase then "Feature.AccountSettings.Heading.Tab.AccountInfoV2" else "Feature.AccountSettings.Heading.Tab.AccountInfo",
	[ItemType.Settings_Security] = "Feature.AccountSettings.Heading.Tab.Security",
	[ItemType.Settings_Privacy] = "Feature.AccountSettings.Heading.Tab.PrivacyContentRestrictions",
	[ItemType.Settings_ParentalControls] = if RenameSettingsTabsSentenceCase then "Feature.AccountSettings.Heading.Tab.ParentalControlsV2" else "Feature.AccountSettings.Heading.Tab.ParentalControls",
	[ItemType.Settings_Billing] = if GetAppFeaturePoliciesFunction().getRenamePaymentsToSpendingTab() then "Feature.AccountSettings.Heading.Tab.Spending" elseif RenameSettingsTabsSentenceCase then "Feature.AccountSettings.Heading.Tab.BillingV2" else "Feature.AccountSettings.Heading.Tab.Billing",
	[ItemType.Settings_Subscriptions] = "Feature.AccountSettings.Heading.Tab.Subscriptions",
	[ItemType.Settings_Robux] = "Feature.AccountSettings.Heading.Tab.Robux",
	[ItemType.Settings_Notifications] = "Feature.AccountSettings.Heading.Tab.Notifications",
	[ItemType.Settings_Accessibility] = if RenameSettingsTabsSentenceCase then "Feature.Accessibility.Heading.DevicePreferencesV2" else "Feature.Accessibility.Heading.DevicePreferences",
	[ItemType.Settings_Tencent_Reputation] = "Feature.AccountSettings.Label.TencentReputation",
	[ItemType.Settings_SwitchProfileSection] = "Feature.Settings.Heading.SwitchProfile",
	[ItemType.Settings_AccountSettingsSection] = "Feature.Settings.Heading.AccountSettings"
}
local config1 = {
	[ItemType.VRFTUX] = Images["icons/menu/vrheadset_large"],
	[ItemType.Catalog] = Images["icons/menu/shop_large"],
	[ItemType.BuildersClub] = Images["icons/status/premium_large"],
	[ItemType.DevSubs] = Images["icons/status/player/developer"],
	[ItemType.Trades] = Images["icons/menu/trade"],
	[ItemType.Profile] = Images["icons/actions/friend_sort/my_profile"],
	[ItemType.TencentHelp] = Images["icons/menu/help_large"],
	[ItemType.TencentNoticeCenter] = Images["icons/menu/events_large"],
	[ItemType.Friends] = Images["icons/menu/friends_large"],
	[ItemType.Groups] = if GetFFlagCommunitiesUseVisualConfigUtilFunction() then Images[v1.iconLarge] else Images["icons/menu/groups_large"],
	[ItemType.Inventory] = Images["icons/menu/inventory_large"],
	[ItemType.Messages] = Images["icons/menu/messages_large"],
	[ItemType.CreateGames] = Images["icons/menu/create_large"],
	[ItemType.TheHunt] = Images["icons/menu/events_large"],
	[ItemType.Blog] = Images["icons/menu/blog_large"],
	[ItemType.GiftCards] = Images["icons/menu/giftcard_large"],
	[ItemType.Redeem] = Images["icons/menu/wallet"],
	[ItemType.OfficialStore] = Images["icons/menu/officialstore_large"],
	[ItemType.Settings] = Images["icons/menu/settings_large"],
	[ItemType.AdjustScreen] = Images["icons/menu/adjust/scale"],
	[ItemType.About] = Images["icons/menu/about_large"],
	[ItemType.SafetySupport] = Images["icons/menu/protection"],
	[ItemType.Help] = Images["icons/menu/help_large"],
	[ItemType.LoginCode] = Images["icons/graphic/lock_xxlarge"],
	[ItemType.ReportLogs] = Images["icons/menu/giftcard_large"]
}
local config2 = {
	[ItemType.Catalog] = UrlBuilderModule.static.catalog(),
	[ItemType.BuildersClub] = UrlBuilderModule.static.buildersClub(),
	[ItemType.Trades] = UrlBuilderModule.static.trades(),
	[ItemType.Profile] = UrlBuilderModule.static.profile(),
	[ItemType.Friends] = UrlBuilderModule.static.friends(),
	[ItemType.Groups] = UrlBuilderModule.static.groups(),
	[ItemType.Inventory] = UrlBuilderModule.static.inventory(),
	[ItemType.Messages] = UrlBuilderModule.static.messages(),
	[ItemType.CreateGames] = BuildCreatorWebNavUrlModule({ utm_content = "more_page" }),
	[ItemType.TheHunt] = if GetFStringPlatformEventUrlFunction() == "" then UrlBuilderModule.static.help() else UrlBuilderModule.fromString(GetFStringPlatformEventUrlFunction())(),
	[ItemType.Blog] = UrlBuilderModule.static.blog(),
	[ItemType.OfficialStore] = UrlBuilderModule.static.amazonStore(),
	[ItemType.GiftCards] = UrlBuilderModule.static.giftCards(),
	[ItemType.GiftCards] = UrlBuilderModule.static.giftCards((if GiftCardSourceRefOverride == "" then Lowered else GiftCardSourceRefOverride) .. "-" .. game:DefineFastString("GiftCardSourceParam", "more-page")),
	[ItemType.Redeem] = UrlBuilderModule.static.redeem(),
	[ItemType.Help] = UrlBuilderModule.static.help(),
	[ItemType.SafetySupport_AccountStatus] = if FFlagEnableSafetyDashboardModule then UrlBuilderModule.static.safetyDashboard.main({ source = "app-help-safety" }) else nil,
	[ItemType.SafetySupport_ReportAppeals] = UrlBuilderModule.static.appealsPortal.main({ source = "app-help-safety" }),
	[ItemType.SafetySupport_SupportCenter] = if GetFFlagEnableSupportCenterFunction() then UrlBuilderModule.static.supportCenter.main() else nil,
	[ItemType.About_AboutUs] = UrlBuilderModule.static.about.us(),
	[ItemType.About_AboutUs_CJV] = if LuobuCJVAboutUSCorpUrlOverride == "" then UrlBuilderModule.static.about.us() else UrlBuilderModule.fromString(LuobuCJVAboutUSCorpUrlOverride)() or UrlBuilderModule.static.about.us(),
	[ItemType.About_Careers] = UrlBuilderModule.static.about.careers(),
	[ItemType.About_Parents] = UrlBuilderModule.static.about.parents(),
	[ItemType.About_Terms] = UrlBuilderModule.static.about.terms({ useGameQQUrls = true }),
	[ItemType.About_Privacy] = UrlBuilderModule.static.about.privacy({ useGameQQUrls = true }),
	[ItemType.About_PrivacyGuidelinesChildren] = UrlBuilderModule.static.tencent.childrenPrivacyGuide(),
	[ItemType.About_LuobuRiderTerms] = UrlBuilderModule.static.tencent.luobuRiderTerms(),
	[ItemType.About_LuobuThirdPartyDataUse] = UrlBuilderModule.static.tencent.luobuThirdPartyDataUse(),
	[ItemType.Settings_AccountInfo] = UrlBuilderModule.static.settings.account(),
	[ItemType.Settings_Security] = UrlBuilderModule.static.settings.security(),
	[ItemType.Settings_Privacy] = UrlBuilderModule.static.settings.privacy(),
	[ItemType.Settings_ParentalControls] = UrlBuilderModule.static.settings.parentalControls(),
	[ItemType.Settings_Billing] = UrlBuilderModule.static.settings.billing(),
	[ItemType.Settings_Subscriptions] = UrlBuilderModule.static.settings.subscriptions(),
	[ItemType.Settings_Robux] = UrlBuilderModule.static.settings.robux(),
	[ItemType.Settings_Notifications] = UrlBuilderModule.static.settings.notifications(),
	[ItemType.Settings_Tencent_Reputation] = UrlBuilderModule.static.tencent.reputationInfo()
}

local function v43(Help, SettingsSubPage, FallbackToExternalBrowser)
	-- upvalues: AppPageModule (copy), config (copy), config2 (copy)
	return if Help then {
		page = SettingsSubPage or AppPageModule.GenericWebPage,
		titleKey = config[Help],
		url = config2[Help],
		fallbackToExternalBrowser = FallbackToExternalBrowser
	} else {}
end

local Groups = ItemType.Groups
local config3 = {
	rightImage = "LuaApp/icons/navigation/pushRight_small",
	badgeCount = 0,
	itemType = ItemType.Groups,
	textKey = config[ItemType.Groups],
	icon = config1[ItemType.Groups],
	getSearchParams = function(WIDE)
		-- upvalues: FormFactor (copy)
		return if WIDE == FormFactor.WIDE then { searchType = "Groups" } else nil
	end,
	context = if GetFFlagEnableCommunityListExperimentationFunction() and CommunityListExperimentation.getCommunityListEnabled() then { page = AppPageModule.Groups } else v43(ItemType.Groups)
}
ItemType.Learn = "Learn"
config[ItemType.Learn] = "CommonUI.Features.Label.Learn"
config1[ItemType.Learn] = Images["icons/menu/education"]
local ItemInfo = {
	[ItemType.VRFTUX] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.VRFTUX,
		textKey = config[ItemType.VRFTUX],
		icon = config1[ItemType.VRFTUX],
		context = {
			page = AppPageModule.ExperienceDetail,
			url = VRConstants.FTUX.UniverseId
		}
	},
	[ItemType.Catalog] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Catalog,
		textKey = config[ItemType.Catalog],
		icon = config1[ItemType.Catalog],
		context = { page = AvatarScreen.Catalog }
	},
	[ItemType.BuildersClub] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.BuildersClub,
		textKey = config[ItemType.BuildersClub],
		icon = config1[ItemType.BuildersClub],
		context = { page = AppPageModule.BuildersClub }
	},
	[ItemType.DevSubs] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.DevSubs,
		textKey = config[ItemType.DevSubs],
		icon = config1[ItemType.DevSubs],
		context = { page = AppPageModule.DevSubs }
	},
	[ItemType.Trades] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Trades,
		textKey = config[ItemType.Trades],
		icon = config1[ItemType.Trades],
		context = v43(ItemType.Trades)
	},
	[ItemType.Profile] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Profile,
		textKey = config[ItemType.Profile],
		icon = config1[ItemType.Profile],
		urlGenerator = function(p1)
			return p1
		end,
		context = { page = AppPageModule.ProfilePlatform }
	},
	[ItemType.Friends] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Friends,
		textKey = config[ItemType.Friends],
		icon = config1[ItemType.Friends],
		badgeComponent = NumericalBadgeModule,
		urlGenerator = function(UserId)
			-- upvalues: UrlBuilderModule (copy)
			return UserId and UrlBuilderModule.user.friends({ userId = UserId }) or nil
		end,
		getSearchParams = function()
			return { searchType = "Players" }
		end,
		context = {
			page = if FFlagCreateConnectionsHub then AppPageModule.CoHubMyConnections else AppPageModule.ViewFriends
		}
	},
	[Groups] = config3,
	[ItemType.Inventory] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Inventory,
		textKey = config[ItemType.Inventory],
		icon = config1[ItemType.Inventory],
		urlGenerator = function(UserId)
			-- upvalues: UrlBuilderModule (copy)
			return UserId and UrlBuilderModule.user.inventory({ userId = UserId }) or nil
		end,
		context = v43(ItemType.Inventory)
	},
	[ItemType.Messages] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Messages,
		textKey = config[ItemType.Messages],
		icon = config1[ItemType.Messages],
		badgeComponent = NumericalBadgeModule,
		context = v43(ItemType.Messages)
	},
	[ItemType.CreateGames] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.CreateGames,
		textKey = config[ItemType.CreateGames],
		icon = config1[ItemType.CreateGames],
		context = v43(ItemType.CreateGames)
	},
	[ItemType.TencentHelp] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.TencentHelp,
		textKey = config[ItemType.Help],
		icon = config1[ItemType.Help],
		context = {
			page = AppPageModule.TencentHelp,
			titleKey = config[ItemType.Help]
		}
	},
	[ItemType.TencentNoticeCenter] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.TencentNoticeCenter,
		textKey = config[ItemType.TencentNoticeCenter],
		icon = config1[ItemType.TencentNoticeCenter],
		context = { page = AppPageModule.TencentNoticeCenter }
	},
	[ItemType.TheHunt] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.TheHunt,
		textKey = config[ItemType.TheHunt],
		icon = config1[ItemType.TheHunt],
		context = v43(ItemType.TheHunt)
	},
	[ItemType.Blog] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Blog,
		textKey = config[ItemType.Blog],
		icon = config1[ItemType.Blog],
		context = v43(ItemType.Blog, nil, true)
	},
	[ItemType.GiftCards] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.GiftCards,
		textKey = config[ItemType.GiftCards],
		icon = config1[ItemType.GiftCards],
		context = v43(ItemType.GiftCards, nil, true)
	},
	[ItemType.Redeem] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Redeem,
		textKey = config[ItemType.Redeem],
		icon = config1[ItemType.Redeem],
		context = v43(ItemType.Redeem)
	},
	[ItemType.OfficialStore] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.OfficialStore,
		textKey = config[ItemType.OfficialStore],
		icon = config1[ItemType.OfficialStore],
		context = v43(ItemType.OfficialStore, nil, true)
	},
	[ItemType.Settings] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings,
		textKey = config[ItemType.Settings],
		icon = config1[ItemType.Settings],
		badgeComponent = NumericalBadgeModule,
		context = { page = AppPageModule.Settings }
	},
	[ItemType.AdjustScreen] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.AdjustScreen,
		textKey = config[ItemType.AdjustScreen],
		icon = config1[ItemType.AdjustScreen],
		context = { page = AppPageModule.AdjustScreen }
	},
	[ItemType.About] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.About,
		textKey = config[ItemType.About],
		icon = config1[ItemType.About],
		context = { page = AppPageModule.About }
	},
	[ItemType.SafetySupport] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.SafetySupport,
		textKey = config[ItemType.SafetySupport],
		icon = config1[ItemType.SafetySupport],
		context = { page = AppPageModule.SafetySupport }
	},
	[ItemType.ReportLogs] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.ReportLogs,
		textKey = config[ItemType.ReportLogs],
		icon = config1[ItemType.ReportLogs],
		context = {}
	},
	[ItemType.Help] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.Help,
		textKey = config[ItemType.Help],
		icon = config1[ItemType.Help],
		context = v43(ItemType.Help, nil, true)
	},
	[ItemType.LoginCode] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.LoginCode,
		textKey = config[ItemType.LoginCode],
		icon = config1[ItemType.LoginCode],
		context = { page = AppPageModule.CrossDeviceLogin }
	},
	[ItemType.LogOut] = {
		badgeCount = 0,
		itemType = ItemType.LogOut,
		textKey = config[ItemType.LogOut],
		textXAlignment = Enum.TextXAlignment.Center,
		context = { page = AppPageModule.LogoutConfirmation }
	},
	[ItemType.UserInfo] = { itemType = ItemType.UserInfo },
	[ItemType.Settings_Cross_Play] = { itemType = ItemType.Settings_Cross_Play },
	[ItemType.SafetySupport_AccountStatus] = if FFlagEnableSafetyDashboardModule then {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.SafetySupport_AccountStatus,
		textKey = config[ItemType.SafetySupport_AccountStatus],
		context = v43(ItemType.SafetySupport_AccountStatus, nil, true)
	} else nil,
	[ItemType.SafetySupport_ReportAppeals] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.SafetySupport_ReportAppeals,
		textKey = config[ItemType.SafetySupport_ReportAppeals],
		context = v43(ItemType.SafetySupport_ReportAppeals)
	},
	[ItemType.SafetySupport_Help] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.SafetySupport_Help,
		textKey = config[ItemType.Help],
		context = v43(ItemType.Help)
	},
	[ItemType.SafetySupport_SupportCenter] = if GetFFlagEnableSupportCenterFunction() then {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.SafetySupport_SupportCenter,
		textKey = config[ItemType.SafetySupport_SupportCenter],
		context = v43(ItemType.SafetySupport_SupportCenter)
	} else nil,
	[ItemType.About_AboutUs] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.About_AboutUs,
		textKey = config[ItemType.About_AboutUs],
		context = v43(ItemType.About_AboutUs, nil, true)
	},
	[ItemType.About_AboutUs_CJV] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.About_AboutUs_CJV,
		textKey = config[ItemType.About_AboutUs],
		context = v43(ItemType.About_AboutUs_CJV)
	},
	[ItemType.About_Careers] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.About_Careers,
		textKey = config[ItemType.About_Careers],
		context = v43(ItemType.About_Careers, nil, true)
	},
	[ItemType.About_Parents] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.About_Parents,
		textKey = config[ItemType.About_Parents],
		context = v43(ItemType.About_Parents, nil, true)
	},
	[ItemType.About_Terms] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.About_Terms,
		textKey = config[ItemType.About_Terms],
		context = v43(ItemType.About_Terms, nil, true),
		urlGenerator = if GetFFlagEnableGUACControlTOSPPLinksModule() then function(_, p1)
			-- upvalues: config2 (copy), ItemType (copy)
			local TermsOfUseLink = if p1 then p1.getTermsOfUseLink() else nil
			
			if TermsOfUseLink == nil or TermsOfUseLink == "" then
				TermsOfUseLink = config2[ItemType.About_Terms]
			end
			return TermsOfUseLink
		end else nil
	},
	[ItemType.About_Privacy] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		shouldOpenInExternalBrowser = true,
		itemType = ItemType.About_Privacy,
		textKey = config[ItemType.About_Privacy],
		context = v43(ItemType.About_Privacy, nil, true),
		urlGenerator = if GetFFlagEnableGUACControlTOSPPLinksModule() then function(_, p1)
			-- upvalues: config2 (copy), ItemType (copy)
			local PrivacyPolicyLink = if p1 then p1.getPrivacyPolicyLink() else nil
			
			if PrivacyPolicyLink == nil or PrivacyPolicyLink == "" then
				PrivacyPolicyLink = config2[ItemType.About_Privacy]
			end
			return PrivacyPolicyLink
		end else nil
	},
	[ItemType.About_PrivacyGuidelinesChildren] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.About_PrivacyGuidelinesChildren,
		textKey = config[ItemType.About_PrivacyGuidelinesChildren],
		context = v43(ItemType.About_PrivacyGuidelinesChildren)
	},
	[ItemType.About_LuobuRiderTerms] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.About_LuobuRiderTerms,
		textKey = config[ItemType.About_LuobuRiderTerms],
		context = v43(ItemType.About_LuobuRiderTerms)
	},
	[ItemType.About_LuobuThirdPartyDataUse] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.About_LuobuThirdPartyDataUse,
		textKey = config[ItemType.About_LuobuThirdPartyDataUse],
		context = v43(ItemType.About_LuobuThirdPartyDataUse)
	},
	[ItemType.About_AppInformation] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.About_AppInformation,
		textKey = config[ItemType.About_AppInformation],
		context = { page = AppPageModule.AppInformation }
	},
	[ItemType.About_VersionSection] = {
		itemType = ItemType.About_VersionSection,
		textKey = config[ItemType.About_VersionSection]
	},
	[ItemType.Settings_AccountInfo] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_AccountInfo,
		textKey = config[ItemType.Settings_AccountInfo],
		badgeComponent = NumericalBadgeModule,
		context = v43(ItemType.Settings_AccountInfo, AppPageModule.AccountInfo)
	},
	[ItemType.Settings_Security] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Security,
		textKey = config[ItemType.Settings_Security],
		context = v43(ItemType.Settings_Security, AppPageModule.SettingsSubPage)
	},
	[ItemType.Settings_Privacy] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Privacy,
		textKey = config[ItemType.Settings_Privacy],
		context = v43(ItemType.Settings_Privacy, AppPageModule.SettingsSubPage)
	},
	[ItemType.Settings_ParentalControls] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_ParentalControls,
		textKey = config[ItemType.Settings_ParentalControls],
		context = v43(ItemType.Settings_ParentalControls, AppPageModule.SettingsSubPage)
	},
	[ItemType.Settings_Billing] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Billing,
		textKey = config[ItemType.Settings_Billing],
		context = v43(ItemType.Settings_Billing, AppPageModule.SettingsSubPage)
	},
	[ItemType.Settings_Subscriptions] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Subscriptions,
		textKey = config[ItemType.Settings_Subscriptions],
		context = v43(ItemType.Settings_Subscriptions, AppPageModule.SettingsSubPage)
	},
	[ItemType.Settings_Robux] = if FFlagEnableRobuxTransferLimitSettingsModule then {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Robux,
		textKey = config[ItemType.Settings_Robux],
		context = v43(ItemType.Settings_Robux, AppPageModule.SettingsSubPage)
	} else nil,
	[ItemType.Settings_Notifications] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Notifications,
		textKey = config[ItemType.Settings_Notifications],
		context = v43(ItemType.Settings_Notifications, AppPageModule.SettingsSubPage)
	},
	[ItemType.Settings_Accessibility] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Accessibility,
		textKey = config[ItemType.Settings_Accessibility],
		context = { page = AppPageModule.Accessibility }
	},
	[ItemType.Settings_Tencent_Reputation] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Settings_Tencent_Reputation,
		textKey = config[ItemType.Settings_Tencent_Reputation],
		context = CryoModule.Dictionary.join({ notificationType = NotificationTypeModule.SDK_OPEN_URL }, (v43(ItemType.Settings_Tencent_Reputation, AppPageModule.SettingsSubPage)))
	},
	[ItemType.Settings_SwitchProfileSection] = {
		itemType = ItemType.Settings_SwitchProfileSection,
		textKey = config[ItemType.Settings_SwitchProfileSection]
	},
	[ItemType.Settings_AccountSettingsSection] = {
		itemType = ItemType.Settings_AccountSettingsSection,
		textKey = config[ItemType.Settings_AccountSettingsSection]
	},
	[ItemType.Settings_AccountSettingsInfo] = { itemType = ItemType.Settings_AccountSettingsInfo },
	[ItemType.Settings_DeviceSettingsSection] = { itemType = ItemType.Settings_DeviceSettingsSection },
	[ItemType.About_AboutSection] = {
		itemType = ItemType.About_AboutSection,
		textKey = config[ItemType.About_AboutSection]
	},
	[ItemType.About_TermsOfService] = {
		itemType = ItemType.About_TermsOfService,
		textKey = config[ItemType.About_TermsOfService],
		rightImage = Images["icons/navigation/externallink_medium"],
		context = { url = config2[ItemType.About_Terms] }
	},
	[ItemType.About_LicensingSection] = {
		itemType = ItemType.About_LicensingSection,
		textKey = config[ItemType.About_LicensingSection]
	},
	[ItemType.Learn] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Learn,
		textKey = config[ItemType.Learn],
		icon = config1[ItemType.Learn],
		context = { appURI = LearnPlaceURI }
	}
}

if FFlagEnableBlackbird and FFlagEnableBlackbirdOnMorePage then
	ItemType.Blackbird = "Blackbird"
	config[ItemType.Blackbird] = "CommonUI.Features.Label.X"
	config1[ItemType.Blackbird] = {
		isFoundationIcon = true,
		name = FoundationModule.Enums.IconName.RobloxPlus
	}
	config2[ItemType.Blackbird] = if GetFStringBlackbirdUrlFunction() == "" then nil else UrlBuilderModule.fromString(GetFStringBlackbirdUrlFunction())()
	ItemInfo[ItemType.Blackbird] = {
		rightImage = "LuaApp/icons/navigation/pushRight_small",
		badgeCount = 0,
		itemType = ItemType.Blackbird,
		textKey = config[ItemType.Blackbird],
		icon = config1[ItemType.Blackbird],
		context = { page = AppPageModule.Blackbird }
	}
end
ItemType.RM = "RM"
config[ItemType.RM] = "CommonUI.Features.Label.RM"
config1[ItemType.RM] = Images["icons/brands/moments_large"]
ItemInfo[ItemType.RM] = {
	rightImage = "LuaApp/icons/navigation/pushRight_small",
	badgeCount = 0,
	itemType = ItemType.RM,
	textKey = config[ItemType.RM],
	icon = config1[ItemType.RM],
	context = if (FFlagEnableArgusFlyoutEntry or (FFlagArgoEnableMoments or FFlagArgusTabImpliesFlyout)) and FFlagEnableArgus then { page = AppPageModule.Moments } else { appURI = RMPlaceURI }
}

local function v47(Enabled): boolean
	-- upvalues: FFlagEnableFlyoutSidePanelModule (copy)
	return if FFlagEnableFlyoutSidePanelModule then Enabled and type(Enabled) == "table" else Enabled ~= false
end

return {
	ItemType = ItemType,
	ItemInfo = ItemInfo,
	SectionType = SectionType,
	GetItemsInPage = function(p1, _, _, p2, p3: boolean, _, _, _, _, _)
		-- upvalues: LuaAppsEnableParentalControlsTab (copy), GetFFlagEnableGateNotificationPreferencesTabFunction (copy), GetFFlagEnableSupportCenterFunction (copy), AppPageModule (copy), SectionType (copy), ItemInfo (copy), ItemType (copy), CryoModule (copy), FFlagEnableFlyoutSidePanelModule (copy), FFlagMorePageTermsPrivacyFooterModule (copy), v47 (copy), FFlagEnableSafetyDashboardModule (copy), FFlagFlyoutTermsPrivacyFooter (copy), FFlagEnableRobuxTransferLimitSettingsModule (copy), Images (copy)
		if LuaAppsEnableParentalControlsTab then
			p3 = true
		end
		local IsSupportCenterEnabled = if GetFFlagEnableSupportCenterFunction() and type(p2) == "table" then p2.isSupportCenterEnabled else false
		local config = {
			[AppPageModule.SimplifiedMore] = {
				{
					type = SectionType.Navigation,
					contents = { ItemInfo[ItemType.About_Terms] }
				},
				{
					type = SectionType.Action,
					contents = { ItemInfo[ItemType.LogOut] }
				}
			},
			[AppPageModule.About] = {
				{
					type = SectionType.Navigation,
					contents = CryoModule.List.filter({
						ItemInfo[ItemType.About_AboutUs],
						if FFlagEnableFlyoutSidePanelModule then ItemInfo[ItemType.Blog] else false,
						ItemInfo[ItemType.About_Careers], ItemInfo[ItemType.About_Parents],
						not FFlagMorePageTermsPrivacyFooterModule and (if FFlagEnableFlyoutSidePanelModule then nil else ItemInfo[ItemType.About_Terms]),
						not FFlagMorePageTermsPrivacyFooterModule and (if FFlagEnableFlyoutSidePanelModule then nil else ItemInfo[ItemType.About_Privacy]),
						ItemInfo[ItemType.About_AppInformation]
					}, v47)
				}
			},
			[AppPageModule.SafetySupport] = {
				{
					type = SectionType.Navigation,
					contents = if FFlagEnableFlyoutSidePanelModule then CryoModule.List.filter({
						if FFlagEnableSafetyDashboardModule then ItemInfo[ItemType.SafetySupport_AccountStatus] else false,
						ItemInfo[ItemType.SafetySupport_Help],
						not FFlagEnableSafetyDashboardModule and ItemInfo[ItemType.SafetySupport_ReportAppeals],
						if GetFFlagEnableSupportCenterFunction() and IsSupportCenterEnabled then ItemInfo[ItemType.SafetySupport_SupportCenter] else false,
						ItemInfo[ItemType.About],
						not FFlagFlyoutTermsPrivacyFooter and ItemInfo[ItemType.About_Terms],
						not FFlagFlyoutTermsPrivacyFooter and ItemInfo[ItemType.About_Privacy]
					}, v47) elseif GetFFlagEnableSupportCenterFunction() then CryoModule.List.filter({
						if FFlagEnableSafetyDashboardModule then ItemInfo[ItemType.SafetySupport_AccountStatus] else false,
						ItemInfo[ItemType.SafetySupport_Help],
						not FFlagEnableSafetyDashboardModule and ItemInfo[ItemType.SafetySupport_ReportAppeals],
						if IsSupportCenterEnabled then ItemInfo[ItemType.SafetySupport_SupportCenter] else false
					}, v47) elseif FFlagEnableSafetyDashboardModule then {
						ItemInfo[ItemType.SafetySupport_AccountStatus],
						ItemInfo[ItemType.SafetySupport_Help]
					} else {
						ItemInfo[ItemType.SafetySupport_Help],
						ItemInfo[ItemType.SafetySupport_ReportAppeals]
					}
				}
			},
			[AppPageModule.CJVAbout] = {
				{
					type = SectionType.Navigation,
					contents = CryoModule.List.filter({
						ItemInfo[ItemType.About_AboutUs_CJV], ItemInfo[ItemType.About_Careers],
						ItemInfo[ItemType.About_Terms], ItemInfo[ItemType.About_Privacy],
						ItemInfo[ItemType.About_PrivacyGuidelinesChildren],
						ItemInfo[ItemType.About_LuobuRiderTerms],
						ItemInfo[ItemType.About_LuobuThirdPartyDataUse],
						ItemInfo[ItemType.About_AppInformation]
					}, v47)
				}
			},
			[AppPageModule.Settings] = {
				{
					type = SectionType.Navigation,
					contents = CryoModule.List.filter({
						ItemInfo[ItemType.Settings_AccountInfo], ItemInfo[ItemType.Settings_Security],
						ItemInfo[ItemType.Settings_Privacy],
						p3 and ItemInfo[ItemType.Settings_ParentalControls] or false,
						not (type(p2) == "table" and p2.hideBillingTab ~= nil and p2.hideBillingTab) and (ItemInfo[ItemType.Settings_Billing] or false),
						ItemInfo[ItemType.Settings_Subscriptions],
						FFlagEnableRobuxTransferLimitSettingsModule and ItemInfo[ItemType.Settings_Robux] or false,
						(not GetFFlagEnableGateNotificationPreferencesTabFunction() or type(p2) == "table" and p2.enableNotificationPreferencesTab) and ItemInfo[ItemType.Settings_Notifications] or false,
						ItemInfo[ItemType.Settings_Accessibility]
					}, v47)
				}
			},
			[AppPageModule.CJVSettings] = {
				{
					type = SectionType.Navigation,
					contents = CryoModule.List.filter({
						ItemInfo[ItemType.Settings_AccountInfo],
						ItemInfo[ItemType.Settings_Security],
						ItemInfo[ItemType.Settings_Privacy],
						false
					}, v47)
				}
			},
			[AppPageModule.TenFootSettings] = {
				{
					type = SectionType.Content,
					contents = {
						{
							itemInfo = ItemInfo[ItemType.Settings_SwitchProfileSection]
						},
						{
							itemInfo = ItemInfo[ItemType.Settings_AccountSettingsSection],
							subItems = { ItemInfo[ItemType.Settings_AccountSettingsInfo] }
						},
						{
							itemInfo = ItemInfo[ItemType.Settings_DeviceSettingsSection]
						}
					}
				}
			},
			[AppPageModule.TenFootAbout] = {
				{
					type = SectionType.Content,
					contents = {
						{
							itemInfo = ItemInfo[ItemType.About_AboutSection],
							subItems = if FFlagMorePageTermsPrivacyFooterModule then {} else {
								ItemInfo[ItemType.About_TermsOfService],
								CryoModule.Dictionary.join(ItemInfo[ItemType.About_Privacy], {
									rightImage = Images["icons/navigation/externallink_medium"]
								})
							}
						},
						{ itemInfo = ItemInfo[ItemType.About_LicensingSection] },
						{ itemInfo = ItemInfo[ItemType.About_VersionSection] }
					}
				}
			}
		}
		
		return if config[p1] == nil then config[AppPageModule.SimplifiedMore] else config[p1]
	end
}