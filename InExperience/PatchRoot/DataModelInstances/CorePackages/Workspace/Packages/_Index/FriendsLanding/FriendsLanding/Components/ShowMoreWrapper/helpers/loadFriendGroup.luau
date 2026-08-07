local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local t = dependenciesModule.t
local llama = dependenciesModule.llama
local friendsPerLoadGroupModule = require(script.Parent.friendsPerLoadGroup)
local var2 = t.interface({
	visibleRows = t.number,
	itemSize = t.number,
	filter = t.string
})
local var3 = t.interface({ width = t.number, filterFriendCounts = t.table })

return function(p0, p1) --[[ line: 19 ]]
	-- upvalues: var3 (ref), var2 (ref), friendsPerLoadGroupModule (ref), llama (ref)
	assert(var3(p0))
	assert(var2(p1))
	
	return {
		filterFriendCounts = llama.Dictionary.join(p0.filterFriendCounts, {
			[p1.filter] = p0.filterFriendCounts[p1.filter] + friendsPerLoadGroupModule(p0, p1)
		})
	}
end