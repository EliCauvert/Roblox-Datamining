local CorePackages = game:GetService("CorePackages")
local ScreenSizeModule = require(script.ScreenSize)

return (require(CorePackages.Packages.Rodux).combineReducers({
	promptInfo = require(script.PromptInfo),
	screenSize = ScreenSizeModule,
	ScreenSize = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE then ScreenSizeModule else nil,
	gameName = require(script.GameName),
	analyticsInfo = require(script.AnalyticsInfo)
}))