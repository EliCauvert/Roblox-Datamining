local CreateSignalFunction = require(script:FindFirstAncestor("AvatarWorkshop").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(0)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	
	return {
		getLastMeasuredGridWidth = Signal,
		setLastMeasuredGridWidth = Signal2,
		getIsRespawnDialogOpen = Signal1,
		setIsRespawnDialogOpen = Signal2_1
	}
end