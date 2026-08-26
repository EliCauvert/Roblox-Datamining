local telemetryService = game:GetService("TelemetryService")
local standardFieldEnumModule = require(script.Parent.StandardFieldEnum)
local helpPageThrottleHundredthsPercent = game:DefineFastInt("HelpPageThrottleHundredthsPercent", 0)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

t.telemetryConfigs = {
	helpPageInteraction = {
		eventConfig = {
			eventName = "ingame_menu_action",
			description = "[[Event to track input type and screen orientation for the help page.]]",
			backends = { "EventIngest" },
			throttlingPercentage = helpPageThrottleHundredthsPercent,
			lastUpdated = { 2025, 8, 25 }
		},
		standardizedFields = {
			standardFieldEnumModule.addUniverseId,
			standardFieldEnumModule.addPlaySessionId,
			standardFieldEnumModule.addPlaceId,
			standardFieldEnumModule.addSessionInfo
		}
	}
}

function t.logHelpPageInteraction(_, p1, p2)
	-- upvalues: t (ref), telemetryService (ref)
	telemetryService:LogEvent(t.telemetryConfigs.helpPageInteraction.eventConfig, {
		eventContext = p1,
		standardizedFields = t.telemetryConfigs.helpPageInteraction.standardizedFields,
		customFields = p2
	})
end

t.default = t.new()

return t