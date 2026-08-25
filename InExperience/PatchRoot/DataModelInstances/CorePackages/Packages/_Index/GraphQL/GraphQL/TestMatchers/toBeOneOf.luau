local toArrayContainsModule = require(script.Parent.toArrayContains)

return function(p0, p1)
	-- upvalues: toArrayContainsModule (ref)
	return toArrayContainsModule(p1, p0)
end