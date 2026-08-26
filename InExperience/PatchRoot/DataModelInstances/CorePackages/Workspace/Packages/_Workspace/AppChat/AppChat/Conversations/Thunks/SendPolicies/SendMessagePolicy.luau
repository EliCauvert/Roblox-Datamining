local promiseModule = require(script:FindFirstAncestor("AppChat").Parent.Promise)
local t = {}
t.__index = t

function t.onBeforeSendingMessage(_, _) end

function t.sendMessage(_, _)
	-- upvalues: promiseModule (ref)
	return promiseModule.reject("Not implemented")
end

function t.onSuccess(_, _, p1)
	return p1
end

function t.onFailure(_, _, p1)
	return p1
end

return t