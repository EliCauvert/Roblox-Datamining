local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Conversation_id, p1) --[[ Line: 6 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	local Number: number? = tonumber(p1)
	assert(Number, "Invalid removingUserId provided. Could not be converted to a number.")
	
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("remove-users"):body({ conversation_id = Conversation_id, user_ids = { Number } })
end)