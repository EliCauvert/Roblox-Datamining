local appChat = script:FindFirstAncestor("AppChat")
local getUnreadMessageCountStoreModule = require(appChat.Stores.GetUnreadMessageCountStore)
local t = {
	[require(appChat.Parent.AppChatNetworking).rodux.GetConversationMetadata.Succeeded.name] = function(p0) --[[ line: 8 ]]
		-- upvalues: getUnreadMessageCountStoreModule (ref)
		getUnreadMessageCountStoreModule(false).receivedConversationMetadata(p0.responseBody)
	end
}

return function(value, _) --[[ line: 16 | named "SignalsUnreadMessageCountMiddleware" ]]
	-- upvalues: t (ref)
	return function(p1) --[[ line: 17 ]]
		-- upvalues: value (ref), t (copy)
		local var3 = value(p1)
		local type = t[p1.type]
		
		if type then
			type(p1)
		end
		return var3
	end
end