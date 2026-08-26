local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local serializeChatTimeoutRangeModule = require(appChat.Utils.serializeChatTimeoutRange)

return require(parent.Rodux).createReducer({ userTimeout = {}, byConversationId = {} }, {
	[require(parent.AppChatNetworking).rodux.GetChatModerationStatuses.Succeeded.name] = function(p1, p2)
		-- upvalues: serializeChatTimeoutRangeModule (ref), cryoModule (ref)
		local responseBody = p2.responseBody
		
		if responseBody.user_timeout_range then
			p1 = cryoModule.Dictionary.join(p1, {
				userTimeout = serializeChatTimeoutRangeModule(responseBody.user_timeout_range)
			})
		end
		if responseBody.conversation_timeout_ranges then
			for i, v in responseBody.conversation_timeout_ranges do
				p1 = cryoModule.Dictionary.join(p1, {
					byConversationId = cryoModule.Dictionary.join(p1.byConversationId, {
						[v.id] = serializeChatTimeoutRangeModule(v.timeout_range)
					})
				})
			end
		end
		return p1
	end,
	[require(appChat.Conversations.Actions.RemovedConversation).name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, {
			byConversationId = cryoModule.Dictionary.join(p3.byConversationId, { [p4.conversationId] = cryoModule.None })
		})
	end,
	[require(appChat.Conversations.Actions.CurrentConversationTimeoutEnded).name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		local var1 = p3
		local unixTimestamp = DateTime.now().UnixTimestamp
		
		if p3.userTimeout and p3.userTimeout.endTimestamp and p3.userTimeout.endTimestamp < unixTimestamp then
			var1 = cryoModule.Dictionary.join(var1, { userTimeout = {} })
		end
		local conversationId = p4.conversationId
		
		return if p3.byConversationId[conversationId] and p3.byConversationId[conversationId].endTimestamp and unixTimestamp > p3.byConversationId[conversationId].endTimestamp then cryoModule.Dictionary.join(var1, {
			byConversationId = cryoModule.Dictionary.join(var1.byConversationId, { [conversationId] = cryoModule.None })
		}) else var1
	end
})