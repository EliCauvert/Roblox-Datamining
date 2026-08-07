local parent = script.Parent
local parent_1 = parent.Parent
local luaSocialLibrariesDepsModule = require(parent_1.LuaSocialLibrariesDeps)
local RODUX_KEY = require(parent.Common.Constants).RODUX_KEY
local roduxNetworking = luaSocialLibrariesDepsModule.RoduxNetworking
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var1 = require(parent_1.Lumberyak).Logger.new(nil, RODUX_KEY):new(RODUX_KEY .. " Networking")
local var2 = roduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2) --[[ line: 14 ]]
			-- upvalues: var1 (ref), httpRequest (ref)
			var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ line: 18 ]]
			-- upvalues: var1 (ref)
			var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
		end,
		maxRetryCount = game:DefineFastInt("SetAliasHttpRetryCount", 3)
	})
})

return {
	AppStorageService = game:GetService("AppStorageService"),
	Analytics = require(parent_1.Analytics),
	SocialLuaAnalytics = require(parent_1.SocialLuaAnalytics),
	Dash = require(parent_1.Dash),
	UIBlox = require(parent_1.UIBlox),
	Roact = require(parent_1.Roact),
	RoactRodux = require(parent_1.RoactRodux),
	RoactNavigation = require(parent_1.RoactNavigation),
	Rodux = require(parent_1.Rodux),
	React = require(parent_1.React),
	ContactsProtocol = require(parent_1.ContactsProtocol).ContactsProtocol,
	Promise = require(parent_1.Promise),
	enumerate = require(parent_1.enumerate),
	UserProfiles = require(parent_1.UserProfiles),
	RoactFitComponents = luaSocialLibrariesDepsModule.RoactFitComponents,
	RoduxNetworking = var2,
	NetworkingAliases = luaSocialLibrariesDepsModule.NetworkingAliases.config({ roduxNetworking = var2 }),
	RoduxAliases = luaSocialLibrariesDepsModule.RoduxAliases.config({ keyPath = RODUX_KEY .. ".Aliases" }),
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	LocalizationProvider = require(parent_1.Localization).LocalizationProvider,
	Hooks = {
		useEffectOnMount = require(parent_1.RoactUtils).Hooks.useEffectOnMount,
		useLocalization = require(parent_1.Localization).Hooks.useLocalization,
		useSelector = require(parent_1.RoactUtils).Hooks.RoactRodux.useSelector,
		useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch,
		useLocalUserId = require(parent_1.RobloxAppHooks).useLocalUserId
	},
	Foundation = require(parent_1.Foundation)
}