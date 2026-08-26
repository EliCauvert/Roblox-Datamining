local useLazyRefModule = require(script.Parent.useLazyRef)

return function(p1)
	-- upvalues: useLazyRefModule (ref)
	return useLazyRefModule(p1).current
end