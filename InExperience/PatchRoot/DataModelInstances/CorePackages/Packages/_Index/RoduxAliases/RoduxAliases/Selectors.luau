local _ = require(script.Parent.RoduxAliasesTypes)

return function(p0)
	return { getAliasByUserId = require(script.getAliasByUserId)(p0) }
end