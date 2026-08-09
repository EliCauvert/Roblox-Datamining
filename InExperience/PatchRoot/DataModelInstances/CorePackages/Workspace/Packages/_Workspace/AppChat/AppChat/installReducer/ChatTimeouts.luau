local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)

local function serializeChatTimeoutRange(p0) --[[ line: 33 ]]
	local currentDateTime = DateTime.now()
	
	return {
		endTimestamp = math.clamp(currentDateTime.UnixTimestamp + p0.time_remaining, -17987443200, 253402300799),
		decisionEventId = p0.decision_event_id,
		duration = math.clamp((DateTime.fromIsoDate(p0.end_time) or currentDateTime).UnixTimestamp - (DateTime.fromIsoDate(p0.start_time) or currentDateTime).UnixTimestamp, 0, 253402300799)
	}
end

return require(parent.Rodux).createReducer({ userTimeout = {}, byConversationId = {} }, {
	[require(parent.AppChatNetworking).rodux.GetChatModerationStatuses.Succeeded.name] = function(p1, p2) --[[ line: 45 ]]
		-- upvalues: serializeChatTimeoutRange (ref), cryoModule (ref)
		local responseBody = p2.responseBody
		
		if responseBody.user_timeout_range then
			p1 = cryoModule.Dictionary.join(p1, {
				userTimeout = serializeChatTimeoutRange(responseBody.user_timeout_range)
			})
		end
		if responseBody.conversation_timeout_ranges then
			for i, v in responseBody.conversation_timeout_ranges do
				p1 = cryoModule.Dictionary.join(p1, {
					byConversationId = cryoModule.Dictionary.join(p1.byConversationId, { [v.id] = serializeChatTimeoutRange(v.timeout_range) })
				})
			end
		end
		return p1
	end,
	[require(appChat.Conversations.Actions.RemovedConversation).name] = function(p3, p4) --[[ line: 66 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, {
			byConversationId = cryoModule.Dictionary.join(p3.byConversationId, { [p4.conversationId] = cryoModule.None })
		})
	end,
	[require(appChat.Conversations.Actions.CurrentConversationTimeoutEnded).name] = function(p5, p6) --[[ line: 74 ]]
		-- upvalues: cryoModule (ref)
		local var4 = p5
		local unixTimestamp = DateTime.now().UnixTimestamp
		
		if p5.userTimeout and p5.userTimeout.endTimestamp and p5.userTimeout.endTimestamp < unixTimestamp then
			var4 = cryoModule.Dictionary.join(var4, { userTimeout = {} })
		end
		local conversationId = p6.conversationId
		
		return if p5.byConversationId[conversationId] and p5.byConversationId[conversationId].endTimestamp and unixTimestamp > p5.byConversationId[conversationId].endTimestamp then cryoModule.Dictionary.join(var4, {
			byConversationId = cryoModule.Dictionary.join(var4.byConversationId, { [conversationId] = cryoModule.None })
		}) else var4
	end
})