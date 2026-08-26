local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local roduxNetworkingModule = require(script.Parent.RoduxNetworking)
local parent = appChatNetworking.Parent
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

return roduxNetworkingModule.POST(script.Name, function(p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref), getFFlagEnableSocialCards (ref), getFFlagIsSquadEnabled (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-conversations"):body({
		include_participants = true,
		include_user_data = true,
		include_messages = true,
		ids = { p2 },
		include_cards = if getFFlagEnableSocialCards() then true else false,
		check_for_group_up = if getFFlagIsSquadEnabled() then true else false
	}):setStatusIds({ p2 })
end)