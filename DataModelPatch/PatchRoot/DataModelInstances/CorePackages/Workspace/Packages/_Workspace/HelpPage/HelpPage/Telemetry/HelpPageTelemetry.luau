local TelemetryService = game:GetService("TelemetryService")
local StandardFieldEnumModule = require(script.Parent.StandardFieldEnum)
local HelpPageThrottleHundredthsPercent = game:DefineFastInt("HelpPageThrottleHundredthsPercent", 0)
local HelpPageTelemetryModule = {}
HelpPageTelemetryModule.__index = HelpPageTelemetryModule

function HelpPageTelemetryModule.new()
	-- upvalues: HelpPageTelemetryModule (copy)
	return (setmetatable({}, HelpPageTelemetryModule))
end

HelpPageTelemetryModule.telemetryConfigs = {
	helpPageInteraction = {
		eventConfig = {
			eventName = "ingame_menu_action",
			description = "[[Event to track input type and screen orientation for the help page.]]",
			backends = { "EventIngest" },
			throttlingPercentage = HelpPageThrottleHundredthsPercent,
			lastUpdated = { 2025, 8, 25 }
		},
		standardizedFields = {
			StandardFieldEnumModule.addUniverseId,
			StandardFieldEnumModule.addPlaySessionId,
			StandardFieldEnumModule.addPlaceId,
			StandardFieldEnumModule.addSessionInfo
		}
	}
}

function HelpPageTelemetryModule:logHelpPageInteraction(EventContext, CustomFields)
	-- upvalues: HelpPageTelemetryModule (copy), TelemetryService (copy)
	TelemetryService:LogEvent(HelpPageTelemetryModule.telemetryConfigs.helpPageInteraction.eventConfig, {
		eventContext = EventContext,
		standardizedFields = HelpPageTelemetryModule.telemetryConfigs.helpPageInteraction.standardizedFields,
		customFields = CustomFields
	})
end

HelpPageTelemetryModule.default = HelpPageTelemetryModule.new()

return HelpPageTelemetryModule