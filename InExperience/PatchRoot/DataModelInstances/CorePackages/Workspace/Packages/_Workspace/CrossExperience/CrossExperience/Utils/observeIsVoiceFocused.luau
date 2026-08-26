local crossExperience = script:FindFirstAncestor("CrossExperience")
local constantsModule = require(crossExperience.Constants)
local observeCurrentContextIdModule = require(crossExperience.Utils.observeCurrentContextId)

return function(p1)
	-- upvalues: observeCurrentContextIdModule (ref), constantsModule (ref)
	local var1 = nil
	observeCurrentContextIdModule(function(p2)
		-- upvalues: constantsModule (copy), var1 (write), p1 (ref)
		local var2 = p2 == constantsModule.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
		
		if var2 ~= var1 then
			var1 = var2
			p1(var1)
		end
	end)
end