local FriendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local _ = FriendsCarousel.Parent
local Context = require(FriendsCarousel.dependencies).SocialLibraries.Context
local FriendsCarouselAnalyticsContextModule = require(script.FriendsCarouselAnalyticsContext)

return {
	EventNames = require(script.EventNames),
	Analytics = require(script.AnalyticsSetup),
	setupFireEvent = require(script.setupFireEvent),
	Context = FriendsCarouselAnalyticsContextModule,
	connect = Context.getConnect(FriendsCarouselAnalyticsContextModule),
	with = Context.getWith(FriendsCarouselAnalyticsContextModule),
	useAnalytics = require(script.useAnalytics)
}