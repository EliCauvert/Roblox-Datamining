local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1) --[[ line: 6 ]]
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("get-conversations-participants-metadata"):body({ conversation_ids = p1 }):setStatusIds(p1)
end)