local t = require(script:FindFirstAncestor("FriendsLanding").dependencies).t
local var1 = t.interface({
	width = t.number,
	itemSize = t.number,
	minimumItemsPerRow = t.optional(t.number)
})

return function(p1)
	-- upvalues: var1 (ref)
	assert(var1(p1))
	
	return math.max(math.floor(p1.width / p1.itemSize), p1.minimumItemsPerRow or 2)
end