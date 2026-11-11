local PromiseModule = require(script:FindFirstAncestor("AppChat").Parent.Promise)
local SendMessagePolicyModule = {}
SendMessagePolicyModule.__index = SendMessagePolicyModule

function SendMessagePolicyModule:onBeforeSendingMessage(_) end

function SendMessagePolicyModule:sendMessage(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.reject("Not implemented")
end

function SendMessagePolicyModule:onSuccess(_, p1)
	return p1
end

function SendMessagePolicyModule:onFailure(_, p1)
	return p1
end

return SendMessagePolicyModule