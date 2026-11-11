local T = require(script:FindFirstAncestor("FriendsLanding").dependencies).t
local InterfaceResult = T.interface({
	width = T.number,
	itemSize = T.number,
	minimumItemsPerRow = T.optional(T.number)
})

return function(p1): number
	-- upvalues: InterfaceResult (copy)
	assert(InterfaceResult(p1))
	
	return (math.max(math.floor(p1.width / p1.itemSize), p1.minimumItemsPerRow or 2))
end