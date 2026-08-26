local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local t = dependenciesModule.t
local dictionary = dependenciesModule.llama.Dictionary
local friendsPerLoadGroupModule = require(script.Parent.friendsPerLoadGroup)
local var1 = t.interface({
	visibleRows = t.number,
	itemSize = t.number,
	filter = t.string
})
local var2 = t.interface({ filterFriendCounts = t.table })

return function(p1)
	-- upvalues: var1 (ref), var2 (ref), friendsPerLoadGroupModule (ref), dictionary (ref)
	return function(p2, p3)
		-- upvalues: var1 (copy), var2 (copy), friendsPerLoadGroupModule (copy), p1 (ref), dictionary (copy)
		assert(var1(p3))
		assert(var2(p2))
		local var3 = friendsPerLoadGroupModule({ width = p1 }, p3)
		
		return {
			width = p1,
			filterFriendCounts = dictionary.join(p2.filterFriendCounts, dictionary.map(p2.filterFriendCounts, function(p4)
				-- upvalues: var3 (ref)
				return math.max(var3, p4)
			end))
		}
	end
end