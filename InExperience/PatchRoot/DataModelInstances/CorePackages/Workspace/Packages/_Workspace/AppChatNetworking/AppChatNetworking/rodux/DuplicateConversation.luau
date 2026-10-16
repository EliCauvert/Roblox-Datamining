local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(AppChatNetworking.responses.SharedTypes)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Conversation_to_duplicate, Moderation_type) --[[ Line: 10 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("create-conversations"):body({
		conversations = {
			{
				type = "group",
				conversation_to_duplicate = Conversation_to_duplicate,
				moderation_type = Moderation_type,
				participant_user_ids = {}
			}
		}
	}):setStatusIds({ Conversation_to_duplicate })
end)