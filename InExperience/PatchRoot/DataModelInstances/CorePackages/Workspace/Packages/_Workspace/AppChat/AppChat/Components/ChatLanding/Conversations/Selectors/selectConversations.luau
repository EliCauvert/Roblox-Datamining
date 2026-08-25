local appChat = script:FindFirstAncestor("AppChat")
local getDeepValueModule = require(appChat.Utils.getDeepValue)
local populateConversationWithStateModule = require(appChat.Conversations.populateConversationWithState)

local function conversationSortPredicate(p0, p1)
	return if p0.unixTime and p1.unixTime then p1.unixTime < p0.unixTime elseif p0.unixTime or p1.unixTime then (p0.unixTime or p1.unixTime) == p0.unixTime else string.lower(p0.title) < string.lower(p1.title)
end

local var4 = nil
local var5 = nil

return function(p2)
	-- upvalues: getDeepValueModule (ref), var4 (write), var5 (write), populateConversationWithStateModule (ref), conversationSortPredicate (ref)
	local var6 = getDeepValueModule(p2, "ChatAppReducer.Conversations")
	
	if not var6 then
		return {}
	end
	local var7 = getDeepValueModule(p2, "ChatAppReducer.ConversationsAsync.latestMessagesIsFetching")
	
	if var6 == var4 then
		return var5
	elseif var7 and var5 then
		return var5
	end
	local t = {}
	
	for i, v in pairs(var6) do
		table.insert(t, populateConversationWithStateModule(p2, v))
	end
	table.sort(t, conversationSortPredicate)
	var4 = var6
	var5 = t
	
	return t
end