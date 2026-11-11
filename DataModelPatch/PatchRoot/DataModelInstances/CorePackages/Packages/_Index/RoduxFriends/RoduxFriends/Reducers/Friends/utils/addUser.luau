local LlamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p1, p2)
	-- upvalues: LlamaModule (copy)
	return if p1 then if LlamaModule.List.find(p1, p2) then p1 else LlamaModule.List.join(p1, { p2 }) else { p2 }
end