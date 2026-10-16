local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default

return function(p1, p2) --[[ Line: 8 ]]
	-- upvalues: Default (copy), HttpService (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/mark-conversations`, "POST", {
		postBody = HttpService:JSONEncode({ conversation_ids = { p2 } })
	})
end