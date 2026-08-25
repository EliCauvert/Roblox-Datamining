local llamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p0, p1)
	-- upvalues: llamaModule (ref)
	return llamaModule.List.removeValue(p0 or {}, p1)
end