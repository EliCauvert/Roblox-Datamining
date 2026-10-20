local ToArrayContainsModule = require(script.Parent.toArrayContains)

return function(p1, p2)
	-- upvalues: ToArrayContainsModule (copy)
	return ToArrayContainsModule(p2, p1)
end