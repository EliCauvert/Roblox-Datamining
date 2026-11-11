local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "ModalImpression",
	description = "Sent when a modal is shown",
	links = "",
	backends = {
		require(script:FindFirstAncestor("ServerTriggeredModals").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("ModalImpressionThrottleHundrethsPercent", 10000),
	lastUpdated = { 25, 9, 9 }
}

return function(ModalId, ModalType)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		customFields = { modalId = ModalId, modalType = ModalType }
	})
end