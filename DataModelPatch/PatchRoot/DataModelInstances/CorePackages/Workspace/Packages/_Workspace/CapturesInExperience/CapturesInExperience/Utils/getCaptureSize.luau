local CaptureService = game:GetService("CaptureService")

return function(CaptureContent)
	-- upvalues: CaptureService (copy)
	local Success, Result = pcall(function()
		-- upvalues: CaptureService (upval), CaptureContent (copy)
		return CaptureService:GetCaptureSizeAsync(CaptureContent)
	end)
	
	return if Success and Result ~= Vector2.new(0, 0) then Result else nil
end