local telemetryService = game:GetService("TelemetryService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local tModule = require(parent.t)
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local hapticTriggerAttemptThrottleHundredthsPercent = game:DefineFastInt("HapticTriggerAttemptThrottleHundredthsPercent", 0)
local fFlagLuaAppFixExplicitFeedbackTelemetry = require(parent.SharedFlags).FFlagLuaAppFixExplicitFeedbackTelemetry
local var4 = tModule.interface({
	hapticType = tModule.string,
	contextKey = tModule.string,
	interactionType = tModule.string,
	ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else tModule.string
})

return function(p0, p1) --[[ line: 24 ]]
	-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (ref), discoveryEventErrorLogger (ref), var4 (ref), flaggedMutedError (ref), hapticTriggerAttemptThrottleHundredthsPercent (ref), userGameSettingsService (ref), telemetryService (ref)
	if fFlagLuaAppFixExplicitFeedbackTelemetry and not p1 then
		discoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", "event is missing context")
	end
	local var5, var6 = var4(p0)
	
	if not var5 then
		if fFlagLuaAppFixExplicitFeedbackTelemetry then
			discoveryEventErrorLogger.reportError("HapticTriggerAttemptInvalidInterface", var6)
		else
			flaggedMutedError("HapticTriggerAttemptInvalidInterface", var6)
		end
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
	p0.hapticEnabledByUser = hapticStrength > 0
	p0.hapticStrength = hapticStrength
	telemetryService:LogEvent(t, {
		eventContext = if fFlagLuaAppFixExplicitFeedbackTelemetry then p1 else nil,
		standardizedFields = list,
		customFields = p0
	})
end