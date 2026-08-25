local cryoModule = require(script:FindFirstAncestor("ExpChat").Parent.Cryo)

return function(p0, p1)
	-- upvalues: cryoModule (ref)
	return function(...)
		-- upvalues: p0 (ref), p1 (ref), cryoModule (copy)
		return cryoModule.Dictionary.union(p1(...), { type = p0 })
	end
end