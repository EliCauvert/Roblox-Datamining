local useLazyRefModule = require(script.Parent.useLazyRef)

return function(p0)
	-- upvalues: useLazyRefModule (ref)
	return useLazyRefModule(p0).current
end