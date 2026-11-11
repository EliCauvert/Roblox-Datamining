local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local PromiseModule = require(Parent.Promise)
local GetConversationMessageListStoreModule = require(AppChat.Stores.GetConversationMessageListStore)
local IngestOlderMessagesModule = require(AppChat.Stores.Ingestion.ingestOlderMessages)

return function(p1)
	-- upvalues: GetConversationMessageListStoreModule (copy), PromiseModule (copy), AppChatNetworkingModule (copy), IngestOlderMessagesModule (copy)
	local ConversationMessageListStoreModule = GetConversationMessageListStoreModule(false)
	local Metadata = ConversationMessageListStoreModule.getMetadata(p1, false)
	
	if Metadata and (Metadata.isLoading or Metadata.fetchedOldest) then
		return PromiseModule.resolve({ response = nil, ingestedIds = {} })
	else
		local NextPageCursor = Metadata and Metadata.nextPageCursor or nil
		ConversationMessageListStoreModule.setLoading(p1, true)
		
		return AppChatNetworkingModule.http.GetConversationMessages(nil, p1, NextPageCursor):andThen(function(Result)
			-- upvalues: IngestOlderMessagesModule (upval), p1 (copy)
			local ResponseBody = Result and Result.responseBody
			
			return {
				response = Result,
				ingestedIds = IngestOlderMessagesModule(p1, if ResponseBody then ResponseBody.messages or {} else {}, if ResponseBody then ResponseBody.next_cursor else nil)
			}
		end):catch(function(Err)
			-- upvalues: ConversationMessageListStoreModule (copy), p1 (copy), PromiseModule (upval)
			ConversationMessageListStoreModule.setLoading(p1, false)
			
			return PromiseModule.reject(Err)
		end)
	end
end