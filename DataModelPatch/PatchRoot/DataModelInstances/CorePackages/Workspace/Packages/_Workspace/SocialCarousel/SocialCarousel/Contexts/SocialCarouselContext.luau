local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local _ = require(SocialCarousel.Analytics.AnalyticsTypes)

return require(SocialCarousel.Parent.React).createContext({
	hideCarouselHeader = false,
	openGameJoinCardUserId = nil,
	setOpenGameJoinCardUserId = nil,
	unifiedLogging = nil,
	sortAnalyticsData = nil,
	friendRequestCount = 0,
	friendCount = 0,
	recommendationCount = 0,
	selectionOrderBase = nil,
	source = nil,
	navigateToQRCodePage = nil,
	isLoading = false,
	eventIngest = function() end,
	appAnalytics = function() end,
	tiles = {},
	onSuccessfulRender = function() end
})