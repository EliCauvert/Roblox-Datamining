local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local removedConversationModule = require(appChat.Conversations.Actions.RemovedConversation)
local currentConversationTimeoutEndedModule = require(appChat.Conversations.Actions.CurrentConversationTimeoutEnded)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local serializeChatTimeoutRangeModule = require(appChat.Utils.serializeChatTimeoutRange)
local fFlagAppChatReactiveFeatureRestrictions = require(parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions

return roduxModule.createReducer({ userTimeout = {}, byConversationId = {} }, {
	[appChatNetworkingModule.rodux.GetChatModerationStatuses.Succeeded.name] = function(p1, p2)
		-- upvalues: serializeChatTimeoutRangeModule (ref), cryoModule (ref), fFlagAppChatReactiveFeatureRestrictions (ref)
		local responseBody = p2.responseBody
		local var1 = if p2.postBody then p2.postBody.ids else nil
		
		if responseBody.user_timeout_range then
			p1 = cryoModule.Dictionary.join(p1, {
				userTimeout = serializeChatTimeoutRangeModule(responseBody.user_timeout_range)
			})
		elseif fFlagAppChatReactiveFeatureRestrictions and var1 ~= nil then
			p1 = cryoModule.Dictionary.join(p1, { userTimeout = {} })
		end
		if responseBody.conversation_timeout_ranges then
			local t = {}
			
			for i, v in responseBody.conversation_timeout_ranges do
				local id = v.id
				t[id] = true
				p1 = cryoModule.Dictionary.join(p1, {
					byConversationId = cryoModule.Dictionary.join(p1.byConversationId, { [id] = serializeChatTimeoutRangeModule(v.timeout_range) })
				})
			end
			if fFlagAppChatReactiveFeatureRestrictions and var1 ~= nil and #var1 > 0 then
				for i, v_1 in var1 do
					if not t[v_1] then
						p1 = cryoModule.Dictionary.join(p1, {
							byConversationId = cryoModule.Dictionary.join(p1.byConversationId, { [v_1] = cryoModule.None })
						})
					end
				end
			end
		end
		return p1
	end,
	[removedConversationModule.name] = function(p3, p4)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p3, {
			byConversationId = cryoModule.Dictionary.join(p3.byConversationId, { [p4.conversationId] = cryoModule.None })
		})
	end,
	[currentConversationTimeoutEndedModule.name] = function(p3, p4)
		-- upvalues: fFlagAppChatReactiveFeatureRestrictions (ref), cryoModule (ref)
		local var2 = p3
		local unixTimestamp = DateTime.now().UnixTimestamp
		
		if p3.userTimeout and p3.userTimeout.endTimestamp and p3.userTimeout.endTimestamp < unixTimestamp and (not fFlagAppChatReactiveFeatureRestrictions or p3.userTimeout.requiresAcknowledgement ~= true) then
			var2 = cryoModule.Dictionary.join(var2, { userTimeout = {} })
		end
		local conversationId = p4.conversationId
		
		return if p3.byConversationId[conversationId] and p3.byConversationId[conversationId].endTimestamp and unixTimestamp > p3.byConversationId[conversationId].endTimestamp and (not fFlagAppChatReactiveFeatureRestrictions or p3.byConversationId[conversationId].requiresAcknowledgement ~= true) then cryoModule.Dictionary.join(var2, {
			byConversationId = cryoModule.Dictionary.join(var2.byConversationId, { [conversationId] = cryoModule.None })
		}) else var2
	end
})