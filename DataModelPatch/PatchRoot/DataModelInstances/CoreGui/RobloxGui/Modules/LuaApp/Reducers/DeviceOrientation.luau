local DeviceOrientationMode = require(game:GetService("CorePackages").Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local SetDeviceOrientationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetDeviceOrientation)

return function(p1, p2)
	-- upvalues: DeviceOrientationMode (copy), SetDeviceOrientationModule (copy)
	local P0 = p1 or DeviceOrientationMode.Portrait
	assert(P0, "")
	
	return if p2.type == SetDeviceOrientationModule.name then p2.deviceOrientation else P0
end