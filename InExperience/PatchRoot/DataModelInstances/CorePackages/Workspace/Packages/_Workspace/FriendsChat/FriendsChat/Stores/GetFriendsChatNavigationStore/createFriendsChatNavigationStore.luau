local createSignal = require(script:FindFirstAncestor("FriendsChat").Parent.Signals).createSignal

return function() --[[ line: 11 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	
	return {
		getSelectedConversationId = var0,
		setSelectedConversationId = var1
	}
end