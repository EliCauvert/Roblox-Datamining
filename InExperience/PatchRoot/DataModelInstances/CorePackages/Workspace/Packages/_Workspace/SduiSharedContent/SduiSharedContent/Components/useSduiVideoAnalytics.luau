local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local DiscoveryVideoEndEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoEndEvent
local DiscoveryVideoLoadEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoLoadEvent
local DiscoveryVideoLoopEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoLoopEvent
local DiscoveryVideoPlayEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoPlayEvent
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local ParseBooleanStringFunction = DiscoveryUtilsModule.parseBooleanString
local FindAnalyticsFieldInAncestorsFunction = require(Parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoActions = VideoUtilsModule.AnalyticsEnums.VideoActions
local VideoLogger = VideoUtilsModule.VideoLogger
local FFlagLuaAppDiscoveryMomentVideoTelemetry = require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

local _ = function(p1)
	-- upvalues: ParseBooleanStringFunction (copy)
	return if type(p1) == "boolean" then p1 elseif type(p1) == "string" then ParseBooleanStringFunction(p1) else nil
end

local _ = function(ActionType, PageContext, UniverseId, PlaceId)
	-- upvalues: DiscoveryEventErrorLogger (copy)
	DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "{ActionType}" is missing videoAssetId on page "{PageContext}"`, {
		actionType = ActionType,
		pageContext = PageContext,
		universeId = UniverseId,
		placeId = PlaceId
	})
end

return function(p1, PageContext, p2)
	-- upvalues: ReactModule (copy), FindAnalyticsFieldInAncestorsFunction (copy), FFlagLuaAppDiscoveryMomentVideoTelemetry (copy), ParseBooleanStringFunction (copy), DiscoveryEventErrorLogger (copy), DiscoveryVideoPlayEventFunction (copy), DiscoveryVideoLoadEventFunction (copy), VideoLogger (copy), VideoActions (copy), DiscoveryVideoLoopEventFunction (copy), DiscoveryVideoEndEventFunction (copy)
	local UseResult = ReactModule.useCallback(function(p3)
		-- upvalues: p1 (copy), FindAnalyticsFieldInAncestorsFunction (upval), p2 (copy), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval), ParseBooleanStringFunction (upval)
		local CollectionData = if p1.getCollectionData then p1.getCollectionData() else nil
		local VideoAssetId = FindAnalyticsFieldInAncestorsFunction("videoAssetId", p1)
		local Text = if VideoAssetId == nil then nil else tostring(VideoAssetId)
		local NativeAdData = FindAnalyticsFieldInAncestorsFunction("nativeAdData", p1) or FindAnalyticsFieldInAncestorsFunction("adId", p1)
		local config = {
			videoAssetId = Text,
			videoPlaybackSessionId = p3 or "INVALID_SESSION_ID",
			universeId = p2.universeId,
			rootPlaceId = p2.placeId
		}
		local Text1 = nil
		
		if CollectionData then
			local CollectionId = CollectionData.collectionId
			Text1 = if CollectionId == nil then nil else tostring(CollectionId)
		else
			Text1 = nil
		end
		config.gameSetTypeId = Text1
		config.sortPos = if CollectionData then CollectionData.collectionPosition else nil
		config.nativeAdData = if NativeAdData == nil then nil else tostring(NativeAdData)
		local TileType = FindAnalyticsFieldInAncestorsFunction("tileType", p1)
		config.tileType = if TileType == nil then nil else tostring(TileType)
		local ContentType = FindAnalyticsFieldInAncestorsFunction("contentType", p1)
		config.contentType = if ContentType == nil then nil else tostring(ContentType)
		local IsMoment1 = nil
		
		if FFlagLuaAppDiscoveryMomentVideoTelemetry then
			local IsMoment = FindAnalyticsFieldInAncestorsFunction("isMoment", p1)
			IsMoment1 = if type(IsMoment) == "boolean" then IsMoment elseif type(IsMoment) == "string" then ParseBooleanStringFunction(IsMoment) else nil
		else
			IsMoment1 = nil
		end
		config.isMoment = IsMoment1
		
		return config
	end, { p1, p2.universeId, p2.placeId })
	local UseResult1 = ReactModule.useCallback(function(_, p3)
		-- upvalues: UseResult (copy), PageContext (copy), p2 (copy), DiscoveryEventErrorLogger (upval), DiscoveryVideoPlayEventFunction (upval)
		local UseResultResult = UseResult(p3)
		
		if not UseResultResult.videoAssetId then
			DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "play" is missing videoAssetId on page "{PageContext}"`, {
				actionType = "play",
				pageContext = PageContext,
				universeId = p2.universeId,
				placeId = p2.placeId
			})
		end
		DiscoveryVideoPlayEventFunction(PageContext, UseResultResult)
	end, { UseResult, PageContext, p2.universeId, p2.placeId })
	local UseResult2 = ReactModule.useCallback(function(_, p3, TotalDuration, LoadTime)
		-- upvalues: UseResult (copy), PageContext (copy), p2 (copy), DiscoveryEventErrorLogger (upval), DiscoveryVideoLoadEventFunction (upval), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval), VideoLogger (upval), VideoActions (upval)
		local UseResultResult = UseResult(p3)
		
		if not UseResultResult.videoAssetId then
			DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "load" is missing videoAssetId on page "{PageContext}"`, {
				actionType = "load",
				pageContext = PageContext,
				universeId = p2.universeId,
				placeId = p2.placeId
			})
		end
		DiscoveryVideoLoadEventFunction(PageContext, {
			videoAssetId = UseResultResult.videoAssetId,
			videoPlaybackSessionId = UseResultResult.videoPlaybackSessionId,
			totalDuration = TotalDuration,
			loadTime = LoadTime,
			universeId = UseResultResult.universeId,
			rootPlaceId = UseResultResult.rootPlaceId,
			gameSetTypeId = UseResultResult.gameSetTypeId,
			sortPos = UseResultResult.sortPos,
			nativeAdData = UseResultResult.nativeAdData,
			tileType = UseResultResult.tileType,
			contentType = UseResultResult.contentType,
			isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then UseResultResult.isMoment else nil
		})
		
		if UseResultResult.videoAssetId and p2.sourceId then
			VideoLogger.reportVideoAction(VideoActions.load, PageContext, {
				videoAssetId = UseResultResult.videoAssetId,
				source = p2.source,
				sourceId = p2.sourceId,
				playbackSessionId = UseResultResult.videoPlaybackSessionId
			}, { loadTime = LoadTime })
		end
	end, {
		UseResult, PageContext, p2.source, p2.sourceId, p2.universeId, p2.placeId
	})
	local UseResult3 = ReactModule.useCallback(function(_, p3)
		-- upvalues: UseResult (copy), PageContext (copy), p2 (copy), DiscoveryEventErrorLogger (upval), DiscoveryVideoLoopEventFunction (upval)
		local UseResultResult = UseResult(p3)
		
		if not UseResultResult.videoAssetId then
			DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "loop" is missing videoAssetId on page "{PageContext}"`, {
				actionType = "loop",
				pageContext = PageContext,
				universeId = p2.universeId,
				placeId = p2.placeId
			})
		end
		DiscoveryVideoLoopEventFunction(PageContext, UseResultResult)
	end, { UseResult, PageContext, p2.universeId, p2.placeId })
	local UseResult4 = ReactModule.useCallback(function(_, EndReason, p3, PlaybackTime, TargetUniverseId)
		-- upvalues: UseResult (copy), PageContext (copy), p2 (copy), DiscoveryEventErrorLogger (upval), DiscoveryVideoEndEventFunction (upval), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval)
		local UseResultResult = UseResult(p3)
		
		if not UseResultResult.videoAssetId then
			DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "end" is missing videoAssetId on page "{PageContext}"`, {
				actionType = "end",
				pageContext = PageContext,
				universeId = p2.universeId,
				placeId = p2.placeId
			})
		end
		DiscoveryVideoEndEventFunction(PageContext, {
			videoAssetId = UseResultResult.videoAssetId,
			videoPlaybackSessionId = UseResultResult.videoPlaybackSessionId,
			endReason = EndReason,
			playbackTime = PlaybackTime,
			universeId = UseResultResult.universeId,
			rootPlaceId = UseResultResult.rootPlaceId,
			gameSetTypeId = UseResultResult.gameSetTypeId,
			sortPos = UseResultResult.sortPos,
			targetUniverseId = TargetUniverseId,
			nativeAdData = UseResultResult.nativeAdData,
			tileType = UseResultResult.tileType,
			contentType = UseResultResult.contentType,
			isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then UseResultResult.isMoment else nil
		})
	end, { UseResult, PageContext, p2.universeId, p2.placeId })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult1 (copy), UseResult2 (copy), UseResult3 (copy), UseResult4 (copy)
		return {
			reportVideoMute = nil,
			reportVideoPlay = UseResult1,
			reportVideoLoad = UseResult2,
			reportVideoLoop = UseResult3,
			reportVideoEnd = UseResult4
		}
	end, { UseResult1, UseResult2, UseResult3, UseResult4 })
end