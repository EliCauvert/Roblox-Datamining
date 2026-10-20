local UiShellEvents = script:FindFirstAncestor("UiShellEvents")
local Parent = UiShellEvents.Parent
local LoggerModule = require(UiShellEvents.Logger)
local TModule = require(Parent.t)
local _ = require(Parent.RobloxAppEnums)
local OrientationUseTelemetryService = game:DefineFastFlag("OrientationUseTelemetryService", false)
local TelemetryService = if OrientationUseTelemetryService then game:GetService("TelemetryService") else nil
local StrictInterfaceResult = TModule.strictInterface({
	deviceOrientation = TModule.string,
	experienceOrientation = TModule.optional(TModule.string),
	page = TModule.optional(TModule.string),
	viewportX = TModule.number,
	viewportY = TModule.number,
	universeId = TModule.optional(TModule.string),
	l2a_session_id = TModule.optional(TModule.string),
	l2b_session_id = TModule.optional(TModule.string),
	l2a_session_tag = TModule.optional(TModule.string),
	l2b_session_tag = TModule.optional(TModule.string)
})
game:DefineFastInt("UiShellOrientationChangedThrottleHundredthsPercent", 10000)
local config = {
	eventName = "uiShellOrientationChanged",
	description = "Fired when device or app orientation changes on mobile.",
	links = "",
	backends = { "EventIngest" },
	throttlingPercentage = game:GetFastInt("UiShellOrientationChangedThrottleHundredthsPercent"),
	lastUpdated = { 2026, 5, 6 }
}

return function(p1, EventContext, CustomFields)
	-- upvalues: StrictInterfaceResult (copy), LoggerModule (copy), OrientationUseTelemetryService (copy), TelemetryService (copy), config (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(CustomFields)
	
	if not StrictInterfaceResultResult then
		LoggerModule:error(StrictInterfaceResultResult2)
	end
	if OrientationUseTelemetryService and TelemetryService then
		TelemetryService:LogEvent(config, {
			eventContext = EventContext,
			customFields = CustomFields,
			standardizedFields = { "addSessionInfo", "addSessionId", "addOSInfo" }
		})
		
		return
	else
		p1:sendEventDeferred(EventContext, "uiShellOrientationChanged", CustomFields)
	end
end