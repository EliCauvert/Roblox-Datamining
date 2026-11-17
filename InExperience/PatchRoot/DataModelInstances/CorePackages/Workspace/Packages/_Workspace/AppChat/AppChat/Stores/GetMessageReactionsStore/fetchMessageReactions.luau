local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local NewResult = require(AppChat.Logger):new(script.Name)
local GetMessageReactionsStoreModule = require(AppChat.Stores.GetMessageReactionsStore)

return function(p1, List)
	-- upvalues: AppChatNetworkingModule (copy), GetMessageReactionsStoreModule (copy), NewResult (copy)
	return AppChatNetworkingModule.http.GetMessages(nil, p1, List, { include_reactions = true }):andThen(function(Result)
		-- upvalues: GetMessageReactionsStoreModule (upval)
		if Result.responseBody then
			GetMessageReactionsStoreModule(false).ingestMessageReactions(Result.responseBody.messages)
		end
	end):catch(function(Err)
		-- upvalues: NewResult (upval), p1 (copy), List (copy)
		NewResult:warning("Failed to fetch reactions for conversationId: {}, messageIds: {}, error: {}", p1, table.concat(List, ","), (tostring(Err)))
	end)
end