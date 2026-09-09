local result = require(script:FindFirstAncestor("PYMKCarousel").dependencies).Result

return function(p1)
	-- upvalues: result (ref)
	return result.success(p1)
end