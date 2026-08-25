local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal("")
	local var2, var3 = createSignal(nil)
	local var4, var5 = createSignal(nil)
	local var6, var7 = createSignal(nil)
	local var8, var9 = createSignal(nil)
	
	return {
		getDescription = var0,
		setDescription = var1,
		getGeneratedDescription = var2,
		setGeneratedDescription = var3,
		getGenerationToken = var4,
		setGenerationToken = var5,
		getGeneratedTextFeedback = var6,
		setGeneratedTextFeedback = var7,
		getGeneratedSummary = var8,
		setGeneratedSummary = var9
	}
end