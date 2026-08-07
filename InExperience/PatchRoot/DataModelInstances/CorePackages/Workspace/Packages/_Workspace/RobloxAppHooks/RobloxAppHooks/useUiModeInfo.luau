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

return function() --[[ line: 36 | named "useUiModeInfo" ]]
	-- upvalues: useDeviceTypeModule (ref), t (ref), uiMode (ref), reactModule (ref)
	local var4 = useDeviceTypeModule()
	local var5 = t[var4] or uiMode.Unknown
	
	return reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: var4 (ref), var5 (ref)
		return { deviceType = var4, uiMode = var5 }
	end, { var4, var5 })
end