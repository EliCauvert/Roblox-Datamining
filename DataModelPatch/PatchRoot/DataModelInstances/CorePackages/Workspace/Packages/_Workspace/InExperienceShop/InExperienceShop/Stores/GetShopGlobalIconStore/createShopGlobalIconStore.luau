local CreateSignalFunction = require(script:FindFirstAncestor("InExperienceShop").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	
	return {
		getEnabled = Signal,
		setEnabled = Signal2,
		getStatusIndicatorEnabled = Signal1,
		setStatusIndicatorEnabled = Signal2_1
	}
end