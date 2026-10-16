local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Conversation_id, Message_id) --[[ Line: 6 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("translate-user-message"):body({
		conversation_id = Conversation_id,
		message_id = Message_id
	})
end)