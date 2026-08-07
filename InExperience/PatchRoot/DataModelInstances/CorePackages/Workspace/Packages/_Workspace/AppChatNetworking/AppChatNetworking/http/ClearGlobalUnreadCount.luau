local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default

return function(p0) --[[ line: 8 ]]
	-- upvalues: default (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p0 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/clear-global-unread-count`, "POST", { postBody = httpService:JSONEncode({}) })
end