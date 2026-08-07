local list = require(script:FindFirstAncestor("AppChat").Parent.Cryo).List

return function(p0, p1) --[[ line: 5 | named "isUserInList" ]]
	-- upvalues: list (ref)
	return list.findWhere(p0, function(p2) --[[ line: 6 ]]
		-- upvalues: p1 (ref)
		return p2.id == p1
	end) ~= nil
end