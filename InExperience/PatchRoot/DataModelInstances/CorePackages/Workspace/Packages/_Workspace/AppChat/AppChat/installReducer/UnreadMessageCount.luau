local parent = script:FindFirstAncestor("AppChat").Parent

return require(parent.Rodux).createReducer(0, {
	[require(parent.AppChatNetworking).rodux.GetConversationMetadata.Succeeded.name] = function(p1, p2)
		local responseBody = p2.responseBody
		
		return if responseBody and responseBody.global_unread_message_count then responseBody.global_unread_message_count else p1
	end
})