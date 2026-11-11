return function(Callback, p1)
	return function(p2)
		-- upvalues: p1 (copy), Callback (copy)
		local State = p2:getState()
		
		if State.ChatAppReducer.ConversationsAsync.oldestConversationIsFetched then return end
		local Count = 0
		
		for _, _ in pairs(State.ChatAppReducer.Conversations) do
			Count += 1
		end
		Callback(math.floor(Count / p1) + 1)
	end
end