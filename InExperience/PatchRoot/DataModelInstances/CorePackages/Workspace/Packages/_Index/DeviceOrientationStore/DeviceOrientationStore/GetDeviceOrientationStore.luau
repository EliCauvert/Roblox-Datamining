local Parent = script:FindFirstAncestor("DeviceOrientationStore").Parent
local SignalsModule = require(Parent.Signals)
local DeviceOrientationMode = require(Parent.RobloxAppEnums).DeviceOrientationMode
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild

return SignalsModule.createComputed(function()
	-- upvalues: SignalsModule (copy), DeviceOrientationMode (copy), IsVRAppBuildFunction (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Signal (copy), DeviceOrientationMode (upval)
		return Signal(p1) == DeviceOrientationMode.Portrait
	end)
	
	return {
		getDeviceOrientation = Signal,
		getIsPortrait = Computed,
		getIsAvatarScenePortrait = SignalsModule.createComputed(function(p1)
			-- upvalues: IsVRAppBuildFunction (upval), Computed (copy)
			return IsVRAppBuildFunction() or Computed(p1)
		end),
		setDeviceOrientation = Signal2,
		reset = function()
			-- upvalues: Signal2 (copy)
			Signal2(nil)
		end
	}
end)