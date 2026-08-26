local makeRequestApiModule = require(script.Parent.makeRequestApi)

return function(p1)
	-- upvalues: makeRequestApiModule (ref)
	return makeRequestApiModule(p1, "PATCH")
end