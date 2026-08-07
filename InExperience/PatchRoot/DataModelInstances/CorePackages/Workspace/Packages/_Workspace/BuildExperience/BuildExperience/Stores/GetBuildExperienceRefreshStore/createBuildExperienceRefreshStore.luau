local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

return function() --[[ line: 11 | named "createBuildExperienceRefreshStore" ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(0)
	
	return {
		getRefreshTick = var1,
		bumpRefreshTick = function() --[[ line: 14 ]]
			-- upvalues: var2 (ref)
			var2(function(p0) --[[ line: 15 ]]
				return p0 + 1
			end)
		end
	}
end