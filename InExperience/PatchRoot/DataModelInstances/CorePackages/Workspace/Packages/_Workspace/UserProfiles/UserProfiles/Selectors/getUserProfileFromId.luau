local cryoModule = require(script:FindFirstAncestor("UserProfiles").Parent.Cryo)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	return p1.userProfiles[cryoModule.List.findWhere(p1.userProfiles, function(p3, _)
		-- upvalues: p2 (ref)
		return p3.id == tostring(p2)
	end)] or {}
end