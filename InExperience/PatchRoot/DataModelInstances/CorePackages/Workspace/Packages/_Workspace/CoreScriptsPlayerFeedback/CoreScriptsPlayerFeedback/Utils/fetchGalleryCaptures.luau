return function(p1, p2)
	p2 = p2 or { Enum.CaptureType.Screenshot }
	local var1 = if p1 ~= nil then game:GetService("CaptureService") else p1
	local ok, status = pcall(function()
		-- upvalues: var1 (write), p2 (ref)
		local var2, var3 = var1:ReadCapturesFromGalleryAsync(p2, false)
		
		return if var2 == Enum.ReadCapturesFromGalleryResult.Success then var3 else nil
	end)
	
	return if ok and status ~= nil then status else nil
end