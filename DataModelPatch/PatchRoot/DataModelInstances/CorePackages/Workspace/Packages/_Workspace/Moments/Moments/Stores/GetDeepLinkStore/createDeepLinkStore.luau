local CreateSignalFunction = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	
	return {
		getDeepLinkedMomentId = Signal,
		setDeepLinkedMomentId = Signal2,
		consumeDeepLinkedMomentId = function()
			-- upvalues: Signal (copy), Signal2 (copy)
			local SignalResult = Signal(false)
			
			if SignalResult then
				Signal2(nil)
			end
			return SignalResult
		end
	}
end