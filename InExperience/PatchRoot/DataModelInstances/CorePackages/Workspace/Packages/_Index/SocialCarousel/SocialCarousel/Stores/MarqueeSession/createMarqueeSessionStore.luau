local CreateSignalFunction = require(script:FindFirstAncestor("SocialCarousel").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	
	return {
		getLoopsRemaining = Signal,
		getHomeFocusVersion = Signal1,
		notifyHomeFocused = function()
			-- upvalues: Signal2_1 (copy), Signal1 (copy)
			Signal2_1(Signal1(false) + 1)
		end,
		reset = function()
			-- upvalues: Signal2 (copy)
			Signal2({})
		end
	}
end