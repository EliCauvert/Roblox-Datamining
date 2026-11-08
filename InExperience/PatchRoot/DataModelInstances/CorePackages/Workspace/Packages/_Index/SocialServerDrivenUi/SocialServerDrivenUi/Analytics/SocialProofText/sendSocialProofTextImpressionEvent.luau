local TelemetryService = game:GetService("TelemetryService")
local _ = require(script.Parent.buildSocialProofTextEventParams)
local config = {
	eventName = "edpSocialProofTextImpression",
	description = "The EDP social proof text (friends who played, with an avatar stack) was shown",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("EdpSocialProofTextImpressionHundredthsPercent", 10000),
	lastUpdated = { 26, 11, 4 }
}

return function(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" },
		customFields = CustomFields
	})
end