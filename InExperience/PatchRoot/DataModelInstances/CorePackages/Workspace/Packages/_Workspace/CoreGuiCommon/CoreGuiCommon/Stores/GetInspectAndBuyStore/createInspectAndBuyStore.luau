local createSignal = require(script:FindFirstAncestor("CoreGuiCommon").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	
	return { getInspectAndBuyOpen = var0, setInspectAndBuyOpen = var1 }
end