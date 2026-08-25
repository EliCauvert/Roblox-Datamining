local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local _ = require(socialCarousel.Analytics.AnalyticsTypes)

return require(socialCarousel.Parent.React).createContext({
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