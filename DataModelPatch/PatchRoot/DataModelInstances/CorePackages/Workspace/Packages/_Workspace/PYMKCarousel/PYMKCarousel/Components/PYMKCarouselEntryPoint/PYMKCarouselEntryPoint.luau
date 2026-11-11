local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local DependenciesModule = require(PYMKCarousel.dependencies)
local React = DependenciesModule.React
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseLocalUserIdFunction = require(PYMKCarousel.Parent.RobloxAppHooks).useLocalUserId
local SetupFireEventFunction = require(PYMKCarousel.Analytics).setupFireEvent
local GetSessionIdByKeyFunction = DependenciesModule.RoduxAnalytics.Selectors.getSessionIdByKey
local RECOMMENDATIONSESSIONIDKEY = require(PYMKCarousel.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local PYMKCollectionCarouselModule = require(PYMKCarousel.Components.PYMKCollectionCarousel)
local _ = require(PYMKCarousel.Analytics.AnalyticsTypes)

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UseSelectorFunction (copy), GetSessionIdByKeyFunction (copy), RECOMMENDATIONSESSIONIDKEY (copy), React (copy), SetupFireEventFunction (copy), PYMKCollectionCarouselModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetSessionIdByKeyFunction (upval), RECOMMENDATIONSESSIONIDKEY (upval)
		return GetSessionIdByKeyFunction(p2)(RECOMMENDATIONSESSIONIDKEY)
	end)
	local UseMemoResult = React.useMemo(function()
		-- upvalues: SetupFireEventFunction (upval), UseLocalUserIdResult (copy), UseSelectorResult (copy), p1 (copy)
		return SetupFireEventFunction({
			infoForAllEvents = {
				rowNumber = 1,
				uid = UseLocalUserIdResult,
				recommendationSessionId = UseSelectorResult,
				sortIndex = p1.sortAnalyticsData.sortIndex,
				sortId = p1.sortAnalyticsData.sortId,
				appPage = p1.sortAnalyticsData.appPage,
				feedRowNumber = p1.sortAnalyticsData.startRow
			},
			analytics = {
				Diag = p1.diagService,
				EventStream = p1.eventIngestService
			}
		})
	end, {
		UseLocalUserIdResult,
		UseSelectorResult,
		p1.sortAnalyticsData
	})
	
	return if UseLocalUserIdResult and (UseSelectorResult or p1.findFriendsTileEnabled) then React.createElement(PYMKCollectionCarouselModule, {
		findFriendsTileEnabled = p1.findFriendsTileEnabled,
		seeAllTileEnabled = p1.seeAllTileEnabled,
		recommendationSessionId = UseSelectorResult,
		carouselTitle = p1.carouselTitle,
		sideMargin = p1.sideMargin,
		openProfilePeekView = p1.openProfilePeekView,
		showToast = p1.showToast,
		goToAddFriendsPage = p1.goToAddFriendsPage,
		shouldShowContactImporterBadge = p1.shouldShowContactImporterBadge,
		pageContext = p1.pageContext,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		fireAnalyticsEvent = UseMemoResult,
		appCompositionEnabled = p1.appCompositionEnabled
	}) else nil
end