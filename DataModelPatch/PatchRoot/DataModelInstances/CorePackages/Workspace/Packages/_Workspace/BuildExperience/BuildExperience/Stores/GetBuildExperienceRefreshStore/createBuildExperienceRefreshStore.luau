local SignalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	
	return {
		getRefreshTick = Signal,
		bumpRefreshTick = function()
			-- upvalues: Signal2 (copy)
			Signal2(function(p1: number): number
				return p1 + 1
			end)
		end
	}
end