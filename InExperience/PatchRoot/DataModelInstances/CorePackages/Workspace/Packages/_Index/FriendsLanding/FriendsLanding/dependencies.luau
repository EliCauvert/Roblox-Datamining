local parent = script.Parent.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local _ = require(parent.React)
local friendsLanding = require(parent.Lumberyak).Logger.new(nil, "FriendsLanding")
local var3 = friendsLanding:new("FriendsLanding Networking")
local friendsLandingHttpRetryCount = game:DefineFastInt("FriendsLandingHttpRetryCount", 3)
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local localizationService = game:GetService("LocalizationService")
local textService = game:GetService("TextService")
local otterModule = require(parent.Otter)
local getFStringSocialAddFriendsPageLayer = require(parent.SharedFlags).getFStringSocialAddFriendsPageLayer
local getFStringSocialFriendsLandingLayer = require(parent.SharedFlags).getFStringSocialFriendsLandingLayer
local getFStringSocialFriendsLayer = require(parent.SharedFlags).getFStringSocialFriendsLayer
local challengeRequestWrapper = require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper
local enableFriendsLandingChallengeInterceptor = game:DefineFastFlag("EnableFriendsLandingChallengeInterceptor", false)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var11 = httpRequest.config({
	requestFunction = function(p0, p1, p2) --[[ line: 28 ]]
		-- upvalues: var3 (ref), httpRequest (ref)
		var3:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
		
		return httpRequest.requestFunctions.RequestInternal(p0, p1, p2)
	end,
	postRequestFunction = function(p3, p4) --[[ line: 32 ]]
		-- upvalues: var3 (ref)
		var3:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
	end,
	maxRetryCount = friendsLandingHttpRetryCount
})
local var12 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "FriendsLanding.NetworkStatus",
	networkImpl = if enableFriendsLandingChallengeInterceptor then challengeRequestWrapper(var11) else var11
})
local contactImporterModule = require(parent.ContactImporter)

return {
	Promise = require(parent.Promise),
	llama = luaSocialLibrariesDepsModule.llama,
	Roact = require(parent.Roact),
	Rodux = require(parent.Rodux),
	React = require(parent.React),
	RoactNavigation = require(parent.RoactNavigation),
	RoactRodux = require(parent.RoactRodux),
	RoactAppExperiment = require(parent.RoactAppExperiment),
	Logger = friendsLanding,
	Text = require(parent.AppCommonLib).Text,
	t = require(parent.t),
	UIBlox = require(parent.UIBlox),
	withLocalization = require(parent.Localization).withLocalization,
	memoize = require(parent.AppCommonLib).memoize,
	enumerate = require(parent.enumerate),
	LocalizationProvider = require(parent.Localization).LocalizationProvider,
	Url = require(parent.Http).Url,
	Lumberyak = require(parent.Lumberyak),
	FormFactor = require(parent.FormFactor).Enums.FormFactor,
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialLuaAnalytics = socialLuaAnalyticsModule,
	ProfileQRCode = require(parent.ProfileQRCode),
	SocialCommon = require(parent.SocialCommon),
	ReactFocusNavigation = require(parent.ReactFocusNavigation),
	FocusNavigationUtils = require(parent.FocusNavigationUtils),
	InputHandlers = require(parent.InputHandlers),
	BuilderIcons = require(parent.BuilderIcons),
	Foundation = require(parent.Foundation),
	UniversalAppPolicy = require(parent.UniversalAppPolicy).UniversalAppPolicy,
	tutils = require(parent.tutils),
	AnalyticsService = require(parent.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")),
	RoduxNetworking = var12,
	RoduxFriends = require(parent.FriendsRodux).config({ keyPath = "FriendsLanding.Friends" }),
	Dash = require(parent.Dash),
	RoduxUsers = luaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "FriendsLanding.Users" }),
	RoduxPresence = luaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "FriendsLanding.Presence" }),
	RoduxUserPermissions = luaSocialLibrariesDepsModule.RoduxUserPermissions.config({ keyPath = "FriendsLanding.UserPermissions" }),
	RoduxAnalytics = socialLuaAnalyticsModule.Analytics.RoduxAnalytics.config({ keyPath = "FriendsLanding.Analytics" }),
	CoreGui = coreGuiService,
	Players = playersService,
	LocalizationService = localizationService,
	TextService = textService,
	NetworkingFriendsEnums = require(parent.FriendsNetworking).Enums,
	FriendsNetworking = require(parent.FriendsNetworking).config({ roduxNetworking = var12 }),
	GamesNetworking = luaSocialLibrariesDepsModule.NetworkingGames.config({ roduxNetworking = var12 }),
	NetworkingUserSettings = luaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = var12 }),
	NetworkingAccountInformation = luaSocialLibrariesDepsModule.NetworkingAccountInformation.config({ roduxNetworking = var12 }),
	Otter = otterModule,
	CollisionMatchers = luaSocialLibrariesDepsModule.CollisionMatchers,
	getFStringSocialAddFriendsPageLayer = getFStringSocialAddFriendsPageLayer,
	getFStringSocialFriendsLandingLayer = getFStringSocialFriendsLandingLayer,
	getFStringSocialFriendsLayer = getFStringSocialFriendsLayer,
	FindFriendsModal = contactImporterModule.FindFriendsModal,
	ContactsList = contactImporterModule.ContactsList,
	ContactsRevokedAccessDialog = contactImporterModule.ContactsRevokedAccessDialog,
	updateOptedInUsers = require(parent.SocialModalsCommon).Utils.updateOptedInUsers,
	fetchOSPermissionsForContacts = require(parent.ContactImporter).Utils.fetchOSPermissionsForContacts,
	PermissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol,
	AppStorageService = game:GetService("AppStorageService"),
	ContactImporterConstants = require(parent.ContactImporter).Constants,
	ShowContactImporterParams = contactImporterModule.ShowContactImporterParams,
	FetchUserSettingsMetadata = require(parent.DiscoverabilityModal).FetchUserSettingsMetadata,
	DiscoverabilityOverlay = require(parent.DiscoverabilityModal).DiscoverabilityOverlay,
	DiscoverabilityAnalytics = require(parent.DiscoverabilityModal).Analytics,
	Hooks = {
		useLocalization = require(parent.Localization).Hooks.useLocalization
	},
	getRbxthumbWithTypeSizeAndOptions = require(parent.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions,
	UserLibConstants = require(parent.UserLib).Utils.Constants,
	useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject,
	AppHeaderBar = require(parent.AppHeaderBar),
	GetFFlagFixConnectTabSearchBarHeight = require(parent.SharedFlags).GetFFlagFixConnectTabSearchBarHeight,
	FFlagEnableLeftNavOnConsole = require(parent.SharedFlags).FFlagEnableLeftNavOnConsole,
	GuiService = game:GetService("GuiService")
}