local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local GraphQLModule = require(Parent.GraphQL)
local _ = require(Parent.LuauPolyfill)

local function getFieldResolver(p1, p2) --[[ Line: 7 ]]
	-- upvalues: GraphQLModule (copy)
	return if p1 and p1.parentType and p1.fieldName and type(p1.parentType.name) == "string" and type(p2[p1.parentType.name]) == "table" and type(p2[p1.parentType.name][p1.fieldName]) == "function" then p2[p1.parentType.name][p1.fieldName] else GraphQLModule.defaultFieldResolver
end

return function(p1) --[[ Line: 22 | Named "buildFieldResolver" ]]
	-- upvalues: getFieldResolver (copy)
	return function(p2, p3, p4, p5) --[[ Line: 23 ]]
		-- upvalues: getFieldResolver (upval), p1 (copy)
		return getFieldResolver(p5, p1)(p2, p3, p4, p5)
	end
end