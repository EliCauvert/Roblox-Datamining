local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local T = DependenciesModule.t
local Llama = DependenciesModule.llama
local FriendsPerLoadGroupModule = require(script.Parent.friendsPerLoadGroup)
local InterfaceResult = T.interface({
	visibleRows = T.number,
	itemSize = T.number,
	filter = T.string
})
local InterfaceResult1 = T.interface({ width = T.number, filterFriendCounts = T.table })

return function(p1, p2)
	-- upvalues: InterfaceResult1 (copy), InterfaceResult (copy), FriendsPerLoadGroupModule (copy), Llama (copy)
	assert(InterfaceResult1(p1))
	assert(InterfaceResult(p2))
	
	return {
		filterFriendCounts = Llama.Dictionary.join(p1.filterFriendCounts, {
			[p2.filter] = p1.filterFriendCounts[p2.filter] + FriendsPerLoadGroupModule(p1, p2)
		})
	}
end