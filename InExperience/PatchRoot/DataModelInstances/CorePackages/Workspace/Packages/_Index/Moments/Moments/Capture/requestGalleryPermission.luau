return function(p1): boolean --[[ Line: 20 | Named "requestGalleryPermission" ]]
	local P0 = p1 or game:GetService("CaptureService")
	local Success, Result = pcall(function() --[[ Line: 25 ]]
		-- upvalues: P0 (copy)
		return P0:PromptCaptureGalleryPermissionAsync(Enum.CaptureGalleryPermission.ReadAndUpload)
	end)
	
	return Success and Result == true
end