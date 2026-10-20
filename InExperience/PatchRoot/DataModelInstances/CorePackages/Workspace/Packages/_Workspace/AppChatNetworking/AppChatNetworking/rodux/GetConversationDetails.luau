local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Parent = AppChatNetworking.Parent
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, p1)
	-- upvalues: CHATPLATFORMBASEURLModule (copy), GetFFlagEnableSocialCardsFunction (copy), GetFFlagIsSquadEnabledFunction (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("get-conversations"):body({
		include_participants = true,
		include_user_data = true,
		include_messages = true,
		ids = { p1 },
		include_cards = if GetFFlagEnableSocialCardsFunction() then true else false,
		check_for_group_up = if GetFFlagIsSquadEnabledFunction() then true else false
	}):setStatusIds({ p1 })
end)