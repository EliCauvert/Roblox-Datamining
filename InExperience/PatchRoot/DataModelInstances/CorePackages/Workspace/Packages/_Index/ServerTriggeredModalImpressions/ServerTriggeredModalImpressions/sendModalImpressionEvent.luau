local TelemetryService = game:GetService("TelemetryService")
local ModalImpressionEventAddSessionInfo = game:DefineFastFlag("ModalImpressionEventAddSessionInfo", false)
local config = {
	eventName = "ModalImpression",
	description = "Sent when a modal is shown",
	links = "",
	backends = {
		require(script:FindFirstAncestor("ServerTriggeredModalImpressions").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("ModalImpressionThrottleHundrethsPercent", 10000),
	lastUpdated = { 25, 9, 9 }
}

return function(ModalId, ModalType)
	-- upvalues: TelemetryService (copy), config (copy), ModalImpressionEventAddSessionInfo (copy)
	TelemetryService:LogEvent(config, {
		standardizedFields = if ModalImpressionEventAddSessionInfo then { "addSessionInfo" } else nil,
		customFields = { modalId = ModalId, modalType = ModalType }
	})
end