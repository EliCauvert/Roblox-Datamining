local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local Rodux = DependenciesModule.Rodux
local RoduxNetworking = DependenciesModule.RoduxNetworking
local RoduxAnalyticsModule = require(script.RoduxAnalytics)
local UsersModule = require(script.Users)
local FriendsModule = require(script.Friends)
local RoduxPresenceModule = require(script.RoduxPresence)
local _ = require(PYMKCarousel.Common.OmniTypes)
local FFlagPymkCarouselPresenceStoreMigrationModule = require(PYMKCarousel.Flags.FFlagPymkCarouselPresenceStoreMigration)

return function(p1) --[[ Line: 15 ]]
	-- upvalues: Rodux (copy), UsersModule (copy), FriendsModule (copy), RoduxNetworking (copy), RoduxAnalyticsModule (copy), FFlagPymkCarouselPresenceStoreMigrationModule (copy), RoduxPresenceModule (copy)
	return if p1.contentType and p1.treatmentType then Rodux.combineReducers({
		Users = UsersModule(p1),
		Friends = FriendsModule(p1),
		NetworkStatus = RoduxNetworking.installReducer(),
		Analytics = RoduxAnalyticsModule(p1),
		Presence = if FFlagPymkCarouselPresenceStoreMigrationModule then nil else RoduxPresenceModule.installReducer()
	}) else nil
end