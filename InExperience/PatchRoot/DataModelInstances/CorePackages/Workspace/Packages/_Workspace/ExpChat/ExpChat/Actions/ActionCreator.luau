local CryoModule = require(script:FindFirstAncestor("ExpChat").Parent.Cryo)

return function(p1, Callback)
	-- upvalues: CryoModule (copy)
	return function(...)
		-- upvalues: p1 (copy), Callback (copy), CryoModule (upval)
		return (CryoModule.Dictionary.union(Callback(...), { type = p1 }))
	end
end