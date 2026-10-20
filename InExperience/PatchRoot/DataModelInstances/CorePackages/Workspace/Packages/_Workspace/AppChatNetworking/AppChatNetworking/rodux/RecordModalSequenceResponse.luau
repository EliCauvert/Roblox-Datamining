local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(AppChatNetworking.responses.SharedTypes)
local NewResult = require(script:FindFirstAncestor("Packages").Loggers).Logger:new(script.Name)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Action_type, Modal_sequence, Modal_id, Modal_variant, Conversation_id, Friend_id)
	-- upvalues: NewResult (copy), CHATPLATFORMBASEURLModule (copy)
	if Conversation_id and Friend_id then
		NewResult:warn("Both conversation ID and friend ID provided to RecordModalSequenceResponse.")
	end
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("record-modal-sequence-response"):body({
		action_type = Action_type,
		modal_sequence = Modal_sequence,
		modal_id = Modal_id,
		modal_variant = Modal_variant,
		conversation_id = Conversation_id,
		friend_id = Friend_id
	})
end)