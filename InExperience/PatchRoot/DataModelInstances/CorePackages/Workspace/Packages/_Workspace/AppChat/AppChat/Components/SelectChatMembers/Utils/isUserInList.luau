local list = require(script:FindFirstAncestor("AppChat").Parent.Cryo).List

return function(p1, p2)
	-- upvalues: list (ref)
	return list.findWhere(p1, function(p3)
		-- upvalues: p2 (ref)
		return p3.id == p2
	end) ~= nil
end