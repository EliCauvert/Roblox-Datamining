local parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local _ = require(parent.RobloxAppEnums)
local getDeviceType = require(parent.AppCommonLib).getDeviceType
local fFlagUseSignalsForDeviceOrientation = require(parent.SharedFlags).FFlagUseSignalsForDeviceOrientation
local var1 = if fFlagUseSignalsForDeviceOrientation then require(parent.DeviceOrientationStore).GetDeviceOrientationStore else nil

return function()
	-- upvalues: fFlagUseSignalsForDeviceOrientation (ref), useSignalState (ref), var1 (ref), useSelector (ref), getDeviceType (ref)
	return getDeviceType(if fFlagUseSignalsForDeviceOrientation then useSignalState(var1(false).getDeviceOrientation) else useSelector(function(p1)
		return p1.DeviceOrientation
	end))
end