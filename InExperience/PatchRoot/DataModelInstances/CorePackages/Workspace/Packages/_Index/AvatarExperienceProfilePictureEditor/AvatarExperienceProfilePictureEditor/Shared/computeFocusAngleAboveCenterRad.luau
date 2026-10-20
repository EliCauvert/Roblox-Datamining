local ConstantsModule = require(script.Parent.Parent.Constants)

return function(p1): number
	-- upvalues: ConstantsModule (copy)
	return (math.atan2(p1.viewportHeightPix / 2 - (p1.cutoutTopOffsetPix + p1.cutoutDiameterPix / 2), p1.viewportHeightPix / 2 / math.tan(math.rad(p1.cameraFieldOfViewDeg or ConstantsModule.CameraFieldOfViewDeg) / 2)))
end