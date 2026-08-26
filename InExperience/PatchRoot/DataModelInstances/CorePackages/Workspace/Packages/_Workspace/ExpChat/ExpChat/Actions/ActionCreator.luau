local cryoModule = require(script:FindFirstAncestor("ExpChat").Parent.Cryo)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	return function(...)
		-- upvalues: p1 (ref), p2 (ref), cryoModule (copy)
		return cryoModule.Dictionary.union(p2(...), { type = p1 })
	end
end