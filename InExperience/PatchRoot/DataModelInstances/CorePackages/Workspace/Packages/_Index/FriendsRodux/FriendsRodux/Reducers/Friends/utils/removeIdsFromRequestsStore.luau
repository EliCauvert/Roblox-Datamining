local llamaModule = require(script:FindFirstAncestor("FriendsRodux").Parent.llama)

return function(p1, p2)
	-- upvalues: llamaModule (ref)
	local t = {}
	
	for i, v in pairs(p2) do
		t[v] = llamaModule.None
	end
	return llamaModule.Dictionary.join(p1, t)
end