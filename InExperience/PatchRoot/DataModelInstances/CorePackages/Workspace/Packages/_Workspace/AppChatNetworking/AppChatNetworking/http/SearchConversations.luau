local httpService = game:GetService("HttpService")
local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local default = require(appChatNetworking.url.HttpRequest).default
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

return function(p1, p2, p3, p4)
	-- upvalues: default (ref), httpService (ref), getFFlagEnableSocialCards (ref), getFFlagIsSquadEnabled (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	return (p1 or default)(`{CHAT_PLATFORM_BASE_URLModule}/v1/search-conversations`, "POST", {
		postBody = httpService:JSONEncode({
			include_user_data = true,
			include_participants = true,
			include_messages = true,
			query = p2,
			limit = p4,
			cursor = if p3 == nil or p3 == "" then nil else p3,
			include_cards = if getFFlagEnableSocialCards() then true else false,
			check_for_group_up = if getFFlagIsSquadEnabled() then true else false
		})
	})
end