local _ = require(script.Analytics.uiStatusBarTappedEvent)

return {
	["jest.config"] = script["jest.config"],
	useLogInputTypeChanged = require(script.Hooks.useLogInputTypeChanged),
	useLogOrientationChanged = require(script.Hooks.useLogOrientationChanged),
	useLogStatusBarTapped = require(script.Hooks.useLogStatusBarTapped),
	switchAccountScrimError = require(script.Analytics.switchAccountScrimError),
	createAppLaunchReactProfilerLogger = require(script.createAppLaunchReactProfilerLogger)
}