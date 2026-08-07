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

return function(p0) --[[ line: 36 ]]
	-- upvalues: useIsFPSAtTarget (ref), object (ref), useIsSpatial (ref), roactModule (ref), roundedCornersFrameModule (ref), ROUNDED_CORNER_RADIUS (ref), getFFlagEnableVRWrapperTransparency (ref), reactModule (ref), panel3D (ref)
	local var4 = object.assign({}, p0.vrProps, { hidden = p0.vrProps.hidden or not useIsFPSAtTarget() })
	
	return if useIsSpatial() then reactModule.createElement(panel3D, var4, if var4.roundedCornersFrameColor then {
		RoundedFrame = roactModule.createElement(roundedCornersFrameModule, {
			cornerRadius = ROUNDED_CORNER_RADIUS / (384 / (var4.virtualScreenSize.X / var4.partSize.X)),
			backgroundColor = var4.roundedCornersFrameColor,
			backgroundTransparency = if getFFlagEnableVRWrapperTransparency() then var4.backgroundTransparency or 0 else 0
		}, p0[roactModule.Children])
	} else p0[roactModule.Children]) else reactModule.createElement(p0.component, p0.props, p0[roactModule.Children])
end