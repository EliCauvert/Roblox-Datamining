local setLocalUserIdModule = require(script:FindFirstAncestor("UserLib").Actions.SetLocalUserId)

return function(p1, p2)
	-- upvalues: setLocalUserIdModule (ref)
	return if p2.type == setLocalUserIdModule.name then p2.userId else p1 or ""
end