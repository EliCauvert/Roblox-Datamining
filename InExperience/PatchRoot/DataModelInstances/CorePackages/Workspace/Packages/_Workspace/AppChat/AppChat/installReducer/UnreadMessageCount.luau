local parent = script:FindFirstAncestor("AppChat").Parent

return require(parent.Rodux).createReducer(0, {
	[require(parent.AppChatNetworking).rodux.GetConversationMetadata.Succeeded.name] = function(p0, p1)
		local responseBody = p1.responseBody
		
		return if responseBody and responseBody.global_unread_message_count then responseBody.global_unread_message_count else p0
	end
})