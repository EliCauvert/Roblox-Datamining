local llamaModule = require(script:FindFirstAncestor("RoduxFriends").Parent.llama)

return function(p0, p1)
	-- upvalues: llamaModule (ref)
	local t = {}
	
	for i, v in pairs(p1) do
		t[v] = llamaModule.None
	end
	return llamaModule.Dictionary.join(p0, t)
end