local promiseModule = require(script:FindFirstAncestor("AppChat").Parent.Promise)
local t = {}
t.__index = t

function t.onBeforeSendingMessage(_, _) --[[ line: 9 ]] end

function t.sendMessage(_, _) --[[ line: 11 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.reject("Not implemented")
end

function t.onSuccess(_, _, p0) --[[ line: 15 ]]
	return p0
end

function t.onFailure(_, _, p1) --[[ line: 19 ]]
	return p1
end

return t