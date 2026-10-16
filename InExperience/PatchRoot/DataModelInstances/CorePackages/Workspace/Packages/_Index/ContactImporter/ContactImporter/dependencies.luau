local Parent = script.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local VirtualizedListModule = require(Parent1.VirtualizedList)
local ContactImporterNetworking = require(Parent1.Lumberyak).Logger.new(nil, "ContactImporter"):new("ContactImporter Networking")
local RODUXKEY = require(Parent.Common.Constants).RODUX_KEY
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 18 ]]
			-- upvalues: ContactImporterNetworking (copy), HttpRequest (copy)
			ContactImporterNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2) --[[ Line: 22 ]]
			-- upvalues: ContactImporterNetworking (copy)
			ContactImporterNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ContactImporterHttpRetryCount", 3)
	})
})
local RoactAppExperimentModule = require(Parent1.RoactAppExperiment)
local UIBloxModule = require(Parent1.UIBlox)

return {
	SocialLuaAnalytics = require(Parent1.SocialLuaAnalytics),
	Dash = require(Parent1.Dash),
	UIBlox = UIBloxModule,
	Roact = require(Parent1.Roact),
	RoactNavigation = require(Parent1.RoactNavigation),
	Rodux = require(Parent1.Rodux),
	ReactRoblox = require(Parent1.ReactRoblox),
	RoactRodux = require(Parent1.RoactRodux),
	LocalizationProvider = require(Parent1.Localization).LocalizationProvider,
	withLocalization = require(Parent1.Localization).withLocalization,
	Url = require(Parent1.Http).Url,
	t = require(Parent1.t),
	Promise = require(Parent1.Promise),
	llama = LuaSocialLibrariesDepsModule.llama,
	memoize = require(Parent1.AppCommonLib).memoize,
	RoduxNetworking = ConfigResult,
	enumerate = require(Parent1.enumerate),
	IXPService = game:GetService("IXPService"),
	ShareLinksNetworking = require(Parent1.ShareLinksNetworking).config({ roduxNetworking = ConfigResult }),
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialModalsCommon = require(Parent1.SocialModalsCommon),
	NetworkingContacts = require(Parent1.ContactsNetworking).config({ roduxNetworking = ConfigResult }),
	NetworkingFriends = require(Parent1.FriendsNetworking).config({ roduxNetworking = ConfigResult }),
	NetworkingUserSettings = LuaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = ConfigResult }),
	NetworkingAccountInformation = LuaSocialLibrariesDepsModule.NetworkingAccountInformation.config({ roduxNetworking = ConfigResult }),
	NetworkingAccountSettings = LuaSocialLibrariesDepsModule.NetworkingAccountSettings.config({ roduxNetworking = ConfigResult }),
	UrlBuilder = require(Parent1.UrlBuilder).UrlBuilder,
	ContactsProtocol = require(Parent1.ContactsProtocol).ContactsProtocol,
	SMSProtocol = require(Parent1.SMSProtocol).SMSProtocol,
	PermissionsProtocol = require(Parent1.PermissionsProtocol).PermissionsProtocol,
	RoduxContacts = require(Parent1.ContactsRodux).config({ keyPath = RODUXKEY .. ".Contacts" }),
	RoduxUserPermissions = LuaSocialLibrariesDepsModule.RoduxUserPermissions.config({ keyPath = RODUXKEY .. ".UserPermissions" }),
	ShareLinksRodux = require(Parent1.ShareLinksRodux).config({ keyPath = RODUXKEY .. ".ShareLinks" }),
	AppStorageService = game:GetService("AppStorageService"),
	UserInputService = game:GetService("UserInputService"),
	ThrottleUserId = require(Parent1.AppCommonLib).ThrottleUserId,
	getFStringSocialFriendsLayer = require(Parent1.SharedFlags).getFStringSocialFriendsLayer,
	FFlagFontFaceSocialFriends = require(Parent1.SharedFlags).FFlagFontFaceSocialFriends,
	Players = game:GetService("Players"),
	React = require(Parent1.React),
	FlatList = VirtualizedListModule.FlatList,
	SectionList = VirtualizedListModule.SectionList,
	useSelector = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector,
	useDispatch = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch,
	usePrevious = require(Parent1.RoactUtils).Hooks.usePrevious,
	useNavigation = require(Parent1.Navigation).useNavigation,
	useLocalization = require(Parent1.Localization).Hooks.useLocalization,
	useStyle = UIBloxModule.Core.Style.useStyle,
	useUserExperiment = RoactAppExperimentModule.useUserExperiment,
	useEffectOnce = require(Parent1.RoactUtils).Hooks.useEffectOnce,
	DiscoverabilityOverlay = require(Parent1.DiscoverabilityModal).DiscoverabilityOverlay,
	DiscoverabilityAnalytics = require(Parent1.DiscoverabilityModal).Analytics,
	RoactExperimentProvider = RoactAppExperimentModule.Provider,
	UniversalAppPolicy = require(Parent1.UniversalAppPolicy).UniversalAppPolicy,
	AmpUpsell = require(Parent1.AmpUpsell),
	Foundation = require(Parent1.Foundation)
}