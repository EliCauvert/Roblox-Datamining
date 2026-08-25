local parent = script:FindFirstAncestor("GraphQLServer").Parent
local graphQLModule = require(parent.GraphQL)
local _ = require(parent.LuauPolyfill)

local function getFieldResolver(p0, p1)
	-- upvalues: graphQLModule (ref)
	return if p0 and p0.parentType and (p0.fieldName and type(p0.parentType.name) == "string") and (type(p1[p0.parentType.name]) == "table" and type(p1[p0.parentType.name][p0.fieldName]) == "function") then p1[p0.parentType.name][p0.fieldName] else graphQLModule.defaultFieldResolver
end

return function(p2)
	-- upvalues: getFieldResolver (ref)
	return function(p3, p4, p5, p6)
		-- upvalues: getFieldResolver (copy), p2 (ref)
		return getFieldResolver(p6, p2)(p3, p4, p5, p6)
	end
end