local CreateSignalFunction = require(script:FindFirstAncestor("InExperienceShop").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	
	return {
		getEnabled = Signal,
		setEnabled = Signal2,
		getStatusIndicatorEnabled = function(p1)
			-- upvalues: Signal1 (copy), Signal3 (copy)
			return Signal1(p1) or Signal3(p1)
		end,
		setStatusIndicatorEnabled = Signal2_1,
		setFreeTrialStatusIndicatorEnabled = Signal2_2,
		getIconInstance = Signal4,
		setIconInstance = Signal2_3
	}
end