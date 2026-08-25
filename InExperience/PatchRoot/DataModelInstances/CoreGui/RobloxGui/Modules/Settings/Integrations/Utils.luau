local corePackagesService = game:GetService("CorePackages")
local robloxAppEnumsModule = require(corePackagesService.Workspace.Packages.RobloxAppEnums)
local appCommonLibModule = require(corePackagesService.Workspace.Packages.AppCommonLib)
local deviceOrientationMode = robloxAppEnumsModule.DeviceOrientationMode

return {
	getDeviceType = function()
		-- upvalues: appCommonLibModule (ref), deviceOrientationMode (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		
		return appCommonLibModule.getDeviceType(if viewportSize.Y < viewportSize.X then deviceOrientationMode.Landscape else deviceOrientationMode.Portrait)
	end,
	DeviceTypes = robloxAppEnumsModule.DeviceType,
	getDeviceOrientation = function()
		-- upvalues: deviceOrientationMode (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		
		return if viewportSize.Y < viewportSize.X then deviceOrientationMode.Landscape else deviceOrientationMode.Portrait
	end,
	getViewportSize = function()
		return workspace.CurrentCamera.ViewportSize
	end
}