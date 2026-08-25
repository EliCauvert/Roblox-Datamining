local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local getFFlagEnableSocialCards = require(appChatNetworking.Parent.SharedFlags).GetFFlagEnableSocialCards

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref), getFFlagEnableSocialCards (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-conversations"):body({
		include_participants = true,
		include_user_data = true,
		include_messages = true,
		check_for_group_up = true,
		ids = p1,
		include_cards = if getFFlagEnableSocialCards() then true else false
	}):setStatusIds(p1)
end)