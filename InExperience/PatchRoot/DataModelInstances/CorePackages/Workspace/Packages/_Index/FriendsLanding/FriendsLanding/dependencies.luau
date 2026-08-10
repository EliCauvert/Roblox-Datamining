local parent = script.Parent
local parent_1 = parent.Parent
local luaSocialLibrariesDepsModule = require(parent_1.LuaSocialLibrariesDeps)
local socialLuaAnalyticsModule = require(parent_1.SocialLuaAnalytics)
local _ = require(parent_1.React)
local friendsLanding = require(parent_1.Lumberyak).Logger.new(nil, "FriendsLanding")
local var3 = friendsLanding:new("FriendsLanding Networking")
local friendsLandingHttpRetryCount = game:DefineFastInt("FriendsLandingHttpRetryCount", 3)
local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local localizationService = game:GetService("LocalizationService")
local textService = game:GetService("TextService")
local otterModule = require(parent_1.Otter)
local getFStringSocialAddFriendsPageLayer = require(parent_1.SharedFlags).getFStringSocialAddFriendsPageLayer
local getFStringSocialFriendsLandingLayer = require(parent_1.SharedFlags).getFStringSocialFriendsLandingLayer
local getFStringSocialFriendsLayer = require(parent_1.SharedFlags).getFStringSocialFriendsLayer
local challengeRequestWrapper = require(parent_1.GenericChallenges).Middleware.ChallengeRequestWrapper
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
local roduxPresence = luaSocialLibrariesDepsModule.RoduxPresence
local roduxUsers = luaSocialLibrariesDepsModule.RoduxUsers
local fFlagFriendsLandingDeprecateUnusedMapToUsersModule = require(parent.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers)
local contactImporterModule = require(parent_1.ContactImporter)

return {
	Promise = require(parent_1.Promise),
	llama = luaSocialLibrariesDepsModule.llama,
	Roact = require(parent_1.Roact),
	Rodux = require(parent_1.Rodux),
	React = require(parent_1.React),
	RoactNavigation = require(parent_1.RoactNavigation),
	RoactRodux = require(parent_1.RoactRodux),
	RoactAppExperiment = require(parent_1.RoactAppExperiment),
	Logger = friendsLanding,
	Text = require(parent_1.AppCommonLib).Text,
	t = require(parent_1.t),
	UIBlox = require(parent_1.UIBlox),
	withLocalization = require(parent_1.Localization).withLocalization,
	memoize = require(parent_1.AppCommonLib).memoize,
	enumerate = require(parent_1.enumerate),
	LocalizationProvider = require(parent_1.Localization).LocalizationProvider,
	Url = require(parent_1.Http).Url,
	Lumberyak = require(parent_1.Lumberyak),
	FormFactor = require(parent_1.FormFactor).Enums.FormFactor,
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialLuaAnalytics = socialLuaAnalyticsModule,
	ProfileQRCode = require(parent_1.ProfileQRCode),
	SocialCommon = require(parent_1.SocialCommon),
	ReactFocusNavigation = require(parent_1.ReactFocusNavigation),
	FocusNavigationUtils = require(parent_1.FocusNavigationUtils),
	InputHandlers = require(parent_1.InputHandlers),
	BuilderIcons = require(parent_1.BuilderIcons),
	Foundation = require(parent_1.Foundation),
	UniversalAppPolicy = require(parent_1.UniversalAppPolicy).UniversalAppPolicy,
	tutils = require(parent_1.tutils),
	AnalyticsService = require(parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")),
	RoduxNetworking = var12,
	RoduxFriends = require(parent_1.FriendsRodux).config({ keyPath = "FriendsLanding.Friends" }),
	Dash = require(parent_1.Dash),
	RoduxUsers = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else roduxUsers.config({ keyPath = "FriendsLanding.Users" }),
	RoduxPresence = roduxPresence.config({ keyPath = "FriendsLanding.Presence" }),
	RoduxUserPermissions = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else luaSocialLibrariesDepsModule.RoduxUserPermissions.config({ keyPath = "FriendsLanding.UserPermissions" }),
	RoduxAnalytics = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else socialLuaAnalyticsModule.Analytics.RoduxAnalytics.config({ keyPath = "FriendsLanding.Analytics" }),
	CoreGui = coreGuiService,
	Players = playersService,
	LocalizationService = localizationService,
	TextService = textService,
	NetworkingFriendsEnums = require(parent_1.FriendsNetworking).Enums,
	FriendsNetworking = require(parent_1.FriendsNetworking).config({ roduxNetworking = var12 }),
	GamesNetworking = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else luaSocialLibrariesDepsModule.NetworkingGames.config({ roduxNetworking = var12 }),
	NetworkingUserSettings = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else luaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = var12 }),
	NetworkingAccountInformation = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else luaSocialLibrariesDepsModule.NetworkingAccountInformation.config({ roduxNetworking = var12 }),
	Otter = otterModule,
	CollisionMatchers = luaSocialLibrariesDepsModule.CollisionMatchers,
	getFStringSocialAddFriendsPageLayer = getFStringSocialAddFriendsPageLayer,
	getFStringSocialFriendsLandingLayer = getFStringSocialFriendsLandingLayer,
	getFStringSocialFriendsLayer = getFStringSocialFriendsLayer,
	FindFriendsModal = contactImporterModule.FindFriendsModal,
	ContactsList = contactImporterModule.ContactsList,
	ContactsRevokedAccessDialog = contactImporterModule.ContactsRevokedAccessDialog,
	updateOptedInUsers = require(parent_1.SocialModalsCommon).Utils.updateOptedInUsers,
	fetchOSPermissionsForContacts = require(parent_1.ContactImporter).Utils.fetchOSPermissionsForContacts,
	PermissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol,
	AppStorageService = game:GetService("AppStorageService"),
	ContactImporterConstants = require(parent_1.ContactImporter).Constants,
	ShowContactImporterParams = contactImporterModule.ShowContactImporterParams,
	FetchUserSettingsMetadata = if fFlagFriendsLandingDeprecateUnusedMapToUsersModule then nil else require(parent_1.DiscoverabilityModal).FetchUserSettingsMetadata,
	DiscoverabilityOverlay = require(parent_1.DiscoverabilityModal).DiscoverabilityOverlay,
	DiscoverabilityAnalytics = require(parent_1.DiscoverabilityModal).Analytics,
	Hooks = {
		useLocalization = require(parent_1.Localization).Hooks.useLocalization
	},
	getRbxthumbWithTypeSizeAndOptions = require(parent_1.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions,
	UserLibConstants = require(parent_1.UserLib).Utils.Constants,
	useFocusGuiObject = require(parent_1.ReactFocusNavigation).useFocusGuiObject,
	AppHeaderBar = require(parent_1.AppHeaderBar),
	GetFFlagFixConnectTabSearchBarHeight = require(parent_1.SharedFlags).GetFFlagFixConnectTabSearchBarHeight,
	FFlagEnableLeftNavOnConsole = require(parent_1.SharedFlags).FFlagEnableLeftNavOnConsole,
	GuiService = game:GetService("GuiService")
}