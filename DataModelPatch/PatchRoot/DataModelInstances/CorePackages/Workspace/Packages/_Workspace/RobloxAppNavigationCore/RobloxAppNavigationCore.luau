return {
	AndroidTVExitButtonManager = require(script.AndroidTVExitButtonManager),
	AppReadyHandler = require(script.AppReadyHandler),
	createRootNavigator = require(script.Navigators.createRootNavigator),
	RnBypassAdapter = require(script.RnBypassAdapter),
	AppStackView = require(script.Views.AppStackView),
	AppSwitchView = require(script.Views.AppSwitchView),
	AppCard = require(script.Views.AppCard),
	createLazySwitchRouter = require(script.Routers.createLazySwitchRouter),
	["jest.config"] = script["jest.config"]
}