local CorePackages = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local FFlagBuildExperienceInGameShell = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBuildExperienceInGameShell
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = if FFlagBuildExperienceInGameShell then require(CorePackages.Packages.Signals) else nil
local BuildExperienceModule = require(CorePackages.Workspace.Packages.BuildExperience)
local BuildModeLaunchModule = require(CorePackages.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local DisplayModule = if FFlagBuildExperienceInGameShell then require(CorePackages.Workspace.Packages.Display) else nil
local ServiceModule = require(script:FindFirstAncestor("Chrome").Service)
local ButtonVariant = require(CorePackages.Packages.Foundation).Enums.ButtonVariant

local function _(p1): boolean --[[ Line: 21 | Named "canShowAssistantBuild" ]]
	-- upvalues: BuildModeLaunchModule (copy), VRService (copy), FFlagBuildExperienceInGameShell (copy), DisplayModule (copy)
	if not BuildModeLaunchModule:hasBuildMode() or VRService.VREnabled then
		return false
	elseif FFlagBuildExperienceInGameShell then
		local DisplaySize = DisplayModule.GetDisplayStore(p1).getDisplaySize(p1)
		
		return DisplaySize == nil or DisplaySize == Enum.DisplaySize.Small
	else
		return true
	end
end

local config = {
	id = "assistant_build",
	label = "CommonUI.Features.NavBar.Build"
}
local Flag = nil

if BuildModeLaunchModule:hasBuildMode() and not VRService.VREnabled then
	if FFlagBuildExperienceInGameShell then
		local DisplaySize = DisplayModule.GetDisplayStore(false).getDisplaySize(false)
		Flag = DisplaySize == nil or DisplaySize == Enum.DisplaySize.Small
	else
		Flag = true
	end
else
	Flag = false
end
config.initialAvailability = if Flag then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable

function config:activated() --[[ Line: 38 ]]
	-- upvalues: BuildExperienceModule (copy), FFlagBuildExperienceInGameShell (copy)
	local AssistantBuildStore = BuildExperienceModule.GetAssistantBuildStore()
	
	if FFlagBuildExperienceInGameShell then
		AssistantBuildStore.activate()
		
		return
	end
	if AssistantBuildStore.getIsDisabled() then
		AssistantBuildStore.setIsDisabledTooltipOpen(not AssistantBuildStore.getIsDisabledTooltipOpen())
		
		return
	else
		AssistantBuildStore.setIsDisabledTooltipOpen(false)
		BuildExperienceModule.GetPlayButtonStore().setIsActive(true)
	end
end

config.components = {
	Icon = function(_) --[[ Line: 50 ]]
		-- upvalues: ReactModule (copy), BuildExperienceModule (copy), ButtonVariant (copy)
		return ReactModule.createElement(BuildExperienceModule.AssistantBuild, { variant = ButtonVariant.Utility })
	end
}
local RegisterResult = ServiceModule:register(config)

if FFlagBuildExperienceInGameShell then
	RegisterResult._disposeDisplaySizeEffect = SignalsModule.createEffect(function(p1) --[[ Line: 60 ]]
		-- upvalues: BuildModeLaunchModule (copy), VRService (copy), FFlagBuildExperienceInGameShell (copy), DisplayModule (copy), RegisterResult (copy)
		local Flag = nil
		if BuildModeLaunchModule:hasBuildMode() and not VRService.VREnabled then
			if FFlagBuildExperienceInGameShell then
				local DisplaySize = DisplayModule.GetDisplayStore(p1).getDisplaySize(p1)
				Flag = DisplaySize == nil or DisplaySize == Enum.DisplaySize.Small
			else
				Flag = true
			end
		else
			Flag = false
		end
		if Flag then
			RegisterResult.availability:available()
			
			return
		else
			RegisterResult.availability:unavailable()
		end
	end)
end
return RegisterResult