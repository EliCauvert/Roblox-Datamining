local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(corePackagesService.Workspace.Packages.AppCommonLib).Immutable
local constantsModule = require(shareGame.Constants)
local setDeviceLayoutModule = require(shareGame.Actions.SetDeviceLayout)
local setDeviceOrientation = require(corePackagesService.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation
local setIsSmallTouchScreenModule = require(shareGame.Actions.SetIsSmallTouchScreen)

return function(p1, p2)
	-- upvalues: constantsModule (ref), setDeviceOrientation (ref), immutable (ref), setDeviceLayoutModule (ref), setIsSmallTouchScreenModule (ref)
	p1 = p1 or {
		IsSmallTouchScreen = false,
		DeviceLayout = constantsModule.DeviceLayout.DESKTOP,
		DeviceOrientation = constantsModule.DeviceOrientation.INVALID
	}
	
	if p2.type == setDeviceOrientation.name then
		p1 = immutable.Set(p1, "DeviceOrientation", p2.deviceOrientation)
		
		return p1
	elseif p2.type == setDeviceLayoutModule.name then
		p1 = immutable.Set(p1, "DeviceLayout", p2.deviceLayout)
		
		return p1
	elseif p2.type == setIsSmallTouchScreenModule.name then
		p1 = immutable.Set(p1, "IsSmallTouchScreen", p2.isSmallTouchScreen)
	end
	return p1
end