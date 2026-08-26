local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local packages = script:FindFirstAncestor("Packages")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(appChatNetworking.responses.SharedTypes)
local name = require(packages.Loggers).Logger:new(script.Name)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: name (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	if p6 and p7 then
		name:warn("Both conversation ID and friend ID provided to RecordModalSequenceResponse.")
	end
	return p1(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("record-modal-sequence-response"):body({
		action_type = p2,
		modal_sequence = p3,
		modal_id = p4,
		modal_variant = p5,
		conversation_id = p6,
		friend_id = p7
	})
end)