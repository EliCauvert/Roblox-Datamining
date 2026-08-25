local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local immutable = require(parent.AppCommonLib).Immutable

return require(parent.Rodux).createReducer({}, {
	[require(appChat.Conversations.Actions.RequestPageConversations).name] = function(p0, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p0, { pageConversationsIsFetching = true })
	end,
	[require(appChat.Conversations.Actions.ReceivedPageConversations).name] = function(p1, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p1, { pageConversationsIsFetching = false })
	end,
	[require(appChat.Conversations.Actions.RequestLatestMessages).name] = function(p2, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p2, { latestMessagesIsFetching = true })
	end,
	[require(appChat.Conversations.Actions.ReceivedLatestMessages).name] = function(p3, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p3, { latestMessagesIsFetching = false })
	end,
	[require(appChat.Conversations.Actions.ReceivedOldestConversation).name] = function(p4, _)
		-- upvalues: immutable (ref)
		return immutable.JoinDictionaries(p4, { oldestConversationIsFetched = true })
	end,
	[require(appChat.Http.NetworkingChat).GetUserConversations.Succeeded.name] = function(p5, p6)
		-- upvalues: immutable (ref)
		return if #p6.responseBody < p6.queryArgs.pageSize then immutable.JoinDictionaries(p5, { oldestConversationIsFetched = true }) else p5
	end,
	[require(parent.AppChatNetworking).rodux.GetUserConversations.Succeeded.name] = function(p7, p8)
		-- upvalues: immutable (ref)
		local nextCursor = p8.responseBody.next_cursor
		
		return if nextCursor == nil or nextCursor == "" then immutable.JoinDictionaries(p7, { oldestConversationIsFetched = true }) else p7
	end
})