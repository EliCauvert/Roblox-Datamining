local appChat = script:FindFirstAncestor("AppChat")
local name = require(appChat.Logger):new(script.Name)
local createConversationModule = require(script.Parent.createConversation)
local getOtherParticipantsModule = require(appChat.Conversations.getOtherParticipants)
local _ = require(appChat.Models.ConversationChannels)
local friendConversationCreatedModule = require(appChat.Conversations.Actions.FriendConversationCreated)

return function(p0, p1) --[[ line: 9 | named "createFriendConversation" ]]
	-- upvalues: name (ref), getOtherParticipantsModule (ref), createConversationModule (ref), friendConversationCreatedModule (ref)
	return function(p2) --[[ line: 10 ]]
		-- upvalues: p0 (ref), name (copy), getOtherParticipantsModule (copy), createConversationModule (copy), p1 (ref), friendConversationCreatedModule (copy)
		local state = p2:getState()
		local var6 = state.ChatAppReducer.Conversations[p0]
		
		if not var6 then
			name:error("Could not find friendConversationId {} in store state. Unable to create converstation.", p0)
			
			return
		end
		local var7 = getOtherParticipantsModule(var6, state.LocalUserId)
		
		if #var7 > 1 then
			name:error("friendConversationId {} has more than 2 participants. Unable to create one-to-one conversation.", p0)
			
			return
		end
		return p2:dispatch(createConversationModule("one_to_one", { tostring(var7[1]) }, p1, "userSentMessageToFriendPlaceholder")):tap(function(p3) --[[ line: 41 ]]
			-- upvalues: p2 (ref), friendConversationCreatedModule (copy), p0 (copy)
			p2:dispatch(friendConversationCreatedModule({ newConversationId = p3.id, oldFriendConversationId = p0 }))
		end)
	end
end