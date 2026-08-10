local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

return function(p0, p1, p2) --[[ line: 12 ]]
	-- upvalues: default (ref), httpService (ref), getFFlagEnableSocialCards (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	p0 = p0 or default
	local var4 = `conversation_id={httpService:UrlEncode(p1)}`
	
	if p2 ~= nil and p2 ~= "" then
		var4 = `{var4}&cursor={httpService:UrlEncode(p2)}`
	end
	return p0(`{CHAT_PLATFORM_BASE_URLModule}/v1/get-conversation-messages?{`{var4}&include_cards={if getFFlagEnableSocialCards() then "true" else "false"}`}`, "GET")
end