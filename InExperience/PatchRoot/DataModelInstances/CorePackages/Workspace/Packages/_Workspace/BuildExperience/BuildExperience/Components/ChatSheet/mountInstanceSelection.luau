local coreGuiService = game:GetService("CoreGui")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local userInputService = game:GetService("UserInputService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local instanceSelectionShellModule = require(script.Parent.InstanceSelectionShell)

local function isTouchInput()
	-- upvalues: userInputService (ref)
	return userInputService.PreferredInput == Enum.PreferredInput.Touch
end

return function()
	-- upvalues: experienceStateCaptureService (ref), coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), instanceSelectionShellModule (ref), isTouchInput (ref)
	local experienceStateCaptureSelectionMode = Enum.ExperienceStateCaptureSelectionMode
	
	if experienceStateCaptureSelectionMode ~= nil then
		experienceStateCaptureService.SelectionMode = experienceStateCaptureSelectionMode.SafetyHighlightMode
	end
	if game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
		experienceStateCaptureService.HiddenSelectionEnabled = true
	end
	local buildExperienceInstanceSelection = Instance.new("ScreenGui")
	buildExperienceInstanceSelection.Name = "BuildExperienceInstanceSelection"
	buildExperienceInstanceSelection.ClipToDeviceSafeArea = false
	buildExperienceInstanceSelection.DisplayOrder = 9
	buildExperienceInstanceSelection.IgnoreGuiInset = true
	buildExperienceInstanceSelection.ResetOnSpawn = false
	buildExperienceInstanceSelection.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	buildExperienceInstanceSelection.ScreenInsets = Enum.ScreenInsets.None
	buildExperienceInstanceSelection.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceInstanceSelection.Parent = coreGuiService
	local var1 = reactRobloxModule.createRoot(buildExperienceInstanceSelection)
	var1:render(reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Shell = reactModule.createElement(instanceSelectionShellModule, {
			itemSelected = experienceStateCaptureService.ItemSelectedInCaptureMode,
			isTouchInput = isTouchInput
		})
	}))
	
	return var1
end