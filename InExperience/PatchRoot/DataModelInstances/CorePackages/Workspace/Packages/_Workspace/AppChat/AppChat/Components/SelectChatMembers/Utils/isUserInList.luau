local list = require(script:FindFirstAncestor("AppChat").Parent.Cryo).List

return function(p0, p1)
	-- upvalues: list (ref)
	return list.findWhere(p0, function(p2)
		-- upvalues: p1 (ref)
		return p2.id == p1
	end) ~= nil
end