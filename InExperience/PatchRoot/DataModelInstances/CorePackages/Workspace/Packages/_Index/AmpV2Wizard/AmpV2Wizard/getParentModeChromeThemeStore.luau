local SignalsModule = require(script:FindFirstAncestor("AmpV2Wizard").Parent.Signals)

return SignalsModule.createComputed(function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return { getIsActive = Signal, setIsActive = Signal2 }
end)