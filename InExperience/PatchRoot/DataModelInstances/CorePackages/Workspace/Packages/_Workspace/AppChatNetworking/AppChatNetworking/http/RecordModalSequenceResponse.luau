local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default
local _ = require(AppChatNetworking.responses.SharedTypes)

return function(p1, p2)
	-- upvalues: Default (copy), HttpService (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/record-modal-sequence-response`, "POST", {
		maxRetryCount = 0,
		postBody = HttpService:JSONEncode({
			action_type = p2.actionType,
			modal_sequence = p2.modalSequence,
			modal_id = p2.modalId,
			modal_variant = p2.modalVariant,
			conversation_id = p2.conversationId,
			friend_id = p2.friendId
		})
	})
end