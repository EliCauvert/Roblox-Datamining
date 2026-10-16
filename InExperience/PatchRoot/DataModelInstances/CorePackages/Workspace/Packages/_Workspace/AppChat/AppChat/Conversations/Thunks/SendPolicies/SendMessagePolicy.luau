local PromiseModule = require(script:FindFirstAncestor("AppChat").Parent.Promise)
local SendMessagePolicyModule = {}
SendMessagePolicyModule.__index = SendMessagePolicyModule

function SendMessagePolicyModule:onBeforeSendingMessage(_) --[[ Line: 9 ]] end

function SendMessagePolicyModule:sendMessage(_) --[[ Line: 11 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.reject("Not implemented")
end

function SendMessagePolicyModule:onSuccess(_, p1) --[[ Line: 15 ]]
	return p1
end

function SendMessagePolicyModule:onFailure(_, p1) --[[ Line: 19 ]]
	return p1
end

return SendMessagePolicyModule