local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, p1)
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v2"):path("get-modal-sequence"):body({
		is_in_experience = p1.isInExperience,
		modal_sequence = p1.modalSequence,
		conversation_id = p1.conversationId,
		friend_id = p1.friendId
	})
end)