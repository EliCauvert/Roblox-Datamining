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
local fFlagChromeActivatedMappedSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local UIManager = require(corePackagesService.Workspace.Packages.VrSpatialUi).UIManager
local var6 = if isSpatial() then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable
local var7 = signal.new()
local var8 = mappedSignal.new(var7, function() --[[ line: 31 ]]
	-- upvalues: VRHub (ref)
	return VRHub.ShowTopBar
end)
VRHub.ShowTopBarChanged.Event:Connect(function() --[[ line: 35 ]]
	-- upvalues: var7 (ref)
	var7:fire()
end)

return serviceModule:register({
	id = "vr_toggle_button",
	label = "Feature.Catalog.Label.Filter.Hide",
	initialAvailability = var6,
	isActivated = if fFlagChromeActivatedMappedSignal then var8 else function() --[[ line: 45 ]]
		-- upvalues: var8 (ref)
		return var8:get()
	end,
	activated = function() --[[ line: 48 ]]
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
		Icon = function() --[[ line: 62 ]]
			-- upvalues: commonIconModule (ref), var8 (ref)
			return commonIconModule("rbxasset://textures/ui/MenuBar/icon_maximize.png", "rbxasset://textures/ui/MenuBar/icon_minimize.png", var8)
		end
	}
})