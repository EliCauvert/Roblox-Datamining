local Rodux = require(script:FindFirstAncestor("PYMKCarousel").dependencies).Rodux

return function(p1, p2) --[[ Line: 6 ]]
	-- upvalues: Rodux (copy)
	return Rodux.Store.new(p2 or function(p3) --[[ Line: 7 ]]
		return p3
	end, p1 or {}, { Rodux.thunkMiddleware })
end