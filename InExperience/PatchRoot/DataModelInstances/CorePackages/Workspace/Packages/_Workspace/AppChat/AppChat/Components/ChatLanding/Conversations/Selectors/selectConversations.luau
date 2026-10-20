local AppChat = script:FindFirstAncestor("AppChat")
local GetDeepValueModule = require(AppChat.Utils.getDeepValue)
local PopulateConversationWithStateModule = require(AppChat.Conversations.populateConversationWithState)

local function conversationSortPredicate(A, B): boolean
	return if A.unixTime and B.unixTime then B.unixTime < A.unixTime elseif A.unixTime or B.unixTime then (A.unixTime or B.unixTime) == A.unixTime else string.lower(A.title) < string.lower(B.title)
end

local ChatAppReducerConversations = nil
local v1 = nil

return function(p1)
	-- upvalues: GetDeepValueModule (copy), ChatAppReducerConversations (ref), v1 (ref), PopulateConversationWithStateModule (copy), conversationSortPredicate (copy)
	local ChatAppReducerConversations1 = GetDeepValueModule(p1, "ChatAppReducer.Conversations")
	
	if not ChatAppReducerConversations1 then
		return {}
	end
	local ChatAppReducerConversationsAsyncLatestMessagesIsFetching = GetDeepValueModule(p1, "ChatAppReducer.ConversationsAsync.latestMessagesIsFetching")
	
	if ChatAppReducerConversations1 == ChatAppReducerConversations then
		return v1
	end
	if ChatAppReducerConversationsAsyncLatestMessagesIsFetching and v1 then
		return v1
	end
	local List = {}
	
	for _, value in pairs(ChatAppReducerConversations1) do
		table.insert(List, (PopulateConversationWithStateModule(p1, value)))
	end
	table.sort(List, conversationSortPredicate)
	ChatAppReducerConversations = ChatAppReducerConversations1
	v1 = List
	
	return List
end