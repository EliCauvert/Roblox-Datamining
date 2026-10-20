local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local Parent = PYMKCarousel.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local MigratePymkCarouselHttpRequestToRequestInternal = game:DefineFastFlag("MigratePymkCarouselHttpRequestToRequestInternal", false)
local ChallengeRequestWrapperFunction = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper
local FFlagPymkCarouselPresenceStoreMigrationModule = require(PYMKCarousel.Flags.FFlagPymkCarouselPresenceStoreMigration)
local PYMKCarouselNetworking = require(Parent.Lumberyak).Logger.new(nil, "PYMKCarousel"):new("PYMKCarousel Networking")
local ConfigResult = HttpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: PYMKCarouselNetworking (copy), MigratePymkCarouselHttpRequestToRequestInternal (copy), HttpRequest (copy)
		PYMKCarouselNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return if MigratePymkCarouselHttpRequestToRequestInternal then HttpRequest.requestFunctions.RequestInternal(p1, p2, p3) else HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	postRequestFunction = function(p1, p2)
		-- upvalues: PYMKCarouselNetworking (copy)
		PYMKCarouselNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
	end,
	maxRetryCount = game:DefineFastInt("PYMKCarouselHttpRetryCount", 3)
})
local RODUXKEY = require(PYMKCarousel.Common.Constants).RODUX_KEY
local ConfigResult1 = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = if game:DefineFastFlag("EnablePymkCarouselChallengeInterceptor", false) then ChallengeRequestWrapperFunction(ConfigResult) else ConfigResult
})

return {
	SocialLuaAnalytics = SocialLuaAnalyticsModule,
	UIBlox = require(Parent.UIBlox),
	Roact = require(Parent.Roact),
	React = require(Parent.React),
	Rodux = require(Parent.Rodux),
	RoactRodux = require(Parent.RoactRodux),
	Result = require(Parent.Result),
	llama = LuaSocialLibrariesDepsModule.llama,
	Dash = require(Parent.Dash),
	RoduxNetworking = ConfigResult1,
	RoduxFriends = require(Parent.FriendsRodux).config({ keyPath = RODUXKEY .. ".Friends" }),
	RoduxUsers = LuaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = RODUXKEY .. ".Users" }),
	NetworkingFriendsEnums = require(Parent.FriendsNetworking).Enums,
	NetworkingFriends = require(Parent.FriendsNetworking).config({ roduxNetworking = ConfigResult1 }),
	RoduxAnalytics = SocialLuaAnalyticsModule.Analytics.RoduxAnalytics.config({ keyPath = RODUXKEY .. ".Analytics" }),
	Players = game:GetService("Players"),
	convertActions = require(Parent.SocialReducerAdaptors).convertActions,
	usersActionAdaptor = require(Parent.SocialReducerAdaptors).usersActionAdaptor,
	friendsActionAdaptor = require(Parent.SocialReducerAdaptors).friendsActionAdaptor,
	SocialCommon = require(Parent.SocialCommon),
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	Hooks = {
		useSelector = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector,
		useDispatch = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch,
		useLocalization = require(Parent.Localization).Hooks.useLocalization,
		dependencyArray = require(Parent.RoactUtils).Hooks.dependencyArray
	},
	LocalizationProvider = require(Parent.Localization).LocalizationProvider,
	enumerate = require(Parent.enumerate),
	getFFlagPYMKAddFriendsEntry = require(Parent.SharedFlags).getFFlagPYMKAddFriendsEntry,
	NetworkingPresence = if require(Parent.SharedFlags).FFlagHomepagePYMKPresence and not FFlagPymkCarouselPresenceStoreMigrationModule then LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = ConfigResult1 }) else nil
}