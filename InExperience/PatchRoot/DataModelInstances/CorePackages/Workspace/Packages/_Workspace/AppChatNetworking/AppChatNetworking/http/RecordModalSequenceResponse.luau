local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local _ = require(appChatNetworking.responses.SharedTypes)

return function(p0, p1)
	-- upvalues: default (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p0 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/record-modal-sequence-response`, "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({
			action_type = p1.actionType,
			modal_sequence = p1.modalSequence,
			modal_id = p1.modalId,
			modal_variant = p1.modalVariant,
			conversation_id = p1.conversationId,
			friend_id = p1.friendId
		})
	})
end