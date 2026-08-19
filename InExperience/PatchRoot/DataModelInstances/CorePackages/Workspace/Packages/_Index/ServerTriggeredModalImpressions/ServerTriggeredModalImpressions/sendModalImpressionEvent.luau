local telemetryService = game:GetService("TelemetryService")
local modalImpressionEventAddSessionInfo = game:DefineFastFlag("ModalImpressionEventAddSessionInfo", false)
local t = {
	eventName = "ModalImpression",
	description = "Sent when a modal is shown",
	links = "",
	backends = {
		require(script:FindFirstAncestor("ServerTriggeredModalImpressions").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("ModalImpressionThrottleHundrethsPercent", 10000),
	lastUpdated = { 25, 9, 9 }
}

return function(p0, p1) --[[ line: 21 ]]
	-- upvalues: telemetryService (ref), t (ref), modalImpressionEventAddSessionInfo (ref)
	telemetryService:LogEvent(t, {
		standardizedFields = if modalImpressionEventAddSessionInfo then { "addSessionInfo" } else nil,
		customFields = { modalId = p0, modalType = p1 }
	})
end