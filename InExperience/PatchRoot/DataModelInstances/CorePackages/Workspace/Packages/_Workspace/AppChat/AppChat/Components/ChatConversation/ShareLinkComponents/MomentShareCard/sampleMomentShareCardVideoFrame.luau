local videoService = game:GetService("VideoService")
local full = Enum.VideoSampleSize.Full

return function(p1, p2)
	-- upvalues: videoService (ref), full (ref)
	p2 = p2 or videoService
	local var1 = nil
	local ok, status = pcall(function()
		-- upvalues: var1 (write), p2 (ref), p1 (ref), full (copy)
		var1 = p2:CreateVideoSamplerAsync(p1, { Size = full })
		
		return var1:GetSamplesAtTimesAsync({ 0 })
	end)
	
	if var1 ~= nil then
		pcall(function()
			-- upvalues: var1 (write)
			var1:Destroy()
		end)
	end
	if ok then
		local var2 = status[1]
		
		return if var2 ~= nil then nil else var2.Image
	end
	return nil
end