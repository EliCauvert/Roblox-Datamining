local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local VideoService = game:GetService("VideoService")
local Full = Enum.VideoSampleSize.Full

return function(Content) --[[ Line: 18 | Named "useVideoPosterFrame" ]]
	-- upvalues: ReactModule (copy), VideoService (copy), Full (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: UseStateResult2 (copy), Content (copy), VideoService (upval), Full (upval)
		UseStateResult2(nil)
		
		if Content == nil then return end
		local Flag = false
		task.spawn(function() --[[ Line: 28 ]]
			-- upvalues: VideoService (upval), Content (upval), Full (upval), Flag (ref), UseStateResult2 (upval)
			local VideoSamplerAsync = nil
			local Success, Result = pcall(function() --[[ Line: 30 ]]
				-- upvalues: VideoSamplerAsync (ref), VideoService (upval), Content (upval), Full (upval)
				VideoSamplerAsync = VideoService:CreateVideoSamplerAsync(Content, { Size = Full })
				
				return VideoSamplerAsync:GetSamplesAtTimesAsync({ 0 })
			end)
			
			if VideoSamplerAsync ~= nil then
				pcall(function() --[[ Line: 37 ]]
					-- upvalues: VideoSamplerAsync (ref)
					VideoSamplerAsync:Destroy()
				end)
			end
			if Flag then return end
			local Entry = if Success then Result[1] else nil
			
			if Entry ~= nil and Entry.Image ~= nil then
				UseStateResult2(Entry.Image)
			end
		end)
		
		return function() --[[ Line: 50 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Content })
	
	return UseStateResult
end