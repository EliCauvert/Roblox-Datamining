local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({}, {
	[require(parent.AppChatNetworking).rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		for i, v in p2.responseBody.conversation_participants_metadata do
			local t = {}
			
			for i_1, v_1 in v.participants_metadata do
				t[i_1] = {
					isPending = v_1.is_pending,
					isBlocked = v_1.is_blocked,
					isInviter = v_1.is_inviter,
					isInvited = v_1.is_invited
				}
			end
			p1 = cryoModule.Dictionary.join(p1, { [i] = t })
		end
		return p1
	end,
	[require(appChat.Conversations.Actions.RemovedConversation).name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		local conversationId = p4.conversationId
		
		return if conversationId then cryoModule.Dictionary.join(p3, { [conversationId] = cryoModule.None }) else p3
	end
})