local toArrayContainsModule = require(script.Parent.toArrayContains)

return function(p0, p1) --[[ line: 17 | named "toBeOneOf" ]]
	-- upvalues: toArrayContainsModule (ref)
	return toArrayContainsModule(p1, p0)
end