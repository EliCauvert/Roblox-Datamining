local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

return function(p1, p2, p3)
	-- upvalues: default (ref), httpService (ref), getFFlagEnableSocialCards (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	p1 = p1 or default
	local var1 = `conversation_id={httpService:UrlEncode(p2)}`
	
	if p3 ~= nil and p3 ~= "" then
		var1 = `{var1}&cursor={httpService:UrlEncode(p3)}`
	end
	return p1(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-conversation-messages?{`{var1}&include_cards={if getFFlagEnableSocialCards() then "true" else "false"}`}`, "GET")
end