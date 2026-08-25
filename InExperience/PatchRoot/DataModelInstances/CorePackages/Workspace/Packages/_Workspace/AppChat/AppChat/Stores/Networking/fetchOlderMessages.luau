local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local promiseModule = require(parent.Promise)
local getConversationMessageListStoreModule = require(appChat.Stores.GetConversationMessageListStore)
local ingestOlderMessagesModule = require(appChat.Stores.Ingestion.ingestOlderMessages)

return function(p0)
	-- upvalues: getConversationMessageListStoreModule (ref), promiseModule (ref), appChatNetworkingModule (ref), ingestOlderMessagesModule (ref)
	local var5 = getConversationMessageListStoreModule(false)
	local metadata = var5.getMetadata(p0, false)
	
	if metadata and (metadata.isLoading or metadata.fetchedOldest) then
		return promiseModule.resolve({ response = nil, ingestedIds = {} })
	end
	local var7 = if metadata then metadata.nextPageCursor else nil
	var5.setLoading(p0, true)
	
	return appChatNetworkingModule.http.GetConversationMessages(nil, p0, var7):andThen(function(p2)
		-- upvalues: ingestOlderMessagesModule (copy), p0 (ref)
		local responseBody = p2 and p2.responseBody
		
		return {
			response = p2,
			ingestedIds = ingestOlderMessagesModule(p0, if responseBody then responseBody.messages or {} else {}, if responseBody then responseBody.next_cursor else nil)
		}
	end):catch(function(p1)
		-- upvalues: var5 (ref), p0 (ref), promiseModule (copy)
		var5.setLoading(p0, false)
		
		return promiseModule.reject(p1)
	end)
end