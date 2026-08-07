local setLocalUserIdModule = require(script:FindFirstAncestor("UserLib").Actions.SetLocalUserId)

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: setLocalUserIdModule (ref)
	return if p1.type == setLocalUserIdModule.name then p1.userId else p0 or ""
end