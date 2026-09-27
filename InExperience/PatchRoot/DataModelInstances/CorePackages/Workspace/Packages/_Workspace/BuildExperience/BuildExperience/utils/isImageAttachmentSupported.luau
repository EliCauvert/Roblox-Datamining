local captureService = game:GetService("CaptureService")

return function()
	-- upvalues: captureService (ref)
	local ok, status = pcall(function()
		-- upvalues: captureService (copy)
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass") and (captureService.ReadCapturesFromGalleryAsync ~= nil and (captureService.StartUploadCaptureAsync ~= nil and captureService.CheckUploadCaptureStatusAsync ~= nil))
	end)
	
	return ok and status == true
end