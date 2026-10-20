local CorePackages = game:GetService("CorePackages")
local ShareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local Immutable = require(CorePackages.Workspace.Packages.AppCommonLib).Immutable
local ConstantsModule = require(ShareGame.Constants)
local SetDeviceLayoutModule = require(ShareGame.Actions.SetDeviceLayout)
local SetDeviceOrientation = require(CorePackages.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation
local SetIsSmallTouchScreenModule = require(ShareGame.Actions.SetIsSmallTouchScreen)

return function(p1, p2)
	-- upvalues: ConstantsModule (copy), SetDeviceOrientation (copy), Immutable (copy), SetDeviceLayoutModule (copy), SetIsSmallTouchScreenModule (copy)
	local P0 = p1 or {
		IsSmallTouchScreen = false,
		DeviceLayout = ConstantsModule.DeviceLayout.DESKTOP,
		DeviceOrientation = ConstantsModule.DeviceOrientation.INVALID
	}
	
	if p2.type == SetDeviceOrientation.name then
		P0 = Immutable.Set(P0, "DeviceOrientation", p2.deviceOrientation)
		
		return P0
	end
	if p2.type == SetDeviceLayoutModule.name then
		P0 = Immutable.Set(P0, "DeviceLayout", p2.deviceLayout)
		
		return P0
	end
	if p2.type == SetIsSmallTouchScreenModule.name then
		P0 = Immutable.Set(P0, "IsSmallTouchScreen", p2.isSmallTouchScreen)
	end
	return P0
end