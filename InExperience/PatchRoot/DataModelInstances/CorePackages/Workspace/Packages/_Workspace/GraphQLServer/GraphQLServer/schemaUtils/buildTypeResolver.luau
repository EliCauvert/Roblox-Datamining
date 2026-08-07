local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.GraphQL)
local _ = require(parent.LuauPolyfill)

return function(p0) --[[ line: 8 | named "buildTypeResolver" ]]
	return function(p1, p2, p3, p4) --[[ line: 9 ]]
		-- upvalues: p0 (ref)
		local name = p0[p4.name]
		
		return if type(name) == "table" and type(name.__resolveType) == "function" then name.__resolveType(p1, p2, p3, p4) else p4.name
	end
end