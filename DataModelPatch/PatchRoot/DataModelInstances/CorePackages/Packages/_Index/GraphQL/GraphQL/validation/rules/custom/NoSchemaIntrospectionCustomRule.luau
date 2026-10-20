local Parent = script.Parent.Parent.Parent.Parent
local GraphQLError = require(Parent.error.GraphQLError).GraphQLError
local GetNamedTypeFunction = require(Parent.type.definition).getNamedType
local IsIntrospectionTypeFunction = require(Parent.type.introspection).isIntrospectionType

return {
	NoSchemaIntrospectionCustomRule = function(p1)
		-- upvalues: GetNamedTypeFunction (copy), IsIntrospectionTypeFunction (copy), GraphQLError (copy)
		return {
			Field = function(_, p2)
				-- upvalues: GetNamedTypeFunction (upval), p1 (copy), IsIntrospectionTypeFunction (upval), GraphQLError (upval)
				local NamedType = GetNamedTypeFunction(p1:getType())
				
				if NamedType and IsIntrospectionTypeFunction(NamedType) then
					p1:reportError(GraphQLError.new(("GraphQL introspection has been disabled, but the requested query contained the field \"%s\"."):format(p2.name.value), p2))
				end
			end
		}
	end
}