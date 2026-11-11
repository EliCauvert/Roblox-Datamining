local SendGameLinkMessagePolicyModule = require(script.Parent.SendPolicies.SendGameLinkMessagePolicy)
local SendMessageUsingPolicyModule = require(game:GetService("CorePackages").Workspace.Packages.AppChat.SendMessageUsingPolicy)

return function(p1, p2, p3, p4, p5)
	-- upvalues: SendGameLinkMessagePolicyModule (copy), SendMessageUsingPolicyModule (copy)
	return SendMessageUsingPolicyModule((SendGameLinkMessagePolicyModule:new(p1, p2, nil, p3 or false, p4 or 0, p5 or 0)))
end