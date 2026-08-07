local parent = script.Parent.Parent
local captureServiceModule = require(parent.Services.CaptureService)
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local captureServiceGetScreenshotCaptureObjectEngineFeature = game:GetEngineFeature("CaptureServiceGetScreenshotCaptureObject")

return function(p0) --[[ line: 9 | named "getCaptureObject" ]]
	-- upvalues: captureTypeModule (ref), captureServiceGetScreenshotCaptureObjectEngineFeature (ref), captureServiceModule (ref)
	return if p0.CaptureType == nil then if p0.type == captureTypeModule.Video then p0.videoCapture elseif p0.capture == nil then if captureServiceGetScreenshotCaptureObjectEngineFeature then captureServiceModule:GetScreenshotCaptureObject(p0.filePath) else nil else p0.capture else p0
end