local VideoService = game:GetService("VideoService")
local Full = Enum.VideoSampleSize.Full

return function(Content, p1)
	-- upvalues: VideoService (copy), Full (copy)
	local P1 = p1 or VideoService
	local VideoSamplerAsync = nil
	local Success, Result = pcall(function()
		-- upvalues: VideoSamplerAsync (ref), P1 (copy), Content (copy), Full (upval)
		VideoSamplerAsync = P1:CreateVideoSamplerAsync(Content, { Size = Full })
		
		return VideoSamplerAsync:GetSamplesAtTimesAsync({ 0 })
	end)
	
	if VideoSamplerAsync ~= nil then
		pcall(function()
			-- upvalues: VideoSamplerAsync (ref)
			VideoSamplerAsync:Destroy()
		end)
	end
	if Success then
		local Entry = Result[1]
		
		return if Entry == nil then nil else Entry.Image
	else
		return nil
	end
end