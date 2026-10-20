local RobloxAppHooks = script:FindFirstAncestor("RobloxAppHooks")
local Parent = RobloxAppHooks.Parent
local UseCurrentCameraModule = require(RobloxAppHooks.useCurrentCamera)
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local DeviceOrientationMode = require(Parent.RobloxAppEnums).DeviceOrientationMode
local FixUseDeviceOrientationNilViewportSize = game:DefineFastFlag("FixUseDeviceOrientationNilViewportSize", true)

return function()
	-- upvalues: UseCurrentCameraModule (copy), UsePropertyFunction (copy), FixUseDeviceOrientationNilViewportSize (copy), DeviceOrientationMode (copy)
	local ViewportSize = UsePropertyFunction(UseCurrentCameraModule(), "ViewportSize")
	
	if FixUseDeviceOrientationNilViewportSize then
		if ViewportSize and ViewportSize.X > 1 and ViewportSize.Y > 1 then
			return ViewportSize.Y < ViewportSize.X and DeviceOrientationMode.Landscape or DeviceOrientationMode.Portrait
		end
	elseif ViewportSize.X > 1 and ViewportSize.Y > 1 then
		return ViewportSize.Y < ViewportSize.X and DeviceOrientationMode.Landscape or DeviceOrientationMode.Portrait
	end
	return nil
end