local telemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.sponsoredAdViewabilityRegistry)
local _ = require(script.Parent.sponsoredAdViewabilityState)
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
	description = "\t\tFires once per IAB viewable-impression milestone reached by a served sponsored ad\n\t\t(standard 50% / 1s, large display 30% / 1s, full view 100% / 1s).\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdViewableImpressionTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 16 }
}
local t_2 = {
	eventName = "SponsoredAdUnload",
	description = "\t\tFires once per served sponsored ad when its viewability session reaches a terminal\n\t\tboundary, carrying the session's dwell and in-view duration summary.\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdUnloadTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 25 }
}

local function buildGeometryFields(p0) --[[ line: 57 ]]
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
	logSponsoredAdLoad = function(p1, p2, p3) --[[ line: 69 ]]
		-- upvalues: buildGeometryFields (ref), telemetryService (ref), t (ref), list (ref)
		local var6 = buildGeometryFields(p2)
		telemetryService:LogEvent(t, {
			standardizedFields = list,
			customFields = {
				encryptedAdTrackingData = p1.encryptedAdTrackingData,
				tileType = p1.tileType,
				viewabilitySessionStartTimestampMs = p3,
				adWidth = var6.adWidth,
				adHeight = var6.adHeight,
				viewportWidth = var6.viewportWidth,
				viewportHeight = var6.viewportHeight
			}
		})
	end,
	logSponsoredAdViewableImpression = function(p4, p5) --[[ line: 90 ]]
		-- upvalues: buildGeometryFields (ref), telemetryService (ref), t_1 (ref), list (ref)
		local var7 = buildGeometryFields(p5.geometry)
		telemetryService:LogEvent(t_1, {
			standardizedFields = list,
			customFields = {
				encryptedAdTrackingData = p4.encryptedAdTrackingData,
				tileType = p4.tileType,
				milestoneLabel = p5.milestoneLabel,
				viewabilitySessionStartTimestampMs = p5.viewabilitySessionStartTimestampMs,
				adWidth = var7.adWidth,
				adHeight = var7.adHeight,
				viewportWidth = var7.viewportWidth,
				viewportHeight = var7.viewportHeight,
				cumulative30PercentInViewDurationMs = p5.cumulative30PercentInViewDurationMs,
				cumulative50PercentInViewDurationMs = p5.cumulative50PercentInViewDurationMs,
				cumulative100PercentInViewDurationMs = p5.cumulative100PercentInViewDurationMs,
				maxContinuous30PercentInViewDurationMs = p5.maxContinuous30PercentInViewDurationMs,
				maxContinuous50PercentInViewDurationMs = p5.maxContinuous50PercentInViewDurationMs,
				maxContinuous100PercentInViewDurationMs = p5.maxContinuous100PercentInViewDurationMs
			}
		})
	end,
	logSponsoredAdUnload = function(p6, p7, p8) --[[ line: 114 ]]
		-- upvalues: buildGeometryFields (ref), telemetryService (ref), t_2 (ref), list (ref)
		local var8 = buildGeometryFields(p7.geometry)
		telemetryService:LogEvent(t_2, {
			standardizedFields = list,
			customFields = {
				encryptedAdTrackingData = p6.encryptedAdTrackingData,
				tileType = p6.tileType,
				adWidth = var8.adWidth,
				adHeight = var8.adHeight,
				viewportWidth = var8.viewportWidth,
				viewportHeight = var8.viewportHeight,
				viewabilitySessionStartTimestampMs = p7.viewabilitySessionStartTimestampMs,
				cumulative30PercentInViewDurationMs = p7.cumulative30PercentInViewDurationMs,
				cumulative50PercentInViewDurationMs = p7.cumulative50PercentInViewDurationMs,
				cumulative100PercentInViewDurationMs = p7.cumulative100PercentInViewDurationMs,
				maxContinuous30PercentInViewDurationMs = p7.maxContinuous30PercentInViewDurationMs,
				maxContinuous50PercentInViewDurationMs = p7.maxContinuous50PercentInViewDurationMs,
				maxContinuous100PercentInViewDurationMs = p7.maxContinuous100PercentInViewDurationMs,
				dwellDurationMs = p7.dwellDurationMs,
				averagePercentSeen = p7.averagePercentSeen,
				minPercentSeen = p7.minPercentSeen,
				maxPercentSeen = p7.maxPercentSeen,
				averageOnScreenRealEstate = p7.averageOnScreenRealEstate,
				viewabilitySessionEndTimestampMs = p7.viewabilitySessionEndTimestampMs,
				unloadReason = p8
			}
		})
	end
}