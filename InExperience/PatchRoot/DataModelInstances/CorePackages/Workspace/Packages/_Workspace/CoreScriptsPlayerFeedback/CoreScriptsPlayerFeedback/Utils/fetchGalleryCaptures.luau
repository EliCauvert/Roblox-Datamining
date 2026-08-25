return function(p0, p1)
	p1 = p1 or { Enum.CaptureType.Screenshot }
	local var1 = if p0 ~= nil then game:GetService("CaptureService") else p0
	local ok, status = pcall(function()
		-- upvalues: var1 (write), p1 (ref)
		local var2, var3 = var1:ReadCapturesFromGalleryAsync(p1, false)
		
		return if var2 == Enum.ReadCapturesFromGalleryResult.Success then var3 else nil
	end)
	
	return if ok and status ~= nil then status else nil
end