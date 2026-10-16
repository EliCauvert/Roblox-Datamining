local CreateSignalFunction = require(script:FindFirstAncestor("CoreGuiCommon").Parent.Signals).createSignal

return function() --[[ Line: 14 ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	
	return {
		getInspectAndBuyOpen = Signal,
		setInspectAndBuyOpen = Signal2
	}
end