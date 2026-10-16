local LlamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p1, p2) --[[ Line: 5 ]]
	-- upvalues: LlamaModule (copy)
	return LlamaModule.List.removeValue(p1 or {}, p2)
end