local CHAT_PLATFORM_BASE_URLModule = require(script:FindFirstAncestor("AppChatNetworking").url.CHAT_PLATFORM_BASE_URL)
local name = require(script:FindFirstAncestor("Packages").Loggers).Logger:new(script.Name)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1, p2, p3) --[[ line: 9 ]]
	-- upvalues: name (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	if p1 and p3 then
		name:warning("Both conversation ID and friend ID provided to GetConversationTopModal.")
	end
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v2"):path("get-modal-sequence"):body({
		modal_sequence = "conversation_top_modal",
		is_in_experience = p2,
		conversation_id = p1,
		friend_id = p3
	})
end)