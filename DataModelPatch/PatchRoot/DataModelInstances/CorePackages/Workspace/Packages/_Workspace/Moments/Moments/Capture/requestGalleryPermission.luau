return function(p1): boolean
	local P0 = p1 or game:GetService("CaptureService")
	local Success, Result = pcall(function()
		-- upvalues: P0 (copy)
		return P0:PromptCaptureGalleryPermissionAsync(Enum.CaptureGalleryPermission.ReadAndUpload)
	end)
	
	return Success and Result == true
end