local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-conversations-participants-metadata"):body({ conversation_ids = p2 }):setStatusIds(p2)
end)