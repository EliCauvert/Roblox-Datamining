local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(Parent.RobloxAppEnums)
local GetDeviceTypeFunction = require(Parent.AppCommonLib).getDeviceType

return function()
	-- upvalues: UseSelectorFunction (copy), GetDeviceTypeFunction (copy)
	return GetDeviceTypeFunction((UseSelectorFunction(function(p1)
		return p1.DeviceOrientation
	end)))
end