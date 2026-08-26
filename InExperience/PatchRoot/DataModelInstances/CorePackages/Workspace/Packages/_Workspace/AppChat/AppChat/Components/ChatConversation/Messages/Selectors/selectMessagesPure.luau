local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local cryoModule = require(parent.Cryo)
local messageSortPredicateModule = require(appChat.Components.ChatConversation.Utils.messageSortPredicate)
local filterForLinksWithPolicyModule = require(appChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local populateMessageWithStateModule = require(appChat.Conversations.populateMessageWithState)
local _ = require(parent.AppChatNetworking)

return function(p1, p2)
	-- upvalues: getDeepValueModule (ref), cryoModule (ref), messageSortPredicateModule (ref), filterForLinksWithPolicyModule (ref), populateMessageWithStateModule (ref)
	local conversation = p1.conversation
	
	if not conversation then
		return {
			itemList = {},
			previousMessagesState = p2.previousMessagesState,
			previousSendingMessagesState = p2.previousSendingMessagesState,
			previousMessagesResult = p2.previousMessagesResult
		}
	end
	local messages = conversation.messages
	local sendingMessages = conversation.sendingMessages
	local conversationId = p1.conversationId
	local var1 = p2.previousMessagesState[conversationId]
	local var2 = p2.previousSendingMessagesState[conversationId]
	local var3 = p2.previousMessagesResult[conversationId]
	
	if not messages then
		return {
			itemList = var3 or {},
			previousMessagesState = p2.previousMessagesState,
			previousSendingMessagesState = p2.previousSendingMessagesState,
			previousMessagesResult = p2.previousMessagesResult
		}
	elseif messages == var1 and sendingMessages == var2 then
		return {
			itemList = var3 or {},
			previousMessagesState = p2.previousMessagesState,
			previousSendingMessagesState = p2.previousSendingMessagesState,
			previousMessagesResult = p2.previousMessagesResult
		}
	end
	local var4 = if sendingMessages then getDeepValueModule(sendingMessages, "values") else {}
	local var5 = cryoModule.List.sort(cryoModule.Dictionary.values(cryoModule.Dictionary.join(getDeepValueModule(messages, "values"), var4)), messageSortPredicateModule)
	local t = {}
	
	for i, v in var5 do
		local var6 = not not var4[v.id]
		local var7 = filterForLinksWithPolicyModule(v)
		
		for i_1, v_1 in var7 do
			local var8 = populateMessageWithStateModule({ Users = p1.Users, LocalUserId = p1.localUserId }, v_1, v.id, conversation, t[#t], var6, var7[i_1 + 1] or var5[i + 1])
			var8.stable_key = `{var8.stableKey or var8.messageId}_{i_1}`
			table.insert(t, var8)
		end
	end
	local cloned = table.clone(p2.previousMessagesState)
	local cloned_1 = table.clone(p2.previousSendingMessagesState)
	local cloned_2 = table.clone(p2.previousMessagesResult)
	cloned[conversationId] = messages
	cloned_1[conversationId] = sendingMessages
	cloned_2[conversationId] = cryoModule.List.reverse(t)
	
	return {
		itemList = cloned_2[conversationId],
		previousMessagesState = cloned,
		previousSendingMessagesState = cloned_1,
		previousMessagesResult = cloned_2
	}
end