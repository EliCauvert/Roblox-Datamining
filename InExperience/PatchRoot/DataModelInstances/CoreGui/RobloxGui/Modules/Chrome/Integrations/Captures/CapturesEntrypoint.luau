local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local StarterGui = game:GetService("StarterGui")
local CapturesAppModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Captures.CapturesApp)
local CapturesPolicy = require(CorePackages.Workspace.Packages.CapturesInExperience).CapturesPolicy
local ServiceModule = require(Chrome.Service)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local _ = ServiceModule.AvailabilitySignal.Available
local NewResult = ChromeUtilsModule.MappedSignal.new(CapturesAppModule.onIsActiveChanged, function()
	-- upvalues: CapturesAppModule (copy)
	return CapturesAppModule.getIsActive()
end)
local RegisterResult = ServiceModule:register({
	id = "camera_entrypoint",
	label = "Feature.SettingsHub.Label.Captures",
	initialAvailability = if StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.BelowFold,
	activated = function(_)
		-- upvalues: CapturesAppModule (copy)
		CapturesAppModule.onToggleActivationFromChrome()
	end,
	isActivated = NewResult,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), NewResult (copy)
			return CommonIconModule("icons/controls/cameraOff", "icons/controls/cameraOn", NewResult)
		end
	}
})
ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.Captures)

if FFlagEnableConsoleExpControls then
	local ReadResult = CapturesPolicy.PolicyImplementation.read()
	
	if not (if ReadResult then CapturesPolicy.Mapper(ReadResult).eligibleForCapturesFeature() else false) then
		RegisterResult.availability:forceUnavailable()
	end
end
return RegisterResult