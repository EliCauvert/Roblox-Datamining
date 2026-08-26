local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local reactModule = require(parent.React)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local deviceType = robloxAppEnumsModule.DeviceType
local uiMode = robloxAppEnumsModule.UiMode
local useDeviceTypeModule = require(script.Parent.useDeviceType)
local t = {
	[deviceType.Desktop] = uiMode.Unknown,
	[deviceType.Tablet] = uiMode.Unknown,
	[deviceType.Phone] = uiMode.Unknown,
	[deviceType.Console] = uiMode.TenFoot,
	[deviceType.VR] = uiMode.VR
}

return function()
	-- upvalues: useDeviceTypeModule (ref), t (ref), uiMode (ref), reactModule (ref)
	local var1 = useDeviceTypeModule()
	local var2 = t[var1] or uiMode.Unknown
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref)
		return { deviceType = var1, uiMode = var2 }
	end, { var1, var2 })
end