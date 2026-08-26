local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v2"):path("get-modal-sequence"):body({
		is_in_experience = p2.isInExperience,
		modal_sequence = p2.modalSequence,
		conversation_id = p2.conversationId,
		friend_id = p2.friendId
	})
end)