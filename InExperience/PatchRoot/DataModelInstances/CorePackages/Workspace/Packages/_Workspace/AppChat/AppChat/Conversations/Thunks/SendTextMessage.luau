local sendMessageUsingPolicyModule = require(script.Parent.SendMessageUsingPolicy)
local sendChatTextMessagePolicyModule = require(script.Parent.SendPolicies.SendChatTextMessagePolicy)

return function(p0, p1, p2, p3)
	-- upvalues: sendChatTextMessagePolicyModule (ref), sendMessageUsingPolicyModule (ref)
	return sendMessageUsingPolicyModule(sendChatTextMessagePolicyModule:new(p0, p1, p2, p3))
end