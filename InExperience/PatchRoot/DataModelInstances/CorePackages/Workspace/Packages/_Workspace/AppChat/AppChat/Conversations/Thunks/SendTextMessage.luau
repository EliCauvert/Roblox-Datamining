local sendMessageUsingPolicyModule = require(script.Parent.SendMessageUsingPolicy)
local sendChatTextMessagePolicyModule = require(script.Parent.SendPolicies.SendChatTextMessagePolicy)

return function(p1, p2, p3, p4)
	-- upvalues: sendChatTextMessagePolicyModule (ref), sendMessageUsingPolicyModule (ref)
	return sendMessageUsingPolicyModule(sendChatTextMessagePolicyModule:new(p1, p2, p3, p4))
end