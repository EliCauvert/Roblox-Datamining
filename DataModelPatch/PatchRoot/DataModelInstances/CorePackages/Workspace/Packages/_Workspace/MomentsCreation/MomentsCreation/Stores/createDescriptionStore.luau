local CreateSignalFunction = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction("")
	
	return { getDescription = Signal, setDescription = Signal2 }
end