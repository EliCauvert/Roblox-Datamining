local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default

return function(p1, p2, p3, p4)
	-- upvalues: default (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p1 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-suggestions`, "POST", {
		postBody = httpService:JSONEncode({
			conversation_id = p2,
			suggestion_types = p3,
			max_suggestions = p4
		})
	})
end