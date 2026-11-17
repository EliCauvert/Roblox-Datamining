local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local StarterGui = game:GetService("StarterGui")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local CapturesAppModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Captures.CapturesApp)
local CapturesPolicy = require(CorePackages.Workspace.Packages.CapturesInExperience).CapturesPolicy
local ServiceModule = require(Chrome.Service)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagUseUIOverlayForCloudPlay = SharedFlagsModule.FFlagUseUIOverlayForCloudPlay
local FFlagAllowGrayUnsupportedFeatures = SharedFlagsModule.FFlagAllowGrayUnsupportedFeatures
local InExperienceCloudPlayModule = require(CorePackages.Workspace.Packages.InExperienceCloudPlay)
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu
local ChromeModule = require(CorePackages.Workspace.Packages.Chrome)
local SideSheetOpenBehavior = ChromeModule.Enums.SideSheetOpenBehavior
local SideSheetPlacement = ChromeModule.Enums.SideSheetPlacement
local _ = ServiceModule.AvailabilitySignal.Available
local Available = if StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Captures) then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable
local CloudClientService = if FFlagUseUIOverlayForCloudPlay and FFlagAllowGrayUnsupportedFeatures then InExperienceCloudPlayModule.getCloudClientService() else nil
local IsCloudClient = CloudClientService ~= nil and CloudClientService.IsCloudClient

local function showUnsupportedSnackbar()
	-- upvalues: InExperienceCloudPlayModule (copy)
	InExperienceCloudPlayModule.showUnsupportedFeatureSnackbar("Captures")
end

local NewResult = ChromeUtilsModule.MappedSignal.new(CapturesAppModule.onIsActiveChanged, function()
	-- upvalues: CapturesAppModule (copy)
	return CapturesAppModule.getIsActive()
end)
local RegisterResult = ServiceModule:register({
	id = "camera_entrypoint",
	label = "Feature.SettingsHub.Label.Captures",
	initialAvailability = Available,
	sideSheetPlacement = SideSheetPlacement.BelowFold,
	sideSheetOpenBehavior = if FFlagKeepSideSheetOpenBesideMenu then SideSheetOpenBehavior.CloseSheet else nil,
	activated = function(_)
		-- upvalues: CapturesAppModule (copy)
		CapturesAppModule.onToggleActivationFromChrome()
	end,
	disabledActivated = if IsCloudClient then showUnsupportedSnackbar else nil,
	isActivated = NewResult,
	isDisabled = if IsCloudClient then true else nil,
	components = {
		Icon = function(_)
			-- upvalues: CommonIconModule (copy), NewResult (copy)
			return CommonIconModule("icons/controls/cameraOff", "icons/controls/cameraOn", NewResult)
		end
	}
})
ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.Captures)

if FFlagEnableConsoleExpControls and not IsCloudClient then
	local ReadResult = CapturesPolicy.PolicyImplementation.read()
	
	if not (if ReadResult then CapturesPolicy.Mapper(ReadResult).eligibleForCapturesFeature() else false) then
		RegisterResult.availability:forceUnavailable()
	end
end
return RegisterResult