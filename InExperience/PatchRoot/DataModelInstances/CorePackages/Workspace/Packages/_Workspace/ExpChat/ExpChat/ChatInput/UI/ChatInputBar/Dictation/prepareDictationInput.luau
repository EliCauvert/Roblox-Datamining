return function(p1)
	local Success, Result = pcall(function(): boolean
		-- upvalues: p1 (copy)
		if game:GetFastFlag("EnableManualVad") then
			p1.VoiceDetectedOverride = true
			
			return true
		else
			return false
		end
	end)
	
	return Success and Result
end