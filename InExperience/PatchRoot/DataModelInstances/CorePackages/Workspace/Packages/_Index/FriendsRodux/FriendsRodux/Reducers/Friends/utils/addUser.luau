local llamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)

return function(p1, p2)
	-- upvalues: llamaModule (ref)
	return if p1 then if llamaModule.List.find(p1, p2) then p1 else llamaModule.List.join(p1, { p2 }) else { p2 }
end