local cryoModule = require(script:FindFirstAncestor("UserProfiles").Parent.Cryo)

return function(p0, p1)
	-- upvalues: cryoModule (ref)
	return p0.userProfiles[cryoModule.List.findWhere(p0.userProfiles, function(p2, _)
		-- upvalues: p1 (ref)
		return p2.id == tostring(p1)
	end)] or {}
end