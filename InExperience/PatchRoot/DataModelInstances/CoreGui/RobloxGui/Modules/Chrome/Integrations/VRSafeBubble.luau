local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local var1 = if isSpatial() then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable
local var2 = signal.new()
local var3 = mappedSignal.new(var2, function()
	-- upvalues: VRHub (ref)
	return VRHub.SafetyBubble and VRHub.SafetyBubble.enabled
end)

if VRHub.SafetyBubble then
	VRHub.SafetyBubble.Toggled.Event:Connect(function()
		-- upvalues: var2 (ref)
		var2:fire()
	end)
end
return serviceModule:register({
	id = "vr_safety_bubble",
	label = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title",
	initialAvailability = var1,
	isActivated = var3,
	activated = function()
		-- upvalues: VRHub (ref), rbxAnalyticsService (ref)
		VRHub:ToggleSafetyBubble()
		rbxAnalyticsService:ReportCounter("VR-BottomBar-Safety")
	end,
	components = {
		Icon = function()
			-- upvalues: commonIconModule (ref), var3 (ref)
			return commonIconModule("rbxasset://textures/ui/MenuBar/icon_safety_off.png", "rbxasset://textures/ui/MenuBar/icon_safety_on.png", var3)
		end
	}
})