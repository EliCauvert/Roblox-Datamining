local Parent = script:FindFirstAncestor("MediaGallery").Parent
local ReactModule = require(Parent.React)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local DiscoveryVideoPlayEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoPlayEvent
local DiscoveryVideoEndEventFunction = DiscoveryAnalyticsModule.Events.discoveryVideoEndEvent
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoActions = VideoUtilsModule.AnalyticsEnums.VideoActions
local VideoLogger = VideoUtilsModule.VideoLogger
local ReportWarningFunction = DiscoveryAnalyticsModule.Points.reportWarning
local FFlagLuaAppDiscoveryMomentVideoTelemetry = require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry

return function(SourceId, RootPlaceId, p1) --[[ Line: 29 | Named "useMediaGalleryVideoAnalytics" ]]
	-- upvalues: ReactModule (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), DiscoveryVideoPlayEventFunction (copy), FFlagLuaAppDiscoveryMomentVideoTelemetry (copy), VideoLogger (copy), VideoActions (copy), DiscoveryVideoEndEventFunction (copy)
	local UseResult = ReactModule.useCallback(function(p2, p3) --[[ Line: 30 ]]
		-- upvalues: p1 (copy), ReportWarningFunction (upval), LoggingProtocolModule (upval), DiscoveryVideoPlayEventFunction (upval), SourceId (copy), RootPlaceId (copy), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval)
		if not p2 or not p1 then return end
		local v1 = p1[p2]
		
		if not v1 then
			ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", "reportVideoPlay requires a valid entry")
			
			return
		end
		if not v1.videoId then
			ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", "reportVideoPlay requires a valid videoAssetId")
		end
		DiscoveryVideoPlayEventFunction("GameDetails", {
			videoAssetId = v1.videoId,
			videoPlaybackSessionId = p3 or "INVALID_SESSION_ID",
			universeId = SourceId,
			rootPlaceId = RootPlaceId,
			isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then v1.isMoment == true else nil
		})
	end, { SourceId, RootPlaceId, p1 })
	local UseResult1 = ReactModule.useCallback(function(p2, p3, _, LoadTime) --[[ Line: 55 ]]
		-- upvalues: p1 (copy), ReportWarningFunction (upval), LoggingProtocolModule (upval), VideoLogger (upval), VideoActions (upval), SourceId (copy)
		if not p2 or not p1 then return end
		local v1 = p1[p2]
		
		if not v1 then
			ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", "reportVideoLoad requires a valid entry")
			
			return
		end
		if not v1.videoId then
			ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", "reportVideoLoad requires a valid videoAssetId")
		end
		VideoLogger.reportVideoAction(VideoActions.load, "GameDetails", {
			source = "MediaGallery",
			videoAssetId = v1.videoId,
			sourceId = SourceId,
			playbackSessionId = p3 or "INVALID_SESSION_ID"
		}, { loadTime = LoadTime })
	end, { SourceId, p1 })
	local UseResult2 = ReactModule.useCallback(function(p2, p3, p4) --[[ Line: 82 ]]
		-- upvalues: p1 (copy), VideoLogger (upval), VideoActions (upval), SourceId (copy)
		if not p2 or not p1 then return end
		local v1 = p1[p2]
		
		if v1 and v1.videoId then
			VideoLogger.reportVideoAction(VideoActions.volume, "GameDetails", {
				source = "MediaGallery",
				videoAssetId = v1.videoId,
				sourceId = SourceId,
				playbackSessionId = p3 or "INVALID_SESSION_ID",
				volumeLevel = if p4 then 0 else 1
			})
			
			return
		end
	end, { SourceId, p1 })
	local UseResult3 = ReactModule.useCallback(function(p2, EndReason, p3, PlaybackTime, TargetUniverseId) --[[ Line: 102 ]]
		-- upvalues: p1 (copy), ReportWarningFunction (upval), LoggingProtocolModule (upval), DiscoveryVideoEndEventFunction (upval), SourceId (copy), RootPlaceId (copy), FFlagLuaAppDiscoveryMomentVideoTelemetry (upval)
		if not p2 or not p1 then return end
		local v1 = p1[p2]
		
		if not v1 then
			ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", "reportVideoEnd requires a valid entry")
			
			return
		end
		if not v1.videoId then
			ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", "reportVideoEnd requires a valid videoAssetId")
		end
		DiscoveryVideoEndEventFunction("GameDetails", {
			videoAssetId = v1.videoId,
			videoPlaybackSessionId = p3 or "INVALID_SESSION_ID",
			endReason = EndReason,
			playbackTime = PlaybackTime,
			universeId = SourceId,
			rootPlaceId = RootPlaceId,
			targetUniverseId = TargetUniverseId,
			isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then v1.isMoment == true else nil
		})
	end, { SourceId, RootPlaceId, p1 })
	
	return (ReactModule.useMemo(function() --[[ Line: 137 ]]
		-- upvalues: UseResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy)
		return {
			reportVideoPlay = UseResult,
			reportVideoLoad = UseResult1,
			reportVideoMute = UseResult2,
			reportVideoEnd = UseResult3
		}
	end, { UseResult, UseResult1, UseResult2, UseResult3 }))
end