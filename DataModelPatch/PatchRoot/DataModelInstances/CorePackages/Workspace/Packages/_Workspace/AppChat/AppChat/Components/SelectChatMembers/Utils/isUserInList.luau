local List = require(script:FindFirstAncestor("AppChat").Parent.Cryo).List

return function(p1, Id): boolean
	-- upvalues: List (copy)
	return List.findWhere(p1, function(p2): boolean
		-- upvalues: Id (copy)
		return p2.id == Id
	end) ~= nil
end