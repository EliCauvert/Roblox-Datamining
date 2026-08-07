local corePackagesService = game:GetService("CorePackages")
local shareGame = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local immutable = require(corePackagesService.Workspace.Packages.AppCommonLib).Immutable
local constantsModule = require(shareGame.Constants)
local setDeviceLayoutModule = require(shareGame.Actions.SetDeviceLayout)
local setDeviceOrientation = require(corePackagesService.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation
local setIsSmallTouchScreenModule = require(shareGame.Actions.SetIsSmallTouchScreen)

return function(p0, p1) --[[ line: 14 ]]
	-- upvalues: constantsModule (ref), setDeviceOrientation (ref), immutable (ref), setDeviceLayoutModule (ref), setIsSmallTouchScreenModule (ref)
	p0 = p0 or {
		IsSmallTouchScreen = false,
		DeviceLayout = constantsModule.DeviceLayout.DESKTOP,
		DeviceOrientation = constantsModule.DeviceOrientation.INVALID
	}
	
	if p1.type == setDeviceOrientation.name then
		p0 = immutable.Set(p0, "DeviceOrientation", p1.deviceOrientation)
		
		return p0
	elseif p1.type == setDeviceLayoutModule.name then
		p0 = immutable.Set(p0, "DeviceLayout", p1.deviceLayout)
		
		return p0
	elseif p1.type == setIsSmallTouchScreenModule.name then
		p0 = immutable.Set(p0, "IsSmallTouchScreen", p1.isSmallTouchScreen)
	end
	return p0
end