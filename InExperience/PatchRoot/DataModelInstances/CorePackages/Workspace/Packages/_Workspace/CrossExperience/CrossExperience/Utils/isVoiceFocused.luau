local constantsModule = require(script:FindFirstAncestor("CrossExperience").Constants)
local var1 = nil
local var2 = false

local _ = function() --[[ line: 7 ]]
	-- upvalues: var2 (write), var1 (write)
	if not var2 then
		local ok, status = pcall(function() --[[ line: 9 ]]
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			var1 = status
		end
		var2 = true
	end
	return var1
end

return function() --[[ line: 20 ]]
	-- upvalues: var2 (write), var1 (write), constantsModule (ref)
	if not var2 then
		local ok, status = pcall(function() --[[ line: 9 ]]
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			var1 = status
		end
		var2 = true
	end
	local var3 = var1
	
	return if var3 then var3:GetFocusedContextId() == constantsModule.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID else false
end