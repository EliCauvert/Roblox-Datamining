local runService = game:GetService("RunService")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local getDefaultQualityLevel = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)

return function() --[[ line: 12 ]]
	-- upvalues: sendAnalyticsModule (ref), constantsModule (ref), guiService (ref), runService (ref), getDefaultQualityLevel (ref)
	sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, constantsModule.AnalyticsLeaveGameName, { confirmed = constantsModule.AnalyticsConfirmedName })
	guiService.SelectedCoreObject = nil
	runService.RenderStepped:Wait()
	runService.RenderStepped:Wait()
	game:Shutdown()
	settings().Rendering.QualityLevel = getDefaultQualityLevel()
end