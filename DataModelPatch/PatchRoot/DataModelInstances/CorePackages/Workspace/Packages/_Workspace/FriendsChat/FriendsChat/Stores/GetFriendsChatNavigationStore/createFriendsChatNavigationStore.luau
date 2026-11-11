local CreateSignalFunction = require(script:FindFirstAncestor("FriendsChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(nil)
	
	return {
		getSelectedConversationId = Signal,
		setSelectedConversationId = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end
	}
end