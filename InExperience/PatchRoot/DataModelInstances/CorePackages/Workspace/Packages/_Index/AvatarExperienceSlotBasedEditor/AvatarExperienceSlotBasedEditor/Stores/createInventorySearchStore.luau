local SignalsModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.Signals)

return function(Callback)
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal("")
	
	return {
		getQuery = Signal,
		getIsSearchActive = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: Signal (copy)
			return Signal(p1) ~= ""
		end),
		setQuery = function(p1)
			-- upvalues: Callback (copy), Signal (copy), Signal2 (copy)
			if Callback and p1 ~= Signal(false) then
				Callback()
			end
			Signal2(p1)
		end,
		clearQuery = function()
			-- upvalues: Callback (copy), Signal (copy), Signal2 (copy)
			if Callback and Signal(false) ~= "" then
				Callback()
			end
			Signal2("")
		end
	}
end