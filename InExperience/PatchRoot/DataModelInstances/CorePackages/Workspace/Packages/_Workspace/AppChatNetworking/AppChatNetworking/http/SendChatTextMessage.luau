local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default

return function(p1, Conversation_id, Content, Replies_to)
	-- upvalues: Default (copy), HttpService (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/send-messages`, "POST", {
		postBody = HttpService:JSONEncode({
			conversation_id = Conversation_id,
			messages = { { content = Content, replies_to = Replies_to } }
		})
	})
end