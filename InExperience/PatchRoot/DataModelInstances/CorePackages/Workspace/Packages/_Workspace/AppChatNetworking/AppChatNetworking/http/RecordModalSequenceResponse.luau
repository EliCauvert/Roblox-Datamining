local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local _ = require(appChatNetworking.responses.SharedTypes)

return function(p1, p2)
	-- upvalues: default (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p1 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/record-modal-sequence-response`, "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({
			action_type = p2.actionType,
			modal_sequence = p2.modalSequence,
			modal_id = p2.modalId,
			modal_variant = p2.modalVariant,
			conversation_id = p2.conversationId,
			friend_id = p2.friendId
		})
	})
end