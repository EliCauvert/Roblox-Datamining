local useLazyRefModule = require(script.Parent.useLazyRef)

return function(p0) --[[ line: 11 | named "useInitializedValue" ]]
	-- upvalues: useLazyRefModule (ref)
	return useLazyRefModule(p0).current
end