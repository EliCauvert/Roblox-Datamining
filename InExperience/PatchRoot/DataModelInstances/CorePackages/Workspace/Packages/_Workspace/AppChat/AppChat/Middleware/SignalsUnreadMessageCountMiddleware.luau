local AppChat = script:FindFirstAncestor("AppChat")
local GetUnreadMessageCountStoreModule = require(AppChat.Stores.GetUnreadMessageCountStore)
local config = {
	[require(AppChat.Parent.AppChatNetworking).rodux.GetConversationMetadata.Succeeded.name] = function(p1)
		-- upvalues: GetUnreadMessageCountStoreModule (copy)
		GetUnreadMessageCountStoreModule(false).receivedConversationMetadata(p1.responseBody)
	end
}

return function(Callback, _)
	-- upvalues: config (copy)
	return function(p1)
		-- upvalues: Callback (copy), config (upval)
		local CallbackResult = Callback(p1)
		local Entry: (any) -> () = config[p1.type]
		
		if Entry then
			Entry(p1)
		end
		return CallbackResult
	end
end