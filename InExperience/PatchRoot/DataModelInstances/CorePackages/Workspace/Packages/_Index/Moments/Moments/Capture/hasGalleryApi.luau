return function(): boolean --[[ Line: 8 | Named "hasGalleryApi" ]]
	local Success, Result = pcall(function(): boolean --[[ Line: 9 ]]
		local CaptureService = game:GetService("CaptureService")
		
		return CaptureService ~= nil and CaptureService.PromptCaptureGalleryPermissionAsync ~= nil
	end)
	
	return Success and Result == true
end