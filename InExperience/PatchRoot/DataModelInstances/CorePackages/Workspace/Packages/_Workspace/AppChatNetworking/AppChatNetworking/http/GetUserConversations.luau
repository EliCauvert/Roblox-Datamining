local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local Parent = AppChatNetworking.Parent
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards

local function appendQueryArgs(ConversationsName, List) --[[ Line: 11 ]]
	-- upvalues: HttpService (copy)
	local List1 = {}
	
	for i, value in List do
		if value ~= nil then
			table.insert(List1, `{HttpService:UrlEncode(i)}={HttpService:UrlEncode((tostring(value)))}`)
		end
	end
	return if #List1 == 0 then ConversationsName else `{ConversationsName}?{table.concat(List1, "&")}`
end

return function(p1, p2) --[[ Line: 26 ]]
	-- upvalues: Default (copy), GetFFlagEnableSocialCardsFunction (copy), GetFFlagIsSquadEnabledFunction (copy), appendQueryArgs (copy), CHATPLATFORMBASEURLModule (copy)
	return (p1 or Default)(appendQueryArgs(`{CHATPLATFORMBASEURLModule}/v1/get-user-conversations`, {
		include_user_data = true,
		cursor = if p2 == nil or p2 == "" then nil else p2,
		include_cards = if GetFFlagEnableSocialCardsFunction() then true else false,
		check_for_group_up = if GetFFlagIsSquadEnabledFunction() then true else false
	}), "GET")
end