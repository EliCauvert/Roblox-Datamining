local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local ServiceModule = require(Chrome.Service)
local CommonIconModule = require(Chrome.Integrations.CommonIcon)
local FFlagChromeActivatedMappedSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local Available = if require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial() then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable
local NewResult = require(CorePackages.Workspace.Packages.AppCommonLib).Signal.new()
local NewResult1 = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(NewResult, function()
	-- upvalues: VRHub (copy)
	return VRHub.SafetyBubble and VRHub.SafetyBubble.enabled
end)

if VRHub.SafetyBubble then
	VRHub.SafetyBubble.Toggled.Event:Connect(function()
		-- upvalues: NewResult (copy)
		NewResult:fire()
	end)
end
return (ServiceModule:register({
	id = "vr_safety_bubble",
	label = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title",
	initialAvailability = Available,
	isActivated = if FFlagChromeActivatedMappedSignal then NewResult1 else function()
		-- upvalues: NewResult1 (copy)
		return NewResult1:get()
	end,
	activated = function()
		-- upvalues: VRHub (copy), RbxAnalyticsService (copy)
		VRHub:ToggleSafetyBubble()
		RbxAnalyticsService:ReportCounter("VR-BottomBar-Safety")
	end,
	components = {
		Icon = function()
			-- upvalues: CommonIconModule (copy), NewResult1 (copy)
			return CommonIconModule("rbxasset://textures/ui/MenuBar/icon_safety_off.png", "rbxasset://textures/ui/MenuBar/icon_safety_on.png", NewResult1)
		end
	}
}))