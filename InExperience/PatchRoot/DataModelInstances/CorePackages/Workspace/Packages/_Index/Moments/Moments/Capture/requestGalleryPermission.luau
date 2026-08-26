return function(p1)
	p1 = p1 or game:GetService("CaptureService")
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1:PromptCaptureGalleryPermissionAsync(Enum.CaptureGalleryPermission.ReadAndUpload)
	end)
	
	return ok and status == true
end