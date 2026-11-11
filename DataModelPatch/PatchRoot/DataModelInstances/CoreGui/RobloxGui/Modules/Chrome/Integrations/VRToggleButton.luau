local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local SettingsHubModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsHub)
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local FFlagChromeActivatedMappedSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local UIManager = require(CorePackages.Workspace.Packages.VrSpatialUi).UIManager
local Available = if require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial() then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable
local NewResult = require(CorePackages.Workspace.Packages.AppCommonLib).Signal.new()
local NewResult1 = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewResult, function()
	-- upvalues: VRHub (copy)
	return VRHub.ShowTopBar
end)
VRHub.ShowTopBarChanged.Event:Connect(function()
	-- upvalues: NewResult (copy)
	NewResult:fire()
end)

return (ServiceModule:register({
	id = "vr_toggle_button",
	label = "Feature.Catalog.Label.Filter.Hide",
	initialAvailability = Available,
	isActivated = if FFlagChromeActivatedMappedSignal then NewResult1 else function()
		-- upvalues: NewResult1 (copy)
		return NewResult1:get()
	end,
	activated = function()
		-- upvalues: VRHub (copy), UIManager (copy), SettingsHubModule (copy), RbxAnalyticsService (copy)
		if VRHub.ShowTopBar then
			UIManager.getInstance():prepareGuiToggleAnimationState()
			VRHub:SetShowTopBar(false)
			
			if SettingsHubModule:GetVisibility() then
				SettingsHubModule:ToggleVisibility()
			end
		else
			VRHub:SetShowTopBar(true)
		end
		RbxAnalyticsService:ReportCounter("VR-BottomBar-ToggleGui")
	end,
	components = {
		Icon = function()
			-- upvalues: CommonIconModule (copy), NewResult1 (copy)
			return CommonIconModule("rbxasset://textures/ui/MenuBar/icon_maximize.png", "rbxasset://textures/ui/MenuBar/icon_minimize.png", NewResult1)
		end
	}
}))