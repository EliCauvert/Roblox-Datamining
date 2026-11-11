return function(Content, Value, Callback)
	task.spawn(function()
		-- upvalues: Content (copy), Value (copy), Callback (copy)
		local Success, Result = pcall(function()
			-- upvalues: Content (upval), Value (upval)
			local VideoSamplerAsync = game:GetService("VideoService"):CreateVideoSamplerAsync(Content)
			local List = {}
			
			for i = 0, math.floor(Value) - 1 do
				table.insert(List, i)
			end
			return VideoSamplerAsync:GetSamplesAtTimesAsync(List)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback({})
		end
	end)
end