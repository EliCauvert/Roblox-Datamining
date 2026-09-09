local dependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)
local context = dependenciesModule.SocialLibraries.Context
local PYMKCarouselAnalyticsContextModule = require(script.PYMKCarouselAnalyticsContext)

return {
	setupFireEvent = require(script.setupFireEvent),
	Context = PYMKCarouselAnalyticsContextModule,
	connect = context.getConnect(PYMKCarouselAnalyticsContextModule),
	with = context.getWith(PYMKCarouselAnalyticsContextModule),
	EventNames = require(script.EventNames),
	BtnValues = if dependenciesModule.getFFlagPYMKAddFriendsEntry() then require(script.BtnValues) else nil,
	useAnalytics = require(script.useAnalytics),
	useUserSeenEvent = require(script.useUserSeenEvent),
	useUserSeenCollectionEvent = require(script.useUserSeenCollectionEvent)
}