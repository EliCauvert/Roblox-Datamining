local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local immutable = require(parent.AppCommonLib).Immutable

return require(parent.Rodux).createReducer({}, {
	[require(appChat.Conversations.Actions.RequestPageConversations).name] = function(p1, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p1, { pageConversationsIsFetching = true })
	end,
	[require(appChat.Conversations.Actions.ReceivedPageConversations).name] = function(p1, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p1, { pageConversationsIsFetching = false })
	end,
	[require(appChat.Conversations.Actions.RequestLatestMessages).name] = function(p1, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p1, { latestMessagesIsFetching = true })
	end,
	[require(appChat.Conversations.Actions.ReceivedLatestMessages).name] = function(p1, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p1, { latestMessagesIsFetching = false })
	end,
	[require(appChat.Conversations.Actions.ReceivedOldestConversation).name] = function(p1, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true })
	end,
	[require(appChat.Http.NetworkingChat).GetUserConversations.Succeeded.name] = function(p1, p2)
		-- upvalues: immutable (ref)
		return if #p2.responseBody < p2.queryArgs.pageSize then immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true }) else p1
	end,
	[require(parent.AppChatNetworking).rodux.GetUserConversations.Succeeded.name] = function(p1, p2)
		-- upvalues: immutable (ref)
		local nextCursor = p2.responseBody.next_cursor
		
		return if nextCursor == nil or nextCursor == "" then immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true }) else p1
	end
})