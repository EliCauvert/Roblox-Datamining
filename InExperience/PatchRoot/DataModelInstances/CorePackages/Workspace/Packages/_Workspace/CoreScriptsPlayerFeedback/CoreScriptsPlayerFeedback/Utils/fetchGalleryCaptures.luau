return function(p1, p2) --[[ Line: 8 | Named "fetchGalleryCaptures" ]]
	local P1 = p2 or { Enum.CaptureType.Screenshot }
	local CaptureService = nil
	CaptureService = if p1 == nil then game:GetService("CaptureService") else p1
	local Success, Result = pcall(function() --[[ Line: 17 ]]
		-- upvalues: CaptureService (ref), P1 (copy)
		local CapturesFromGalleryAsync, CapturesFromGalleryAsync2 = CaptureService:ReadCapturesFromGalleryAsync(P1, false)
		
		return if CapturesFromGalleryAsync == Enum.ReadCapturesFromGalleryResult.Success then CapturesFromGalleryAsync2 else nil
	end)
	
	return if Success and Result ~= nil then Result else nil
end