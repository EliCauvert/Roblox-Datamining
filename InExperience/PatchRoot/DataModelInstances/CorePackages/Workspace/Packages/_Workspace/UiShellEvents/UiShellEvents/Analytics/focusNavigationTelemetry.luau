local telemetryService = game:GetService("TelemetryService")
local parent = script:FindFirstAncestor("UiShellEvents").Parent
local telemetryBackends = require(parent.LoggingProtocol).TelemetryBackends
local _ = require(parent.FocusNavigationUtils)
local t = {
	eventName = "KeyboardFocusModeEnteredCounter",
	lastUpdated = "2026-06-22",
	description = "Counts # of sessions that use keyboard mode.",
	backends = { "RobloxTelemetryCounter" }
}
local t_1 = {
	eventName = "KeyboardFocusModeEnteredEvent",
	throttlingPercentage = 10000,
	lastUpdated = "2026-06-22",
	description = "Tracks % of DAUs that use keyboard mode.",
	backends = { "EventIngest" }
}
local t_2 = {
	eventName = "FocusNavToggledEvent",
	links = "proto-schemas: production/eventstream/console/focus_nav_toggled.proto",
	description = "Fired when the user enters or exits focus navigation. Sent to ingest_proto.focus_nav_toggled.",
	backends = { telemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("FocusNavToggledEventThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}
local t_3 = {
	eventName = "ShortcutBarToggle",
	links = "proto-schemas: production/eventstream/console/shortcut_bar_toggle.proto",
	description = "Fired when focus navigation dispatches a shortcut the user pressed to a handler. Sent to ingest_proto.shortcut_bar_toggle.",
	backends = { telemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("ShortcutBarToggleThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}
local t_4 = {
	eventName = "FocusNavToggledCounter",
	description = "Counts focus navigation entries and exits by entry and input type.",
	backends = { telemetryBackends.Counter },
	lastUpdated = { 26, 10, 4 }
}
local t_5 = {
	eventName = "FocusNavShortcutToggleCounter",
	description = "Counts shortcuts used in focus navigation by action and input type.",
	backends = { telemetryBackends.Counter },
	lastUpdated = { 26, 10, 4 }
}
local t_6 = {
	eventName = "FocusNavToggledPoints",
	description = "Focus navigation entries and exits with page and keyboard details, for Grafana breakdowns.",
	backends = { telemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("FocusNavToggledPointsThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}
local t_7 = {
	eventName = "FocusNavShortcutTogglePoints",
	description = "Shortcuts used in focus navigation with button and page, for Grafana breakdowns.",
	backends = { telemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("FocusNavShortcutTogglePointsThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}

local function logToAllBackends(p1, p2, p3, p4, p5)
	-- upvalues: telemetryService (ref)
	telemetryService:LogEvent(p1, { customFields = p4 })
	telemetryService:LogEvent(p2, { customFields = p4 })
	telemetryService:LogCounter(p3, { customFields = p5 }, 1)
end

local list = { "addSessionId", "addOSInfo", "addSessionInfo" }

return {
	logKeyboardFocusModeEntered = function()
		-- upvalues: telemetryService (ref), t_1 (ref), list (ref), t (ref)
		telemetryService:LogEvent(t_1, { customFields = {}, standardizedFields = list })
		telemetryService:LogCounter(t, { customFields = {}, standardizedFields = list })
	end,
	logFocusNavToggled = function(p1)
		-- upvalues: logToAllBackends (ref), t_2 (ref), t_6 (ref), t_4 (ref)
		logToAllBackends(t_2, t_6, t_4, p1, { entry = p1.entry, input_type = p1.input_type })
	end,
	logFocusNavShortcutToggle = function(p1)
		-- upvalues: logToAllBackends (ref), t_3 (ref), t_7 (ref), t_5 (ref)
		logToAllBackends(t_3, t_7, t_5, p1, { action = p1.action, input_type = p1.input_type })
	end
}