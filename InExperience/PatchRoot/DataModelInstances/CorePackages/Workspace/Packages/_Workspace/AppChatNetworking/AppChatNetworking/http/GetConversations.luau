local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local Parent = AppChatNetworking.Parent
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default
local Object = require(Parent.LuauPolyfill).Object
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local config = {
	include_participants = true,
	include_user_data = true,
	include_messages = true
}

return function(p1, p2, p3) --[[ Line: 25 ]]
	-- upvalues: Default (copy), Object (copy), config (copy), HttpService (copy), GetFFlagEnableSocialCardsFunction (copy), CHATPLATFORMBASEURLModule (copy)
	local AssignResult = Object.assign({}, config, p3 or {})
	
	return (p1 or Default)(`{CHATPLATFORMBASEURLModule}/v1/get-conversations`, "POST", {
		postBody = HttpService:JSONEncode({
			ids = { p2 },
			include_participants = AssignResult.include_participants,
			include_user_data = AssignResult.include_user_data,
			include_messages = AssignResult.include_messages,
			include_cards = if GetFFlagEnableSocialCardsFunction() then true else false
		})
	})
end