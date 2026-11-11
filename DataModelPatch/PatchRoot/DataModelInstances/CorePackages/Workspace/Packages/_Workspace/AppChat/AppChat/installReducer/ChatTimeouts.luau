local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)

local function serializeChatTimeoutRange(TimeoutRange)
	local _DateTime = DateTime.now()
	
	return {
		endTimestamp = math.clamp(_DateTime.UnixTimestamp + TimeoutRange.time_remaining, -17987443200, 253402300799),
		decisionEventId = TimeoutRange.decision_event_id,
		duration = math.clamp((DateTime.fromIsoDate(TimeoutRange.end_time) or _DateTime).UnixTimestamp - (DateTime.fromIsoDate(TimeoutRange.start_time) or _DateTime).UnixTimestamp, 0, 253402300799)
	}
end

return (require(Parent.Rodux).createReducer({ userTimeout = {}, byConversationId = {} }, {
	[require(Parent.AppChatNetworking).rodux.GetChatModerationStatuses.Succeeded.name] = function(JoinResult, p1)
		-- upvalues: serializeChatTimeoutRange (copy), CryoModule (copy)
		local ResponseBody = p1.responseBody
		
		if ResponseBody.user_timeout_range then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				userTimeout = serializeChatTimeoutRange(ResponseBody.user_timeout_range)
			})
		end
		if ResponseBody.conversation_timeout_ranges then
			for _, conversationTimeoutRange in ResponseBody.conversation_timeout_ranges do
				JoinResult = CryoModule.Dictionary.join(JoinResult, {
					byConversationId = CryoModule.Dictionary.join(JoinResult.byConversationId, {
						[conversationTimeoutRange.id] = serializeChatTimeoutRange(conversationTimeoutRange.timeout_range)
					})
				})
			end
		end
		return JoinResult
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p2, p3)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p2, {
			byConversationId = CryoModule.Dictionary.join(p2.byConversationId, { [p3.conversationId] = CryoModule.None })
		})
	end,
	[require(AppChat.Conversations.Actions.CurrentConversationTimeoutEnded).name] = function(JoinResult, p2)
		-- upvalues: CryoModule (copy)
		local JoinResult1 = JoinResult
		local UnixTimestamp = DateTime.now().UnixTimestamp
		
		if JoinResult.userTimeout and JoinResult.userTimeout.endTimestamp and JoinResult.userTimeout.endTimestamp < UnixTimestamp then
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, { userTimeout = {} })
		end
		local ConversationId = p2.conversationId
		
		return if JoinResult.byConversationId[ConversationId] and JoinResult.byConversationId[ConversationId].endTimestamp and UnixTimestamp > JoinResult.byConversationId[ConversationId].endTimestamp then CryoModule.Dictionary.join(JoinResult1, {
			byConversationId = CryoModule.Dictionary.join(JoinResult1.byConversationId, { [ConversationId] = CryoModule.None })
		}) else JoinResult1
	end
}))