local captureService = game:GetService("CaptureService")

return function(p0)
	-- upvalues: captureService (ref)
	local ok, status = pcall(function()
		-- upvalues: captureService (copy), p0 (ref)
		return captureService:GetCaptureSizeAsync(p0)
	end)
	
	return if ok and status ~= Vector2.new(0, 0) then status else nil
end