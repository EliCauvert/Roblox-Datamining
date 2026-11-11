local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default
local GetFFlagEnableSocialCardsFunction = require(AppChatNetworking.Parent.SharedFlags).GetFFlagEnableSocialCards

return function(p1, Input, Input1)
	-- upvalues: Default (copy), HttpService (copy), GetFFlagEnableSocialCardsFunction (copy), CHATPLATFORMBASEURLModule (copy)
	local Callback = p1 or Default
	local ConversationName: string = `conversation_id={HttpService:UrlEncode(Input)}`
	
	if Input1 ~= nil and Input1 ~= "" then
		ConversationName = `{ConversationName}&cursor={HttpService:UrlEncode(Input1)}`
	end
	return Callback(`{CHATPLATFORMBASEURLModule}/v1/get-conversation-messages?{`{ConversationName}&include_cards={if GetFFlagEnableSocialCardsFunction() then "true" else "false"}`}`, "GET")
end