local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(parent.RobloxAppEnums)
local getDeviceType = require(parent.AppCommonLib).getDeviceType

return function()
	-- upvalues: useSelector (ref), getDeviceType (ref)
	return getDeviceType(useSelector(function(p0)
		return p0.DeviceOrientation
	end))
end