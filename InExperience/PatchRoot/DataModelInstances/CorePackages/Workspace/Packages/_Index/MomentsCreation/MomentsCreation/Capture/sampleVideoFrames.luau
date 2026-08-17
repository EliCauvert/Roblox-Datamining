return function(p0, p1, p2, p3) --[[ line: 21 | named "sampleVideoFrames" ]]
	task.spawn(function() --[[ line: 22 ]]
		-- upvalues: p0 (ref), p3 (ref), p1 (ref), p2 (ref)
		local ok, status = pcall(function() --[[ line: 23 ]]
			-- upvalues: p0 (copy), p3 (copy), p1 (copy)
			local var0 = game:GetService("VideoService"):CreateVideoSamplerAsync(p0)
			local p3_1 = p3 or 0
			local t = {}
			
			for i = 0, math.floor(p1) - 1 do
				table.insert(t, p3_1 + i)
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