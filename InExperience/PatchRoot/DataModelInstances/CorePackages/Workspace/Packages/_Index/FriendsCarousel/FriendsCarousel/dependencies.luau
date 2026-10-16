local Parent = script.Parent
local Parent1 = Parent.Parent
local SocialLuaAnalyticsModule = require(Parent1.SocialLuaAnalytics)
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local FriendsCarousel = require(Parent1.Loggers).Logger:new("FriendsCarousel")
local FriendsCarouselNetworking = FriendsCarousel:new("FriendsCarousel Networking")
local GetFFlagMigrateSocialNetworkingFunction = require(Parent1.SharedFlags).getFFlagMigrateSocialNetworking
local RODUXKEY = require(Parent.Common.Constants).RODUX_KEY
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 18 ]]
			-- upvalues: FriendsCarouselNetworking (copy), GetFFlagMigrateSocialNetworkingFunction (copy), HttpRequest (copy)
			FriendsCarouselNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return if GetFFlagMigrateSocialNetworkingFunction() then HttpRequest.requestFunctions.RequestInternal(p1, p2, p3) else HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2) --[[ Line: 26 ]]
			-- upvalues: FriendsCarouselNetworking (copy)
			FriendsCarouselNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p2.requestMethod, p2.url, p1.StatusCode))
		end,
		maxRetryCount = game:DefineFastInt("FriendsCarouselHttpRetryCount", 3)
	})
})
local _ = require(Parent1.RobloxAppHooks)

return {
	logger = FriendsCarousel,
	SocialLuaAnalytics = SocialLuaAnalyticsModule,
	Promise = require(Parent1.Promise),
	UIBlox = require(Parent1.UIBlox),
	Roact = require(Parent1.Roact),
	React = require(Parent1.React),
	Rodux = require(Parent1.Rodux),
	RoactRodux = require(Parent1.RoactRodux),
	t = require(Parent1.t),
	Dash = require(Parent1.Dash),
	llama = LuaSocialLibrariesDepsModule.llama,
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialCommon = require(Parent1.SocialCommon),
	RoduxNetworking = ConfigResult,
	NetworkingFriends = require(Parent1.FriendsNetworking).config({ roduxNetworking = ConfigResult }),
	NetworkingAliases = LuaSocialLibrariesDepsModule.NetworkingAliases.config({ roduxNetworking = ConfigResult }),
	RoduxFriends = require(Parent1.FriendsRodux).config({ keyPath = RODUXKEY .. ".Friends" }),
	RoduxAnalytics = SocialLuaAnalyticsModule.Analytics.RoduxAnalytics.config({ keyPath = RODUXKEY .. ".Analytics" }),
	convertActions = require(Parent1.SocialReducerAdaptors).convertActions,
	friendsActionAdaptor = require(Parent1.SocialReducerAdaptors).friendsActionAdaptor,
	Text = require(Parent1.AppCommonLib).Text,
	enumerate = require(Parent1.enumerate),
	RetrievalStatus = require(Parent1.Http).Enum.RetrievalStatus,
	AnalyticsService = require(Parent1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")),
	isSubjectToDesktopPolicies = require(Parent1.SharedFlags).isSubjectToDesktopPolicies,
	isSubjectTo10ftPolicies = require(Parent.isSubjectTo10ftPolicies)
}