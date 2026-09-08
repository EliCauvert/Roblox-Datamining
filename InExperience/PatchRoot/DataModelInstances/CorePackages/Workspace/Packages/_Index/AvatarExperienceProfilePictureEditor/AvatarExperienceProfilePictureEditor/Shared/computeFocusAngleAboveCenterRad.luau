local constantsModule = require(script.Parent.Parent.Constants)

return function(vectorA)
	-- upvalues: constantsModule (ref)
	return math.atan2(vectorA.viewportHeightPix / 2 - (vectorA.cutoutTopOffsetPix + vectorA.cutoutDiameterPix / 2), vectorA.viewportHeightPix / 2 / math.tan(math.rad(vectorA.cameraFieldOfViewDeg or constantsModule.CameraFieldOfViewDeg) / 2))
end