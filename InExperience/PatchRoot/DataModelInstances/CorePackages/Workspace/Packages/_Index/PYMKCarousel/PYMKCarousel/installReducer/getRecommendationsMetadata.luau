local getDeepValue = require(script:FindFirstAncestor("PYMKCarousel").dependencies).SocialLibraries.Dictionary.getDeepValue

return function(p1, p2)
	-- upvalues: getDeepValue (ref)
	return getDeepValue(p1, string.format("metadata.%s", p2)) or {}
end