local SignalsModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal("")
	
	return {
		getQuery = Signal,
		getIsSearchActive = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: Signal (copy)
			return Signal(p1) ~= ""
		end),
		setQuery = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		clearQuery = function()
			-- upvalues: Signal2 (copy)
			Signal2("")
		end
	}
end