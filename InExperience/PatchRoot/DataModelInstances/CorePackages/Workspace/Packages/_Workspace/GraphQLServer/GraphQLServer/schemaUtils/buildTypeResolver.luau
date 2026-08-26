local parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(parent.GraphQL)
local _ = require(parent.LuauPolyfill)

return function(p1)
	return function(p2, p3, p4, p5)
		-- upvalues: p1 (ref)
		local name = p1[p5.name]
		
		return if type(name) == "table" and type(name.__resolveType) == "function" then name.__resolveType(p2, p3, p4, p5) else p5.name
	end
end