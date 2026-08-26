local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local getFFlagEnableSocialCards = require(appChatNetworking.Parent.SharedFlags).GetFFlagEnableSocialCards

return require(script.Parent.RoduxNetworking).GET(script.Name, function(p1, p2, p3)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref), getFFlagEnableSocialCards (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-conversation-messages"):queryArgs({
		conversation_id = p2,
		cursor = p3,
		include_cards = if getFFlagEnableSocialCards() then true else false
	}):setStatusIds({ p2 })
end)