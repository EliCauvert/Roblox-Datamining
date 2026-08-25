local parent = script:FindFirstAncestor("MediaGallery").Parent
local reactModule = require(parent.React)
local loggingProtocolModule = require(parent.LoggingProtocol)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local discoveryVideoPlayEvent = discoveryAnalyticsModule.Events.discoveryVideoPlayEvent
local discoveryVideoEndEvent = discoveryAnalyticsModule.Events.discoveryVideoEndEvent
local videoUtilsModule = require(parent.VideoUtils)
local videoActions = videoUtilsModule.AnalyticsEnums.VideoActions
local videoLogger = videoUtilsModule.VideoLogger
local reportWarning = discoveryAnalyticsModule.Points.reportWarning

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), reportWarning (ref), loggingProtocolModule (ref), discoveryVideoPlayEvent (ref), videoLogger (ref), videoActions (ref), discoveryVideoEndEvent (ref)
	local var4 = reactModule.useCallback(function(p3, p4)
		-- upvalues: p2 (ref), reportWarning (copy), loggingProtocolModule (copy), discoveryVideoPlayEvent (copy), p0 (ref), p1 (ref)
		if not p3 or not p2 then return end
		local var8 = p2[p3]
		
		if not var8 then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoPlay requires a valid entry")
			
			return
		elseif not var8.videoId then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoPlay requires a valid videoAssetId")
		end
		discoveryVideoPlayEvent("GameDetails", {
			videoAssetId = var8.videoId,
			videoPlaybackSessionId = p4 or "INVALID_SESSION_ID",
			universeId = p0,
			rootPlaceId = p1
		})
	end, { p0, p1, p2 })
	local var5 = reactModule.useCallback(function(p5, p6, _, p7)
		-- upvalues: p2 (ref), reportWarning (copy), loggingProtocolModule (copy), videoLogger (copy), videoActions (copy), p0 (ref)
		if not p5 or not p2 then return end
		local var9 = p2[p5]
		
		if not var9 then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoLoad requires a valid entry")
			
			return
		elseif not var9.videoId then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoLoad requires a valid videoAssetId")
		end
		videoLogger.reportVideoAction(videoActions.load, "GameDetails", {
			source = "MediaGallery",
			videoAssetId = var9.videoId,
			sourceId = p0,
			playbackSessionId = p6 or "INVALID_SESSION_ID"
		}, { loadTime = p7 })
	end, { p0, p2 })
	local var6 = reactModule.useCallback(function(p8, p9, p10)
		-- upvalues: p2 (ref), videoLogger (copy), videoActions (copy), p0 (ref)
		if not p8 or not p2 then return end
		local var10 = p2[p8]
		
		if var10 and var10.videoId then
			videoLogger.reportVideoAction(videoActions.volume, "GameDetails", {
				source = "MediaGallery",
				videoAssetId = var10.videoId,
				sourceId = p0,
				playbackSessionId = p9 or "INVALID_SESSION_ID",
				volumeLevel = if p10 then 0 else 1
			})
			
			return
		end
	end, { p0, p2 })
	local var7 = reactModule.useCallback(function(p11, p12, p13, p14, p15)
		-- upvalues: p2 (ref), reportWarning (copy), loggingProtocolModule (copy), discoveryVideoEndEvent (copy), p0 (ref), p1 (ref)
		if not p11 or not p2 then return end
		local var11 = p2[p11]
		
		if not var11 then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoEnd requires a valid entry")
			
			return
		elseif not var11.videoId then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoEnd requires a valid videoAssetId")
		end
		discoveryVideoEndEvent("GameDetails", {
			videoAssetId = var11.videoId,
			videoPlaybackSessionId = p13 or "INVALID_SESSION_ID",
			endReason = p12,
			playbackTime = p14,
			universeId = p0,
			rootPlaceId = p1,
			targetUniverseId = p15
		})
	end, { p0, p1, p2 })
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), var5 (ref), var6 (ref), var7 (ref)
		return {
			reportVideoPlay = var4,
			reportVideoLoad = var5,
			reportVideoMute = var6,
			reportVideoEnd = var7
		}
	end, { var4, var5, var6, var7 })
end