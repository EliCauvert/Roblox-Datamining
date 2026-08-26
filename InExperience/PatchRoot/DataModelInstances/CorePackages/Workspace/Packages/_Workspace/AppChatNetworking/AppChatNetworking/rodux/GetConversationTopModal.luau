local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)
local name = require(script:FindFirstAncestor("Packages").Loggers).Logger:new(script.Name)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2, p3, p4)
	-- upvalues: name (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	if p2 and p4 then
		name:warning("Both conversation ID and friend ID provided to GetConversationTopModal.")
	end
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v2"):path("get-modal-sequence"):body({
		modal_sequence = "conversation_top_modal",
		is_in_experience = p3,
		conversation_id = p2,
		friend_id = p4
	})
end)