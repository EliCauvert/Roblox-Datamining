local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local serviceModule = require(chrome.Service)
local commonIconModule = require(chrome.Integrations.CommonIcon)
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local var5 = if isSpatial() then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable
local var6 = signal.new()
local var7 = mappedSignal.new(var6, function() --[[ line: 22 ]]
	-- upvalues: VRHub (ref)
	return VRHub.SafetyBubble and VRHub.SafetyBubble.enabled
end)

if VRHub.SafetyBubble then
	VRHub.SafetyBubble.Toggled.Event:Connect(function() --[[ line: 27 ]]
		-- upvalues: var6 (ref)
		var6:fire()
	end)
end
return serviceModule:register({
	id = "vr_safety_bubble",
	label = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title",
	initialAvailability = var5,
	isActivated = var7,
	activated = function() --[[ line: 37 ]]
		-- upvalues: VRHub (ref), rbxAnalyticsService (ref)
		VRHub:ToggleSafetyBubble()
		rbxAnalyticsService:ReportCounter("VR-BottomBar-Safety")
	end,
	components = {
		Icon = function() --[[ line: 42 ]]
			-- upvalues: commonIconModule (ref), var7 (ref)
			return commonIconModule("rbxasset://textures/ui/MenuBar/icon_safety_off.png", "rbxasset://textures/ui/MenuBar/icon_safety_on.png", var7)
		end
	}
})