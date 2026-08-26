local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default

return function(p1, p2)
	-- upvalues: default (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p1 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-chat-moderation-statuses`, "POST", { postBody = httpService:JSONEncode({ ids = p2 or {} }) })
end