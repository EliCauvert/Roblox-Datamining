local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local dependenciesModule = require(PYMKCarousel.dependencies)
local rodux = dependenciesModule.Rodux
local roduxNetworking = dependenciesModule.RoduxNetworking
local roduxAnalyticsModule = require(script.RoduxAnalytics)
local usersModule = require(script.Users)
local friendsModule = require(script.Friends)
local roduxPresenceModule = require(script.RoduxPresence)
local _ = require(PYMKCarousel.Common.OmniTypes)
local fFlagPymkCarouselPresenceStoreMigrationModule = require(PYMKCarousel.Flags.FFlagPymkCarouselPresenceStoreMigration)

return function(p1)
	-- upvalues: rodux (ref), usersModule (ref), friendsModule (ref), roduxNetworking (ref), roduxAnalyticsModule (ref), fFlagPymkCarouselPresenceStoreMigrationModule (ref), roduxPresenceModule (ref)
	return if p1.contentType and p1.treatmentType then rodux.combineReducers({
		Users = usersModule(p1),
		Friends = friendsModule(p1),
		NetworkStatus = roduxNetworking.installReducer(),
		Analytics = roduxAnalyticsModule(p1),
		Presence = if fFlagPymkCarouselPresenceStoreMigrationModule then nil else roduxPresenceModule.installReducer()
	}) else nil
end