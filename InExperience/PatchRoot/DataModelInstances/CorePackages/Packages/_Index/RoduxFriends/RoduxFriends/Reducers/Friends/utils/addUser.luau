local llamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p0, p1) --[[ line: 5 ]]
	-- upvalues: llamaModule (ref)
	return if p0 then if llamaModule.List.find(p0, p1) then p0 else llamaModule.List.join(p0, { p1 }) else { p1 }
end