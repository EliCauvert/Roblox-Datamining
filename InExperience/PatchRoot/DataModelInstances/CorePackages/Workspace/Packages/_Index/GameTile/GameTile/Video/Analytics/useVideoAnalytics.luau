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

local function _(p0, p1) --[[ line: 33 | named "getGameSortId" ]]
	return if p0 == nil then nil elseif p1 then p0.topicId else p0.gameSetTypeId
end

local _ = function(value, p2) --[[ line: 45 | named "getVideoAssetId" ]]
	-- upvalues: fFlagLuaAppEnableHomepageOneByTwoTile (ref), getGameTileLayoutDataModule (ref)
	if value and value.primaryWideVideoAssetId then
		return value.primaryWideVideoAssetId
	elseif fFlagLuaAppEnableHomepageOneByTwoTile and value and value.primaryVideoAssetId then
		return value.primaryVideoAssetId
	end
	local var5 = getGameTileLayoutDataModule(value, p2)
	
	return var5 and (var5.primaryMediaAsset and var5.primaryMediaAsset.wideVideoAssetId)
end

return function(p3, p4, p5, p6, p7) --[[ line: 62 | named "useVideoAnalytics" ]]
	-- upvalues: reactModule (ref), mutedError (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), getGameTileLayoutDataModule (ref), discoveryVideoPlayEvent (ref), fFlagLuaAppBroadenVideoAnalytics (ref), omniRecommendationsContentType (ref), discoveryEventErrorLogger (ref), discoveryVideoLoadEvent (ref), videoLogger (ref), videoActions (ref), discoveryVideoLoopEvent (ref), discoveryVideoEndEvent (ref), fFlagLuaAppHomeReduceRenders (ref)
	local var6 = if p3 ~= nil then nil elseif p4 then p3.topicId else p3.gameSetTypeId
	local var7 = reactModule.useCallback(function(p8, p9) --[[ line: 71 ]]
		-- upvalues: p7 (ref), mutedError (copy), var6 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), discoveryVideoPlayEvent (copy), p5 (ref), p6 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
		if p8 ~= nil and p7 ~= nil then
			local var11 = p7[p8]
			
			if not var11 then
				mutedError("reportVideoPlay requires a valid entry")
			end
			local wideVideoAssetId
			local var12 = var6
			
			if var11 and var11.primaryWideVideoAssetId then
				wideVideoAssetId = var11.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var11 and var11.primaryVideoAssetId then
				wideVideoAssetId = var11.primaryVideoAssetId
			else
				local var13 = getGameTileLayoutDataModule(var11, var12)
				wideVideoAssetId = var13 and (var13.primaryMediaAsset and var13.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoPlay requires a valid videoAssetId")
			end
			discoveryVideoPlayEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p9 or "INVALID_SESSION_ID",
				universeId = var11.universeId,
				rootPlaceId = var11.placeId,
				gameSetTypeId = var6,
				sortPos = p6,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var11.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var11.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var11.contentType else nil
			})
		end
	end, { p5, p7, var6, p6 })
	local var8 = reactModule.useCallback(function(p10, p11, p12, p13) --[[ line: 98 ]]
		-- upvalues: p7 (ref), mutedError (copy), var6 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), omniRecommendationsContentType (copy), discoveryEventErrorLogger (copy), p5 (ref), discoveryVideoLoadEvent (copy), p6 (ref), fFlagLuaAppBroadenVideoAnalytics (copy), videoLogger (copy), videoActions (copy)
		if p10 ~= nil and p7 ~= nil then
			local var15 = p7[p10]
			
			if not var15 then
				mutedError("reportVideoLoad requires a valid entry")
			end
			local wideVideoAssetId
			local var16 = var6
			
			if var15 and var15.primaryWideVideoAssetId then
				wideVideoAssetId = var15.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var15 and var15.primaryVideoAssetId then
				wideVideoAssetId = var15.primaryVideoAssetId
			else
				local var17 = getGameTileLayoutDataModule(var15, var16)
				wideVideoAssetId = var17 and (var17.primaryMediaAsset and var17.primaryMediaAsset.wideVideoAssetId)
			end
			local var19
			if not wideVideoAssetId then
				mutedError("reportVideoLoad requires a valid videoAssetId")
			end
			if fFlagLuaAppEnableHomepageOneByTwoTile then
				var19 = var15.contentType == omniRecommendationsContentType.AdLink
				var19 = nil
			else
				var19 = nil
			end
			if not var15.universeId and not var19 then
				discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingUniverseId", `reportVideoLoad: entry at index {p10} is missing universeId for unified "load" on page "{p5}"`, {
					index = p10,
					pageContext = p5,
					gameSortId = var6,
					placeId = var15.placeId,
					videoAssetId = wideVideoAssetId
				})
			end
			discoveryVideoLoadEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p11 or "INVALID_SESSION_ID",
				totalDuration = p12,
				loadTime = p13,
				universeId = var15.universeId,
				rootPlaceId = var15.placeId,
				gameSetTypeId = var6,
				sortPos = p6,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var15.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var15.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var15.contentType else nil
			})
			
			if fFlagLuaAppEnableHomepageOneByTwoTile then
				if wideVideoAssetId and (var19 or var15.universeId) then
					videoLogger.reportVideoAction(videoActions.load, p5, {
						videoAssetId = wideVideoAssetId,
						source = if var19 then "adLink" else "universe",
						sourceId = if var19 then tostring(var15.clickoutUrl) else tostring(var15.universeId),
						playbackSessionId = p11 or "INVALID_SESSION_ID"
					}, { loadTime = p13 })
					
					return
				end
			elseif var15.universeId and wideVideoAssetId then
				videoLogger.reportVideoAction(videoActions.load, p5, {
					source = "universe",
					videoAssetId = wideVideoAssetId,
					sourceId = tostring(var15.universeId),
					playbackSessionId = p11 or "INVALID_SESSION_ID"
				}, { loadTime = p13 })
			end
		end
	end, { p5, p7, var6, p6 })
	local var9 = reactModule.useCallback(function(p14, p15) --[[ line: 167 ]]
		-- upvalues: p7 (ref), mutedError (copy), var6 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), discoveryVideoLoopEvent (copy), p5 (ref), p6 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
		if p14 ~= nil and p7 ~= nil then
			local var20 = p7[p14]
			
			if not var20 then
				mutedError("reportVideoLoop requires a valid entry")
			end
			local wideVideoAssetId
			local var21 = var6
			
			if var20 and var20.primaryWideVideoAssetId then
				wideVideoAssetId = var20.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var20 and var20.primaryVideoAssetId then
				wideVideoAssetId = var20.primaryVideoAssetId
			else
				local var22 = getGameTileLayoutDataModule(var20, var21)
				wideVideoAssetId = var22 and (var22.primaryMediaAsset and var22.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoLoop requires a valid videoAssetId")
			end
			discoveryVideoLoopEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p15 or "INVALID_SESSION_ID",
				universeId = var20.universeId,
				rootPlaceId = var20.placeId,
				gameSetTypeId = var6,
				sortPos = p6,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var20.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var20.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var20.contentType else nil
			})
		end
	end, { p5, p7, var6, p6 })
	local var10 = reactModule.useCallback(function(p16, p17, p18, p19, p20) --[[ line: 194 ]]
		-- upvalues: p7 (ref), mutedError (copy), var6 (ref), fFlagLuaAppEnableHomepageOneByTwoTile (copy), getGameTileLayoutDataModule (copy), discoveryVideoEndEvent (copy), p5 (ref), p6 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
		if p16 ~= nil and p7 ~= nil then
			local var24 = p7[p16]
			
			if not var24 then
				mutedError("reportVideoEnd requires a valid entry")
			end
			local wideVideoAssetId
			local var25 = var6
			
			if var24 and var24.primaryWideVideoAssetId then
				wideVideoAssetId = var24.primaryWideVideoAssetId
			elseif fFlagLuaAppEnableHomepageOneByTwoTile and var24 and var24.primaryVideoAssetId then
				wideVideoAssetId = var24.primaryVideoAssetId
			else
				local var26 = getGameTileLayoutDataModule(var24, var25)
				wideVideoAssetId = var26 and (var26.primaryMediaAsset and var26.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoEnd requires a valid videoAssetId")
			end
			discoveryVideoEndEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p18 or "INVALID_SESSION_ID",
				endReason = p17,
				playbackTime = p19,
				universeId = var24.universeId,
				rootPlaceId = var24.placeId,
				gameSetTypeId = var6,
				sortPos = p6,
				targetUniverseId = p20,
				nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then var24.adId else nil,
				tileType = if fFlagLuaAppBroadenVideoAnalytics then var24.componentType else nil,
				contentType = if fFlagLuaAppBroadenVideoAnalytics then var24.contentType else nil
			})
		end
	end, { p5, p7, var6, p6 })
	
	return if fFlagLuaAppHomeReduceRenders then reactModule.useMemo(function() --[[ line: 232 ]]
		-- upvalues: var7 (ref), var8 (ref), var9 (ref), var10 (ref)
		return {
			reportVideoPlay = var7,
			reportVideoLoad = var8,
			reportVideoLoop = var9,
			reportVideoEnd = var10
		}
	end, { var7, var8, var9, var10 }) else {
		reportVideoPlay = var7,
		reportVideoLoad = var8,
		reportVideoLoop = var9,
		reportVideoEnd = var10
	}
end