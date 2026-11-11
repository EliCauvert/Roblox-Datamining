local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local DeviceType = RobloxAppEnumsModule.DeviceType
local UiMode = RobloxAppEnumsModule.UiMode
local UseDeviceTypeModule = require(script.Parent.useDeviceType)
local config = {
	[DeviceType.Desktop] = UiMode.Unknown,
	[DeviceType.Tablet] = UiMode.Unknown,
	[DeviceType.Phone] = UiMode.Unknown,
	[DeviceType.Console] = UiMode.TenFoot,
	[DeviceType.VR] = UiMode.VR
}

return function()
	-- upvalues: UseDeviceTypeModule (copy), config (copy), UiMode (copy), ReactModule (copy)
	local UseDeviceTypeModuleResult = UseDeviceTypeModule()
	local Entry = config[UseDeviceTypeModuleResult] or UiMode.Unknown
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseDeviceTypeModuleResult (copy), Entry (copy)
		return { deviceType = UseDeviceTypeModuleResult, uiMode = Entry }
	end, { UseDeviceTypeModuleResult, Entry }))
end