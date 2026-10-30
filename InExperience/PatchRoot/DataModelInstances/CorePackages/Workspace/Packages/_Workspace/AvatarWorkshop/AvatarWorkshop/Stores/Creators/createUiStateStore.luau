local CreateSignalFunction = require(script:FindFirstAncestor("AvatarWorkshop").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(0)
	
	return {
		getLastMeasuredGridWidth = Signal,
		setLastMeasuredGridWidth = Signal2
	}
end