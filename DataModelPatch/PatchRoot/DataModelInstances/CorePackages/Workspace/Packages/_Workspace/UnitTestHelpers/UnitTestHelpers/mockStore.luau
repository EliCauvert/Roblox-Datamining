local RoduxModule = require(script.Parent.Parent.Rodux)

return function(p1, p2)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.Store.new(p2 or function(p3)
		return p3
	end, p1 or {}, { RoduxModule.thunkMiddleware })
end