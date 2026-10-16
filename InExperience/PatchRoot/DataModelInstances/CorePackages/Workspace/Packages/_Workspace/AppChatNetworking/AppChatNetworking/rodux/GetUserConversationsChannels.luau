local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Parent = AppChatNetworking.Parent
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards

return require(script.Parent.RoduxNetworking).GET(script.Name, function(Callback, Cursor) --[[ Line: 9 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy), GetFFlagEnableSocialCardsFunction (copy), GetFFlagIsSquadEnabledFunction (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("get-user-conversations"):queryArgs({
		include_user_data = true,
		include_messages = true,
		cursor = Cursor,
		include_cards = if GetFFlagEnableSocialCardsFunction() then true else false,
		check_for_group_up = if GetFFlagIsSquadEnabledFunction() then true else false
	})
end)