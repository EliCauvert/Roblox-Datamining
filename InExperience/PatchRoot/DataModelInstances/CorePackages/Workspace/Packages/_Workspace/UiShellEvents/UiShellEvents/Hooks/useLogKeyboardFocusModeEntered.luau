local parent = script:FindFirstAncestor("UiShellEvents").Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local telemetryService = game:GetService("TelemetryService")
local t = {
	eventName = "KeyboardFocusModeEnteredCounter",
	lastUpdated = "2026-06-22",
	description = "Counts # of sessions that use keyboard mode.",
	backends = { "RobloxTelemetryCounter" }
}
local t_1 = {
	eventName = "KeyboardFocusModeEnteredEvent",
	throttlingPercentage = 10000,
	lastUpdated = "2026-06-22",
	description = "Tracks % of DAUs that use keyboard mode.",
	backends = { "EventIngest" }
}

return function()
	-- upvalues: focusNavigationUtilsModule (ref), reactModule (ref), telemetryService (ref), t_1 (ref), t (ref)
	local var1 = focusNavigationUtilsModule.useLastInputMode()
	local var2 = focusNavigationUtilsModule.useLastInputMethod()
	local var3 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref), var2 (ref), telemetryService (copy), t_1 (copy), t (copy)
		if not var3.current and var1 == "Focus" and var2 == "Keyboard" then
			var3.current = true
			telemetryService:LogEvent(t_1, {
				customFields = {},
				standardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }
			})
			telemetryService:LogCounter(t, {
				customFields = {},
				standardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }
			})
		end
	end, { var1, var2 })
end