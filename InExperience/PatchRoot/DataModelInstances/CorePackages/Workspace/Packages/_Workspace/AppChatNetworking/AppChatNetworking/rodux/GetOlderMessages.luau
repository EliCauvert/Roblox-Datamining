local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local GetFFlagEnableSocialCardsFunction = require(AppChatNetworking.Parent.SharedFlags).GetFFlagEnableSocialCards

return require(script.Parent.RoduxNetworking).GET(script.Name, function(Callback, Conversation_id, Cursor) --[[ Line: 16 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy), GetFFlagEnableSocialCardsFunction (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("get-conversation-messages"):queryArgs({
		conversation_id = Conversation_id,
		cursor = Cursor,
		include_cards = if GetFFlagEnableSocialCardsFunction() then true else false
	}):setStatusIds({ Conversation_id })
end)