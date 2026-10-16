local Parent = script.Parent.Parent
local _ = require(Parent.networkingChatTypes)
local CHATURLModule = require(Parent.CHAT_URL)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: CHATURLModule (copy)
	return p1.roduxNetworking.POST({ Name = "AddToConversation" }, function(Callback, ParticipantUserIds, ConversationId) --[[ Line: 9 ]]
		-- upvalues: CHATURLModule (upval)
		return Callback(CHATURLModule):path("v2"):path("add-to-conversation"):body({
			participantUserIds = ParticipantUserIds,
			conversationId = ConversationId
		}):setStatusIds({ ConversationId })
	end)
end