local _ = require(script:FindFirstAncestor("FriendsChat").Parent.React)

return function(p0, p1) --[[ line: 13 | named "resolveFade" ]]
	return if type(p1) == "number" then p0 + p1 * (1 - p0) elseif p1 == nil then p0 else p1:map(function(p2) --[[ line: 17 ]]
		-- upvalues: p0 (ref)
		return p0 + p2 * (1 - p0)
	end)
end