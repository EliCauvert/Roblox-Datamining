local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local settingsHubModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsHub)
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local UIManager = require(corePackagesService.Workspace.Packages.VrSpatialUi).UIManager
local var1 = if isSpatial() then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable
local var2 = signal.new()
local var3 = mappedSignal.new(var2, function()
	-- upvalues: VRHub (ref)
	return VRHub.ShowTopBar
end)
VRHub.ShowTopBarChanged.Event:Connect(function()
	-- upvalues: var2 (ref)
	var2:fire()
end)

return serviceModule:register({
	id = "vr_toggle_button",
	label = "Feature.Catalog.Label.Filter.Hide",
	initialAvailability = var1,
	isActivated = var3,
	activated = function()
		-- upvalues: VRHub (ref), UIManager (ref), settingsHubModule (ref), rbxAnalyticsService (ref)
		if VRHub.ShowTopBar then
			UIManager.getInstance():prepareGuiToggleAnimationState()
			VRHub:SetShowTopBar(false)
			
			if settingsHubModule:GetVisibility() then
				settingsHubModule:ToggleVisibility()
			end
		else
			VRHub:SetShowTopBar(true)
		end
		rbxAnalyticsService:ReportCounter("VR-BottomBar-ToggleGui")
	end,
	components = {
		Icon = function()
			-- upvalues: commonIconModule (ref), var3 (ref)
			return commonIconModule("rbxasset://textures/ui/MenuBar/icon_maximize.png", "rbxasset://textures/ui/MenuBar/icon_minimize.png", var3)
		end
	}
})