local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local ingestNewerMessagesModule = require(appChat.Stores.Ingestion.ingestNewerMessages)

return function(p1)
	-- upvalues: appChatNetworkingModule (ref), ingestNewerMessagesModule (ref)
	return appChatNetworkingModule.http.GetConversationMessages(nil, p1, nil):andThen(function(p2)
		-- upvalues: ingestNewerMessagesModule (copy), p1 (ref)
		local responseBody = p2 and p2.responseBody
		
		return {
			response = p2,
			ingestedIds = ingestNewerMessagesModule(p1, if responseBody then responseBody.messages or {} else {})
		}
	end)
end