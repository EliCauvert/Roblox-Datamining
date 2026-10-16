local TelemetryService = game:GetService("TelemetryService")
local TraversalTelemetryThrottleHundrethsPercent = game:DefineFastInt("TraversalTelemetryThrottleHundrethsPercent", 0)
local config = {
	BackButtonActions = {
		eventName = "coreui_inexp_back_button_actions",
		description = "Event fired every time the User engages with Traversal Back Button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = TraversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryMenuButtonActions = {
		eventName = "coreui_inexp_history_chevron_clicks",
		description = "Event fired every time the User engages with Traversal History Menu Button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = TraversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryMenuItemClick = {
		eventName = "coreui_inexp_history_dropdown_clicks",
		description = "Event fired every time the User engages with Traversal History Menu Items",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = TraversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryMenuHistoryClick = {
		eventName = "coreui_inexp_history_landing_entrypoint_clicks",
		description = "Event fired every time the User engages with Traversal History Menu's History Item",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = TraversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryPageBackButtonClick = {
		eventName = "coreui_inexp_history_back_clicks",
		description = "Event fired every time the User engages with Traversal History Page's Back Button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = TraversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryPageExperienceTileClick = {
		eventName = "coreui_inexp_history_landing_tiles_clicks",
		description = "Event fired every time the User engages with Traversal History Page Tiles",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = TraversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	TeleportConfirmationActions = {
		eventName = "coreui_inexp_history_leave_page_actions",
		description = "Event fired every time the User engages with Traversal History Leave Confirmation",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = TraversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	}
}
local TraversalTelemetryModule = {}
TraversalTelemetryModule.__index = TraversalTelemetryModule

function TraversalTelemetryModule.sendBackButtonActionEvent(CustomFields) --[[ Line: 142 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.BackButtonActions, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = CustomFields
	})
end

function TraversalTelemetryModule.sendHistoryMenuButtonActionEvent(CustomFields) --[[ Line: 149 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.HistoryMenuButtonActions, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = CustomFields
	})
end

function TraversalTelemetryModule.sendHistoryMenuItemClick(CustomFields) --[[ Line: 156 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.HistoryMenuItemClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = CustomFields
	})
end

function TraversalTelemetryModule.sendHistoryMenuHistoryClick(CustomFields) --[[ Line: 163 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.HistoryMenuHistoryClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = CustomFields
	})
end

function TraversalTelemetryModule.sendHistoryPageBackButtonClick(CustomFields) --[[ Line: 170 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.HistoryPageBackButtonClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = CustomFields
	})
end

function TraversalTelemetryModule.sendHistoryPageExperienceTileClick(CustomFields) --[[ Line: 177 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.HistoryPageExperienceTileClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = CustomFields
	})
end

function TraversalTelemetryModule.sendTeleportConfirmationActions(CustomFields) --[[ Line: 184 ]]
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config.TeleportConfirmationActions, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = CustomFields
	})
end

return TraversalTelemetryModule