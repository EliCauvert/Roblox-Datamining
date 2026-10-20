local Parent = script.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local DiscoverabilityModalNetworking = require(Parent1.Lumberyak).Logger.new(nil, "DiscoverabilityModal"):new("DiscoverabilityModal Networking")
local RODUXKEY = require(Parent.Common.Constants).RODUX_KEY
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: DiscoverabilityModalNetworking (copy), HttpRequest (copy)
			DiscoverabilityModalNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: DiscoverabilityModalNetworking (copy)
			DiscoverabilityModalNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("DiscoverabilityModalHttpRetryCount", 3)
	})
})

return {
	AppStorageService = game:GetService("AppStorageService"),
	SocialLuaAnalytics = require(Parent1.SocialLuaAnalytics),
	Dash = require(Parent1.Dash),
	UIBlox = require(Parent1.UIBlox),
	Foundation = require(Parent1.Foundation),
	Roact = require(Parent1.Roact),
	RoactRodux = require(Parent1.RoactRodux),
	Rodux = require(Parent1.Rodux),
	React = require(Parent1.React),
	ContactsProtocol = require(Parent1.ContactsProtocol).ContactsProtocol,
	Promise = require(Parent1.Promise),
	enumerate = require(Parent1.enumerate),
	RoactNavigation = require(Parent1.RoactNavigation),
	rolloutByApplicationId = require(Parent1.AppCommonLib).rolloutByApplicationId,
	RoduxNetworking = ConfigResult,
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialModalsCommon = require(Parent1.SocialModalsCommon),
	PermissionsProtocol = require(Parent1.PermissionsProtocol).PermissionsProtocol,
	NetworkingUserSettings = LuaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = ConfigResult }),
	RoduxUserPermissions = LuaSocialLibrariesDepsModule.RoduxUserPermissions.config({ keyPath = RODUXKEY .. ".UserPermissions" }),
	LocalizationProvider = require(Parent1.Localization).LocalizationProvider,
	Hooks = {
		useLocalization = require(Parent1.Localization).Hooks.useLocalization,
		useNavigation = require(Parent1.Navigation).useNavigation,
		useSelector = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector,
		useDispatch = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
	},
	getFStringSocialProfileLayer = require(Parent1.SharedFlags).getFStringSocialProfileLayer
}