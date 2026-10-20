local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.sponsoredAdViewabilityState)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
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
	description = "\t\t\tFires once per IAB viewable-impression milestone reached by a served sponsored ad\n\t\t\t(image: standard 50% / 1s, large 30% / 1s, full 100% / 1s;\n\t\t\tvideo: standard 50% / 2s while playing, full 100% / 1s while playing).\n\t\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdViewableImpressionTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 16 }
}
local config2 = {
	eventName = "SponsoredAdUnload",
	description = "\t\tFires once per served sponsored ad when its viewability session reaches a terminal\n\t\tboundary, carrying the session's dwell and in-view duration summary.\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdUnloadTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 25 }
}
local config3 = {
	eventName = "SponsoredAdVideoProgress",
	description = "\t\t\tFires once for each 0 / 25 / 50 / 75 / 100 video-progress milestone reached\n\t\t\twithin a served sponsored ad session.\n\t\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdVideoProgressTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 7, 21 }
}

local function buildGeometryFields(Geometry)
	local AdSize = Geometry.adSize
	local ViewportBounds = Geometry.viewportBounds
	
	return {
		adWidth = if AdSize.X > 0 then AdSize.X else nil,
		adHeight = if AdSize.Y > 0 then AdSize.Y else nil,
		viewportWidth = ViewportBounds.max.X - ViewportBounds.min.X,
		viewportHeight = ViewportBounds.max.Y - ViewportBounds.min.Y
	}
end

return {
	logSponsoredAdLoad = function(CustomFields, p1, ViewabilitySessionStartTimestampMs, p2)
		-- upvalues: buildGeometryFields (copy), TelemetryService (copy), config (copy), StandardizedFields (copy)
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
		
		if CustomFields.mediaType == "video" then
			CustomFields1.isFullScreen = CustomFields.isFullscreen == true
		end
		if p2 ~= nil then
			CustomFields1.videoLengthMs = p2.videoLengthMs
		end
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = CustomFields1
		})
	end,
	logSponsoredAdViewableImpression = function(CustomFields, p1)
		-- upvalues: buildGeometryFields (copy), TelemetryService (copy), config1 (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(p1.geometry)
		TelemetryService:LogEvent(config1, {
			standardizedFields = StandardizedFields,
			customFields = {
				encryptedAdTrackingData = CustomFields.encryptedAdTrackingData,
				tileType = CustomFields.tileType,
				milestoneLabel = p1.milestoneLabel,
				viewabilitySessionStartTimestampMs = p1.viewabilitySessionStartTimestampMs,
				adWidth = GeometryFields.adWidth,
				adHeight = GeometryFields.adHeight,
				viewportWidth = GeometryFields.viewportWidth,
				viewportHeight = GeometryFields.viewportHeight,
				cumulative30PercentInViewDurationMs = p1.cumulative30PercentInViewDurationMs,
				cumulative50PercentInViewDurationMs = p1.cumulative50PercentInViewDurationMs,
				cumulative100PercentInViewDurationMs = p1.cumulative100PercentInViewDurationMs,
				maxContinuous30PercentInViewDurationMs = p1.maxContinuous30PercentInViewDurationMs,
				maxContinuous50PercentInViewDurationMs = p1.maxContinuous50PercentInViewDurationMs,
				maxContinuous100PercentInViewDurationMs = p1.maxContinuous100PercentInViewDurationMs,
				isFullScreen = p1.isFullScreen,
				videoLengthMs = p1.videoLengthMs,
				maxAudioLevel = p1.maxAudioLevel,
				cumulativeInGridViewDurationMs = p1.cumulativeInGridViewDurationMs,
				cumulativeFullScreenViewDurationMs = p1.cumulativeFullScreenViewDurationMs
			}
		})
	end,
	logSponsoredAdVideoProgress = function(CustomFields, p1)
		-- upvalues: buildGeometryFields (copy), TelemetryService (copy), config3 (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(p1.geometry)
		TelemetryService:LogEvent(config3, {
			standardizedFields = StandardizedFields,
			customFields = {
				encryptedAdTrackingData = CustomFields.encryptedAdTrackingData,
				tileType = CustomFields.tileType,
				isFullScreen = p1.isFullScreen,
				adWidth = GeometryFields.adWidth,
				adHeight = GeometryFields.adHeight,
				viewportWidth = GeometryFields.viewportWidth,
				viewportHeight = GeometryFields.viewportHeight,
				viewabilitySessionStartTimestampMs = p1.viewabilitySessionStartTimestampMs,
				cumulative30PercentInViewDurationMs = p1.cumulative30PercentInViewDurationMs,
				cumulative50PercentInViewDurationMs = p1.cumulative50PercentInViewDurationMs,
				cumulative100PercentInViewDurationMs = p1.cumulative100PercentInViewDurationMs,
				maxContinuous30PercentInViewDurationMs = p1.maxContinuous30PercentInViewDurationMs,
				maxContinuous50PercentInViewDurationMs = p1.maxContinuous50PercentInViewDurationMs,
				maxContinuous100PercentInViewDurationMs = p1.maxContinuous100PercentInViewDurationMs,
				videoProgress = p1.videoProgress,
				videoLengthMs = p1.videoLengthMs,
				videoCumulativePlaytimeMs = p1.videoCumulativePlaytimeMs,
				cumulativeAudioPlaybackDurationMs = p1.cumulativeAudioPlaybackDurationMs,
				cumulative100PercentAudibleTimeMs = p1.cumulative100PercentAudibleTimeMs,
				maxAudioLevel = p1.maxAudioLevel,
				audioOnAtEvent = p1.audioOnAtEvent,
				cumulativeInGridViewDurationMs = p1.cumulativeInGridViewDurationMs,
				cumulativeFullScreenViewDurationMs = p1.cumulativeFullScreenViewDurationMs
			}
		})
	end,
	logSponsoredAdUnload = function(CustomFields, p1, UnloadReason)
		-- upvalues: buildGeometryFields (copy), TelemetryService (copy), config2 (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(p1.geometry)
		TelemetryService:LogEvent(config2, {
			standardizedFields = StandardizedFields,
			customFields = {
				encryptedAdTrackingData = CustomFields.encryptedAdTrackingData,
				tileType = CustomFields.tileType,
				adWidth = GeometryFields.adWidth,
				adHeight = GeometryFields.adHeight,
				viewportWidth = GeometryFields.viewportWidth,
				viewportHeight = GeometryFields.viewportHeight,
				viewabilitySessionStartTimestampMs = p1.viewabilitySessionStartTimestampMs,
				cumulative30PercentInViewDurationMs = p1.cumulative30PercentInViewDurationMs,
				cumulative50PercentInViewDurationMs = p1.cumulative50PercentInViewDurationMs,
				cumulative100PercentInViewDurationMs = p1.cumulative100PercentInViewDurationMs,
				maxContinuous30PercentInViewDurationMs = p1.maxContinuous30PercentInViewDurationMs,
				maxContinuous50PercentInViewDurationMs = p1.maxContinuous50PercentInViewDurationMs,
				maxContinuous100PercentInViewDurationMs = p1.maxContinuous100PercentInViewDurationMs,
				dwellDurationMs = p1.dwellDurationMs,
				averagePercentSeen = p1.averagePercentSeen,
				minPercentSeen = p1.minPercentSeen,
				maxPercentSeen = p1.maxPercentSeen,
				averageOnScreenRealEstate = p1.averageOnScreenRealEstate,
				viewabilitySessionEndTimestampMs = p1.viewabilitySessionEndTimestampMs,
				unloadReason = UnloadReason,
				isFullScreen = p1.isFullScreen,
				videoProgress = p1.videoProgress,
				videoLengthMs = p1.videoLengthMs,
				videoCumulativePlaytimeMs = p1.videoCumulativePlaytimeMs,
				cumulativeAudioPlaybackDurationMs = p1.cumulativeAudioPlaybackDurationMs,
				cumulative100PercentAudibleTimeMs = p1.cumulative100PercentAudibleTimeMs,
				maxAudioLevel = p1.maxAudioLevel,
				audioOnAtEvent = p1.audioOnAtEvent,
				cumulativeInGridViewDurationMs = p1.cumulativeInGridViewDurationMs,
				cumulativeFullScreenViewDurationMs = p1.cumulativeFullScreenViewDurationMs
			}
		})
	end
}