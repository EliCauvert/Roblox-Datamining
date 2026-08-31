local name = require(script:FindFirstAncestor("AppChat").Logger):new(script.Name)
local seedConversationTopModalSduiPayloadModule = require(script.Parent.seedConversationTopModalSduiPayload)

return function(p1, p2)
	-- upvalues: seedConversationTopModalSduiPayloadModule (ref), name (ref)
	return p1:andThen(function(p3)
		-- upvalues: seedConversationTopModalSduiPayloadModule (copy), p2 (ref), name (copy)
		local responseBody = p3 and p3.responseBody
		local ok, status = pcall(seedConversationTopModalSduiPayloadModule, responseBody and responseBody.sdui, p2)
		
		if not ok then
			name:warning(`Error seeding conversationTopModal SDUI payload: {tostring(status)}`)
		end
		return p3
	end)
end