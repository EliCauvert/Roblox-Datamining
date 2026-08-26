local parent = script:FindFirstAncestor("GraphQLServer").Parent
local graphQLModule = require(parent.GraphQL)
local _ = require(parent.LuauPolyfill)

local function getFieldResolver(p1, p2)
	-- upvalues: graphQLModule (ref)
	return if p1 and p1.parentType and (p1.fieldName and type(p1.parentType.name) == "string") and (type(p2[p1.parentType.name]) == "table" and type(p2[p1.parentType.name][p1.fieldName]) == "function") then p2[p1.parentType.name][p1.fieldName] else graphQLModule.defaultFieldResolver
end

return function(p1)
	-- upvalues: getFieldResolver (ref)
	return function(p2, p3, p4, p5)
		-- upvalues: getFieldResolver (copy), p1 (ref)
		return getFieldResolver(p5, p1)(p2, p3, p4, p5)
	end
end