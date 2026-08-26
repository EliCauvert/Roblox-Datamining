local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("clear-global-unread-count"):body({})
end)