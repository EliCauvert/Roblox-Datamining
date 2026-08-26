local parent = script.Parent.Parent
local captureServiceModule = require(parent.Services.CaptureService)
local captureTypeModule = require(parent.Enums.CaptureType)
local _ = require(parent.Types)
local captureServiceGetScreenshotCaptureObjectEngineFeature = game:GetEngineFeature("CaptureServiceGetScreenshotCaptureObject")

return function(p1)
	-- upvalues: captureTypeModule (ref), captureServiceGetScreenshotCaptureObjectEngineFeature (ref), captureServiceModule (ref)
	return if p1.CaptureType == nil then if p1.type == captureTypeModule.Video then p1.videoCapture elseif p1.capture == nil then if captureServiceGetScreenshotCaptureObjectEngineFeature then captureServiceModule:GetScreenshotCaptureObject(p1.filePath) else nil else p1.capture else p1
end