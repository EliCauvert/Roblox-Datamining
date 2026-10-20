return {
	["jest.config"] = script["jest.config"],
	SurfaceGuiWithAdornee = require(script.SurfaceGuiWithAdornee),
	Lighting = require(script.Lighting),
	BackgroundScene = require(script.BackgroundScene),
	useCameraFacingGeometry = require(script.hooks.useCameraFacingGeometry)
}