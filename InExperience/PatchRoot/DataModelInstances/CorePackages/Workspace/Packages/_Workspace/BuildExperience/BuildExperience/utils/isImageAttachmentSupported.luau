local CaptureService = game:GetService("CaptureService")

return function(): boolean --[[ Line: 3 | Named "isImageAttachmentSupported" ]]
	-- upvalues: CaptureService (copy)
	local Success, Result = pcall(function(): boolean --[[ Line: 4 ]]
		-- upvalues: CaptureService (upval)
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass") and (CaptureService.ReadCapturesFromGalleryAsync ~= nil and (CaptureService.StartUploadCaptureAsync ~= nil and CaptureService.CheckUploadCaptureStatusAsync ~= nil))
	end)
	
	return Success and Result == true
end