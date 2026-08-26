local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(nil)
	
	return { getSelectedCapture = var1, setSelectedCapture = var2 }
end