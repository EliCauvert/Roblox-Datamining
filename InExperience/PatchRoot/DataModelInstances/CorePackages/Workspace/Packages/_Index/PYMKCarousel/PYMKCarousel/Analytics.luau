local DependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)
local Context = DependenciesModule.SocialLibraries.Context
local PYMKCarouselAnalyticsContextModule = require(script.PYMKCarouselAnalyticsContext)

return {
	setupFireEvent = require(script.setupFireEvent),
	Context = PYMKCarouselAnalyticsContextModule,
	connect = Context.getConnect(PYMKCarouselAnalyticsContextModule),
	with = Context.getWith(PYMKCarouselAnalyticsContextModule),
	EventNames = require(script.EventNames),
	BtnValues = if DependenciesModule.getFFlagPYMKAddFriendsEntry() then require(script.BtnValues) else nil,
	useAnalytics = require(script.useAnalytics),
	useUserSeenEvent = require(script.useUserSeenEvent),
	useUserSeenCollectionEvent = require(script.useUserSeenCollectionEvent)
}