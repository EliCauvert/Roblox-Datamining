local Result = require(script:FindFirstAncestor("PYMKCarousel").dependencies).Result

return function(p1)
	-- upvalues: Result (copy)
	return Result.success(p1)
end