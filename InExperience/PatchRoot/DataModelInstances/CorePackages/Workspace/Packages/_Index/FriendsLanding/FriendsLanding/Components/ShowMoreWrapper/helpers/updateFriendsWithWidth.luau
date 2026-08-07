local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local t = dependenciesModule.t
local dictionary = dependenciesModule.llama.Dictionary
local friendsPerLoadGroupModule = require(script.Parent.friendsPerLoadGroup)
local var2 = t.interface({
	visibleRows = t.number,
	itemSize = t.number,
	filter = t.string
})
local var3 = t.interface({ filterFriendCounts = t.table })

return function(p0) --[[ line: 20 ]]
	-- upvalues: var2 (ref), var3 (ref), friendsPerLoadGroupModule (ref), dictionary (ref)
	return function(p1, p2) --[[ line: 21 ]]
		-- upvalues: var2 (copy), var3 (copy), friendsPerLoadGroupModule (copy), p0 (ref), dictionary (copy)
		assert(var2(p2))
		assert(var3(p1))
		local var4 = friendsPerLoadGroupModule({ width = p0 }, p2)
		
		return {
			width = p0,
			filterFriendCounts = dictionary.join(p1.filterFriendCounts, dictionary.map(p1.filterFriendCounts, function(p3) --[[ line: 31 ]]
				-- upvalues: var4 (ref)
				return math.max(var4, p3)
			end))
		}
	end
end