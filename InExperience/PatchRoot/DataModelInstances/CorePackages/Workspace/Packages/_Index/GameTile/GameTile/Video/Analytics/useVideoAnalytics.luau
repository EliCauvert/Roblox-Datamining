local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local VideoActions = require(Parent.VideoUtils).AnalyticsEnums.VideoActions
local VideoLogger = require(Parent.VideoUtils).VideoLogger
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local _ = require(GameTile.GameTileTypes)
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)
local GetLayoutDataVideoModule = require(GameTile.getLayoutDataVideo)
local DiscoveryAnalyticsModule = require(GameTile.Parent.DiscoveryAnalytics)
local DiscoveryVideoEndEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoEndEvent
local DiscoveryVideoLoadEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoLoadEvent
local DiscoveryVideoLoopEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoLoopEvent
local DiscoveryVideoPlayEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoPlayEvent
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppBroadenVideoAnalytics = require(Parent.SharedFlags).FFlagLuaAppBroadenVideoAnalytics
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local FFlagLuaAppDiscoveryMomentVideoTelemetry = require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType

local function _(p1, p2)
	return if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
end

local _ = function(p1, p2)
	-- upvalues: FFlagLuaAppEnableHomepageOneByTwoTile (copy), GetGameTileLayoutDataModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy), GetLayoutDataVideoModule (copy)
	if p1 and p1.primaryWideVideoAssetId then
		return p1.primaryWideVideoAssetId
	elseif FFlagLuaAppEnableHomepageOneByTwoTile and p1 and p1.primaryVideoAssetId then
		return p1.primaryVideoAssetId
	else
		local GameTileLayoutDataModule = GetGameTileLayoutDataModule(p1, p2)
		
		if FFlagLuaAppHomeMomentVideoFallback then
			local LayoutDataVideoModule = GetLayoutDataVideoModule(GameTileLayoutDataModule)
			
			return LayoutDataVideoModule and LayoutDataVideoModule.assetId
		else
			return GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
		end
	end
end

local _ = function(p1, p2)
	-- upvalues: FFlagLuaAppEnableHomepageOneByTwoTile (copy), GetGameTileLayoutDataModule (copy), GetLayoutDataVideoModule (copy)
	if FFlagLuaAppEnableHomepageOneByTwoTile and p1 and p1.primaryVideoAssetId then
		return p1.primaryVideoAssetId, false
	else
		local LayoutDataVideoModule = GetLayoutDataVideoModule(GetGameTileLayoutDataModule(p1, p2), p1 and p1.primaryWideVideoAssetId)
		
		return LayoutDataVideoModule and LayoutDataVideoModule.assetId, LayoutDataVideoModule ~= nil and LayoutDataVideoModule.isMoment == true
	end
end

return function(p1, p2, PageContext, SortPos, p3)
	-- upvalues: ReactModule (copy), MutedErrorFunction (copy), FFlagLuaAppDiscoveryMomentVideoTelemetry (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), GetGameTileLayoutDataModule (copy), GetLayoutDataVideoModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy), DiscoveryVideoPlayEventFunction (copy), FFlagLuaAppBroadenVideoAnalytics (copy), OmniRecommendationsContentType (copy), DiscoveryEventErrorLogger (copy), DiscoveryVideoLoadEventFunction (copy), VideoLogger (copy), VideoActions (copy), DiscoveryVideoLoopEventFunction (copy), DiscoveryVideoEndEventFunction (copy)
	local TopicId = if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
	local UseResult = ReactModule.useCallback(function(p4, p5)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval), TopicId (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), GetGameTileLayoutDataModule (upval), GetLayoutDataVideoModule (upval), FFlagLuaAppHomeMomentVideoFallback (upval), DiscoveryVideoPlayEventFunction (upval), PageContext (copy), SortPos (copy), FFlagLuaAppBroadenVideoAnalytics (upval)
		if p4 ~= nil and p3 ~= nil then
			local v1 = p3[p4]
			
			if not v1 then
				MutedErrorFunction("reportVideoPlay requires a valid entry")
			end
			local v2: boolean? = nil
			local AssetId1 = nil
			
			if FFlagLuaAppDiscoveryMomentVideoTelemetry then
				local AssetId = nil
				local IsIsMoment = nil
				if FFlagLuaAppEnableHomepageOneByTwoTile and v1 and v1.primaryVideoAssetId then
					AssetId = v1.primaryVideoAssetId
					IsIsMoment = false
				else
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GetGameTileLayoutDataModule(v1, TopicId), v1 and v1.primaryWideVideoAssetId)
					AssetId = LayoutDataVideoModule and LayoutDataVideoModule.assetId
					IsIsMoment = LayoutDataVideoModule ~= nil and LayoutDataVideoModule.isMoment == true
				end
				AssetId1 = AssetId
				v2 = IsIsMoment
			elseif v1 and v1.primaryWideVideoAssetId then
				AssetId1 = v1.primaryWideVideoAssetId
			elseif FFlagLuaAppEnableHomepageOneByTwoTile and v1 and v1.primaryVideoAssetId then
				AssetId1 = v1.primaryVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v1, TopicId)
				
				if FFlagLuaAppHomeMomentVideoFallback then
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GameTileLayoutDataModule)
					AssetId1 = LayoutDataVideoModule and LayoutDataVideoModule.assetId
				else
					AssetId1 = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
				end
			end
			if not AssetId1 then
				MutedErrorFunction("reportVideoPlay requires a valid videoAssetId")
			end
			DiscoveryVideoPlayEventFunction(PageContext, {
				videoAssetId = AssetId1,
				videoPlaybackSessionId = p5 or "INVALID_SESSION_ID",
				universeId = v1.universeId,
				rootPlaceId = v1.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos,
				nativeAdData = if FFlagLuaAppBroadenVideoAnalytics then v1.adId else nil,
				tileType = if FFlagLuaAppBroadenVideoAnalytics then v1.componentType else nil,
				contentType = if FFlagLuaAppBroadenVideoAnalytics then v1.contentType else nil,
				isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then v2 else nil
			})
		end
	end, { PageContext, p3, TopicId, SortPos })
	local UseResult1 = ReactModule.useCallback(function(Index, p4, TotalDuration, LoadTime)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval), TopicId (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), GetGameTileLayoutDataModule (upval), GetLayoutDataVideoModule (upval), FFlagLuaAppHomeMomentVideoFallback (upval), OmniRecommendationsContentType (upval), DiscoveryEventErrorLogger (upval), PageContext (copy), DiscoveryVideoLoadEventFunction (upval), SortPos (copy), FFlagLuaAppBroadenVideoAnalytics (upval), VideoLogger (upval), VideoActions (upval)
		if Index ~= nil and p3 ~= nil then
			local v1 = p3[Index]
			
			if not v1 then
				MutedErrorFunction("reportVideoLoad requires a valid entry")
			end
			local v2: boolean? = nil
			local VideoAssetId = nil
			
			if FFlagLuaAppDiscoveryMomentVideoTelemetry then
				local AssetId = nil
				local IsIsMoment = nil
				if FFlagLuaAppEnableHomepageOneByTwoTile and v1 and v1.primaryVideoAssetId then
					AssetId = v1.primaryVideoAssetId
					IsIsMoment = false
				else
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GetGameTileLayoutDataModule(v1, TopicId), v1 and v1.primaryWideVideoAssetId)
					AssetId = LayoutDataVideoModule and LayoutDataVideoModule.assetId
					IsIsMoment = LayoutDataVideoModule ~= nil and LayoutDataVideoModule.isMoment == true
				end
				VideoAssetId = AssetId
				v2 = IsIsMoment
			elseif v1 and v1.primaryWideVideoAssetId then
				VideoAssetId = v1.primaryWideVideoAssetId
			elseif FFlagLuaAppEnableHomepageOneByTwoTile and v1 and v1.primaryVideoAssetId then
				VideoAssetId = v1.primaryVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v1, TopicId)
				
				if FFlagLuaAppHomeMomentVideoFallback then
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GameTileLayoutDataModule)
					VideoAssetId = LayoutDataVideoModule and LayoutDataVideoModule.assetId
				else
					VideoAssetId = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
				end
			end
			if not VideoAssetId then
				MutedErrorFunction("reportVideoLoad requires a valid videoAssetId")
			end
			local IsContentTypeMatch = if FFlagLuaAppEnableHomepageOneByTwoTile then v1.contentType == OmniRecommendationsContentType.AdLink else nil
			
			if not v1.universeId and not IsContentTypeMatch then
				DiscoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingUniverseId", `reportVideoLoad: entry at index {Index} is missing universeId for unified "load" on page "{PageContext}"`, {
					index = Index,
					pageContext = PageContext,
					gameSortId = TopicId,
					placeId = v1.placeId,
					videoAssetId = VideoAssetId
				})
			end
			DiscoveryVideoLoadEventFunction(PageContext, {
				videoAssetId = VideoAssetId,
				videoPlaybackSessionId = p4 or "INVALID_SESSION_ID",
				totalDuration = TotalDuration,
				loadTime = LoadTime,
				universeId = v1.universeId,
				rootPlaceId = v1.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos,
				nativeAdData = if FFlagLuaAppBroadenVideoAnalytics then v1.adId else nil,
				tileType = if FFlagLuaAppBroadenVideoAnalytics then v1.componentType else nil,
				contentType = if FFlagLuaAppBroadenVideoAnalytics then v1.contentType else nil,
				isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then v2 else nil
			})
			
			if FFlagLuaAppEnableHomepageOneByTwoTile then
				if VideoAssetId and (IsContentTypeMatch or v1.universeId) then
					VideoLogger.reportVideoAction(VideoActions.load, PageContext, {
						videoAssetId = VideoAssetId,
						source = if IsContentTypeMatch then "adLink" else "universe",
						sourceId = if IsContentTypeMatch then tostring(v1.clickoutUrl) else tostring(v1.universeId),
						playbackSessionId = p4 or "INVALID_SESSION_ID"
					}, { loadTime = LoadTime })
					
					return
				end
			elseif v1.universeId and VideoAssetId then
				VideoLogger.reportVideoAction(VideoActions.load, PageContext, {
					source = "universe",
					videoAssetId = VideoAssetId,
					sourceId = tostring(v1.universeId),
					playbackSessionId = p4 or "INVALID_SESSION_ID"
				}, { loadTime = LoadTime })
			end
		end
	end, { PageContext, p3, TopicId, SortPos })
	local UseResult2 = ReactModule.useCallback(function(p5, p6)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval), TopicId (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), GetGameTileLayoutDataModule (upval), GetLayoutDataVideoModule (upval), FFlagLuaAppHomeMomentVideoFallback (upval), DiscoveryVideoLoopEventFunction (upval), PageContext (copy), SortPos (copy), FFlagLuaAppBroadenVideoAnalytics (upval)
		if p5 ~= nil and p3 ~= nil then
			local v3 = p3[p5]
			
			if not v3 then
				MutedErrorFunction("reportVideoLoop requires a valid entry")
			end
			local v4: boolean? = nil
			local AssetId1 = nil
			
			if FFlagLuaAppDiscoveryMomentVideoTelemetry then
				local AssetId = nil
				local IsIsMoment = nil
				if FFlagLuaAppEnableHomepageOneByTwoTile and v3 and v3.primaryVideoAssetId then
					AssetId = v3.primaryVideoAssetId
					IsIsMoment = false
				else
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GetGameTileLayoutDataModule(v3, TopicId), v3 and v3.primaryWideVideoAssetId)
					AssetId = LayoutDataVideoModule and LayoutDataVideoModule.assetId
					IsIsMoment = LayoutDataVideoModule ~= nil and LayoutDataVideoModule.isMoment == true
				end
				AssetId1 = AssetId
				v4 = IsIsMoment
			elseif v3 and v3.primaryWideVideoAssetId then
				AssetId1 = v3.primaryWideVideoAssetId
			elseif FFlagLuaAppEnableHomepageOneByTwoTile and v3 and v3.primaryVideoAssetId then
				AssetId1 = v3.primaryVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v3, TopicId)
				
				if FFlagLuaAppHomeMomentVideoFallback then
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GameTileLayoutDataModule)
					AssetId1 = LayoutDataVideoModule and LayoutDataVideoModule.assetId
				else
					AssetId1 = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
				end
			end
			if not AssetId1 then
				MutedErrorFunction("reportVideoLoop requires a valid videoAssetId")
			end
			DiscoveryVideoLoopEventFunction(PageContext, {
				videoAssetId = AssetId1,
				videoPlaybackSessionId = p6 or "INVALID_SESSION_ID",
				universeId = v3.universeId,
				rootPlaceId = v3.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos,
				nativeAdData = if FFlagLuaAppBroadenVideoAnalytics then v3.adId else nil,
				tileType = if FFlagLuaAppBroadenVideoAnalytics then v3.componentType else nil,
				contentType = if FFlagLuaAppBroadenVideoAnalytics then v3.contentType else nil,
				isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then v4 else nil
			})
		end
	end, { PageContext, p3, TopicId, SortPos })
	local UseResult3 = ReactModule.useCallback(function(p5, EndReason, p6, PlaybackTime, TargetUniverseId)
		-- upvalues: p3 (copy), MutedErrorFunction (upval), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval), TopicId (copy), FFlagLuaAppEnableHomepageOneByTwoTile (upval), GetGameTileLayoutDataModule (upval), GetLayoutDataVideoModule (upval), FFlagLuaAppHomeMomentVideoFallback (upval), DiscoveryVideoEndEventFunction (upval), PageContext (copy), SortPos (copy), FFlagLuaAppBroadenVideoAnalytics (upval)
		if p5 ~= nil and p3 ~= nil then
			local v3 = p3[p5]
			
			if not v3 then
				MutedErrorFunction("reportVideoEnd requires a valid entry")
			end
			local v4: boolean? = nil
			local AssetId1 = nil
			
			if FFlagLuaAppDiscoveryMomentVideoTelemetry then
				local AssetId = nil
				local IsIsMoment = nil
				if FFlagLuaAppEnableHomepageOneByTwoTile and v3 and v3.primaryVideoAssetId then
					AssetId = v3.primaryVideoAssetId
					IsIsMoment = false
				else
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GetGameTileLayoutDataModule(v3, TopicId), v3 and v3.primaryWideVideoAssetId)
					AssetId = LayoutDataVideoModule and LayoutDataVideoModule.assetId
					IsIsMoment = LayoutDataVideoModule ~= nil and LayoutDataVideoModule.isMoment == true
				end
				AssetId1 = AssetId
				v4 = IsIsMoment
			elseif v3 and v3.primaryWideVideoAssetId then
				AssetId1 = v3.primaryWideVideoAssetId
			elseif FFlagLuaAppEnableHomepageOneByTwoTile and v3 and v3.primaryVideoAssetId then
				AssetId1 = v3.primaryVideoAssetId
			else
				local GameTileLayoutDataModule = GetGameTileLayoutDataModule(v3, TopicId)
				
				if FFlagLuaAppHomeMomentVideoFallback then
					local LayoutDataVideoModule = GetLayoutDataVideoModule(GameTileLayoutDataModule)
					AssetId1 = LayoutDataVideoModule and LayoutDataVideoModule.assetId
				else
					AssetId1 = GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
				end
			end
			if not AssetId1 then
				MutedErrorFunction("reportVideoEnd requires a valid videoAssetId")
			end
			DiscoveryVideoEndEventFunction(PageContext, {
				videoAssetId = AssetId1,
				videoPlaybackSessionId = p6 or "INVALID_SESSION_ID",
				endReason = EndReason,
				playbackTime = PlaybackTime,
				universeId = v3.universeId,
				rootPlaceId = v3.placeId,
				gameSetTypeId = TopicId,
				sortPos = SortPos,
				targetUniverseId = TargetUniverseId,
				nativeAdData = if FFlagLuaAppBroadenVideoAnalytics then v3.adId else nil,
				tileType = if FFlagLuaAppBroadenVideoAnalytics then v3.componentType else nil,
				contentType = if FFlagLuaAppBroadenVideoAnalytics then v3.contentType else nil,
				isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then v4 else nil
			})
		end
	end, { PageContext, p3, TopicId, SortPos })
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy)
		return {
			reportVideoPlay = UseResult,
			reportVideoLoad = UseResult1,
			reportVideoLoop = UseResult2,
			reportVideoEnd = UseResult3
		}
	end, { UseResult, UseResult1, UseResult2, UseResult3 }))
end