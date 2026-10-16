local SignalsModule = require(script:FindFirstAncestor("CoreGuiCommon").Parent.Signals)

return function() --[[ Line: 12 ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return { getVisibility = Signal, setVisibility = Signal2 }
end