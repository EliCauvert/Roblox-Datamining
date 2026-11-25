local CoreGui = game:GetService("CoreGui")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local UserInputService = game:GetService("UserInputService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local InstanceSelectionShellModule = require(script.Parent.InstanceSelectionShell)

local function isTouchInput(): boolean
	-- upvalues: UserInputService (copy)
	return UserInputService.PreferredInput == Enum.PreferredInput.Touch
end

return function()
	-- upvalues: ExperienceStateCaptureService (copy), CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), FoundationModule (copy), BuildExperienceCompositionStyleSheetModule (copy), InstanceSelectionShellModule (copy), isTouchInput (copy)
	local ExperienceStateCaptureSelectionMode = Enum.ExperienceStateCaptureSelectionMode
	
	if ExperienceStateCaptureSelectionMode ~= nil then
		ExperienceStateCaptureService.SelectionMode = ExperienceStateCaptureSelectionMode.SafetyHighlightMode
	end
	if game:GetEngineFeature("ExperienceStateCaptureHiddenSelection") then
		ExperienceStateCaptureService.HiddenSelectionEnabled = true
	end
	local BuildExperienceInstanceSelection = Instance.new("ScreenGui")
	BuildExperienceInstanceSelection.Name = "BuildExperienceInstanceSelection"
	BuildExperienceInstanceSelection.ClipToDeviceSafeArea = false
	BuildExperienceInstanceSelection.DisplayOrder = 9
	BuildExperienceInstanceSelection.IgnoreGuiInset = true
	BuildExperienceInstanceSelection.ResetOnSpawn = false
	BuildExperienceInstanceSelection.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	BuildExperienceInstanceSelection.ScreenInsets = Enum.ScreenInsets.None
	BuildExperienceInstanceSelection.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BuildExperienceInstanceSelection.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(BuildExperienceInstanceSelection)
	Root:render(ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
		CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
		Shell = ReactModule.createElement(InstanceSelectionShellModule, {
			itemSelected = ExperienceStateCaptureService.ItemSelectedInCaptureMode,
			isTouchInput = isTouchInput
		})
	}))
	
	return Root
end