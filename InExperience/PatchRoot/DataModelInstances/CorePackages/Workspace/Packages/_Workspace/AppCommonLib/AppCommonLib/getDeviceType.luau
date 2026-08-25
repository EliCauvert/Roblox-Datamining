local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local isVRAppBuildModule = require(script.Parent.IsVRAppBuild)
local robloxAppEnumsModule = require(script:FindFirstAncestor("AppCommonLib").Parent.RobloxAppEnums)
local deviceOrientationMode = robloxAppEnumsModule.DeviceOrientationMode
local deviceType = robloxAppEnumsModule.DeviceType

return function(p0)
	-- upvalues: isVRAppBuildModule (ref), deviceType (ref), guiService (ref), userInputService (ref), deviceOrientationMode (ref)
	if isVRAppBuildModule() then
		return deviceType.VR
	elseif guiService:IsTenFootInterface() then
		return deviceType.Console
	end
	local none = Enum.Platform.None
	pcall(function()
		-- upvalues: none (write), userInputService (copy)
		none = userInputService:GetPlatform()
	end)
	
	if none == Enum.Platform.Windows or none == Enum.Platform.OSX or none == Enum.Platform.UWP then
		return deviceType.Desktop
	elseif none == Enum.Platform.IOS or none == Enum.Platform.Android then
		return if p0 == deviceOrientationMode.Landscape then deviceType.Tablet elseif p0 == deviceOrientationMode.Portrait then deviceType.Phone else deviceType.Unknown
	end
end