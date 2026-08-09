local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default

return function(p0, p1, p2) --[[ line: 10 ]]
	-- upvalues: default (ref), httpService (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	p0 = p0 or default
	local var4 = `conversation_id={httpService:UrlEncode(p1)}`
	
	if p2 ~= nil and p2 ~= "" then
		var4 = `{var4}&cursor={httpService:UrlEncode(p2)}`
	end
	return p0(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-conversation-messages?{var4}`, "GET")
end