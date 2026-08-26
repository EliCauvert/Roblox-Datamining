local createSignal = require(script:FindFirstAncestor("CoreGuiCommon").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	
	return { getInspectAndBuyOpen = var1, setInspectAndBuyOpen = var2 }
end