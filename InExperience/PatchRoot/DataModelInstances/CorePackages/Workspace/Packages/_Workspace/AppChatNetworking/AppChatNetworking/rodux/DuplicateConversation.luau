local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(appChatNetworking.responses.SharedTypes)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2, p3)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("create-conversations"):body({
		conversations = {
			{
				type = "group",
				conversation_to_duplicate = p2,
				moderation_type = p3,
				participant_user_ids = {}
			}
		}
	}):setStatusIds({ p2 })
end)