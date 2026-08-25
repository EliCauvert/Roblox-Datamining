local crossExperience = script:FindFirstAncestor("CrossExperience")
local constantsModule = require(crossExperience.Constants)
local observeCurrentContextIdModule = require(crossExperience.Utils.observeCurrentContextId)

return function(p0)
	-- upvalues: observeCurrentContextIdModule (ref), constantsModule (ref)
	local var3 = nil
	observeCurrentContextIdModule(function(p1)
		-- upvalues: constantsModule (copy), var3 (write), p0 (ref)
		local var4 = p1 == constantsModule.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID
		
		if var4 ~= var3 then
			var3 = var4
			p0(var3)
		end
	end)
end