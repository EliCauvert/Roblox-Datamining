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

local function buildGeometryFields(p0) --[[ line: 42 ]]
	local adSize = p0.adSize
	local viewportBounds = p0.viewportBounds
	local var5 = viewportBounds.max.X - viewportBounds.min.X
	local var6 = viewportBounds.max.Y - viewportBounds.min.Y
	
	return {
		adWidth = if adSize.X > 0 then adSize.X else nil,
		adHeight = if adSize.Y > 0 then adSize.Y else nil,
		viewportWidth = if var5 > 0 then var5 else nil,
		viewportHeight = if var6 > 0 then var6 else nil
	}
end

return {
	logSponsoredAdLoad = function(p1, p2, p3) --[[ line: 56 ]]
		-- upvalues: buildGeometryFields (ref), telemetryService (ref), t (ref), list (ref)
		local var7 = buildGeometryFields(p2)
		telemetryService:LogEvent(t, {
			standardizedFields = list,
			customFields = {
				encryptedAdTrackingData = p1.encryptedAdTrackingData,
				tileType = p1.tileType,
				viewabilitySessionStartTimestampMs = p3,
				adWidth = var7.adWidth,
				adHeight = var7.adHeight,
				viewportWidth = var7.viewportWidth,
				viewportHeight = var7.viewportHeight
			}
		})
	end,
	logSponsoredAdViewableImpression = function(p4, p5) --[[ line: 77 ]]
		-- upvalues: buildGeometryFields (ref), telemetryService (ref), t_1 (ref), list (ref)
		local var8 = buildGeometryFields(p5.geometry)
		telemetryService:LogEvent(t_1, {
			standardizedFields = list,
			customFields = {
				encryptedAdTrackingData = p4.encryptedAdTrackingData,
				tileType = p4.tileType,
				milestoneLabel = p5.milestoneLabel,
				viewabilitySessionStartTimestampMs = p5.viewabilitySessionStartTimestampMs,
				adWidth = var8.adWidth,
				adHeight = var8.adHeight,
				viewportWidth = var8.viewportWidth,
				viewportHeight = var8.viewportHeight
			}
		})
	end
}