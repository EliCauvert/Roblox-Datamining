local Rodux = require(script.Parent.Parent.dependencies).Rodux

return function(p1, p2)
	-- upvalues: Rodux (copy)
	return Rodux.Store.new(p2 or function(p3)
		return p3
	end, p1 or {}, { Rodux.thunkMiddleware })
end