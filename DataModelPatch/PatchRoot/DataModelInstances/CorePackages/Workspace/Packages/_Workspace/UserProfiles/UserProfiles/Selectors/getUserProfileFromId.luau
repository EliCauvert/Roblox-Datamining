local CryoModule = require(script:FindFirstAncestor("UserProfiles").Parent.Cryo)

return function(p1, p2)
	-- upvalues: CryoModule (copy)
	return p1.userProfiles[CryoModule.List.findWhere(p1.userProfiles, function(p3, _): boolean
		-- upvalues: p2 (copy)
		return p3.id == tostring(p2)
	end)] or {}
end