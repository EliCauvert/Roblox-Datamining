local SignalsModule = require(script:FindFirstAncestor("CoreGuiCommon").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return { getVisibility = Signal, setVisibility = Signal2 }
end