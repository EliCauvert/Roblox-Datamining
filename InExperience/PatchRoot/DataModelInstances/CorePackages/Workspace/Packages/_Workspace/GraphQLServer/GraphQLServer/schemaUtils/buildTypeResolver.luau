local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local _ = require(Parent.GraphQL)
local _ = require(Parent.LuauPolyfill)

return function(p1) --[[ Line: 8 | Named "buildTypeResolver" ]]
	return function(p2, p3, p4, p5) --[[ Line: 9 ]]
		-- upvalues: p1 (copy)
		local v1 = p1[p5.name]
		
		return if type(v1) == "table" and type(v1.__resolveType) == "function" then v1.__resolveType(p2, p3, p4, p5) else p5.name
	end
end