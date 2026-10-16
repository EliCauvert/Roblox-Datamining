local Parent = script:FindFirstAncestor("RobloxAppHooks").Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(Parent.RobloxAppEnums)
local GetDeviceTypeFunction = require(Parent.AppCommonLib).getDeviceType
local FFlagUseSignalsForDeviceOrientation = require(Parent.SharedFlags).FFlagUseSignalsForDeviceOrientation
local GetDeviceOrientationStore = if FFlagUseSignalsForDeviceOrientation then require(Parent.DeviceOrientationStore).GetDeviceOrientationStore else nil

return function() --[[ Line: 21 | Named "useDeviceType" ]]
	-- upvalues: FFlagUseSignalsForDeviceOrientation (copy), UseSignalStateFunction (copy), GetDeviceOrientationStore (copy), UseSelectorFunction (copy), GetDeviceTypeFunction (copy)
	return GetDeviceTypeFunction(if FFlagUseSignalsForDeviceOrientation then UseSignalStateFunction(GetDeviceOrientationStore(false).getDeviceOrientation) else UseSelectorFunction(function(p1) --[[ Line: 24 ]]
		return p1.DeviceOrientation
	end))
end