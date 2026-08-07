local chrome = script:FindFirstAncestor("Chrome")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local starterGuiService = game:GetService("StarterGui")
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local capturesAppModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.Captures.CapturesApp)
local capturesPolicy = require(corePackagesService.Workspace.Packages.CapturesInExperience).CapturesPolicy
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local mappedSignal = chromeUtilsModule.MappedSignal
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local _ = serviceModule.AvailabilitySignal.Available
local var9 = mappedSignal.new(capturesAppModule.onIsActiveChanged, function() --[[ line: 28 ]]
	-- upvalues: capturesAppModule (ref)
	return capturesAppModule.getIsActive()
end)
local var10 = serviceModule:register({
	id = "camera_entrypoint",
	label = "Feature.SettingsHub.Label.Captures",
	initialAvailability = if starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	sideSheetPlacement = sideSheetPlacement.Page,
	activated = function(_) --[[ line: 37 ]]
		-- upvalues: capturesAppModule (ref)
		capturesAppModule.onToggleActivationFromChrome()
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then var9 else function() --[[ line: 42 ]]
		-- upvalues: var9 (ref)
		return var9:get()
	end,
	components = {
		Icon = function(_) --[[ line: 46 ]]
			-- upvalues: commonIconModule (ref), var9 (ref)
			return commonIconModule("icons/controls/cameraOff", "icons/controls/cameraOn", var9)
		end
	}
})
chromeUtilsModule.setCoreGuiAvailability(var10, Enum.CoreGuiType.Captures)

if fFlagEnableConsoleExpControls then
	local var11 = capturesPolicy.PolicyImplementation.read()
	
	if not (if var11 then capturesPolicy.Mapper(var11).eligibleForCapturesFeature() else false) then
		var10.availability:forceUnavailable()
	end
end
return var10