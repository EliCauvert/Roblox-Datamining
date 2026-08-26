local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local llama = dependenciesModule.llama
local t = dependenciesModule.t

return function(p1, p2)
	-- upvalues: t (ref), llama (ref)
	assert(t.table(p2))
	assert(t.number(p1))
	
	return llama.List.filter(p2, function(_, p3)
		-- upvalues: p1 (ref)
		return p3 <= p1
	end)
end