local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.buildSocialProofTextEventParams)
local config = {
	eventName = "edpSocialProofTextClicked",
	description = "The user tapped the EDP social proof text to open the full list of friends who played",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("EdpSocialProofTextClickedHundredthsPercent", 10000),
	lastUpdated = { 26, 11, 4 }
}

return function(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end