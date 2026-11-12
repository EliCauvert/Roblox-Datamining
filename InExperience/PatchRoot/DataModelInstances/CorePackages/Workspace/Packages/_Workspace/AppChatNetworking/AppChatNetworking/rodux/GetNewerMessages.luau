local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local Parent = AppChatNetworking.Parent
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local ConstantsModule = require(AppChatNetworking.Constants)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local FFlagAppChatEnableReactions = require(Parent.SharedFlags).FFlagAppChatEnableReactions

return require(script.Parent.RoduxNetworking).GET(script.Name, function(Callback, Conversation_id, Cursor)
	-- upvalues: CHATPLATFORMBASEURLModule (copy), ConstantsModule (copy), GetFFlagEnableSocialCardsFunction (copy), FFlagAppChatEnableReactions (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("get-conversation-messages"):queryArgs({
		conversation_id = Conversation_id,
		cursor = Cursor,
		ConstantsModule.PageSize.GET_NEW_MESSAGES,
		include_cards = if GetFFlagEnableSocialCardsFunction() then true else false,
		include_reactions = if FFlagAppChatEnableReactions then true else nil
	}):setStatusIds({ Conversation_id })
end)