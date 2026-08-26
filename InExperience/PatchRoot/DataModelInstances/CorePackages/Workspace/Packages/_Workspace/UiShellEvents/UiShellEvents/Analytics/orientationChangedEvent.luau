local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local parent = uiShellEvents.Parent
local loggerModule = require(uiShellEvents.Logger)
local tModule = require(parent.t)
local _ = require(parent.RobloxAppEnums)
local orientationUseTelemetryService = game:DefineFastFlag("OrientationUseTelemetryService", false)
local var1 = if orientationUseTelemetryService then game:GetService("TelemetryService") else nil
local var2 = tModule.strictInterface({
	deviceOrientation = tModule.string,
	experienceOrientation = tModule.optional(tModule.string),
	page = tModule.optional(tModule.string),
	viewportX = tModule.number,
	viewportY = tModule.number,
	universeId = tModule.optional(tModule.string),
	l2a_session_id = tModule.optional(tModule.string),
	l2b_session_id = tModule.optional(tModule.string),
	l2a_session_tag = tModule.optional(tModule.string),
	l2b_session_tag = tModule.optional(tModule.string)
})
game:DefineFastInt("UiShellOrientationChangedThrottleHundredthsPercent", 10000)
local t = {
	eventName = "uiShellOrientationChanged",
	description = "Fired when device or app orientation changes on mobile.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("UiShellOrientationChangedThrottleHundredthsPercent"),
	lastUpdated = { 2026, 5, 6 }
}

return function(p1, p2, p3)
	-- upvalues: var2 (ref), loggerModule (ref), orientationUseTelemetryService (ref), var1 (ref), t (ref)
	local var3, var4 = var2(p3)
	
	if not var3 then
		loggerModule:error(var4)
	end
	if orientationUseTelemetryService and var1 then
		var1:LogEvent(t, {
			eventContext = p2,
			customFields = p3,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" }
		})
		
		return
	end
	p1:sendEventDeferred(p2, "uiShellOrientationChanged", p3)
end