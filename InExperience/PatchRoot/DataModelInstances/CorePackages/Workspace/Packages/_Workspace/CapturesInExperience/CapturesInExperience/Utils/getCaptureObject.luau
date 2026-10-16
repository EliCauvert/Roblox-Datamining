local Parent = script.Parent.Parent
local CaptureServiceModule = require(Parent.Services.CaptureService)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local _ = require(Parent.Types)
local CaptureServiceGetScreenshotCaptureObjectEngineFeature = game:GetEngineFeature("CaptureServiceGetScreenshotCaptureObject")

return function(p1) --[[ Line: 9 | Named "getCaptureObject" ]]
	-- upvalues: CaptureTypeModule (copy), CaptureServiceGetScreenshotCaptureObjectEngineFeature (copy), CaptureServiceModule (copy)
	return if p1.CaptureType == nil then if p1.type == CaptureTypeModule.Video then p1.videoCapture elseif p1.capture == nil then if CaptureServiceGetScreenshotCaptureObjectEngineFeature then CaptureServiceModule:GetScreenshotCaptureObject(p1.filePath) else nil else p1.capture else p1
end