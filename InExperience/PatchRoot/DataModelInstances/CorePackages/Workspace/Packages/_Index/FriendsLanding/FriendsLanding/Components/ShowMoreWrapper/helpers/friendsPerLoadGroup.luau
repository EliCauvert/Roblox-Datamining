local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local llama = dependenciesModule.llama
local t = dependenciesModule.t
local friendsPerRowModule = require(script.Parent.friendsPerRow)
local var2 = t.interface({ width = t.number })
local var3 = t.interface({
	visibleRows = t.number,
	itemSize = t.number,
	minimumItemsPerRow = t.optional(t.number)
})

return function(p0, p1)
	-- upvalues: var2 (ref), var3 (ref), friendsPerRowModule (ref), llama (ref)
	assert(var2(p0))
	assert(var3(p1))
	
	return p1.visibleRows * friendsPerRowModule(llama.Dictionary.join({ width = p0.width }, p1))
end