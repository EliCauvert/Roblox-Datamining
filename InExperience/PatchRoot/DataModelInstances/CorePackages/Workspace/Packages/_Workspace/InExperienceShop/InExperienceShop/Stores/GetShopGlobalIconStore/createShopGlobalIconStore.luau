local createSignal = require(script:FindFirstAncestor("InExperienceShop").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(false)
	
	return {
		getEnabled = var1,
		setEnabled = var2,
		getStatusIndicatorEnabled = var3,
		setStatusIndicatorEnabled = var4
	}
end