local TelemetryService = game:GetService("TelemetryService")
local Parent = script:FindFirstAncestor("UiShellEvents").Parent
local TelemetryBackends = require(Parent.LoggingProtocol).TelemetryBackends
local _ = require(Parent.FocusNavigationUtils)
local config = {
	eventName = "KeyboardFocusModeEnteredCounter",
	lastUpdated = "2026-06-22",
	description = "Counts # of sessions that use keyboard mode.",
	backends = { "RobloxTelemetryCounter" }
}
local config1 = {
	eventName = "KeyboardFocusModeEnteredEvent",
	throttlingPercentage = 10000,
	lastUpdated = "2026-06-22",
	description = "Tracks % of DAUs that use keyboard mode.",
	backends = { "EventIngest" }
}
local config2 = {
	eventName = "FocusNavToggledEvent",
	links = "proto-schemas: production/eventstream/console/focus_nav_toggled.proto",
	description = "Fired when the user enters or exits focus navigation. Sent to ingest_proto.focus_nav_toggled.",
	backends = { TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("FocusNavToggledEventThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}
local config3 = {
	eventName = "ShortcutBarToggle",
	links = "proto-schemas: production/eventstream/console/shortcut_bar_toggle.proto",
	description = "Fired when focus navigation dispatches a shortcut the user pressed to a handler. Sent to ingest_proto.shortcut_bar_toggle.",
	backends = { TelemetryBackends.EventIngest },
	throttlingPercentage = game:DefineFastInt("ShortcutBarToggleThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}
local config4 = {
	eventName = "FocusNavToggledCounter",
	description = "Counts focus navigation entries and exits by entry and input type.",
	backends = { TelemetryBackends.Counter },
	lastUpdated = { 26, 10, 4 }
}
local config5 = {
	eventName = "FocusNavShortcutToggleCounter",
	description = "Counts shortcuts used in focus navigation by action and input type.",
	backends = { TelemetryBackends.Counter },
	lastUpdated = { 26, 10, 4 }
}
local config6 = {
	eventName = "FocusNavToggledPoints",
	description = "Focus navigation entries and exits with page and keyboard details, for Grafana breakdowns.",
	backends = { TelemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("FocusNavToggledPointsThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}
local config7 = {
	eventName = "FocusNavShortcutTogglePoints",
	description = "Shortcuts used in focus navigation with button and page, for Grafana breakdowns.",
	backends = { TelemetryBackends.Points },
	throttlingPercentage = game:DefineFastInt("FocusNavShortcutTogglePointsThrottleHundredthsPercent", 10000),
	lastUpdated = { 26, 10, 4 }
}

local function logToAllBackends(Config, Config1, Config2, CustomFields, CustomFields1) --[[ Line: 93 ]]
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogEvent(Config, { customFields = CustomFields })
	TelemetryService:LogEvent(Config1, { customFields = CustomFields })
	TelemetryService:LogCounter(Config2, { customFields = CustomFields1 }, 1)
end

local StandardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }

return {
	logKeyboardFocusModeEntered = function() --[[ Line: 124 ]]
		-- upvalues: TelemetryService (copy), config1 (copy), StandardizedFields (copy), config (copy)
		TelemetryService:LogEvent(config1, {
			customFields = {},
			standardizedFields = StandardizedFields
		})
		TelemetryService:LogCounter(config, {
			customFields = {},
			standardizedFields = StandardizedFields
		})
	end,
	logFocusNavToggled = function(CustomFields) --[[ Line: 105 ]]
		-- upvalues: logToAllBackends (copy), config2 (copy), config6 (copy), config4 (copy)
		logToAllBackends(config2, config6, config4, CustomFields, {
			entry = CustomFields.entry,
			input_type = CustomFields.input_type
		})
	end,
	logFocusNavShortcutToggle = function(CustomFields) --[[ Line: 112 ]]
		-- upvalues: logToAllBackends (copy), config3 (copy), config7 (copy), config5 (copy)
		logToAllBackends(config3, config7, config5, CustomFields, {
			action = CustomFields.action,
			input_type = CustomFields.input_type
		})
	end
}