local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local promiseModule = require(parent.Promise)
local getConversationMessageListStoreModule = require(appChat.Stores.GetConversationMessageListStore)
local ingestOlderMessagesModule = require(appChat.Stores.Ingestion.ingestOlderMessages)

return function(p1)
	-- upvalues: getConversationMessageListStoreModule (ref), promiseModule (ref), appChatNetworkingModule (ref), ingestOlderMessagesModule (ref)
	local var1 = getConversationMessageListStoreModule(false)
	local metadata = var1.getMetadata(p1, false)
	
	if metadata and (metadata.isLoading or metadata.fetchedOldest) then
		return promiseModule.resolve({ response = nil, ingestedIds = {} })
	end
	local var2 = if metadata then metadata.nextPageCursor else nil
	var1.setLoading(p1, true)
	
	return appChatNetworkingModule.http.GetConversationMessages(nil, p1, var2):andThen(function(p2)
		-- upvalues: ingestOlderMessagesModule (copy), p1 (ref)
		local responseBody = p2 and p2.responseBody
		
		return {
			response = p2,
			ingestedIds = ingestOlderMessagesModule(p1, if responseBody then responseBody.messages or {} else {}, if responseBody then responseBody.next_cursor else nil)
		}
	end):catch(function(p2)
		-- upvalues: var1 (ref), p1 (ref), promiseModule (copy)
		var1.setLoading(p1, false)
		
		return promiseModule.reject(p2)
	end)
end