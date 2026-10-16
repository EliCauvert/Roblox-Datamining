local _ = require(script.Parent.RoduxAliasesTypes)

return function(p1) --[[ Line: 6 ]]
	return { getAliasByUserId = require(script.getAliasByUserId)(p1) }
end