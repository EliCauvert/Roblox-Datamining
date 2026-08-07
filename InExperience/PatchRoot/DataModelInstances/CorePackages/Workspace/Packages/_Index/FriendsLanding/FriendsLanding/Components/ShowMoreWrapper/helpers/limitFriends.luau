local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local llama = dependenciesModule.llama
local t = dependenciesModule.t

return function(p0, p1) --[[ line: 6 ]]
	-- upvalues: t (ref), llama (ref)
	assert(t.table(p1))
	assert(t.number(p0))
	
	return llama.List.filter(p1, function(_, p2) --[[ line: 10 ]]
		-- upvalues: p0 (ref)
		return p2 <= p0
	end)
end