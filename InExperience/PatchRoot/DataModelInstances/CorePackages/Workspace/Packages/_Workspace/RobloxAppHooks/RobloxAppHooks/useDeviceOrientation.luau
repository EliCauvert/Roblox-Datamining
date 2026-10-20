local RobloxAppHooks = script:FindFirstAncestor("RobloxAppHooks")
local Parent = RobloxAppHooks.Parent
local UseCurrentCameraModule = require(RobloxAppHooks.useCurrentCamera)
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local DeviceOrientationMode = require(Parent.RobloxAppEnums).DeviceOrientationMode

return function()
	-- upvalues: UseCurrentCameraModule (copy), UsePropertyFunction (copy), DeviceOrientationMode (copy)
	local ViewportSize = UsePropertyFunction(UseCurrentCameraModule(), "ViewportSize")
	
	return if ViewportSize and ViewportSize.X > 1 and ViewportSize.Y > 1 then ViewportSize.Y < ViewportSize.X and DeviceOrientationMode.Landscape or DeviceOrientationMode.Portrait else nil
end