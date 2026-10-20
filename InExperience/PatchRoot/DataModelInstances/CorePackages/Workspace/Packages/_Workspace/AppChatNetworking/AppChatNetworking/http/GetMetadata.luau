local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default

return function(p1)
	-- upvalues: Default (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/metadata`, "GET")
end