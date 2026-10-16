local SetLocalUserIdModule = require(script:FindFirstAncestor("UserLib").Actions.SetLocalUserId)

return function(p1, p2) --[[ Line: 5 ]]
	-- upvalues: SetLocalUserIdModule (copy)
	return if p2.type == SetLocalUserIdModule.name then p2.userId else p1 or ""
end