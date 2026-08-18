local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function() --[[ line: 21 | named "createDescriptionStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal("")
	local var2, var3 = createSignal(nil)
	
	return {
		getDescription = var0,
		setDescription = var1,
		getGeneratedDescription = var2,
		setGeneratedDescription = var3
	}
end