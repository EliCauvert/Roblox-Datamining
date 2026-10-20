local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local IngestMessagePageModule = require(AppChat.Stores.Ingestion.ingestMessagePage)

return function(p1, p2)
	-- upvalues: AppChatNetworkingModule (copy), IngestMessagePageModule (copy)
	return AppChatNetworkingModule.http.GetConversationMessages(nil, p1, p2):andThen(function(Result)
		-- upvalues: IngestMessagePageModule (upval), p1 (copy)
		local ResponseBody = Result and Result.responseBody
		
		return {
			response = Result,
			ingestedIds = IngestMessagePageModule(p1, if ResponseBody then ResponseBody.messages or {} else {})
		}
	end)
end