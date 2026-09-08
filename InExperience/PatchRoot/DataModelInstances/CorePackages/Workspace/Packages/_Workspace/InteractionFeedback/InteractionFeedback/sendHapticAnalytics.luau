local telemetryService = game:GetService("TelemetryService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local tModule = require(parent.t)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local hapticTriggerAttemptThrottleHundredthsPercent = game:DefineFastInt("HapticTriggerAttemptThrottleHundredthsPercent", 0)
local var1 = tModule.interface({
	hapticType = tModule.string,
	contextKey = tModule.string,
	interactionType = tModule.string
})

return function(p1, p2)
	-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), hapticTriggerAttemptThrottleHundredthsPercent (ref), userGameSettingsService (ref), telemetryService (ref)
	if not p2 then
		discoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", "event is missing context")
	end
	local var2, var3 = var1(p1)
	
	if not var2 then
		discoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", var3)
	end
	local t = {
		eventName = "hapticTriggerAttempt",
		description = "User has taken an action that may have triggered haptic feedback",
		backends = { "EventIngest" },
		throttlingPercentage = hapticTriggerAttemptThrottleHundredthsPercent,
		lastUpdated = { 25, 10, 21 }
	}
	local list = { "addOSInfo", "addSessionInfo" }
	local hapticStrength = userGameSettingsService.HapticStrength
	p1.hapticEnabledByUser = hapticStrength > 0
	p1.hapticStrength = hapticStrength
	telemetryService:LogEvent(t, {
		eventContext = p2,
		standardizedFields = list,
		customFields = p1
	})
end