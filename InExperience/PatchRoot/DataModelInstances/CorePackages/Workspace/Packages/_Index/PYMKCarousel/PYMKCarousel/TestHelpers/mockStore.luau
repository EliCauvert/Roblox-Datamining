local rodux = require(script:FindFirstAncestor("PYMKCarousel").dependencies).Rodux

return function(p1, p2)
	-- upvalues: rodux (ref)
	return rodux.Store.new(p2 or function(p3)
		return p3
	end, p1 or {}, { rodux.thunkMiddleware })
end