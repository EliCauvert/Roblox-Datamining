local parent = script.Parent
local parent_1 = parent.Parent
local luaSocialLibrariesDepsModule = require(parent_1.LuaSocialLibrariesDeps)
local roduxNetworking = luaSocialLibrariesDepsModule.RoduxNetworking
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var1 = require(parent_1.Lumberyak).Logger.new(nil, "DiscoverabilityModal"):new("DiscoverabilityModal Networking")
local RODUX_KEY = require(parent.Common.Constants).RODUX_KEY
local var2 = roduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2) --[[ line: 13 ]]
			-- upvalues: var1 (ref), httpRequest (ref)
			var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ line: 17 ]]
			-- upvalues: var1 (ref)
			var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
		end,
		maxRetryCount = game:DefineFastInt("DiscoverabilityModalHttpRetryCount", 3)
	})
})

return {
	AppStorageService = game:GetService("AppStorageService"),
	SocialLuaAnalytics = require(parent_1.SocialLuaAnalytics),
	Dash = require(parent_1.Dash),
	UIBlox = require(parent_1.UIBlox),
	Foundation = require(parent_1.Foundation),
	Roact = require(parent_1.Roact),
	RoactRodux = require(parent_1.RoactRodux),
	Rodux = require(parent_1.Rodux),
	React = require(parent_1.React),
	ContactsProtocol = require(parent_1.ContactsProtocol).ContactsProtocol,
	Promise = require(parent_1.Promise),
	enumerate = require(parent_1.enumerate),
	RoactNavigation = require(parent_1.RoactNavigation),
	rolloutByApplicationId = require(parent_1.AppCommonLib).rolloutByApplicationId,
	RoduxNetworking = var2,
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialModalsCommon = require(parent_1.SocialModalsCommon),
	PermissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol,
	NetworkingUserSettings = luaSocialLibrariesDepsModule.NetworkingUserSettings.config({ roduxNetworking = var2 }),
	RoduxUserPermissions = luaSocialLibrariesDepsModule.RoduxUserPermissions.config({ keyPath = RODUX_KEY .. ".UserPermissions" }),
	LocalizationProvider = require(parent_1.Localization).LocalizationProvider,
	Hooks = {
		useLocalization = require(parent_1.Localization).Hooks.useLocalization,
		useNavigation = require(parent_1.Navigation).useNavigation,
		useSelector = require(parent_1.RoactUtils).Hooks.RoactRodux.useSelector,
		useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
	},
	getFStringSocialProfileLayer = require(parent_1.SharedFlags).getFStringSocialProfileLayer
}