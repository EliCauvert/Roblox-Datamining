local friendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local _ = friendsCarousel.Parent
local context = require(friendsCarousel.dependencies).SocialLibraries.Context
local friendsCarouselAnalyticsContextModule = require(script.FriendsCarouselAnalyticsContext)

return {
	EventNames = require(script.EventNames),
	Analytics = require(script.AnalyticsSetup),
	setupFireEvent = require(script.setupFireEvent),
	Context = friendsCarouselAnalyticsContextModule,
	connect = context.getConnect(friendsCarouselAnalyticsContextModule),
	with = context.getWith(friendsCarouselAnalyticsContextModule),
	useAnalytics = require(script.useAnalytics)
}