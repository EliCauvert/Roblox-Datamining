local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1, p2)
	-- upvalues: CHAT_PLATFORM_BASE_URLModule (ref)
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v2"):path("get-modal-sequence"):body({
		modal_sequence = "pending_state_modal",
		is_in_experience = p2,
		conversation_id = p1
	})
end)