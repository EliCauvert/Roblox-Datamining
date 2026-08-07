local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local ingestMessagePageModule = require(appChat.Stores.Ingestion.ingestMessagePage)

return function(p0, p1) --[[ line: 20 | named "fetchMessagePage" ]]
	-- upvalues: appChatNetworkingModule (ref), ingestMessagePageModule (ref)
	return appChatNetworkingModule.http.GetConversationMessages(nil, p0, p1):andThen(function(p2) --[[ line: 21 ]]
		-- upvalues: ingestMessagePageModule (copy), p0 (ref)
		local responseBody = p2 and p2.responseBody
		
		return {
			response = p2,
			ingestedIds = ingestMessagePageModule(p0, if responseBody then responseBody.messages or {} else {})
		}
	end)
end