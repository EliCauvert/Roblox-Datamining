local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local GetFFlagEnableSocialCardsFunction = require(AppChatNetworking.Parent.SharedFlags).GetFFlagEnableSocialCards

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Ids)
	-- upvalues: CHATPLATFORMBASEURLModule (copy), GetFFlagEnableSocialCardsFunction (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("get-conversations"):body({
		include_participants = true,
		include_user_data = true,
		include_messages = true,
		check_for_group_up = true,
		ids = Ids,
		include_cards = if GetFFlagEnableSocialCardsFunction() then true else false
	}):setStatusIds(Ids)
end)