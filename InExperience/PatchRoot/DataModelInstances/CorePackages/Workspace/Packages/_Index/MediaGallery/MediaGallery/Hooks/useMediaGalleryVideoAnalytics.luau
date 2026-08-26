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

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), reportWarning (ref), loggingProtocolModule (ref), discoveryVideoPlayEvent (ref), videoLogger (ref), videoActions (ref), discoveryVideoEndEvent (ref)
	local var1 = reactModule.useCallback(function(p4, p5)
		-- upvalues: p3 (ref), reportWarning (copy), loggingProtocolModule (copy), discoveryVideoPlayEvent (copy), p1 (ref), p2 (ref)
		if not p4 or not p3 then return end
		local var2 = p3[p4]
		
		if not var2 then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoPlay requires a valid entry")
			
			return
		elseif not var2.videoId then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoPlay requires a valid videoAssetId")
		end
		discoveryVideoPlayEvent("GameDetails", {
			videoAssetId = var2.videoId,
			videoPlaybackSessionId = p5 or "INVALID_SESSION_ID",
			universeId = p1,
			rootPlaceId = p2
		})
	end, { p1, p2, p3 })
	local var2 = reactModule.useCallback(function(p4, p5, _, p6)
		-- upvalues: p3 (ref), reportWarning (copy), loggingProtocolModule (copy), videoLogger (copy), videoActions (copy), p1 (ref)
		if not p4 or not p3 then return end
		local var3 = p3[p4]
		
		if not var3 then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoLoad requires a valid entry")
			
			return
		elseif not var3.videoId then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoLoad requires a valid videoAssetId")
		end
		videoLogger.reportVideoAction(videoActions.load, "GameDetails", {
			source = "MediaGallery",
			videoAssetId = var3.videoId,
			sourceId = p1,
			playbackSessionId = p5 or "INVALID_SESSION_ID"
		}, { loadTime = p6 })
	end, { p1, p3 })
	local var3 = reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: p3 (ref), videoLogger (copy), videoActions (copy), p1 (ref)
		if not p4 or not p3 then return end
		local var4 = p3[p4]
		
		if var4 and var4.videoId then
			videoLogger.reportVideoAction(videoActions.volume, "GameDetails", {
				source = "MediaGallery",
				videoAssetId = var4.videoId,
				sourceId = p1,
				playbackSessionId = p5 or "INVALID_SESSION_ID",
				volumeLevel = if p6 then 0 else 1
			})
			
			return
		end
	end, { p1, p3 })
	local var4 = reactModule.useCallback(function(p4, p5, p6, p7, p8)
		-- upvalues: p3 (ref), reportWarning (copy), loggingProtocolModule (copy), discoveryVideoEndEvent (copy), p1 (ref), p2 (ref)
		if not p4 or not p3 then return end
		local var5 = p3[p4]
		
		if not var5 then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoEnd requires a valid entry")
			
			return
		elseif not var5.videoId then
			reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoEnd requires a valid videoAssetId")
		end
		discoveryVideoEndEvent("GameDetails", {
			videoAssetId = var5.videoId,
			videoPlaybackSessionId = p6 or "INVALID_SESSION_ID",
			endReason = p5,
			playbackTime = p7,
			universeId = p1,
			rootPlaceId = p2,
			targetUniverseId = p8
		})
	end, { p1, p2, p3 })
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref)
		return {
			reportVideoPlay = var1,
			reportVideoLoad = var2,
			reportVideoMute = var3,
			reportVideoEnd = var4
		}
	end, { var1, var2, var3, var4 })
end