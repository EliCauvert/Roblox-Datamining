local captureService = game:GetService("CaptureService")

return function(p0) --[[ line: 3 | named "getCaptureSize" ]]
	-- upvalues: captureService (ref)
	local ok, status = pcall(function() --[[ line: 4 ]]
		-- upvalues: captureService (copy), p0 (ref)
		return captureService:GetCaptureSizeAsync(p0)
	end)
	
	return if ok and status ~= Vector2.new(0, 0) then status else nil
end