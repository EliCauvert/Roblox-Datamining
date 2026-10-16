local CorePackages = game:GetService("CorePackages")
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local AppCommonLibModule = require(CorePackages.Workspace.Packages.AppCommonLib)
local DeviceOrientationMode = RobloxAppEnumsModule.DeviceOrientationMode

return {
	getDeviceType = function() --[[ Line: 26 ]]
		-- upvalues: AppCommonLibModule (copy), DeviceOrientationMode (copy)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		
		return AppCommonLibModule.getDeviceType(if ViewportSize.Y < ViewportSize.X then DeviceOrientationMode.Landscape else DeviceOrientationMode.Portrait)
	end,
	DeviceTypes = RobloxAppEnumsModule.DeviceType,
	getDeviceOrientation = function() --[[ Line: 19 ]]
		-- upvalues: DeviceOrientationMode (copy)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		
		return if ViewportSize.Y < ViewportSize.X then DeviceOrientationMode.Landscape else DeviceOrientationMode.Portrait
	end,
	getViewportSize = function() --[[ Line: 14 ]]
		return workspace.CurrentCamera.ViewportSize
	end
}