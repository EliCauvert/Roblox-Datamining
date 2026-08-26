local appChat = script:FindFirstAncestor("AppChat")
local getUnreadMessageCountStoreModule = require(appChat.Stores.GetUnreadMessageCountStore)
local t = {
	[require(appChat.Parent.AppChatNetworking).rodux.GetConversationMetadata.Succeeded.name] = function(p1)
		-- upvalues: getUnreadMessageCountStoreModule (ref)
		getUnreadMessageCountStoreModule(false).receivedConversationMetadata(p1.responseBody)
	end
}

return function(value, _)
	-- upvalues: t (ref)
	return function(p1)
		-- upvalues: value (ref), t (copy)
		local var1 = value(p1)
		local type = t[p1.type]
		
		if type then
			type(p1)
		end
		return var1
	end
end