local telemetryService = game:GetService("TelemetryService")
local sharedFlagsModule = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags)
local _ = require(script.Parent.sponsoredAdViewabilityState)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local list = { "addSessionInfo", "addSessionId", "addOSInfo" }
local t = {
	eventName = "SponsoredAdLoad",
	description = "\t\tFires once per served sponsored ad when its tile begins to render on a surface.\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdLoadTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 11 }
}
local t_1 = {
	eventName = "SponsoredAdViewableImpression",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdViewableImpressionTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 16 },
	description = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then "\t\t\tFires once per IAB viewable-impression milestone reached by a served sponsored ad\n\t\t\t(image: standard 50% / 1s, large 30% / 1s, full 100% / 1s;\n\t\t\tvideo: standard 50% / 2s while playing, full 100% / 1s while playing).\n\t\t" else "\t\t\tFires once per IAB viewable-impression milestone reached by a served sponsored ad\n\t\t\t(standard 50% / 1s, large display 30% / 1s, full view 100% / 1s).\n\t\t"
}
local t_2 = {
	eventName = "SponsoredAdUnload",
	description = "\t\tFires once per served sponsored ad when its viewability session reaches a terminal\n\t\tboundary, carrying the session's dwell and in-view duration summary.\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdUnloadTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 25 }
}
local var6 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
	eventName = "SponsoredAdVideoProgress",
	description = "\t\t\tFires once for each 0 / 25 / 50 / 75 / 100 video-progress milestone reached\n\t\t\twithin a served sponsored ad session.\n\t\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdVideoProgressTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 7, 21 }
} else nil

local function buildGeometryFields(p0)
	local adSize = p0.adSize
	local viewportBounds = p0.viewportBounds
	
	return {
		adWidth = if adSize.X > 0 then adSize.X else nil,
		adHeight = if adSize.Y > 0 then adSize.Y else nil,
		viewportWidth = viewportBounds.max.X - viewportBounds.min.X,
		viewportHeight = viewportBounds.max.Y - viewportBounds.min.Y
	}
end

return {
	logSponsoredAdLoad = function(p1, p2, p3, p4)
		-- upvalues: buildGeometryFields (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), telemetryService (ref), t (ref), list (ref)
		local var8 = buildGeometryFields(p2)
		local t_1 = {
			encryptedAdTrackingData = p1.encryptedAdTrackingData,
			tileType = p1.tileType,
			viewabilitySessionStartTimestampMs = p3,
			adWidth = var8.adWidth,
			adHeight = var8.adHeight,
			viewportWidth = var8.viewportWidth,
			viewportHeight = var8.viewportHeight
		}
		
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			if p1.mediaType == "video" then
				t_1.isFullScreen = p1.isFullscreen == true
			end
			if p4 ~= nil then
				t_1.videoLengthMs = p4.videoLengthMs
			end
		end
		telemetryService:LogEvent(t, { standardizedFields = list, customFields = t_1 })
	end,
	logSponsoredAdViewableImpression = function(p5, p6)
		-- upvalues: buildGeometryFields (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), telemetryService (ref), t_1 (ref), list (ref)
		local var10 = buildGeometryFields(p6.geometry)
		local t = {
			encryptedAdTrackingData = p5.encryptedAdTrackingData,
			tileType = p5.tileType,
			milestoneLabel = p6.milestoneLabel,
			viewabilitySessionStartTimestampMs = p6.viewabilitySessionStartTimestampMs,
			adWidth = var10.adWidth,
			adHeight = var10.adHeight,
			viewportWidth = var10.viewportWidth,
			viewportHeight = var10.viewportHeight,
			cumulative30PercentInViewDurationMs = p6.cumulative30PercentInViewDurationMs,
			cumulative50PercentInViewDurationMs = p6.cumulative50PercentInViewDurationMs,
			cumulative100PercentInViewDurationMs = p6.cumulative100PercentInViewDurationMs,
			maxContinuous30PercentInViewDurationMs = p6.maxContinuous30PercentInViewDurationMs,
			maxContinuous50PercentInViewDurationMs = p6.maxContinuous50PercentInViewDurationMs,
			maxContinuous100PercentInViewDurationMs = p6.maxContinuous100PercentInViewDurationMs
		}
		
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			t.isFullScreen = p6.isFullScreen
			t.videoLengthMs = p6.videoLengthMs
			t.maxAudioLevel = p6.maxAudioLevel
			t.cumulativeInGridViewDurationMs = p6.cumulativeInGridViewDurationMs
			t.cumulativeFullScreenViewDurationMs = p6.cumulativeFullScreenViewDurationMs
		end
		telemetryService:LogEvent(t_1, { standardizedFields = list, customFields = t })
	end,
	logSponsoredAdVideoProgress = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then function(p7, p8)
		-- upvalues: buildGeometryFields (ref), telemetryService (ref), var6 (ref), list (ref)
		local var12 = buildGeometryFields(p8.geometry)
		telemetryService:LogEvent(var6, {
			standardizedFields = list,
			customFields = {
				encryptedAdTrackingData = p7.encryptedAdTrackingData,
				tileType = p7.tileType,
				isFullScreen = p8.isFullScreen,
				adWidth = var12.adWidth,
				adHeight = var12.adHeight,
				viewportWidth = var12.viewportWidth,
				viewportHeight = var12.viewportHeight,
				viewabilitySessionStartTimestampMs = p8.viewabilitySessionStartTimestampMs,
				cumulative30PercentInViewDurationMs = p8.cumulative30PercentInViewDurationMs,
				cumulative50PercentInViewDurationMs = p8.cumulative50PercentInViewDurationMs,
				cumulative100PercentInViewDurationMs = p8.cumulative100PercentInViewDurationMs,
				maxContinuous30PercentInViewDurationMs = p8.maxContinuous30PercentInViewDurationMs,
				maxContinuous50PercentInViewDurationMs = p8.maxContinuous50PercentInViewDurationMs,
				maxContinuous100PercentInViewDurationMs = p8.maxContinuous100PercentInViewDurationMs,
				videoProgress = p8.videoProgress,
				videoLengthMs = p8.videoLengthMs,
				videoCumulativePlaytimeMs = p8.videoCumulativePlaytimeMs,
				cumulativeAudioPlaybackDurationMs = p8.cumulativeAudioPlaybackDurationMs,
				cumulative100PercentAudibleTimeMs = p8.cumulative100PercentAudibleTimeMs,
				maxAudioLevel = p8.maxAudioLevel,
				audioOnAtEvent = p8.audioOnAtEvent,
				cumulativeInGridViewDurationMs = p8.cumulativeInGridViewDurationMs,
				cumulativeFullScreenViewDurationMs = p8.cumulativeFullScreenViewDurationMs
			}
		})
	end else nil,
	logSponsoredAdUnload = function(p9, p10, p11)
		-- upvalues: buildGeometryFields (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), telemetryService (ref), t_2 (ref), list (ref)
		local var13 = buildGeometryFields(p10.geometry)
		local t = {
			encryptedAdTrackingData = p9.encryptedAdTrackingData,
			tileType = p9.tileType,
			adWidth = var13.adWidth,
			adHeight = var13.adHeight,
			viewportWidth = var13.viewportWidth,
			viewportHeight = var13.viewportHeight,
			viewabilitySessionStartTimestampMs = p10.viewabilitySessionStartTimestampMs,
			cumulative30PercentInViewDurationMs = p10.cumulative30PercentInViewDurationMs,
			cumulative50PercentInViewDurationMs = p10.cumulative50PercentInViewDurationMs,
			cumulative100PercentInViewDurationMs = p10.cumulative100PercentInViewDurationMs,
			maxContinuous30PercentInViewDurationMs = p10.maxContinuous30PercentInViewDurationMs,
			maxContinuous50PercentInViewDurationMs = p10.maxContinuous50PercentInViewDurationMs,
			maxContinuous100PercentInViewDurationMs = p10.maxContinuous100PercentInViewDurationMs,
			dwellDurationMs = p10.dwellDurationMs,
			averagePercentSeen = p10.averagePercentSeen,
			minPercentSeen = p10.minPercentSeen,
			maxPercentSeen = p10.maxPercentSeen,
			averageOnScreenRealEstate = p10.averageOnScreenRealEstate,
			viewabilitySessionEndTimestampMs = p10.viewabilitySessionEndTimestampMs,
			unloadReason = p11
		}
		
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			t.isFullScreen = p10.isFullScreen
			t.videoProgress = p10.videoProgress
			t.videoLengthMs = p10.videoLengthMs
			t.videoCumulativePlaytimeMs = p10.videoCumulativePlaytimeMs
			t.cumulativeAudioPlaybackDurationMs = p10.cumulativeAudioPlaybackDurationMs
			t.cumulative100PercentAudibleTimeMs = p10.cumulative100PercentAudibleTimeMs
			t.maxAudioLevel = p10.maxAudioLevel
			t.audioOnAtEvent = p10.audioOnAtEvent
			t.cumulativeInGridViewDurationMs = p10.cumulativeInGridViewDurationMs
			t.cumulativeFullScreenViewDurationMs = p10.cumulativeFullScreenViewDurationMs
		end
		telemetryService:LogEvent(t_2, { standardizedFields = list, customFields = t })
	end
}