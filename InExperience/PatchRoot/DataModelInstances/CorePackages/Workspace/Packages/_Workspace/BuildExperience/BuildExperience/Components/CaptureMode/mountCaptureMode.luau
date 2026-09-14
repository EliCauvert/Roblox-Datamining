local coreGuiService = game:GetService("CoreGui")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local captureModeContainerModule = require(script.Parent.CaptureModeContainer)
local captureModeProtocolModule = require(script.Parent.CaptureModeProtocol)

return function()
	-- upvalues: captureModeProtocolModule (ref), coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), captureModeContainerModule (ref)
	captureModeProtocolModule.configureCaptureMode()
	local buildExperienceCaptureMode = Instance.new("ScreenGui")
	buildExperienceCaptureMode.Name = "BuildExperienceCaptureMode"
	buildExperienceCaptureMode.DisplayOrder = 10
	buildExperienceCaptureMode.IgnoreGuiInset = false
	buildExperienceCaptureMode.ResetOnSpawn = false
	buildExperienceCaptureMode.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceCaptureMode.Parent = coreGuiService
	local var1 = reactRobloxModule.createRoot(buildExperienceCaptureMode)
	var1:render(reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		CaptureMode = reactModule.createElement(captureModeContainerModule)
	}))
	
	return var1
end