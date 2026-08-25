local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(appChatNetworking.responses.SharedTypes)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("create-conversations"):body({
		conversations = {
			{
				type = "group",
				conversation_to_duplicate = p1,
				moderation_type = p2,
				participant_user_ids = {}
			}
		}
	}):setStatusIds({ p1 })
end)