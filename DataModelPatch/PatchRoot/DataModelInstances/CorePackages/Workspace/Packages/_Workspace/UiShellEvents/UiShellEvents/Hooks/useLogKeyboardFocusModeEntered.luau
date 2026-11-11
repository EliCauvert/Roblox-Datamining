local Parent = script:FindFirstAncestor("UiShellEvents").Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local TelemetryService = game:GetService("TelemetryService")
local config = {
	eventName = "KeyboardFocusModeEnteredCounter",
	lastUpdated = "2026-06-22",
	description = "Counts # of sessions that use keyboard mode.",
	backends = { "RobloxTelemetryCounter" }
}
local config1 = {
	eventName = "KeyboardFocusModeEnteredEvent",
	throttlingPercentage = 10000,
	lastUpdated = "2026-06-22",
	description = "Tracks % of DAUs that use keyboard mode.",
	backends = { "EventIngest" }
}

return function()
	-- upvalues: FocusNavigationUtilsModule (copy), ReactModule (copy), TelemetryService (copy), config1 (copy), config (copy)
	local UseLastInputModeResult = FocusNavigationUtilsModule.useLastInputMode()
	local UseLastInputResult = FocusNavigationUtilsModule.useLastInputMethod()
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseLastInputModeResult (copy), UseLastInputResult (copy), TelemetryService (upval), config1 (upval), config (upval)
		if not UseRefResult.current and UseLastInputModeResult == "Focus" and UseLastInputResult == "Keyboard" then
			UseRefResult.current = true
			TelemetryService:LogEvent(config1, {
				customFields = {},
				standardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }
			})
			TelemetryService:LogCounter(config, {
				customFields = {},
				standardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }
			})
		end
	end, { UseLastInputModeResult, UseLastInputResult })
end