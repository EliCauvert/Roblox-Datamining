return function(p1, p2, p3, p4)
	task.spawn(function()
		-- upvalues: p1 (ref), p4 (ref), p2 (ref), p3 (ref)
		local ok, status = pcall(function()
			-- upvalues: p1 (copy), p4 (copy), p2 (copy)
			local var1 = game:GetService("VideoService"):CreateVideoSamplerAsync(p1)
			local p5 = p4 or 0
			local t = {}
			
			for i = 0, math.floor(p2) - 1 do
				table.insert(t, p5 + i)
			end
			return var1:GetSamplesAtTimesAsync(t)
		end)
		
		if ok then
			p3(status)
			
			return
		end
		p3({})
	end)
end