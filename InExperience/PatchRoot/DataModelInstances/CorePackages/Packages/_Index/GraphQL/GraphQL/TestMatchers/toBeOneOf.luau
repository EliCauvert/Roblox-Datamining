local toArrayContainsModule = require(script.Parent.toArrayContains)

return function(p1, p2)
	-- upvalues: toArrayContainsModule (ref)
	return toArrayContainsModule(p2, p1)
end