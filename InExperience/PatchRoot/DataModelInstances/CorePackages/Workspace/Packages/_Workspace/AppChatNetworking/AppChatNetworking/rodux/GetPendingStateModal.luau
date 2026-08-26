local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2, p3)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v2"):path("get-modal-sequence"):body({
		modal_sequence = "pending_state_modal",
		is_in_experience = p3,
		conversation_id = p2
	})
end)