local constantsModule = require(script.Parent.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	local cameraFieldOfViewDeg = p1.cameraFieldOfViewDeg or constantsModule.CameraFieldOfViewDeg
	local viewportHeightPix = p1.viewportHeightPix
	local cutoutTopOffsetPix = p1.cutoutTopOffsetPix
	local cutoutDiameterPix = p1.cutoutDiameterPix
	local var1 = viewportHeightPix / 2 / math.tan(math.rad(cameraFieldOfViewDeg) / 2)
	local var2 = viewportHeightPix / 2 - cutoutTopOffsetPix
	
	return math.deg(math.atan2(var2, var1) - math.atan2(var2 - cutoutDiameterPix, var1))
end