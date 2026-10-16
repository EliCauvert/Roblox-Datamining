local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local CryoModule = require(Parent.Cryo)
local MessageSortPredicateModule = require(AppChat.Components.ChatConversation.Utils.messageSortPredicate)
local FilterForLinksWithPolicyModule = require(AppChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local PopulateMessageWithStateModule = require(AppChat.Conversations.populateMessageWithState)
local _ = require(Parent.AppChatNetworking)

return function(p1, p2) --[[ Line: 83 | Named "selectMessagesPure" ]]
	-- upvalues: GetDeepValueModule (copy), CryoModule (copy), MessageSortPredicateModule (copy), FilterForLinksWithPolicyModule (copy), PopulateMessageWithStateModule (copy)
	local Conversation = p1.conversation
	
	if not Conversation then
		return {
			itemList = {},
			previousMessagesState = p2.previousMessagesState,
			previousSendingMessagesState = p2.previousSendingMessagesState,
			previousMessagesResult = p2.previousMessagesResult
		}
	end
	local Messages = Conversation.messages
	local SendingMessages = Conversation.sendingMessages
	local ConversationId = p1.conversationId
	local PreviousMessagesStateEntry = p2.previousMessagesState[ConversationId]
	local PreviousSendingMessagesStateEntry = p2.previousSendingMessagesState[ConversationId]
	local PreviousMessagesResultEntry = p2.previousMessagesResult[ConversationId]
	
	if not Messages then
		return {
			itemList = PreviousMessagesResultEntry or {},
			previousMessagesState = p2.previousMessagesState,
			previousSendingMessagesState = p2.previousSendingMessagesState,
			previousMessagesResult = p2.previousMessagesResult
		}
	end
	if Messages == PreviousMessagesStateEntry and SendingMessages == PreviousSendingMessagesStateEntry then
		return {
			itemList = PreviousMessagesResultEntry or {},
			previousMessagesState = p2.previousMessagesState,
			previousSendingMessagesState = p2.previousSendingMessagesState,
			previousMessagesResult = p2.previousMessagesResult
		}
	end
	local Values = if SendingMessages then GetDeepValueModule(SendingMessages, "values") else {}
	local SortResult = CryoModule.List.sort(CryoModule.Dictionary.values((CryoModule.Dictionary.join(GetDeepValueModule(Messages, "values"), Values))), MessageSortPredicateModule)
	local List = {}
	
	for i, value in SortResult do
		local Inverted = not not Values[value.id]
		local FilterForLinksWithPolicyModuleResult = FilterForLinksWithPolicyModule(value)
		
		for i1, value1 in FilterForLinksWithPolicyModuleResult do
			local PopulateMessageWithStateModuleResult = PopulateMessageWithStateModule({ Users = p1.Users, LocalUserId = p1.localUserId }, value1, value.id, Conversation, List[#List], Inverted, FilterForLinksWithPolicyModuleResult[i1 + 1] or SortResult[i + 1])
			PopulateMessageWithStateModuleResult.stable_key = `{PopulateMessageWithStateModuleResult.stableKey or PopulateMessageWithStateModuleResult.messageId}_{i1}`
			table.insert(List, PopulateMessageWithStateModuleResult)
		end
	end
	local Copy = table.clone(p2.previousMessagesState)
	local Copy1 = table.clone(p2.previousSendingMessagesState)
	local Copy2 = table.clone(p2.previousMessagesResult)
	Copy[ConversationId] = Messages
	Copy1[ConversationId] = SendingMessages
	Copy2[ConversationId] = CryoModule.List.reverse(List)
	
	return {
		itemList = Copy2[ConversationId],
		previousMessagesState = Copy,
		previousSendingMessagesState = Copy1,
		previousMessagesResult = Copy2
	}
end