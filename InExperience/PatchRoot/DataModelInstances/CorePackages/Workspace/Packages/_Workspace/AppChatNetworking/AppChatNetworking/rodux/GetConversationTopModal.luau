local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)
local NewResult = require(script:FindFirstAncestor("Packages").Loggers).Logger:new(script.Name)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Conversation_id, Is_in_experience, Friend_id)
	-- upvalues: NewResult (copy), CHATPLATFORMBASEURLModule (copy)
	if Conversation_id and Friend_id then
		NewResult:warning("Both conversation ID and friend ID provided to GetConversationTopModal.")
	end
	return Callback(CHATPLATFORMBASEURLModule):path("v2"):path("get-modal-sequence"):body({
		modal_sequence = "conversation_top_modal",
		is_in_experience = Is_in_experience,
		conversation_id = Conversation_id,
		friend_id = Friend_id
	})
end)