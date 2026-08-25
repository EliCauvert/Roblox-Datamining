local parent = script.Parent.Parent.Parent.Parent
local graphQLError = require(parent.error.GraphQLError).GraphQLError
local getNamedType = require(parent.type.definition).getNamedType
local isIntrospectionType = require(parent.type.introspection).isIntrospectionType

return {
	NoSchemaIntrospectionCustomRule = function(p0)
		-- upvalues: getNamedType (ref), isIntrospectionType (ref), graphQLError (ref)
		return {
			Field = function(_, p1)
				-- upvalues: getNamedType (copy), p0 (ref), isIntrospectionType (copy), graphQLError (copy)
				local var0 = getNamedType(p0:getType())
				
				if var0 and isIntrospectionType(var0) then
					p0:reportError(graphQLError.new(("GraphQL introspection has been disabled, but the requested query contained the field \"%s\"."):format(p1.name.value), p1))
				end
			end
		}
	end
}