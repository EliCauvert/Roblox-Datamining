local MakeRequestApiModule = require(script.Parent.makeRequestApi)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: MakeRequestApiModule (copy)
	return MakeRequestApiModule(p1, "DELETE")
end