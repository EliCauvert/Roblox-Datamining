local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetResponseBodyModule = require(AppChat.Stores.Ingestion.getResponseBody)
local IngestConversationListPageModule = require(AppChat.Stores.Ingestion.ingestConversationListPage)

return function(p1) --[[ Line: 22 | Named "fetchConversationDetailsToSignals" ]]
	-- upvalues: AppChatNetworkingModule (copy), GetConversationStoreModule (copy), GetResponseBodyModule (copy), IngestConversationListPageModule (copy)
	return AppChatNetworkingModule.http.GetConversations(nil, p1):andThen(function(Result) --[[ Line: 26 ]]
		-- upvalues: GetConversationStoreModule (upval), GetResponseBodyModule (upval), IngestConversationListPageModule (upval)
		IngestConversationListPageModule.ingestConversationResponses(GetConversationStoreModule(false), (GetResponseBodyModule(Result)))
		
		return Result
	end)
end