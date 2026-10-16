local CHATPLATFORMBASEURLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(Callback, Is_in_experience) --[[ Line: 6 ]]
	-- upvalues: CHATPLATFORMBASEURLModule (copy)
	return Callback(CHATPLATFORMBASEURLModule):path("v2"):path("get-modal-sequence"):body({
		modal_sequence = "chat_landing_modal",
		is_in_experience = Is_in_experience
	}):setStatusIds({ "chat_landing_modal" })
end)