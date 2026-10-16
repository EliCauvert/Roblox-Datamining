local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)

return require(Parent.Rodux).createReducer({}, {
	[require(Parent.AppChatNetworking).rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p1, p2) --[[ Line: 24 ]]
		-- upvalues: CryoModule (copy)
		for i, value in p2.responseBody.conversation_participants_metadata do
			local t = {}
			
			for i1, value1 in value.participants_metadata do
				t[i1] = {
					isPending = value1.is_pending,
					isBlocked = value1.is_blocked,
					isInviter = value1.is_inviter,
					isInvited = value1.is_invited
				}
			end
			p1 = CryoModule.Dictionary.join(p1, { [i] = t })
		end
		return p1
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p3, p4) --[[ Line: 46 ]]
		-- upvalues: CryoModule (copy)
		local ConversationId = p4.conversationId
		
		return if ConversationId then CryoModule.Dictionary.join(p3, { [ConversationId] = CryoModule.None }) else p3
	end
})