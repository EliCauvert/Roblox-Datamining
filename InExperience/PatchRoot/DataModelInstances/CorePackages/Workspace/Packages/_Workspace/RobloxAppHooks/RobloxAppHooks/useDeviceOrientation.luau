local robloxAppHooks = script:FindFirstAncestor("RobloxAppHooks")
local parent = robloxAppHooks.Parent
local useCurrentCameraModule = require(robloxAppHooks.useCurrentCamera)
local useProperty = require(parent.GuiObjectUtils).useProperty
local deviceOrientationMode = require(parent.RobloxAppEnums).DeviceOrientationMode

return function()
	-- upvalues: useCurrentCameraModule (ref), useProperty (ref), deviceOrientationMode (ref)
	local var1 = useProperty(useCurrentCameraModule(), "ViewportSize")
	
	return if var1 and var1.X > 1 and var1.Y > 1 then if var1.Y < var1.X then deviceOrientationMode.Landscape else deviceOrientationMode.Portrait else nil
end