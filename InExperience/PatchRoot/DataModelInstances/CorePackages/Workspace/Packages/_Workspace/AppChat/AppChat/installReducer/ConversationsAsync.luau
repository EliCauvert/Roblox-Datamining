local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Immutable = require(Parent.AppCommonLib).Immutable

return require(Parent.Rodux).createReducer({}, {
	[require(AppChat.Conversations.Actions.RequestPageConversations).name] = function(p1, _) --[[ Line: 19 ]]
		-- upvalues: Immutable (copy)
		return Immutable.JoinDictionaries(p1, { pageConversationsIsFetching = true })
	end,
	[require(AppChat.Conversations.Actions.ReceivedPageConversations).name] = function(p1, _) --[[ Line: 24 ]]
		-- upvalues: Immutable (copy)
		return Immutable.JoinDictionaries(p1, { pageConversationsIsFetching = false })
	end,
	[require(AppChat.Conversations.Actions.RequestLatestMessages).name] = function(p1, _) --[[ Line: 29 ]]
		-- upvalues: Immutable (copy)
		return Immutable.JoinDictionaries(p1, { latestMessagesIsFetching = true })
	end,
	[require(AppChat.Conversations.Actions.ReceivedLatestMessages).name] = function(p1, _) --[[ Line: 34 ]]
		-- upvalues: Immutable (copy)
		return Immutable.JoinDictionaries(p1, { latestMessagesIsFetching = false })
	end,
	[require(AppChat.Conversations.Actions.ReceivedOldestConversation).name] = function(p1, _) --[[ Line: 39 ]]
		-- upvalues: Immutable (copy)
		return Immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true })
	end,
	[require(AppChat.Http.NetworkingChat).GetUserConversations.Succeeded.name] = function(p1, p2) --[[ Line: 44 ]]
		-- upvalues: Immutable (copy)
		return if #p2.responseBody < p2.queryArgs.pageSize then Immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true }) else p1
	end,
	[require(Parent.AppChatNetworking).rodux.GetUserConversations.Succeeded.name] = function(p1, p2) --[[ Line: 50 ]]
		-- upvalues: Immutable (copy)
		local NextCursor = p2.responseBody.next_cursor
		
		return if NextCursor == nil or NextCursor == "" then Immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true }) else p1
	end
})