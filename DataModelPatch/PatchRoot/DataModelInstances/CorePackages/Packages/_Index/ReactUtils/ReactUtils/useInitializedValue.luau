local UseLazyRefModule = require(script.Parent.useLazyRef)

return function(p1)
	-- upvalues: UseLazyRefModule (copy)
	return UseLazyRefModule(p1).current
end