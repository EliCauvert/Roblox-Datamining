local _ = require(script:FindFirstAncestor("FriendsChat").Parent.React)

return function(p1, p2)
	return if type(p2) == "number" then p1 + p2 * (1 - p1) elseif p2 == nil then p1 else p2:map(function(p3)
		-- upvalues: p1 (ref)
		return p1 + p3 * (1 - p1)
	end)
end