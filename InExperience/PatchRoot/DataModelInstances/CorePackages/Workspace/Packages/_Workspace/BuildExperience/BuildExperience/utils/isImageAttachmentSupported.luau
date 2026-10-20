local CaptureService = game:GetService("CaptureService")

return function(): boolean
	-- upvalues: CaptureService (copy)
	local Success, Result = pcall(function(): boolean
		-- upvalues: CaptureService (upval)
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass") and (CaptureService.ReadCapturesFromGalleryAsync ~= nil and (CaptureService.StartUploadCaptureAsync ~= nil and CaptureService.CheckUploadCaptureStatusAsync ~= nil))
	end)
	
	return Success and Result == true
end