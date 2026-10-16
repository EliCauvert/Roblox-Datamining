local CreateSignalFunction = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function() --[[ Line: 20 | Named "createSelectionStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	
	return {
		getSelectedCapture = Signal,
		setSelectedCapture = Signal2
	}
end