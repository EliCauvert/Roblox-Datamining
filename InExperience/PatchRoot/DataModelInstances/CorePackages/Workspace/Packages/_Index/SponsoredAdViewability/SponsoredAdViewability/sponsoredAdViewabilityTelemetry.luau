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
local var1 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
	eventName = "SponsoredAdVideoProgress",
	description = "\t\t\tFires once for each 0 / 25 / 50 / 75 / 100 video-progress milestone reached\n\t\t\twithin a served sponsored ad session.\n\t\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdVideoProgressTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 7, 21 }
} else nil

local function buildGeometryFields(p1)
	local adSize = p1.adSize
	local viewportBounds = p1.viewportBounds
	
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
		local var2 = buildGeometryFields(p2)
		local t_1 = {
			encryptedAdTrackingData = p1.encryptedAdTrackingData,
			tileType = p1.tileType,
			viewabilitySessionStartTimestampMs = p3,
			adWidth = var2.adWidth,
			adHeight = var2.adHeight,
			viewportWidth = var2.viewportWidth,
			viewportHeight = var2.viewportHeight
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
	logSponsoredAdViewableImpression = function(p1, p2)
		-- upvalues: buildGeometryFields (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), telemetryService (ref), t_1 (ref), list (ref)
		local var2 = buildGeometryFields(p2.geometry)
		local t = {
			encryptedAdTrackingData = p1.encryptedAdTrackingData,
			tileType = p1.tileType,
			milestoneLabel = p2.milestoneLabel,
			viewabilitySessionStartTimestampMs = p2.viewabilitySessionStartTimestampMs,
			adWidth = var2.adWidth,
			adHeight = var2.adHeight,
			viewportWidth = var2.viewportWidth,
			viewportHeight = var2.viewportHeight,
			cumulative30PercentInViewDurationMs = p2.cumulative30PercentInViewDurationMs,
			cumulative50PercentInViewDurationMs = p2.cumulative50PercentInViewDurationMs,
			cumulative100PercentInViewDurationMs = p2.cumulative100PercentInViewDurationMs,
			maxContinuous30PercentInViewDurationMs = p2.maxContinuous30PercentInViewDurationMs,
			maxContinuous50PercentInViewDurationMs = p2.maxContinuous50PercentInViewDurationMs,
			maxContinuous100PercentInViewDurationMs = p2.maxContinuous100PercentInViewDurationMs
		}
		
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			t.isFullScreen = p2.isFullScreen
			t.videoLengthMs = p2.videoLengthMs
			t.maxAudioLevel = p2.maxAudioLevel
			t.cumulativeInGridViewDurationMs = p2.cumulativeInGridViewDurationMs
			t.cumulativeFullScreenViewDurationMs = p2.cumulativeFullScreenViewDurationMs
		end
		telemetryService:LogEvent(t_1, { standardizedFields = list, customFields = t })
	end,
	logSponsoredAdVideoProgress = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then function(p1, p2)
		-- upvalues: buildGeometryFields (ref), telemetryService (ref), var1 (ref), list (ref)
		local var2 = buildGeometryFields(p2.geometry)
		telemetryService:LogEvent(var1, {
			standardizedFields = list,
			customFields = {
				encryptedAdTrackingData = p1.encryptedAdTrackingData,
				tileType = p1.tileType,
				isFullScreen = p2.isFullScreen,
				adWidth = var2.adWidth,
				adHeight = var2.adHeight,
				viewportWidth = var2.viewportWidth,
				viewportHeight = var2.viewportHeight,
				viewabilitySessionStartTimestampMs = p2.viewabilitySessionStartTimestampMs,
				cumulative30PercentInViewDurationMs = p2.cumulative30PercentInViewDurationMs,
				cumulative50PercentInViewDurationMs = p2.cumulative50PercentInViewDurationMs,
				cumulative100PercentInViewDurationMs = p2.cumulative100PercentInViewDurationMs,
				maxContinuous30PercentInViewDurationMs = p2.maxContinuous30PercentInViewDurationMs,
				maxContinuous50PercentInViewDurationMs = p2.maxContinuous50PercentInViewDurationMs,
				maxContinuous100PercentInViewDurationMs = p2.maxContinuous100PercentInViewDurationMs,
				videoProgress = p2.videoProgress,
				videoLengthMs = p2.videoLengthMs,
				videoCumulativePlaytimeMs = p2.videoCumulativePlaytimeMs,
				cumulativeAudioPlaybackDurationMs = p2.cumulativeAudioPlaybackDurationMs,
				cumulative100PercentAudibleTimeMs = p2.cumulative100PercentAudibleTimeMs,
				maxAudioLevel = p2.maxAudioLevel,
				audioOnAtEvent = p2.audioOnAtEvent,
				cumulativeInGridViewDurationMs = p2.cumulativeInGridViewDurationMs,
				cumulativeFullScreenViewDurationMs = p2.cumulativeFullScreenViewDurationMs
			}
		})
	end else nil,
	logSponsoredAdUnload = function(p1, p2, p3)
		-- upvalues: buildGeometryFields (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), telemetryService (ref), t_2 (ref), list (ref)
		local var2 = buildGeometryFields(p2.geometry)
		local t = {
			encryptedAdTrackingData = p1.encryptedAdTrackingData,
			tileType = p1.tileType,
			adWidth = var2.adWidth,
			adHeight = var2.adHeight,
			viewportWidth = var2.viewportWidth,
			viewportHeight = var2.viewportHeight,
			viewabilitySessionStartTimestampMs = p2.viewabilitySessionStartTimestampMs,
			cumulative30PercentInViewDurationMs = p2.cumulative30PercentInViewDurationMs,
			cumulative50PercentInViewDurationMs = p2.cumulative50PercentInViewDurationMs,
			cumulative100PercentInViewDurationMs = p2.cumulative100PercentInViewDurationMs,
			maxContinuous30PercentInViewDurationMs = p2.maxContinuous30PercentInViewDurationMs,
			maxContinuous50PercentInViewDurationMs = p2.maxContinuous50PercentInViewDurationMs,
			maxContinuous100PercentInViewDurationMs = p2.maxContinuous100PercentInViewDurationMs,
			dwellDurationMs = p2.dwellDurationMs,
			averagePercentSeen = p2.averagePercentSeen,
			minPercentSeen = p2.minPercentSeen,
			maxPercentSeen = p2.maxPercentSeen,
			averageOnScreenRealEstate = p2.averageOnScreenRealEstate,
			viewabilitySessionEndTimestampMs = p2.viewabilitySessionEndTimestampMs,
			unloadReason = p3
		}
		
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			t.isFullScreen = p2.isFullScreen
			t.videoProgress = p2.videoProgress
			t.videoLengthMs = p2.videoLengthMs
			t.videoCumulativePlaytimeMs = p2.videoCumulativePlaytimeMs
			t.cumulativeAudioPlaybackDurationMs = p2.cumulativeAudioPlaybackDurationMs
			t.cumulative100PercentAudibleTimeMs = p2.cumulative100PercentAudibleTimeMs
			t.maxAudioLevel = p2.maxAudioLevel
			t.audioOnAtEvent = p2.audioOnAtEvent
			t.cumulativeInGridViewDurationMs = p2.cumulativeInGridViewDurationMs
			t.cumulativeFullScreenViewDurationMs = p2.cumulativeFullScreenViewDurationMs
		end
		telemetryService:LogEvent(t_2, { standardizedFields = list, customFields = t })
	end
}