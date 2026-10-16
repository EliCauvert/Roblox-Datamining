local _ = require(script:FindFirstAncestor("FriendsChat").Parent.React)

return function(p1: number, p2) --[[ Line: 13 | Named "resolveFade" ]]
	return if type(p2) == "number" then p1 + p2 * (1 - p1) elseif p2 == nil then p1 else p2:map(function(p3): number --[[ Line: 17 ]]
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end)
end