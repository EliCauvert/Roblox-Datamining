local SendMessageUsingPolicyModule = require(script.Parent.SendMessageUsingPolicy)
local SendChatTextMessagePolicyModule = require(script.Parent.SendPolicies.SendChatTextMessagePolicy)

return function(p1, p2, p3, p4)
	-- upvalues: SendChatTextMessagePolicyModule (copy), SendMessageUsingPolicyModule (copy)
	return SendMessageUsingPolicyModule((SendChatTextMessagePolicyModule:new(p1, p2, p3, p4)))
end