local Parent = script:FindFirstAncestor("GameCollections").Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local GamePlayIntentFunction = require(Parent.DiscoveryAnalytics).Events.gamePlayIntent
local ReportGameAttributionErrorFunction = require(Parent.DiscoveryAnalytics).Events.reportGameAttributionError
local MutedErrorFunction = require(Parent.Loggers).mutedError
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local GameSortLoadSource = require(Parent.DiscoveryAvailability).GameSortLoadSource
local FeedScrollFunction = require(Parent.ScrollTelemetry).feedScroll
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local CryoModule = require(Parent.Cryo)
local FFlagLuaAppLogGameAttributionError = require(Parent.SharedFlags).FFlagLuaAppLogGameAttributionError
local FFlagLuaAppGameDetailsAttributionFix = require(Parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local t = {}

local function _(p1, p2)
	-- upvalues: CryoModule (copy), t (copy)
	if p1 or p2 then
		local JoinResult = CryoModule.Dictionary.join(p1 or t, p2 or t)
		
		return if next(JoinResult) then JoinResult else nil
	else
		return nil
	end
end

local Config = if FFlagLuaAppLogGameAttributionError then { GameDetail = "GameDetail", PlayIntent = "PlayIntent" } else nil

local _ = function(p1, p2, p3)
	return if p1 == nil then nil elseif p2 or p3 then p1.topicId else p1.gameSetTypeId
end

local _ = function(p1, p2)
	return if p2 or p1 == nil then nil else p1.gameSetTargetId
end

local _ = function(p1, p2)
	return if p2 or not p1 then nil else p1.appliedFilters
end

return function(p1, p2, SortIndex, PageName, p3, p4, p5, p6)
	-- upvalues: UseStoreFunction (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), AppEventIngestService (copy), AppPage (copy), GameSortLoadSource (copy), ReactModule (copy), FFlagLuaAppGameDetailsAttributionFix (copy), ReportGameAttributionErrorFunction (copy), Config (copy), MutedErrorFunction (copy), CalculateRowPositionFieldsFunction (copy), CryoModule (copy), t (copy), GameCollectionItemTypes (copy), FFlagLuaAppLogGameAttributionError (copy), GamePlayIntentFunction (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), FeedScrollFunction (copy)
	local UseStoreResult = UseStoreFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local IsPageNameMatch = PageName == AppPage.SearchPage
	local TopicId = if p1 == nil then nil elseif p2 or IsPageNameMatch then p1.topicId else p1.gameSetTypeId
	local GameSetTargetId = if p2 or p1 == nil then nil else p1.gameSetTargetId
	local AppliedFilters = if p2 or not p1 then nil else p1.appliedFilters
	local SortLoadSource = if PageName == AppPage.Home and p1 and p1.topicId then GameSortLoadSource.getSortLoadSource(p1.topicId) else nil
	local SortSubId = if p1 then p1.sortSubId else nil
	local AnalyticsData = if p1 then p1.analyticsData else nil
	
	return ReactModule.useCallback(function(p7, ClickedUniverseId)
		-- upvalues: FFlagLuaAppGameDetailsAttributionFix (upval), p4 (copy), ReportGameAttributionErrorFunction (upval), PageName (copy), Config (upval), TopicId (copy), GameSetTargetId (copy), SortIndex (copy), MutedErrorFunction (upval), CalculateRowPositionFieldsFunction (upval), p5 (copy), p6 (copy), AnalyticsData (copy), CryoModule (upval), t (upval), UseRoactServiceResult (copy), AppliedFilters (copy), SortLoadSource (copy), GameCollectionItemTypes (upval), SortSubId (copy)
		if FFlagLuaAppGameDetailsAttributionFix then
			local v1 = nil
			local v2 = nil
			
			if p7 and p4 then
				v1 = p4[p7]
				v2 = not v1 or v1.universeId ~= ClickedUniverseId
			else
				v2 = true
			end
			if v2 then
				ReportGameAttributionErrorFunction(PageName, {
					errorType = Config.GameDetail,
					clickedUniverseId = ClickedUniverseId,
					universeId = if v1 then v1.universeId else nil,
					gameSetTypeId = TopicId,
					gameSetTargetId = GameSetTargetId,
					sortIndex = SortIndex,
					sortEntryIndex = p7 or nil
				})
			end
		end
		if p7 ~= nil and p4 ~= nil then
			local v3 = p4[p7]
			
			if not v3 then
				MutedErrorFunction("reportGameDetailOpened requires a valid entry")
			end
			local RowPositionFields = CalculateRowPositionFieldsFunction(p7, p5, p6)
			local AnalyticsData1 = v3.analyticsData
			local JoinResult1 = nil
			
			if AnalyticsData or AnalyticsData1 then
				local JoinResult = CryoModule.Dictionary.join(AnalyticsData or t, AnalyticsData1 or t)
				JoinResult1 = if next(JoinResult) then JoinResult else nil
			else
				JoinResult1 = nil
			end
			UseRoactServiceResult.reportOpenGameDetailWithId(v3.placeIdOverride or v3.placeId, TopicId, GameSetTargetId, SortIndex, p7, #p4, v3.isSponsored, v3.adId, v3.universeId, PageName, ClickedUniverseId, AppliedFilters, v3.topicContentsIndex or p7, nil, RowPositionFields.positionInRow, RowPositionFields.rowInSort, RowPositionFields.rowOnPage, nil, SortLoadSource, v3.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile, SortSubId, JoinResult1)
		end
	end, {
		UseRoactServiceResult, SortIndex, PageName, TopicId, GameSetTargetId, p4, p5,
		p6, SortLoadSource, SortSubId, AnalyticsData
	}), ReactModule.useCallback(function(p7, ReferralSource, _, p8, p9, p10)
		-- upvalues: FFlagLuaAppLogGameAttributionError (upval), p4 (copy), ReportGameAttributionErrorFunction (upval), Config (upval), TopicId (copy), GameSetTargetId (copy), SortIndex (copy), CalculateRowPositionFieldsFunction (upval), p5 (copy), p6 (copy), AnalyticsData (copy), CryoModule (upval), t (upval), GamePlayIntentFunction (upval), UseRoactServiceResult1 (copy), AppliedFilters (copy), PageName (copy), SortLoadSource (copy), SortSubId (copy), GameCollectionItemTypes (upval), FFlagLuaAppDemoModePlayButtonTelemetry (upval)
		if FFlagLuaAppLogGameAttributionError then
			local v1 = nil
			local v2 = nil
			
			if p9 and p4 then
				v1 = p4[p9]
				v2 = not v1 or v1.universeId ~= p7.universeId
			else
				v2 = true
			end
			if v2 then
				ReportGameAttributionErrorFunction(p8, {
					errorType = Config.PlayIntent,
					clickedUniverseId = p7.universeId,
					universeId = if v1 then v1.universeId else nil,
					gameSetTypeId = TopicId,
					gameSetTargetId = GameSetTargetId,
					sortIndex = SortIndex,
					sortEntryIndex = p9 or nil
				})
			end
		end
		local RowPositionFields = CalculateRowPositionFieldsFunction(p9, p5, p6)
		local AnalyticsData1 = p7.analyticsData
		local JoinResult1 = nil
		
		if AnalyticsData or AnalyticsData1 then
			local JoinResult = CryoModule.Dictionary.join(AnalyticsData or t, AnalyticsData1 or t)
			JoinResult1 = if next(JoinResult) then JoinResult else nil
		else
			JoinResult1 = nil
		end
		GamePlayIntentFunction(UseRoactServiceResult1, p8, {
			placeId = p7.placeIdOverride or p7.placeId,
			rootPlaceId = tonumber(p7.placeId),
			universeId = p7.universeId,
			sortIndex = tostring(SortIndex),
			sortEntryIndex = if p9 then tostring(p9) else nil,
			referralSource = ReferralSource,
			gameSetTypeId = TopicId,
			gameSetTargetId = GameSetTargetId,
			appliedFilters = AppliedFilters,
			topicDataPosition = p7.topicContentsIndex or p9,
			nativeAdData = p7.adId,
			pageName = PageName,
			positionInRow = RowPositionFields.positionInRow,
			rowNumber = RowPositionFields.rowInSort,
			feedRowNumber = RowPositionFields.rowOnPage,
			loadSource = SortLoadSource,
			launchData = p7.launchDataOverride,
			sortSubId = SortSubId,
			tileType = p7.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile,
			analyticsData = JoinResult1,
			actionType = if FFlagLuaAppDemoModePlayButtonTelemetry then p10 else nil
		})
	end, {
		SortIndex, UseRoactServiceResult1, TopicId, GameSetTargetId,
		if FFlagLuaAppLogGameAttributionError then p4 else nil, PageName, p5, p6,
		SortLoadSource, SortSubId, AnalyticsData
	}), ReactModule.useCallback(function()
		-- upvalues: UseRoactServiceResult (copy), TopicId (copy), GameSetTargetId (copy), SortIndex (copy)
		UseRoactServiceResult.reportSeeAllWithId(TopicId, GameSetTargetId, SortIndex)
	end, {
		UseRoactServiceResult,
		TopicId,
		GameSetTargetId,
		SortIndex
	}), (ReactModule.useCallback(function(Distance, ScrollDuration, StartPos)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), UseStoreResult (copy), SortIndex (copy), TopicId (copy), GameSetTargetId (copy), FeedScrollFunction (upval), UseRoactServiceResult1 (copy), PageName (copy)
		if p3 and p3.current ~= nil then
			local ScrollingDirection = p3.current.ScrollingDirection
			local X = 0
			
			if ScrollingDirection == Enum.ScrollingDirection.X then
				X = p3.current.AbsoluteSize.X
			elseif ScrollingDirection == Enum.ScrollingDirection.Y then
				X = p3.current.AbsoluteSize.Y
			else
				MutedErrorFunction(`Direction {ScrollingDirection.Name} is an unsupported option for feedScroll event`)
			end
			local ScreenSize = UseStoreResult:getState().ScreenSize
			FeedScrollFunction(UseRoactServiceResult1, PageName, ScrollingDirection, {
				distance = Distance,
				screenSizeX = ScreenSize.X,
				screenSizeY = ScreenSize.Y,
				scrollAreaSize = X,
				scrollDepth = if X > 0 then Distance / X else nil,
				startDepth = if X > 0 then StartPos / X else nil,
				startPos = StartPos,
				scrollDuration = ScrollDuration,
				sortPos = SortIndex,
				gameSetTypeId = TopicId,
				gameSetTargetId = GameSetTargetId
			})
		end
	end, {
		UseRoactServiceResult1, SortIndex, PageName, p3, TopicId, GameSetTargetId,
		UseStoreResult
	}))
end