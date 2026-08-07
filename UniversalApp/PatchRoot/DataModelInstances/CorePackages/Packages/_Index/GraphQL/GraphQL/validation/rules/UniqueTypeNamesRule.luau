local graphQLError = require(script.Parent.Parent.Parent.error.GraphQLError).GraphQLError

return {
	UniqueTypeNamesRule = function(p0) --[[ line: 19 ]]
		-- upvalues: graphQLError (ref)
		local t = {}
		local schema = p0:getSchema()
		
		local function checkTypeName(_, p1) --[[ line: 25 ]]
			-- upvalues: schema (ref), p0 (ref), graphQLError (copy), t (ref)
			local value = p1.name.value
			
			if schema and schema:getType(value) then
				p0:reportError(graphQLError.new(("Type \"%s\" already exists in the schema. It cannot also be defined in this type definition."):format(value), p1.name))
				
				return
			elseif t[value] then
				p0:reportError(graphQLError.new(("There can be only one type named \"%s\"."):format(value), { t[value], p1.name }))
			else
				t[value] = p1.name
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