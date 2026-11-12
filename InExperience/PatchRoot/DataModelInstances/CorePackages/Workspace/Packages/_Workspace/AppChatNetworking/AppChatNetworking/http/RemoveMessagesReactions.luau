local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default

return function(p1, Conversation_id, Message_id, Emote_id)
	-- upvalues: Default (copy), HttpService (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/remove-messages-reactions`, "POST", {
		postBody = HttpService:JSONEncode({
			conversation_id = Conversation_id,
			message_id = Message_id,
			emote_id = Emote_id
		})
	})
end