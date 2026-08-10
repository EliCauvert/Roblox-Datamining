local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local _ = require(parent.DiscoveryTypes)
local reactModule = require(parent.React)
local mutedError = require(parent.Loggers).mutedError
local videoActions = require(parent.VideoUtils).AnalyticsEnums.VideoActions
local videoLogger = require(parent.VideoUtils).VideoLogger
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local _ = require(gameTile.GameTileTypes)
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local fFlagLuaAppHomeReduceRenders = require(parent.SharedFlags).FFlagLuaAppHomeReduceRenders
local discoveryAnalyticsModule = require(gameTile.Parent.DiscoveryAnalytics)
local discoveryVideoEndEvent = discoveryAnalyticsModule.Events.discoveryVideoEndEvent
local discoveryVideoLoadEvent = discoveryAnalyticsModule.Events.discoveryVideoLoadEvent
local discoveryVideoLoopEvent = discoveryAnalyticsModule.Events.discoveryVideoLoopEvent
local discoveryVideoPlayEvent = discoveryAnalyticsModule.Events.discoveryVideoPlayEvent

local function _(p0, p1) --[[ line: 29 | named "getGameSortId" ]]
	return if p0 == nil then nil elseif p1 then p0.topicId else p0.gameSetTypeId
end

local _ = function(value, p2) --[[ line: 41 | named "getVideoAssetId" ]]
	-- upvalues: getGameTileLayoutDataModule (ref)
	if value and value.primaryWideVideoAssetId then
		return value.primaryWideVideoAssetId
	end
	local var4 = getGameTileLayoutDataModule(value, p2)
	
	return var4 and (var4.primaryMediaAsset and var4.primaryMediaAsset.wideVideoAssetId)
end

return function(p3, p4, p5, p6, p7) --[[ line: 54 | named "useVideoAnalytics" ]]
	-- upvalues: reactModule (ref), mutedError (ref), getGameTileLayoutDataModule (ref), discoveryVideoPlayEvent (ref), discoveryEventErrorLogger (ref), discoveryVideoLoadEvent (ref), videoLogger (ref), videoActions (ref), discoveryVideoLoopEvent (ref), discoveryVideoEndEvent (ref), fFlagLuaAppHomeReduceRenders (ref)
	local var5 = if p3 ~= nil then nil elseif p4 then p3.topicId else p3.gameSetTypeId
	local var6 = reactModule.useCallback(function(p8, p9) --[[ line: 63 ]]
		-- upvalues: p7 (ref), mutedError (copy), var5 (ref), getGameTileLayoutDataModule (copy), discoveryVideoPlayEvent (copy), p5 (ref), p6 (ref)
		if p8 ~= nil and p7 ~= nil then
			local var10 = p7[p8]
			
			if not var10 then
				mutedError("reportVideoPlay requires a valid entry")
			end
			local wideVideoAssetId
			local var11 = var5
			
			if var10 and var10.primaryWideVideoAssetId then
				wideVideoAssetId = var10.primaryWideVideoAssetId
			else
				local var12 = getGameTileLayoutDataModule(var10, var11)
				wideVideoAssetId = var12 and (var12.primaryMediaAsset and var12.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoPlay requires a valid videoAssetId")
			end
			discoveryVideoPlayEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p9 or "INVALID_SESSION_ID",
				universeId = var10.universeId,
				rootPlaceId = var10.placeId,
				gameSetTypeId = var5,
				sortPos = p6
			})
		end
	end, { p5, p7, var5, p6 })
	local var7 = reactModule.useCallback(function(p10, p11, p12, p13) --[[ line: 87 ]]
		-- upvalues: p7 (ref), mutedError (copy), var5 (ref), getGameTileLayoutDataModule (copy), discoveryEventErrorLogger (copy), p5 (ref), discoveryVideoLoadEvent (copy), p6 (ref), videoLogger (copy), videoActions (copy)
		if p10 ~= nil and p7 ~= nil then
			local var14 = p7[p10]
			
			if not var14 then
				mutedError("reportVideoLoad requires a valid entry")
			end
			local wideVideoAssetId
			local var15 = var5
			
			if var14 and var14.primaryWideVideoAssetId then
				wideVideoAssetId = var14.primaryWideVideoAssetId
			else
				local var16 = getGameTileLayoutDataModule(var14, var15)
				wideVideoAssetId = var16 and (var16.primaryMediaAsset and var16.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoLoad requires a valid videoAssetId")
			end
			if not var14.universeId then
				discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingUniverseId", `reportVideoLoad: entry at index {p10} is missing universeId for unified "load" on page "{p5}"`, {
					index = p10,
					pageContext = p5,
					gameSortId = var5,
					placeId = var14.placeId,
					videoAssetId = wideVideoAssetId
				})
			end
			discoveryVideoLoadEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p11 or "INVALID_SESSION_ID",
				totalDuration = p12,
				loadTime = p13,
				universeId = var14.universeId,
				rootPlaceId = var14.placeId,
				gameSetTypeId = var5,
				sortPos = p6
			})
			
			if var14.universeId and wideVideoAssetId then
				videoLogger.reportVideoAction(videoActions.load, p5, {
					source = "universe",
					videoAssetId = wideVideoAssetId,
					sourceId = tostring(var14.universeId),
					playbackSessionId = p11 or "INVALID_SESSION_ID"
				}, { loadTime = p13 })
			end
		end
	end, { p5, p7, var5, p6 })
	local var8 = reactModule.useCallback(function(p14, p15) --[[ line: 137 ]]
		-- upvalues: p7 (ref), mutedError (copy), var5 (ref), getGameTileLayoutDataModule (copy), discoveryVideoLoopEvent (copy), p5 (ref), p6 (ref)
		if p14 ~= nil and p7 ~= nil then
			local var18 = p7[p14]
			
			if not var18 then
				mutedError("reportVideoLoop requires a valid entry")
			end
			local wideVideoAssetId
			local var19 = var5
			
			if var18 and var18.primaryWideVideoAssetId then
				wideVideoAssetId = var18.primaryWideVideoAssetId
			else
				local var20 = getGameTileLayoutDataModule(var18, var19)
				wideVideoAssetId = var20 and (var20.primaryMediaAsset and var20.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoLoop requires a valid videoAssetId")
			end
			discoveryVideoLoopEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p15 or "INVALID_SESSION_ID",
				universeId = var18.universeId,
				rootPlaceId = var18.placeId,
				gameSetTypeId = var5,
				sortPos = p6
			})
		end
	end, { p5, p7, var5, p6 })
	local var9 = reactModule.useCallback(function(p16, p17, p18, p19, p20) --[[ line: 161 ]]
		-- upvalues: p7 (ref), mutedError (copy), var5 (ref), getGameTileLayoutDataModule (copy), discoveryVideoEndEvent (copy), p5 (ref), p6 (ref)
		if p16 ~= nil and p7 ~= nil then
			local var22 = p7[p16]
			
			if not var22 then
				mutedError("reportVideoEnd requires a valid entry")
			end
			local wideVideoAssetId
			local var23 = var5
			
			if var22 and var22.primaryWideVideoAssetId then
				wideVideoAssetId = var22.primaryWideVideoAssetId
			else
				local var24 = getGameTileLayoutDataModule(var22, var23)
				wideVideoAssetId = var24 and (var24.primaryMediaAsset and var24.primaryMediaAsset.wideVideoAssetId)
			end
			if not wideVideoAssetId then
				mutedError("reportVideoEnd requires a valid videoAssetId")
			end
			discoveryVideoEndEvent(p5, {
				videoAssetId = wideVideoAssetId,
				videoPlaybackSessionId = p18 or "INVALID_SESSION_ID",
				endReason = p17,
				playbackTime = p19,
				universeId = var22.universeId,
				rootPlaceId = var22.placeId,
				gameSetTypeId = var5,
				sortPos = p6,
				targetUniverseId = p20
			})
		end
	end, { p5, p7, var5, p6 })
	
	return if fFlagLuaAppHomeReduceRenders then reactModule.useMemo(function() --[[ line: 196 ]]
		-- upvalues: var6 (ref), var7 (ref), var8 (ref), var9 (ref)
		return {
			reportVideoPlay = var6,
			reportVideoLoad = var7,
			reportVideoLoop = var8,
			reportVideoEnd = var9
		}
	end, { var6, var7, var8, var9 }) else {
		reportVideoPlay = var6,
		reportVideoLoad = var7,
		reportVideoLoop = var8,
		reportVideoEnd = var9
	}
end