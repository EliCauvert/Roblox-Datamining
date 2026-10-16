local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.sponsoredAdViewabilityState)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local FFlagLuaAppSponsoredAdVideoViewabilityEnabled = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags).FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local StandardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" }
local config = {
	eventName = "SponsoredAdLoad",
	description = "\t\tFires once per served sponsored ad when its tile begins to render on a surface.\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdLoadTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 11 }
}
local config1 = {
	eventName = "SponsoredAdViewableImpression",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdViewableImpressionTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 16 },
	description = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then "\t\t\tFires once per IAB viewable-impression milestone reached by a served sponsored ad\n\t\t\t(image: standard 50% / 1s, large 30% / 1s, full 100% / 1s;\n\t\t\tvideo: standard 50% / 2s while playing, full 100% / 1s while playing).\n\t\t" else "\t\t\tFires once per IAB viewable-impression milestone reached by a served sponsored ad\n\t\t\t(standard 50% / 1s, large display 30% / 1s, full view 100% / 1s).\n\t\t"
}
local config2 = {
	eventName = "SponsoredAdUnload",
	description = "\t\tFires once per served sponsored ad when its viewability session reaches a terminal\n\t\tboundary, carrying the session's dwell and in-view duration summary.\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdUnloadTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 25 }
}
local Config = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
	eventName = "SponsoredAdVideoProgress",
	description = "\t\t\tFires once for each 0 / 25 / 50 / 75 / 100 video-progress milestone reached\n\t\t\twithin a served sponsored ad session.\n\t\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdVideoProgressTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 7, 21 }
} else nil

local function buildGeometryFields(Geometry) --[[ Line: 91 ]]
	local AdSize = Geometry.adSize
	local ViewportBounds = Geometry.viewportBounds
	
	return {
		adWidth = if AdSize.X > 0 then AdSize.X else nil,
		adHeight = if AdSize.Y > 0 then AdSize.Y else nil,
		viewportWidth = ViewportBounds.max.X - ViewportBounds.min.X,
		viewportHeight = ViewportBounds.max.Y - ViewportBounds.min.Y
	}
end

local function logSponsoredAdVideoProgress(CustomFields, CustomFields1) --[[ Line: 166 ]]
	-- upvalues: buildGeometryFields (copy), TelemetryService (copy), Config (copy), StandardizedFields (copy)
	local GeometryFields = buildGeometryFields(CustomFields1.geometry)
	TelemetryService:LogEvent(Config, {
		standardizedFields = StandardizedFields,
		customFields = {
			encryptedAdTrackingData = CustomFields.encryptedAdTrackingData,
			tileType = CustomFields.tileType,
			isFullScreen = CustomFields1.isFullScreen,
			adWidth = GeometryFields.adWidth,
			adHeight = GeometryFields.adHeight,
			viewportWidth = GeometryFields.viewportWidth,
			viewportHeight = GeometryFields.viewportHeight,
			viewabilitySessionStartTimestampMs = CustomFields1.viewabilitySessionStartTimestampMs,
			cumulative30PercentInViewDurationMs = CustomFields1.cumulative30PercentInViewDurationMs,
			cumulative50PercentInViewDurationMs = CustomFields1.cumulative50PercentInViewDurationMs,
			cumulative100PercentInViewDurationMs = CustomFields1.cumulative100PercentInViewDurationMs,
			maxContinuous30PercentInViewDurationMs = CustomFields1.maxContinuous30PercentInViewDurationMs,
			maxContinuous50PercentInViewDurationMs = CustomFields1.maxContinuous50PercentInViewDurationMs,
			maxContinuous100PercentInViewDurationMs = CustomFields1.maxContinuous100PercentInViewDurationMs,
			videoProgress = CustomFields1.videoProgress,
			videoLengthMs = CustomFields1.videoLengthMs,
			videoCumulativePlaytimeMs = CustomFields1.videoCumulativePlaytimeMs,
			cumulativeAudioPlaybackDurationMs = CustomFields1.cumulativeAudioPlaybackDurationMs,
			cumulative100PercentAudibleTimeMs = CustomFields1.cumulative100PercentAudibleTimeMs,
			maxAudioLevel = CustomFields1.maxAudioLevel,
			audioOnAtEvent = CustomFields1.audioOnAtEvent,
			cumulativeInGridViewDurationMs = CustomFields1.cumulativeInGridViewDurationMs,
			cumulativeFullScreenViewDurationMs = CustomFields1.cumulativeFullScreenViewDurationMs
		}
	})
end

return {
	logSponsoredAdLoad = function(CustomFields, p1, ViewabilitySessionStartTimestampMs, p2) --[[ Line: 103 ]]
		-- upvalues: buildGeometryFields (copy), FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), TelemetryService (copy), config (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(p1)
		local CustomFields1 = {
			encryptedAdTrackingData = CustomFields.encryptedAdTrackingData,
			tileType = CustomFields.tileType,
			viewabilitySessionStartTimestampMs = ViewabilitySessionStartTimestampMs,
			adWidth = GeometryFields.adWidth,
			adHeight = GeometryFields.adHeight,
			viewportWidth = GeometryFields.viewportWidth,
			viewportHeight = GeometryFields.viewportHeight
		}
		
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			if CustomFields.mediaType == "video" then
				CustomFields1.isFullScreen = CustomFields.isFullscreen == true
			end
			if p2 ~= nil then
				CustomFields1.videoLengthMs = p2.videoLengthMs
			end
		end
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields1
		})
	end,
	logSponsoredAdViewableImpression = function(CustomFields, CustomFields1) --[[ Line: 134 ]]
		-- upvalues: buildGeometryFields (copy), FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), TelemetryService (copy), config1 (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(CustomFields1.geometry)
		local CustomFields2 = {
			encryptedAdTrackingData = CustomFields.encryptedAdTrackingData,
			tileType = CustomFields.tileType,
			milestoneLabel = CustomFields1.milestoneLabel,
			viewabilitySessionStartTimestampMs = CustomFields1.viewabilitySessionStartTimestampMs,
			adWidth = GeometryFields.adWidth,
			adHeight = GeometryFields.adHeight,
			viewportWidth = GeometryFields.viewportWidth,
			viewportHeight = GeometryFields.viewportHeight,
			cumulative30PercentInViewDurationMs = CustomFields1.cumulative30PercentInViewDurationMs,
			cumulative50PercentInViewDurationMs = CustomFields1.cumulative50PercentInViewDurationMs,
			cumulative100PercentInViewDurationMs = CustomFields1.cumulative100PercentInViewDurationMs,
			maxContinuous30PercentInViewDurationMs = CustomFields1.maxContinuous30PercentInViewDurationMs,
			maxContinuous50PercentInViewDurationMs = CustomFields1.maxContinuous50PercentInViewDurationMs,
			maxContinuous100PercentInViewDurationMs = CustomFields1.maxContinuous100PercentInViewDurationMs
		}
		
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			CustomFields2.isFullScreen = CustomFields1.isFullScreen
			CustomFields2.videoLengthMs = CustomFields1.videoLengthMs
			CustomFields2.maxAudioLevel = CustomFields1.maxAudioLevel
			CustomFields2.cumulativeInGridViewDurationMs = CustomFields1.cumulativeInGridViewDurationMs
			CustomFields2.cumulativeFullScreenViewDurationMs = CustomFields1.cumulativeFullScreenViewDurationMs
		end
		TelemetryService:LogEvent(config1, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields2
		})
	end,
	logSponsoredAdVideoProgress = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then logSponsoredAdVideoProgress else nil,
	logSponsoredAdUnload = function(CustomFields, CustomFields1, UnloadReason) --[[ Line: 199 ]]
		-- upvalues: buildGeometryFields (copy), FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), TelemetryService (copy), config2 (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(CustomFields1.geometry)
		local CustomFields2 = {
			encryptedAdTrackingData = CustomFields.encryptedAdTrackingData,
			tileType = CustomFields.tileType,
			adWidth = GeometryFields.adWidth,
			adHeight = GeometryFields.adHeight,
			viewportWidth = GeometryFields.viewportWidth,
			viewportHeight = GeometryFields.viewportHeight,
			viewabilitySessionStartTimestampMs = CustomFields1.viewabilitySessionStartTimestampMs,
			cumulative30PercentInViewDurationMs = CustomFields1.cumulative30PercentInViewDurationMs,
			cumulative50PercentInViewDurationMs = CustomFields1.cumulative50PercentInViewDurationMs,
			cumulative100PercentInViewDurationMs = CustomFields1.cumulative100PercentInViewDurationMs,
			maxContinuous30PercentInViewDurationMs = CustomFields1.maxContinuous30PercentInViewDurationMs,
			maxContinuous50PercentInViewDurationMs = CustomFields1.maxContinuous50PercentInViewDurationMs,
			maxContinuous100PercentInViewDurationMs = CustomFields1.maxContinuous100PercentInViewDurationMs,
			dwellDurationMs = CustomFields1.dwellDurationMs,
			averagePercentSeen = CustomFields1.averagePercentSeen,
			minPercentSeen = CustomFields1.minPercentSeen,
			maxPercentSeen = CustomFields1.maxPercentSeen,
			averageOnScreenRealEstate = CustomFields1.averageOnScreenRealEstate,
			viewabilitySessionEndTimestampMs = CustomFields1.viewabilitySessionEndTimestampMs,
			unloadReason = UnloadReason
		}
		
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			CustomFields2.isFullScreen = CustomFields1.isFullScreen
			CustomFields2.videoProgress = CustomFields1.videoProgress
			CustomFields2.videoLengthMs = CustomFields1.videoLengthMs
			CustomFields2.videoCumulativePlaytimeMs = CustomFields1.videoCumulativePlaytimeMs
			CustomFields2.cumulativeAudioPlaybackDurationMs = CustomFields1.cumulativeAudioPlaybackDurationMs
			CustomFields2.cumulative100PercentAudibleTimeMs = CustomFields1.cumulative100PercentAudibleTimeMs
			CustomFields2.maxAudioLevel = CustomFields1.maxAudioLevel
			CustomFields2.audioOnAtEvent = CustomFields1.audioOnAtEvent
			CustomFields2.cumulativeInGridViewDurationMs = CustomFields1.cumulativeInGridViewDurationMs
			CustomFields2.cumulativeFullScreenViewDurationMs = CustomFields1.cumulativeFullScreenViewDurationMs
		end
		TelemetryService:LogEvent(config2, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields2
		})
	end
}