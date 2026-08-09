local robloxAppHooks = script:FindFirstAncestor("RobloxAppHooks")
local parent = robloxAppHooks.Parent
local useCurrentCameraModule = require(robloxAppHooks.useCurrentCamera)
local useProperty = require(parent.GuiObjectUtils).useProperty
local deviceOrientationMode = require(parent.RobloxAppEnums).DeviceOrientationMode

return function() --[[ line: 10 | named "useDeviceOrientation" ]]
	-- upvalues: useCurrentCameraModule (ref), useProperty (ref), deviceOrientationMode (ref)
	local var2 = useProperty(useCurrentCameraModule(), "ViewportSize")
	
	return if var2.X > 1 and var2.Y > 1 then if var2.Y < var2.X then deviceOrientationMode.Landscape else deviceOrientationMode.Portrait else nil
end