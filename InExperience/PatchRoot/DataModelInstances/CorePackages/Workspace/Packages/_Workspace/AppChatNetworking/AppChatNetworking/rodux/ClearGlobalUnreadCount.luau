local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback) --[[ Line: 6 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("clear-global-unread-count"):body({})
end)