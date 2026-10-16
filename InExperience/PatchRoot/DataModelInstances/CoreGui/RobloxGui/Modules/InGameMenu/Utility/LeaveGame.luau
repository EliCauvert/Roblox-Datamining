local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local GetDefaultQualityLevelFunction = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)

return function() --[[ Line: 12 ]]
	-- upvalues: SendAnalyticsModule (copy), ConstantsModule (copy), GuiService (copy), RunService (copy), GetDefaultQualityLevelFunction (copy)
	SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, ConstantsModule.AnalyticsLeaveGameName, { confirmed = ConstantsModule.AnalyticsConfirmedName })
	GuiService.SelectedCoreObject = nil
	RunService.RenderStepped:Wait()
	RunService.RenderStepped:Wait()
	game:Shutdown()
	settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
end