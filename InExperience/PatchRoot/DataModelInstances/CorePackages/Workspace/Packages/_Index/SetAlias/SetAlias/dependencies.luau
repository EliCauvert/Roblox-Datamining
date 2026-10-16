local Parent = script.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local RODUXKEY = require(Parent.Common.Constants).RODUX_KEY
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local NewResult = require(Parent1.Lumberyak).Logger.new(nil, RODUXKEY):new(RODUXKEY .. " Networking")
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 14 ]]
			-- upvalues: NewResult (copy), HttpRequest (copy)
			NewResult:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2) --[[ Line: 18 ]]
			-- upvalues: NewResult (copy)
			NewResult:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("SetAliasHttpRetryCount", 3)
	})
})

return {
	AppStorageService = game:GetService("AppStorageService"),
	Analytics = require(Parent1.Analytics),
	SocialLuaAnalytics = require(Parent1.SocialLuaAnalytics),
	Dash = require(Parent1.Dash),
	UIBlox = require(Parent1.UIBlox),
	Roact = require(Parent1.Roact),
	RoactRodux = require(Parent1.RoactRodux),
	RoactNavigation = require(Parent1.RoactNavigation),
	Rodux = require(Parent1.Rodux),
	React = require(Parent1.React),
	ContactsProtocol = require(Parent1.ContactsProtocol).ContactsProtocol,
	Promise = require(Parent1.Promise),
	enumerate = require(Parent1.enumerate),
	UserProfiles = require(Parent1.UserProfiles),
	RoactFitComponents = LuaSocialLibrariesDepsModule.RoactFitComponents,
	RoduxNetworking = ConfigResult,
	NetworkingAliases = LuaSocialLibrariesDepsModule.NetworkingAliases.config({ roduxNetworking = ConfigResult }),
	RoduxAliases = LuaSocialLibrariesDepsModule.RoduxAliases.config({ keyPath = RODUXKEY .. ".Aliases" }),
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	LocalizationProvider = require(Parent1.Localization).LocalizationProvider,
	Hooks = {
		useEffectOnMount = require(Parent1.RoactUtils).Hooks.useEffectOnMount,
		useLocalization = require(Parent1.Localization).Hooks.useLocalization,
		useSelector = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector,
		useDispatch = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch,
		useLocalUserId = require(Parent1.RobloxAppHooks).useLocalUserId
	},
	Foundation = require(Parent1.Foundation)
}