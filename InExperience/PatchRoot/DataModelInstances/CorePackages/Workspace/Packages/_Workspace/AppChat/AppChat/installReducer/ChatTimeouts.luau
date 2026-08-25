local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local serializeChatTimeoutRangeModule = require(appChat.Utils.serializeChatTimeoutRange)

return require(parent.Rodux).createReducer({ userTimeout = {}, byConversationId = {} }, {
	[require(parent.AppChatNetworking).rodux.GetChatModerationStatuses.Succeeded.name] = function(p0, p1)
		-- upvalues: serializeChatTimeoutRangeModule (ref), cryoModule (ref)
		local responseBody = p1.responseBody
		
		if responseBody.user_timeout_range then
			p0 = cryoModule.Dictionary.join(p0, {
				userTimeout = serializeChatTimeoutRangeModule(responseBody.user_timeout_range)
			})
		end
		if responseBody.conversation_timeout_ranges then
			for i, v in responseBody.conversation_timeout_ranges do
				p0 = cryoModule.Dictionary.join(p0, {
					byConversationId = cryoModule.Dictionary.join(p0.byConversationId, {
						[v.id] = serializeChatTimeoutRangeModule(v.timeout_range)
					})
				})
			end
		end
		return p0
	end,
	[require(appChat.Conversations.Actions.RemovedConversation).name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, {
			byConversationId = cryoModule.Dictionary.join(p2.byConversationId, { [p3.conversationId] = cryoModule.None })
		})
	end,
	[require(appChat.Conversations.Actions.CurrentConversationTimeoutEnded).name] = function(p4, p5)
		-- upvalues: cryoModule (ref)
		local var3 = p4
		local unixTimestamp = DateTime.now().UnixTimestamp
		
		if p4.userTimeout and p4.userTimeout.endTimestamp and p4.userTimeout.endTimestamp < unixTimestamp then
			var3 = cryoModule.Dictionary.join(var3, { userTimeout = {} })
		end
		local conversationId = p5.conversationId
		
		return if p4.byConversationId[conversationId] and p4.byConversationId[conversationId].endTimestamp and unixTimestamp > p4.byConversationId[conversationId].endTimestamp then cryoModule.Dictionary.join(var3, {
			byConversationId = cryoModule.Dictionary.join(var3.byConversationId, { [conversationId] = cryoModule.None })
		}) else var3
	end
})