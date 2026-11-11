local TelemetryService = game:GetService("TelemetryService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("InteractionFeedback").Parent
local TModule = require(Parent.t)
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local HapticTriggerAttemptThrottleHundredthsPercent = game:DefineFastInt("HapticTriggerAttemptThrottleHundredthsPercent", 0)
local FFlagLuaAppFixExplicitFeedbackTelemetry = require(Parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local InterfaceResult = TModule.interface({
	hapticType = TModule.string,
	contextKey = TModule.string,
	interactionType = TModule.string,
	ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else TModule.string
})

return function(CustomFields, p1)
	-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (copy), DiscoveryEventErrorLogger (copy), InterfaceResult (copy), FlaggedMutedErrorFunction (copy), HapticTriggerAttemptThrottleHundredthsPercent (copy), UserGameSettings (copy), TelemetryService (copy)
	if FFlagLuaAppFixExplicitFeedbackTelemetry and not p1 then
		DiscoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", "event is missing context")
	end
	local InterfaceResultResult, InterfaceResultResult2 = InterfaceResult(CustomFields)
	
	if not InterfaceResultResult then
		if FFlagLuaAppFixExplicitFeedbackTelemetry then
			DiscoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", InterfaceResultResult2)
		else
			FlaggedMutedErrorFunction("HapticTriggerAttemptInvalidInterface", InterfaceResultResult2)
		end
	end
	local config = {
		eventName = "hapticTriggerAttempt",
		description = "User has taken an action that may have triggered haptic feedback",
		backends = { "EventIngest" },
		throttlingPercentage = HapticTriggerAttemptThrottleHundredthsPercent,
		lastUpdated = { 25, 10, 21 }
	}
	local HapticStrength: number = UserGameSettings.HapticStrength
	CustomFields.hapticEnabledByUser = HapticStrength > 0
	CustomFields.hapticStrength = HapticStrength
	TelemetryService:LogEvent(config, {
		eventContext = if FFlagLuaAppFixExplicitFeedbackTelemetry then p1 else nil,
		standardizedFields = { "addOSInfo", "addSessionInfo" },
		customFields = CustomFields
	})
end