local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local reactModule = require(parent.React)
local mutedError = require(parent.Loggers).mutedError
local videoActions = require(parent.VideoUtils).AnalyticsEnums.VideoActions
local videoLogger = require(parent.VideoUtils).VideoLogger
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local _ = require(gameTile.GameTileTypes)
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local discoveryAnalyticsModule = require(gameTile.Parent.DiscoveryAnalytics)
local discoveryVideoEndEvent = discoveryAnalyticsModule.Events.discoveryVideoEndEvent
local discoveryVideoLoadEvent = discoveryAnalyticsModule.Events.discoveryVideoLoadEvent
local discoveryVideoLoopEvent = discoveryAnalyticsModule.Events.discoveryVideoLoopEvent
local discoveryVideoPlayEvent = discoveryAnalyticsModule.Events.discoveryVideoPlayEvent
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppBroadenVideoAnalytics = require(parent.SharedFlags).FFlagLuaAppBroadenVideoAnalytics
local omniRecommendationsContentType = discoveryTypesModule.OmniRecommendationsContentType

local function _(p1, p2)
	return if p1 == nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
end

local _ = function(value, p1)
	-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (ref), getGameTileLayoutDataModule (ref)
	if value and value.primaryWideVideoAssetId then
		return value.primaryWideVideoAssetId
	elseif fFlagLuaAppEnableHomepageOneByTwoTile and value and value.primaryVideoAssetId then
		return value.primaryVideoAssetId
	end
	local var1 = getGameTileLayoutDataModule(value, p1)
	
	return var1 and (var1.primaryMediaAsset and var1.primaryMediaAsset.wideVideoAssetId)
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), mutedError (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), getGameTileLayoutDataModule (ref), discoveryVideoPlayEvent (ref), fFlagLuaAppBroadenVideoAnalytics (ref), omniRecommendationsContentType (ref), discoveryEventErrorLogger (ref), discoveryVideoLoadEvent (ref), videoLogger (ref), videoActions (ref), discoveryVideoLoopEvent (ref), discoveryVideoEndEvent (ref), fFlagLuaAppHomeReduceRenders (ref)
	local var1 = if p1 ~= nil then nil elseif p2 then p1.topicId else p1.gameSetTypeId
	local var2 = reactModule.useCallback(function(p6, p7)
		-- upvalues: p5 (ref), mutedError (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), discoveryVideoPlayEvent (copy), p3 (ref), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
		if p6 ~= nil and p5 ~= nil then
			local var3 = p5[p6]
			
			if not var3 then
				mutedError("reportVideoPlay requires a valid entry")
			end
			local wideVideoAssetId
			local var4 = var1
			
			if var3 and var3.primaryWideVideoAssetId then
				wideVideoAssetId = var3.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var3 and var3.primaryVideoAssetId then
				wideVideoAssetId = var3.primaryVideoAssetId
			else
				local var5 = getGameTileLayoutDataModule(var3, var4)
				wideVideoAssetId = var5 and (var5.primaryMediaAsset and var5.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoPlay requires a valid videoAssetId")
			end
			discoveryVideoPlayEvent(p3, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p7 or "INVALID_SESSION_ID",
				universeId = var3.universeId,
				rootPlaceId = var3.placeId,
				gameSetTypeId = var1,
				sortPos = p4,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var3.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var3.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var3.contentType else nil
			})
		end
	end, { p3, p5, var1, p4 })
	local var3 = reactModule.useCallback(function(p6, p7, p8, p9)
		-- upvalues: p5 (ref), mutedError (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), omniRecommendationsContentType (copy), discoveryEventErrorLogger (copy), p3 (ref), discoveryVideoLoadEvent (copy), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy), videoLogger (copy), videoActions (copy)
		if p6 ~= nil and p5 ~= nil then
			local var4 = p5[p6]
			
			if not var4 then
				mutedError("reportVideoLoad requires a valid entry")
			end
			local wideVideoAssetId
			local var5 = var1
			
			if var4 and var4.primaryWideVideoAssetId then
				wideVideoAssetId = var4.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var4 and var4.primaryVideoAssetId then
				wideVideoAssetId = var4.primaryVideoAssetId
			else
				local var6 = getGameTileLayoutDataModule(var4, var5)
				wideVideoAssetId = var6 and (var6.primaryMediaAsset and var6.primaryMediaAsset.wideVideoAssetId)
			end
			local var7
			if not wideVideoAssetId then
				mutedError("reportVideoLoad requires a valid videoAssetId")
			end
			if fFlagLuaAppEnableHomepageOneByTwoTile then
				var7 = var4.contentType == omniRecommendationsContentType.AdLink
				var7 = nil
			else
				var7 = nil
			end
			if not var4.universeId and not var7 then
				discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingUniverseId", `reportVideoLoad: entry at index {p6} is missing universeId for unified "load" on page "{p5}"`, {
					index = p6,
					pageContext = p3,
					gameSortId = var1,
					placeId = var4.placeId,
					videoAssetId = wideVideoAssetId
				})
			end
			discoveryVideoLoadEvent(p3, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p7 or "INVALID_SESSION_ID",
				totalDuration = p8,
				loadTime = p9,
				universeId = var4.universeId,
				rootPlaceId = var4.placeId,
				gameSetTypeId = var1,
				sortPos = p4,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var4.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var4.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var4.contentType else nil
			})
			
			if fFlagLuaAppEnableHomepageOneByTwoTile then
				if wideVideoAssetId and (var7 or var4.universeId) then
					videoLogger.reportVideoAction(videoActions.load, p3, {
						videoAssetId = wideVideoAssetId,
						source = if var7 then "adLink" else "universe",
						sourceId = if var7 then tostring(var4.clickoutUrl) else tostring(var4.universeId),
						playbackSessionId = p7 or "INVALID_SESSION_ID"
					}, { loadTime = p9 })
					
					return
				end
			elseif var4.universeId and wideVideoAssetId then
				videoLogger.reportVideoAction(videoActions.load, p3, {
					source = "universe",
					videoAssetId = wideVideoAssetId,
					sourceId = tostring(var4.universeId),
					playbackSessionId = p7 or "INVALID_SESSION_ID"
				}, { loadTime = p9 })
			end
		end
	end, { p3, p5, var1, p4 })
	local var8 = reactModule.useCallback(function(p10, p11)
		-- upvalues: p5 (ref), mutedError (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), discoveryVideoLoopEvent (copy), p3 (ref), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
		if p10 ~= nil and p5 ~= nil then
			local var9 = p5[p10]
			
			if not var9 then
				mutedError("reportVideoLoop requires a valid entry")
			end
			local wideVideoAssetId
			local var10 = var1
			
			if var9 and var9.primaryWideVideoAssetId then
				wideVideoAssetId = var9.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var9 and var9.primaryVideoAssetId then
				wideVideoAssetId = var9.primaryVideoAssetId
			else
				local var11 = getGameTileLayoutDataModule(var9, var10)
				wideVideoAssetId = var11 and (var11.primaryMediaAsset and var11.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoLoop requires a valid videoAssetId")
			end
			discoveryVideoLoopEvent(p3, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p11 or "INVALID_SESSION_ID",
				universeId = var9.universeId,
				rootPlaceId = var9.placeId,
				gameSetTypeId = var1,
				sortPos = p4,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var9.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var9.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var9.contentType else nil
			})
		end
	end, { p3, p5, var1, p4 })
	local var9 = reactModule.useCallback(function(p10, p11, p12, p13, p14)
		-- upvalues: p5 (ref), mutedError (copy), var1 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), discoveryVideoEndEvent (copy), p3 (ref), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
		if p10 ~= nil and p5 ~= nil then
			local var10 = p5[p10]
			
			if not var10 then
				mutedError("reportVideoEnd requires a valid entry")
			end
			local wideVideoAssetId
			local var11 = var1
			
			if var10 and var10.primaryWideVideoAssetId then
				wideVideoAssetId = var10.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var10 and var10.primaryVideoAssetId then
				wideVideoAssetId = var10.primaryVideoAssetId
			else
				local var12 = getGameTileLayoutDataModule(var10, var11)
				wideVideoAssetId = var12 and (var12.primaryMediaAsset and var12.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoEnd requires a valid videoAssetId")
			end
			discoveryVideoEndEvent(p3, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p12 or "INVALID_SESSION_ID",
				endReason = p11,
				playbackTime = p13,
				universeId = var10.universeId,
				rootPlaceId = var10.placeId,
				gameSetTypeId = var1,
				sortPos = p4,
				targetUniverseId = p14,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var10.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var10.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var10.contentType else nil
			})
		end
	end, { p3, p5, var1, p4 })
	
	return if fFlagLuaAppHomeReduceRenders then reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref), var8 (ref), var9 (ref)
		return {
			reportVideoPlay = var2,
			reportVideoLoad = var3,
			reportVideoLoop = var8,
			reportVideoEnd = var9
		}
	end, { var2, var3, var8, var9 }) else {
		reportVideoPlay = var2,
		reportVideoLoad = var3,
		reportVideoLoop = var8,
		reportVideoEnd = var9
	}
end