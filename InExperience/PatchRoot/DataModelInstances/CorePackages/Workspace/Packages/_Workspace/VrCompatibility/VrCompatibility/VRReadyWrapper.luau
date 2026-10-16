local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local Panel3D = require(Parent.UIBlox).Core.VR.Panel3D
local UseIsFPSAtTargetFunction = require(Parent.SplashScreenManager).useIsFPSAtTarget
local RoundedCornersFrameModule = require(script.Parent.RoundedCornersFrame)
local Object = require(Parent.LuauPolyfill).Object
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local GetFFlagEnableVRWrapperTransparencyFunction = require(Parent.SharedFlags).GetFFlagEnableVRWrapperTransparency
local ROUNDEDCORNERRADIUS = require(script.Parent.Constants).ROUNDED_CORNER_RADIUS

return function(p1) --[[ Line: 36 ]]
	-- upvalues: UseIsFPSAtTargetFunction (copy), Object (copy), UseIsSpatialFunction (copy), RoactModule (copy), RoundedCornersFrameModule (copy), ROUNDEDCORNERRADIUS (copy), GetFFlagEnableVRWrapperTransparencyFunction (copy), ReactModule (copy), Panel3D (copy)
	local UseIsFPSAtTargetResult = UseIsFPSAtTargetFunction()
	local AssignResult = Object.assign({}, p1.vrProps, { hidden = p1.vrProps.hidden or not UseIsFPSAtTargetResult })
	
	return if UseIsSpatialFunction() then ReactModule.createElement(Panel3D, AssignResult, if AssignResult.roundedCornersFrameColor then {
		RoundedFrame = RoactModule.createElement(RoundedCornersFrameModule, {
			cornerRadius = ROUNDEDCORNERRADIUS / (384 / (AssignResult.virtualScreenSize.X / AssignResult.partSize.X)),
			backgroundColor = AssignResult.roundedCornersFrameColor,
			backgroundTransparency = GetFFlagEnableVRWrapperTransparencyFunction() and AssignResult.backgroundTransparency or 0
		}, p1[RoactModule.Children])
	} else p1[RoactModule.Children]) else ReactModule.createElement(p1.component, p1.props, p1[RoactModule.Children])
end