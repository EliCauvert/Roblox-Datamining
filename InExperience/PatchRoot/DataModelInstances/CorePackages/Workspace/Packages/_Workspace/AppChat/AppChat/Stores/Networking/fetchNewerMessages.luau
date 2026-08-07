local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local ingestNewerMessagesModule = require(appChat.Stores.Ingestion.ingestNewerMessages)

return function(p0) --[[ line: 24 | named "fetchNewerMessages" ]]
	-- upvalues: appChatNetworkingModule (ref), ingestNewerMessagesModule (ref)
	return appChatNetworkingModule.http.GetConversationMessages(nil, p0, nil):andThen(function(p1) --[[ line: 25 ]]
		-- upvalues: ingestNewerMessagesModule (copy), p0 (ref)
		local responseBody = p1 and p1.responseBody
		
		return {
			response = p1,
			ingestedIds = ingestNewerMessagesModule(p0, if responseBody then responseBody.messages or {} else {})
		}
	end)
end