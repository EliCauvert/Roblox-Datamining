local CreateSignalFunction = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function() --[[ Line: 35 | Named "createDescriptionStore" ]]
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction("")
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(nil)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	local Signal5, Signal2_4 = CreateSignalFunction(nil)
	local Signal6, Signal2_5 = CreateSignalFunction(true)
	
	return {
		getDescription = Signal,
		setDescription = Signal2,
		getGeneratedDescription = Signal1,
		setGeneratedDescription = Signal2_1,
		getGenerationToken = Signal3,
		setGenerationToken = Signal2_2,
		getGeneratedTextFeedback = Signal4,
		setGeneratedTextFeedback = Signal2_3,
		getGeneratedSummary = Signal5,
		setGeneratedSummary = Signal2_4,
		getCommentsEnabled = Signal6,
		setCommentsEnabled = Signal2_5
	}
end