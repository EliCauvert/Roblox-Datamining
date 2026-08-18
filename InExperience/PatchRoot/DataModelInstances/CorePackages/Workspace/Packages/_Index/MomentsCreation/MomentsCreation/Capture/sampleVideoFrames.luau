return function(p0, p1, p2) --[[ line: 17 | named "sampleVideoFrames" ]]
	task.spawn(function() --[[ line: 18 ]]
		-- upvalues: p0 (ref), p1 (ref), p2 (ref)
		local ok, status = pcall(function() --[[ line: 19 ]]
			-- upvalues: p0 (copy), p1 (copy)
			local var0 = game:GetService("VideoService"):CreateVideoSamplerAsync(p0)
			local t = {}
			
			for i = 0, math.floor(p1) - 1 do
				table.insert(t, i)
			end
			return var0:GetSamplesAtTimesAsync(t)
		end)
		
		if ok then
			p2(status)
			
			return
		end
		p2({})
	end)
end