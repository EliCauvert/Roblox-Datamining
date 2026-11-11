local v1 = nil
local Flag = false

local function _()
	-- upvalues: Flag (ref), v1 (ref)
	if not Flag then
		local Success, Result = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if Success and Result then
			v1 = Result
		end
		Flag = true
	end
	return v1
end

return function(Callback: (any) -> ())
	-- upvalues: Flag (ref), v1 (ref)
	if not Flag then
		local Success, Result = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if Success and Result then
			v1 = Result
		end
		Flag = true
	end
	local AudioFocusService = v1
	
	if AudioFocusService then
		local FocusedContextId = AudioFocusService:GetFocusedContextId()
		Callback(FocusedContextId)
		
		local function Callback1()
			-- upvalues: AudioFocusService (copy), FocusedContextId (ref), Callback (copy)
			local FocusedContextId1 = AudioFocusService:GetFocusedContextId()
			
			if FocusedContextId ~= FocusedContextId1 then
				FocusedContextId = FocusedContextId1
				Callback(FocusedContextId)
			end
		end
		
		AudioFocusService.OnContextRegistered:Connect(Callback1)
		AudioFocusService.OnContextUnregistered:Connect(Callback1)
		AudioFocusService.OnDeafenVoiceAudio:Connect(Callback1)
		AudioFocusService.OnUndeafenVoiceAudio:Connect(Callback1)
	end
end