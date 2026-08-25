return function()
	local ok, status = pcall(function()
		local captureService = game:GetService("CaptureService")
		
		return captureService ~= nil and captureService.PromptCaptureGalleryPermissionAsync ~= nil
	end)
	
	return ok and status == true
end