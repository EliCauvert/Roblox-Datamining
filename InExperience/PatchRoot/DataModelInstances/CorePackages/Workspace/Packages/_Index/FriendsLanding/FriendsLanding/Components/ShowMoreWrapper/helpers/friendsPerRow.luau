local t = require(script:FindFirstAncestor("FriendsLanding").dependencies).t
local var0 = t.interface({
	width = t.number,
	itemSize = t.number,
	minimumItemsPerRow = t.optional(t.number)
})

return function(p0)
	-- upvalues: var0 (ref)
	assert(var0(p0))
	
	return math.max(math.floor(p0.width / p0.itemSize), p0.minimumItemsPerRow or 2)
end