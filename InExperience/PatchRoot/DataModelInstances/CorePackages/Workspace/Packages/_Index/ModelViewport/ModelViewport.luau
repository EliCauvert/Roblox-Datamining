local CameraMathModule = require(script.CameraMath)
local _ = require(script.Types)

return {
	["jest.config"] = script["jest.config"],
	CameraMath = CameraMathModule,
	Constants = require(script.Constants),
	RotationMode = require(script.Enums.RotationMode),
	fitCameraToBounds = CameraMathModule.fitCameraToBounds,
	fitCameraToModel = require(script.Utils.fitCameraToModel),
	getPartsBounds = CameraMathModule.getPartsBounds,
	useModelViewport = require(script.Hooks.useModelViewport),
	ModelViewportView = require(script.Components.ModelViewportView)
}