local loggingProtocolModule = require(script:FindFirstAncestor("NotificationsUpsell").Parent.LoggingProtocol)
local modalEventConstantsModule = require(script.Parent.Parent.ModalEventConstants)
game:DefineFastInt("LuaPushUpsellEventThrottleHundrethsPercent", 10000)

return {
	description = "Tracks events related to push notifications upsell modal",
	eventName = modalEventConstantsModule.OptInPushUpsellEventName,
	backends = { loggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:GetFastInt("LuaPushUpsellEventThrottleHundrethsPercent"),
	lastUpdated = { 24, 6, 30 }
}