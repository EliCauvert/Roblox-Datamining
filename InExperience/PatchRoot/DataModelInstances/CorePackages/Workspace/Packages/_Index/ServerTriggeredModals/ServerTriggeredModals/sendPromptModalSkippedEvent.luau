local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "PromptModalSkipped",
	description = "Sent when a served prompt modal is not shown",
	links = "",
	backends = {
		require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("PromptModalSkippedThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 11, 11 }
}

return function(CustomFields)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		standardizedFields = { "addSessionInfo" },
		customFields = CustomFields
	})
end