local parent = script.Parent.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local getNamedType = require(parent.type.definition).getNamedType
local isIntrospectionType = require(parent.type.introspection).isIntrospectionType

return {
	NoSchemaIntrospectionCustomRule = function(p1)
		-- upvalues: getNamedType (ref), isIntrospectionType (ref), graphQLError (ref)
		return {
			Field = function(_, p2)
				-- upvalues: getNamedType (copy), p1 (ref), isIntrospectionType (copy), graphQLError (copy)
				local var1 = getNamedType(p1:getType())
				
				if var1 and isIntrospectionType(var1) then
					p1:reportError(graphQLError.new(("GraphQL introspection has been disabled, but the requested query contained the field \"%s\"."):format(p2.name.value), p2))
				end
			end
		}
	end
}