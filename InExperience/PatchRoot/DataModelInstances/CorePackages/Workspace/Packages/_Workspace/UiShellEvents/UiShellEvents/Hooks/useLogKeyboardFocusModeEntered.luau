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
	local var5 = focusNavigationUtilsModule.useLastInputMode()
	local var6 = focusNavigationUtilsModule.useLastInputMethod()
	local var7 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var5 (ref), var6 (ref), telemetryService (copy), t_1 (copy), t (copy)
		if not var7.current and var5 == "Focus" and var6 == "Keyboard" then
			var7.current = true
			telemetryService:LogEvent(t_1, {
				customFields = {},
				standardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }
			})
			telemetryService:LogCounter(t, {
				customFields = {},
				standardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }
			})
		end
	end, { var5, var6 })
end