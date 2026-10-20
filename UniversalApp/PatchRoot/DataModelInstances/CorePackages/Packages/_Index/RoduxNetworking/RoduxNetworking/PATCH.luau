local MakeRequestApiModule = require(script.Parent.makeRequestApi)

return function(p1)
	-- upvalues: MakeRequestApiModule (copy)
	return MakeRequestApiModule(p1, "PATCH")
end