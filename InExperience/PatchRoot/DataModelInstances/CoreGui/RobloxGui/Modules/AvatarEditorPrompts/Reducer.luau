local ScreenSizeModule = require(script.ScreenSize)

return (require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	promptInfo = require(script.PromptInfo),
	screenSize = ScreenSizeModule,
	ScreenSize = ScreenSizeModule,
	gameName = require(script.GameName),
	analyticsInfo = require(script.AnalyticsInfo)
}))