local createSignal = require(script:FindFirstAncestor("InExperienceShop").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(false)
	local var5, var6 = createSignal(nil)
	
	return {
		getEnabled = var1,
		setEnabled = var2,
		getStatusIndicatorEnabled = var3,
		setStatusIndicatorEnabled = var4,
		getIconInstance = var5,
		setIconInstance = var6
	}
end