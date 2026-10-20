local SignalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return {
		getIsHandled = Signal,
		markHandled = function()
			-- upvalues: Signal2 (copy)
			Signal2(true)
		end,
		reset = function()
			-- upvalues: Signal2 (copy)
			Signal2(false)
		end
	}
end