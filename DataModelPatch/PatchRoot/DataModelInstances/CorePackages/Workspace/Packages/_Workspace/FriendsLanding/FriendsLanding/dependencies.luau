local Parent = script.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local _ = require(Parent.React)
local FriendsLanding = require(Parent.Lumberyak).Logger.new(nil, "FriendsLanding")
local FriendsLandingNetworking = FriendsLanding:new("FriendsLanding Networking")
local ChallengeRequestWrapperFunction = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local ConfigResult = HttpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: FriendsLandingNetworking (copy), HttpRequest (copy)
		FriendsLandingNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	postRequestFunction = function(p1, p2)
		-- upvalues: FriendsLandingNetworking (copy)
		FriendsLandingNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
	end,
	maxRetryCount = game:DefineFastInt("FriendsLandingHttpRetryCount", 3)
})
local ConfigResult1 = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "FriendsLanding.NetworkStatus",
	networkImpl = if game:DefineFastFlag("EnableFriendsLandingChallengeInterceptor", false) then ChallengeRequestWrapperFunction(ConfigResult) else ConfigResult
})
local ContactImporterModule = require(Parent.ContactImporter)

return {
	Promise = require(Parent.Promise),
	llama = LuaSocialLibrariesDepsModule.llama,
	Roact = require(Parent.Roact),
	Rodux = require(Parent.Rodux),
	React = require(Parent.React),
	RoactNavigation = require(Parent.RoactNavigation),
	RoactRodux = require(Parent.RoactRodux),
	RoactAppExperiment = require(Parent.RoactAppExperiment),
	Logger = FriendsLanding,
	Text = require(Parent.AppCommonLib).Text,
	t = require(Parent.t),
	UIBlox = require(Parent.UIBlox),
	withLocalization = require(Parent.Localization).withLocalization,
	memoize = require(Parent.AppCommonLib).memoize,
	enumerate = require(Parent.enumerate),
	LocalizationProvider = require(Parent.Localization).LocalizationProvider,
	Url = require(Parent.Http).Url,
	Lumberyak = require(Parent.Lumberyak),
	FormFactor = require(Parent.FormFactor).Enums.FormFactor,
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialLuaAnalytics = SocialLuaAnalyticsModule,
	ProfileQRCode = require(Parent.ProfileQRCode),
	SocialCommon = require(Parent.SocialCommon),
	ReactFocusNavigation = require(Parent.ReactFocusNavigation),
	FocusNavigationUtils = require(Parent.FocusNavigationUtils),
	InputHandlers = require(Parent.InputHandlers),
	BuilderIcons = require(Parent.BuilderIcons),
	Foundation = require(Parent.Foundation),
	UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy,
	tutils = require(Parent.tutils),
	AnalyticsService = require(Parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")),
	RoduxNetworking = ConfigResult1,
	RoduxFriends = require(Parent.FriendsRodux).config({ keyPath = "FriendsLanding.Friends" }),
	Dash = require(Parent.Dash),
	RoduxUsers = LuaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "FriendsLanding.Users" }),
	RoduxPresence = LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "FriendsLanding.Presence" }),
	RoduxUserPermissions = LuaSocialLibrariesDepsModule.RoduxUserPermissions.config({ keyPath = "FriendsLanding.UserPermissions" }),
	RoduxAnalytics = SocialLuaAnalyticsModule.Analytics.RoduxAnalytics.config({ keyPath = "FriendsLanding.Analytics" }),
	CoreGui = game:GetService("CoreGui"),
	Players = game:GetService("Players"),
	LocalizationService = game:GetService("LocalizationService"),
	TextService = game:GetService("TextService"),
	NetworkingFriendsEnums = require(Parent.FriendsNetworking).Enums,
	FriendsNetworking = require(Parent.FriendsNetworking).config({ roduxNetworking = ConfigResult1 }),
	GamesNetworking = LuaSocialLibrariesDepsModule.NetworkingGames.config({ roduxNetworking = ConfigResult1 }),
	NetworkingUserSettings = LuaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = ConfigResult1 }),
	NetworkingAccountInformation = LuaSocialLibrariesDepsModule.NetworkingAccountInformation.config({ roduxNetworking = ConfigResult1 }),
	Otter = require(Parent.Otter),
	CollisionMatchers = LuaSocialLibrariesDepsModule.CollisionMatchers,
	getFStringSocialAddFriendsPageLayer = require(Parent.SharedFlags).getFStringSocialAddFriendsPageLayer,
	getFStringSocialFriendsLandingLayer = require(Parent.SharedFlags).getFStringSocialFriendsLandingLayer,
	getFStringSocialFriendsLayer = require(Parent.SharedFlags).getFStringSocialFriendsLayer,
	FindFriendsModal = ContactImporterModule.FindFriendsModal,
	ContactsList = ContactImporterModule.ContactsList,
	ContactsRevokedAccessDialog = ContactImporterModule.ContactsRevokedAccessDialog,
	updateOptedInUsers = require(Parent.SocialModalsCommon).Utils.updateOptedInUsers,
	fetchOSPermissionsForContacts = require(Parent.ContactImporter).Utils.fetchOSPermissionsForContacts,
	PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol,
	AppStorageService = game:GetService("AppStorageService"),
	ContactImporterConstants = require(Parent.ContactImporter).Constants,
	ShowContactImporterParams = ContactImporterModule.ShowContactImporterParams,
	FetchUserSettingsMetadata = require(Parent.DiscoverabilityModal).FetchUserSettingsMetadata,
	DiscoverabilityOverlay = require(Parent.DiscoverabilityModal).DiscoverabilityOverlay,
	DiscoverabilityAnalytics = require(Parent.DiscoverabilityModal).Analytics,
	Hooks = {
		useLocalization = require(Parent.Localization).Hooks.useLocalization
	},
	getRbxthumbWithTypeSizeAndOptions = require(Parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions,
	UserLibConstants = require(Parent.UserLib).Utils.Constants,
	useFocusGuiObject = require(Parent.ReactFocusNavigation).useFocusGuiObject,
	AppHeaderBar = require(Parent.AppHeaderBar),
	GetFFlagFixConnectTabSearchBarHeight = require(Parent.SharedFlags).GetFFlagFixConnectTabSearchBarHeight,
	FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole,
	GuiService = game:GetService("GuiService")
}