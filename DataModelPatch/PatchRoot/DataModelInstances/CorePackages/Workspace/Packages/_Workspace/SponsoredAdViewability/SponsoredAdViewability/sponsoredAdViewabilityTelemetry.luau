local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.sponsoredAdViewabilityRegistry)
local _ = require(script.Parent.sponsoredAdViewabilityState)
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
	description = "\t\tFires once per IAB viewable-impression milestone reached by a served sponsored ad\n\t\t(standard 50% / 1s, large display 30% / 1s, full view 100% / 1s).\n\t",
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("LuaAppSponsoredAdViewableImpressionTelemetryThrottlingHundredthsPercent", 0),
	lastUpdated = { 26, 6, 16 }
}

local function buildGeometryFields(Geometry)
	local AdSize = Geometry.adSize
	local ViewportBounds = Geometry.viewportBounds
	local XDelta = ViewportBounds.max.X - ViewportBounds.min.X
	local YDelta = ViewportBounds.max.Y - ViewportBounds.min.Y
	
	return {
		adWidth = if AdSize.X > 0 then AdSize.X else nil,
		adHeight = if AdSize.Y > 0 then AdSize.Y else nil,
		viewportWidth = if XDelta > 0 then XDelta else nil,
		viewportHeight = if YDelta > 0 then YDelta else nil
	}
end

return {
	logSponsoredAdLoad = function(p1, p2, ViewabilitySessionStartTimestampMs)
		-- upvalues: buildGeometryFields (copy), TelemetryService (copy), config (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(p2)
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = {
				encryptedAdTrackingData = p1.encryptedAdTrackingData,
				tileType = p1.tileType,
				viewabilitySessionStartTimestampMs = ViewabilitySessionStartTimestampMs,
				adWidth = GeometryFields.adWidth,
				adHeight = GeometryFields.adHeight,
				viewportWidth = GeometryFields.viewportWidth,
				viewportHeight = GeometryFields.viewportHeight
			}
		})
	end,
	logSponsoredAdViewableImpression = function(p1, p2)
		-- upvalues: buildGeometryFields (copy), TelemetryService (copy), config1 (copy), StandardizedFields (copy)
		local GeometryFields = buildGeometryFields(p2.geometry)
		TelemetryService:LogEvent(config1, {
			standardizedFields = StandardizedFields,
			customFields = {
				encryptedAdTrackingData = p1.encryptedAdTrackingData,
				tileType = p1.tileType,
				milestoneLabel = p2.milestoneLabel,
				viewabilitySessionStartTimestampMs = p2.viewabilitySessionStartTimestampMs,
				adWidth = GeometryFields.adWidth,
				adHeight = GeometryFields.adHeight,
				viewportWidth = GeometryFields.viewportWidth,
				viewportHeight = GeometryFields.viewportHeight
			}
		})
	end
}