local _ = require(script.Analytics.uiStatusBarTappedEvent)

return {
	["jest.config"] = script["jest.config"],
	useLogInputTypeChanged = require(script.Hooks.useLogInputTypeChanged),
	useLogFocusNavigationTelemetry = require(script.Hooks.useLogFocusNavigationTelemetry),
	useLogKeyboardFocusModeEntered = require(script.Hooks.useLogKeyboardFocusModeEntered),
	useLogOrientationChanged = require(script.Hooks.useLogOrientationChanged),
	useLogStatusBarTapped = require(script.Hooks.useLogStatusBarTapped),
	switchAccountScrimError = require(script.Analytics.switchAccountScrimError),
	createAppLaunchReactProfilerLogger = require(script.createAppLaunchReactProfilerLogger)
}