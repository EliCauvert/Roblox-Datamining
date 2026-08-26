local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appPage = require(parent.RobloxAppEnums).AppPage
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local gamePlayIntent = require(parent.DiscoveryAnalytics).Events.gamePlayIntent
local reportGameAttributionError = require(parent.DiscoveryAnalytics).Events.reportGameAttributionError
local mutedError = require(parent.Loggers).mutedError
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local gameSortLoadSource = require(parent.DiscoveryAvailability).GameSortLoadSource
local feedScroll = require(parent.ScrollTelemetry).feedScroll
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local cryoModule = require(parent.Cryo)
local fFlagLuaAppLogGameAttributionError = require(parent.SharedFlags).FFlagLuaAppLogGameAttributionError
local fFlagLuaAppGameDetailsAttributionFix = require(parent.SharedFlags).FFlagLuaAppGameDetailsAttributionFix
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local t = {}

local function _(p1, p2)
	-- upvalues: cryoModule (ref), t (ref)
	if not p1 and not p2 then
		return nil
	end
	local var1 = cryoModule.Dictionary.join(p1 or t, p2 or t)
	
	return if next(var1) then var1 else nil
end

local var1 = if fFlagLuaAppLogGameAttributionError then { GameDetail = "GameDetail", PlayIntent = "PlayIntent" } else nil

local _ = function(value, p1, p2)
	return if value == nil then nil elseif p1 or p2 then value.topicId else value.gameSetTypeId
end

local _ = function(value, p1)
	return if p1 or value == nil then nil else value.gameSetTargetId
end

local _ = function(p1, p2)
	return if p2 or not p1 then nil else p1.appliedFilters
end

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: useStore (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), appEventIngestService (ref), appPage (ref), gameSortLoadSource (ref), reactModule (ref), fFlagLuaAppGameDetailsAttributionFix (ref), reportGameAttributionError (ref), var1 (ref), mutedError (ref), calculateRowPositionFields (ref), cryoModule (ref), t (ref), gameCollectionItemTypes (ref), fFlagLuaAppLogGameAttributionError (ref), gamePlayIntent (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), feedScroll (ref)
	local var2 = useStore()
	local var3 = useRoactService(roactAnalyticsCommonGameEvents)
	local var4 = useRoactService(appEventIngestService)
	local var5 = if p1 == nil then nil elseif p2 or p4 == appPage.SearchPage then p1.topicId else p1.gameSetTypeId
	local var6 = if p2 or p1 == nil then nil else p1.gameSetTargetId
	local var7 = if p2 or not p1 then nil else p1.appliedFilters
	local var8 = if p4 == appPage.Home and p1 and p1.topicId then gameSortLoadSource.getSortLoadSource(p1.topicId) else nil
	local var9 = if p1 then p1.sortSubId else nil
	local var10 = if p1 then p1.analyticsData else nil
	
	return reactModule.useCallback(function(p9, p10)
		-- upvalues: fFlagLuaAppGameDetailsAttributionFix (copy), p6 (ref), reportGameAttributionError (copy), p4 (ref), var1 (copy), var5 (ref), var6 (ref), p3 (ref), mutedError (copy), calculateRowPositionFields (copy), p7 (ref), p8 (ref), var10 (ref), cryoModule (copy), t (copy), var3 (ref), var7 (ref), var8 (ref), gameCollectionItemTypes (copy), var9 (ref)
		if fFlagLuaAppGameDetailsAttributionFix then
			local var11
			local _ = nil
			local var12 = nil
			
			if p9 and p6 then
				var12 = p6[p9]
				var11 = if var12 then var12.universeId ~= p10 else not var12
			else
				var11 = true
			end
			if var11 then
				reportGameAttributionError(p4, {
					errorType = var1.GameDetail,
					clickedUniverseId = p10,
					universeId = if var12 then var12.universeId else nil,
					gameSetTypeId = var5,
					gameSetTargetId = var6,
					sortIndex = p3,
					sortEntryIndex = p9 or nil
				})
			end
		end
		if p9 ~= nil and p6 ~= nil then
			local var13 = p6[p9]
			
			if not var13 then
				mutedError("reportGameDetailOpened requires a valid entry")
			end
			local var14
			local var15 = calculateRowPositionFields(p9, p7, p8)
			local analyticsData = var13.analyticsData
			
			if var10 or analyticsData then
				local var16 = cryoModule.Dictionary.join(var10 or t, analyticsData or t)
				var14 = if next(var16) then var16 else nil
			else
				var14 = nil
			end
			var3.reportOpenGameDetailWithId(var13.placeIdOverride or var13.placeId, var5, var6, p3, p9, #p6, var13.isSponsored, var13.adId, var13.universeId, p4, p10, var7, var13.topicContentsIndex or p9, nil, var15.positionInRow, var15.rowInSort, var15.rowOnPage, nil, var8, var13.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile, var9, var14)
		end
	end, {
		var3, p3, p4, var5, var6, p6, p7, p8, var8, var9, var10
	}), reactModule.useCallback(function(p9, p10, _, p11, p12, p13)
		-- upvalues: fFlagLuaAppLogGameAttributionError (copy), p6 (ref), reportGameAttributionError (copy), var1 (copy), var5 (ref), var6 (ref), p3 (ref), calculateRowPositionFields (copy), p7 (ref), p8 (ref), var10 (ref), cryoModule (copy), t (copy), gamePlayIntent (copy), var4 (ref), var7 (ref), p4 (ref), var8 (ref), var9 (ref), gameCollectionItemTypes (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if fFlagLuaAppLogGameAttributionError then
			local var11
			local _ = nil
			local var12 = nil
			
			if p12 and p6 then
				var12 = p6[p12]
				var11 = if var12 then var12.universeId ~= p9.universeId else not var12
			else
				var11 = true
			end
			if var11 then
				reportGameAttributionError(p11, {
					errorType = var1.PlayIntent,
					clickedUniverseId = p9.universeId,
					universeId = if var12 then var12.universeId else nil,
					gameSetTypeId = var5,
					gameSetTargetId = var6,
					sortIndex = p3,
					sortEntryIndex = p12 or nil
				})
			end
		end
		local var13
		local var14 = calculateRowPositionFields(p12, p7, p8)
		local analyticsData = p9.analyticsData
		
		if var10 or analyticsData then
			local var15 = cryoModule.Dictionary.join(var10 or t, analyticsData or t)
			var13 = if next(var15) then var15 else nil
		else
			var13 = nil
		end
		gamePlayIntent(var4, p11, {
			placeId = p9.placeIdOverride or p9.placeId,
			rootPlaceId = tonumber(p9.placeId),
			universeId = p9.universeId,
			sortIndex = tostring(p3),
			sortEntryIndex = if p12 then tostring(p12) else nil,
			referralSource = p10,
			gameSetTypeId = var5,
			gameSetTargetId = var6,
			appliedFilters = var7,
			topicDataPosition = p9.topicContentsIndex or p12,
			nativeAdData = p9.adId,
			pageName = p4,
			positionInRow = var14.positionInRow,
			rowNumber = var14.rowInSort,
			feedRowNumber = var14.rowOnPage,
			loadSource = var8,
			launchData = p9.launchDataOverride,
			sortSubId = var9,
			tileType = p9.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
			analyticsData = var13,
			actionType = if fFlagLuaAppDemoModePlayButtonTelemetry then p13 else nil
		})
	end, {
		p3, var4, var5, var6, if fFlagLuaAppLogGameAttributionError then p6 else nil,
		p4, p7, p8, var8, var9, var10
	}), reactModule.useCallback(function()
		-- upvalues: var3 (ref), var5 (ref), var6 (ref), p3 (ref)
		var3.reportSeeAllWithId(var5, var6, p3)
	end, { var3, var5, var6, p3 }), reactModule.useCallback(function(p9, p10, p11)
		-- upvalues: p5 (ref), mutedError (copy), var2 (ref), p3 (ref), var5 (ref), var6 (ref), feedScroll (copy), var4 (ref), p4 (ref)
		if p5 and p5.current ~= nil then
			local scrollingDirection = p5.current.ScrollingDirection
			local var11 = 0
			
			if scrollingDirection == Enum.ScrollingDirection.X then
				var11 = p5.current.AbsoluteSize.X
			elseif scrollingDirection == Enum.ScrollingDirection.Y then
				var11 = p5.current.AbsoluteSize.Y
			else
				mutedError(`Direction {scrollingDirection.Name} is an unsupported option for feedScroll event`)
			end
			local screenSize = var2:getState().ScreenSize
			feedScroll(var4, p4, scrollingDirection, {
				distance = p9,
				screenSizeX = screenSize.X,
				screenSizeY = screenSize.Y,
				scrollAreaSize = var11,
				scrollDepth = if var11 > 0 then p9 / var11 else nil,
				startDepth = if var11 > 0 then p11 / var11 else nil,
				startPos = p11,
				scrollDuration = p10,
				sortPos = p3,
				gameSetTypeId = var5,
				gameSetTargetId = var6
			})
		end
	end, {
		var4, p3, p4, p5, var5, var6, var2
	})
end