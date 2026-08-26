local telemetryService = game:GetService("TelemetryService")
local list = {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}
local t = {
	eventName = "ServeEnhancedVideoError",
	description = "        This is fired when there is an error calling /serve-enhanced-video.\n    ",
	backends = { "Points" },
	throttlingPercentage = game:DefineFastInt("ServeEnhancedVideoErrorTelemetryThrottleHundredthsPercent", 0),
	lastUpdated = { 26, 3, 20 }
}

return {
	logServeEnhancedVideoError = function(p1)
		-- upvalues: telemetryService (ref), t (ref), list (ref)
		telemetryService:LogEvent(t, { standardizedFields = list, customFields = { error = p1 } })
	end
}