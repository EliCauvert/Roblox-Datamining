local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local getFFlagEnableSocialCards = require(appChatNetworking.Parent.SharedFlags).GetFFlagEnableSocialCards

return require(script.Parent.RoduxNetworking).GET(script.Name, function(p0, p1, p2) --[[ line: 16 ]]
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref), getFFlagEnableSocialCards (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-conversation-messages"):queryArgs({
		conversation_id = p1,
		cursor = p2,
		include_cards = if getFFlagEnableSocialCards() then true else false
	}):setStatusIds({ p1 })
end)