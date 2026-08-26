local _ = require(script:FindFirstAncestor("InExperienceOffers").Types)

return function(p1, p2)
	return if p1 == nil then nil else p1[p2]
end