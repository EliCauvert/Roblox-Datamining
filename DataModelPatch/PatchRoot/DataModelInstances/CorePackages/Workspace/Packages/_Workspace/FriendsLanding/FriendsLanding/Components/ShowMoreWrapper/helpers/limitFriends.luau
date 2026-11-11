local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Llama = DependenciesModule.llama
local T = DependenciesModule.t

return function(p1, p2)
	-- upvalues: T (copy), Llama (copy)
	assert(T.table(p2))
	assert(T.number(p1))
	
	return Llama.List.filter(p2, function(_, p3): boolean
		-- upvalues: p1 (copy)
		return p3 <= p1
	end)
end