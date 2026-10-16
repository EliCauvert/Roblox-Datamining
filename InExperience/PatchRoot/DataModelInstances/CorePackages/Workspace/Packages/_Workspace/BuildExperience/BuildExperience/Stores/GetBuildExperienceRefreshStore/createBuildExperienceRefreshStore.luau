local SignalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

return function() --[[ Line: 11 | Named "createBuildExperienceRefreshStore" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	
	return {
		getRefreshTick = Signal,
		bumpRefreshTick = function() --[[ Line: 14 ]]
			-- upvalues: Signal2 (copy)
			Signal2(function(p1: number): number --[[ Line: 15 ]]
				return p1 + 1
			end)
		end
	}
end