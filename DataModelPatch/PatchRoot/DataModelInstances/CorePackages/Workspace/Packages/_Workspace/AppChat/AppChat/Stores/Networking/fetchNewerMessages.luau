local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local IngestNewerMessagesModule = require(AppChat.Stores.Ingestion.ingestNewerMessages)

return function(p1)
	-- upvalues: AppChatNetworkingModule (copy), IngestNewerMessagesModule (copy)
	return AppChatNetworkingModule.http.GetConversationMessages(nil, p1, nil):andThen(function(Result)
		-- upvalues: IngestNewerMessagesModule (upval), p1 (copy)
		local ResponseBody = Result and Result.responseBody
		
		return {
			response = Result,
			ingestedIds = IngestNewerMessagesModule(p1, if ResponseBody then ResponseBody.messages or {} else {})
		}
	end)
end