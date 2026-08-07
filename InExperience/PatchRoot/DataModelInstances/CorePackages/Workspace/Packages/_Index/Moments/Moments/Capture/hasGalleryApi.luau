return function() --[[ line: 8 | named "hasGalleryApi" ]]
	local ok, status = pcall(function() --[[ line: 9 ]]
		local captureService = game:GetService("CaptureService")
		
		return captureService ~= nil and captureService.PromptCaptureGalleryPermissionAsync ~= nil
	end)
	
	return ok and status == true
end