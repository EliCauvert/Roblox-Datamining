local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local packages = script:FindFirstAncestor("Packages")
local CHAT_PLATFORM_BASE_URLModule = require(appChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local _ = require(appChatNetworking.responses.SharedTypes)
local name = require(packages.Loggers).Logger:new(script.Name)

return require(script.Parent.RoduxNetworking).POST(script.Name, function(p0, p1, p2, p3, p4, p5, p6)
	-- upvalues: name (ref), CHAT_PLATFORM_BASE_URLModule (ref)
	if p5 and p6 then
		name:warn("Both conversation ID and friend ID provided to RecordModalSequenceResponse.")
	end
	return p0(CHAT_PLATFORM_BASE_URLModule):path("v1"):path("record-modal-sequence-response"):body({
		action_type = p1,
		modal_sequence = p2,
		modal_id = p3,
		modal_variant = p4,
		conversation_id = p5,
		friend_id = p6
	})
end)