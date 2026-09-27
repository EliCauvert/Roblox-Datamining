local getFFlagMomentsTTSAudioOverlayModule = require(script:FindFirstAncestor("MomentsCreation").Flags.GetFFlagMomentsTTSAudioOverlay)

return function(p1, p2, p3, p4, p5)
	-- upvalues: getFFlagMomentsTTSAudioOverlayModule (ref)
	task.spawn(function()
		-- upvalues: p5 (ref), p1 (ref), p4 (ref), getFFlagMomentsTTSAudioOverlayModule (copy), p2 (ref), p3 (ref)
		local ok, status = pcall(function()
			-- upvalues: p5 (copy), p1 (copy), p4 (copy), getFFlagMomentsTTSAudioOverlayModule (copy), p2 (copy)
			local var1 = (p5 or game:GetService("VideoService")):CreateVideoSamplerAsync(p1)
			local p6 = p4 or 0
			local t = {}
			
			for i = 0, (if getFFlagMomentsTTSAudioOverlayModule then math.max(1, math.floor(p2)) else math.floor(p2)) - 1 do
				table.insert(t, p6 + i)
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