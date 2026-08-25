local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	local var1 = tonumber(p2)
	assert(var1, "Invalid removingUserId provided. Could not be converted to a number.")
	
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("remove-users"):body({ conversation_id = p1, user_ids = { var1 } })
end)