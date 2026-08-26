local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal("")
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal(nil)
	local var7, var8 = createSignal(nil)
	local var9, var10 = createSignal(nil)
	
	return {
		getDescription = var1,
		setDescription = var2,
		getGeneratedDescription = var3,
		setGeneratedDescription = var4,
		getGenerationToken = var5,
		setGenerationToken = var6,
		getGeneratedTextFeedback = var7,
		setGeneratedTextFeedback = var8,
		getGeneratedSummary = var9,
		setGeneratedSummary = var10
	}
end