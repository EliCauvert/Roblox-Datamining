local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local T = DependenciesModule.t
local Dictionary = DependenciesModule.llama.Dictionary
local FriendsPerLoadGroupModule = require(script.Parent.friendsPerLoadGroup)
local InterfaceResult = T.interface({
	visibleRows = T.number,
	itemSize = T.number,
	filter = T.string
})
local InterfaceResult1 = T.interface({ filterFriendCounts = T.table })

return function(Width)
	-- upvalues: InterfaceResult (copy), InterfaceResult1 (copy), FriendsPerLoadGroupModule (copy), Dictionary (copy)
	return function(p1, p2)
		-- upvalues: InterfaceResult (upval), InterfaceResult1 (upval), FriendsPerLoadGroupModule (upval), Width (copy), Dictionary (upval)
		assert(InterfaceResult(p2))
		assert(InterfaceResult1(p1))
		local FriendsPerLoadGroupModuleResult = FriendsPerLoadGroupModule({ width = Width }, p2)
		
		return {
			width = Width,
			filterFriendCounts = Dictionary.join(p1.filterFriendCounts, Dictionary.map(p1.filterFriendCounts, function(p3: number): number
				-- upvalues: FriendsPerLoadGroupModuleResult (copy)
				return (math.max(FriendsPerLoadGroupModuleResult, p3))
			end))
		}
	end
end