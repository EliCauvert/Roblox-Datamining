return function(p1)
	if p1 == nil then
		return false
	else
		local Success, Result = pcall(function(): boolean
			-- upvalues: p1 (copy)
			if game:GetFastFlag("EnableManualVad") then
				p1.VoiceDetectedOverride = false
				p1.DisableVoiceDetection = true
				
				return true
			else
				return false
			end
		end)
		
		return Success and Result
	end
end