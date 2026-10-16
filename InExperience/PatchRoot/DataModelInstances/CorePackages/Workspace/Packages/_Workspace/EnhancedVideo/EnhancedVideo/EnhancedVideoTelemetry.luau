local TelemetryService = game:GetService("TelemetryService")
local StandardizedFields = {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}
local config = {
	eventName = "ServeEnhancedVideoError",
	description = "        This is fired when there is an error calling /serve-enhanced-video.\n    ",
	backends = { "Points" },
	throttlingPercentage = game:DefineFastInt("ServeEnhancedVideoErrorTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 3, 20 }
}

return {
	logServeEnhancedVideoError = function(p1) --[[ Line: 19 ]]
		-- upvalues: TelemetryService (copy), config (copy), StandardizedFields (copy)
		TelemetryService:LogEvent(config, {
			standardizedFields = StandardizedFields,
			customFields = { error = p1 }
		})
	end
}