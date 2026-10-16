local UserInputService = game:GetService("UserInputService")
local IsVRAppBuildModule = require(script.Parent.IsVRAppBuild)
local IsTenFootInterfaceModule = require(script.Parent.isTenFootInterface)
local RobloxAppEnumsModule = require(script:FindFirstAncestor("AppCommonLib").Parent.RobloxAppEnums)
local DeviceOrientationMode = RobloxAppEnumsModule.DeviceOrientationMode
local DeviceType = RobloxAppEnumsModule.DeviceType

return function(Landscape) --[[ Line: 16 | Named "getDeviceType" ]]
	-- upvalues: IsVRAppBuildModule (copy), DeviceType (copy), IsTenFootInterfaceModule (copy), UserInputService (copy), DeviceOrientationMode (copy)
	if IsVRAppBuildModule() then
		return DeviceType.VR
	end
	if IsTenFootInterfaceModule() then
		return DeviceType.Console
	end
	local None = Enum.Platform.None
	pcall(function() --[[ Line: 26 ]]
		-- upvalues: None (ref), UserInputService (upval)
		None = UserInputService:GetPlatform()
	end)
	
	if None == Enum.Platform.Windows or None == Enum.Platform.OSX or None == Enum.Platform.UWP then
		return DeviceType.Desktop
	elseif None == Enum.Platform.IOS or None == Enum.Platform.Android then
		if Landscape == DeviceOrientationMode.Landscape then
			return DeviceType.Tablet
		elseif Landscape == DeviceOrientationMode.Portrait then
			return DeviceType.Phone
		end
	end
	return DeviceType.Unknown
end