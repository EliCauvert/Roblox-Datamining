local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local llama = dependenciesModule.llama
local t = dependenciesModule.t
local friendsPerRowModule = require(script.Parent.friendsPerRow)
local var1 = t.interface({ width = t.number })
local var2 = t.interface({
	visibleRows = t.number,
	itemSize = t.number,
	minimumItemsPerRow = t.optional(t.number)
})

return function(p1, p2)
	-- upvalues: var1 (ref), var2 (ref), friendsPerRowModule (ref), llama (ref)
	assert(var1(p1))
	assert(var2(p2))
	
	return p2.visibleRows * friendsPerRowModule(llama.Dictionary.join({ width = p1.width }, p2))
end