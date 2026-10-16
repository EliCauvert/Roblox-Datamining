local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local Parent = PYMKCarousel.Parent
local DependenciesModule = require(PYMKCarousel.dependencies)
local React = DependenciesModule.React
local SharedFlagsModule = require(Parent.SharedFlags)
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local SetupFireEventFunction = require(PYMKCarousel.Analytics).setupFireEvent
local GetSessionIdByKeyFunction = DependenciesModule.RoduxAnalytics.Selectors.getSessionIdByKey
local RECOMMENDATIONSESSIONIDKEY = require(PYMKCarousel.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local PYMKCollectionCarouselModule = require(PYMKCarousel.Components.PYMKCollectionCarousel)
local _ = require(PYMKCarousel.Analytics.AnalyticsTypes)
local _ = require(PYMKCarousel.Common.DirectRecommendationTypes)
local FFlagLuaAppUserSeenCollectionUnifiedFields = SharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local FFlagLuaAppEnableSduiHomePage = SharedFlagsModule.FFlagLuaAppEnableSduiHomePage

return function(p1) --[[ Line: 53 | Named "PYMKCarouselEntryPoint" ]]
	-- upvalues: UseLocalUserIdFunction (copy), FFlagLuaAppEnableSduiHomePage (copy), UseSelectorFunction (copy), GetSessionIdByKeyFunction (copy), RECOMMENDATIONSESSIONIDKEY (copy), React (copy), SetupFireEventFunction (copy), PYMKCollectionCarouselModule (copy), FFlagLuaAppUserSeenCollectionUnifiedFields (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local RecommendationSessionId = nil
	RecommendationSessionId = if FFlagLuaAppEnableSduiHomePage then p1.recommendationSessionId else UseSelectorFunction(function(p2) --[[ Line: 60 ]]
		-- upvalues: GetSessionIdByKeyFunction (upval), RECOMMENDATIONSESSIONIDKEY (upval)
		return GetSessionIdByKeyFunction(p2)(RECOMMENDATIONSESSIONIDKEY)
	end)
	local UseMemoResult = React.useMemo(function() --[[ Line: 65 ]]
		-- upvalues: SetupFireEventFunction (upval), UseLocalUserIdResult (copy), RecommendationSessionId (ref), p1 (copy)
		return SetupFireEventFunction({
			infoForAllEvents = {
				rowNumber = 1,
				uid = UseLocalUserIdResult,
				recommendationSessionId = RecommendationSessionId,
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
		RecommendationSessionId,
		p1.sortAnalyticsData
	})
	
	return if UseLocalUserIdResult and (RecommendationSessionId or p1.findFriendsTileEnabled) then React.createElement(PYMKCollectionCarouselModule, {
		findFriendsTileEnabled = p1.findFriendsTileEnabled,
		seeAllTileEnabled = p1.seeAllTileEnabled,
		recommendationSessionId = RecommendationSessionId,
		carouselTitle = p1.carouselTitle,
		sideMargin = p1.sideMargin,
		openProfilePeekView = p1.openProfilePeekView,
		showToast = p1.showToast,
		goToAddFriendsPage = p1.goToAddFriendsPage,
		shouldShowContactImporterBadge = p1.shouldShowContactImporterBadge,
		pageContext = p1.pageContext,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		fireAnalyticsEvent = UseMemoResult,
		appCompositionEnabled = p1.appCompositionEnabled,
		sortAnalyticsData = if FFlagLuaAppUserSeenCollectionUnifiedFields then p1.sortAnalyticsData else nil,
		recommendations = if FFlagLuaAppEnableSduiHomePage then p1.recommendations else nil
	}) else nil
end