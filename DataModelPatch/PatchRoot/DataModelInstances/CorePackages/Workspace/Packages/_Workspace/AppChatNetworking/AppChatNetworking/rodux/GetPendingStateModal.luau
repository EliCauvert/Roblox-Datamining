local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Conversation_id, Is_in_experience)
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v2"):path("get-modal-sequence"):body({
		modal_sequence = "pending_state_modal",
		is_in_experience = Is_in_experience,
		conversation_id = Conversation_id
	})
end)