local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local parent = PYMKCarousel.Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local lumberyakModule = require(parent.Lumberyak)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local migratePymkCarouselHttpRequestToRequestInternal = game:DefineFastFlag("MigratePymkCarouselHttpRequestToRequestInternal", false)
local challengeRequestWrapper = require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper
local enablePymkCarouselChallengeInterceptor = game:DefineFastFlag("EnablePymkCarouselChallengeInterceptor", false)
local fFlagPymkCarouselPresenceStoreMigrationModule = require(PYMKCarousel.Flags.FFlagPymkCarouselPresenceStoreMigration)
local var1 = lumberyakModule.Logger.new(nil, "PYMKCarousel"):new("PYMKCarousel Networking")
local var2 = httpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: var1 (ref), migratePymkCarouselHttpRequestToRequestInternal (ref), httpRequest (ref)
		var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return if migratePymkCarouselHttpRequestToRequestInternal then httpRequest.requestFunctions.RequestInternal(p1, p2, p3) else httpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	postRequestFunction = function(p1, p2)
		-- upvalues: var1 (ref)
		var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
	end,
	maxRetryCount = game:DefineFastInt("PYMKCarouselHttpRetryCount", 3)
})
local RODUX_KEY = require(PYMKCarousel.Common.Constants).RODUX_KEY
local var3 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = if enablePymkCarouselChallengeInterceptor then challengeRequestWrapper(var2) else var2
})

return {
	SocialLuaAnalytics = socialLuaAnalyticsModule,
	UIBlox = require(parent.UIBlox),
	Roact = require(parent.Roact),
	React = require(parent.React),
	Rodux = require(parent.Rodux),
	RoactRodux = require(parent.RoactRodux),
	Result = require(parent.Result),
	llama = luaSocialLibrariesDepsModule.llama,
	Dash = require(parent.Dash),
	RoduxNetworking = var3,
	RoduxFriends = require(parent.FriendsRodux).config({ keyPath = RODUX_KEY .. ".Friends" }),
	RoduxUsers = luaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = RODUX_KEY .. ".Users" }),
	NetworkingFriendsEnums = require(parent.FriendsNetworking).Enums,
	NetworkingFriends = require(parent.FriendsNetworking).config({ roduxNetworking = var3 }),
	RoduxAnalytics = socialLuaAnalyticsModule.Analytics.RoduxAnalytics.config({ keyPath = RODUX_KEY .. ".Analytics" }),
	Players = game:GetService("Players"),
	convertActions = require(parent.SocialReducerAdaptors).convertActions,
	usersActionAdaptor = require(parent.SocialReducerAdaptors).usersActionAdaptor,
	friendsActionAdaptor = require(parent.SocialReducerAdaptors).friendsActionAdaptor,
	SocialCommon = require(parent.SocialCommon),
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	Hooks = {
		useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector,
		useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch,
		useLocalization = require(parent.Localization).Hooks.useLocalization,
		dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
	},
	LocalizationProvider = require(parent.Localization).LocalizationProvider,
	enumerate = require(parent.enumerate),
	getFFlagPYMKAddFriendsEntry = require(parent.SharedFlags).getFFlagPYMKAddFriendsEntry,
	NetworkingPresence = if not fFlagPymkCarouselPresenceStoreMigrationModule then luaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = var3 }) else nil
}