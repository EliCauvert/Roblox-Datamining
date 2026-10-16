local UseLazyRefModule = require(script.Parent.useLazyRef)

return function(p1) --[[ Line: 11 | Named "useInitializedValue" ]]
	-- upvalues: UseLazyRefModule (copy)
	return UseLazyRefModule(p1).current
end