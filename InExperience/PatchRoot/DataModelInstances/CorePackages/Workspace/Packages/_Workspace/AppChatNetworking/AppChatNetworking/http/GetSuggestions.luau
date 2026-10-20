local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default

return function(p1, Conversation_id, Suggestion_types, Max_suggestions)
	-- upvalues: Default (copy), HttpService (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/get-suggestions`, "POST", {
		postBody = HttpService:JSONEncode({
			conversation_id = Conversation_id,
			suggestion_types = Suggestion_types,
			max_suggestions = Max_suggestions
		})
	})
end