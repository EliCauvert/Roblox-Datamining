local CreateSignalFunction = require(script:FindFirstAncestor("InExperienceShop").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	
	return {
		getEnabled = Signal,
		setEnabled = Signal2,
		getStatusIndicatorEnabled = Signal1,
		setStatusIndicatorEnabled = Signal2_1,
		getIconInstance = Signal3,
		setIconInstance = Signal2_2
	}
end