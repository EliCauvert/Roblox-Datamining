local screenSizeModule = require(script.ScreenSize)

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	promptInfo = require(script.PromptInfo),
	screenSize = screenSizeModule,
	ScreenSize = screenSizeModule,
	gameName = require(script.GameName),
	analyticsInfo = require(script.AnalyticsInfo)
})