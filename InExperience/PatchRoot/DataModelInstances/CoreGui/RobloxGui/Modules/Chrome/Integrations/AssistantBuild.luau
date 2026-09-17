local var1
local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local VRService = game:GetService("VRService")
local fFlagBuildExperienceInGameShell = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBuildExperienceInGameShell
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local var2 = if fFlagBuildExperienceInGameShell then require(corePackagesService.Packages.Signals) else nil
local buildExperienceModule = require(corePackagesService.Workspace.Packages.BuildExperience)
local buildModeLaunchModule = require(corePackagesService.Workspace.Packages.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local var3 = if fFlagBuildExperienceInGameShell then require(corePackagesService.Workspace.Packages.Display) else nil
local serviceModule = require(chrome.Service)
local buttonVariant = foundationModule.Enums.ButtonVariant

local function _(p1)
	-- upvalues: buildModeLaunchModule (ref), VRService (ref), fFlagBuildExperienceInGameShell (ref), var3 (ref)
	if not buildModeLaunchModule:hasBuildMode() or VRService.VREnabled then
		return false
	elseif not fFlagBuildExperienceInGameShell then
		return true
	end
	local displaySize = var3.GetDisplayStore(p1).getDisplaySize(p1)
	
	return if displaySize ~= nil then displaySize == Enum.DisplaySize.Small else true
end

local t = {
	id = "assistant_build",
	label = "CommonUI.Features.NavBar.Build"
}

if not buildModeLaunchModule:hasBuildMode() or VRService.VREnabled then
	var1 = false
elseif fFlagBuildExperienceInGameShell then
	local displaySize = var3.GetDisplayStore(false).getDisplaySize(false)
	var1 = if displaySize ~= nil then displaySize == Enum.DisplaySize.Small else true
else
	var1 = true
end
t.initialAvailability = if var1 then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable

function t.activated(_)
	-- upvalues: buildExperienceModule (ref), fFlagBuildExperienceInGameShell (ref)
	local assistantBuildStore = buildExperienceModule.GetAssistantBuildStore()
	
	if fFlagBuildExperienceInGameShell then
		assistantBuildStore.activate()
		
		return
	elseif assistantBuildStore.getIsDisabled() then
		assistantBuildStore.setIsDisabledTooltipOpen(not assistantBuildStore.getIsDisabledTooltipOpen())
		
		return
	end
	assistantBuildStore.setIsDisabledTooltipOpen(false)
	buildExperienceModule.GetPlayButtonStore().setIsActive(true)
end

t.components = {
	Icon = function(_)
		-- upvalues: reactModule (ref), buildExperienceModule (ref), buttonVariant (ref)
		return reactModule.createElement(buildExperienceModule.AssistantBuild, { variant = buttonVariant.Utility })
	end
}
local var4 = serviceModule:register(t)

if fFlagBuildExperienceInGameShell then
	var4._disposeDisplaySizeEffect = var2.createEffect(function(p1)
		-- upvalues: buildModeLaunchModule (ref), VRService (ref), fFlagBuildExperienceInGameShell (ref), var3 (ref), var4 (ref)
		local var5
		if not buildModeLaunchModule:hasBuildMode() or VRService.VREnabled then
			var5 = false
		elseif fFlagBuildExperienceInGameShell then
			local displaySize = var3.GetDisplayStore(p1).getDisplaySize(p1)
			var5 = if displaySize ~= nil then displaySize == Enum.DisplaySize.Small else true
		else
			var5 = true
		end
		if var5 then
			var4.availability:available()
			
			return
		end
		var4.availability:unavailable()
	end)
end
return var4