local ConstantsModule = require(script:FindFirstAncestor("CrossExperience").Constants)
local v1 = nil
local Flag = false

local function _() --[[ Line: 7 ]]
	-- upvalues: Flag (ref), v1 (ref)
	if not Flag then
		local Success, Result = pcall(function() --[[ Line: 9 ]]
			return game:GetService("AudioFocusService")
		end)
		
		if Success and Result then
			v1 = Result
		end
		Flag = true
	end
	return v1
end

return function(): boolean --[[ Line: 20 ]]
	-- upvalues: Flag (ref), v1 (ref), ConstantsModule (copy)
	if not Flag then
		local Success, Result = pcall(function() --[[ Line: 9 ]]
			return game:GetService("AudioFocusService")
		end)
		
		if Success and Result then
			v1 = Result
		end
		Flag = true
	end
	local AudioFocusService = v1
	
	return if AudioFocusService then AudioFocusService:GetFocusedContextId() == ConstantsModule.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID else false
end