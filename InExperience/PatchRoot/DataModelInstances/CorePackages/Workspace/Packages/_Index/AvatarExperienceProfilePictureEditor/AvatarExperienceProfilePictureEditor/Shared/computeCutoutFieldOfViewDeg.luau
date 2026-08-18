local constantsModule = require(script.Parent.Parent.Constants)

return function(p0) --[[ line: 18 | named "computeCutoutFieldOfViewDeg" ]]
	-- upvalues: constantsModule (ref)
	local cameraFieldOfViewDeg = p0.cameraFieldOfViewDeg or constantsModule.CameraFieldOfViewDeg
	local viewportHeightPix = p0.viewportHeightPix
	local cutoutTopOffsetPix = p0.cutoutTopOffsetPix
	local cutoutDiameterPix = p0.cutoutDiameterPix
	local var2 = viewportHeightPix / 2 / math.tan(math.rad(cameraFieldOfViewDeg) / 2)
	local var3 = viewportHeightPix / 2 - cutoutTopOffsetPix
	
	return math.deg(math.atan2(var3, var2) - math.atan2(var3 - cutoutDiameterPix, var2))
end