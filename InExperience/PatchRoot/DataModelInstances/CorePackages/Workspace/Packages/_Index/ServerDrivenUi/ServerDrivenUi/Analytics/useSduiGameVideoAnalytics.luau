local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local discoveryVideoEndEvent = discoveryAnalyticsModule.Events.discoveryVideoEndEvent
local discoveryVideoLoadEvent = discoveryAnalyticsModule.Events.discoveryVideoLoadEvent
local discoveryVideoLoopEvent = discoveryAnalyticsModule.Events.discoveryVideoLoopEvent
local discoveryVideoPlayEvent = discoveryAnalyticsModule.Events.discoveryVideoPlayEvent
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local findAnalyticsFieldInAncestors = require(parent.SduiCoreSystem).findAnalyticsFieldInAncestors
local videoUtilsModule = require(parent.VideoUtils)
local videoActions = videoUtilsModule.AnalyticsEnums.VideoActions
local videoLogger = videoUtilsModule.VideoLogger
local fFlagLuaAppBroadenVideoAnalytics = require(parent.SharedFlags).FFlagLuaAppBroadenVideoAnalytics

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

local _ = function(value, p1, p2, p3)
	-- upvalues: discoveryEventErrorLogger (ref)
	discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "{value}" is missing videoAssetId on page "{p1}"`, {
		actionType = value,
		pageContext = p1,
		universeId = p2,
		placeId = p3
	})
end

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), findAnalyticsFieldInAncestors (ref), fFlagLuaAppBroadenVideoAnalytics (ref), discoveryEventErrorLogger (ref), discoveryVideoPlayEvent (ref), discoveryVideoLoadEvent (ref), videoLogger (ref), videoActions (ref), discoveryVideoLoopEvent (ref), discoveryVideoEndEvent (ref)
	local var1 = reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), findAnalyticsFieldInAncestors (copy), p3 (ref), p4 (ref), fFlagLuaAppBroadenVideoAnalytics (copy)
		local var2
		local var3 = if p1.getCollectionData then p1.getCollectionData() else nil
		local var4 = findAnalyticsFieldInAncestors("videoAssetId", p1)
		local var5 = if var4 == nil then nil else tostring(var4)
		local nativeAdData = findAnalyticsFieldInAncestors("nativeAdData", p1) or findAnalyticsFieldInAncestors("adId", p1)
		local t = {
			videoAssetId = var5,
			videoPlaybackSessionId = p5 or "INVALID_SESSION_ID",
			universeId = p3,
			rootPlaceId = p4
		}
		
		if var3 then
			local collectionId = var3.collectionId
			var2 = if collectionId == nil then nil else tostring(collectionId)
		else
			var2 = nil
		end
		local var6
		t.gameSetTypeId = var2
		t.sortPos = if var3 then var3.collectionPosition else nil
		t.nativeAdData = if fFlagLuaAppBroadenVideoAnalytics then if nativeAdData == nil then nil else tostring(nativeAdData) else nil
		
		if fFlagLuaAppBroadenVideoAnalytics then
			local var7 = findAnalyticsFieldInAncestors("tileType", p1)
			var6 = if var7 == nil then nil else tostring(var7)
		else
			var6 = nil
		end
		local var8
		t.tileType = var6
		
		if fFlagLuaAppBroadenVideoAnalytics then
			local var9 = findAnalyticsFieldInAncestors("contentType", p1)
			var8 = if var9 == nil then nil else tostring(var9)
		else
			var8 = nil
		end
		t.contentType = var8
		
		return t
	end, { p1, p3, p4 })
	local var2 = reactModule.useCallback(function(_, p5)
		-- upvalues: var1 (ref), p2 (ref), p3 (ref), p4 (ref), discoveryEventErrorLogger (copy), discoveryVideoPlayEvent (copy)
		local var3 = var1(p5)
		
		if not var3.videoAssetId then
			local var4 = p2
			discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "play" is missing videoAssetId on page "{var19}"`, {
				actionType = "play",
				pageContext = var4,
				universeId = p3,
				placeId = p4
			})
		end
		discoveryVideoPlayEvent(p2, var3)
	end, { var1, p2, p3, p4 })
	local var3 = reactModule.useCallback(function(_, p5, p6, p7)
		-- upvalues: var1 (ref), p2 (ref), p3 (ref), p4 (ref), discoveryEventErrorLogger (copy), discoveryVideoLoadEvent (copy), videoLogger (copy), videoActions (copy)
		local var4 = var1(p5)
		
		if not var4.videoAssetId then
			local var5 = p2
			discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "load" is missing videoAssetId on page "{var21}"`, {
				actionType = "load",
				pageContext = var5,
				universeId = p3,
				placeId = p4
			})
		end
		discoveryVideoLoadEvent(p2, {
			videoAssetId = var4.videoAssetId,
			videoPlaybackSessionId = var4.videoPlaybackSessionId,
			totalDuration = p6,
			loadTime = p7,
			universeId = var4.universeId,
			rootPlaceId = var4.rootPlaceId,
			gameSetTypeId = var4.gameSetTypeId,
			sortPos = var4.sortPos,
			nativeAdData = var4.nativeAdData,
			tileType = var4.tileType,
			contentType = var4.contentType
		})
		
		if var4.videoAssetId then
			videoLogger.reportVideoAction(videoActions.load, p2, {
				source = "universe",
				videoAssetId = var4.videoAssetId,
				sourceId = p3,
				playbackSessionId = var4.videoPlaybackSessionId
			}, { loadTime = p7 })
		end
	end, { var1, p2, p3, p4 })
	local var4 = reactModule.useCallback(function(_, p5)
		-- upvalues: var1 (ref), p2 (ref), p3 (ref), p4 (ref), discoveryEventErrorLogger (copy), discoveryVideoLoopEvent (copy)
		local var5 = var1(p5)
		
		if not var5.videoAssetId then
			local var6 = p2
			discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "loop" is missing videoAssetId on page "{var23}"`, {
				actionType = "loop",
				pageContext = var6,
				universeId = p3,
				placeId = p4
			})
		end
		discoveryVideoLoopEvent(p2, var5)
	end, { var1, p2, p3, p4 })
	local var5 = reactModule.useCallback(function(_, p5, p6, p7, p8)
		-- upvalues: var1 (ref), p2 (ref), p3 (ref), p4 (ref), discoveryEventErrorLogger (copy), discoveryVideoEndEvent (copy)
		local var6 = var1(p6)
		
		if not var6.videoAssetId then
			local var7 = p2
			discoveryEventErrorLogger.reportError("UnifiedVideoEngagementEvent_MissingVideoAssetId", `SDUI video analytics "end" is missing videoAssetId on page "{var25}"`, {
				actionType = "end",
				pageContext = var7,
				universeId = p3,
				placeId = p4
			})
		end
		discoveryVideoEndEvent(p2, {
			videoAssetId = var6.videoAssetId,
			videoPlaybackSessionId = var6.videoPlaybackSessionId,
			endReason = p5,
			playbackTime = p7,
			universeId = var6.universeId,
			rootPlaceId = var6.rootPlaceId,
			gameSetTypeId = var6.gameSetTypeId,
			sortPos = var6.sortPos,
			targetUniverseId = p8,
			nativeAdData = var6.nativeAdData,
			tileType = var6.tileType,
			contentType = var6.contentType
		})
	end, { var1, p2, p3, p4 })
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), var3 (ref), var4 (ref), var5 (ref)
		return {
			reportVideoMute = nil,
			reportVideoPlay = var2,
			reportVideoLoad = var3,
			reportVideoLoop = var4,
			reportVideoEnd = var5
		}
	end, { var2, var3, var4, var5 })
end