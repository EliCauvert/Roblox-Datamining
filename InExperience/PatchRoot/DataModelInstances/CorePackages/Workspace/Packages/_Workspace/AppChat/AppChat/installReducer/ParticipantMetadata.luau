local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)

return require(parent.Rodux).createReducer({}, {
	[require(parent.AppChatNetworking).rodux.GetConversationsParticipantsMetadata.Succeeded.name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		for i, v in p1.responseBody.conversation_participants_metadata do
			local t = {}
			
			for i_1, v_1 in v.participants_metadata do
				t[i_1] = {
					isPending = v_1.is_pending,
					isBlocked = v_1.is_blocked,
					isInviter = v_1.is_inviter,
					isInvited = v_1.is_invited
				}
			end
			p0 = cryoModule.Dictionary.join(p0, { [i] = t })
		end
		return p0
	end,
	[require(appChat.Conversations.Actions.RemovedConversation).name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		local conversationId = p3.conversationId
		
		return if conversationId then cryoModule.Dictionary.join(p2, { [conversationId] = cryoModule.None }) else p2
	end
})