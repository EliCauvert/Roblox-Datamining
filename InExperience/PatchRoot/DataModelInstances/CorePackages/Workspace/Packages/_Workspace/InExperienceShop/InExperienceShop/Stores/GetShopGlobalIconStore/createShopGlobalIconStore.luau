local createSignal = require(script:FindFirstAncestor("InExperienceShop").Parent.Signals).createSignal

return function() --[[ line: 13 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	local var2, var3 = createSignal(false)
	
	return {
		getEnabled = var0,
		setEnabled = var1,
		getStatusIndicatorEnabled = var2,
		setStatusIndicatorEnabled = var3
	}
end