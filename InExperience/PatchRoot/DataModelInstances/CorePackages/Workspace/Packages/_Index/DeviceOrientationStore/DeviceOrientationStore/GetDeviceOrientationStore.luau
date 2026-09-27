local parent = script:FindFirstAncestor("DeviceOrientationStore").Parent
local signalsModule = require(parent.Signals)
local deviceOrientationMode = require(parent.RobloxAppEnums).DeviceOrientationMode
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild

return signalsModule.createComputed(function()
	-- upvalues: signalsModule (ref), deviceOrientationMode (ref), isVRAppBuild (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref), deviceOrientationMode (copy)
		return var1(p1) == deviceOrientationMode.Portrait
	end)
	
	return {
		getDeviceOrientation = var1,
		getIsPortrait = var3,
		getIsAvatarScenePortrait = signalsModule.createComputed(function(p1)
			-- upvalues: isVRAppBuild (copy), var3 (ref)
			return isVRAppBuild() or var3(p1)
		end),
		setDeviceOrientation = var2,
		reset = function()
			-- upvalues: var2 (ref)
			var2(nil)
		end
	}
end)