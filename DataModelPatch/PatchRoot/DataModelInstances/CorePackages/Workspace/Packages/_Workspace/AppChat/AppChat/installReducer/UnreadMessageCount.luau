local Parent = script:FindFirstAncestor("AppChat").Parent

return require(Parent.Rodux).createReducer(0, {
	[require(Parent.AppChatNetworking).rodux.GetConversationMetadata.Succeeded.name] = function(p1, p2)
		local ResponseBody = p2.responseBody
		
		return if ResponseBody and ResponseBody.global_unread_message_count then ResponseBody.global_unread_message_count else p1
	end
})