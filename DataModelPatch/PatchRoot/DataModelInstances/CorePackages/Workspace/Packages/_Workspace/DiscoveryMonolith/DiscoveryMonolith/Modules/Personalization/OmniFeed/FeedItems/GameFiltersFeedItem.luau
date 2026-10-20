local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local GameFiltersModule = require(Parent.GameFilters)
local FilterPillCarousel = GameFiltersModule.FilterPillCarousel
local UseGameFiltersSelectorFunction = GameFiltersModule.DataStore.useGameFiltersSelector
local UseGameFilterAnalyticsInfoFunction = GameFiltersModule.useGameFilterAnalyticsInfo
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local SendFilterImpressionsFunction = require(Parent.GameFilters).sendFilterImpressions
local GamesFilterClickEventFunction = require(Parent.GameFilters).gamesFilterClickEvent
local Modules = DiscoveryMonolith.Modules
local OmniFeedPropsModule = require(Modules.Personalization.OmniFeed.OmniFeedProps)
local FetchGamesPageDataModule = require(Modules.LuaApp.Thunks.FetchGamesPageData)
local UseGameFiltersFeedItemSideMarginModule = require(Modules.Personalization.OmniFeed.useGameFiltersFeedItemSideMargin)
local FFlagLuaAppChartsResetFetchingStatusOnFilterChange = require(Parent.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag
local FFlagLuaAppChartsActiveFilterChips = require(Parent.SharedFlags).FFlagLuaAppChartsActiveFilterChips
local Games = require(Parent.DiscoveryTypes).GameSortGroups.Games

return function(p1)
	-- upvalues: OmniFeedPropsModule (copy), FFlagLuaAppCompositionAlways (copy), UseGameFiltersSelectorFunction (copy), Games (copy), UseGameFilterAnalyticsInfoFunction (copy), ReactModule (copy), UseGameFiltersFeedItemSideMarginModule (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalytics (copy), AppEventIngestService (copy), SendFilterImpressionsFunction (copy), GamesFilterClickEventFunction (copy), FFlagLuaAppChartsFilterOptionTextTag (copy), FFlagLuaAppChartsActiveFilterChips (copy), FetchGamesPageDataModule (copy), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (copy), FilterPillCarousel (copy)
	local v1 = p1[OmniFeedPropsModule.key]
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else v1.appCompositionEnabled
	local UseGameFiltersSelectorResult = UseGameFiltersSelectorFunction(Games)
	local UseGameFilterAnalyticsInfoResult = UseGameFilterAnalyticsInfoFunction(p1.gameSortId, p1.sortIndex)
	local UseRefResult = ReactModule.useRef(nil)
	local UseGameFiltersFeedItemSideMarginModuleResult = if FFlagLuaAppCompositionAlways then nil else UseGameFiltersFeedItemSideMarginModule(UseRefResult.current)
	local UseGameFiltersFeedItemSideMarginModuleResult1 = if AppCompositionEnabled then nil else UseGameFiltersFeedItemSideMarginModuleResult
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppEventIngestService)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: SendFilterImpressionsFunction (upval), UseRoactServiceResult2 (copy), UseGameFiltersSelectorResult (copy), v1 (copy), UseGameFilterAnalyticsInfoResult (copy)
		SendFilterImpressionsFunction(UseRoactServiceResult2, p2, UseGameFiltersSelectorResult and UseGameFiltersSelectorResult.allFilters or {}, v1.appPage, UseGameFilterAnalyticsInfoResult)
	end, {
		UseRoactServiceResult2,
		UseGameFiltersSelectorResult,
		v1.appPage,
		UseGameFilterAnalyticsInfoResult
	})
	local UseResult1 = ReactModule.useCallback(function(ButtonName, FilterId, SelectedOptionId, PreviousOptionId, p2, p3, p4)
		-- upvalues: GamesFilterClickEventFunction (upval), UseRoactServiceResult2 (copy), v1 (copy), UseGameFilterAnalyticsInfoResult (copy), FFlagLuaAppChartsFilterOptionTextTag (upval), FFlagLuaAppChartsActiveFilterChips (upval)
		GamesFilterClickEventFunction(UseRoactServiceResult2, v1.appPage, {
			buttonName = ButtonName,
			filterId = FilterId,
			selectedOptionId = SelectedOptionId,
			previousOptionId = PreviousOptionId,
			gameSetTypeId = UseGameFilterAnalyticsInfoResult.gameSetTypeId,
			gameSetTargetId = UseGameFilterAnalyticsInfoResult.gameSetTargetId,
			sortPos = UseGameFilterAnalyticsInfoResult.sortPos,
			selectedOptionContextTag = if FFlagLuaAppChartsFilterOptionTextTag then p2 else nil,
			previousOptionContextTag = if FFlagLuaAppChartsFilterOptionTextTag then p3 else nil,
			isActive = if FFlagLuaAppChartsActiveFilterChips then p4 else nil
		})
	end, {
		UseRoactServiceResult2,
		v1.appPage,
		UseGameFilterAnalyticsInfoResult
	})
	local UseResult2 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseDispatchResult (copy), FetchGamesPageDataModule (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), FFlagLuaAppChartsResetFetchingStatusOnFilterChange (upval)
		return UseDispatchResult(FetchGamesPageDataModule(UseRoactServiceResult, UseRoactServiceResult1, nil, { [p2] = p3 }, if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then true else nil))
	end, {
		UseRoactServiceResult,
		UseRoactServiceResult1,
		if FFlagLuaAppChartsResetFetchingStatusOnFilterChange then UseDispatchResult else nil
	})
	
	return if UseGameFiltersSelectorResult and #UseGameFiltersSelectorResult.allFilters > 0 then ReactModule.createElement(FilterPillCarousel, {
		title = p1.topicName,
		filters = UseGameFiltersSelectorResult.allFilters,
		sideMargin = UseGameFiltersFeedItemSideMarginModuleResult1,
		sortIndex = p1.sortIndex,
		onFilterApplied = UseResult2,
		containerRef = UseRefResult,
		pageContext = v1.appPage,
		dataUpdatedTimestamp = UseGameFiltersSelectorResult.updatedTimestamp,
		analyticsInfo = UseGameFilterAnalyticsInfoResult,
		scrollViewPositionChangedSignal = v1.scrollViewPositionChangedSignal,
		sendImpressions = UseResult,
		sendFilterClick = UseResult1
	}) else nil
end