local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")
local parent = PYMKCarousel.Parent
local dependenciesModule = require(PYMKCarousel.dependencies)
local react = dependenciesModule.React
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local sharedFlagsModule = require(parent.SharedFlags)
local useSelector = dependenciesModule.Hooks.useSelector
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local setupFireEvent = require(PYMKCarousel.Analytics).setupFireEvent
local getSessionIdByKey = dependenciesModule.RoduxAnalytics.Selectors.getSessionIdByKey
local RECOMMENDATION_SESSION_ID_KEY = require(PYMKCarousel.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local PYMKCollectionCarouselModule = require(PYMKCarousel.Components.PYMKCollectionCarousel)
local _ = require(PYMKCarousel.Analytics.AnalyticsTypes)
local _ = require(PYMKCarousel.Common.DirectRecommendationTypes)
local fFlagLuaAppUserSeenCollectionUnifiedFields = sharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local fFlagLuaAppEnableSduiHomePage = sharedFlagsModule.FFlagLuaAppEnableSduiHomePage

return function(p1)
	-- upvalues: useLocalUserId (ref), fFlagLuaAppEnableSduiHomePage (ref), useSelector (ref), getSessionIdByKey (ref), RECOMMENDATION_SESSION_ID_KEY (ref), react (ref), setupFireEvent (ref), PYMKCollectionCarouselModule (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref)
	local var1 = useLocalUserId()
	local var2 = if fFlagLuaAppEnableSduiHomePage then p1.recommendationSessionId else useSelector(function(p2)
		-- upvalues: getSessionIdByKey (copy), RECOMMENDATION_SESSION_ID_KEY (copy)
		return getSessionIdByKey(p2)(RECOMMENDATION_SESSION_ID_KEY)
	end)
	
	return if var1 then if var2 or p1.findFriendsTileEnabled then react.createElement(PYMKCollectionCarouselModule, {
		findFriendsTileEnabled = p1.findFriendsTileEnabled,
		seeAllTileEnabled = p1.seeAllTileEnabled,
		recommendationSessionId = var2,
		carouselTitle = p1.carouselTitle,
		sideMargin = p1.sideMargin,
		openProfilePeekView = p1.openProfilePeekView,
		showToast = p1.showToast,
		goToAddFriendsPage = p1.goToAddFriendsPage,
		shouldShowContactImporterBadge = p1.shouldShowContactImporterBadge,
		pageContext = p1.pageContext,
		scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
		fireAnalyticsEvent = react.useMemo(function()
			-- upvalues: setupFireEvent (copy), var1 (ref), var2 (write), p1 (ref)
			return setupFireEvent({
				infoForAllEvents = {
					rowNumber = 1,
					uid = var1,
					recommendationSessionId = var2,
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
		end, { var1, var2, p1.sortAnalyticsData }),
		appCompositionEnabled = p1.appCompositionEnabled,
		sortAnalyticsData = if fFlagLuaAppUserSeenCollectionUnifiedFields then p1.sortAnalyticsData else nil,
		recommendations = if fFlagLuaAppEnableSduiHomePage then p1.recommendations else nil
	}) else nil else nil
end