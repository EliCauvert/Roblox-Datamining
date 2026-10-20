local LoggingProtocolModule = require(script:FindFirstAncestor("NotificationsUpsell").Parent.LoggingProtocol)
local ModalEventConstantsModule = require(script.Parent.Parent.ModalEventConstants)
game:DefineFastInt("LuaPushUpsellEventThrottleHundrethsPercent", 10000)

return {
	description = "Tracks events related to push notifications upsell modal",
	eventName = ModalEventConstantsModule.OptInPushUpsellEventName,
	backends = { LoggingProtocolModule.TelemetryBackends.EventIngest },
	throttlingPercentage = game:GetFastInt("LuaPushUpsellEventThrottleHundrethsPercent"),
	lastUpdated = { 24, 6, 30 }
}