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
local fFlagLuaAppAddSubIdToHomeEvents = require(parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local t = {}

local function _(p0, p1) --[[ line: 29 | named "mergeAnalyticsData" ]]
	-- upvalues: cryoModule (ref), t (ref)
	if not p0 and not p1 then
		return nil
	end
	local var4 = cryoModule.Dictionary.join(p0 or t, p1 or t)
	
	return if next(var4) then var4 else nil
end

local var3 = if fFlagLuaAppLogGameAttributionError then { GameDetail = "GameDetail", PlayIntent = "PlayIntent" } else nil

local _ = function(value, p2, p3) --[[ line: 50 | named "getGameSetTypeId" ]]
	return if value == nil then nil elseif p2 or p3 then value.topicId else value.gameSetTypeId
end

local _ = function(value, p4) --[[ line: 62 | named "getGameSetTargetId" ]]
	return if p4 or value == nil then nil else value.gameSetTargetId
end

local _ = function(p5, p6) --[[ line: 72 | named "getAppliedFilters" ]]
	return if p6 or not p5 then nil else p5.appliedFilters
end

return function(p7, p8, p9, p10, p11, p12, p13, p14) --[[ line: 85 | named "useGameSortAnalytics" ]]
	-- upvalues: useStore (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), appEventIngestService (ref), appPage (ref), gameSortLoadSource (ref), fFlagLuaAppAddSubIdToHomeEvents (ref), reactModule (ref), fFlagLuaAppGameDetailsAttributionFix (ref), reportGameAttributionError (ref), var3 (ref), mutedError (ref), calculateRowPositionFields (ref), cryoModule (ref), t (ref), gameCollectionItemTypes (ref), fFlagLuaAppLogGameAttributionError (ref), gamePlayIntent (ref), feedScroll (ref)
	local var5 = useStore()
	local var6 = useRoactService(roactAnalyticsCommonGameEvents)
	local var7 = useRoactService(appEventIngestService)
	local var8 = if p7 == nil then nil elseif p8 or p10 == appPage.SearchPage then p7.topicId else p7.gameSetTypeId
	local var9 = if p8 or p7 == nil then nil else p7.gameSetTargetId
	local var10 = if p8 or not p7 then nil else p7.appliedFilters
	local var11 = if p10 == appPage.Home and p7 and p7.topicId then gameSortLoadSource.getSortLoadSource(p7.topicId) else nil
	local var12 = if fFlagLuaAppAddSubIdToHomeEvents and p7 then p7.sortSubId else nil
	local var13 = if p7 then p7.analyticsData else nil
	
	return reactModule.useCallback(function(p15, p16) --[[ line: 115 ]]
		-- upvalues: fFlagLuaAppGameDetailsAttributionFix (copy), p12 (ref), reportGameAttributionError (copy), p10 (ref), var3 (copy), var8 (ref), var9 (ref), p9 (ref), mutedError (copy), calculateRowPositionFields (copy), p13 (ref), p14 (ref), var13 (ref), cryoModule (copy), t (copy), var6 (ref), var10 (ref), var11 (ref), gameCollectionItemTypes (copy), fFlagLuaAppAddSubIdToHomeEvents (copy), var12 (ref)
		if fFlagLuaAppGameDetailsAttributionFix then
			local var15
			local _ = nil
			local var14 = nil
			
			if p15 and p12 then
				var14 = p12[p15]
				var15 = if var14 then var14.universeId ~= p16 else not var14
			else
				var15 = true
			end
			if var15 then
				reportGameAttributionError(p10, {
					errorType = var3.GameDetail,
					clickedUniverseId = p16,
					universeId = if var14 then var14.universeId else nil,
					gameSetTypeId = var8,
					gameSetTargetId = var9,
					sortIndex = p9,
					sortEntryIndex = p15 or nil
				})
			end
		end
		if p15 ~= nil and p12 ~= nil then
			local var16 = p12[p15]
			
			if not var16 then
				mutedError("reportGameDetailOpened requires a valid entry")
			end
			local var18
			local var17 = calculateRowPositionFields(p15, p13, p14)
			local analyticsData = var16.analyticsData
			
			if var13 or analyticsData then
				local var19 = cryoModule.Dictionary.join(var13 or t, analyticsData or t)
				var18 = if next(var19) then var19 else nil
			else
				var18 = nil
			end
			var6.reportOpenGameDetailWithId(var16.placeIdOverride or var16.placeId, var8, var9, p9, p15, #p12, var16.isSponsored, var16.adId, var16.universeId, p10, p16, var10, var16.topicContentsIndex or p15, nil, var17.positionInRow, var17.rowInSort, var17.rowOnPage, nil, var11, var16.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile, if fFlagLuaAppAddSubIdToHomeEvents then var12 else nil, var18)
		end
	end, {
		var6, p9, p10, var8, var9, p12, p13, p14, var11,
		if fFlagLuaAppAddSubIdToHomeEvents then var12 else nil, var13
	}), reactModule.useCallback(function(p17, p18, _, p19, p20) --[[ line: 193 ]]
		-- upvalues: fFlagLuaAppLogGameAttributionError (copy), p12 (ref), reportGameAttributionError (copy), var3 (copy), var8 (ref), var9 (ref), p9 (ref), calculateRowPositionFields (copy), p13 (ref), p14 (ref), var13 (ref), cryoModule (copy), t (copy), gamePlayIntent (copy), var7 (ref), var10 (ref), p10 (ref), var11 (ref), fFlagLuaAppAddSubIdToHomeEvents (copy), var12 (ref), gameCollectionItemTypes (copy)
		if fFlagLuaAppLogGameAttributionError then
			local var21
			local _ = nil
			local var20 = nil
			
			if p20 and p12 then
				var20 = p12[p20]
				var21 = if var20 then var20.universeId ~= p17.universeId else not var20
			else
				var21 = true
			end
			if var21 then
				reportGameAttributionError(p19, {
					errorType = var3.PlayIntent,
					clickedUniverseId = p17.universeId,
					universeId = if var20 then var20.universeId else nil,
					gameSetTypeId = var8,
					gameSetTargetId = var9,
					sortIndex = p9,
					sortEntryIndex = p20 or nil
				})
			end
		end
		local var23
		local var22 = calculateRowPositionFields(p20, p13, p14)
		local analyticsData = p17.analyticsData
		
		if var13 or analyticsData then
			local var24 = cryoModule.Dictionary.join(var13 or t, analyticsData or t)
			var23 = if next(var24) then var24 else nil
		else
			var23 = nil
		end
		gamePlayIntent(var7, p19, {
			placeId = p17.placeIdOverride or p17.placeId,
			rootPlaceId = tonumber(p17.placeId),
			universeId = p17.universeId,
			sortIndex = tostring(p9),
			sortEntryIndex = if p20 then tostring(p20) else nil,
			referralSource = p18,
			gameSetTypeId = var8,
			gameSetTargetId = var9,
			appliedFilters = var10,
			topicDataPosition = p17.topicContentsIndex or p20,
			nativeAdData = p17.adId,
			pageName = p10,
			positionInRow = var22.positionInRow,
			rowNumber = var22.rowInSort,
			feedRowNumber = var22.rowOnPage,
			loadSource = var11,
			launchData = p17.launchDataOverride,
			sortSubId = if fFlagLuaAppAddSubIdToHomeEvents then var12 else nil,
			tileType = p17.tileType or gameCollectionItemTypes.GameCollectionItemType.GameTile,
			analyticsData = var23
		})
	end, {
		p9, var7, var8, var9, if fFlagLuaAppLogGameAttributionError then p12 else nil,
		p10, p13, p14, var11, if fFlagLuaAppAddSubIdToHomeEvents then var12 else nil,
		var13
	}), reactModule.useCallback(function() --[[ line: 266 ]]
		-- upvalues: var6 (ref), var8 (ref), var9 (ref), p9 (ref)
		var6.reportSeeAllWithId(var8, var9, p9)
	end, { var6, var8, var9, p9 }), reactModule.useCallback(function(p21, p22, p23) --[[ line: 279 ]]
		-- upvalues: p11 (ref), mutedError (copy), var5 (ref), p9 (ref), var8 (ref), var9 (ref), feedScroll (copy), var7 (ref), p10 (ref)
		if p11 and p11.current ~= nil then
			local scrollingDirection = p11.current.ScrollingDirection
			local var25 = 0
			
			if scrollingDirection == Enum.ScrollingDirection.X then
				var25 = p11.current.AbsoluteSize.X
			elseif scrollingDirection == Enum.ScrollingDirection.Y then
				var25 = p11.current.AbsoluteSize.Y
			else
				mutedError(`Direction {scrollingDirection.Name} is an unsupported option for feedScroll event`)
			end
			local screenSize = var5:getState().ScreenSize
			feedScroll(var7, p10, scrollingDirection, {
				distance = p21,
				screenSizeX = screenSize.X,
				screenSizeY = screenSize.Y,
				scrollAreaSize = var25,
				scrollDepth = if var25 > 0 then p21 / var25 else nil,
				startDepth = if var25 > 0 then p23 / var25 else nil,
				startPos = p23,
				scrollDuration = p22,
				sortPos = p9,
				gameSetTypeId = var8,
				gameSetTargetId = var9
			})
		end
	end, {
		var7, p9, p10, p11, var8, var9, var5
	})
end