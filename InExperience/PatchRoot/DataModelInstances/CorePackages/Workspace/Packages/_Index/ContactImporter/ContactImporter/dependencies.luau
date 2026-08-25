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
local var7 = lumberyakModule.Logger.new(nil, "ContactImporter"):new("ContactImporter Networking")
local RODUX_KEY = require(parent.Common.Constants).RODUX_KEY
local var8 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2)
			-- upvalues: var7 (ref), httpRequest (ref)
			var7:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4)
			-- upvalues: var7 (ref)
			var7:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
		end,
		maxRetryCount = game:DefineFastInt("ContactImporterHttpRetryCount", 3)
	})
})
local var9 = require(parent_1.ContactsRodux).config({ keyPath = RODUX_KEY .. ".Contacts" })
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
	RoduxNetworking = var8,
	enumerate = require(parent_1.enumerate),
	IXPService = game:GetService("IXPService"),
	ShareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = var8 }),
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialModalsCommon = require(parent_1.SocialModalsCommon),
	NetworkingContacts = require(parent_1.ContactsNetworking).config({ roduxNetworking = var8 }),
	NetworkingFriends = require(parent_1.FriendsNetworking).config({ roduxNetworking = var8 }),
	NetworkingUserSettings = luaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = var8 }),
	NetworkingAccountInformation = luaSocialLibrariesDepsModule.NetworkingAccountInformation.config({ roduxNetworking = var8 }),
	NetworkingAccountSettings = luaSocialLibrariesDepsModule.NetworkingAccountSettings.config({ roduxNetworking = var8 }),
	UrlBuilder = urlBuilderModule.UrlBuilder,
	ContactsProtocol = require(parent_1.ContactsProtocol).ContactsProtocol,
	SMSProtocol = require(parent_1.SMSProtocol).SMSProtocol,
	PermissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol,
	RoduxContacts = var9,
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