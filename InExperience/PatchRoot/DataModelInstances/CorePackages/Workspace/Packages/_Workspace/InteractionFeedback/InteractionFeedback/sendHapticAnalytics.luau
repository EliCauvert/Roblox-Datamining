local TelemetryService = game:GetService("TelemetryService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("InteractionFeedback").Parent
local TModule = require(Parent.t)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local HapticTriggerAttemptThrottleHundredthsPercent = game:DefineFastInt("HapticTriggerAttemptThrottleHundredthsPercent", 0)
local InterfaceResult = TModule.interface({
	hapticType = TModule.string,
	contextKey = TModule.string,
	interactionType = TModule.string
})

return function(CustomFields, EventContext)
	-- upvalues: DiscoveryEventErrorLogger (copy), InterfaceResult (copy), HapticTriggerAttemptThrottleHundredthsPercent (copy), UserGameSettings (copy), TelemetryService (copy)
	if not EventContext then
		DiscoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", "event is missing context")
	end
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(CustomFields)
	
	if not InterfaceResultResult then
		DiscoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", InterfaceResultResult2)
	end
	local config = {
		eventName = "hapticTriggerAttempt",
		description = "User has taken an action that may have triggered haptic feedback",
		backends = { "EventIngest" },
		throttlingPercentage = HapticTriggerAttemptThrottleHundredthsPercent,
		lastUpdated = { 25, 10, 21 }
	}
	local StandardizedFields = { "addOSInfo", "addSessionInfo" }
	local HapticStrength: number = UserGameSettings.HapticStrength
	CustomFields.hapticEnabledByUser = HapticStrength > 0
	CustomFields.hapticStrength = HapticStrength
	TelemetryService:LogEvent(config, {
		eventContext = EventContext,
		standardizedFields = StandardizedFields,
		customFields = CustomFields
	})
end