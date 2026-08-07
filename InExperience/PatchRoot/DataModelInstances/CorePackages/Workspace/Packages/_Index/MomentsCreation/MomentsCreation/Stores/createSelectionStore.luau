local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function() --[[ line: 20 | named "createSelectionStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	
	return { getSelectedCapture = var0, setSelectedCapture = var1 }
end