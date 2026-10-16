local GetFFlagMomentsTTSAudioOverlayModule = require(script:FindFirstAncestor("MomentsCreation").Flags.GetFFlagMomentsTTSAudioOverlay)

return function(Content, Value, Callback, p1, p2) --[[ Line: 25 | Named "sampleVideoFrames" ]]
	-- upvalues: GetFFlagMomentsTTSAudioOverlayModule (copy)
	task.spawn(function() --[[ Line: 32 ]]
		-- upvalues: p2 (copy), Content (copy), p1 (copy), GetFFlagMomentsTTSAudioOverlayModule (upval), Value (copy), Callback (copy)
		local Success, Result = pcall(function() --[[ Line: 33 ]]
			-- upvalues: p2 (upval), Content (upval), p1 (upval), GetFFlagMomentsTTSAudioOverlayModule (upval), Value (upval)
			local VideoSamplerAsync = (p2 or game:GetService("VideoService")):CreateVideoSamplerAsync(Content)
			local P1 = p1 or 0
			local List = {}
			local Largest: number = if GetFFlagMomentsTTSAudioOverlayModule then math.max(1, (math.floor(Value))) else math.floor(Value)
			for i = 0, Largest - 1 do
				table.insert(List, P1 + i)
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