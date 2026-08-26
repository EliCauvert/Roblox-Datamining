local appChat = script:FindFirstAncestor("AppChat")
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local populateConversationWithStateModule = require(appChat.Conversations.populateConversationWithState)

local function conversationSortPredicate(p1, p2)
	return if p1.unixTime and p2.unixTime then p2.unixTime < p1.unixTime elseif p1.unixTime or p2.unixTime then (p1.unixTime or p2.unixTime) == p1.unixTime else string.lower(p1.title) < string.lower(p2.title)
end

local var1 = nil
local var2 = nil

return function(p1)
	-- upvalues: getDeepValueModule (ref), var1 (write), var2 (write), populateConversationWithStateModule (ref), conversationSortPredicate (ref)
	local var3 = getDeepValueModule(p1, "ChatAppReducer.Conversations")
	
	if not var3 then
		return {}
	end
	local var4 = getDeepValueModule(p1, "ChatAppReducer.ConversationsAsync.latestMessagesIsFetching")
	
	if var3 == var1 then
		return var2
	elseif var4 and var2 then
		return var2
	end
	local t = {}
	
	for i, v in pairs(var3) do
		table.insert(t, populateConversationWithStateModule(p1, v))
	end
	table.sort(t, conversationSortPredicate)
	var1 = var3
	var2 = t
	
	return t
end