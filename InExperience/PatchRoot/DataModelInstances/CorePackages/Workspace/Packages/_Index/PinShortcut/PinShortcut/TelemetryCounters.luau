local loggingProtocolModule = require(script:FindFirstAncestor("PinShortcut").Parent.LoggingProtocol)
local pinShortcutSnackbarTelemetryThrottleHundredthsPercent = game:DefineFastInt("PinShortcutSnackbarTelemetryThrottleHundredthsPercent", 0)

return {
	SnackbarButtonPressed = {
		eventName = "PinShortcut_SnackbarButtonPressed",
		description = "Counter fired when a snackbar action button is pressed. The \"action\" field distinguishes TryAgain and ViewShortcut.",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 17 },
		throttlingPercentage = pinShortcutSnackbarTelemetryThrottleHundredthsPercent
	},
	SnackbarShown = {
		eventName = "PinShortcut_SnackbarShown",
		description = "Counter fired when the pin-experience result snackbar is displayed. The \"action\" field distinguishes Success, Failure, and AlreadyExists.",
		links = "",
		backends = { loggingProtocolModule.TelemetryBackends.Counter },
		lastUpdated = { 2026, 9, 17 },
		throttlingPercentage = pinShortcutSnackbarTelemetryThrottleHundredthsPercent
	}
}