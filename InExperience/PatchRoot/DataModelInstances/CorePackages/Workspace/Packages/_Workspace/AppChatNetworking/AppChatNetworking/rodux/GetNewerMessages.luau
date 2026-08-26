local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local parent = appChatNetworking.Parent
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local roduxNetworkingModule = require(script.Parent.RoduxNetworking)
local constantsModule = require(appChatNetworking.Constants)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards

return roduxNetworkingModule.GET(script.Name, function(p1, p2, p3)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref), constantsModule (ref), getFFlagEnableSocialCards (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-conversation-messages"):queryArgs({
		conversation_id = p2,
		cursor = p3,
		constantsModule.PageSize.GET_NEW_MESSAGES,
		include_cards = if getFFlagEnableSocialCards() then true else false
	}):setStatusIds({ p2 })
end)