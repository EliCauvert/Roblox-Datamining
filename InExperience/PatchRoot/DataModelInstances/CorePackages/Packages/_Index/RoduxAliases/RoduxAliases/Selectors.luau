local _ = require(script.Parent.RoduxAliasesTypes)

return function(p1)
	return { getAliasByUserId = require(script.getAliasByUserId)(p1) }
end