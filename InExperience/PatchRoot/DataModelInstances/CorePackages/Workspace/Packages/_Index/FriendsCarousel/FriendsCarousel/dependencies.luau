local parent = script.Parent
local parent_1 = parent.Parent
local socialLuaAnalyticsModule = require(parent_1.SocialLuaAnalytics)
local luaSocialLibrariesDepsModule = require(parent_1.LuaSocialLibrariesDeps)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local friendsCarousel = require(parent_1.Loggers).Logger:new("FriendsCarousel")
local var3 = friendsCarousel:new("FriendsCarousel Networking")
local getFFlagMigrateSocialNetworking = require(parent_1.SharedFlags).getFFlagMigrateSocialNetworking
local RODUX_KEY = require(parent.Common.Constants).RODUX_KEY
local var4 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2)
			-- upvalues: var3 (ref), getFFlagMigrateSocialNetworking (ref), httpRequest (ref)
			var3:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return if getFFlagMigrateSocialNetworking() then httpRequest.requestFunctions.RequestInternal(p0, p1, p2) else httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4)
			-- upvalues: var3 (ref)
			var3:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p4.requestMethod, p4.url, p3.StatusCode))
		end,
		maxRetryCount = game:DefineFastInt("FriendsCarouselHttpRetryCount", 3)
	})
})
local _ = require(parent_1.RobloxAppHooks)

return {
	logger = friendsCarousel,
	SocialLuaAnalytics = socialLuaAnalyticsModule,
	Promise = require(parent_1.Promise),
	UIBlox = require(parent_1.UIBlox),
	Roact = require(parent_1.Roact),
	React = require(parent_1.React),
	Rodux = require(parent_1.Rodux),
	RoactRodux = require(parent_1.RoactRodux),
	t = require(parent_1.t),
	Dash = require(parent_1.Dash),
	llama = luaSocialLibrariesDepsModule.llama,
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	SocialCommon = require(parent_1.SocialCommon),
	RoduxNetworking = var4,
	NetworkingFriends = require(parent_1.FriendsNetworking).config({ roduxNetworking = var4 }),
	NetworkingAliases = luaSocialLibrariesDepsModule.NetworkingAliases.config({ roduxNetworking = var4 }),
	RoduxFriends = require(parent_1.FriendsRodux).config({ keyPath = RODUX_KEY .. ".Friends" }),
	RoduxAnalytics = socialLuaAnalyticsModule.Analytics.RoduxAnalytics.config({ keyPath = RODUX_KEY .. ".Analytics" }),
	convertActions = require(parent_1.SocialReducerAdaptors).convertActions,
	friendsActionAdaptor = require(parent_1.SocialReducerAdaptors).friendsActionAdaptor,
	Text = require(parent_1.AppCommonLib).Text,
	enumerate = require(parent_1.enumerate),
	RetrievalStatus = require(parent_1.Http).Enum.RetrievalStatus,
	AnalyticsService = require(parent_1.Analytics).Analytics.new(game:GetService("RbxAnalyticsService")),
	isSubjectToDesktopPolicies = require(parent_1.SharedFlags).isSubjectToDesktopPolicies,
	isSubjectTo10ftPolicies = require(parent.isSubjectTo10ftPolicies)
}