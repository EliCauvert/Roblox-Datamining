local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local Parent = AppChatNetworking.Parent
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards

return function(p1, Query, p2, Limit) --[[ Line: 13 ]]
	-- upvalues: Default (copy), HttpService (copy), GetFFlagEnableSocialCardsFunction (copy), GetFFlagIsSquadEnabledFunction (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/search-conversations`, "POST", {
		postBody = HttpService:JSONEncode({
			include_user_data = true,
			include_participants = true,
			include_messages = true,
			query = Query,
			limit = Limit,
			cursor = if p2 == nil or p2 == "" then nil else p2,
			include_cards = if GetFFlagEnableSocialCardsFunction() then true else false,
			check_for_group_up = if GetFFlagIsSquadEnabledFunction() then true else false
		})
	})
end