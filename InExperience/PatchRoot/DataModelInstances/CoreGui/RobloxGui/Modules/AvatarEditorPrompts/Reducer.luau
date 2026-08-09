local corePackagesService = game:GetService("CorePackages")
local screenSizeModule = require(script.ScreenSize)

return require(corePackagesService.Packages.Rodux).combineReducers({
	promptInfo = require(script.PromptInfo),
	screenSize = screenSizeModule,
	ScreenSize = if require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE then screenSizeModule else nil,
	gameName = require(script.GameName),
	analyticsInfo = require(script.AnalyticsInfo)
})