local telemetryService = game:GetService("TelemetryService")
local traversalTelemetryThrottleHundrethsPercent = game:DefineFastInt("TraversalTelemetryThrottleHundrethsPercent", 0)
local t = {
	BackButtonActions = {
		eventName = "coreui_inexp_back_button_actions",
		description = "Event fired every time the User engages with Traversal Back Button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = traversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryMenuButtonActions = {
		eventName = "coreui_inexp_history_chevron_clicks",
		description = "Event fired every time the User engages with Traversal History Menu Button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = traversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryMenuItemClick = {
		eventName = "coreui_inexp_history_dropdown_clicks",
		description = "Event fired every time the User engages with Traversal History Menu Items",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = traversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryMenuHistoryClick = {
		eventName = "coreui_inexp_history_landing_entrypoint_clicks",
		description = "Event fired every time the User engages with Traversal History Menu's History Item",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = traversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryPageBackButtonClick = {
		eventName = "coreui_inexp_history_back_clicks",
		description = "Event fired every time the User engages with Traversal History Page's Back Button",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = traversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	HistoryPageExperienceTileClick = {
		eventName = "coreui_inexp_history_landing_tiles_clicks",
		description = "Event fired every time the User engages with Traversal History Page Tiles",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = traversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	},
	TeleportConfirmationActions = {
		eventName = "coreui_inexp_history_leave_page_actions",
		description = "Event fired every time the User engages with Traversal History Leave Confirmation",
		links = "https://github.rbx.com/Roblox/proto-schemas/pull/8339",
		backends = { "EventIngest" },
		throttlingPercentage = traversalTelemetryThrottleHundrethsPercent,
		lastUpdated = { 22, 10, 25 }
	}
}
local _ = {
	placeId = "addPlaceId",
	universeId = "addUniverseId",
	playsessionId = "addPlaySessionId"
}
local t_1 = {}
t_1.__index = t_1

function t_1.sendBackButtonActionEvent(p0) --[[ line: 142 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.BackButtonActions, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = p0
	})
end

function t_1.sendHistoryMenuButtonActionEvent(p1) --[[ line: 149 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.HistoryMenuButtonActions, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = p1
	})
end

function t_1.sendHistoryMenuItemClick(p2) --[[ line: 156 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.HistoryMenuItemClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = p2
	})
end

function t_1.sendHistoryMenuHistoryClick(p3) --[[ line: 163 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.HistoryMenuHistoryClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = p3
	})
end

function t_1.sendHistoryPageBackButtonClick(p4) --[[ line: 170 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.HistoryPageBackButtonClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = p4
	})
end

function t_1.sendHistoryPageExperienceTileClick(p5) --[[ line: 177 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.HistoryPageExperienceTileClick, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = p5
	})
end

function t_1.sendTeleportConfirmationActions(p6) --[[ line: 184 ]]
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogEvent(t.TeleportConfirmationActions, {
		standardizedFields = { "addPlaceId", "addUniverseId", "addPlaySessionId" },
		customFields = p6
	})
end

return t_1