local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local cryoModule = require(parent.Cryo)
local messageSortPredicateModule = require(appChat.Components.ChatConversation.Utils.messageSortPredicate)
local filterForLinksWithPolicyModule = require(appChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local populateMessageWithStateModule = require(appChat.Conversations.populateMessageWithState)
local _ = require(parent.AppChatNetworking)

return function(p0, p1) --[[ line: 83 | named "selectMessagesPure" ]]
	-- upvalues: getDeepValueModule (ref), cryoModule (ref), messageSortPredicateModule (ref), filterForLinksWithPolicyModule (ref), populateMessageWithStateModule (ref)
	local conversation = p0.conversation
	
	if not conversation then
		return {
			itemList = {},
			previousMessagesState = p1.previousMessagesState,
			previousSendingMessagesState = p1.previousSendingMessagesState,
			previousMessagesResult = p1.previousMessagesResult
		}
	end
	local messages = conversation.messages
	local sendingMessages = conversation.sendingMessages
	local conversationId = p0.conversationId
	local var6 = p1.previousMessagesState[conversationId]
	local var7 = p1.previousSendingMessagesState[conversationId]
	local var8 = p1.previousMessagesResult[conversationId]
	
	if not messages then
		return {
			itemList = var8 or {},
			previousMessagesState = p1.previousMessagesState,
			previousSendingMessagesState = p1.previousSendingMessagesState,
			previousMessagesResult = p1.previousMessagesResult
		}
	elseif messages == var6 and sendingMessages == var7 then
		return {
			itemList = var8 or {},
			previousMessagesState = p1.previousMessagesState,
			previousSendingMessagesState = p1.previousSendingMessagesState,
			previousMessagesResult = p1.previousMessagesResult
		}
	end
	local var9 = if sendingMessages then getDeepValueModule(sendingMessages, "values") else {}
	local var10 = cryoModule.List.sort(cryoModule.Dictionary.values(cryoModule.Dictionary.join(getDeepValueModule(messages, "values"), var9)), messageSortPredicateModule)
	local t = {}
	
	for i, v in var10 do
		local var15 = not not var9[v.id]
		local var16 = filterForLinksWithPolicyModule(v)
		
		for i_1, v_1 in var16 do
			local var17 = populateMessageWithStateModule({ Users = p0.Users, LocalUserId = p0.localUserId }, v_1, v.id, conversation, t[#t], var15, var16[i_1 + 1] or var10[i + 1])
			var17.stable_key = `{var17.stableKey or var17.messageId}_{i_1}`
			table.insert(t, var17)
		end
	end
	local cloned = table.clone(p1.previousMessagesState)
	local cloned_1 = table.clone(p1.previousSendingMessagesState)
	local cloned_2 = table.clone(p1.previousMessagesResult)
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