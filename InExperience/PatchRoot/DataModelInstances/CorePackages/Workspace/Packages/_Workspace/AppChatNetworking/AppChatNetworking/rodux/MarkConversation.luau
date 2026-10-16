local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, p1) --[[ Line: 9 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v1"):path("mark-conversations"):body({ conversation_ids = { p1 } }):setStatusIds({ p1 })
end)