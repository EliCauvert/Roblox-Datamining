local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local SettingsHubModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsHub)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local UIManager = require(CorePackages.Workspace.Packages.VrSpatialUi).UIManager
local Available = if IsSpatialFunction() then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable
local NewSignal = Signal.new()
local NewResult = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewSignal, function()
	-- upvalues: VRHub (copy)
	return VRHub.ShowTopBar
end)
VRHub.ShowTopBarChanged.Event:Connect(function()
	-- upvalues: NewSignal (copy)
	NewSignal:fire()
end)

return (ServiceModule:register({
	id = "vr_toggle_button",
	label = "Feature.Catalog.Label.Filter.Hide",
	initialAvailability = Available,
	isActivated = NewResult,
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
			-- upvalues: CommonIconModule (copy), NewResult (copy)
			return CommonIconModule("rbxasset://textures/ui/MenuBar/icon_maximize.png", "rbxasset://textures/ui/MenuBar/icon_minimize.png", NewResult)
		end
	}
}))