local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local _ = require(Parent.DiscoveryTypes)
local ReactModule = require(Parent.React)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local VideoActions = require(Parent.VideoUtils).AnalyticsEnums.VideoActions
local VideoLogger = require(Parent.VideoUtils).VideoLogger
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local _ = require(GameTile.GameTileTypes)
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)
local FFlagLuaAppHomeReduceRenders = require(Parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local DiscoveryAnalyticsModule = require(GameTile.Parent.DiscoveryAnalytics)
local DiscoveryVideoEndEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoEndEvent
local DiscoveryVideoLoadEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoLoadEvent
local DiscoveryVideoLoopEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoLoopEvent
local DiscoveryVideoPlayEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoPlayEvent

local function _(p1, p2)
	return if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
end

local _ = function(p1, p2)
	-- upvalues: GetGameTileLayoutDataModule (copy)
	if p1 and p1.primaryWideVideoAssetId then
		return p1.primaryWideVideoAssetId
	else
		local GameTileLayoutDataModule = GetGameTileLayoutDataModule(p1, p2)
		
		return GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
	end
end

return function(p1, p2, PageContext, SortPos, p3)
	-- upvalues: ReactModule (copy), MutedErrorFunction (copy), GetGameTileLayoutDataModule (copy), DiscoveryVideoPlayEventFunction (copy), DiscoveryEventErrorLogger (copy), DiscoveryVideoLoadEventFunction (copy), VideoLogger (copy), VideoActions (copy), DiscoveryVideoLoopEventFunction (copy), DiscoveryVideoEndEventFunction (copy), FFlagLuaAppHomeReduceRenders (copy)
	local TopicId = if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
	local UseResult = ReactModule.useCallback(function(p4, p5)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), TopicId (copy), GetGameTileLayoutDataModule (upval), DiscoveryVideoPlayEventFunction (upval), PageContext (copy), SortPos (copy)
		if p4 ~= nil and p3 ~= nil then
			local v1 = p3[p4]
			
			if not v1 then
				MutedErrorFunction("reportVideoPlay requires a valid entry")
			end
			local WideVideoAssetId = nil
			if v1 and v1.primaryWideVideoAssetId then
				WideVideoAssetId = v1.primaryWideVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v1, TopicId)
				WideVideoAssetId = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
			end
			if not WideVideoAssetId then
				MutedErrorFunction("reportVideoPlay requires a valid videoAssetId")
			end
			DiscoveryVideoPlayEventFunction(PageContext, {
				videoAssetId = WideVideoAssetId,
				videoPlaybackSessionId = p5 or "INVALID_SESSION_ID",
				universeId = v1.universeId,
				rootPlaceId = v1.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos
			})
		end
	end, { PageContext, p3, TopicId, SortPos })
	local UseResult1 = ReactModule.useCallback(function(Index, p4, TotalDuration, LoadTime)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), TopicId (copy), GetGameTileLayoutDataModule (upval), DiscoveryEventErrorLogger (upval), PageContext (copy), DiscoveryVideoLoadEventFunction (upval), SortPos (copy), VideoLogger (upval), VideoActions (upval)
		if Index ~= nil and p3 ~= nil then
			local v1 = p3[Index]
			
			if not v1 then
				MutedErrorFunction("reportVideoLoad requires a valid entry")
			end
			local WideVideoAssetId = nil
			if v1 and v1.primaryWideVideoAssetId then
				WideVideoAssetId = v1.primaryWideVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v1, TopicId)
				WideVideoAssetId = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
			end
			if not WideVideoAssetId then
				MutedErrorFunction("reportVideoLoad requires a valid videoAssetId")
			end
			if not v1.universeId then
				DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingUniverseId", `reportVideoLoad: entry at index {Index} is missing universeId for unified "load" on page "{PageContext}"`, {
					index = Index,
					pageContext = PageContext,
					gameSortId = TopicId,
					placeId = v1.placeId,
					videoAssetId = WideVideoAssetId
				})
			end
			DiscoveryVideoLoadEventFunction(PageContext, {
				videoAssetId = WideVideoAssetId,
				videoPlaybackSessionId = p4 or "INVALID_SESSION_ID",
				totalDuration = TotalDuration,
				loadTime = LoadTime,
				universeId = v1.universeId,
				rootPlaceId = v1.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos
			})
			
			if v1.universeId and WideVideoAssetId then
				VideoLogger.reportVideoAction(VideoActions.load, PageContext, {
					source = "universe",
					videoAssetId = WideVideoAssetId,
					sourceId = tostring(v1.universeId),
					playbackSessionId = p4 or "INVALID_SESSION_ID"
				}, { loadTime = LoadTime })
			end
		end
	end, { PageContext, p3, TopicId, SortPos })
	local UseResult2 = ReactModule.useCallback(function(p5, p6)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), TopicId (copy), GetGameTileLayoutDataModule (upval), DiscoveryVideoLoopEventFunction (upval), PageContext (copy), SortPos (copy)
		if p5 ~= nil and p3 ~= nil then
			local v2 = p3[p5]
			
			if not v2 then
				MutedErrorFunction("reportVideoLoop requires a valid entry")
			end
			local WideVideoAssetId = nil
			if v2 and v2.primaryWideVideoAssetId then
				WideVideoAssetId = v2.primaryWideVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v2, TopicId)
				WideVideoAssetId = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
			end
			if not WideVideoAssetId then
				MutedErrorFunction("reportVideoLoop requires a valid videoAssetId")
			end
			DiscoveryVideoLoopEventFunction(PageContext, {
				videoAssetId = WideVideoAssetId,
				videoPlaybackSessionId = p6 or "INVALID_SESSION_ID",
				universeId = v2.universeId,
				rootPlaceId = v2.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos
			})
		end
	end, { PageContext, p3, TopicId, SortPos })
	local UseResult3 = ReactModule.useCallback(function(p5, EndReason, p6, PlaybackTime, TargetUniverseId)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), TopicId (copy), GetGameTileLayoutDataModule (upval), DiscoveryVideoEndEventFunction (upval), PageContext (copy), SortPos (copy)
		if p5 ~= nil and p3 ~= nil then
			local v2 = p3[p5]
			
			if not v2 then
				MutedErrorFunction("reportVideoEnd requires a valid entry")
			end
			local WideVideoAssetId = nil
			if v2 and v2.primaryWideVideoAssetId then
				WideVideoAssetId = v2.primaryWideVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v2, TopicId)
				WideVideoAssetId = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
			end
			if not WideVideoAssetId then
				MutedErrorFunction("reportVideoEnd requires a valid videoAssetId")
			end
			DiscoveryVideoEndEventFunction(PageContext, {
				videoAssetId = WideVideoAssetId,
				videoPlaybackSessionId = p6 or "INVALID_SESSION_ID",
				endReason = EndReason,
				playbackTime = PlaybackTime,
				universeId = v2.universeId,
				rootPlaceId = v2.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos,
				targetUniverseId = TargetUniverseId
			})
		end
	end, { PageContext, p3, TopicId, SortPos })
	
	return if FFlagLuaAppHomeReduceRenders then ReactModule.useMemo(function()
		-- upvalues: UseResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy)
		return {
			reportVideoPlay = UseResult,
			reportVideoLoad = UseResult1,
			reportVideoLoop = UseResult2,
			reportVideoEnd = UseResult3
		}
	end, { UseResult, UseResult1, UseResult2, UseResult3 }) else {
		reportVideoPlay = UseResult,
		reportVideoLoad = UseResult1,
		reportVideoLoop = UseResult2,
		reportVideoEnd = UseResult3
	}
end