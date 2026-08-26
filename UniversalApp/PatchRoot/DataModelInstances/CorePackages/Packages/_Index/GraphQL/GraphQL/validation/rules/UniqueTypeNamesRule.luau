local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueTypeNamesRule = function(p1)
		-- upvalues: graphQLError (ref)
		local t = {}
		local schema = p1:getSchema()
		
		local function checkTypeName(_, p2)
			-- upvalues: schema (ref), p1 (ref), graphQLError (copy), t (ref)
			local value = p2.name.value
			
			if schema and schema:getType(value) then
				p1:reportError(graphQLError.new(("Type \"%s\" already exists in the schema. It cannot also be defined in this type definition."):format(value), p2.name))
				
				return
			elseif t[value] then
				p1:reportError(graphQLError.new(("There can be only one type named \"%s\"."):format(value), { t[value], p2.name }))
			else
				t[value] = p2.name
			end
			return false
		end
		
		return {
			ScalarTypeDefinition = checkTypeName,
			ObjectTypeDefinition = checkTypeName,
			InterfaceTypeDefinition = checkTypeName,
			UnionTypeDefinition = checkTypeName,
			EnumTypeDefinition = checkTypeName,
			InputObjectTypeDefinition = checkTypeName
		}
	end
}