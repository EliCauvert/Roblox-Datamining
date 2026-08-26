local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local t = dependenciesModule.t
local llama = dependenciesModule.llama
local friendsPerLoadGroupModule = require(script.Parent.friendsPerLoadGroup)
local var1 = t.interface({
	visibleRows = t.number,
	itemSize = t.number,
	filter = t.string
})
local var2 = t.interface({ width = t.number, filterFriendCounts = t.table })

return function(p1, p2)
	-- upvalues: var2 (ref), var1 (ref), friendsPerLoadGroupModule (ref), llama (ref)
	assert(var2(p1))
	assert(var1(p2))
	
	return {
		filterFriendCounts = llama.Dictionary.join(p1.filterFriendCounts, {
			[p2.filter] = p1.filterFriendCounts[p2.filter] + friendsPerLoadGroupModule(p1, p2)
		})
	}
end