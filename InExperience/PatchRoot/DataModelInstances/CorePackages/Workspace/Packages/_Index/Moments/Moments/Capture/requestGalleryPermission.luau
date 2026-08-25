return function(p0)
	p0 = p0 or game:GetService("CaptureService")
	local ok, status = pcall(function()
		-- upvalues: p0 (ref)
		return p0:PromptCaptureGalleryPermissionAsync(Enum.CaptureGalleryPermission.ReadAndUpload)
	end)
	
	return ok and status == true
end