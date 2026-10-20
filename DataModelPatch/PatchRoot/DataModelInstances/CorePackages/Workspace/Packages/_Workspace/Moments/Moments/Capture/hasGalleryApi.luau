return function(): boolean
	local Success, Result = pcall(function(): boolean
		local CaptureService = game:GetService("CaptureService")
		
		return CaptureService ~= nil and CaptureService.PromptCaptureGalleryPermissionAsync ~= nil
	end)
	
	return Success and Result == true
end