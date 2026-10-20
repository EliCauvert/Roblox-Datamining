local ConstantsModule = require(script.Parent.Parent.Constants)

return function(p1): number
	-- upvalues: ConstantsModule (copy)
	local ViewportHeightPix: number = p1.viewportHeightPix
	local X = ViewportHeightPix / 2 / math.tan(math.rad(p1.cameraFieldOfViewDeg or ConstantsModule.CameraFieldOfViewDeg) / 2)
	local Y = ViewportHeightPix / 2 - p1.cutoutTopOffsetPix
	
	return (math.deg(math.atan2(Y, X) - math.atan2(Y - p1.cutoutDiameterPix, X)))
end