local parent = script.Parent
local parent_1 = parent.Parent
local luaSocialLibrariesDepsModule = require(parent_1.LuaSocialLibrariesDeps)
local lumberyakModule = require(parent_1.Lumberyak)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local shareLinksNetworkingModule = require(parent_1.ShareLinksNetworking)
local shareLinksRoduxModule = require(parent_1.ShareLinksRodux)
local virtualizedListModule = require(parent_1.VirtualizedList)
local urlBuilderModule = require(parent_1.UrlBuilder)
local socialLuaAnalyticsModule = require(parent_1.SocialLuaAnalytics)
local var1 = lumberyakModule.Logger.new(nil, "ContactImporter"):new("ContactImporter Networking")
local RODUX_KEY = require(parent.Common.Constants).RODUX_KEY
local var2 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: var1 (ref), httpRequest (ref)
			var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return httpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: var1 (ref)
			var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ContactImporterHttpRetryCount", 3)
	})
})
local var3 = require(parent_1.ContactsRodux).config({ keyPath = RODUX_KEY .. ".Contacts" })
local roactAppExperimentModule = require(parent_1.RoactAppExperiment)
local UIBloxModule = require(parent_1.UIBlox)

return {
	SocialLuaAnalytics = socialLuaAnalyticsModule,
	Dash = require(parent_1.Dash),
	UIBlox = UIBloxModule,
	Roact = require(parent_1.Roact),
	RoactNavigation = require(parent_1.RoactNavigation),
	Rodux = require(parent_1.Rodux),
	ReactRoblox = require(parent_1.ReactRoblox),
	RoactRodux = require(parent_1.RoactRodux),
	LocalizationProvider = require(parent_1.Localization).LocalizationProvider,
	withLocalization = require(parent_1.Localization).withLocalization,
	Url = require(parent_1.Http).Url,
	t = require(parent_1.t),
	Promise = require(parent_1.Promise),
	llama = luaSocialLibrariesDepsModule.llama,
	memoize = require(parent_1.AppCommonLib).memoize,
	RoduxNetworking = var2,
	enumerate = require(parent_1.enumerate),
	IXPService = game:GetService("IXPService"),
	ShareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = var2 }),
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialModalsCommon = require(parent_1.SocialModalsCommon),
	NetworkingContacts = require(parent_1.ContactsNetworking).config({ roduxNetworking = var2 }),
	NetworkingFriends = require(parent_1.FriendsNetworking).config({ roduxNetworking = var2 }),
	NetworkingUserSettings = luaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = var2 }),
	NetworkingAccountInformation = luaSocialLibrariesDepsModule.NetworkingAccountInformation.config({ roduxNetworking = var2 }),
	NetworkingAccountSettings = luaSocialLibrariesDepsModule.NetworkingAccountSettings.config({ roduxNetworking = var2 }),
	UrlBuilder = urlBuilderModule.UrlBuilder,
	ContactsProtocol = require(parent_1.ContactsProtocol).ContactsProtocol,
	SMSProtocol = require(parent_1.SMSProtocol).SMSProtocol,
	PermissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol,
	RoduxContacts = var3,
	RoduxUserPermissions = luaSocialLibrariesDepsModule.RoduxUserPermissions.config({ keyPath = RODUX_KEY .. ".UserPermissions" }),
	ShareLinksRodux = shareLinksRoduxModule.config({ keyPath = RODUX_KEY .. ".ShareLinks" }),
	AppStorageService = game:GetService("AppStorageService"),
	UserInputService = game:GetService("UserInputService"),
	ThrottleUserId = require(parent_1.AppCommonLib).ThrottleUserId,
	getFStringSocialFriendsLayer = require(parent_1.SharedFlags).getFStringSocialFriendsLayer,
	Players = game:GetService("Players"),
	React = require(parent_1.React),
	FlatList = virtualizedListModule.FlatList,
	SectionList = virtualizedListModule.SectionList,
	useSelector = require(parent_1.RoactUtils).Hooks.RoactRodux.useSelector,
	useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch,
	usePrevious = require(parent_1.RoactUtils).Hooks.usePrevious,
	useNavigation = require(parent_1.Navigation).useNavigation,
	useLocalization = require(parent_1.Localization).Hooks.useLocalization,
	useStyle = UIBloxModule.Core.Style.useStyle,
	useUserExperiment = roactAppExperimentModule.useUserExperiment,
	useEffectOnce = require(parent_1.RoactUtils).Hooks.useEffectOnce,
	DiscoverabilityOverlay = require(parent_1.DiscoverabilityModal).DiscoverabilityOverlay,
	DiscoverabilityAnalytics = require(parent_1.DiscoverabilityModal).Analytics,
	RoactExperimentProvider = roactAppExperimentModule.Provider,
	UniversalAppPolicy = require(parent_1.UniversalAppPolicy).UniversalAppPolicy,
	AmpUpsell = require(parent_1.AmpUpsell),
	Foundation = require(parent_1.Foundation)
}