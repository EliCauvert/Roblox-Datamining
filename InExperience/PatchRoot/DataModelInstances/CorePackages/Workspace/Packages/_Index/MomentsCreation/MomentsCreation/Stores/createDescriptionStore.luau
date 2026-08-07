local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function() --[[ line: 18 | named "createDescriptionStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal("")
	
	return { getDescription = var0, setDescription = var1 }
end