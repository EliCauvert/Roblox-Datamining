local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local Immutable = require(Parent.AppCommonLib).Immutable

return require(Parent.Rodux).createReducer({}, {
	[require(AppChat.Http.NetworkingChat).GetUserConversations.Succeeded.name] = function(p1, p2)
		-- upvalues: Immutable (copy)
		return if #p2.responseBody < p2.queryArgs.pageSize then Immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true }) else p1
	end,
	[require(Parent.AppChatNetworking).rodux.GetUserConversations.Succeeded.name] = function(p1, p2)
		-- upvalues: Immutable (copy)
		local NextCursor = p2.responseBody.next_cursor
		
		return if NextCursor == nil or NextCursor == "" then Immutable.JoinDictionaries(p1, { oldestConversationIsFetched = true }) else p1
	end
})