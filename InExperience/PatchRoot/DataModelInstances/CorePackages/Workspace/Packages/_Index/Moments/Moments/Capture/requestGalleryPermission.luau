return function(p0) --[[ line: 20 | named "requestGalleryPermission" ]]
	p0 = p0 or game:GetService("CaptureService")
	local ok, status = pcall(function() --[[ line: 25 ]]
		-- upvalues: p0 (ref)
		return p0:PromptCaptureGalleryPermissionAsync(Enum.CaptureGalleryPermission.ReadAndUpload)
	end)
	
	return ok and status == true
end