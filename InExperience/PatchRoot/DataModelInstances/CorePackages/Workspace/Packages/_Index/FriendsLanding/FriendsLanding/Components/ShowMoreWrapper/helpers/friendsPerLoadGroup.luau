local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Llama = DependenciesModule.llama
local T = DependenciesModule.t
local FriendsPerRowModule = require(script.Parent.friendsPerRow)
local InterfaceResult = T.interface({ width = T.number })
local InterfaceResult1 = T.interface({
	visibleRows = T.number,
	itemSize = T.number,
	minimumItemsPerRow = T.optional(T.number)
})

return function(p1, p2) --[[ Line: 17 ]]
	-- upvalues: InterfaceResult (copy), InterfaceResult1 (copy), FriendsPerRowModule (copy), Llama (copy)
	assert(InterfaceResult(p1))
	assert(InterfaceResult1(p2))
	
	return p2.visibleRows * FriendsPerRowModule(Llama.Dictionary.join({ width = p1.width }, p2))
end