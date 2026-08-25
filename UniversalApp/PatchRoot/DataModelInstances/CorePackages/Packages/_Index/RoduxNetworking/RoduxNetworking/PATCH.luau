local makeRequestApiModule = require(script.Parent.makeRequestApi)

return function(p0)
	-- upvalues: makeRequestApiModule (ref)
	return makeRequestApiModule(p0, "PATCH")
end