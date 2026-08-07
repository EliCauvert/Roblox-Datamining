local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1) --[[ line: 32 ]]
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v2"):path("get-modal-sequence"):body({
		is_in_experience = p1.isInExperience,
		modal_sequence = p1.modalSequence,
		conversation_id = p1.conversationId,
		friend_id = p1.friendId
	})
end)