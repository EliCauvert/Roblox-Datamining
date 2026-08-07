local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)
local getResponseBodyModule = require(appChat.Stores.Ingestion.getResponseBody)
local ingestConversationListPageModule = require(appChat.Stores.Ingestion.ingestConversationListPage)

return function(value) --[[ line: 22 | named "fetchConversationDetailsToSignals" ]]
	-- upvalues: appChatNetworkingModule (ref), getConversationStoreModule (ref), getResponseBodyModule (ref), ingestConversationListPageModule (ref)
	return appChatNetworkingModule.http.GetConversations(nil, value):andThen(function(p0) --[[ line: 26 ]]
		-- upvalues: getConversationStoreModule (copy), getResponseBodyModule (copy), ingestConversationListPageModule (copy)
		ingestConversationListPageModule.ingestConversationResponses(getConversationStoreModule(false), getResponseBodyModule(p0))
		
		return p0
	end)
end