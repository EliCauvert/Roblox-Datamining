local captureService = game:GetService("CaptureService")

return function(p1)
	-- upvalues: captureService (ref)
	local ok, status = pcall(function()
		-- upvalues: captureService (copy), p1 (ref)
		return captureService:GetCaptureSizeAsync(p1)
	end)
	
	return if ok and status ~= Vector2.new(0, 0) then status else nil
end