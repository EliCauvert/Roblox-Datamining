local _ = require(script.Components.AppNavItem)

return {
	Placement = require(script.Enum.Placement),
	AppNavBar = require(script.Components.AppNavBar),
	StudioCTAIcon = require(script.Components.StudioCTAIcon),
	useNavBarPlacement = require(script.Hooks.useNavBarPlacement),
	useNavBarSize = require(script.Hooks.useNavBarSize),
	VisibilityControl = require(script.VisibilityControl),
	Constants = require(script.Constants),
	Mocks = require(script.Mocks),
	getScrollAwayEnabled = require(script.getScrollAwayEnabled),
	getAppNavRootName = require(script.Utils.getAppNavRootName),
	getAppNavCurrentPage = require(script.Utils.getAppNavCurrentPage),
	AppNavTelemetry = require(script.Telemetry.AppNavTelemetry),
	["jest.config"] = script["jest.config"]
}