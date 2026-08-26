local parent = script.Parent.Parent
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local sharedFlagsModule = require(parent.SharedFlags)
local panel3D = require(parent.UIBlox).Core.VR.Panel3D
local useIsFPSAtTarget = require(parent.SplashScreenManager).useIsFPSAtTarget
local roundedCornersFrameModule = require(script.Parent.RoundedCornersFrame)
local object = require(parent.LuauPolyfill).Object
local useIsSpatial = require(parent.Responsive).useIsSpatial
local getFFlagEnableVRWrapperTransparency = sharedFlagsModule.GetFFlagEnableVRWrapperTransparency
local ROUNDED_CORNER_RADIUS = require(script.Parent.Constants).ROUNDED_CORNER_RADIUS

return function(p1)
	-- upvalues: useIsFPSAtTarget (ref), object (ref), useIsSpatial (ref), roactModule (ref), roundedCornersFrameModule (ref), ROUNDED_CORNER_RADIUS (ref), getFFlagEnableVRWrapperTransparency (ref), reactModule (ref), panel3D (ref)
	local var1 = object.assign({}, p1.vrProps, { hidden = p1.vrProps.hidden or not useIsFPSAtTarget() })
	
	return if useIsSpatial() then reactModule.createElement(panel3D, var1, if var1.roundedCornersFrameColor then {
		RoundedFrame = roactModule.createElement(roundedCornersFrameModule, {
			cornerRadius = ROUNDED_CORNER_RADIUS / (384 / (var1.virtualScreenSize.X / var1.partSize.X)),
			backgroundColor = var1.roundedCornersFrameColor,
			backgroundTransparency = if getFFlagEnableVRWrapperTransparency() then var1.backgroundTransparency or 0 else 0
		}, p1[roactModule.Children])
	} else p1[roactModule.Children]) else reactModule.createElement(p1.component, p1.props, p1[roactModule.Children])
end