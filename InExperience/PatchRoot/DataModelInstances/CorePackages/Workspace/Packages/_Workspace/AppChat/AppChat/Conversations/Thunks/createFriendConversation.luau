local appChat = script:FindFirstAncestor("AppChat")
local name = require(appChat.Logger):new(script.Name)
local createConversationModule = require(script.Parent.createConversation)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local _ = require(appChat.Models.ConversationChannels)
local friendConversationCreatedModule = require(appChat.Conversations.Actions.FriendConversationCreated)

return function(p1, p2)
	-- upvalues: name (ref), getOtherParticipantsModule (ref), createConversationModule (ref), friendConversationCreatedModule (ref)
	return function(p3)
		-- upvalues: p1 (ref), name (copy), getOtherParticipantsModule (copy), createConversationModule (copy), p2 (ref), friendConversationCreatedModule (copy)
		local state = p3:getState()
		local var1 = state.ChatAppReducer.Conversations[p1]
		
		if not var1 then
			name:error("Could not find friendConversationId {} in store state. Unable to create converstation.", p1)
			
			return
		end
		local var2 = getOtherParticipantsModule(var1, state.LocalUserId)
		
		if #var2 > 1 then
			name:error("friendConversationId {} has more than 2 participants. Unable to create one-to-one conversation.", p1)
			
			return
		end
		return p3:dispatch(createConversationModule("one_to_one", { tostring(var2[1]) }, p2, "userSentMessageToFriendPlaceholder")):tap(function(p4)
			-- upvalues: p3 (ref), friendConversationCreatedModule (copy), p1 (copy)
			p3:dispatch(friendConversationCreatedModule({ newConversationId = p4.id, oldFriendConversationId = p1 }))
		end)
	end
end