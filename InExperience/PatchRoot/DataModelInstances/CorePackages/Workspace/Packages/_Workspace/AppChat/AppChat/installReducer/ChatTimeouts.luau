local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local SerializeChatTimeoutRangeModule = require(AppChat.Utils.serializeChatTimeoutRange)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return (require(Parent.Rodux).createReducer({ userTimeout = {}, byConversationId = {} }, {
	[require(Parent.AppChatNetworking).rodux.GetChatModerationStatuses.Succeeded.name] = function(JoinResult, p1) --[[ Line: 37 ]]
		-- upvalues: SerializeChatTimeoutRangeModule (copy), CryoModule (copy), FFlagAppChatReactiveFeatureRestrictions (copy)
		local ResponseBody = p1.responseBody
		local Ids = if p1.postBody then p1.postBody.ids else nil
		
		if ResponseBody.user_timeout_range then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				userTimeout = SerializeChatTimeoutRangeModule(ResponseBody.user_timeout_range)
			})
		elseif FFlagAppChatReactiveFeatureRestrictions and Ids ~= nil then
			JoinResult = CryoModule.Dictionary.join(JoinResult, { userTimeout = {} })
		end
		if ResponseBody.conversation_timeout_ranges then
			local t = {}
			
			for _, conversationTimeoutRange in ResponseBody.conversation_timeout_ranges do
				local Id = conversationTimeoutRange.id
				t[Id] = true
				JoinResult = CryoModule.Dictionary.join(JoinResult, {
					byConversationId = CryoModule.Dictionary.join(JoinResult.byConversationId, {
						[Id] = SerializeChatTimeoutRangeModule(conversationTimeoutRange.timeout_range)
					})
				})
			end
			if FFlagAppChatReactiveFeatureRestrictions and Ids ~= nil and #Ids > 0 then
				for _, id in Ids do
					if not t[id] then
						JoinResult = CryoModule.Dictionary.join(JoinResult, {
							byConversationId = CryoModule.Dictionary.join(JoinResult.byConversationId, { [id] = CryoModule.None })
						})
					end
				end
			end
		end
		return JoinResult
	end,
	[require(AppChat.Conversations.Actions.RemovedConversation).name] = function(p2, p3) --[[ Line: 89 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p2, {
			byConversationId = CryoModule.Dictionary.join(p2.byConversationId, { [p3.conversationId] = CryoModule.None })
		})
	end,
	[require(AppChat.Conversations.Actions.CurrentConversationTimeoutEnded).name] = function(JoinResult, p2) --[[ Line: 97 ]]
		-- upvalues: FFlagAppChatReactiveFeatureRestrictions (copy), CryoModule (copy)
		local JoinResult1 = JoinResult
		local UnixTimestamp = DateTime.now().UnixTimestamp
		
		if JoinResult.userTimeout and JoinResult.userTimeout.endTimestamp and JoinResult.userTimeout.endTimestamp < UnixTimestamp and (not FFlagAppChatReactiveFeatureRestrictions or JoinResult.userTimeout.requiresAcknowledgement ~= true) then
			JoinResult1 = CryoModule.Dictionary.join(JoinResult1, { userTimeout = {} })
		end
		local ConversationId = p2.conversationId
		
		return if JoinResult.byConversationId[ConversationId] and JoinResult.byConversationId[ConversationId].endTimestamp and UnixTimestamp > JoinResult.byConversationId[ConversationId].endTimestamp and (not FFlagAppChatReactiveFeatureRestrictions or JoinResult.byConversationId[ConversationId].requiresAcknowledgement ~= true) then CryoModule.Dictionary.join(JoinResult1, {
			byConversationId = CryoModule.Dictionary.join(JoinResult1.byConversationId, { [ConversationId] = CryoModule.None })
		}) else JoinResult1
	end
}))