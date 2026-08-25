local videoService = game:GetService("VideoService")
local full = Enum.VideoSampleSize.Full

return function(p0, p1)
	-- upvalues: videoService (ref), full (ref)
	p1 = p1 or videoService
	local var2 = nil
	local ok, status = pcall(function()
		-- upvalues: var2 (write), p1 (ref), p0 (ref), full (copy)
		var2 = p1:CreateVideoSamplerAsync(p0, { Size = full })
		
		return var2:GetSamplesAtTimesAsync({ 0 })
	end)
	
	if var2 ~= nil then
		pcall(function()
			-- upvalues: var2 (write)
			var2:Destroy()
		end)
	end
	if ok then
		local var3 = status[1]
		
		return if var3 ~= nil then nil else var3.Image
	end
	return nil
end