local ToArrayContainsModule = require(script.Parent.toArrayContains)

return function(p1, p2) --[[ Line: 17 | Named "toBeOneOf" ]]
	-- upvalues: ToArrayContainsModule (copy)
	return ToArrayContainsModule(p2, p1)
end