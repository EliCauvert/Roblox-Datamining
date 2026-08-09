local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "ModalImpression",
	description = "Sent when a modal is shown",
	links = "",
	backends = {
		require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("ModalImpressionThrottleHundrethsPercent", 10000),
	lastUpdated = { 25, 9, 9 }
}

return function(p0, p1) --[[ line: 19 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, { customFields = { modalId = p0, modalType = p1 } })
end