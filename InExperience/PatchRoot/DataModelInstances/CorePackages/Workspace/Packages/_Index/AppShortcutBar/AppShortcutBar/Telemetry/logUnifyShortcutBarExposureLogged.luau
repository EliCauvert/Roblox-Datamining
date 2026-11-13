local TelemetryService = require(script:FindFirstAncestor("AppShortcutBar").Parent.MockableProxyServices).TelemetryService
local config = {
	eventName = "UnifyShortcutBarExposureLoggedEvent",
	throttlingPercentage = 10000,
	links = "proto-schemas: production/eventstream/console/unify_shortcut_bar_exposure_logged.proto",
	description = "Once per session, right before the shortcut bar calls LogFlagLinkedUserLayerExposure. Sent to ingest_proto.unify_shortcut_bar_exposure_logged.",
	backends = { "EventIngest" },
	lastUpdated = { 26, 11, 11 }
}

return function(Sticky_bar_enabled)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		customFields = { sticky_bar_enabled = Sticky_bar_enabled }
	})
end