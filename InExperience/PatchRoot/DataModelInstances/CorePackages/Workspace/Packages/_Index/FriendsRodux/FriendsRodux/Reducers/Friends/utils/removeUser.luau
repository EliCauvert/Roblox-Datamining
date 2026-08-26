local llamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)

return function(p1, p2)
	-- upvalues: llamaModule (ref)
	return llamaModule.List.removeValue(p1 or {}, p2)
end