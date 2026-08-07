local robloxAppHooks = script:FindFirstAncestor("RobloxAppHooks")
local parent = robloxAppHooks.Parent
local useCurrentCameraModule = require(robloxAppHooks.useCurrentCamera)
local useProperty = require(parent.GuiObjectUtils).useProperty
local deviceOrientationMode = require(parent.RobloxAppEnums).DeviceOrientationMode
local fixUseDeviceOrientationNilViewportSize = game:DefineFastFlag("FixUseDeviceOrientationNilViewportSize", true)

return function() --[[ line: 12 | named "useDeviceOrientation" ]]
	-- upvalues: useCurrentCameraModule (ref), useProperty (ref), fixUseDeviceOrientationNilViewportSize (ref), deviceOrientationMode (ref)
	local var3 = useProperty(useCurrentCameraModule(), "ViewportSize")
	
	if fixUseDeviceOrientationNilViewportSize then
		if var3 and var3.X > 1 and var3.Y > 1 then
			return if var3.Y < var3.X then deviceOrientationMode.Landscape else deviceOrientationMode.Portrait
		end
	else
		return if var3.X > 1 and var3.Y > 1 then if var3.Y < var3.X then deviceOrientationMode.Landscape else deviceOrientationMode.Portrait else nil
	end
end