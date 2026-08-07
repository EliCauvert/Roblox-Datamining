local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local parent = uiShellEvents.Parent
local loggerModule = require(uiShellEvents.Logger)
local tModule = require(parent.t)
local _ = require(parent.RobloxAppEnums)
local orientationUseTelemetryService = game:DefineFastFlag("OrientationUseTelemetryService", false)
local var4 = if orientationUseTelemetryService then game:GetService("TelemetryService") else nil
local var5 = tModule.strictInterface({
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

return function(p0, p1, p2) --[[ line: 50 ]]
	-- upvalues: var5 (ref), loggerModule (ref), orientationUseTelemetryService (ref), var4 (ref), t (ref)
	local var7, var8 = var5(p2)
	
	if not var7 then
		loggerModule:error(var8)
	end
	if orientationUseTelemetryService and var4 then
		var4:LogEvent(t, {
			eventContext = p1,
			customFields = p2,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" }
		})
		
		return
	end
	p0:sendEventDeferred(p1, "uiShellOrientationChanged", p2)
end