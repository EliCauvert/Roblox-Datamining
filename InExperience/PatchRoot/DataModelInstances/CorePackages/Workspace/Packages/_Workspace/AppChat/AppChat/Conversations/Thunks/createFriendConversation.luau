local AppChat = script:FindFirstAncestor("AppChat")
local NewResult = require(AppChat.Logger):new(script.Name)
local CreateConversationModule = require(script.Parent.createConversation)
local GetOtherParticipantsModule = require(AppChat.Conversations.getOtherParticipants)
local _ = require(AppChat.Models.ConversationChannels)
local FriendConversationCreatedModule = require(AppChat.Conversations.Actions.FriendConversationCreated)

return function(OldFriendConversationId, p1) --[[ Line: 9 | Named "createFriendConversation" ]]
	-- upvalues: NewResult (copy), GetOtherParticipantsModule (copy), CreateConversationModule (copy), FriendConversationCreatedModule (copy)
	return function(p2) --[[ Line: 10 ]]
		-- upvalues: OldFriendConversationId (copy), NewResult (upval), GetOtherParticipantsModule (upval), CreateConversationModule (upval), p1 (copy), FriendConversationCreatedModule (upval)
		local State = p2:getState()
		local Conversation = State.ChatAppReducer.Conversations[OldFriendConversationId]
		
		if not Conversation then
			NewResult:error("Could not find friendConversationId {} in store state. Unable to create converstation.", OldFriendConversationId)
			
			return
		end
		local OtherParticipantsModule = GetOtherParticipantsModule(Conversation, State.LocalUserId)
		
		if #OtherParticipantsModule > 1 then
			NewResult:error("friendConversationId {} has more than 2 participants. Unable to create one-to-one conversation.", OldFriendConversationId)
			
			return
		else
			return p2:dispatch(CreateConversationModule("one_to_one", { (tostring(OtherParticipantsModule[1])) }, p1, "userSentMessageToFriendPlaceholder")):tap(function(p3) --[[ Line: 41 ]]
				-- upvalues: p2 (copy), FriendConversationCreatedModule (upval), OldFriendConversationId (upval)
				p2:dispatch(FriendConversationCreatedModule({
					newConversationId = p3.id,
					oldFriendConversationId = OldFriendConversationId
				}))
			end)
		end
	end
end