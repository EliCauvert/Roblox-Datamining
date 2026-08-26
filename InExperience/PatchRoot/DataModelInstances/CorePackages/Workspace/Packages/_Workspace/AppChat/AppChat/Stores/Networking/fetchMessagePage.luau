local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local ingestMessagePageModule = require(appChat.Stores.Ingestion.ingestMessagePage)

return function(p1, p2)
	-- upvalues: appChatNetworkingModule (ref), ingestMessagePageModule (ref)
	return appChatNetworkingModule.http.GetConversationMessages(nil, p1, p2):andThen(function(p3)
		-- upvalues: ingestMessagePageModule (copy), p1 (ref)
		local responseBody = p3 and p3.responseBody
		
		return {
			response = p3,
			ingestedIds = ingestMessagePageModule(p1, if responseBody then responseBody.messages or {} else {})
		}
	end)
end